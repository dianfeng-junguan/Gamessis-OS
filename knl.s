
bin/gmsknl.elf:     file format elf32-i386


Disassembly of section .text:

01000000 <init_int>:
 1000000:	55                   	push   ebp
 1000001:	89 e5                	mov    ebp,esp
 1000003:	83 ec 18             	sub    esp,0x18
 1000006:	b8 0b 03 00 01       	mov    eax,0x100030b
 100000b:	68 00 8e 00 00       	push   0x8e00
 1000010:	6a 08                	push   0x8
 1000012:	50                   	push   eax
 1000013:	6a 00                	push   0x0
 1000015:	e8 76 02 00 00       	call   1000290 <set_gate>
 100001a:	83 c4 10             	add    esp,0x10
 100001d:	b8 1d 03 00 01       	mov    eax,0x100031d
 1000022:	68 00 8e 00 00       	push   0x8e00
 1000027:	6a 08                	push   0x8
 1000029:	50                   	push   eax
 100002a:	6a 01                	push   0x1
 100002c:	e8 5f 02 00 00       	call   1000290 <set_gate>
 1000031:	83 c4 10             	add    esp,0x10
 1000034:	b8 2f 03 00 01       	mov    eax,0x100032f
 1000039:	68 00 8e 00 00       	push   0x8e00
 100003e:	6a 08                	push   0x8
 1000040:	50                   	push   eax
 1000041:	6a 02                	push   0x2
 1000043:	e8 48 02 00 00       	call   1000290 <set_gate>
 1000048:	83 c4 10             	add    esp,0x10
 100004b:	b8 41 03 00 01       	mov    eax,0x1000341
 1000050:	68 00 8e 00 00       	push   0x8e00
 1000055:	6a 08                	push   0x8
 1000057:	50                   	push   eax
 1000058:	6a 03                	push   0x3
 100005a:	e8 31 02 00 00       	call   1000290 <set_gate>
 100005f:	83 c4 10             	add    esp,0x10
 1000062:	b8 53 03 00 01       	mov    eax,0x1000353
 1000067:	68 00 8e 00 00       	push   0x8e00
 100006c:	6a 08                	push   0x8
 100006e:	50                   	push   eax
 100006f:	6a 04                	push   0x4
 1000071:	e8 1a 02 00 00       	call   1000290 <set_gate>
 1000076:	83 c4 10             	add    esp,0x10
 1000079:	b8 65 03 00 01       	mov    eax,0x1000365
 100007e:	68 00 8e 00 00       	push   0x8e00
 1000083:	6a 08                	push   0x8
 1000085:	50                   	push   eax
 1000086:	6a 05                	push   0x5
 1000088:	e8 03 02 00 00       	call   1000290 <set_gate>
 100008d:	83 c4 10             	add    esp,0x10
 1000090:	b8 77 03 00 01       	mov    eax,0x1000377
 1000095:	68 00 8e 00 00       	push   0x8e00
 100009a:	6a 08                	push   0x8
 100009c:	50                   	push   eax
 100009d:	6a 06                	push   0x6
 100009f:	e8 ec 01 00 00       	call   1000290 <set_gate>
 10000a4:	83 c4 10             	add    esp,0x10
 10000a7:	b8 8e 03 00 01       	mov    eax,0x100038e
 10000ac:	68 00 8e 00 00       	push   0x8e00
 10000b1:	6a 08                	push   0x8
 10000b3:	50                   	push   eax
 10000b4:	6a 07                	push   0x7
 10000b6:	e8 d5 01 00 00       	call   1000290 <set_gate>
 10000bb:	83 c4 10             	add    esp,0x10
 10000be:	b8 a0 03 00 01       	mov    eax,0x10003a0
 10000c3:	68 00 8e 00 00       	push   0x8e00
 10000c8:	6a 08                	push   0x8
 10000ca:	50                   	push   eax
 10000cb:	6a 08                	push   0x8
 10000cd:	e8 be 01 00 00       	call   1000290 <set_gate>
 10000d2:	83 c4 10             	add    esp,0x10
 10000d5:	b8 b2 03 00 01       	mov    eax,0x10003b2
 10000da:	68 00 8e 00 00       	push   0x8e00
 10000df:	6a 08                	push   0x8
 10000e1:	50                   	push   eax
 10000e2:	6a 09                	push   0x9
 10000e4:	e8 a7 01 00 00       	call   1000290 <set_gate>
 10000e9:	83 c4 10             	add    esp,0x10
 10000ec:	b8 c2 03 00 01       	mov    eax,0x10003c2
 10000f1:	68 00 8e 00 00       	push   0x8e00
 10000f6:	6a 08                	push   0x8
 10000f8:	50                   	push   eax
 10000f9:	6a 0a                	push   0xa
 10000fb:	e8 90 01 00 00       	call   1000290 <set_gate>
 1000100:	83 c4 10             	add    esp,0x10
 1000103:	b8 d4 03 00 01       	mov    eax,0x10003d4
 1000108:	68 00 8e 00 00       	push   0x8e00
 100010d:	6a 08                	push   0x8
 100010f:	50                   	push   eax
 1000110:	6a 0b                	push   0xb
 1000112:	e8 79 01 00 00       	call   1000290 <set_gate>
 1000117:	83 c4 10             	add    esp,0x10
 100011a:	b8 e6 03 00 01       	mov    eax,0x10003e6
 100011f:	68 00 8e 00 00       	push   0x8e00
 1000124:	6a 08                	push   0x8
 1000126:	50                   	push   eax
 1000127:	6a 0c                	push   0xc
 1000129:	e8 62 01 00 00       	call   1000290 <set_gate>
 100012e:	83 c4 10             	add    esp,0x10
 1000131:	b8 f8 03 00 01       	mov    eax,0x10003f8
 1000136:	68 00 8e 00 00       	push   0x8e00
 100013b:	6a 08                	push   0x8
 100013d:	50                   	push   eax
 100013e:	6a 0d                	push   0xd
 1000140:	e8 4b 01 00 00       	call   1000290 <set_gate>
 1000145:	83 c4 10             	add    esp,0x10
 1000148:	b8 f1 0f 00 01       	mov    eax,0x1000ff1
 100014d:	68 00 8e 00 00       	push   0x8e00
 1000152:	6a 08                	push   0x8
 1000154:	50                   	push   eax
 1000155:	6a 0e                	push   0xe
 1000157:	e8 34 01 00 00       	call   1000290 <set_gate>
 100015c:	83 c4 10             	add    esp,0x10
 100015f:	b8 2f 03 00 01       	mov    eax,0x100032f
 1000164:	68 00 8e 00 00       	push   0x8e00
 1000169:	6a 08                	push   0x8
 100016b:	50                   	push   eax
 100016c:	6a 0f                	push   0xf
 100016e:	e8 1d 01 00 00       	call   1000290 <set_gate>
 1000173:	83 c4 10             	add    esp,0x10
 1000176:	b8 12 04 00 01       	mov    eax,0x1000412
 100017b:	68 00 8e 00 00       	push   0x8e00
 1000180:	6a 08                	push   0x8
 1000182:	50                   	push   eax
 1000183:	6a 10                	push   0x10
 1000185:	e8 06 01 00 00       	call   1000290 <set_gate>
 100018a:	83 c4 10             	add    esp,0x10
 100018d:	c7 45 f4 11 00 00 00 	mov    DWORD PTR [ebp-0xc],0x11
 1000194:	eb 20                	jmp    10001b6 <init_int+0x1b6>
 1000196:	ba 2f 03 00 01       	mov    edx,0x100032f
 100019b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100019e:	0f b6 c0             	movzx  eax,al
 10001a1:	68 00 8e 00 00       	push   0x8e00
 10001a6:	6a 08                	push   0x8
 10001a8:	52                   	push   edx
 10001a9:	50                   	push   eax
 10001aa:	e8 e1 00 00 00       	call   1000290 <set_gate>
 10001af:	83 c4 10             	add    esp,0x10
 10001b2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10001b6:	83 7d f4 2f          	cmp    DWORD PTR [ebp-0xc],0x2f
 10001ba:	7e da                	jle    1000196 <init_int+0x196>
 10001bc:	b8 bf 40 00 01       	mov    eax,0x10040bf
 10001c1:	68 00 8f 00 00       	push   0x8f00
 10001c6:	6a 08                	push   0x8
 10001c8:	50                   	push   eax
 10001c9:	6a 21                	push   0x21
 10001cb:	e8 c0 00 00 00       	call   1000290 <set_gate>
 10001d0:	83 c4 10             	add    esp,0x10
 10001d3:	b8 10 35 00 01       	mov    eax,0x1003510
 10001d8:	68 00 8e 00 00       	push   0x8e00
 10001dd:	6a 08                	push   0x8
 10001df:	50                   	push   eax
 10001e0:	6a 20                	push   0x20
 10001e2:	e8 a9 00 00 00       	call   1000290 <set_gate>
 10001e7:	83 c4 10             	add    esp,0x10
 10001ea:	b8 80 3f 00 01       	mov    eax,0x1003f80
 10001ef:	68 00 8f 00 00       	push   0x8f00
 10001f4:	6a 08                	push   0x8
 10001f6:	50                   	push   eax
 10001f7:	68 80 00 00 00       	push   0x80
 10001fc:	e8 8f 00 00 00       	call   1000290 <set_gate>
 1000201:	83 c4 10             	add    esp,0x10
 1000204:	83 ec 08             	sub    esp,0x8
 1000207:	6a 11                	push   0x11
 1000209:	6a 20                	push   0x20
 100020b:	e8 b0 30 00 00       	call   10032c0 <outb>
 1000210:	83 c4 10             	add    esp,0x10
 1000213:	83 ec 08             	sub    esp,0x8
 1000216:	6a 11                	push   0x11
 1000218:	68 a0 00 00 00       	push   0xa0
 100021d:	e8 9e 30 00 00       	call   10032c0 <outb>
 1000222:	83 c4 10             	add    esp,0x10
 1000225:	83 ec 08             	sub    esp,0x8
 1000228:	6a 20                	push   0x20
 100022a:	6a 21                	push   0x21
 100022c:	e8 8f 30 00 00       	call   10032c0 <outb>
 1000231:	83 c4 10             	add    esp,0x10
 1000234:	83 ec 08             	sub    esp,0x8
 1000237:	6a 28                	push   0x28
 1000239:	68 a1 00 00 00       	push   0xa1
 100023e:	e8 7d 30 00 00       	call   10032c0 <outb>
 1000243:	83 c4 10             	add    esp,0x10
 1000246:	83 ec 08             	sub    esp,0x8
 1000249:	6a 04                	push   0x4
 100024b:	6a 21                	push   0x21
 100024d:	e8 6e 30 00 00       	call   10032c0 <outb>
 1000252:	83 c4 10             	add    esp,0x10
 1000255:	83 ec 08             	sub    esp,0x8
 1000258:	6a 02                	push   0x2
 100025a:	68 a1 00 00 00       	push   0xa1
 100025f:	e8 5c 30 00 00       	call   10032c0 <outb>
 1000264:	83 c4 10             	add    esp,0x10
 1000267:	83 ec 08             	sub    esp,0x8
 100026a:	6a 01                	push   0x1
 100026c:	6a 21                	push   0x21
 100026e:	e8 4d 30 00 00       	call   10032c0 <outb>
 1000273:	83 c4 10             	add    esp,0x10
 1000276:	83 ec 08             	sub    esp,0x8
 1000279:	6a 01                	push   0x1
 100027b:	68 a1 00 00 00       	push   0xa1
 1000280:	e8 3b 30 00 00       	call   10032c0 <outb>
 1000285:	83 c4 10             	add    esp,0x10
 1000288:	e8 78 30 00 00       	call   1003305 <turn_on_int>
 100028d:	90                   	nop
 100028e:	c9                   	leave  
 100028f:	c3                   	ret    

01000290 <set_gate>:
 1000290:	55                   	push   ebp
 1000291:	89 e5                	mov    ebp,esp
 1000293:	83 ec 0c             	sub    esp,0xc
 1000296:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
 1000299:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 100029c:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100029f:	88 4d fc             	mov    BYTE PTR [ebp-0x4],cl
 10002a2:	66 89 55 f8          	mov    WORD PTR [ebp-0x8],dx
 10002a6:	66 89 45 f4          	mov    WORD PTR [ebp-0xc],ax
 10002aa:	8b 15 00 00 40 00    	mov    edx,DWORD PTR ds:0x400000
 10002b0:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 10002b4:	c1 e0 03             	shl    eax,0x3
 10002b7:	01 d0                	add    eax,edx
 10002b9:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 10002bc:	66 89 10             	mov    WORD PTR [eax],dx
 10002bf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10002c2:	c1 e8 10             	shr    eax,0x10
 10002c5:	89 c2                	mov    edx,eax
 10002c7:	8b 0d 00 00 40 00    	mov    ecx,DWORD PTR ds:0x400000
 10002cd:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 10002d1:	c1 e0 03             	shl    eax,0x3
 10002d4:	01 c8                	add    eax,ecx
 10002d6:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
 10002da:	8b 15 00 00 40 00    	mov    edx,DWORD PTR ds:0x400000
 10002e0:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 10002e4:	c1 e0 03             	shl    eax,0x3
 10002e7:	01 c2                	add    edx,eax
 10002e9:	0f b7 45 f4          	movzx  eax,WORD PTR [ebp-0xc]
 10002ed:	66 89 42 04          	mov    WORD PTR [edx+0x4],ax
 10002f1:	8b 15 00 00 40 00    	mov    edx,DWORD PTR ds:0x400000
 10002f7:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 10002fb:	c1 e0 03             	shl    eax,0x3
 10002fe:	01 c2                	add    edx,eax
 1000300:	0f b7 45 f8          	movzx  eax,WORD PTR [ebp-0x8]
 1000304:	66 89 42 02          	mov    WORD PTR [edx+0x2],ax
 1000308:	90                   	nop
 1000309:	c9                   	leave  
 100030a:	c3                   	ret    

0100030b <divide_err>:
 100030b:	55                   	push   ebp
 100030c:	89 e5                	mov    ebp,esp
 100030e:	83 ec 08             	sub    esp,0x8
 1000311:	fa                   	cli    
 1000312:	e8 e2 2f 00 00       	call   10032f9 <eoi>
 1000317:	fb                   	sti    
 1000318:	c9                   	leave  
 1000319:	cf                   	iret   
 100031a:	90                   	nop
 100031b:	c9                   	leave  
 100031c:	c3                   	ret    

0100031d <debug>:
 100031d:	55                   	push   ebp
 100031e:	89 e5                	mov    ebp,esp
 1000320:	83 ec 08             	sub    esp,0x8
 1000323:	fa                   	cli    
 1000324:	e8 d0 2f 00 00       	call   10032f9 <eoi>
 1000329:	fb                   	sti    
 100032a:	c9                   	leave  
 100032b:	cf                   	iret   
 100032c:	90                   	nop
 100032d:	c9                   	leave  
 100032e:	c3                   	ret    

0100032f <default_int_proc>:
 100032f:	55                   	push   ebp
 1000330:	89 e5                	mov    ebp,esp
 1000332:	83 ec 08             	sub    esp,0x8
 1000335:	fa                   	cli    
 1000336:	e8 be 2f 00 00       	call   10032f9 <eoi>
 100033b:	fb                   	sti    
 100033c:	c9                   	leave  
 100033d:	cf                   	iret   
 100033e:	90                   	nop
 100033f:	c9                   	leave  
 1000340:	c3                   	ret    

01000341 <breakpoint>:
 1000341:	55                   	push   ebp
 1000342:	89 e5                	mov    ebp,esp
 1000344:	83 ec 08             	sub    esp,0x8
 1000347:	fa                   	cli    
 1000348:	e8 ac 2f 00 00       	call   10032f9 <eoi>
 100034d:	fb                   	sti    
 100034e:	c9                   	leave  
 100034f:	cf                   	iret   
 1000350:	90                   	nop
 1000351:	c9                   	leave  
 1000352:	c3                   	ret    

01000353 <overflow>:
 1000353:	55                   	push   ebp
 1000354:	89 e5                	mov    ebp,esp
 1000356:	83 ec 08             	sub    esp,0x8
 1000359:	fa                   	cli    
 100035a:	e8 9a 2f 00 00       	call   10032f9 <eoi>
 100035f:	fb                   	sti    
 1000360:	c9                   	leave  
 1000361:	cf                   	iret   
 1000362:	90                   	nop
 1000363:	c9                   	leave  
 1000364:	c3                   	ret    

01000365 <bounds>:
 1000365:	55                   	push   ebp
 1000366:	89 e5                	mov    ebp,esp
 1000368:	83 ec 08             	sub    esp,0x8
 100036b:	fa                   	cli    
 100036c:	e8 88 2f 00 00       	call   10032f9 <eoi>
 1000371:	fb                   	sti    
 1000372:	c9                   	leave  
 1000373:	cf                   	iret   
 1000374:	90                   	nop
 1000375:	c9                   	leave  
 1000376:	c3                   	ret    

01000377 <undefined_operator>:
 1000377:	55                   	push   ebp
 1000378:	89 e5                	mov    ebp,esp
 100037a:	83 ec 08             	sub    esp,0x8
 100037d:	e8 77 2f 00 00       	call   10032f9 <eoi>
 1000382:	e8 9d 2f 00 00       	call   1003324 <report_back_trace_of_err>
 1000387:	eb fe                	jmp    1000387 <undefined_operator+0x10>
 1000389:	c9                   	leave  
 100038a:	cf                   	iret   
 100038b:	90                   	nop
 100038c:	c9                   	leave  
 100038d:	c3                   	ret    

0100038e <coprocessor_notexist>:
 100038e:	55                   	push   ebp
 100038f:	89 e5                	mov    ebp,esp
 1000391:	83 ec 08             	sub    esp,0x8
 1000394:	fa                   	cli    
 1000395:	e8 5f 2f 00 00       	call   10032f9 <eoi>
 100039a:	fb                   	sti    
 100039b:	c9                   	leave  
 100039c:	cf                   	iret   
 100039d:	90                   	nop
 100039e:	c9                   	leave  
 100039f:	c3                   	ret    

010003a0 <double_ints>:
 10003a0:	55                   	push   ebp
 10003a1:	89 e5                	mov    ebp,esp
 10003a3:	83 ec 08             	sub    esp,0x8
 10003a6:	fa                   	cli    
 10003a7:	e8 4d 2f 00 00       	call   10032f9 <eoi>
 10003ac:	fb                   	sti    
 10003ad:	c9                   	leave  
 10003ae:	cf                   	iret   
 10003af:	90                   	nop
 10003b0:	c9                   	leave  
 10003b1:	c3                   	ret    

010003b2 <coprocessor_seg_overbound>:
 10003b2:	55                   	push   ebp
 10003b3:	89 e5                	mov    ebp,esp
 10003b5:	83 ec 08             	sub    esp,0x8
 10003b8:	e8 3c 2f 00 00       	call   10032f9 <eoi>
 10003bd:	c9                   	leave  
 10003be:	cf                   	iret   
 10003bf:	90                   	nop
 10003c0:	c9                   	leave  
 10003c1:	c3                   	ret    

010003c2 <invalid_tss>:
 10003c2:	55                   	push   ebp
 10003c3:	89 e5                	mov    ebp,esp
 10003c5:	83 ec 08             	sub    esp,0x8
 10003c8:	fa                   	cli    
 10003c9:	e8 2b 2f 00 00       	call   10032f9 <eoi>
 10003ce:	fb                   	sti    
 10003cf:	c9                   	leave  
 10003d0:	cf                   	iret   
 10003d1:	90                   	nop
 10003d2:	c9                   	leave  
 10003d3:	c3                   	ret    

010003d4 <segment_notexist>:
 10003d4:	55                   	push   ebp
 10003d5:	89 e5                	mov    ebp,esp
 10003d7:	83 ec 08             	sub    esp,0x8
 10003da:	fa                   	cli    
 10003db:	e8 19 2f 00 00       	call   10032f9 <eoi>
 10003e0:	fb                   	sti    
 10003e1:	c9                   	leave  
 10003e2:	cf                   	iret   
 10003e3:	90                   	nop
 10003e4:	c9                   	leave  
 10003e5:	c3                   	ret    

010003e6 <stackseg_overbound>:
 10003e6:	55                   	push   ebp
 10003e7:	89 e5                	mov    ebp,esp
 10003e9:	83 ec 08             	sub    esp,0x8
 10003ec:	fa                   	cli    
 10003ed:	e8 07 2f 00 00       	call   10032f9 <eoi>
 10003f2:	fb                   	sti    
 10003f3:	c9                   	leave  
 10003f4:	cf                   	iret   
 10003f5:	90                   	nop
 10003f6:	c9                   	leave  
 10003f7:	c3                   	ret    

010003f8 <general_protect>:
 10003f8:	55                   	push   ebp
 10003f9:	89 e5                	mov    ebp,esp
 10003fb:	83 ec 18             	sub    esp,0x18
 10003fe:	fa                   	cli    
 10003ff:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1000406:	e8 ee 2e 00 00       	call   10032f9 <eoi>
 100040b:	eb fe                	jmp    100040b <general_protect+0x13>
 100040d:	c9                   	leave  
 100040e:	cf                   	iret   
 100040f:	90                   	nop
 1000410:	c9                   	leave  
 1000411:	c3                   	ret    

01000412 <coprocessor_err>:
 1000412:	55                   	push   ebp
 1000413:	89 e5                	mov    ebp,esp
 1000415:	83 ec 08             	sub    esp,0x8
 1000418:	fa                   	cli    
 1000419:	e8 db 2e 00 00       	call   10032f9 <eoi>
 100041e:	fb                   	sti    
 100041f:	c9                   	leave  
 1000420:	cf                   	iret   
 1000421:	90                   	nop
 1000422:	c9                   	leave  
 1000423:	c3                   	ret    

01000424 <syscall>:
 1000424:	55                   	push   ebp
 1000425:	89 e5                	mov    ebp,esp
 1000427:	83 ec 08             	sub    esp,0x8
 100042a:	83 7d 08 64          	cmp    DWORD PTR [ebp+0x8],0x64
 100042e:	0f 87 2c 02 00 00    	ja     1000660 <syscall+0x23c>
 1000434:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000437:	c1 e0 02             	shl    eax,0x2
 100043a:	05 60 71 00 01       	add    eax,0x1007160
 100043f:	8b 00                	mov    eax,DWORD PTR [eax]
 1000441:	ff e0                	jmp    eax
 1000443:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000446:	83 ec 0c             	sub    esp,0xc
 1000449:	50                   	push   eax
 100044a:	e8 0c 1a 00 00       	call   1001e5b <reg_device>
 100044f:	83 c4 10             	add    esp,0x10
 1000452:	e9 09 02 00 00       	jmp    1000660 <syscall+0x23c>
 1000457:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100045a:	83 ec 0c             	sub    esp,0xc
 100045d:	50                   	push   eax
 100045e:	e8 1b 1f 00 00       	call   100237e <dispose_device>
 1000463:	83 c4 10             	add    esp,0x10
 1000466:	e9 f5 01 00 00       	jmp    1000660 <syscall+0x23c>
 100046b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100046e:	83 ec 0c             	sub    esp,0xc
 1000471:	50                   	push   eax
 1000472:	e8 52 1a 00 00       	call   1001ec9 <reg_driver>
 1000477:	83 c4 10             	add    esp,0x10
 100047a:	e9 e1 01 00 00       	jmp    1000660 <syscall+0x23c>
 100047f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000482:	83 ec 0c             	sub    esp,0xc
 1000485:	50                   	push   eax
 1000486:	e8 f9 1e 00 00       	call   1002384 <dispose_driver>
 100048b:	83 c4 10             	add    esp,0x10
 100048e:	e9 cd 01 00 00       	jmp    1000660 <syscall+0x23c>
 1000493:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1000496:	83 ec 04             	sub    esp,0x4
 1000499:	50                   	push   eax
 100049a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100049d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004a0:	e8 ed 1c 00 00       	call   1002192 <call_drv_func>
 10004a5:	83 c4 10             	add    esp,0x10
 10004a8:	e9 b3 01 00 00       	jmp    1000660 <syscall+0x23c>
 10004ad:	83 ec 08             	sub    esp,0x8
 10004b0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10004b3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004b6:	e8 f8 0d 00 00       	call   10012b3 <req_page_at>
 10004bb:	83 c4 10             	add    esp,0x10
 10004be:	e9 9d 01 00 00       	jmp    1000660 <syscall+0x23c>
 10004c3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10004c6:	83 ec 0c             	sub    esp,0xc
 10004c9:	50                   	push   eax
 10004ca:	e8 f0 0c 00 00       	call   10011bf <free_page>
 10004cf:	83 c4 10             	add    esp,0x10
 10004d2:	e9 89 01 00 00       	jmp    1000660 <syscall+0x23c>
 10004d7:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10004da:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10004dd:	83 ec 04             	sub    esp,0x4
 10004e0:	52                   	push   edx
 10004e1:	50                   	push   eax
 10004e2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004e5:	e8 a4 2a 00 00       	call   1002f8e <reg_proc>
 10004ea:	83 c4 10             	add    esp,0x10
 10004ed:	e9 6e 01 00 00       	jmp    1000660 <syscall+0x23c>
 10004f2:	83 ec 0c             	sub    esp,0xc
 10004f5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004f8:	e8 d4 28 00 00       	call   1002dd1 <del_proc>
 10004fd:	83 c4 10             	add    esp,0x10
 1000500:	83 ec 08             	sub    esp,0x8
 1000503:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000506:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000509:	e8 5a 0e 00 00       	call   1001368 <chk_vm>
 100050e:	83 c4 10             	add    esp,0x10
 1000511:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000514:	83 ec 08             	sub    esp,0x8
 1000517:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100051a:	50                   	push   eax
 100051b:	e8 6b 11 00 00       	call   100168b <sys_open>
 1000520:	83 c4 10             	add    esp,0x10
 1000523:	e9 38 01 00 00       	jmp    1000660 <syscall+0x23c>
 1000528:	83 ec 0c             	sub    esp,0xc
 100052b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100052e:	e8 fe 13 00 00       	call   1001931 <sys_close>
 1000533:	83 c4 10             	add    esp,0x10
 1000536:	e9 25 01 00 00       	jmp    1000660 <syscall+0x23c>
 100053b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 100053e:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 1000541:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000544:	50                   	push   eax
 1000545:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000548:	e8 c2 14 00 00       	call   1001a0f <sys_read>
 100054d:	83 c4 10             	add    esp,0x10
 1000550:	e9 0b 01 00 00       	jmp    1000660 <syscall+0x23c>
 1000555:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000558:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 100055b:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 100055e:	50                   	push   eax
 100055f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000562:	e8 20 14 00 00       	call   1001987 <sys_write>
 1000567:	83 c4 10             	add    esp,0x10
 100056a:	e9 f1 00 00 00       	jmp    1000660 <syscall+0x23c>
 100056f:	83 ec 04             	sub    esp,0x4
 1000572:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000575:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000578:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100057b:	e8 37 15 00 00       	call   1001ab7 <sys_seek>
 1000580:	83 c4 10             	add    esp,0x10
 1000583:	e9 d8 00 00 00       	jmp    1000660 <syscall+0x23c>
 1000588:	83 ec 0c             	sub    esp,0xc
 100058b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100058e:	e8 5d 15 00 00       	call   1001af0 <sys_tell>
 1000593:	83 c4 10             	add    esp,0x10
 1000596:	e9 c5 00 00 00       	jmp    1000660 <syscall+0x23c>
 100059b:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100059e:	83 ec 04             	sub    esp,0x4
 10005a1:	50                   	push   eax
 10005a2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10005a5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005a8:	e8 15 10 00 00       	call   10015c2 <reg_vol>
 10005ad:	83 c4 10             	add    esp,0x10
 10005b0:	e9 ab 00 00 00       	jmp    1000660 <syscall+0x23c>
 10005b5:	83 ec 0c             	sub    esp,0xc
 10005b8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005bb:	e8 ee 0f 00 00       	call   10015ae <free_vol>
 10005c0:	83 c4 10             	add    esp,0x10
 10005c3:	e9 98 00 00 00       	jmp    1000660 <syscall+0x23c>
 10005c8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005cb:	83 ec 0c             	sub    esp,0xc
 10005ce:	50                   	push   eax
 10005cf:	e8 ae 2f 00 00       	call   1003582 <execute>
 10005d4:	83 c4 10             	add    esp,0x10
 10005d7:	e9 84 00 00 00       	jmp    1000660 <syscall+0x23c>
 10005dc:	83 ec 0c             	sub    esp,0xc
 10005df:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005e2:	e8 8b 29 00 00       	call   1002f72 <sys_exit>
 10005e7:	83 c4 10             	add    esp,0x10
 10005ea:	eb 74                	jmp    1000660 <syscall+0x23c>
 10005ec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005ef:	83 ec 0c             	sub    esp,0xc
 10005f2:	50                   	push   eax
 10005f3:	e8 55 30 00 00       	call   100364d <exec_call>
 10005f8:	83 c4 10             	add    esp,0x10
 10005fb:	eb 63                	jmp    1000660 <syscall+0x23c>
 10005fd:	83 ec 0c             	sub    esp,0xc
 1000600:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000603:	e8 85 0e 00 00       	call   100148d <sys_mkfifo>
 1000608:	83 c4 10             	add    esp,0x10
 100060b:	eb 53                	jmp    1000660 <syscall+0x23c>
 100060d:	83 ec 0c             	sub    esp,0xc
 1000610:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000613:	e8 b0 2a 00 00       	call   10030c8 <sys_malloc>
 1000618:	83 c4 10             	add    esp,0x10
 100061b:	eb 43                	jmp    1000660 <syscall+0x23c>
 100061d:	83 ec 0c             	sub    esp,0xc
 1000620:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000623:	e8 f1 2b 00 00       	call   1003219 <sys_free>
 1000628:	83 c4 10             	add    esp,0x10
 100062b:	eb 33                	jmp    1000660 <syscall+0x23c>
 100062d:	e8 5f 3b 00 00       	call   1004191 <sys_getkbc>
 1000632:	0f be c0             	movsx  eax,al
 1000635:	eb 29                	jmp    1000660 <syscall+0x23c>
 1000637:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100063a:	83 ec 0c             	sub    esp,0xc
 100063d:	50                   	push   eax
 100063e:	e8 09 19 00 00       	call   1001f4c <sys_find_dev>
 1000643:	83 c4 10             	add    esp,0x10
 1000646:	eb 18                	jmp    1000660 <syscall+0x23c>
 1000648:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 100064b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100064e:	83 ec 04             	sub    esp,0x4
 1000651:	52                   	push   edx
 1000652:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000655:	50                   	push   eax
 1000656:	e8 48 19 00 00       	call   1001fa3 <sys_operate_dev>
 100065b:	83 c4 10             	add    esp,0x10
 100065e:	eb 00                	jmp    1000660 <syscall+0x23c>
 1000660:	c9                   	leave  
 1000661:	c3                   	ret    

01000662 <main>:
 1000662:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1000666:	83 e4 f0             	and    esp,0xfffffff0
 1000669:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 100066c:	55                   	push   ebp
 100066d:	89 e5                	mov    ebp,esp
 100066f:	57                   	push   edi
 1000670:	56                   	push   esi
 1000671:	53                   	push   ebx
 1000672:	51                   	push   ecx
 1000673:	83 ec 58             	sub    esp,0x58
 1000676:	89 cb                	mov    ebx,ecx
 1000678:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 100067b:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100067e:	e8 5b 05 00 00       	call   1000bde <init_logging>
 1000683:	81 3b d6 50 52 e8    	cmp    DWORD PTR [ebx],0xe85250d6
 1000689:	74 10                	je     100069b <main+0x39>
 100068b:	83 ec 0c             	sub    esp,0xc
 100068e:	68 f4 72 00 01       	push   0x10072f4
 1000693:	e8 fa 06 00 00       	call   1000d92 <printf>
 1000698:	83 c4 10             	add    esp,0x10
 100069b:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 100069e:	8b 00                	mov    eax,DWORD PTR [eax]
 10006a0:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 10006a3:	83 ec 08             	sub    esp,0x8
 10006a6:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 10006a9:	68 1e 73 00 01       	push   0x100731e
 10006ae:	e8 df 06 00 00       	call   1000d92 <printf>
 10006b3:	83 c4 10             	add    esp,0x10
 10006b6:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 10006b9:	83 c0 08             	add    eax,0x8
 10006bc:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10006bf:	e9 b3 04 00 00       	jmp    1000b77 <main+0x515>
 10006c4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006c7:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10006ca:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006cd:	8b 00                	mov    eax,DWORD PTR [eax]
 10006cf:	83 ec 04             	sub    esp,0x4
 10006d2:	52                   	push   edx
 10006d3:	50                   	push   eax
 10006d4:	68 37 73 00 01       	push   0x1007337
 10006d9:	e8 b4 06 00 00       	call   1000d92 <printf>
 10006de:	83 c4 10             	add    esp,0x10
 10006e1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006e4:	8b 00                	mov    eax,DWORD PTR [eax]
 10006e6:	83 f8 08             	cmp    eax,0x8
 10006e9:	0f 87 79 04 00 00    	ja     1000b68 <main+0x506>
 10006ef:	8b 04 85 98 74 00 01 	mov    eax,DWORD PTR [eax*4+0x1007498]
 10006f6:	ff e0                	jmp    eax
 10006f8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006fb:	83 c0 08             	add    eax,0x8
 10006fe:	83 ec 08             	sub    esp,0x8
 1000701:	50                   	push   eax
 1000702:	68 4c 73 00 01       	push   0x100734c
 1000707:	e8 86 06 00 00       	call   1000d92 <printf>
 100070c:	83 c4 10             	add    esp,0x10
 100070f:	e9 54 04 00 00       	jmp    1000b68 <main+0x506>
 1000714:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000717:	83 c0 08             	add    eax,0x8
 100071a:	83 ec 08             	sub    esp,0x8
 100071d:	50                   	push   eax
 100071e:	68 5f 73 00 01       	push   0x100735f
 1000723:	e8 6a 06 00 00       	call   1000d92 <printf>
 1000728:	83 c4 10             	add    esp,0x10
 100072b:	e9 38 04 00 00       	jmp    1000b68 <main+0x506>
 1000730:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000733:	8d 48 10             	lea    ecx,[eax+0x10]
 1000736:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000739:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100073c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100073f:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000742:	51                   	push   ecx
 1000743:	52                   	push   edx
 1000744:	50                   	push   eax
 1000745:	68 78 73 00 01       	push   0x1007378
 100074a:	e8 43 06 00 00       	call   1000d92 <printf>
 100074f:	83 c4 10             	add    esp,0x10
 1000752:	e9 11 04 00 00       	jmp    1000b68 <main+0x506>
 1000757:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100075a:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100075d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000760:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000763:	83 ec 04             	sub    esp,0x4
 1000766:	52                   	push   edx
 1000767:	50                   	push   eax
 1000768:	68 a0 73 00 01       	push   0x10073a0
 100076d:	e8 20 06 00 00       	call   1000d92 <printf>
 1000772:	83 c4 10             	add    esp,0x10
 1000775:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000778:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100077b:	83 ec 0c             	sub    esp,0xc
 100077e:	50                   	push   eax
 100077f:	e8 11 07 00 00       	call   1000e95 <set_high_mem_base>
 1000784:	83 c4 10             	add    esp,0x10
 1000787:	e9 dc 03 00 00       	jmp    1000b68 <main+0x506>
 100078c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100078f:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1000792:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000795:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000798:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100079b:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100079e:	51                   	push   ecx
 100079f:	52                   	push   edx
 10007a0:	50                   	push   eax
 10007a1:	68 c4 73 00 01       	push   0x10073c4
 10007a6:	e8 e7 05 00 00       	call   1000d92 <printf>
 10007ab:	83 c4 10             	add    esp,0x10
 10007ae:	e9 b5 03 00 00       	jmp    1000b68 <main+0x506>
 10007b3:	83 ec 0c             	sub    esp,0xc
 10007b6:	68 dc 73 00 01       	push   0x10073dc
 10007bb:	e8 d2 05 00 00       	call   1000d92 <printf>
 10007c0:	83 c4 10             	add    esp,0x10
 10007c3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10007c6:	83 c0 10             	add    eax,0x10
 10007c9:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10007cc:	e9 06 01 00 00       	jmp    10008d7 <main+0x275>
 10007d1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007d4:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 10007d7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007da:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007dd:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007e0:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 10007e3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007e6:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007e9:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007ec:	89 d0                	mov    eax,edx
 10007ee:	31 d2                	xor    edx,edx
 10007f0:	89 c7                	mov    edi,eax
 10007f2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007f5:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10007f8:	8b 00                	mov    eax,DWORD PTR [eax]
 10007fa:	89 c6                	mov    esi,eax
 10007fc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007ff:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1000802:	8b 00                	mov    eax,DWORD PTR [eax]
 1000804:	89 d0                	mov    eax,edx
 1000806:	31 d2                	xor    edx,edx
 1000808:	83 ec 08             	sub    esp,0x8
 100080b:	51                   	push   ecx
 100080c:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 100080f:	57                   	push   edi
 1000810:	56                   	push   esi
 1000811:	50                   	push   eax
 1000812:	68 e4 73 00 01       	push   0x10073e4
 1000817:	e8 76 05 00 00       	call   1000d92 <printf>
 100081c:	83 c4 20             	add    esp,0x20
 100081f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000822:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000825:	89 c6                	mov    esi,eax
 1000827:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100082a:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100082d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000830:	89 c1                	mov    ecx,eax
 1000832:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000835:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1000838:	8b 00                	mov    eax,DWORD PTR [eax]
 100083a:	83 ec 04             	sub    esp,0x4
 100083d:	56                   	push   esi
 100083e:	51                   	push   ecx
 100083f:	50                   	push   eax
 1000840:	e8 5e 06 00 00       	call   1000ea3 <set_mem_area>
 1000845:	83 c4 10             	add    esp,0x10
 1000848:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100084b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100084e:	83 f8 05             	cmp    eax,0x5
 1000851:	77 75                	ja     10008c8 <main+0x266>
 1000853:	8b 04 85 bc 74 00 01 	mov    eax,DWORD PTR [eax*4+0x10074bc]
 100085a:	ff e0                	jmp    eax
 100085c:	83 ec 0c             	sub    esp,0xc
 100085f:	68 17 74 00 01       	push   0x1007417
 1000864:	e8 29 05 00 00       	call   1000d92 <printf>
 1000869:	83 c4 10             	add    esp,0x10
 100086c:	eb 5b                	jmp    10008c9 <main+0x267>
 100086e:	83 ec 0c             	sub    esp,0xc
 1000871:	68 26 74 00 01       	push   0x1007426
 1000876:	e8 17 05 00 00       	call   1000d92 <printf>
 100087b:	83 c4 10             	add    esp,0x10
 100087e:	eb 49                	jmp    10008c9 <main+0x267>
 1000880:	83 ec 0c             	sub    esp,0xc
 1000883:	68 28 74 00 01       	push   0x1007428
 1000888:	e8 05 05 00 00       	call   1000d92 <printf>
 100088d:	83 c4 10             	add    esp,0x10
 1000890:	eb 37                	jmp    10008c9 <main+0x267>
 1000892:	83 ec 0c             	sub    esp,0xc
 1000895:	68 34 74 00 01       	push   0x1007434
 100089a:	e8 f3 04 00 00       	call   1000d92 <printf>
 100089f:	83 c4 10             	add    esp,0x10
 10008a2:	eb 25                	jmp    10008c9 <main+0x267>
 10008a4:	83 ec 0c             	sub    esp,0xc
 10008a7:	68 64 74 00 01       	push   0x1007464
 10008ac:	e8 e1 04 00 00       	call   1000d92 <printf>
 10008b1:	83 c4 10             	add    esp,0x10
 10008b4:	eb 13                	jmp    10008c9 <main+0x267>
 10008b6:	83 ec 0c             	sub    esp,0xc
 10008b9:	68 72 74 00 01       	push   0x1007472
 10008be:	e8 cf 04 00 00       	call   1000d92 <printf>
 10008c3:	83 c4 10             	add    esp,0x10
 10008c6:	eb 01                	jmp    10008c9 <main+0x267>
 10008c8:	90                   	nop
 10008c9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008cc:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10008cf:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10008d2:	01 d0                	add    eax,edx
 10008d4:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10008d7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008da:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10008dd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008e0:	01 d0                	add    eax,edx
 10008e2:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 10008e5:	0f 82 e6 fe ff ff    	jb     10007d1 <main+0x16f>
 10008eb:	e9 78 02 00 00       	jmp    1000b68 <main+0x506>
 10008f0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008f3:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10008f6:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10008f9:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10008fc:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10008ff:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 1000902:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000905:	0f b6 40 1d          	movzx  eax,BYTE PTR [eax+0x1d]
 1000909:	0f b6 c0             	movzx  eax,al
 100090c:	83 f8 02             	cmp    eax,0x2
 100090f:	0f 84 36 01 00 00    	je     1000a4b <main+0x3e9>
 1000915:	83 f8 02             	cmp    eax,0x2
 1000918:	0f 8f 36 01 00 00    	jg     1000a54 <main+0x3f2>
 100091e:	85 c0                	test   eax,eax
 1000920:	74 0e                	je     1000930 <main+0x2ce>
 1000922:	83 f8 01             	cmp    eax,0x1
 1000925:	0f 84 f3 00 00 00    	je     1000a1e <main+0x3bc>
 100092b:	e9 24 01 00 00       	jmp    1000a54 <main+0x3f2>
 1000930:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000933:	83 c0 22             	add    eax,0x22
 1000936:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1000939:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1000940:	c7 45 d4 00 00 04 00 	mov    DWORD PTR [ebp-0x2c],0x40000
 1000947:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 100094e:	e9 b6 00 00 00       	jmp    1000a09 <main+0x3a7>
 1000953:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000956:	89 d0                	mov    eax,edx
 1000958:	01 c0                	add    eax,eax
 100095a:	01 c2                	add    edx,eax
 100095c:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100095f:	01 d0                	add    eax,edx
 1000961:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000965:	0f b6 c0             	movzx  eax,al
 1000968:	ba ff 00 00 00       	mov    edx,0xff
 100096d:	89 d1                	mov    ecx,edx
 100096f:	29 c1                	sub    ecx,eax
 1000971:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000974:	89 d0                	mov    eax,edx
 1000976:	01 c0                	add    eax,eax
 1000978:	01 c2                	add    edx,eax
 100097a:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100097d:	01 d0                	add    eax,edx
 100097f:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000983:	0f b6 d0             	movzx  edx,al
 1000986:	b8 ff 00 00 00       	mov    eax,0xff
 100098b:	29 d0                	sub    eax,edx
 100098d:	89 ce                	mov    esi,ecx
 100098f:	0f af f0             	imul   esi,eax
 1000992:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000995:	89 d0                	mov    eax,edx
 1000997:	01 c0                	add    eax,eax
 1000999:	01 c2                	add    edx,eax
 100099b:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100099e:	01 d0                	add    eax,edx
 10009a0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10009a3:	0f b6 c8             	movzx  ecx,al
 10009a6:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009a9:	89 d0                	mov    eax,edx
 10009ab:	01 c0                	add    eax,eax
 10009ad:	01 c2                	add    edx,eax
 10009af:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009b2:	01 d0                	add    eax,edx
 10009b4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10009b7:	0f b6 c0             	movzx  eax,al
 10009ba:	0f af c1             	imul   eax,ecx
 10009bd:	01 c6                	add    esi,eax
 10009bf:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009c2:	89 d0                	mov    eax,edx
 10009c4:	01 c0                	add    eax,eax
 10009c6:	01 c2                	add    edx,eax
 10009c8:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009cb:	01 d0                	add    eax,edx
 10009cd:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10009d1:	0f b6 c8             	movzx  ecx,al
 10009d4:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009d7:	89 d0                	mov    eax,edx
 10009d9:	01 c0                	add    eax,eax
 10009db:	01 c2                	add    edx,eax
 10009dd:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009e0:	01 d0                	add    eax,edx
 10009e2:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10009e6:	0f b6 c0             	movzx  eax,al
 10009e9:	0f af c1             	imul   eax,ecx
 10009ec:	01 f0                	add    eax,esi
 10009ee:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10009f1:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10009f4:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 10009f7:	73 0c                	jae    1000a05 <main+0x3a3>
 10009f9:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10009fc:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10009ff:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1000a02:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1000a05:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000a09:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a0c:	0f b7 40 20          	movzx  eax,WORD PTR [eax+0x20]
 1000a10:	0f b7 c0             	movzx  eax,ax
 1000a13:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000a16:	0f 82 37 ff ff ff    	jb     1000953 <main+0x2f1>
 1000a1c:	eb 3e                	jmp    1000a5c <main+0x3fa>
 1000a1e:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a21:	0f b6 40 25          	movzx  eax,BYTE PTR [eax+0x25]
 1000a25:	0f b6 c0             	movzx  eax,al
 1000a28:	ba 01 00 00 00       	mov    edx,0x1
 1000a2d:	89 c1                	mov    ecx,eax
 1000a2f:	d3 e2                	shl    edx,cl
 1000a31:	89 d0                	mov    eax,edx
 1000a33:	8d 50 ff             	lea    edx,[eax-0x1]
 1000a36:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a39:	0f b6 40 24          	movzx  eax,BYTE PTR [eax+0x24]
 1000a3d:	0f b6 c0             	movzx  eax,al
 1000a40:	89 c1                	mov    ecx,eax
 1000a42:	d3 e2                	shl    edx,cl
 1000a44:	89 d0                	mov    eax,edx
 1000a46:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1000a49:	eb 11                	jmp    1000a5c <main+0x3fa>
 1000a4b:	c7 45 dc 5c 01 00 00 	mov    DWORD PTR [ebp-0x24],0x15c
 1000a52:	eb 08                	jmp    1000a5c <main+0x3fa>
 1000a54:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
 1000a5b:	90                   	nop
 1000a5c:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 1000a63:	e9 e5 00 00 00       	jmp    1000b4d <main+0x4eb>
 1000a68:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a6b:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
 1000a6f:	0f b6 c0             	movzx  eax,al
 1000a72:	83 f8 20             	cmp    eax,0x20
 1000a75:	0f 84 ae 00 00 00    	je     1000b29 <main+0x4c7>
 1000a7b:	83 f8 20             	cmp    eax,0x20
 1000a7e:	0f 8f c5 00 00 00    	jg     1000b49 <main+0x4e7>
 1000a84:	83 f8 18             	cmp    eax,0x18
 1000a87:	74 6c                	je     1000af5 <main+0x493>
 1000a89:	83 f8 18             	cmp    eax,0x18
 1000a8c:	0f 8f b7 00 00 00    	jg     1000b49 <main+0x4e7>
 1000a92:	83 f8 08             	cmp    eax,0x8
 1000a95:	74 17                	je     1000aae <main+0x44c>
 1000a97:	83 f8 08             	cmp    eax,0x8
 1000a9a:	0f 8c a9 00 00 00    	jl     1000b49 <main+0x4e7>
 1000aa0:	83 e8 0f             	sub    eax,0xf
 1000aa3:	83 f8 01             	cmp    eax,0x1
 1000aa6:	0f 87 9d 00 00 00    	ja     1000b49 <main+0x4e7>
 1000aac:	eb 23                	jmp    1000ad1 <main+0x46f>
 1000aae:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000ab1:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000ab4:	83 c0 01             	add    eax,0x1
 1000ab7:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000abb:	89 c2                	mov    edx,eax
 1000abd:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000ac0:	01 d0                	add    eax,edx
 1000ac2:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 1000ac5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000ac8:	89 c2                	mov    edx,eax
 1000aca:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 1000acd:	88 10                	mov    BYTE PTR [eax],dl
 1000acf:	eb 78                	jmp    1000b49 <main+0x4e7>
 1000ad1:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000ad4:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000ad7:	83 c0 02             	add    eax,0x2
 1000ada:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000ade:	89 c2                	mov    edx,eax
 1000ae0:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000ae3:	01 d0                	add    eax,edx
 1000ae5:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 1000ae8:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000aeb:	89 c2                	mov    edx,eax
 1000aed:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1000af0:	66 89 10             	mov    WORD PTR [eax],dx
 1000af3:	eb 54                	jmp    1000b49 <main+0x4e7>
 1000af5:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000af8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000afb:	83 c0 03             	add    eax,0x3
 1000afe:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000b02:	89 c2                	mov    edx,eax
 1000b04:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000b07:	01 d0                	add    eax,edx
 1000b09:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 1000b0c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000b0f:	25 ff ff ff 00       	and    eax,0xffffff
 1000b14:	89 c2                	mov    edx,eax
 1000b16:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000b19:	8b 00                	mov    eax,DWORD PTR [eax]
 1000b1b:	25 00 00 00 ff       	and    eax,0xff000000
 1000b20:	09 c2                	or     edx,eax
 1000b22:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000b25:	89 10                	mov    DWORD PTR [eax],edx
 1000b27:	eb 20                	jmp    1000b49 <main+0x4e7>
 1000b29:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b2c:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000b2f:	83 c0 04             	add    eax,0x4
 1000b32:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000b36:	89 c2                	mov    edx,eax
 1000b38:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000b3b:	01 d0                	add    eax,edx
 1000b3d:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1000b40:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 1000b43:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
 1000b46:	89 10                	mov    DWORD PTR [eax],edx
 1000b48:	90                   	nop
 1000b49:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000b4d:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b50:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1000b53:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000b56:	73 0f                	jae    1000b67 <main+0x505>
 1000b58:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b5b:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1000b5e:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000b61:	0f 82 01 ff ff ff    	jb     1000a68 <main+0x406>
 1000b67:	90                   	nop
 1000b68:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b6b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000b6e:	83 c0 07             	add    eax,0x7
 1000b71:	83 e0 f8             	and    eax,0xfffffff8
 1000b74:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000b77:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b7a:	8b 00                	mov    eax,DWORD PTR [eax]
 1000b7c:	85 c0                	test   eax,eax
 1000b7e:	0f 85 40 fb ff ff    	jne    10006c4 <main+0x62>
 1000b84:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b87:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000b8a:	83 c0 07             	add    eax,0x7
 1000b8d:	83 e0 f8             	and    eax,0xfffffff8
 1000b90:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000b93:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b96:	2b 43 04             	sub    eax,DWORD PTR [ebx+0x4]
 1000b99:	83 ec 08             	sub    esp,0x8
 1000b9c:	50                   	push   eax
 1000b9d:	68 80 74 00 01       	push   0x1007480
 1000ba2:	e8 eb 01 00 00       	call   1000d92 <printf>
 1000ba7:	83 c4 10             	add    esp,0x10
 1000baa:	e8 51 f4 ff ff       	call   1000000 <init_int>
 1000baf:	e8 3a 05 00 00       	call   10010ee <init_memory>
 1000bb4:	e8 96 12 00 00       	call   1001e4f <init_drvdev_man>
 1000bb9:	e8 d7 18 00 00       	call   1002495 <init_proc>
 1000bbe:	e8 af 57 00 00       	call   1006372 <init_tty>
 1000bc3:	e8 ce 34 00 00       	call   1004096 <init_kb>
 1000bc8:	e8 1c 36 00 00       	call   10041e9 <init_disk>
 1000bcd:	e8 4c 3d 00 00       	call   100491e <init_fat16>
 1000bd2:	c7 05 40 70 00 01 00 	mov    DWORD PTR ds:0x1007040,0x0
 1000bd9:	00 00 00 
 1000bdc:	eb fe                	jmp    1000bdc <main+0x57a>

01000bde <init_logging>:
 1000bde:	55                   	push   ebp
 1000bdf:	89 e5                	mov    ebp,esp
 1000be1:	c7 05 04 00 40 00 00 	mov    DWORD PTR ds:0x400004,0xb8000
 1000be8:	80 0b 00 
 1000beb:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000bf2:	00 00 00 
 1000bf5:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000bfc:	00 00 00 
 1000bff:	90                   	nop
 1000c00:	5d                   	pop    ebp
 1000c01:	c3                   	ret    

01000c02 <itoa>:
 1000c02:	55                   	push   ebp
 1000c03:	89 e5                	mov    ebp,esp
 1000c05:	83 ec 20             	sub    esp,0x20
 1000c08:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000c0b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000c0e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000c11:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c14:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
 1000c1b:	83 7d 0c 64          	cmp    DWORD PTR [ebp+0xc],0x64
 1000c1f:	75 20                	jne    1000c41 <itoa+0x3f>
 1000c21:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1000c25:	79 1a                	jns    1000c41 <itoa+0x3f>
 1000c27:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c2a:	8d 50 01             	lea    edx,[eax+0x1]
 1000c2d:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000c30:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1000c33:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1000c37:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000c3a:	f7 d8                	neg    eax
 1000c3c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c3f:	eb 0d                	jmp    1000c4e <itoa+0x4c>
 1000c41:	83 7d 0c 78          	cmp    DWORD PTR [ebp+0xc],0x78
 1000c45:	75 07                	jne    1000c4e <itoa+0x4c>
 1000c47:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [ebp-0x14],0x10
 1000c4e:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000c51:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000c54:	ba 00 00 00 00       	mov    edx,0x0
 1000c59:	f7 f1                	div    ecx
 1000c5b:	89 d0                	mov    eax,edx
 1000c5d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1000c60:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
 1000c64:	7f 0a                	jg     1000c70 <itoa+0x6e>
 1000c66:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000c69:	83 c0 30             	add    eax,0x30
 1000c6c:	89 c1                	mov    ecx,eax
 1000c6e:	eb 08                	jmp    1000c78 <itoa+0x76>
 1000c70:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000c73:	83 c0 57             	add    eax,0x57
 1000c76:	89 c1                	mov    ecx,eax
 1000c78:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c7b:	8d 50 01             	lea    edx,[eax+0x1]
 1000c7e:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000c81:	88 08                	mov    BYTE PTR [eax],cl
 1000c83:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000c86:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000c89:	ba 00 00 00 00       	mov    edx,0x0
 1000c8e:	f7 f1                	div    ecx
 1000c90:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c93:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1000c97:	75 b5                	jne    1000c4e <itoa+0x4c>
 1000c99:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c9c:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1000c9f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000ca2:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000ca5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000ca8:	83 e8 01             	sub    eax,0x1
 1000cab:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000cae:	eb 25                	jmp    1000cd5 <itoa+0xd3>
 1000cb0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cb3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000cb6:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
 1000cb9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000cbc:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1000cbf:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cc2:	88 10                	mov    BYTE PTR [eax],dl
 1000cc4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000cc7:	0f b6 55 e7          	movzx  edx,BYTE PTR [ebp-0x19]
 1000ccb:	88 10                	mov    BYTE PTR [eax],dl
 1000ccd:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000cd1:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1000cd5:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cd8:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 1000cdb:	72 d3                	jb     1000cb0 <itoa+0xae>
 1000cdd:	90                   	nop
 1000cde:	90                   	nop
 1000cdf:	c9                   	leave  
 1000ce0:	c3                   	ret    

01000ce1 <putchar>:
 1000ce1:	55                   	push   ebp
 1000ce2:	89 e5                	mov    ebp,esp
 1000ce4:	83 7d 08 0a          	cmp    DWORD PTR [ebp+0x8],0xa
 1000ce8:	74 06                	je     1000cf0 <putchar+0xf>
 1000cea:	83 7d 08 0d          	cmp    DWORD PTR [ebp+0x8],0xd
 1000cee:	75 31                	jne    1000d21 <putchar+0x40>
 1000cf0:	90                   	nop
 1000cf1:	eb 01                	jmp    1000cf4 <putchar+0x13>
 1000cf3:	90                   	nop
 1000cf4:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000cfb:	00 00 00 
 1000cfe:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000d03:	83 c0 01             	add    eax,0x1
 1000d06:	a3 0c 00 40 00       	mov    ds:0x40000c,eax
 1000d0b:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000d10:	83 f8 17             	cmp    eax,0x17
 1000d13:	7e 7a                	jle    1000d8f <putchar+0xae>
 1000d15:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000d1c:	00 00 00 
 1000d1f:	eb 6e                	jmp    1000d8f <putchar+0xae>
 1000d21:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000d27:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000d2d:	89 d0                	mov    eax,edx
 1000d2f:	c1 e0 02             	shl    eax,0x2
 1000d32:	01 d0                	add    eax,edx
 1000d34:	c1 e0 04             	shl    eax,0x4
 1000d37:	89 c2                	mov    edx,eax
 1000d39:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d3e:	01 d0                	add    eax,edx
 1000d40:	01 c0                	add    eax,eax
 1000d42:	01 c8                	add    eax,ecx
 1000d44:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1000d47:	88 10                	mov    BYTE PTR [eax],dl
 1000d49:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000d4f:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000d55:	89 d0                	mov    eax,edx
 1000d57:	c1 e0 02             	shl    eax,0x2
 1000d5a:	01 d0                	add    eax,edx
 1000d5c:	c1 e0 04             	shl    eax,0x4
 1000d5f:	89 c2                	mov    edx,eax
 1000d61:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d66:	01 d0                	add    eax,edx
 1000d68:	01 c0                	add    eax,eax
 1000d6a:	83 c0 01             	add    eax,0x1
 1000d6d:	01 c8                	add    eax,ecx
 1000d6f:	c6 00 07             	mov    BYTE PTR [eax],0x7
 1000d72:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d77:	83 c0 01             	add    eax,0x1
 1000d7a:	a3 08 00 40 00       	mov    ds:0x400008,eax
 1000d7f:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d84:	83 f8 4f             	cmp    eax,0x4f
 1000d87:	0f 8f 66 ff ff ff    	jg     1000cf3 <putchar+0x12>
 1000d8d:	eb 01                	jmp    1000d90 <putchar+0xaf>
 1000d8f:	90                   	nop
 1000d90:	5d                   	pop    ebp
 1000d91:	c3                   	ret    

01000d92 <printf>:
 1000d92:	55                   	push   ebp
 1000d93:	89 e5                	mov    ebp,esp
 1000d95:	83 ec 20             	sub    esp,0x20
 1000d98:	8d 45 08             	lea    eax,[ebp+0x8]
 1000d9b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000d9e:	83 45 fc 04          	add    DWORD PTR [ebp-0x4],0x4
 1000da2:	e9 ce 00 00 00       	jmp    1000e75 <printf+0xe3>
 1000da7:	83 7d f4 25          	cmp    DWORD PTR [ebp-0xc],0x25
 1000dab:	74 10                	je     1000dbd <printf+0x2b>
 1000dad:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000db0:	e8 2c ff ff ff       	call   1000ce1 <putchar>
 1000db5:	83 c4 04             	add    esp,0x4
 1000db8:	e9 b8 00 00 00       	jmp    1000e75 <printf+0xe3>
 1000dbd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000dc0:	8d 50 01             	lea    edx,[eax+0x1]
 1000dc3:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000dc6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000dc9:	0f be c0             	movsx  eax,al
 1000dcc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000dcf:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000dd3:	74 24                	je     1000df9 <printf+0x67>
 1000dd5:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000dd9:	0f 8f 81 00 00 00    	jg     1000e60 <printf+0xce>
 1000ddf:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000de3:	74 14                	je     1000df9 <printf+0x67>
 1000de5:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000de9:	7f 75                	jg     1000e60 <printf+0xce>
 1000deb:	83 7d f4 64          	cmp    DWORD PTR [ebp-0xc],0x64
 1000def:	74 08                	je     1000df9 <printf+0x67>
 1000df1:	83 7d f4 73          	cmp    DWORD PTR [ebp-0xc],0x73
 1000df5:	74 25                	je     1000e1c <printf+0x8a>
 1000df7:	eb 67                	jmp    1000e60 <printf+0xce>
 1000df9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000dfc:	8d 50 04             	lea    edx,[eax+0x4]
 1000dff:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000e02:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e04:	50                   	push   eax
 1000e05:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000e08:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000e0b:	50                   	push   eax
 1000e0c:	e8 f1 fd ff ff       	call   1000c02 <itoa>
 1000e11:	83 c4 0c             	add    esp,0xc
 1000e14:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000e17:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000e1a:	eb 1e                	jmp    1000e3a <printf+0xa8>
 1000e1c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000e1f:	8d 50 04             	lea    edx,[eax+0x4]
 1000e22:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000e25:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e27:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000e2a:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1000e2e:	75 09                	jne    1000e39 <printf+0xa7>
 1000e30:	c7 45 f8 d4 74 00 01 	mov    DWORD PTR [ebp-0x8],0x10074d4
 1000e37:	eb 1b                	jmp    1000e54 <printf+0xc2>
 1000e39:	90                   	nop
 1000e3a:	eb 18                	jmp    1000e54 <printf+0xc2>
 1000e3c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e3f:	8d 50 01             	lea    edx,[eax+0x1]
 1000e42:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 1000e45:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e48:	0f be c0             	movsx  eax,al
 1000e4b:	50                   	push   eax
 1000e4c:	e8 90 fe ff ff       	call   1000ce1 <putchar>
 1000e51:	83 c4 04             	add    esp,0x4
 1000e54:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e57:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e5a:	84 c0                	test   al,al
 1000e5c:	75 de                	jne    1000e3c <printf+0xaa>
 1000e5e:	eb 15                	jmp    1000e75 <printf+0xe3>
 1000e60:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000e63:	8d 50 04             	lea    edx,[eax+0x4]
 1000e66:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000e69:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e6b:	50                   	push   eax
 1000e6c:	e8 70 fe ff ff       	call   1000ce1 <putchar>
 1000e71:	83 c4 04             	add    esp,0x4
 1000e74:	90                   	nop
 1000e75:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000e78:	8d 50 01             	lea    edx,[eax+0x1]
 1000e7b:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000e7e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e81:	0f be c0             	movsx  eax,al
 1000e84:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000e87:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1000e8b:	0f 85 16 ff ff ff    	jne    1000da7 <printf+0x15>
 1000e91:	90                   	nop
 1000e92:	90                   	nop
 1000e93:	c9                   	leave  
 1000e94:	c3                   	ret    

01000e95 <set_high_mem_base>:
 1000e95:	55                   	push   ebp
 1000e96:	89 e5                	mov    ebp,esp
 1000e98:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000e9b:	a3 4c 70 00 01       	mov    ds:0x100704c,eax
 1000ea0:	90                   	nop
 1000ea1:	5d                   	pop    ebp
 1000ea2:	c3                   	ret    

01000ea3 <set_mem_area>:
 1000ea3:	55                   	push   ebp
 1000ea4:	89 e5                	mov    ebp,esp
 1000ea6:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000eac:	89 d0                	mov    eax,edx
 1000eae:	01 c0                	add    eax,eax
 1000eb0:	01 d0                	add    eax,edx
 1000eb2:	c1 e0 02             	shl    eax,0x2
 1000eb5:	8d 90 40 01 40 00    	lea    edx,[eax+0x400140]
 1000ebb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000ebe:	89 02                	mov    DWORD PTR [edx],eax
 1000ec0:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000ec6:	89 d0                	mov    eax,edx
 1000ec8:	01 c0                	add    eax,eax
 1000eca:	01 d0                	add    eax,edx
 1000ecc:	c1 e0 02             	shl    eax,0x2
 1000ecf:	8d 90 44 01 40 00    	lea    edx,[eax+0x400144]
 1000ed5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000ed8:	89 02                	mov    DWORD PTR [edx],eax
 1000eda:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000ee0:	8d 42 01             	lea    eax,[edx+0x1]
 1000ee3:	a3 30 02 40 00       	mov    ds:0x400230,eax
 1000ee8:	89 d0                	mov    eax,edx
 1000eea:	01 c0                	add    eax,eax
 1000eec:	01 d0                	add    eax,edx
 1000eee:	c1 e0 02             	shl    eax,0x2
 1000ef1:	8d 90 48 01 40 00    	lea    edx,[eax+0x400148]
 1000ef7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000efa:	89 02                	mov    DWORD PTR [edx],eax
 1000efc:	90                   	nop
 1000efd:	5d                   	pop    ebp
 1000efe:	c3                   	ret    

01000eff <vmalloc>:
 1000eff:	55                   	push   ebp
 1000f00:	89 e5                	mov    ebp,esp
 1000f02:	53                   	push   ebx
 1000f03:	83 ec 10             	sub    esp,0x10
 1000f06:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1000f0d:	eb 6e                	jmp    1000f7d <vmalloc+0x7e>
 1000f0f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1000f16:	eb 5b                	jmp    1000f73 <vmalloc+0x74>
 1000f18:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f1b:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000f22:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f25:	bb 01 00 00 00       	mov    ebx,0x1
 1000f2a:	89 c1                	mov    ecx,eax
 1000f2c:	d3 e3                	shl    ebx,cl
 1000f2e:	89 d8                	mov    eax,ebx
 1000f30:	21 d0                	and    eax,edx
 1000f32:	85 c0                	test   eax,eax
 1000f34:	75 39                	jne    1000f6f <vmalloc+0x70>
 1000f36:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f39:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000f40:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f43:	bb 01 00 00 00       	mov    ebx,0x1
 1000f48:	89 c1                	mov    ecx,eax
 1000f4a:	d3 e3                	shl    ebx,cl
 1000f4c:	89 d8                	mov    eax,ebx
 1000f4e:	09 c2                	or     edx,eax
 1000f50:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f53:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000f5a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f5d:	c1 e0 05             	shl    eax,0x5
 1000f60:	89 c2                	mov    edx,eax
 1000f62:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f65:	01 d0                	add    eax,edx
 1000f67:	83 c0 20             	add    eax,0x20
 1000f6a:	c1 e0 0c             	shl    eax,0xc
 1000f6d:	eb 14                	jmp    1000f83 <vmalloc+0x84>
 1000f6f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1000f73:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 1000f77:	7e 9f                	jle    1000f18 <vmalloc+0x19>
 1000f79:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000f7d:	83 7d f8 03          	cmp    DWORD PTR [ebp-0x8],0x3
 1000f81:	7e 8c                	jle    1000f0f <vmalloc+0x10>
 1000f83:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000f86:	c9                   	leave  
 1000f87:	c3                   	ret    

01000f88 <vmfree>:
 1000f88:	55                   	push   ebp
 1000f89:	89 e5                	mov    ebp,esp
 1000f8b:	53                   	push   ebx
 1000f8c:	83 ec 10             	sub    esp,0x10
 1000f8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000f92:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1000f98:	85 c0                	test   eax,eax
 1000f9a:	0f 48 c2             	cmovs  eax,edx
 1000f9d:	c1 f8 0c             	sar    eax,0xc
 1000fa0:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000fa3:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000fa6:	8d 50 1f             	lea    edx,[eax+0x1f]
 1000fa9:	85 c0                	test   eax,eax
 1000fab:	0f 48 c2             	cmovs  eax,edx
 1000fae:	c1 f8 05             	sar    eax,0x5
 1000fb1:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000fb4:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000fb7:	99                   	cdq    
 1000fb8:	c1 ea 1b             	shr    edx,0x1b
 1000fbb:	01 d0                	add    eax,edx
 1000fbd:	83 e0 1f             	and    eax,0x1f
 1000fc0:	29 d0                	sub    eax,edx
 1000fc2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000fc5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000fc8:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000fcf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000fd2:	bb 01 00 00 00       	mov    ebx,0x1
 1000fd7:	89 c1                	mov    ecx,eax
 1000fd9:	d3 e3                	shl    ebx,cl
 1000fdb:	89 d8                	mov    eax,ebx
 1000fdd:	f7 d0                	not    eax
 1000fdf:	21 c2                	and    edx,eax
 1000fe1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000fe4:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000feb:	90                   	nop
 1000fec:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000fef:	c9                   	leave  
 1000ff0:	c3                   	ret    

01000ff1 <page_err>:
 1000ff1:	55                   	push   ebp
 1000ff2:	89 e5                	mov    ebp,esp
 1000ff4:	53                   	push   ebx
 1000ff5:	83 ec 24             	sub    esp,0x24
 1000ff8:	fa                   	cli    
 1000ff9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1001000:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1001007:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
 100100a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100100d:	0f 20 d0             	mov    eax,cr2
 1001010:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1001013:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001016:	83 e0 01             	and    eax,0x1
 1001019:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 100101c:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 1001020:	0f 85 b7 00 00 00    	jne    10010dd <page_err+0xec>
 1001026:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100102d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001034:	0f 20 d8             	mov    eax,cr3
 1001037:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 100103a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100103d:	c1 e8 16             	shr    eax,0x16
 1001040:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001047:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100104a:	01 d0                	add    eax,edx
 100104c:	8b 00                	mov    eax,DWORD PTR [eax]
 100104e:	83 e0 01             	and    eax,0x1
 1001051:	85 c0                	test   eax,eax
 1001053:	75 24                	jne    1001079 <page_err+0x88>
 1001055:	e8 a5 fe ff ff       	call   1000eff <vmalloc>
 100105a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100105d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001060:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1001063:	c1 e8 16             	shr    eax,0x16
 1001066:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 100106d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001070:	01 c8                	add    eax,ecx
 1001072:	83 ca 05             	or     edx,0x5
 1001075:	89 10                	mov    DWORD PTR [eax],edx
 1001077:	eb 1c                	jmp    1001095 <page_err+0xa4>
 1001079:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100107c:	c1 e8 16             	shr    eax,0x16
 100107f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001086:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001089:	01 d0                	add    eax,edx
 100108b:	8b 00                	mov    eax,DWORD PTR [eax]
 100108d:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001092:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001095:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1001098:	25 ff ff 3f 00       	and    eax,0x3fffff
 100109d:	c1 e8 0c             	shr    eax,0xc
 10010a0:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10010a3:	e8 71 00 00 00       	call   1001119 <req_a_page>
 10010a8:	83 ec 0c             	sub    esp,0xc
 10010ab:	50                   	push   eax
 10010ac:	e8 c5 01 00 00       	call   1001276 <get_phyaddr>
 10010b1:	83 c4 10             	add    esp,0x10
 10010b4:	83 c8 05             	or     eax,0x5
 10010b7:	89 c1                	mov    ecx,eax
 10010b9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10010bc:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10010c3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010c6:	01 d0                	add    eax,edx
 10010c8:	8b 10                	mov    edx,DWORD PTR [eax]
 10010ca:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10010cd:	8d 1c 85 00 00 00 00 	lea    ebx,[eax*4+0x0]
 10010d4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010d7:	01 d8                	add    eax,ebx
 10010d9:	09 ca                	or     edx,ecx
 10010db:	89 10                	mov    DWORD PTR [eax],edx
 10010dd:	e8 17 22 00 00       	call   10032f9 <eoi>
 10010e2:	fb                   	sti    
 10010e3:	c9                   	leave  
 10010e4:	83 c4 04             	add    esp,0x4
 10010e7:	cf                   	iret   
 10010e8:	90                   	nop
 10010e9:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 10010ec:	c9                   	leave  
 10010ed:	c3                   	ret    

010010ee <init_memory>:
 10010ee:	55                   	push   ebp
 10010ef:	89 e5                	mov    ebp,esp
 10010f1:	83 ec 10             	sub    esp,0x10
 10010f4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10010fb:	eb 12                	jmp    100110f <init_memory+0x21>
 10010fd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001100:	c7 04 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],0xffffffff
 1001107:	ff ff ff ff 
 100110b:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100110f:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
 1001113:	7e e8                	jle    10010fd <init_memory+0xf>
 1001115:	90                   	nop
 1001116:	90                   	nop
 1001117:	c9                   	leave  
 1001118:	c3                   	ret    

01001119 <req_a_page>:
 1001119:	55                   	push   ebp
 100111a:	89 e5                	mov    ebp,esp
 100111c:	53                   	push   ebx
 100111d:	83 ec 10             	sub    esp,0x10
 1001120:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1001127:	e9 84 00 00 00       	jmp    10011b0 <req_a_page+0x97>
 100112c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001133:	eb 71                	jmp    10011a6 <req_a_page+0x8d>
 1001135:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001138:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 100113f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001142:	bb 01 00 00 00       	mov    ebx,0x1
 1001147:	89 c1                	mov    ecx,eax
 1001149:	d3 e3                	shl    ebx,cl
 100114b:	89 d8                	mov    eax,ebx
 100114d:	21 d0                	and    eax,edx
 100114f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1001152:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001155:	c1 e0 05             	shl    eax,0x5
 1001158:	89 c2                	mov    edx,eax
 100115a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100115d:	01 d0                	add    eax,edx
 100115f:	c1 e0 0c             	shl    eax,0xc
 1001162:	3d ff ff 0f 00       	cmp    eax,0xfffff
 1001167:	7e 39                	jle    10011a2 <req_a_page+0x89>
 1001169:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 100116d:	75 33                	jne    10011a2 <req_a_page+0x89>
 100116f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001172:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001179:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100117c:	bb 01 00 00 00       	mov    ebx,0x1
 1001181:	89 c1                	mov    ecx,eax
 1001183:	d3 e3                	shl    ebx,cl
 1001185:	89 d8                	mov    eax,ebx
 1001187:	09 c2                	or     edx,eax
 1001189:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100118c:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001193:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001196:	c1 e0 05             	shl    eax,0x5
 1001199:	89 c2                	mov    edx,eax
 100119b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100119e:	01 d0                	add    eax,edx
 10011a0:	eb 18                	jmp    10011ba <req_a_page+0xa1>
 10011a2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10011a6:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 10011aa:	7e 89                	jle    1001135 <req_a_page+0x1c>
 10011ac:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 10011b0:	83 7d f8 3f          	cmp    DWORD PTR [ebp-0x8],0x3f
 10011b4:	0f 8e 72 ff ff ff    	jle    100112c <req_a_page+0x13>
 10011ba:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 10011bd:	c9                   	leave  
 10011be:	c3                   	ret    

010011bf <free_page>:
 10011bf:	55                   	push   ebp
 10011c0:	89 e5                	mov    ebp,esp
 10011c2:	53                   	push   ebx
 10011c3:	83 ec 10             	sub    esp,0x10
 10011c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10011c9:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10011cf:	85 c0                	test   eax,eax
 10011d1:	0f 48 c2             	cmovs  eax,edx
 10011d4:	c1 f8 0c             	sar    eax,0xc
 10011d7:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10011da:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10011dd:	8d 50 1f             	lea    edx,[eax+0x1f]
 10011e0:	85 c0                	test   eax,eax
 10011e2:	0f 48 c2             	cmovs  eax,edx
 10011e5:	c1 f8 05             	sar    eax,0x5
 10011e8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10011eb:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10011ee:	99                   	cdq    
 10011ef:	c1 ea 1b             	shr    edx,0x1b
 10011f2:	01 d0                	add    eax,edx
 10011f4:	83 e0 1f             	and    eax,0x1f
 10011f7:	29 d0                	sub    eax,edx
 10011f9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10011fc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10011ff:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001206:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001209:	bb 01 00 00 00       	mov    ebx,0x1
 100120e:	89 c1                	mov    ecx,eax
 1001210:	d3 e3                	shl    ebx,cl
 1001212:	89 d8                	mov    eax,ebx
 1001214:	f7 d0                	not    eax
 1001216:	21 c2                	and    edx,eax
 1001218:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100121b:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001222:	90                   	nop
 1001223:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001226:	c9                   	leave  
 1001227:	c3                   	ret    

01001228 <check_page>:
 1001228:	55                   	push   ebp
 1001229:	89 e5                	mov    ebp,esp
 100122b:	53                   	push   ebx
 100122c:	83 ec 10             	sub    esp,0x10
 100122f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001232:	8d 50 1f             	lea    edx,[eax+0x1f]
 1001235:	85 c0                	test   eax,eax
 1001237:	0f 48 c2             	cmovs  eax,edx
 100123a:	c1 f8 05             	sar    eax,0x5
 100123d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1001240:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001243:	99                   	cdq    
 1001244:	c1 ea 1b             	shr    edx,0x1b
 1001247:	01 d0                	add    eax,edx
 1001249:	83 e0 1f             	and    eax,0x1f
 100124c:	29 d0                	sub    eax,edx
 100124e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001251:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001254:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 100125b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100125e:	bb 01 00 00 00       	mov    ebx,0x1
 1001263:	89 c1                	mov    ecx,eax
 1001265:	d3 e3                	shl    ebx,cl
 1001267:	89 d8                	mov    eax,ebx
 1001269:	21 d0                	and    eax,edx
 100126b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100126e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001271:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001274:	c9                   	leave  
 1001275:	c3                   	ret    

01001276 <get_phyaddr>:
 1001276:	55                   	push   ebp
 1001277:	89 e5                	mov    ebp,esp
 1001279:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100127c:	c1 e0 0c             	shl    eax,0xc
 100127f:	5d                   	pop    ebp
 1001280:	c3                   	ret    

01001281 <set_page_item>:
 1001281:	55                   	push   ebp
 1001282:	89 e5                	mov    ebp,esp
 1001284:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001287:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100128d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001290:	8b 10                	mov    edx,DWORD PTR [eax]
 1001292:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001295:	25 00 f0 ff ff       	and    eax,0xfffff000
 100129a:	09 c2                	or     edx,eax
 100129c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100129f:	89 10                	mov    DWORD PTR [eax],edx
 10012a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012a4:	8b 10                	mov    edx,DWORD PTR [eax]
 10012a6:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10012a9:	09 c2                	or     edx,eax
 10012ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012ae:	89 10                	mov    DWORD PTR [eax],edx
 10012b0:	90                   	nop
 10012b1:	5d                   	pop    ebp
 10012b2:	c3                   	ret    

010012b3 <req_page_at>:
 10012b3:	55                   	push   ebp
 10012b4:	89 e5                	mov    ebp,esp
 10012b6:	53                   	push   ebx
 10012b7:	83 ec 14             	sub    esp,0x14
 10012ba:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 10012be:	75 13                	jne    10012d3 <req_page_at+0x20>
 10012c0:	e8 54 fe ff ff       	call   1001119 <req_a_page>
 10012c5:	50                   	push   eax
 10012c6:	e8 ab ff ff ff       	call   1001276 <get_phyaddr>
 10012cb:	83 c4 04             	add    esp,0x4
 10012ce:	e9 90 00 00 00       	jmp    1001363 <req_page_at+0xb0>
 10012d3:	83 ec 08             	sub    esp,0x8
 10012d6:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10012d9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10012dc:	e8 28 01 00 00       	call   1001409 <is_pgs_ava>
 10012e1:	83 c4 10             	add    esp,0x10
 10012e4:	85 c0                	test   eax,eax
 10012e6:	75 07                	jne    10012ef <req_page_at+0x3c>
 10012e8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10012ed:	eb 74                	jmp    1001363 <req_page_at+0xb0>
 10012ef:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012f2:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10012f8:	85 c0                	test   eax,eax
 10012fa:	0f 48 c2             	cmovs  eax,edx
 10012fd:	c1 f8 0c             	sar    eax,0xc
 1001300:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1001303:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001306:	8d 50 1f             	lea    edx,[eax+0x1f]
 1001309:	85 c0                	test   eax,eax
 100130b:	0f 48 c2             	cmovs  eax,edx
 100130e:	c1 f8 05             	sar    eax,0x5
 1001311:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1001314:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001317:	99                   	cdq    
 1001318:	c1 ea 1b             	shr    edx,0x1b
 100131b:	01 d0                	add    eax,edx
 100131d:	83 e0 1f             	and    eax,0x1f
 1001320:	29 d0                	sub    eax,edx
 1001322:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1001325:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100132c:	eb 28                	jmp    1001356 <req_page_at+0xa3>
 100132e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001331:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001338:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 100133b:	bb 01 00 00 00       	mov    ebx,0x1
 1001340:	89 c1                	mov    ecx,eax
 1001342:	d3 e3                	shl    ebx,cl
 1001344:	89 d8                	mov    eax,ebx
 1001346:	09 c2                	or     edx,eax
 1001348:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100134b:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001352:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001356:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001359:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 100135c:	7c d0                	jl     100132e <req_page_at+0x7b>
 100135e:	b8 00 00 00 00       	mov    eax,0x0
 1001363:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001366:	c9                   	leave  
 1001367:	c3                   	ret    

01001368 <chk_vm>:
 1001368:	55                   	push   ebp
 1001369:	89 e5                	mov    ebp,esp
 100136b:	83 ec 10             	sub    esp,0x10
 100136e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001375:	0f 20 d8             	mov    eax,cr3
 1001378:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100137b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100137e:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 1001384:	85 c0                	test   eax,eax
 1001386:	0f 48 c2             	cmovs  eax,edx
 1001389:	c1 f8 16             	sar    eax,0x16
 100138c:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001393:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001396:	01 d0                	add    eax,edx
 1001398:	8b 00                	mov    eax,DWORD PTR [eax]
 100139a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100139f:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10013a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10013a5:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 10013ab:	85 c0                	test   eax,eax
 10013ad:	0f 48 c2             	cmovs  eax,edx
 10013b0:	c1 f8 16             	sar    eax,0x16
 10013b3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10013ba:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10013bd:	01 d0                	add    eax,edx
 10013bf:	8b 00                	mov    eax,DWORD PTR [eax]
 10013c1:	83 e0 01             	and    eax,0x1
 10013c4:	85 c0                	test   eax,eax
 10013c6:	74 33                	je     10013fb <chk_vm+0x93>
 10013c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10013cb:	99                   	cdq    
 10013cc:	c1 ea 0a             	shr    edx,0xa
 10013cf:	01 d0                	add    eax,edx
 10013d1:	25 ff ff 3f 00       	and    eax,0x3fffff
 10013d6:	29 d0                	sub    eax,edx
 10013d8:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10013de:	85 c0                	test   eax,eax
 10013e0:	0f 48 c2             	cmovs  eax,edx
 10013e3:	c1 f8 0c             	sar    eax,0xc
 10013e6:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10013ed:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10013f0:	01 d0                	add    eax,edx
 10013f2:	8b 00                	mov    eax,DWORD PTR [eax]
 10013f4:	83 e0 01             	and    eax,0x1
 10013f7:	85 c0                	test   eax,eax
 10013f9:	75 07                	jne    1001402 <chk_vm+0x9a>
 10013fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001400:	eb 05                	jmp    1001407 <chk_vm+0x9f>
 1001402:	b8 00 00 00 00       	mov    eax,0x0
 1001407:	c9                   	leave  
 1001408:	c3                   	ret    

01001409 <is_pgs_ava>:
 1001409:	55                   	push   ebp
 100140a:	89 e5                	mov    ebp,esp
 100140c:	83 ec 10             	sub    esp,0x10
 100140f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001412:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1001418:	85 c0                	test   eax,eax
 100141a:	0f 48 c2             	cmovs  eax,edx
 100141d:	c1 f8 0c             	sar    eax,0xc
 1001420:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1001423:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100142a:	eb 20                	jmp    100144c <is_pgs_ava+0x43>
 100142c:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 100142f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001432:	01 d0                	add    eax,edx
 1001434:	50                   	push   eax
 1001435:	e8 ee fd ff ff       	call   1001228 <check_page>
 100143a:	83 c4 04             	add    esp,0x4
 100143d:	85 c0                	test   eax,eax
 100143f:	74 07                	je     1001448 <is_pgs_ava+0x3f>
 1001441:	b8 00 00 00 00       	mov    eax,0x0
 1001446:	eb 11                	jmp    1001459 <is_pgs_ava+0x50>
 1001448:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100144c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100144f:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 1001452:	7c d8                	jl     100142c <is_pgs_ava+0x23>
 1001454:	b8 01 00 00 00       	mov    eax,0x1
 1001459:	c9                   	leave  
 100145a:	c3                   	ret    

0100145b <setup_sys_vol>:
 100145b:	55                   	push   ebp
 100145c:	89 e5                	mov    ebp,esp
 100145e:	c6 05 40 02 40 00 43 	mov    BYTE PTR ds:0x400240,0x43
 1001465:	c6 05 41 02 40 00 00 	mov    BYTE PTR ds:0x400241,0x0
 100146c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100146f:	a3 48 02 40 00       	mov    ds:0x400248,eax
 1001474:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001477:	a3 4c 02 40 00       	mov    ds:0x40024c,eax
 100147c:	c7 05 50 02 40 00 01 	mov    DWORD PTR ds:0x400250,0x1
 1001483:	00 00 00 
 1001486:	b8 00 00 00 00       	mov    eax,0x0
 100148b:	5d                   	pop    ebp
 100148c:	c3                   	ret    

0100148d <sys_mkfifo>:
 100148d:	55                   	push   ebp
 100148e:	89 e5                	mov    ebp,esp
 1001490:	83 ec 18             	sub    esp,0x18
 1001493:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100149a:	eb 30                	jmp    10014cc <sys_mkfifo+0x3f>
 100149c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100149f:	c1 e0 04             	shl    eax,0x4
 10014a2:	05 6c 17 40 00       	add    eax,0x40176c
 10014a7:	8b 00                	mov    eax,DWORD PTR [eax]
 10014a9:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 10014ac:	75 1a                	jne    10014c8 <sys_mkfifo+0x3b>
 10014ae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10014b1:	c1 e0 04             	shl    eax,0x4
 10014b4:	05 68 17 40 00       	add    eax,0x401768
 10014b9:	8b 00                	mov    eax,DWORD PTR [eax]
 10014bb:	83 f8 01             	cmp    eax,0x1
 10014be:	75 08                	jne    10014c8 <sys_mkfifo+0x3b>
 10014c0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10014c3:	e9 8a 00 00 00       	jmp    1001552 <sys_mkfifo+0xc5>
 10014c8:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10014cc:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 10014d0:	7e ca                	jle    100149c <sys_mkfifo+0xf>
 10014d2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10014d9:	eb 6c                	jmp    1001547 <sys_mkfifo+0xba>
 10014db:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10014de:	c1 e0 04             	shl    eax,0x4
 10014e1:	05 68 17 40 00       	add    eax,0x401768
 10014e6:	8b 00                	mov    eax,DWORD PTR [eax]
 10014e8:	85 c0                	test   eax,eax
 10014ea:	75 57                	jne    1001543 <sys_mkfifo+0xb6>
 10014ec:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10014ef:	c1 e0 04             	shl    eax,0x4
 10014f2:	05 68 17 40 00       	add    eax,0x401768
 10014f7:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 10014fd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001500:	c1 e0 04             	shl    eax,0x4
 1001503:	8d 90 6c 17 40 00    	lea    edx,[eax+0x40176c]
 1001509:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100150c:	89 02                	mov    DWORD PTR [edx],eax
 100150e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001511:	c1 e0 04             	shl    eax,0x4
 1001514:	05 64 17 40 00       	add    eax,0x401764
 1001519:	c7 00 00 10 00 00    	mov    DWORD PTR [eax],0x1000
 100151f:	e8 f5 fb ff ff       	call   1001119 <req_a_page>
 1001524:	83 ec 0c             	sub    esp,0xc
 1001527:	50                   	push   eax
 1001528:	e8 49 fd ff ff       	call   1001276 <get_phyaddr>
 100152d:	83 c4 10             	add    esp,0x10
 1001530:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001533:	c1 e2 04             	shl    edx,0x4
 1001536:	81 c2 60 17 40 00    	add    edx,0x401760
 100153c:	89 02                	mov    DWORD PTR [edx],eax
 100153e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001541:	eb 0f                	jmp    1001552 <sys_mkfifo+0xc5>
 1001543:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001547:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 100154b:	7e 8e                	jle    10014db <sys_mkfifo+0x4e>
 100154d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001552:	c9                   	leave  
 1001553:	c3                   	ret    

01001554 <sys_rmfifo>:
 1001554:	55                   	push   ebp
 1001555:	89 e5                	mov    ebp,esp
 1001557:	83 ec 10             	sub    esp,0x10
 100155a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001561:	eb 3e                	jmp    10015a1 <sys_rmfifo+0x4d>
 1001563:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001566:	c1 e0 04             	shl    eax,0x4
 1001569:	05 6c 17 40 00       	add    eax,0x40176c
 100156e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001570:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001573:	75 28                	jne    100159d <sys_rmfifo+0x49>
 1001575:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001578:	c1 e0 04             	shl    eax,0x4
 100157b:	05 68 17 40 00       	add    eax,0x401768
 1001580:	8b 00                	mov    eax,DWORD PTR [eax]
 1001582:	83 f8 01             	cmp    eax,0x1
 1001585:	75 16                	jne    100159d <sys_rmfifo+0x49>
 1001587:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100158a:	c1 e0 04             	shl    eax,0x4
 100158d:	05 68 17 40 00       	add    eax,0x401768
 1001592:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1001598:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100159b:	eb 0f                	jmp    10015ac <sys_rmfifo+0x58>
 100159d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10015a1:	83 7d fc 0f          	cmp    DWORD PTR [ebp-0x4],0xf
 10015a5:	7e bc                	jle    1001563 <sys_rmfifo+0xf>
 10015a7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10015ac:	c9                   	leave  
 10015ad:	c3                   	ret    

010015ae <free_vol>:
 10015ae:	55                   	push   ebp
 10015af:	89 e5                	mov    ebp,esp
 10015b1:	c7 05 50 02 40 00 00 	mov    DWORD PTR ds:0x400250,0x0
 10015b8:	00 00 00 
 10015bb:	b8 00 00 00 00       	mov    eax,0x0
 10015c0:	5d                   	pop    ebp
 10015c1:	c3                   	ret    

010015c2 <reg_vol>:
 10015c2:	55                   	push   ebp
 10015c3:	89 e5                	mov    ebp,esp
 10015c5:	83 ec 18             	sub    esp,0x18
 10015c8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10015cf:	e9 a6 00 00 00       	jmp    100167a <reg_vol+0xb8>
 10015d4:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10015d7:	89 d0                	mov    eax,edx
 10015d9:	c1 e0 02             	shl    eax,0x2
 10015dc:	01 d0                	add    eax,edx
 10015de:	c1 e0 02             	shl    eax,0x2
 10015e1:	05 50 02 40 00       	add    eax,0x400250
 10015e6:	8b 00                	mov    eax,DWORD PTR [eax]
 10015e8:	85 c0                	test   eax,eax
 10015ea:	0f 85 86 00 00 00    	jne    1001676 <reg_vol+0xb4>
 10015f0:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10015f3:	89 d0                	mov    eax,edx
 10015f5:	c1 e0 02             	shl    eax,0x2
 10015f8:	01 d0                	add    eax,edx
 10015fa:	c1 e0 02             	shl    eax,0x2
 10015fd:	05 50 02 40 00       	add    eax,0x400250
 1001602:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001608:	83 ec 0c             	sub    esp,0xc
 100160b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100160e:	e8 87 0d 00 00       	call   100239a <get_drv>
 1001613:	83 c4 10             	add    esp,0x10
 1001616:	89 c2                	mov    edx,eax
 1001618:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 100161b:	89 c8                	mov    eax,ecx
 100161d:	c1 e0 02             	shl    eax,0x2
 1001620:	01 c8                	add    eax,ecx
 1001622:	c1 e0 02             	shl    eax,0x2
 1001625:	05 4c 02 40 00       	add    eax,0x40024c
 100162a:	89 10                	mov    DWORD PTR [eax],edx
 100162c:	83 ec 0c             	sub    esp,0xc
 100162f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001632:	e8 63 0d 00 00       	call   100239a <get_drv>
 1001637:	83 c4 10             	add    esp,0x10
 100163a:	89 c2                	mov    edx,eax
 100163c:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 100163f:	89 c8                	mov    eax,ecx
 1001641:	c1 e0 02             	shl    eax,0x2
 1001644:	01 c8                	add    eax,ecx
 1001646:	c1 e0 02             	shl    eax,0x2
 1001649:	05 48 02 40 00       	add    eax,0x400248
 100164e:	89 10                	mov    DWORD PTR [eax],edx
 1001650:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001653:	89 d0                	mov    eax,edx
 1001655:	c1 e0 02             	shl    eax,0x2
 1001658:	01 d0                	add    eax,edx
 100165a:	c1 e0 02             	shl    eax,0x2
 100165d:	05 40 02 40 00       	add    eax,0x400240
 1001662:	83 ec 08             	sub    esp,0x8
 1001665:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001668:	50                   	push   eax
 1001669:	e8 a5 53 00 00       	call   1006a13 <strcpy>
 100166e:	83 c4 10             	add    esp,0x10
 1001671:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001674:	eb 13                	jmp    1001689 <reg_vol+0xc7>
 1001676:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100167a:	83 7d f4 19          	cmp    DWORD PTR [ebp-0xc],0x19
 100167e:	0f 8e 50 ff ff ff    	jle    10015d4 <reg_vol+0x12>
 1001684:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001689:	c9                   	leave  
 100168a:	c3                   	ret    

0100168b <sys_open>:
 100168b:	55                   	push   ebp
 100168c:	89 e5                	mov    ebp,esp
 100168e:	57                   	push   edi
 100168f:	56                   	push   esi
 1001690:	53                   	push   ebx
 1001691:	81 ec 0c 01 00 00    	sub    esp,0x10c
 1001697:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100169e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 10016a5:	eb 19                	jmp    10016c0 <sys_open+0x35>
 10016a7:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016ad:	01 d0                	add    eax,edx
 10016af:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016b2:	8d 4d be             	lea    ecx,[ebp-0x42]
 10016b5:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016b8:	01 ca                	add    edx,ecx
 10016ba:	88 02                	mov    BYTE PTR [edx],al
 10016bc:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10016c0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016c6:	01 d0                	add    eax,edx
 10016c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016cb:	3c 2f                	cmp    al,0x2f
 10016cd:	74 06                	je     10016d5 <sys_open+0x4a>
 10016cf:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 10016d3:	7e d2                	jle    10016a7 <sys_open+0x1c>
 10016d5:	8d 55 be             	lea    edx,[ebp-0x42]
 10016d8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016db:	01 d0                	add    eax,edx
 10016dd:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10016e0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016e3:	8d 50 01             	lea    edx,[eax+0x1]
 10016e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016e9:	01 d0                	add    eax,edx
 10016eb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016ee:	84 c0                	test   al,al
 10016f0:	75 0a                	jne    10016fc <sys_open+0x71>
 10016f2:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 10016f7:	e9 2d 02 00 00       	jmp    1001929 <sys_open+0x29e>
 10016fc:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016ff:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1001702:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001709:	eb 43                	jmp    100174e <sys_open+0xc3>
 100170b:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100170e:	89 d0                	mov    eax,edx
 1001710:	c1 e0 02             	shl    eax,0x2
 1001713:	01 d0                	add    eax,edx
 1001715:	c1 e0 02             	shl    eax,0x2
 1001718:	05 50 02 40 00       	add    eax,0x400250
 100171d:	8b 00                	mov    eax,DWORD PTR [eax]
 100171f:	85 c0                	test   eax,eax
 1001721:	74 27                	je     100174a <sys_open+0xbf>
 1001723:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001726:	89 d0                	mov    eax,edx
 1001728:	c1 e0 02             	shl    eax,0x2
 100172b:	01 d0                	add    eax,edx
 100172d:	c1 e0 02             	shl    eax,0x2
 1001730:	8d 90 40 02 40 00    	lea    edx,[eax+0x400240]
 1001736:	83 ec 08             	sub    esp,0x8
 1001739:	8d 45 be             	lea    eax,[ebp-0x42]
 100173c:	50                   	push   eax
 100173d:	52                   	push   edx
 100173e:	e8 2e 54 00 00       	call   1006b71 <strcmp>
 1001743:	83 c4 10             	add    esp,0x10
 1001746:	85 c0                	test   eax,eax
 1001748:	74 0c                	je     1001756 <sys_open+0xcb>
 100174a:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100174e:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 1001752:	7e b7                	jle    100170b <sys_open+0x80>
 1001754:	eb 01                	jmp    1001757 <sys_open+0xcc>
 1001756:	90                   	nop
 1001757:	83 7d e4 1a          	cmp    DWORD PTR [ebp-0x1c],0x1a
 100175b:	75 0a                	jne    1001767 <sys_open+0xdc>
 100175d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001762:	e9 c2 01 00 00       	jmp    1001929 <sys_open+0x29e>
 1001767:	8d 85 36 ff ff ff    	lea    eax,[ebp-0xca]
 100176d:	b9 88 00 00 00       	mov    ecx,0x88
 1001772:	bb 00 00 00 00       	mov    ebx,0x0
 1001777:	89 18                	mov    DWORD PTR [eax],ebx
 1001779:	89 5c 08 fc          	mov    DWORD PTR [eax+ecx*1-0x4],ebx
 100177d:	8d 50 04             	lea    edx,[eax+0x4]
 1001780:	83 e2 fc             	and    edx,0xfffffffc
 1001783:	29 d0                	sub    eax,edx
 1001785:	01 c1                	add    ecx,eax
 1001787:	83 e1 fc             	and    ecx,0xfffffffc
 100178a:	c1 e9 02             	shr    ecx,0x2
 100178d:	89 d7                	mov    edi,edx
 100178f:	89 d8                	mov    eax,ebx
 1001791:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001793:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1001796:	8d 50 01             	lea    edx,[eax+0x1]
 1001799:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100179c:	01 d0                	add    eax,edx
 100179e:	89 85 56 ff ff ff    	mov    DWORD PTR [ebp-0xaa],eax
 10017a4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10017a7:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 10017aa:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10017ad:	89 d0                	mov    eax,edx
 10017af:	c1 e0 02             	shl    eax,0x2
 10017b2:	01 d0                	add    eax,edx
 10017b4:	c1 e0 02             	shl    eax,0x2
 10017b7:	05 4c 02 40 00       	add    eax,0x40024c
 10017bc:	8b 00                	mov    eax,DWORD PTR [eax]
 10017be:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 10017c1:	83 ec 0c             	sub    esp,0xc
 10017c4:	8d 95 36 ff ff ff    	lea    edx,[ebp-0xca]
 10017ca:	52                   	push   edx
 10017cb:	ff d0                	call   eax
 10017cd:	83 c4 10             	add    esp,0x10
 10017d0:	83 f8 ff             	cmp    eax,0xffffffff
 10017d3:	75 3f                	jne    1001814 <sys_open+0x189>
 10017d5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10017d8:	83 e0 02             	and    eax,0x2
 10017db:	85 c0                	test   eax,eax
 10017dd:	74 2b                	je     100180a <sys_open+0x17f>
 10017df:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10017e2:	89 d0                	mov    eax,edx
 10017e4:	c1 e0 02             	shl    eax,0x2
 10017e7:	01 d0                	add    eax,edx
 10017e9:	c1 e0 02             	shl    eax,0x2
 10017ec:	05 4c 02 40 00       	add    eax,0x40024c
 10017f1:	8b 00                	mov    eax,DWORD PTR [eax]
 10017f3:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 10017f6:	83 ec 0c             	sub    esp,0xc
 10017f9:	8d 95 36 ff ff ff    	lea    edx,[ebp-0xca]
 10017ff:	52                   	push   edx
 1001800:	ff d0                	call   eax
 1001802:	83 c4 10             	add    esp,0x10
 1001805:	e9 1f 01 00 00       	jmp    1001929 <sys_open+0x29e>
 100180a:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100180f:	e9 15 01 00 00       	jmp    1001929 <sys_open+0x29e>
 1001814:	8d 85 e8 fe ff ff    	lea    eax,[ebp-0x118]
 100181a:	8d 95 5a ff ff ff    	lea    edx,[ebp-0xa6]
 1001820:	b9 13 00 00 00       	mov    ecx,0x13
 1001825:	89 c7                	mov    edi,eax
 1001827:	89 d6                	mov    esi,edx
 1001829:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 100182b:	c7 45 e0 ff ff ff ff 	mov    DWORD PTR [ebp-0x20],0xffffffff
 1001832:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001839:	eb 3d                	jmp    1001878 <sys_open+0x1ed>
 100183b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100183e:	6b c0 4c             	imul   eax,eax,0x4c
 1001841:	05 68 04 40 00       	add    eax,0x400468
 1001846:	8b 00                	mov    eax,DWORD PTR [eax]
 1001848:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 100184b:	75 27                	jne    1001874 <sys_open+0x1e9>
 100184d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001850:	6b c0 4c             	imul   eax,eax,0x4c
 1001853:	05 74 04 40 00       	add    eax,0x400474
 1001858:	8b 10                	mov    edx,DWORD PTR [eax]
 100185a:	8b 85 fc fe ff ff    	mov    eax,DWORD PTR [ebp-0x104]
 1001860:	39 c2                	cmp    edx,eax
 1001862:	75 10                	jne    1001874 <sys_open+0x1e9>
 1001864:	83 7d 0c 02          	cmp    DWORD PTR [ebp+0xc],0x2
 1001868:	75 0a                	jne    1001874 <sys_open+0x1e9>
 100186a:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100186f:	e9 b5 00 00 00       	jmp    1001929 <sys_open+0x29e>
 1001874:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1001878:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 100187c:	7e bd                	jle    100183b <sys_open+0x1b0>
 100187e:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001885:	eb 1d                	jmp    10018a4 <sys_open+0x219>
 1001887:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100188a:	6b c0 4c             	imul   eax,eax,0x4c
 100188d:	05 64 04 40 00       	add    eax,0x400464
 1001892:	8b 00                	mov    eax,DWORD PTR [eax]
 1001894:	85 c0                	test   eax,eax
 1001896:	75 08                	jne    10018a0 <sys_open+0x215>
 1001898:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100189b:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 100189e:	eb 0a                	jmp    10018aa <sys_open+0x21f>
 10018a0:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10018a4:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 10018a8:	7e dd                	jle    1001887 <sys_open+0x1fc>
 10018aa:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 10018ae:	75 07                	jne    10018b7 <sys_open+0x22c>
 10018b0:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10018b5:	eb 72                	jmp    1001929 <sys_open+0x29e>
 10018b7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10018ba:	6b c0 4c             	imul   eax,eax,0x4c
 10018bd:	05 60 04 40 00       	add    eax,0x400460
 10018c2:	89 c3                	mov    ebx,eax
 10018c4:	8d 85 e8 fe ff ff    	lea    eax,[ebp-0x118]
 10018ca:	ba 13 00 00 00       	mov    edx,0x13
 10018cf:	89 df                	mov    edi,ebx
 10018d1:	89 c6                	mov    esi,eax
 10018d3:	89 d1                	mov    ecx,edx
 10018d5:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10018d7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10018da:	6b c0 4c             	imul   eax,eax,0x4c
 10018dd:	8d 90 60 04 40 00    	lea    edx,[eax+0x400460]
 10018e3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10018e6:	89 02                	mov    DWORD PTR [edx],eax
 10018e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10018eb:	6b c0 4c             	imul   eax,eax,0x4c
 10018ee:	05 6c 04 40 00       	add    eax,0x40046c
 10018f3:	8b 00                	mov    eax,DWORD PTR [eax]
 10018f5:	8d 50 01             	lea    edx,[eax+0x1]
 10018f8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10018fb:	6b c0 4c             	imul   eax,eax,0x4c
 10018fe:	05 6c 04 40 00       	add    eax,0x40046c
 1001903:	89 10                	mov    DWORD PTR [eax],edx
 1001905:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1001908:	6b c0 4c             	imul   eax,eax,0x4c
 100190b:	05 60 04 40 00       	add    eax,0x400460
 1001910:	83 ec 0c             	sub    esp,0xc
 1001913:	50                   	push   eax
 1001914:	e8 fd 15 00 00       	call   1002f16 <add_proc_openf>
 1001919:	83 c4 10             	add    esp,0x10
 100191c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100191f:	6b c0 4c             	imul   eax,eax,0x4c
 1001922:	05 60 04 40 00       	add    eax,0x400460
 1001927:	8b 00                	mov    eax,DWORD PTR [eax]
 1001929:	8d 65 f4             	lea    esp,[ebp-0xc]
 100192c:	5b                   	pop    ebx
 100192d:	5e                   	pop    esi
 100192e:	5f                   	pop    edi
 100192f:	5d                   	pop    ebp
 1001930:	c3                   	ret    

01001931 <sys_close>:
 1001931:	55                   	push   ebp
 1001932:	89 e5                	mov    ebp,esp
 1001934:	83 ec 10             	sub    esp,0x10
 1001937:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100193e:	eb 3a                	jmp    100197a <sys_close+0x49>
 1001940:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001943:	6b c0 4c             	imul   eax,eax,0x4c
 1001946:	05 60 04 40 00       	add    eax,0x400460
 100194b:	8b 00                	mov    eax,DWORD PTR [eax]
 100194d:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001950:	75 24                	jne    1001976 <sys_close+0x45>
 1001952:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001955:	6b c0 4c             	imul   eax,eax,0x4c
 1001958:	05 6c 04 40 00       	add    eax,0x40046c
 100195d:	8b 00                	mov    eax,DWORD PTR [eax]
 100195f:	8d 50 ff             	lea    edx,[eax-0x1]
 1001962:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001965:	6b c0 4c             	imul   eax,eax,0x4c
 1001968:	05 6c 04 40 00       	add    eax,0x40046c
 100196d:	89 10                	mov    DWORD PTR [eax],edx
 100196f:	b8 00 00 00 00       	mov    eax,0x0
 1001974:	eb 0f                	jmp    1001985 <sys_close+0x54>
 1001976:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100197a:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 100197e:	7e c0                	jle    1001940 <sys_close+0xf>
 1001980:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001985:	c9                   	leave  
 1001986:	c3                   	ret    

01001987 <sys_write>:
 1001987:	55                   	push   ebp
 1001988:	89 e5                	mov    ebp,esp
 100198a:	57                   	push   edi
 100198b:	81 ec 94 00 00 00    	sub    esp,0x94
 1001991:	83 ec 0c             	sub    esp,0xc
 1001994:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001997:	e8 80 01 00 00       	call   1001b1c <get_vfs_entry>
 100199c:	83 c4 10             	add    esp,0x10
 100199f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10019a2:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 10019a6:	75 07                	jne    10019af <sys_write+0x28>
 10019a8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10019ad:	eb 5b                	jmp    1001a0a <sys_write+0x83>
 10019af:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
 10019b5:	b8 00 00 00 00       	mov    eax,0x0
 10019ba:	b9 22 00 00 00       	mov    ecx,0x22
 10019bf:	89 d7                	mov    edi,edx
 10019c1:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10019c3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10019c6:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 10019cc:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10019cf:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 10019d2:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10019d5:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 10019d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10019db:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 10019de:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10019e1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10019e4:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10019e7:	89 d0                	mov    eax,edx
 10019e9:	c1 e0 02             	shl    eax,0x2
 10019ec:	01 d0                	add    eax,edx
 10019ee:	c1 e0 02             	shl    eax,0x2
 10019f1:	05 4c 02 40 00       	add    eax,0x40024c
 10019f6:	8b 00                	mov    eax,DWORD PTR [eax]
 10019f8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 10019fb:	83 ec 0c             	sub    esp,0xc
 10019fe:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
 1001a04:	52                   	push   edx
 1001a05:	ff d0                	call   eax
 1001a07:	83 c4 10             	add    esp,0x10
 1001a0a:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1001a0d:	c9                   	leave  
 1001a0e:	c3                   	ret    

01001a0f <sys_read>:
 1001a0f:	55                   	push   ebp
 1001a10:	89 e5                	mov    ebp,esp
 1001a12:	57                   	push   edi
 1001a13:	56                   	push   esi
 1001a14:	53                   	push   ebx
 1001a15:	81 ec 9c 00 00 00    	sub    esp,0x9c
 1001a1b:	83 ec 0c             	sub    esp,0xc
 1001a1e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001a21:	e8 f6 00 00 00       	call   1001b1c <get_vfs_entry>
 1001a26:	83 c4 10             	add    esp,0x10
 1001a29:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001a2c:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1001a30:	75 07                	jne    1001a39 <sys_read+0x2a>
 1001a32:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001a37:	eb 76                	jmp    1001aaf <sys_read+0xa0>
 1001a39:	8d 95 5c ff ff ff    	lea    edx,[ebp-0xa4]
 1001a3f:	b8 00 00 00 00       	mov    eax,0x0
 1001a44:	b9 22 00 00 00       	mov    ecx,0x22
 1001a49:	89 d7                	mov    edi,edx
 1001a4b:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001a4d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001a50:	89 85 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],eax
 1001a56:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001a59:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 1001a5f:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1001a62:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 1001a68:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001a6b:	8d 45 80             	lea    eax,[ebp-0x80]
 1001a6e:	89 d3                	mov    ebx,edx
 1001a70:	ba 13 00 00 00       	mov    edx,0x13
 1001a75:	89 c7                	mov    edi,eax
 1001a77:	89 de                	mov    esi,ebx
 1001a79:	89 d1                	mov    ecx,edx
 1001a7b:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001a7d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001a80:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001a83:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1001a86:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001a89:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1001a8c:	89 d0                	mov    eax,edx
 1001a8e:	c1 e0 02             	shl    eax,0x2
 1001a91:	01 d0                	add    eax,edx
 1001a93:	c1 e0 02             	shl    eax,0x2
 1001a96:	05 4c 02 40 00       	add    eax,0x40024c
 1001a9b:	8b 00                	mov    eax,DWORD PTR [eax]
 1001a9d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1001aa0:	83 ec 0c             	sub    esp,0xc
 1001aa3:	8d 95 5c ff ff ff    	lea    edx,[ebp-0xa4]
 1001aa9:	52                   	push   edx
 1001aaa:	ff d0                	call   eax
 1001aac:	83 c4 10             	add    esp,0x10
 1001aaf:	8d 65 f4             	lea    esp,[ebp-0xc]
 1001ab2:	5b                   	pop    ebx
 1001ab3:	5e                   	pop    esi
 1001ab4:	5f                   	pop    edi
 1001ab5:	5d                   	pop    ebp
 1001ab6:	c3                   	ret    

01001ab7 <sys_seek>:
 1001ab7:	55                   	push   ebp
 1001ab8:	89 e5                	mov    ebp,esp
 1001aba:	83 ec 18             	sub    esp,0x18
 1001abd:	83 ec 0c             	sub    esp,0xc
 1001ac0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001ac3:	e8 54 00 00 00       	call   1001b1c <get_vfs_entry>
 1001ac8:	83 c4 10             	add    esp,0x10
 1001acb:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001ace:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001ad2:	75 07                	jne    1001adb <sys_seek+0x24>
 1001ad4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001ad9:	eb 13                	jmp    1001aee <sys_seek+0x37>
 1001adb:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1001ade:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001ae1:	01 c2                	add    edx,eax
 1001ae3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001ae6:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
 1001ae9:	b8 00 00 00 00       	mov    eax,0x0
 1001aee:	c9                   	leave  
 1001aef:	c3                   	ret    

01001af0 <sys_tell>:
 1001af0:	55                   	push   ebp
 1001af1:	89 e5                	mov    ebp,esp
 1001af3:	83 ec 18             	sub    esp,0x18
 1001af6:	83 ec 0c             	sub    esp,0xc
 1001af9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001afc:	e8 1b 00 00 00       	call   1001b1c <get_vfs_entry>
 1001b01:	83 c4 10             	add    esp,0x10
 1001b04:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001b07:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001b0b:	75 07                	jne    1001b14 <sys_tell+0x24>
 1001b0d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001b12:	eb 06                	jmp    1001b1a <sys_tell+0x2a>
 1001b14:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001b17:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001b1a:	c9                   	leave  
 1001b1b:	c3                   	ret    

01001b1c <get_vfs_entry>:
 1001b1c:	55                   	push   ebp
 1001b1d:	89 e5                	mov    ebp,esp
 1001b1f:	83 ec 10             	sub    esp,0x10
 1001b22:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001b29:	eb 23                	jmp    1001b4e <get_vfs_entry+0x32>
 1001b2b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001b2e:	6b c0 4c             	imul   eax,eax,0x4c
 1001b31:	05 60 04 40 00       	add    eax,0x400460
 1001b36:	8b 00                	mov    eax,DWORD PTR [eax]
 1001b38:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001b3b:	75 0d                	jne    1001b4a <get_vfs_entry+0x2e>
 1001b3d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001b40:	6b c0 4c             	imul   eax,eax,0x4c
 1001b43:	05 60 04 40 00       	add    eax,0x400460
 1001b48:	eb 0f                	jmp    1001b59 <get_vfs_entry+0x3d>
 1001b4a:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001b4e:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1001b52:	7e d7                	jle    1001b2b <get_vfs_entry+0xf>
 1001b54:	b8 00 00 00 00       	mov    eax,0x0
 1001b59:	c9                   	leave  
 1001b5a:	c3                   	ret    

01001b5b <bmap>:
 1001b5b:	55                   	push   ebp
 1001b5c:	89 e5                	mov    ebp,esp
 1001b5e:	83 ec 18             	sub    esp,0x18
 1001b61:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001b68:	eb 58                	jmp    1001bc2 <bmap+0x67>
 1001b6a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001b6d:	89 d0                	mov    eax,edx
 1001b6f:	c1 e0 03             	shl    eax,0x3
 1001b72:	01 d0                	add    eax,edx
 1001b74:	c1 e0 02             	shl    eax,0x2
 1001b77:	05 64 18 40 00       	add    eax,0x401864
 1001b7c:	8b 10                	mov    edx,DWORD PTR [eax]
 1001b7e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001b81:	39 c2                	cmp    edx,eax
 1001b83:	75 39                	jne    1001bbe <bmap+0x63>
 1001b85:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001b88:	89 d0                	mov    eax,edx
 1001b8a:	c1 e0 03             	shl    eax,0x3
 1001b8d:	01 d0                	add    eax,edx
 1001b8f:	c1 e0 02             	shl    eax,0x2
 1001b92:	05 68 18 40 00       	add    eax,0x401868
 1001b97:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1001b9a:	0f b7 c0             	movzx  eax,ax
 1001b9d:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001ba0:	75 1c                	jne    1001bbe <bmap+0x63>
 1001ba2:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001ba5:	89 d0                	mov    eax,edx
 1001ba7:	c1 e0 03             	shl    eax,0x3
 1001baa:	01 d0                	add    eax,edx
 1001bac:	c1 e0 02             	shl    eax,0x2
 1001baf:	05 60 18 40 00       	add    eax,0x401860
 1001bb4:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1001bb7:	b8 00 00 00 00       	mov    eax,0x0
 1001bbc:	eb 53                	jmp    1001c11 <bmap+0xb6>
 1001bbe:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001bc2:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 1001bc6:	7e a2                	jle    1001b6a <bmap+0xf>
 1001bc8:	83 ec 08             	sub    esp,0x8
 1001bcb:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001bce:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001bd1:	e8 00 02 00 00       	call   1001dd6 <bread>
 1001bd6:	83 c4 10             	add    esp,0x10
 1001bd9:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1001bdc:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
 1001be0:	75 07                	jne    1001be9 <bmap+0x8e>
 1001be2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001be7:	eb 28                	jmp    1001c11 <bmap+0xb6>
 1001be9:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 1001bec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001bef:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1001bf2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001bf5:	89 c2                	mov    edx,eax
 1001bf7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001bfa:	66 89 50 08          	mov    WORD PTR [eax+0x8],dx
 1001bfe:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001c01:	c6 40 0b 00          	mov    BYTE PTR [eax+0xb],0x0
 1001c05:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001c08:	c6 40 0a 01          	mov    BYTE PTR [eax+0xa],0x1
 1001c0c:	b8 00 00 00 00       	mov    eax,0x0
 1001c11:	c9                   	leave  
 1001c12:	c3                   	ret    

01001c13 <new_buffer>:
 1001c13:	55                   	push   ebp
 1001c14:	89 e5                	mov    ebp,esp
 1001c16:	83 ec 10             	sub    esp,0x10
 1001c19:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001c20:	eb 31                	jmp    1001c53 <new_buffer+0x40>
 1001c22:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001c25:	89 d0                	mov    eax,edx
 1001c27:	c1 e0 03             	shl    eax,0x3
 1001c2a:	01 d0                	add    eax,edx
 1001c2c:	c1 e0 02             	shl    eax,0x2
 1001c2f:	05 64 18 40 00       	add    eax,0x401864
 1001c34:	8b 00                	mov    eax,DWORD PTR [eax]
 1001c36:	83 f8 ff             	cmp    eax,0xffffffff
 1001c39:	75 14                	jne    1001c4f <new_buffer+0x3c>
 1001c3b:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001c3e:	89 d0                	mov    eax,edx
 1001c40:	c1 e0 03             	shl    eax,0x3
 1001c43:	01 d0                	add    eax,edx
 1001c45:	c1 e0 02             	shl    eax,0x2
 1001c48:	05 60 18 40 00       	add    eax,0x401860
 1001c4d:	eb 0f                	jmp    1001c5e <new_buffer+0x4b>
 1001c4f:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001c53:	83 7d fc 1f          	cmp    DWORD PTR [ebp-0x4],0x1f
 1001c57:	7e c9                	jle    1001c22 <new_buffer+0xf>
 1001c59:	b8 00 00 00 00       	mov    eax,0x0
 1001c5e:	c9                   	leave  
 1001c5f:	c3                   	ret    

01001c60 <add_buffer>:
 1001c60:	55                   	push   ebp
 1001c61:	89 e5                	mov    ebp,esp
 1001c63:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
 1001c67:	75 16                	jne    1001c7f <add_buffer+0x1f>
 1001c69:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001c6c:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1001c6f:	b8 00 00 00 00       	mov    eax,0x0
 1001c74:	eb 2a                	jmp    1001ca0 <add_buffer+0x40>
 1001c76:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001c79:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001c7c:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1001c7f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001c82:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001c85:	85 c0                	test   eax,eax
 1001c87:	75 ed                	jne    1001c76 <add_buffer+0x16>
 1001c89:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001c8c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001c8f:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
 1001c92:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001c95:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1001c98:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
 1001c9b:	b8 00 00 00 00       	mov    eax,0x0
 1001ca0:	5d                   	pop    ebp
 1001ca1:	c3                   	ret    

01001ca2 <bsync>:
 1001ca2:	55                   	push   ebp
 1001ca3:	89 e5                	mov    ebp,esp
 1001ca5:	81 ec 98 00 00 00    	sub    esp,0x98
 1001cab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001cae:	0f b7 40 08          	movzx  eax,WORD PTR [eax+0x8]
 1001cb2:	0f b7 c0             	movzx  eax,ax
 1001cb5:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001cb8:	c7 45 f4 03 00 00 00 	mov    DWORD PTR [ebp-0xc],0x3
 1001cbf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001cc2:	8b 00                	mov    eax,DWORD PTR [eax]
 1001cc4:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1001cca:	c7 45 88 00 02 00 00 	mov    DWORD PTR [ebp-0x78],0x200
 1001cd1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001cd4:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1001cd7:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 1001cdd:	83 ec 0c             	sub    esp,0xc
 1001ce0:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
 1001ce6:	50                   	push   eax
 1001ce7:	e8 c5 06 00 00       	call   10023b1 <make_request>
 1001cec:	83 c4 10             	add    esp,0x10
 1001cef:	c9                   	leave  
 1001cf0:	c3                   	ret    

01001cf1 <bsynca>:
 1001cf1:	55                   	push   ebp
 1001cf2:	89 e5                	mov    ebp,esp
 1001cf4:	83 ec 18             	sub    esp,0x18
 1001cf7:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1001cfb:	75 07                	jne    1001d04 <bsynca+0x13>
 1001cfd:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001d02:	eb 39                	jmp    1001d3d <bsynca+0x4c>
 1001d04:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001d07:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001d0a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001d0d:	eb 23                	jmp    1001d32 <bsynca+0x41>
 1001d0f:	83 ec 0c             	sub    esp,0xc
 1001d12:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001d15:	e8 88 ff ff ff       	call   1001ca2 <bsync>
 1001d1a:	83 c4 10             	add    esp,0x10
 1001d1d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001d20:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
 1001d23:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001d27:	74 09                	je     1001d32 <bsynca+0x41>
 1001d29:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001d2c:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001d2f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001d32:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1001d36:	75 d7                	jne    1001d0f <bsynca+0x1e>
 1001d38:	b8 00 00 00 00       	mov    eax,0x0
 1001d3d:	c9                   	leave  
 1001d3e:	c3                   	ret    

01001d3f <brelse>:
 1001d3f:	55                   	push   ebp
 1001d40:	89 e5                	mov    ebp,esp
 1001d42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001d45:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1001d48:	83 f8 ff             	cmp    eax,0xffffffff
 1001d4b:	75 07                	jne    1001d54 <brelse+0x15>
 1001d4d:	b8 00 00 00 00       	mov    eax,0x0
 1001d52:	eb 35                	jmp    1001d89 <brelse+0x4a>
 1001d54:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1001d58:	75 07                	jne    1001d61 <brelse+0x22>
 1001d5a:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001d5f:	eb 28                	jmp    1001d89 <brelse+0x4a>
 1001d61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001d64:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001d67:	85 c0                	test   eax,eax
 1001d69:	74 0f                	je     1001d7a <brelse+0x3b>
 1001d6b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001d6e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001d71:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001d74:	8b 52 18             	mov    edx,DWORD PTR [edx+0x18]
 1001d77:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
 1001d7a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001d7d:	c7 40 04 ff ff ff ff 	mov    DWORD PTR [eax+0x4],0xffffffff
 1001d84:	b8 00 00 00 00       	mov    eax,0x0
 1001d89:	5d                   	pop    ebp
 1001d8a:	c3                   	ret    

01001d8b <brelsea>:
 1001d8b:	55                   	push   ebp
 1001d8c:	89 e5                	mov    ebp,esp
 1001d8e:	83 ec 10             	sub    esp,0x10
 1001d91:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1001d95:	75 07                	jne    1001d9e <brelsea+0x13>
 1001d97:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001d9c:	eb 36                	jmp    1001dd4 <brelsea+0x49>
 1001d9e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001da1:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001da4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1001da7:	eb 20                	jmp    1001dc9 <brelsea+0x3e>
 1001da9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001dac:	e8 8e ff ff ff       	call   1001d3f <brelse>
 1001db1:	83 c4 04             	add    esp,0x4
 1001db4:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001db7:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
 1001dba:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1001dbe:	74 09                	je     1001dc9 <brelsea+0x3e>
 1001dc0:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001dc3:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001dc6:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1001dc9:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1001dcd:	75 da                	jne    1001da9 <brelsea+0x1e>
 1001dcf:	b8 00 00 00 00       	mov    eax,0x0
 1001dd4:	c9                   	leave  
 1001dd5:	c3                   	ret    

01001dd6 <bread>:
 1001dd6:	55                   	push   ebp
 1001dd7:	89 e5                	mov    ebp,esp
 1001dd9:	81 ec 98 00 00 00    	sub    esp,0x98
 1001ddf:	e8 2f fe ff ff       	call   1001c13 <new_buffer>
 1001de4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001de7:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001deb:	75 07                	jne    1001df4 <bread+0x1e>
 1001ded:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001df2:	eb 59                	jmp    1001e4d <bread+0x77>
 1001df4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001df7:	89 c2                	mov    edx,eax
 1001df9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001dfc:	66 89 50 08          	mov    WORD PTR [eax+0x8],dx
 1001e00:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1001e03:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001e06:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1001e09:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001e0c:	c6 40 0a 01          	mov    BYTE PTR [eax+0xa],0x1
 1001e10:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001e13:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1001e16:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [ebp-0x10],0x2
 1001e1d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001e20:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e22:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 1001e28:	c7 45 84 00 02 00 00 	mov    DWORD PTR [ebp-0x7c],0x200
 1001e2f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001e32:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1001e35:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 1001e3b:	83 ec 0c             	sub    esp,0xc
 1001e3e:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
 1001e44:	50                   	push   eax
 1001e45:	e8 67 05 00 00       	call   10023b1 <make_request>
 1001e4a:	83 c4 10             	add    esp,0x10
 1001e4d:	c9                   	leave  
 1001e4e:	c3                   	ret    

01001e4f <init_drvdev_man>:
 1001e4f:	55                   	push   ebp
 1001e50:	89 e5                	mov    ebp,esp
 1001e52:	90                   	nop
 1001e53:	5d                   	pop    ebp
 1001e54:	c3                   	ret    

01001e55 <load_driver>:
 1001e55:	55                   	push   ebp
 1001e56:	89 e5                	mov    ebp,esp
 1001e58:	90                   	nop
 1001e59:	5d                   	pop    ebp
 1001e5a:	c3                   	ret    

01001e5b <reg_device>:
 1001e5b:	55                   	push   ebp
 1001e5c:	89 e5                	mov    ebp,esp
 1001e5e:	57                   	push   edi
 1001e5f:	56                   	push   esi
 1001e60:	53                   	push   ebx
 1001e61:	83 ec 10             	sub    esp,0x10
 1001e64:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1001e6b:	eb 49                	jmp    1001eb6 <reg_device+0x5b>
 1001e6d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001e70:	6b c0 44             	imul   eax,eax,0x44
 1001e73:	05 e8 1c 40 00       	add    eax,0x401ce8
 1001e78:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e7a:	85 c0                	test   eax,eax
 1001e7c:	75 34                	jne    1001eb2 <reg_device+0x57>
 1001e7e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001e81:	6b c0 44             	imul   eax,eax,0x44
 1001e84:	8d 90 e0 1c 40 00    	lea    edx,[eax+0x401ce0]
 1001e8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001e8d:	89 c3                	mov    ebx,eax
 1001e8f:	b8 11 00 00 00       	mov    eax,0x11
 1001e94:	89 d7                	mov    edi,edx
 1001e96:	89 de                	mov    esi,ebx
 1001e98:	89 c1                	mov    ecx,eax
 1001e9a:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001e9c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001e9f:	6b c0 44             	imul   eax,eax,0x44
 1001ea2:	05 e8 1c 40 00       	add    eax,0x401ce8
 1001ea7:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001ead:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001eb0:	eb 0f                	jmp    1001ec1 <reg_device+0x66>
 1001eb2:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001eb6:	83 7d f0 3f          	cmp    DWORD PTR [ebp-0x10],0x3f
 1001eba:	7e b1                	jle    1001e6d <reg_device+0x12>
 1001ebc:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001ec1:	83 c4 10             	add    esp,0x10
 1001ec4:	5b                   	pop    ebx
 1001ec5:	5e                   	pop    esi
 1001ec6:	5f                   	pop    edi
 1001ec7:	5d                   	pop    ebp
 1001ec8:	c3                   	ret    

01001ec9 <reg_driver>:
 1001ec9:	55                   	push   ebp
 1001eca:	89 e5                	mov    ebp,esp
 1001ecc:	57                   	push   edi
 1001ecd:	56                   	push   esi
 1001ece:	53                   	push   ebx
 1001ecf:	83 ec 10             	sub    esp,0x10
 1001ed2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1001ed9:	eb 5e                	jmp    1001f39 <reg_driver+0x70>
 1001edb:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001ede:	89 d0                	mov    eax,edx
 1001ee0:	c1 e0 02             	shl    eax,0x2
 1001ee3:	01 d0                	add    eax,edx
 1001ee5:	c1 e0 04             	shl    eax,0x4
 1001ee8:	05 e0 2d 40 00       	add    eax,0x402de0
 1001eed:	8b 00                	mov    eax,DWORD PTR [eax]
 1001eef:	85 c0                	test   eax,eax
 1001ef1:	75 42                	jne    1001f35 <reg_driver+0x6c>
 1001ef3:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001ef6:	89 d0                	mov    eax,edx
 1001ef8:	c1 e0 02             	shl    eax,0x2
 1001efb:	01 d0                	add    eax,edx
 1001efd:	c1 e0 04             	shl    eax,0x4
 1001f00:	8d 90 e0 2d 40 00    	lea    edx,[eax+0x402de0]
 1001f06:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001f09:	89 c3                	mov    ebx,eax
 1001f0b:	b8 14 00 00 00       	mov    eax,0x14
 1001f10:	89 d7                	mov    edi,edx
 1001f12:	89 de                	mov    esi,ebx
 1001f14:	89 c1                	mov    ecx,eax
 1001f16:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001f18:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001f1b:	89 d0                	mov    eax,edx
 1001f1d:	c1 e0 02             	shl    eax,0x2
 1001f20:	01 d0                	add    eax,edx
 1001f22:	c1 e0 04             	shl    eax,0x4
 1001f25:	05 e0 2d 40 00       	add    eax,0x402de0
 1001f2a:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001f30:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001f33:	eb 0f                	jmp    1001f44 <reg_driver+0x7b>
 1001f35:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001f39:	83 7d f0 1f          	cmp    DWORD PTR [ebp-0x10],0x1f
 1001f3d:	7e 9c                	jle    1001edb <reg_driver+0x12>
 1001f3f:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001f44:	83 c4 10             	add    esp,0x10
 1001f47:	5b                   	pop    ebx
 1001f48:	5e                   	pop    esi
 1001f49:	5f                   	pop    edi
 1001f4a:	5d                   	pop    ebp
 1001f4b:	c3                   	ret    

01001f4c <sys_find_dev>:
 1001f4c:	55                   	push   ebp
 1001f4d:	89 e5                	mov    ebp,esp
 1001f4f:	83 ec 18             	sub    esp,0x18
 1001f52:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001f59:	eb 3b                	jmp    1001f96 <sys_find_dev+0x4a>
 1001f5b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001f5e:	6b c0 44             	imul   eax,eax,0x44
 1001f61:	05 e8 1c 40 00       	add    eax,0x401ce8
 1001f66:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f68:	85 c0                	test   eax,eax
 1001f6a:	74 26                	je     1001f92 <sys_find_dev+0x46>
 1001f6c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001f6f:	6b c0 44             	imul   eax,eax,0x44
 1001f72:	05 e0 1c 40 00       	add    eax,0x401ce0
 1001f77:	83 c0 0c             	add    eax,0xc
 1001f7a:	83 ec 08             	sub    esp,0x8
 1001f7d:	50                   	push   eax
 1001f7e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001f81:	e8 eb 4b 00 00       	call   1006b71 <strcmp>
 1001f86:	83 c4 10             	add    esp,0x10
 1001f89:	85 c0                	test   eax,eax
 1001f8b:	75 05                	jne    1001f92 <sys_find_dev+0x46>
 1001f8d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001f90:	eb 0f                	jmp    1001fa1 <sys_find_dev+0x55>
 1001f92:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001f96:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001f9a:	7e bf                	jle    1001f5b <sys_find_dev+0xf>
 1001f9c:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001fa1:	c9                   	leave  
 1001fa2:	c3                   	ret    

01001fa3 <sys_operate_dev>:
 1001fa3:	55                   	push   ebp
 1001fa4:	89 e5                	mov    ebp,esp
 1001fa6:	83 ec 18             	sub    esp,0x18
 1001fa9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001fb0:	eb 36                	jmp    1001fe8 <sys_operate_dev+0x45>
 1001fb2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001fb5:	6b c0 44             	imul   eax,eax,0x44
 1001fb8:	05 e8 1c 40 00       	add    eax,0x401ce8
 1001fbd:	8b 00                	mov    eax,DWORD PTR [eax]
 1001fbf:	85 c0                	test   eax,eax
 1001fc1:	74 21                	je     1001fe4 <sys_operate_dev+0x41>
 1001fc3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001fc6:	6b c0 44             	imul   eax,eax,0x44
 1001fc9:	05 e0 1c 40 00       	add    eax,0x401ce0
 1001fce:	83 c0 0c             	add    eax,0xc
 1001fd1:	83 ec 08             	sub    esp,0x8
 1001fd4:	50                   	push   eax
 1001fd5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001fd8:	e8 94 4b 00 00       	call   1006b71 <strcmp>
 1001fdd:	83 c4 10             	add    esp,0x10
 1001fe0:	85 c0                	test   eax,eax
 1001fe2:	74 0c                	je     1001ff0 <sys_operate_dev+0x4d>
 1001fe4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001fe8:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001fec:	7e c4                	jle    1001fb2 <sys_operate_dev+0xf>
 1001fee:	eb 01                	jmp    1001ff1 <sys_operate_dev+0x4e>
 1001ff0:	90                   	nop
 1001ff1:	83 7d f4 40          	cmp    DWORD PTR [ebp-0xc],0x40
 1001ff5:	75 0a                	jne    1002001 <sys_operate_dev+0x5e>
 1001ff7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001ffc:	e9 8f 01 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 1002001:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 1002005:	0f 87 80 01 00 00    	ja     100218b <sys_operate_dev+0x1e8>
 100200b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100200e:	c1 e0 02             	shl    eax,0x2
 1002011:	05 dc 74 00 01       	add    eax,0x10074dc
 1002016:	8b 00                	mov    eax,DWORD PTR [eax]
 1002018:	ff e0                	jmp    eax
 100201a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100201d:	6b c0 44             	imul   eax,eax,0x44
 1002020:	05 20 1d 40 00       	add    eax,0x401d20
 1002025:	8b 00                	mov    eax,DWORD PTR [eax]
 1002027:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100202a:	83 ec 0c             	sub    esp,0xc
 100202d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002030:	ff d0                	call   eax
 1002032:	83 c4 10             	add    esp,0x10
 1002035:	e9 56 01 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 100203a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100203d:	6b c0 44             	imul   eax,eax,0x44
 1002040:	05 20 1d 40 00       	add    eax,0x401d20
 1002045:	8b 00                	mov    eax,DWORD PTR [eax]
 1002047:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100204a:	83 ec 0c             	sub    esp,0xc
 100204d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002050:	ff d0                	call   eax
 1002052:	83 c4 10             	add    esp,0x10
 1002055:	e9 36 01 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 100205a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100205d:	6b c0 44             	imul   eax,eax,0x44
 1002060:	05 20 1d 40 00       	add    eax,0x401d20
 1002065:	8b 00                	mov    eax,DWORD PTR [eax]
 1002067:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 100206a:	83 ec 0c             	sub    esp,0xc
 100206d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002070:	ff d0                	call   eax
 1002072:	83 c4 10             	add    esp,0x10
 1002075:	e9 16 01 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 100207a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100207d:	6b c0 44             	imul   eax,eax,0x44
 1002080:	05 20 1d 40 00       	add    eax,0x401d20
 1002085:	8b 00                	mov    eax,DWORD PTR [eax]
 1002087:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100208a:	83 ec 0c             	sub    esp,0xc
 100208d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002090:	ff d0                	call   eax
 1002092:	83 c4 10             	add    esp,0x10
 1002095:	e9 f6 00 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 100209a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100209d:	6b c0 44             	imul   eax,eax,0x44
 10020a0:	05 20 1d 40 00       	add    eax,0x401d20
 10020a5:	8b 00                	mov    eax,DWORD PTR [eax]
 10020a7:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 10020aa:	83 ec 0c             	sub    esp,0xc
 10020ad:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020b0:	ff d0                	call   eax
 10020b2:	83 c4 10             	add    esp,0x10
 10020b5:	e9 d6 00 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 10020ba:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020bd:	6b c0 44             	imul   eax,eax,0x44
 10020c0:	05 20 1d 40 00       	add    eax,0x401d20
 10020c5:	8b 00                	mov    eax,DWORD PTR [eax]
 10020c7:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 10020ca:	83 ec 0c             	sub    esp,0xc
 10020cd:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020d0:	ff d0                	call   eax
 10020d2:	83 c4 10             	add    esp,0x10
 10020d5:	e9 b6 00 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 10020da:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020dd:	6b c0 44             	imul   eax,eax,0x44
 10020e0:	05 20 1d 40 00       	add    eax,0x401d20
 10020e5:	8b 00                	mov    eax,DWORD PTR [eax]
 10020e7:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 10020ea:	83 ec 0c             	sub    esp,0xc
 10020ed:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020f0:	ff d0                	call   eax
 10020f2:	83 c4 10             	add    esp,0x10
 10020f5:	e9 96 00 00 00       	jmp    1002190 <sys_operate_dev+0x1ed>
 10020fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020fd:	6b c0 44             	imul   eax,eax,0x44
 1002100:	05 20 1d 40 00       	add    eax,0x401d20
 1002105:	8b 00                	mov    eax,DWORD PTR [eax]
 1002107:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 100210a:	83 ec 0c             	sub    esp,0xc
 100210d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002110:	ff d0                	call   eax
 1002112:	83 c4 10             	add    esp,0x10
 1002115:	eb 79                	jmp    1002190 <sys_operate_dev+0x1ed>
 1002117:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100211a:	6b c0 44             	imul   eax,eax,0x44
 100211d:	05 20 1d 40 00       	add    eax,0x401d20
 1002122:	8b 00                	mov    eax,DWORD PTR [eax]
 1002124:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 1002127:	83 ec 0c             	sub    esp,0xc
 100212a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100212d:	ff d0                	call   eax
 100212f:	83 c4 10             	add    esp,0x10
 1002132:	eb 5c                	jmp    1002190 <sys_operate_dev+0x1ed>
 1002134:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002137:	6b c0 44             	imul   eax,eax,0x44
 100213a:	05 20 1d 40 00       	add    eax,0x401d20
 100213f:	8b 00                	mov    eax,DWORD PTR [eax]
 1002141:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 1002144:	83 ec 0c             	sub    esp,0xc
 1002147:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100214a:	ff d0                	call   eax
 100214c:	83 c4 10             	add    esp,0x10
 100214f:	eb 3f                	jmp    1002190 <sys_operate_dev+0x1ed>
 1002151:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002154:	6b c0 44             	imul   eax,eax,0x44
 1002157:	05 20 1d 40 00       	add    eax,0x401d20
 100215c:	8b 00                	mov    eax,DWORD PTR [eax]
 100215e:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
 1002161:	83 ec 0c             	sub    esp,0xc
 1002164:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002167:	ff d0                	call   eax
 1002169:	83 c4 10             	add    esp,0x10
 100216c:	eb 22                	jmp    1002190 <sys_operate_dev+0x1ed>
 100216e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002171:	6b c0 44             	imul   eax,eax,0x44
 1002174:	05 20 1d 40 00       	add    eax,0x401d20
 1002179:	8b 00                	mov    eax,DWORD PTR [eax]
 100217b:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
 100217e:	83 ec 0c             	sub    esp,0xc
 1002181:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002184:	ff d0                	call   eax
 1002186:	83 c4 10             	add    esp,0x10
 1002189:	eb 05                	jmp    1002190 <sys_operate_dev+0x1ed>
 100218b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002190:	c9                   	leave  
 1002191:	c3                   	ret    

01002192 <call_drv_func>:
 1002192:	55                   	push   ebp
 1002193:	89 e5                	mov    ebp,esp
 1002195:	83 ec 08             	sub    esp,0x8
 1002198:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100219b:	89 d0                	mov    eax,edx
 100219d:	c1 e0 02             	shl    eax,0x2
 10021a0:	01 d0                	add    eax,edx
 10021a2:	c1 e0 04             	shl    eax,0x4
 10021a5:	05 e0 2d 40 00       	add    eax,0x402de0
 10021aa:	8b 00                	mov    eax,DWORD PTR [eax]
 10021ac:	85 c0                	test   eax,eax
 10021ae:	75 0a                	jne    10021ba <call_drv_func+0x28>
 10021b0:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10021b5:	e9 c2 01 00 00       	jmp    100237c <call_drv_func+0x1ea>
 10021ba:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 10021be:	0f 87 b3 01 00 00    	ja     1002377 <call_drv_func+0x1e5>
 10021c4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10021c7:	c1 e0 02             	shl    eax,0x2
 10021ca:	05 0c 75 00 01       	add    eax,0x100750c
 10021cf:	8b 00                	mov    eax,DWORD PTR [eax]
 10021d1:	ff e0                	jmp    eax
 10021d3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10021d6:	89 d0                	mov    eax,edx
 10021d8:	c1 e0 02             	shl    eax,0x2
 10021db:	01 d0                	add    eax,edx
 10021dd:	c1 e0 04             	shl    eax,0x4
 10021e0:	05 e4 2d 40 00       	add    eax,0x402de4
 10021e5:	8b 00                	mov    eax,DWORD PTR [eax]
 10021e7:	83 ec 0c             	sub    esp,0xc
 10021ea:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10021ed:	ff d0                	call   eax
 10021ef:	83 c4 10             	add    esp,0x10
 10021f2:	e9 85 01 00 00       	jmp    100237c <call_drv_func+0x1ea>
 10021f7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10021fa:	89 d0                	mov    eax,edx
 10021fc:	c1 e0 02             	shl    eax,0x2
 10021ff:	01 d0                	add    eax,edx
 1002201:	c1 e0 04             	shl    eax,0x4
 1002204:	05 e8 2d 40 00       	add    eax,0x402de8
 1002209:	8b 00                	mov    eax,DWORD PTR [eax]
 100220b:	83 ec 0c             	sub    esp,0xc
 100220e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002211:	ff d0                	call   eax
 1002213:	83 c4 10             	add    esp,0x10
 1002216:	e9 61 01 00 00       	jmp    100237c <call_drv_func+0x1ea>
 100221b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100221e:	89 d0                	mov    eax,edx
 1002220:	c1 e0 02             	shl    eax,0x2
 1002223:	01 d0                	add    eax,edx
 1002225:	c1 e0 04             	shl    eax,0x4
 1002228:	05 ec 2d 40 00       	add    eax,0x402dec
 100222d:	8b 00                	mov    eax,DWORD PTR [eax]
 100222f:	83 ec 0c             	sub    esp,0xc
 1002232:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002235:	ff d0                	call   eax
 1002237:	83 c4 10             	add    esp,0x10
 100223a:	e9 3d 01 00 00       	jmp    100237c <call_drv_func+0x1ea>
 100223f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002242:	89 d0                	mov    eax,edx
 1002244:	c1 e0 02             	shl    eax,0x2
 1002247:	01 d0                	add    eax,edx
 1002249:	c1 e0 04             	shl    eax,0x4
 100224c:	05 f0 2d 40 00       	add    eax,0x402df0
 1002251:	8b 00                	mov    eax,DWORD PTR [eax]
 1002253:	83 ec 0c             	sub    esp,0xc
 1002256:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002259:	ff d0                	call   eax
 100225b:	83 c4 10             	add    esp,0x10
 100225e:	e9 19 01 00 00       	jmp    100237c <call_drv_func+0x1ea>
 1002263:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002266:	89 d0                	mov    eax,edx
 1002268:	c1 e0 02             	shl    eax,0x2
 100226b:	01 d0                	add    eax,edx
 100226d:	c1 e0 04             	shl    eax,0x4
 1002270:	05 f4 2d 40 00       	add    eax,0x402df4
 1002275:	8b 00                	mov    eax,DWORD PTR [eax]
 1002277:	83 ec 0c             	sub    esp,0xc
 100227a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100227d:	ff d0                	call   eax
 100227f:	83 c4 10             	add    esp,0x10
 1002282:	e9 f5 00 00 00       	jmp    100237c <call_drv_func+0x1ea>
 1002287:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100228a:	89 d0                	mov    eax,edx
 100228c:	c1 e0 02             	shl    eax,0x2
 100228f:	01 d0                	add    eax,edx
 1002291:	c1 e0 04             	shl    eax,0x4
 1002294:	05 f8 2d 40 00       	add    eax,0x402df8
 1002299:	8b 00                	mov    eax,DWORD PTR [eax]
 100229b:	83 ec 0c             	sub    esp,0xc
 100229e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10022a1:	ff d0                	call   eax
 10022a3:	83 c4 10             	add    esp,0x10
 10022a6:	e9 d1 00 00 00       	jmp    100237c <call_drv_func+0x1ea>
 10022ab:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10022ae:	89 d0                	mov    eax,edx
 10022b0:	c1 e0 02             	shl    eax,0x2
 10022b3:	01 d0                	add    eax,edx
 10022b5:	c1 e0 04             	shl    eax,0x4
 10022b8:	05 fc 2d 40 00       	add    eax,0x402dfc
 10022bd:	8b 00                	mov    eax,DWORD PTR [eax]
 10022bf:	83 ec 0c             	sub    esp,0xc
 10022c2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10022c5:	ff d0                	call   eax
 10022c7:	83 c4 10             	add    esp,0x10
 10022ca:	e9 ad 00 00 00       	jmp    100237c <call_drv_func+0x1ea>
 10022cf:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10022d2:	89 d0                	mov    eax,edx
 10022d4:	c1 e0 02             	shl    eax,0x2
 10022d7:	01 d0                	add    eax,edx
 10022d9:	c1 e0 04             	shl    eax,0x4
 10022dc:	05 00 2e 40 00       	add    eax,0x402e00
 10022e1:	8b 00                	mov    eax,DWORD PTR [eax]
 10022e3:	83 ec 0c             	sub    esp,0xc
 10022e6:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10022e9:	ff d0                	call   eax
 10022eb:	83 c4 10             	add    esp,0x10
 10022ee:	e9 89 00 00 00       	jmp    100237c <call_drv_func+0x1ea>
 10022f3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10022f6:	89 d0                	mov    eax,edx
 10022f8:	c1 e0 02             	shl    eax,0x2
 10022fb:	01 d0                	add    eax,edx
 10022fd:	c1 e0 04             	shl    eax,0x4
 1002300:	05 04 2e 40 00       	add    eax,0x402e04
 1002305:	8b 00                	mov    eax,DWORD PTR [eax]
 1002307:	83 ec 0c             	sub    esp,0xc
 100230a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100230d:	ff d0                	call   eax
 100230f:	83 c4 10             	add    esp,0x10
 1002312:	eb 68                	jmp    100237c <call_drv_func+0x1ea>
 1002314:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002317:	89 d0                	mov    eax,edx
 1002319:	c1 e0 02             	shl    eax,0x2
 100231c:	01 d0                	add    eax,edx
 100231e:	c1 e0 04             	shl    eax,0x4
 1002321:	05 08 2e 40 00       	add    eax,0x402e08
 1002326:	8b 00                	mov    eax,DWORD PTR [eax]
 1002328:	83 ec 0c             	sub    esp,0xc
 100232b:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100232e:	ff d0                	call   eax
 1002330:	83 c4 10             	add    esp,0x10
 1002333:	eb 47                	jmp    100237c <call_drv_func+0x1ea>
 1002335:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002338:	89 d0                	mov    eax,edx
 100233a:	c1 e0 02             	shl    eax,0x2
 100233d:	01 d0                	add    eax,edx
 100233f:	c1 e0 04             	shl    eax,0x4
 1002342:	05 0c 2e 40 00       	add    eax,0x402e0c
 1002347:	8b 00                	mov    eax,DWORD PTR [eax]
 1002349:	83 ec 0c             	sub    esp,0xc
 100234c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100234f:	ff d0                	call   eax
 1002351:	83 c4 10             	add    esp,0x10
 1002354:	eb 26                	jmp    100237c <call_drv_func+0x1ea>
 1002356:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002359:	89 d0                	mov    eax,edx
 100235b:	c1 e0 02             	shl    eax,0x2
 100235e:	01 d0                	add    eax,edx
 1002360:	c1 e0 04             	shl    eax,0x4
 1002363:	05 10 2e 40 00       	add    eax,0x402e10
 1002368:	8b 00                	mov    eax,DWORD PTR [eax]
 100236a:	83 ec 0c             	sub    esp,0xc
 100236d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002370:	ff d0                	call   eax
 1002372:	83 c4 10             	add    esp,0x10
 1002375:	eb 05                	jmp    100237c <call_drv_func+0x1ea>
 1002377:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100237c:	c9                   	leave  
 100237d:	c3                   	ret    

0100237e <dispose_device>:
 100237e:	55                   	push   ebp
 100237f:	89 e5                	mov    ebp,esp
 1002381:	90                   	nop
 1002382:	5d                   	pop    ebp
 1002383:	c3                   	ret    

01002384 <dispose_driver>:
 1002384:	55                   	push   ebp
 1002385:	89 e5                	mov    ebp,esp
 1002387:	90                   	nop
 1002388:	5d                   	pop    ebp
 1002389:	c3                   	ret    

0100238a <get_dev>:
 100238a:	55                   	push   ebp
 100238b:	89 e5                	mov    ebp,esp
 100238d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002390:	6b c0 44             	imul   eax,eax,0x44
 1002393:	05 e0 1c 40 00       	add    eax,0x401ce0
 1002398:	5d                   	pop    ebp
 1002399:	c3                   	ret    

0100239a <get_drv>:
 100239a:	55                   	push   ebp
 100239b:	89 e5                	mov    ebp,esp
 100239d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10023a0:	89 d0                	mov    eax,edx
 10023a2:	c1 e0 02             	shl    eax,0x2
 10023a5:	01 d0                	add    eax,edx
 10023a7:	c1 e0 04             	shl    eax,0x4
 10023aa:	05 e0 2d 40 00       	add    eax,0x402de0
 10023af:	5d                   	pop    ebp
 10023b0:	c3                   	ret    

010023b1 <make_request>:
 10023b1:	55                   	push   ebp
 10023b2:	89 e5                	mov    ebp,esp
 10023b4:	57                   	push   edi
 10023b5:	56                   	push   esi
 10023b6:	53                   	push   ebx
 10023b7:	a1 e4 48 40 00       	mov    eax,ds:0x4048e4
 10023bc:	83 c0 01             	add    eax,0x1
 10023bf:	99                   	cdq    
 10023c0:	c1 ea 1b             	shr    edx,0x1b
 10023c3:	01 d0                	add    eax,edx
 10023c5:	83 e0 1f             	and    eax,0x1f
 10023c8:	29 d0                	sub    eax,edx
 10023ca:	89 c2                	mov    edx,eax
 10023cc:	a1 e0 48 40 00       	mov    eax,ds:0x4048e0
 10023d1:	39 c2                	cmp    edx,eax
 10023d3:	75 07                	jne    10023dc <make_request+0x2b>
 10023d5:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10023da:	eb 40                	jmp    100241c <make_request+0x6b>
 10023dc:	a1 e4 48 40 00       	mov    eax,ds:0x4048e4
 10023e1:	69 c0 88 00 00 00    	imul   eax,eax,0x88
 10023e7:	8d 90 e0 37 40 00    	lea    edx,[eax+0x4037e0]
 10023ed:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10023f0:	89 c3                	mov    ebx,eax
 10023f2:	b8 22 00 00 00       	mov    eax,0x22
 10023f7:	89 d7                	mov    edi,edx
 10023f9:	89 de                	mov    esi,ebx
 10023fb:	89 c1                	mov    ecx,eax
 10023fd:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10023ff:	a1 e4 48 40 00       	mov    eax,ds:0x4048e4
 1002404:	83 c0 01             	add    eax,0x1
 1002407:	99                   	cdq    
 1002408:	c1 ea 1b             	shr    edx,0x1b
 100240b:	01 d0                	add    eax,edx
 100240d:	83 e0 1f             	and    eax,0x1f
 1002410:	29 d0                	sub    eax,edx
 1002412:	a3 e4 48 40 00       	mov    ds:0x4048e4,eax
 1002417:	b8 00 00 00 00       	mov    eax,0x0
 100241c:	5b                   	pop    ebx
 100241d:	5e                   	pop    esi
 100241e:	5f                   	pop    edi
 100241f:	5d                   	pop    ebp
 1002420:	c3                   	ret    

01002421 <do_req>:
 1002421:	55                   	push   ebp
 1002422:	89 e5                	mov    ebp,esp
 1002424:	83 ec 18             	sub    esp,0x18
 1002427:	8b 15 e0 48 40 00    	mov    edx,DWORD PTR ds:0x4048e0
 100242d:	a1 e4 48 40 00       	mov    eax,ds:0x4048e4
 1002432:	39 c2                	cmp    edx,eax
 1002434:	75 07                	jne    100243d <do_req+0x1c>
 1002436:	b8 00 00 00 00       	mov    eax,0x0
 100243b:	eb 56                	jmp    1002493 <do_req+0x72>
 100243d:	a1 e0 48 40 00       	mov    eax,ds:0x4048e0
 1002442:	69 c0 88 00 00 00    	imul   eax,eax,0x88
 1002448:	05 e0 37 40 00       	add    eax,0x4037e0
 100244d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002450:	a1 e0 48 40 00       	mov    eax,ds:0x4048e0
 1002455:	83 c0 01             	add    eax,0x1
 1002458:	99                   	cdq    
 1002459:	c1 ea 1b             	shr    edx,0x1b
 100245c:	01 d0                	add    eax,edx
 100245e:	83 e0 1f             	and    eax,0x1f
 1002461:	29 d0                	sub    eax,edx
 1002463:	a3 e0 48 40 00       	mov    ds:0x4048e0,eax
 1002468:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100246b:	8b 80 84 00 00 00    	mov    eax,DWORD PTR [eax+0x84]
 1002471:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1002474:	8b 52 74             	mov    edx,DWORD PTR [edx+0x74]
 1002477:	6b d2 44             	imul   edx,edx,0x44
 100247a:	81 c2 e0 1c 40 00    	add    edx,0x401ce0
 1002480:	83 c2 0c             	add    edx,0xc
 1002483:	83 ec 04             	sub    esp,0x4
 1002486:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002489:	50                   	push   eax
 100248a:	52                   	push   edx
 100248b:	e8 13 fb ff ff       	call   1001fa3 <sys_operate_dev>
 1002490:	83 c4 10             	add    esp,0x10
 1002493:	c9                   	leave  
 1002494:	c3                   	ret    

01002495 <init_proc>:
 1002495:	55                   	push   ebp
 1002496:	89 e5                	mov    ebp,esp
 1002498:	83 ec 18             	sub    esp,0x18
 100249b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10024a2:	eb 40                	jmp    10024e4 <init_proc+0x4f>
 10024a4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024a7:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024ad:	05 00 49 40 00       	add    eax,0x404900
 10024b2:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 10024b8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024bb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024c1:	05 04 49 40 00       	add    eax,0x404904
 10024c6:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 10024cc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024cf:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024d5:	05 60 49 40 00       	add    eax,0x404960
 10024da:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 10024e0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10024e4:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 10024e8:	7e ba                	jle    10024a4 <init_proc+0xf>
 10024ea:	c7 05 68 a7 40 00 00 	mov    DWORD PTR ds:0x40a768,0x0
 10024f1:	00 00 00 
 10024f4:	c7 05 6c a7 40 00 01 	mov    DWORD PTR ds:0x40a76c,0x1
 10024fb:	00 00 00 
 10024fe:	e8 3c 00 00 00       	call   100253f <create_proc>
 1002503:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002506:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002509:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100250f:	05 04 49 40 00       	add    eax,0x404904
 1002514:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 100251a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100251d:	83 c0 03             	add    eax,0x3
 1002520:	c1 e0 04             	shl    eax,0x4
 1002523:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002526:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002529:	01 c0                	add    eax,eax
 100252b:	83 c0 05             	add    eax,0x5
 100252e:	c1 e0 03             	shl    eax,0x3
 1002531:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002534:	0f 00 55 ec          	lldt   WORD PTR [ebp-0x14]
 1002538:	0f 00 5d f0          	ltr    WORD PTR [ebp-0x10]
 100253c:	90                   	nop
 100253d:	c9                   	leave  
 100253e:	c3                   	ret    

0100253f <create_proc>:
 100253f:	55                   	push   ebp
 1002540:	89 e5                	mov    ebp,esp
 1002542:	83 ec 18             	sub    esp,0x18
 1002545:	e8 5f 00 00 00       	call   10025a9 <req_proc>
 100254a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100254d:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002551:	75 07                	jne    100255a <create_proc+0x1b>
 1002553:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002558:	eb 4d                	jmp    10025a7 <create_proc+0x68>
 100255a:	c7 45 f0 ff fb 09 00 	mov    DWORD PTR [ebp-0x10],0x9fbff
 1002561:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
 1002564:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002567:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100256a:	6a 00                	push   0x0
 100256c:	6a 00                	push   0x0
 100256e:	6a 00                	push   0x0
 1002570:	6a 00                	push   0x0
 1002572:	50                   	push   eax
 1002573:	6a 17                	push   0x17
 1002575:	6a 17                	push   0x17
 1002577:	6a 17                	push   0x17
 1002579:	6a 17                	push   0x17
 100257b:	6a 0f                	push   0xf
 100257d:	6a 17                	push   0x17
 100257f:	6a 00                	push   0x0
 1002581:	6a 00                	push   0x0
 1002583:	6a 00                	push   0x0
 1002585:	6a 00                	push   0x0
 1002587:	e8 ce 00 00 00       	call   100265a <set_proc>
 100258c:	83 c4 40             	add    esp,0x40
 100258f:	ba 59 28 00 01       	mov    edx,0x1002859
 1002594:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002597:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100259d:	05 30 4a 40 00       	add    eax,0x404a30
 10025a2:	89 10                	mov    DWORD PTR [eax],edx
 10025a4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10025a7:	c9                   	leave  
 10025a8:	c3                   	ret    

010025a9 <req_proc>:
 10025a9:	55                   	push   ebp
 10025aa:	89 e5                	mov    ebp,esp
 10025ac:	83 ec 10             	sub    esp,0x10
 10025af:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10025b6:	eb 04                	jmp    10025bc <req_proc+0x13>
 10025b8:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10025bc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10025bf:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025c5:	05 00 49 40 00       	add    eax,0x404900
 10025ca:	8b 00                	mov    eax,DWORD PTR [eax]
 10025cc:	83 f8 ff             	cmp    eax,0xffffffff
 10025cf:	74 1b                	je     10025ec <req_proc+0x43>
 10025d1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10025d4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025da:	05 04 49 40 00       	add    eax,0x404904
 10025df:	8b 00                	mov    eax,DWORD PTR [eax]
 10025e1:	83 f8 03             	cmp    eax,0x3
 10025e4:	74 06                	je     10025ec <req_proc+0x43>
 10025e6:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 10025ea:	7e cc                	jle    10025b8 <req_proc+0xf>
 10025ec:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 10025f0:	7e 07                	jle    10025f9 <req_proc+0x50>
 10025f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10025f7:	eb 5f                	jmp    1002658 <req_proc+0xaf>
 10025f9:	a1 6c a7 40 00       	mov    eax,ds:0x40a76c
 10025fe:	8d 50 01             	lea    edx,[eax+0x1]
 1002601:	89 15 6c a7 40 00    	mov    DWORD PTR ds:0x40a76c,edx
 1002607:	89 c2                	mov    edx,eax
 1002609:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100260c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002612:	05 00 49 40 00       	add    eax,0x404900
 1002617:	89 10                	mov    DWORD PTR [eax],edx
 1002619:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100261c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002622:	05 04 49 40 00       	add    eax,0x404904
 1002627:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 100262d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002630:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002636:	05 08 49 40 00       	add    eax,0x404908
 100263b:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002641:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002644:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100264a:	05 0c 49 40 00       	add    eax,0x40490c
 100264f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002655:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002658:	c9                   	leave  
 1002659:	c3                   	ret    

0100265a <set_proc>:
 100265a:	55                   	push   ebp
 100265b:	89 e5                	mov    ebp,esp
 100265d:	83 ec 18             	sub    esp,0x18
 1002660:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 1002663:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002669:	05 00 49 40 00       	add    eax,0x404900
 100266e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002671:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002674:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002677:	89 90 38 01 00 00    	mov    DWORD PTR [eax+0x138],edx
 100267d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002680:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1002683:	89 90 44 01 00 00    	mov    DWORD PTR [eax+0x144],edx
 1002689:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100268c:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 100268f:	89 90 3c 01 00 00    	mov    DWORD PTR [eax+0x13c],edx
 1002695:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002698:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 100269b:	89 90 40 01 00 00    	mov    DWORD PTR [eax+0x140],edx
 10026a1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026a4:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 10026a7:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10026ad:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026b0:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 10026b3:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 10026b9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026bc:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10026bf:	89 90 60 01 00 00    	mov    DWORD PTR [eax+0x160],edx
 10026c5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026c8:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10026cb:	89 90 18 01 00 00    	mov    DWORD PTR [eax+0x118],edx
 10026d1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026d4:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10026d7:	89 90 20 01 00 00    	mov    DWORD PTR [eax+0x120],edx
 10026dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026e0:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10026e3:	89 90 28 01 00 00    	mov    DWORD PTR [eax+0x128],edx
 10026e9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026ec:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 10026ef:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 10026f5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10026f8:	8b 55 28             	mov    edx,DWORD PTR [ebp+0x28]
 10026fb:	89 90 68 01 00 00    	mov    DWORD PTR [eax+0x168],edx
 1002701:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002704:	8b 55 2c             	mov    edx,DWORD PTR [ebp+0x2c]
 1002707:	89 90 6c 01 00 00    	mov    DWORD PTR [eax+0x16c],edx
 100270d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002710:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002713:	89 90 48 01 00 00    	mov    DWORD PTR [eax+0x148],edx
 1002719:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100271c:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 100271f:	89 90 14 01 00 00    	mov    DWORD PTR [eax+0x114],edx
 1002725:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002728:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 100272b:	89 90 1c 01 00 00    	mov    DWORD PTR [eax+0x11c],edx
 1002731:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002734:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002737:	89 90 24 01 00 00    	mov    DWORD PTR [eax+0x124],edx
 100273d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002740:	8b 55 34             	mov    edx,DWORD PTR [ebp+0x34]
 1002743:	89 90 4c 01 00 00    	mov    DWORD PTR [eax+0x14c],edx
 1002749:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100274c:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
 100274f:	89 90 50 01 00 00    	mov    DWORD PTR [eax+0x150],edx
 1002755:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002758:	8b 55 3c             	mov    edx,DWORD PTR [ebp+0x3c]
 100275b:	89 90 54 01 00 00    	mov    DWORD PTR [eax+0x154],edx
 1002761:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002764:	c7 80 34 01 00 00 02 	mov    DWORD PTR [eax+0x134],0x202
 100276b:	02 00 00 
 100276e:	ba 59 28 00 01       	mov    edx,0x1002859
 1002773:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002776:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 100277c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100277f:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 1002782:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 1002788:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100278b:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 100278e:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 1002794:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002797:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 100279a:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10027a0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10027a3:	c7 80 2c 01 00 00 00 	mov    DWORD PTR [eax+0x12c],0x1000
 10027aa:	10 00 00 
 10027ad:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10027b0:	83 c0 03             	add    eax,0x3
 10027b3:	c1 e0 04             	shl    eax,0x4
 10027b6:	89 c2                	mov    edx,eax
 10027b8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10027bb:	89 90 70 01 00 00    	mov    DWORD PTR [eax+0x170],edx
 10027c1:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10027c4:	01 c0                	add    eax,eax
 10027c6:	83 c0 05             	add    eax,0x5
 10027c9:	89 c2                	mov    edx,eax
 10027cb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10027ce:	05 10 01 00 00       	add    eax,0x110
 10027d3:	52                   	push   edx
 10027d4:	68 89 00 00 00       	push   0x89
 10027d9:	68 ff ff 00 00       	push   0xffff
 10027de:	50                   	push   eax
 10027df:	e8 69 0b 00 00       	call   100334d <fill_desc>
 10027e4:	83 c4 10             	add    esp,0x10
 10027e7:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10027ea:	83 c0 03             	add    eax,0x3
 10027ed:	01 c0                	add    eax,eax
 10027ef:	89 c2                	mov    edx,eax
 10027f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10027f4:	83 c0 34             	add    eax,0x34
 10027f7:	52                   	push   edx
 10027f8:	68 82 00 00 00       	push   0x82
 10027fd:	6a 28                	push   0x28
 10027ff:	50                   	push   eax
 1002800:	e8 48 0b 00 00       	call   100334d <fill_desc>
 1002805:	83 c4 10             	add    esp,0x10
 1002808:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100280b:	83 c0 34             	add    eax,0x34
 100280e:	50                   	push   eax
 100280f:	68 fe 80 00 00       	push   0x80fe
 1002814:	6a ff                	push   0xffffffff
 1002816:	6a 00                	push   0x0
 1002818:	e8 3b 0c 00 00       	call   1003458 <fill_ldt_desc>
 100281d:	83 c4 10             	add    esp,0x10
 1002820:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002823:	83 c0 3c             	add    eax,0x3c
 1002826:	50                   	push   eax
 1002827:	68 f2 80 00 00       	push   0x80f2
 100282c:	6a ff                	push   0xffffffff
 100282e:	6a 00                	push   0x0
 1002830:	e8 23 0c 00 00       	call   1003458 <fill_ldt_desc>
 1002835:	83 c4 10             	add    esp,0x10
 1002838:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100283b:	83 c0 44             	add    eax,0x44
 100283e:	50                   	push   eax
 100283f:	68 f6 00 00 00       	push   0xf6
 1002844:	68 00 10 00 00       	push   0x1000
 1002849:	68 00 f0 bf 01       	push   0x1bff000
 100284e:	e8 05 0c 00 00       	call   1003458 <fill_ldt_desc>
 1002853:	83 c4 10             	add    esp,0x10
 1002856:	90                   	nop
 1002857:	c9                   	leave  
 1002858:	c3                   	ret    

01002859 <proc_zero>:
 1002859:	55                   	push   ebp
 100285a:	89 e5                	mov    ebp,esp
 100285c:	eb fe                	jmp    100285c <proc_zero+0x3>

0100285e <manage_proc>:
 100285e:	55                   	push   ebp
 100285f:	89 e5                	mov    ebp,esp
 1002861:	83 ec 18             	sub    esp,0x18
 1002864:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002869:	83 f8 ff             	cmp    eax,0xffffffff
 100286c:	74 23                	je     1002891 <manage_proc+0x33>
 100286e:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002873:	69 d0 78 01 00 00    	imul   edx,eax,0x178
 1002879:	81 c2 08 49 40 00    	add    edx,0x404908
 100287f:	8b 12                	mov    edx,DWORD PTR [edx]
 1002881:	83 c2 01             	add    edx,0x1
 1002884:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100288a:	05 08 49 40 00       	add    eax,0x404908
 100288f:	89 10                	mov    DWORD PTR [eax],edx
 1002891:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002896:	83 f8 ff             	cmp    eax,0xffffffff
 1002899:	74 32                	je     10028cd <manage_proc+0x6f>
 100289b:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10028a0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028a6:	05 08 49 40 00       	add    eax,0x404908
 10028ab:	8b 00                	mov    eax,DWORD PTR [eax]
 10028ad:	83 f8 01             	cmp    eax,0x1
 10028b0:	77 1b                	ja     10028cd <manage_proc+0x6f>
 10028b2:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10028b7:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028bd:	05 04 49 40 00       	add    eax,0x404904
 10028c2:	8b 00                	mov    eax,DWORD PTR [eax]
 10028c4:	83 f8 01             	cmp    eax,0x1
 10028c7:	0f 84 85 00 00 00    	je     1002952 <manage_proc+0xf4>
 10028cd:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10028d2:	83 f8 ff             	cmp    eax,0xffffffff
 10028d5:	74 16                	je     10028ed <manage_proc+0x8f>
 10028d7:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10028dc:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028e2:	05 08 49 40 00       	add    eax,0x404908
 10028e7:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 10028ed:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10028f4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10028fb:	eb 38                	jmp    1002935 <manage_proc+0xd7>
 10028fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002900:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002906:	05 00 49 40 00       	add    eax,0x404900
 100290b:	8b 00                	mov    eax,DWORD PTR [eax]
 100290d:	83 f8 ff             	cmp    eax,0xffffffff
 1002910:	74 1f                	je     1002931 <manage_proc+0xd3>
 1002912:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002915:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100291b:	05 04 49 40 00       	add    eax,0x404904
 1002920:	8b 00                	mov    eax,DWORD PTR [eax]
 1002922:	83 f8 01             	cmp    eax,0x1
 1002925:	75 0a                	jne    1002931 <manage_proc+0xd3>
 1002927:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 100292c:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 100292f:	75 0c                	jne    100293d <manage_proc+0xdf>
 1002931:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1002935:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1002939:	7e c2                	jle    10028fd <manage_proc+0x9f>
 100293b:	eb 01                	jmp    100293e <manage_proc+0xe0>
 100293d:	90                   	nop
 100293e:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1002942:	7f 11                	jg     1002955 <manage_proc+0xf7>
 1002944:	83 ec 0c             	sub    esp,0xc
 1002947:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100294a:	e8 09 00 00 00       	call   1002958 <switch_proc_tss>
 100294f:	83 c4 10             	add    esp,0x10
 1002952:	90                   	nop
 1002953:	eb 01                	jmp    1002956 <manage_proc+0xf8>
 1002955:	90                   	nop
 1002956:	c9                   	leave  
 1002957:	c3                   	ret    

01002958 <switch_proc_tss>:
 1002958:	55                   	push   ebp
 1002959:	89 e5                	mov    ebp,esp
 100295b:	83 ec 18             	sub    esp,0x18
 100295e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002961:	01 c0                	add    eax,eax
 1002963:	83 c0 05             	add    eax,0x5
 1002966:	c1 e0 03             	shl    eax,0x3
 1002969:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100296c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100296f:	a3 68 a7 40 00       	mov    ds:0x40a768,eax
 1002974:	83 ec 0c             	sub    esp,0xc
 1002977:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100297a:	e8 dc 45 00 00       	call   1006f5b <switch_proc_asm>
 100297f:	83 c4 10             	add    esp,0x10
 1002982:	90                   	nop
 1002983:	c9                   	leave  
 1002984:	c3                   	ret    

01002985 <switch_proc>:
 1002985:	55                   	push   ebp
 1002986:	89 e5                	mov    ebp,esp
 1002988:	57                   	push   edi
 1002989:	56                   	push   esi
 100298a:	53                   	push   ebx
 100298b:	81 ec 8c 01 00 00    	sub    esp,0x18c
 1002991:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002994:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100299a:	8d 90 00 49 40 00    	lea    edx,[eax+0x404900]
 10029a0:	8d 85 6c fe ff ff    	lea    eax,[ebp-0x194]
 10029a6:	89 d3                	mov    ebx,edx
 10029a8:	ba 5e 00 00 00       	mov    edx,0x5e
 10029ad:	89 c7                	mov    edi,eax
 10029af:	89 de                	mov    esi,ebx
 10029b1:	89 d1                	mov    ecx,edx
 10029b3:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10029b5:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10029ba:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029c0:	05 10 01 00 00       	add    eax,0x110
 10029c5:	05 00 49 40 00       	add    eax,0x404900
 10029ca:	83 ec 0c             	sub    esp,0xc
 10029cd:	50                   	push   eax
 10029ce:	e8 5f 00 00 00       	call   1002a32 <save_context>
 10029d3:	83 c4 10             	add    esp,0x10
 10029d6:	b8 59 28 00 01       	mov    eax,0x1002859
 10029db:	a3 30 4a 40 00       	mov    ds:0x404a30,eax
 10029e0:	c7 05 2c 4a 40 00 00 	mov    DWORD PTR ds:0x404a2c,0x1000
 10029e7:	10 00 00 
 10029ea:	c7 05 34 4a 40 00 02 	mov    DWORD PTR ds:0x404a34,0x202
 10029f1:	02 00 00 
 10029f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029f7:	a3 68 a7 40 00       	mov    ds:0x40a768,eax
 10029fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029ff:	01 c0                	add    eax,eax
 1002a01:	83 c0 05             	add    eax,0x5
 1002a04:	c1 e0 03             	shl    eax,0x3
 1002a07:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1002a0a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a0d:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002a13:	05 10 01 00 00       	add    eax,0x110
 1002a18:	05 00 49 40 00       	add    eax,0x404900
 1002a1d:	83 ec 0c             	sub    esp,0xc
 1002a20:	50                   	push   eax
 1002a21:	e8 52 45 00 00       	call   1006f78 <switch_to>
 1002a26:	83 c4 10             	add    esp,0x10
 1002a29:	90                   	nop
 1002a2a:	8d 65 f4             	lea    esp,[ebp-0xc]
 1002a2d:	5b                   	pop    ebx
 1002a2e:	5e                   	pop    esi
 1002a2f:	5f                   	pop    edi
 1002a30:	5d                   	pop    ebp
 1002a31:	c3                   	ret    

01002a32 <save_context>:
 1002a32:	55                   	push   ebp
 1002a33:	89 e5                	mov    ebp,esp
 1002a35:	8b 15 20 a7 40 00    	mov    edx,DWORD PTR ds:0x40a720
 1002a3b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a3e:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
 1002a41:	8b 15 28 a7 40 00    	mov    edx,DWORD PTR ds:0x40a728
 1002a47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a4a:	89 50 28             	mov    DWORD PTR [eax+0x28],edx
 1002a4d:	8b 15 34 a7 40 00    	mov    edx,DWORD PTR ds:0x40a734
 1002a53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a56:	89 50 34             	mov    DWORD PTR [eax+0x34],edx
 1002a59:	8b 15 2c a7 40 00    	mov    edx,DWORD PTR ds:0x40a72c
 1002a5f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a62:	89 50 2c             	mov    DWORD PTR [eax+0x2c],edx
 1002a65:	8b 15 30 a7 40 00    	mov    edx,DWORD PTR ds:0x40a730
 1002a6b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a6e:	89 50 30             	mov    DWORD PTR [eax+0x30],edx
 1002a71:	8b 15 40 a7 40 00    	mov    edx,DWORD PTR ds:0x40a740
 1002a77:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a7a:	89 50 40             	mov    DWORD PTR [eax+0x40],edx
 1002a7d:	8b 15 44 a7 40 00    	mov    edx,DWORD PTR ds:0x40a744
 1002a83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a86:	89 50 44             	mov    DWORD PTR [eax+0x44],edx
 1002a89:	8b 15 24 a7 40 00    	mov    edx,DWORD PTR ds:0x40a724
 1002a8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a92:	89 50 24             	mov    DWORD PTR [eax+0x24],edx
 1002a95:	8b 15 38 a7 40 00    	mov    edx,DWORD PTR ds:0x40a738
 1002a9b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a9e:	89 50 38             	mov    DWORD PTR [eax+0x38],edx
 1002aa1:	8b 15 3c a7 40 00    	mov    edx,DWORD PTR ds:0x40a73c
 1002aa7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002aaa:	89 50 3c             	mov    DWORD PTR [eax+0x3c],edx
 1002aad:	90                   	nop
 1002aae:	5d                   	pop    ebp
 1002aaf:	c3                   	ret    

01002ab0 <palloc>:
 1002ab0:	55                   	push   ebp
 1002ab1:	89 e5                	mov    ebp,esp
 1002ab3:	83 ec 48             	sub    esp,0x48
 1002ab6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002ab9:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1002abf:	85 c0                	test   eax,eax
 1002ac1:	0f 48 c2             	cmovs  eax,edx
 1002ac4:	c1 f8 0c             	sar    eax,0xc
 1002ac7:	89 c1                	mov    ecx,eax
 1002ac9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002acc:	99                   	cdq    
 1002acd:	c1 ea 14             	shr    edx,0x14
 1002ad0:	01 d0                	add    eax,edx
 1002ad2:	25 ff 0f 00 00       	and    eax,0xfff
 1002ad7:	29 d0                	sub    eax,edx
 1002ad9:	01 c8                	add    eax,ecx
 1002adb:	85 c0                	test   eax,eax
 1002add:	0f 95 c0             	setne  al
 1002ae0:	0f b6 c0             	movzx  eax,al
 1002ae3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002ae6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1002aed:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1002af4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002af7:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002afd:	05 2c 4a 40 00       	add    eax,0x404a2c
 1002b02:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b04:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002b07:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 1002b0b:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 1002b12:	e9 ff 01 00 00       	jmp    1002d16 <palloc+0x266>
 1002b17:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1002b1a:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b1c:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002b21:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1002b24:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1002b2b:	e9 d1 01 00 00       	jmp    1002d01 <palloc+0x251>
 1002b30:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1002b33:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b35:	83 e0 01             	and    eax,0x1
 1002b38:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1002b3b:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 1002b3f:	0f 85 b4 01 00 00    	jne    1002cf9 <palloc+0x249>
 1002b45:	e8 cf e5 ff ff       	call   1001119 <req_a_page>
 1002b4a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1002b4d:	83 7d d4 ff          	cmp    DWORD PTR [ebp-0x2c],0xffffffff
 1002b51:	0f 85 a4 00 00 00    	jne    1002bfb <palloc+0x14b>
 1002b57:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b5a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b60:	05 44 49 40 00       	add    eax,0x404944
 1002b65:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1002b68:	0f b7 c0             	movzx  eax,ax
 1002b6b:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1002b6e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b71:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b77:	05 40 49 40 00       	add    eax,0x404940
 1002b7c:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002b80:	0f b7 c0             	movzx  eax,ax
 1002b83:	c1 e0 10             	shl    eax,0x10
 1002b86:	25 00 00 0f 00       	and    eax,0xf0000
 1002b8b:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 1002b8e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002b91:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 1002b94:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1002b97:	89 c2                	mov    edx,eax
 1002b99:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b9c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ba2:	05 44 49 40 00       	add    eax,0x404944
 1002ba7:	66 89 10             	mov    WORD PTR [eax],dx
 1002baa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002bad:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002bb3:	05 40 49 40 00       	add    eax,0x404940
 1002bb8:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002bbc:	0f b7 c0             	movzx  eax,ax
 1002bbf:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 1002bc2:	81 65 bc f0 ff 00 00 	and    DWORD PTR [ebp-0x44],0xfff0
 1002bc9:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1002bcc:	c1 e8 10             	shr    eax,0x10
 1002bcf:	83 e0 0f             	and    eax,0xf
 1002bd2:	89 c2                	mov    edx,eax
 1002bd4:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1002bd7:	01 d0                	add    eax,edx
 1002bd9:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 1002bdc:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1002bdf:	89 c2                	mov    edx,eax
 1002be1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002be4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002bea:	05 40 49 40 00       	add    eax,0x404940
 1002bef:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 1002bf3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1002bf6:	e9 2d 01 00 00       	jmp    1002d28 <palloc+0x278>
 1002bfb:	83 ec 0c             	sub    esp,0xc
 1002bfe:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1002c01:	e8 70 e6 ff ff       	call   1001276 <get_phyaddr>
 1002c06:	83 c4 10             	add    esp,0x10
 1002c09:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1002c0c:	83 ec 04             	sub    esp,0x4
 1002c0f:	6a 07                	push   0x7
 1002c11:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 1002c14:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 1002c17:	e8 65 e6 ff ff       	call   1001281 <set_page_item>
 1002c1c:	83 c4 10             	add    esp,0x10
 1002c1f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002c22:	c1 e0 0a             	shl    eax,0xa
 1002c25:	89 c2                	mov    edx,eax
 1002c27:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1002c2a:	01 d0                	add    eax,edx
 1002c2c:	c1 e0 0c             	shl    eax,0xc
 1002c2f:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1002c32:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1002c36:	75 0e                	jne    1002c46 <palloc+0x196>
 1002c38:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1002c3b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002c3e:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1002c41:	a3 70 a7 40 00       	mov    ds:0x40a770,eax
 1002c46:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1002c4a:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1002c4e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1002c52:	0f 85 a1 00 00 00    	jne    1002cf9 <palloc+0x249>
 1002c58:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002c5b:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c61:	05 44 49 40 00       	add    eax,0x404944
 1002c66:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1002c69:	0f b7 c0             	movzx  eax,ax
 1002c6c:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1002c6f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002c72:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c78:	05 40 49 40 00       	add    eax,0x404940
 1002c7d:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002c81:	0f b7 c0             	movzx  eax,ax
 1002c84:	c1 e0 10             	shl    eax,0x10
 1002c87:	25 00 00 0f 00       	and    eax,0xf0000
 1002c8c:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 1002c8f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002c92:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 1002c95:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1002c98:	89 c2                	mov    edx,eax
 1002c9a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002c9d:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ca3:	05 44 49 40 00       	add    eax,0x404944
 1002ca8:	66 89 10             	mov    WORD PTR [eax],dx
 1002cab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002cae:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002cb4:	05 40 49 40 00       	add    eax,0x404940
 1002cb9:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002cbd:	0f b7 c0             	movzx  eax,ax
 1002cc0:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 1002cc3:	81 65 c4 f0 ff 00 00 	and    DWORD PTR [ebp-0x3c],0xfff0
 1002cca:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1002ccd:	c1 e8 10             	shr    eax,0x10
 1002cd0:	83 e0 0f             	and    eax,0xf
 1002cd3:	89 c2                	mov    edx,eax
 1002cd5:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1002cd8:	01 d0                	add    eax,edx
 1002cda:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 1002cdd:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1002ce0:	89 c2                	mov    edx,eax
 1002ce2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002ce5:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ceb:	05 40 49 40 00       	add    eax,0x404940
 1002cf0:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 1002cf4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1002cf7:	eb 2f                	jmp    1002d28 <palloc+0x278>
 1002cf9:	83 45 e0 04          	add    DWORD PTR [ebp-0x20],0x4
 1002cfd:	83 45 dc 01          	add    DWORD PTR [ebp-0x24],0x1
 1002d01:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [ebp-0x24],0x3ff
 1002d08:	0f 8e 22 fe ff ff    	jle    1002b30 <palloc+0x80>
 1002d0e:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 1002d12:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1002d16:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [ebp-0x1c],0x3ff
 1002d1d:	0f 8e f4 fd ff ff    	jle    1002b17 <palloc+0x67>
 1002d23:	b8 00 00 00 00       	mov    eax,0x0
 1002d28:	c9                   	leave  
 1002d29:	c3                   	ret    

01002d2a <malloc>:
 1002d2a:	55                   	push   ebp
 1002d2b:	89 e5                	mov    ebp,esp
 1002d2d:	83 ec 08             	sub    esp,0x8
 1002d30:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002d35:	83 ec 08             	sub    esp,0x8
 1002d38:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1002d3b:	50                   	push   eax
 1002d3c:	e8 6f fd ff ff       	call   1002ab0 <palloc>
 1002d41:	83 c4 10             	add    esp,0x10
 1002d44:	c9                   	leave  
 1002d45:	c3                   	ret    

01002d46 <proc_end>:
 1002d46:	55                   	push   ebp
 1002d47:	89 e5                	mov    ebp,esp
 1002d49:	83 ec 18             	sub    esp,0x18
 1002d4c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002d4f:	a1 48 4a 40 00       	mov    eax,ds:0x404a48
 1002d54:	89 c4                	mov    esp,eax
 1002d56:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002d5b:	83 ec 0c             	sub    esp,0xc
 1002d5e:	50                   	push   eax
 1002d5f:	e8 6d 00 00 00       	call   1002dd1 <del_proc>
 1002d64:	83 c4 10             	add    esp,0x10
 1002d67:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002d6c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d72:	05 60 49 40 00       	add    eax,0x404960
 1002d77:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d79:	83 f8 ff             	cmp    eax,0xffffffff
 1002d7c:	74 43                	je     1002dc1 <proc_end+0x7b>
 1002d7e:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002d83:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d89:	05 60 49 40 00       	add    eax,0x404960
 1002d8e:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d90:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d96:	05 04 49 40 00       	add    eax,0x404904
 1002d9b:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002da1:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002da6:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002dac:	05 60 49 40 00       	add    eax,0x404960
 1002db1:	8b 00                	mov    eax,DWORD PTR [eax]
 1002db3:	83 ec 0c             	sub    esp,0xc
 1002db6:	50                   	push   eax
 1002db7:	e8 9c fb ff ff       	call   1002958 <switch_proc_tss>
 1002dbc:	83 c4 10             	add    esp,0x10
 1002dbf:	eb 0d                	jmp    1002dce <proc_end+0x88>
 1002dc1:	83 ec 0c             	sub    esp,0xc
 1002dc4:	6a 00                	push   0x0
 1002dc6:	e8 8d fb ff ff       	call   1002958 <switch_proc_tss>
 1002dcb:	83 c4 10             	add    esp,0x10
 1002dce:	90                   	nop
 1002dcf:	c9                   	leave  
 1002dd0:	c3                   	ret    

01002dd1 <del_proc>:
 1002dd1:	55                   	push   ebp
 1002dd2:	89 e5                	mov    ebp,esp
 1002dd4:	83 ec 18             	sub    esp,0x18
 1002dd7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002dda:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002de0:	05 04 49 40 00       	add    eax,0x404904
 1002de5:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 1002deb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002dee:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002df4:	05 00 49 40 00       	add    eax,0x404900
 1002df9:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 1002dff:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002e02:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002e08:	05 2c 4a 40 00       	add    eax,0x404a2c
 1002e0d:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e0f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002e12:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002e16:	eb 61                	jmp    1002e79 <del_proc+0xa8>
 1002e18:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002e1b:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e1d:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002e22:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002e25:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1002e2c:	eb 2f                	jmp    1002e5d <del_proc+0x8c>
 1002e2e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002e31:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e33:	83 e0 01             	and    eax,0x1
 1002e36:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002e39:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 1002e3d:	74 16                	je     1002e55 <del_proc+0x84>
 1002e3f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002e42:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e44:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002e49:	83 ec 0c             	sub    esp,0xc
 1002e4c:	50                   	push   eax
 1002e4d:	e8 6d e3 ff ff       	call   10011bf <free_page>
 1002e52:	83 c4 10             	add    esp,0x10
 1002e55:	83 45 f0 04          	add    DWORD PTR [ebp-0x10],0x4
 1002e59:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1002e5d:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [ebp-0x14],0x3ff
 1002e64:	7e c8                	jle    1002e2e <del_proc+0x5d>
 1002e66:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002e69:	83 ec 0c             	sub    esp,0xc
 1002e6c:	50                   	push   eax
 1002e6d:	e8 16 e1 ff ff       	call   1000f88 <vmfree>
 1002e72:	83 c4 10             	add    esp,0x10
 1002e75:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002e79:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002e7c:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e7e:	83 e0 01             	and    eax,0x1
 1002e81:	85 c0                	test   eax,eax
 1002e83:	75 93                	jne    1002e18 <del_proc+0x47>
 1002e85:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002e88:	83 ec 0c             	sub    esp,0xc
 1002e8b:	50                   	push   eax
 1002e8c:	e8 f7 e0 ff ff       	call   1000f88 <vmfree>
 1002e91:	83 c4 10             	add    esp,0x10
 1002e94:	90                   	nop
 1002e95:	c9                   	leave  
 1002e96:	c3                   	ret    

01002e97 <set_proc_stat>:
 1002e97:	55                   	push   ebp
 1002e98:	89 e5                	mov    ebp,esp
 1002e9a:	83 ec 10             	sub    esp,0x10
 1002e9d:	83 7d 08 ff          	cmp    DWORD PTR [ebp+0x8],0xffffffff
 1002ea1:	75 07                	jne    1002eaa <set_proc_stat+0x13>
 1002ea3:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002ea8:	eb 6a                	jmp    1002f14 <set_proc_stat+0x7d>
 1002eaa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002eb1:	eb 04                	jmp    1002eb7 <set_proc_stat+0x20>
 1002eb3:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002eb7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002eba:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ec0:	05 00 49 40 00       	add    eax,0x404900
 1002ec5:	8b 10                	mov    edx,DWORD PTR [eax]
 1002ec7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002eca:	39 c2                	cmp    edx,eax
 1002ecc:	75 e5                	jne    1002eb3 <set_proc_stat+0x1c>
 1002ece:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 1002ed2:	75 07                	jne    1002edb <set_proc_stat+0x44>
 1002ed4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002ed9:	eb 39                	jmp    1002f14 <set_proc_stat+0x7d>
 1002edb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002ede:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1002ee1:	69 d2 78 01 00 00    	imul   edx,edx,0x178
 1002ee7:	81 c2 04 49 40 00    	add    edx,0x404904
 1002eed:	89 02                	mov    DWORD PTR [edx],eax
 1002eef:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002ef4:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
 1002ef7:	75 16                	jne    1002f0f <set_proc_stat+0x78>
 1002ef9:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002efe:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002f04:	05 08 49 40 00       	add    eax,0x404908
 1002f09:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002f0f:	b8 00 00 00 00       	mov    eax,0x0
 1002f14:	c9                   	leave  
 1002f15:	c3                   	ret    

01002f16 <add_proc_openf>:
 1002f16:	55                   	push   ebp
 1002f17:	89 e5                	mov    ebp,esp
 1002f19:	83 ec 10             	sub    esp,0x10
 1002f1c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002f23:	eb 40                	jmp    1002f65 <add_proc_openf+0x4f>
 1002f25:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002f2a:	6b d0 5e             	imul   edx,eax,0x5e
 1002f2d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f30:	01 d0                	add    eax,edx
 1002f32:	83 c0 24             	add    eax,0x24
 1002f35:	8b 04 85 00 49 40 00 	mov    eax,DWORD PTR [eax*4+0x404900]
 1002f3c:	85 c0                	test   eax,eax
 1002f3e:	75 21                	jne    1002f61 <add_proc_openf+0x4b>
 1002f40:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002f45:	6b d0 5e             	imul   edx,eax,0x5e
 1002f48:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f4b:	01 d0                	add    eax,edx
 1002f4d:	8d 50 24             	lea    edx,[eax+0x24]
 1002f50:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002f53:	89 04 95 00 49 40 00 	mov    DWORD PTR [edx*4+0x404900],eax
 1002f5a:	b8 00 00 00 00       	mov    eax,0x0
 1002f5f:	eb 0f                	jmp    1002f70 <add_proc_openf+0x5a>
 1002f61:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002f65:	83 7d fc 1f          	cmp    DWORD PTR [ebp-0x4],0x1f
 1002f69:	7e ba                	jle    1002f25 <add_proc_openf+0xf>
 1002f6b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002f70:	c9                   	leave  
 1002f71:	c3                   	ret    

01002f72 <sys_exit>:
 1002f72:	55                   	push   ebp
 1002f73:	89 e5                	mov    ebp,esp
 1002f75:	83 ec 08             	sub    esp,0x8
 1002f78:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1002f7d:	83 ec 0c             	sub    esp,0xc
 1002f80:	50                   	push   eax
 1002f81:	e8 4b fe ff ff       	call   1002dd1 <del_proc>
 1002f86:	83 c4 10             	add    esp,0x10
 1002f89:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002f8c:	c9                   	leave  
 1002f8d:	c3                   	ret    

01002f8e <reg_proc>:
 1002f8e:	55                   	push   ebp
 1002f8f:	89 e5                	mov    ebp,esp
 1002f91:	83 ec 18             	sub    esp,0x18
 1002f94:	e8 10 f6 ff ff       	call   10025a9 <req_proc>
 1002f99:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002f9c:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002fa0:	75 0a                	jne    1002fac <reg_proc+0x1e>
 1002fa2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002fa7:	e9 1a 01 00 00       	jmp    10030c6 <reg_proc+0x138>
 1002fac:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002faf:	6a 00                	push   0x0
 1002fb1:	6a 00                	push   0x0
 1002fb3:	6a 00                	push   0x0
 1002fb5:	6a 00                	push   0x0
 1002fb7:	68 fc ff bf 01       	push   0x1bffffc
 1002fbc:	6a 10                	push   0x10
 1002fbe:	6a 10                	push   0x10
 1002fc0:	6a 10                	push   0x10
 1002fc2:	6a 10                	push   0x10
 1002fc4:	6a 08                	push   0x8
 1002fc6:	6a 10                	push   0x10
 1002fc8:	6a 00                	push   0x0
 1002fca:	6a 00                	push   0x0
 1002fcc:	6a 00                	push   0x0
 1002fce:	6a 00                	push   0x0
 1002fd0:	e8 85 f6 ff ff       	call   100265a <set_proc>
 1002fd5:	83 c4 40             	add    esp,0x40
 1002fd8:	e8 22 df ff ff       	call   1000eff <vmalloc>
 1002fdd:	89 c2                	mov    edx,eax
 1002fdf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002fe2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002fe8:	05 84 49 40 00       	add    eax,0x404984
 1002fed:	89 10                	mov    DWORD PTR [eax],edx
 1002fef:	e8 0b df ff ff       	call   1000eff <vmalloc>
 1002ff4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002ff7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002ffa:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003000:	05 84 49 40 00       	add    eax,0x404984
 1003005:	8b 00                	mov    eax,DWORD PTR [eax]
 1003007:	c7 00 07 20 00 00    	mov    DWORD PTR [eax],0x2007
 100300d:	e8 ed de ff ff       	call   1000eff <vmalloc>
 1003012:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003015:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003018:	83 c8 07             	or     eax,0x7
 100301b:	89 c2                	mov    edx,eax
 100301d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003020:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003026:	05 84 49 40 00       	add    eax,0x404984
 100302b:	8b 00                	mov    eax,DWORD PTR [eax]
 100302d:	83 c0 18             	add    eax,0x18
 1003030:	89 10                	mov    DWORD PTR [eax],edx
 1003032:	e8 e2 e0 ff ff       	call   1001119 <req_a_page>
 1003037:	83 ec 0c             	sub    esp,0xc
 100303a:	50                   	push   eax
 100303b:	e8 36 e2 ff ff       	call   1001276 <get_phyaddr>
 1003040:	83 c4 10             	add    esp,0x10
 1003043:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1003046:	81 c2 fc 0f 00 00    	add    edx,0xffc
 100304c:	83 c8 07             	or     eax,0x7
 100304f:	89 02                	mov    DWORD PTR [edx],eax
 1003051:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003054:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100305a:	05 84 49 40 00       	add    eax,0x404984
 100305f:	8b 00                	mov    eax,DWORD PTR [eax]
 1003061:	89 c2                	mov    edx,eax
 1003063:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003066:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100306c:	05 2c 4a 40 00       	add    eax,0x404a2c
 1003071:	89 10                	mov    DWORD PTR [eax],edx
 1003073:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003076:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100307c:	05 04 49 40 00       	add    eax,0x404904
 1003081:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1003087:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100308a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003090:	8d 90 88 49 40 00    	lea    edx,[eax+0x404988]
 1003096:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1003099:	89 02                	mov    DWORD PTR [edx],eax
 100309b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100309e:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10030a4:	8d 90 8c 49 40 00    	lea    edx,[eax+0x40498c]
 10030aa:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10030ad:	89 02                	mov    DWORD PTR [edx],eax
 10030af:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10030b2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10030b8:	8d 90 30 4a 40 00    	lea    edx,[eax+0x404a30]
 10030be:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10030c1:	89 02                	mov    DWORD PTR [edx],eax
 10030c3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10030c6:	c9                   	leave  
 10030c7:	c3                   	ret    

010030c8 <sys_malloc>:
 10030c8:	55                   	push   ebp
 10030c9:	89 e5                	mov    ebp,esp
 10030cb:	83 ec 20             	sub    esp,0x20
 10030ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10030d1:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10030d7:	85 c0                	test   eax,eax
 10030d9:	0f 48 c2             	cmovs  eax,edx
 10030dc:	c1 f8 0c             	sar    eax,0xc
 10030df:	89 c1                	mov    ecx,eax
 10030e1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10030e4:	99                   	cdq    
 10030e5:	c1 ea 14             	shr    edx,0x14
 10030e8:	01 d0                	add    eax,edx
 10030ea:	25 ff 0f 00 00       	and    eax,0xfff
 10030ef:	29 d0                	sub    eax,edx
 10030f1:	01 c8                	add    eax,ecx
 10030f3:	85 c0                	test   eax,eax
 10030f5:	0f 95 c0             	setne  al
 10030f8:	0f b6 c0             	movzx  eax,al
 10030fb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10030fe:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1003103:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003109:	05 14 49 40 00       	add    eax,0x404914
 100310e:	8b 00                	mov    eax,DWORD PTR [eax]
 1003110:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1003113:	eb 09                	jmp    100311e <sys_malloc+0x56>
 1003115:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003118:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100311b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100311e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003121:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1003124:	85 c0                	test   eax,eax
 1003126:	74 14                	je     100313c <sys_malloc+0x74>
 1003128:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100312b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100312e:	85 c0                	test   eax,eax
 1003130:	75 0a                	jne    100313c <sys_malloc+0x74>
 1003132:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003135:	8b 00                	mov    eax,DWORD PTR [eax]
 1003137:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 100313a:	7e d9                	jle    1003115 <sys_malloc+0x4d>
 100313c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100313f:	8b 00                	mov    eax,DWORD PTR [eax]
 1003141:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1003144:	7e 6f                	jle    10031b5 <sys_malloc+0xed>
 1003146:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 100314b:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003151:	05 18 49 40 00       	add    eax,0x404918
 1003156:	8b 10                	mov    edx,DWORD PTR [eax]
 1003158:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100315b:	c1 e0 0c             	shl    eax,0xc
 100315e:	01 d0                	add    eax,edx
 1003160:	3d ff ff ef 01       	cmp    eax,0x1efffff
 1003165:	7e 0a                	jle    1003171 <sys_malloc+0xa9>
 1003167:	b8 00 00 00 00       	mov    eax,0x0
 100316c:	e9 a6 00 00 00       	jmp    1003217 <sys_malloc+0x14f>
 1003171:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003174:	8b 10                	mov    edx,DWORD PTR [eax]
 1003176:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003179:	29 d0                	sub    eax,edx
 100317b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 100317e:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1003183:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003189:	05 18 49 40 00       	add    eax,0x404918
 100318e:	8b 00                	mov    eax,DWORD PTR [eax]
 1003190:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1003193:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100319a:	eb 11                	jmp    10031ad <sys_malloc+0xe5>
 100319c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100319f:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10031a2:	81 45 f8 00 10 00 00 	add    DWORD PTR [ebp-0x8],0x1000
 10031a9:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10031ad:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10031b0:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10031b3:	7c e7                	jl     100319c <sys_malloc+0xd4>
 10031b5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10031b8:	8b 00                	mov    eax,DWORD PTR [eax]
 10031ba:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 10031bd:	7d 46                	jge    1003205 <sys_malloc+0x13d>
 10031bf:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10031c2:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 10031c5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031c8:	83 c0 01             	add    eax,0x1
 10031cb:	c1 e0 0c             	shl    eax,0xc
 10031ce:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
 10031d1:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 10031d4:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10031d7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10031da:	8b 00                	mov    eax,DWORD PTR [eax]
 10031dc:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 10031df:	8d 50 ff             	lea    edx,[eax-0x1]
 10031e2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10031e5:	89 10                	mov    DWORD PTR [eax],edx
 10031e7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10031ea:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10031ed:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10031f0:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 10031f3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10031f6:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 10031f9:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 10031fc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10031ff:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1003202:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1003205:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003208:	c7 40 04 01 00 00 00 	mov    DWORD PTR [eax+0x4],0x1
 100320f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003212:	05 00 10 00 00       	add    eax,0x1000
 1003217:	c9                   	leave  
 1003218:	c3                   	ret    

01003219 <sys_free>:
 1003219:	55                   	push   ebp
 100321a:	89 e5                	mov    ebp,esp
 100321c:	83 ec 10             	sub    esp,0x10
 100321f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003222:	2d 00 10 00 00       	sub    eax,0x1000
 1003227:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 100322a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100322d:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 1003234:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1003237:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100323a:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100323d:	eb 27                	jmp    1003266 <sys_free+0x4d>
 100323f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003242:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003245:	85 c0                	test   eax,eax
 1003247:	75 25                	jne    100326e <sys_free+0x55>
 1003249:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100324c:	8b 10                	mov    edx,DWORD PTR [eax]
 100324e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003251:	8b 00                	mov    eax,DWORD PTR [eax]
 1003253:	83 c0 01             	add    eax,0x1
 1003256:	01 c2                	add    edx,eax
 1003258:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100325b:	89 10                	mov    DWORD PTR [eax],edx
 100325d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003260:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1003263:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1003266:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 100326a:	75 d3                	jne    100323f <sys_free+0x26>
 100326c:	eb 01                	jmp    100326f <sys_free+0x56>
 100326e:	90                   	nop
 100326f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1003272:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1003275:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1003278:	eb 27                	jmp    10032a1 <sys_free+0x88>
 100327a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100327d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003280:	85 c0                	test   eax,eax
 1003282:	75 25                	jne    10032a9 <sys_free+0x90>
 1003284:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003287:	8b 10                	mov    edx,DWORD PTR [eax]
 1003289:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100328c:	8b 00                	mov    eax,DWORD PTR [eax]
 100328e:	83 c0 01             	add    eax,0x1
 1003291:	01 c2                	add    edx,eax
 1003293:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003296:	89 10                	mov    DWORD PTR [eax],edx
 1003298:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100329b:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 100329e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 10032a1:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 10032a5:	75 d3                	jne    100327a <sys_free+0x61>
 10032a7:	eb 01                	jmp    10032aa <sys_free+0x91>
 10032a9:	90                   	nop
 10032aa:	b8 00 00 00 00       	mov    eax,0x0
 10032af:	c9                   	leave  
 10032b0:	c3                   	ret    
 10032b1:	66 90                	xchg   ax,ax
 10032b3:	66 90                	xchg   ax,ax
 10032b5:	66 90                	xchg   ax,ax
 10032b7:	66 90                	xchg   ax,ax
 10032b9:	66 90                	xchg   ax,ax
 10032bb:	66 90                	xchg   ax,ax
 10032bd:	66 90                	xchg   ax,ax
 10032bf:	90                   	nop

010032c0 <outb>:
 10032c0:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 10032c5:	8a 44 24 08          	mov    al,BYTE PTR [esp+0x8]
 10032c9:	ee                   	out    dx,al
 10032ca:	e8 31 00 00 00       	call   1003300 <io_delay>
 10032cf:	c3                   	ret    

010032d0 <outw>:
 10032d0:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 10032d5:	66 8b 44 24 08       	mov    ax,WORD PTR [esp+0x8]
 10032da:	66 ef                	out    dx,ax
 10032dc:	90                   	nop
 10032dd:	90                   	nop
 10032de:	90                   	nop
 10032df:	c3                   	ret    

010032e0 <inb>:
 10032e0:	31 c0                	xor    eax,eax
 10032e2:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 10032e7:	ec                   	in     al,dx
 10032e8:	90                   	nop
 10032e9:	90                   	nop
 10032ea:	90                   	nop
 10032eb:	c3                   	ret    

010032ec <inw>:
 10032ec:	31 c0                	xor    eax,eax
 10032ee:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 10032f3:	66 ed                	in     ax,dx
 10032f5:	90                   	nop
 10032f6:	90                   	nop
 10032f7:	90                   	nop
 10032f8:	c3                   	ret    

010032f9 <eoi>:
 10032f9:	b0 20                	mov    al,0x20
 10032fb:	e6 a0                	out    0xa0,al
 10032fd:	e6 20                	out    0x20,al
 10032ff:	c3                   	ret    

01003300 <io_delay>:
 1003300:	90                   	nop
 1003301:	90                   	nop
 1003302:	90                   	nop
 1003303:	90                   	nop
 1003304:	c3                   	ret    

01003305 <turn_on_int>:
 1003305:	b0 f8                	mov    al,0xf8
 1003307:	e6 21                	out    0x21,al
 1003309:	e8 f2 ff ff ff       	call   1003300 <io_delay>
 100330e:	b0 ef                	mov    al,0xef
 1003310:	e6 a1                	out    0xa1,al
 1003312:	e8 e9 ff ff ff       	call   1003300 <io_delay>
 1003317:	0f 01 1d 47 33 00 01 	lidtd  ds:0x1003347
 100331e:	90                   	nop
 100331f:	90                   	nop
 1003320:	90                   	nop
 1003321:	90                   	nop
 1003322:	fb                   	sti    
 1003323:	c3                   	ret    

01003324 <report_back_trace_of_err>:
 1003324:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1003328:	50                   	push   eax
 1003329:	68 32 33 00 01       	push   0x1003332
 100332e:	83 c4 08             	add    esp,0x8
 1003331:	c3                   	ret    

01003332 <bt_msg>:
 1003332:	65 72 72             	gs jb  10033a7 <fill_desc+0x5a>
 1003335:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1003336:	72 20                	jb     1003358 <fill_desc+0xb>
 1003338:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1003339:	63 63 75             	arpl   WORD PTR [ebx+0x75],sp
 100333c:	72 73                	jb     10033b1 <fill_desc+0x64>
 100333e:	20 61 74             	and    BYTE PTR [ecx+0x74],ah
 1003341:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR ds:0x6e5c78

01003347 <idtptr>:
 1003347:	f8                   	clc    
 1003348:	07                   	pop    es
 1003349:	00 00                	add    BYTE PTR [eax],al
	...

0100334d <fill_desc>:
 100334d:	55                   	push   ebp
 100334e:	89 e5                	mov    ebp,esp
 1003350:	83 ec 04             	sub    esp,0x4
 1003353:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003356:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 100335a:	8b 15 50 70 00 01    	mov    edx,DWORD PTR ds:0x1007050
 1003360:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003363:	c1 e0 03             	shl    eax,0x3
 1003366:	01 d0                	add    eax,edx
 1003368:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100336b:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 100336f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003372:	c1 e8 10             	shr    eax,0x10
 1003375:	89 c1                	mov    ecx,eax
 1003377:	8b 15 50 70 00 01    	mov    edx,DWORD PTR ds:0x1007050
 100337d:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003380:	c1 e0 03             	shl    eax,0x3
 1003383:	01 d0                	add    eax,edx
 1003385:	89 ca                	mov    edx,ecx
 1003387:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 100338a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100338d:	c1 e8 18             	shr    eax,0x18
 1003390:	89 c1                	mov    ecx,eax
 1003392:	8b 15 50 70 00 01    	mov    edx,DWORD PTR ds:0x1007050
 1003398:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100339b:	c1 e0 03             	shl    eax,0x3
 100339e:	01 d0                	add    eax,edx
 10033a0:	89 ca                	mov    edx,ecx
 10033a2:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 10033a5:	8b 15 50 70 00 01    	mov    edx,DWORD PTR ds:0x1007050
 10033ab:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10033ae:	c1 e0 03             	shl    eax,0x3
 10033b1:	01 d0                	add    eax,edx
 10033b3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 10033b6:	66 89 10             	mov    WORD PTR [eax],dx
 10033b9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10033bc:	c1 e8 10             	shr    eax,0x10
 10033bf:	83 e0 0f             	and    eax,0xf
 10033c2:	8b 0d 50 70 00 01    	mov    ecx,DWORD PTR ds:0x1007050
 10033c8:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10033cb:	c1 e2 03             	shl    edx,0x3
 10033ce:	01 ca                	add    edx,ecx
 10033d0:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 10033d4:	66 89 42 05          	mov    WORD PTR [edx+0x5],ax
 10033d8:	90                   	nop
 10033d9:	c9                   	leave  
 10033da:	c3                   	ret    

010033db <fill_gate>:
 10033db:	55                   	push   ebp
 10033dc:	89 e5                	mov    ebp,esp
 10033de:	83 ec 18             	sub    esp,0x18
 10033e1:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 10033e4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10033e7:	66 89 55 ec          	mov    WORD PTR [ebp-0x14],dx
 10033eb:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
 10033ef:	a1 50 70 00 01       	mov    eax,ds:0x1007050
 10033f4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 10033f7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10033fa:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003401:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003404:	01 d0                	add    eax,edx
 1003406:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1003409:	66 89 10             	mov    WORD PTR [eax],dx
 100340c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100340f:	c1 e8 10             	shr    eax,0x10
 1003412:	89 c2                	mov    edx,eax
 1003414:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003417:	8d 0c c5 00 00 00 00 	lea    ecx,[eax*8+0x0]
 100341e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003421:	01 c8                	add    eax,ecx
 1003423:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
 1003427:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100342a:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003431:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003434:	01 c2                	add    edx,eax
 1003436:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 100343a:	66 89 42 02          	mov    WORD PTR [edx+0x2],ax
 100343e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003441:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003448:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100344b:	01 c2                	add    edx,eax
 100344d:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
 1003451:	66 89 42 04          	mov    WORD PTR [edx+0x4],ax
 1003455:	90                   	nop
 1003456:	c9                   	leave  
 1003457:	c3                   	ret    

01003458 <fill_ldt_desc>:
 1003458:	55                   	push   ebp
 1003459:	89 e5                	mov    ebp,esp
 100345b:	83 ec 04             	sub    esp,0x4
 100345e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003461:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 1003465:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003468:	89 c2                	mov    edx,eax
 100346a:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100346d:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 1003471:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003474:	c1 e8 10             	shr    eax,0x10
 1003477:	89 c2                	mov    edx,eax
 1003479:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100347c:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 100347f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003482:	c1 e8 18             	shr    eax,0x18
 1003485:	89 c2                	mov    edx,eax
 1003487:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100348a:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 100348d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1003490:	89 c2                	mov    edx,eax
 1003492:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003495:	66 89 10             	mov    WORD PTR [eax],dx
 1003498:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100349b:	c1 e8 10             	shr    eax,0x10
 100349e:	c1 e0 08             	shl    eax,0x8
 10034a1:	66 25 00 0f          	and    ax,0xf00
 10034a5:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 10034a9:	89 c2                	mov    edx,eax
 10034ab:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10034ae:	66 89 50 05          	mov    WORD PTR [eax+0x5],dx
 10034b2:	90                   	nop
 10034b3:	c9                   	leave  
 10034b4:	c3                   	ret    
 10034b5:	66 90                	xchg   ax,ax
 10034b7:	66 90                	xchg   ax,ax
 10034b9:	66 90                	xchg   ax,ax
 10034bb:	66 90                	xchg   ax,ax
 10034bd:	66 90                	xchg   ax,ax
 10034bf:	90                   	nop

010034c0 <fill_desc>:
 10034c0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10034c4:	8b 5c 24 08          	mov    ebx,DWORD PTR [esp+0x8]
 10034c8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10034cc:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 10034d0:	be 00 60 00 00       	mov    esi,0x6000
 10034d5:	c1 e2 03             	shl    edx,0x3
 10034d8:	01 d6                	add    esi,edx
 10034da:	66 89 1e             	mov    WORD PTR [esi],bx
 10034dd:	66 89 46 02          	mov    WORD PTR [esi+0x2],ax
 10034e1:	c1 e8 10             	shr    eax,0x10
 10034e4:	88 46 04             	mov    BYTE PTR [esi+0x4],al
 10034e7:	c1 eb 10             	shr    ebx,0x10
 10034ea:	88 5e 06             	mov    BYTE PTR [esi+0x6],bl
 10034ed:	88 66 07             	mov    BYTE PTR [esi+0x7],ah
 10034f0:	09 4e 05             	or     DWORD PTR [esi+0x5],ecx
 10034f3:	c3                   	ret    

010034f4 <clock_c>:
 10034f4:	55                   	push   ebp
 10034f5:	89 e5                	mov    ebp,esp
 10034f7:	83 ec 08             	sub    esp,0x8
 10034fa:	a1 40 70 00 01       	mov    eax,ds:0x1007040
 10034ff:	85 c0                	test   eax,eax
 1003501:	75 05                	jne    1003508 <clock_c+0x14>
 1003503:	e8 56 f3 ff ff       	call   100285e <manage_proc>
 1003508:	90                   	nop
 1003509:	c9                   	leave  
 100350a:	c3                   	ret    
 100350b:	66 90                	xchg   ax,ax
 100350d:	66 90                	xchg   ax,ax
 100350f:	90                   	nop

01003510 <clock>:
 1003510:	83 3d 40 70 00 01 00 	cmp    DWORD PTR ds:0x1007040,0x0
 1003517:	75 5d                	jne    1003576 <clock.normal_part>
 1003519:	60                   	pusha  
 100351a:	b9 08 00 00 00       	mov    ecx,0x8
 100351f:	89 e6                	mov    esi,esp
 1003521:	bf 00 a7 40 00       	mov    edi,0x40a700
 1003526:	83 c7 44             	add    edi,0x44

01003529 <clock.saver_loop>:
 1003529:	8b 1e                	mov    ebx,DWORD PTR [esi]
 100352b:	89 1f                	mov    DWORD PTR [edi],ebx
 100352d:	83 c6 04             	add    esi,0x4
 1003530:	83 ef 04             	sub    edi,0x4
 1003533:	e2 f4                	loop   1003529 <clock.saver_loop>
 1003535:	61                   	popa   
 1003536:	bf 00 a7 40 00       	mov    edi,0x40a700
 100353b:	8b 04 24             	mov    eax,DWORD PTR [esp]
 100353e:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
 1003541:	9c                   	pushf  
 1003542:	5b                   	pop    ebx
 1003543:	81 cb 00 02 00 00    	or     ebx,0x200
 1003549:	89 5f 24             	mov    DWORD PTR [edi+0x24],ebx
 100354c:	66 8c c0             	mov    ax,es
 100354f:	66 89 47 48          	mov    WORD PTR [edi+0x48],ax
 1003553:	66 8c c8             	mov    ax,cs
 1003556:	66 89 47 4c          	mov    WORD PTR [edi+0x4c],ax
 100355a:	66 8c d0             	mov    ax,ss
 100355d:	66 89 47 50          	mov    WORD PTR [edi+0x50],ax
 1003561:	66 8c d8             	mov    ax,ds
 1003564:	66 89 47 54          	mov    WORD PTR [edi+0x54],ax
 1003568:	66 8c e0             	mov    ax,fs
 100356b:	66 89 47 58          	mov    WORD PTR [edi+0x58],ax
 100356f:	66 8c e8             	mov    ax,gs
 1003572:	66 89 47 5c          	mov    WORD PTR [edi+0x5c],ax

01003576 <clock.normal_part>:
 1003576:	b0 20                	mov    al,0x20
 1003578:	e6 a0                	out    0xa0,al
 100357a:	e6 20                	out    0x20,al
 100357c:	e8 73 ff ff ff       	call   10034f4 <clock_c>
 1003581:	cf                   	iret   

01003582 <execute>:
 1003582:	55                   	push   ebp
 1003583:	89 e5                	mov    ebp,esp
 1003585:	83 ec 18             	sub    esp,0x18
 1003588:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 100358f:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 1003596:	83 ec 08             	sub    esp,0x8
 1003599:	6a 01                	push   0x1
 100359b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100359e:	e8 e8 e0 ff ff       	call   100168b <sys_open>
 10035a3:	83 c4 10             	add    esp,0x10
 10035a6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10035a9:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 10035ad:	75 0a                	jne    10035b9 <execute+0x37>
 10035af:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10035b4:	e9 92 00 00 00       	jmp    100364b <execute+0xc9>
 10035b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10035bc:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10035bf:	eb 04                	jmp    10035c5 <execute+0x43>
 10035c1:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10035c5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10035c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10035cb:	84 c0                	test   al,al
 10035cd:	75 f2                	jne    10035c1 <execute+0x3f>
 10035cf:	eb 04                	jmp    10035d5 <execute+0x53>
 10035d1:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
 10035d5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10035d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10035db:	3c 2f                	cmp    al,0x2f
 10035dd:	74 08                	je     10035e7 <execute+0x65>
 10035df:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10035e2:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 10035e5:	77 ea                	ja     10035d1 <execute+0x4f>
 10035e7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10035ea:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 10035ed:	76 2c                	jbe    100361b <execute+0x99>
 10035ef:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10035f2:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10035f5:	83 ec 08             	sub    esp,0x8
 10035f8:	6a 01                	push   0x1
 10035fa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10035fd:	e8 89 e0 ff ff       	call   100168b <sys_open>
 1003602:	83 c4 10             	add    esp,0x10
 1003605:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003608:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 100360c:	75 07                	jne    1003615 <execute+0x93>
 100360e:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003613:	eb 36                	jmp    100364b <execute+0xc9>
 1003615:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003618:	c6 00 2f             	mov    BYTE PTR [eax],0x2f
 100361b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100361e:	6b c0 4c             	imul   eax,eax,0x4c
 1003621:	8d 90 60 04 40 00    	lea    edx,[eax+0x400460]
 1003627:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100362a:	6b c0 4c             	imul   eax,eax,0x4c
 100362d:	05 60 04 40 00       	add    eax,0x400460
 1003632:	b9 a9 36 00 01       	mov    ecx,0x10036a9
 1003637:	83 ec 04             	sub    esp,0x4
 100363a:	52                   	push   edx
 100363b:	50                   	push   eax
 100363c:	51                   	push   ecx
 100363d:	e8 4c f9 ff ff       	call   1002f8e <reg_proc>
 1003642:	83 c4 10             	add    esp,0x10
 1003645:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1003648:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 100364b:	c9                   	leave  
 100364c:	c3                   	ret    

0100364d <exec_call>:
 100364d:	55                   	push   ebp
 100364e:	89 e5                	mov    ebp,esp
 1003650:	83 ec 18             	sub    esp,0x18
 1003653:	83 ec 0c             	sub    esp,0xc
 1003656:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1003659:	e8 24 ff ff ff       	call   1003582 <execute>
 100365e:	83 c4 10             	add    esp,0x10
 1003661:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003664:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003667:	01 c0                	add    eax,eax
 1003669:	83 c0 05             	add    eax,0x5
 100366c:	c1 e0 03             	shl    eax,0x3
 100366f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1003672:	83 ec 0c             	sub    esp,0xc
 1003675:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1003678:	e8 db f2 ff ff       	call   1002958 <switch_proc_tss>
 100367d:	83 c4 10             	add    esp,0x10
 1003680:	90                   	nop
 1003681:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003684:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100368a:	05 00 49 40 00       	add    eax,0x404900
 100368f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003692:	83 f8 03             	cmp    eax,0x3
 1003695:	75 ea                	jne    1003681 <exec_call+0x34>
 1003697:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100369a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10036a0:	05 10 49 40 00       	add    eax,0x404910
 10036a5:	8b 00                	mov    eax,DWORD PTR [eax]
 10036a7:	c9                   	leave  
 10036a8:	c3                   	ret    

010036a9 <proc_start>:
 10036a9:	55                   	push   ebp
 10036aa:	89 e5                	mov    ebp,esp
 10036ac:	83 ec 08             	sub    esp,0x8
 10036af:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10036b4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10036ba:	05 00 49 40 00       	add    eax,0x404900
 10036bf:	83 ec 0c             	sub    esp,0xc
 10036c2:	50                   	push   eax
 10036c3:	e8 24 00 00 00       	call   10036ec <load_pe>
 10036c8:	83 c4 10             	add    esp,0x10
 10036cb:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 10036d0:	83 ec 0c             	sub    esp,0xc
 10036d3:	50                   	push   eax
 10036d4:	e8 f8 f6 ff ff       	call   1002dd1 <del_proc>
 10036d9:	83 c4 10             	add    esp,0x10
 10036dc:	83 ec 0c             	sub    esp,0xc
 10036df:	6a 00                	push   0x0
 10036e1:	e8 72 f2 ff ff       	call   1002958 <switch_proc_tss>
 10036e6:	83 c4 10             	add    esp,0x10
 10036e9:	90                   	nop
 10036ea:	c9                   	leave  
 10036eb:	c3                   	ret    

010036ec <load_pe>:
 10036ec:	55                   	push   ebp
 10036ed:	89 e5                	mov    ebp,esp
 10036ef:	53                   	push   ebx
 10036f0:	81 ec 14 02 00 00    	sub    esp,0x214
 10036f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10036f9:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 10036ff:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1003702:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1003705:	8b 00                	mov    eax,DWORD PTR [eax]
 1003707:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 100370a:	6a 40                	push   0x40
 100370c:	6a 00                	push   0x0
 100370e:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 1003714:	50                   	push   eax
 1003715:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003718:	e8 f2 e2 ff ff       	call   1001a0f <sys_read>
 100371d:	83 c4 10             	add    esp,0x10
 1003720:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [ebp-0xd0]
 1003726:	68 f8 00 00 00       	push   0xf8
 100372b:	50                   	push   eax
 100372c:	8d 85 fc fd ff ff    	lea    eax,[ebp-0x204]
 1003732:	50                   	push   eax
 1003733:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003736:	e8 d4 e2 ff ff       	call   1001a0f <sys_read>
 100373b:	83 c4 10             	add    esp,0x10
 100373e:	8b 85 30 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1d0]
 1003744:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003747:	8b 85 4c fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b4]
 100374d:	c1 e8 0c             	shr    eax,0xc
 1003750:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1003753:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003756:	c1 e8 16             	shr    eax,0x16
 1003759:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 100375c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100375f:	25 ff ff 3f 00       	and    eax,0x3fffff
 1003764:	c1 e8 0c             	shr    eax,0xc
 1003767:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 100376a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100376d:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 1003773:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1003776:	c1 e0 02             	shl    eax,0x2
 1003779:	01 d0                	add    eax,edx
 100377b:	8b 00                	mov    eax,DWORD PTR [eax]
 100377d:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003782:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 1003785:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100378c:	eb 3f                	jmp    10037cd <load_pe+0xe1>
 100378e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003791:	99                   	cdq    
 1003792:	c1 ea 16             	shr    edx,0x16
 1003795:	01 d0                	add    eax,edx
 1003797:	25 ff 03 00 00       	and    eax,0x3ff
 100379c:	29 d0                	sub    eax,edx
 100379e:	89 c2                	mov    edx,eax
 10037a0:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 10037a3:	01 d0                	add    eax,edx
 10037a5:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10037ac:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 10037af:	01 d0                	add    eax,edx
 10037b1:	8b 00                	mov    eax,DWORD PTR [eax]
 10037b3:	83 e0 01             	and    eax,0x1
 10037b6:	85 c0                	test   eax,eax
 10037b8:	74 0f                	je     10037c9 <load_pe+0xdd>
 10037ba:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 10037be:	74 09                	je     10037c9 <load_pe+0xdd>
 10037c0:	81 45 f4 00 10 00 00 	add    DWORD PTR [ebp-0xc],0x1000
 10037c7:	eb 8a                	jmp    1003753 <load_pe+0x67>
 10037c9:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10037cd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10037d0:	3b 45 b8             	cmp    eax,DWORD PTR [ebp-0x48]
 10037d3:	7c b9                	jl     100378e <load_pe+0xa2>
 10037d5:	90                   	nop
 10037d6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037d9:	68 00 10 00 00       	push   0x1000
 10037de:	6a 00                	push   0x0
 10037e0:	50                   	push   eax
 10037e1:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 10037e4:	e8 26 e2 ff ff       	call   1001a0f <sys_read>
 10037e9:	83 c4 10             	add    esp,0x10
 10037ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037ef:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
 10037f2:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
 10037f5:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 10037f8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037fb:	01 d0                	add    eax,edx
 10037fd:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 1003800:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003803:	83 c0 04             	add    eax,0x4
 1003806:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
 1003809:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100380c:	8b 40 50             	mov    eax,DWORD PTR [eax+0x50]
 100380f:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
 1003812:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
 1003815:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 100381b:	85 c0                	test   eax,eax
 100381d:	0f 48 c2             	cmovs  eax,edx
 1003820:	c1 f8 0c             	sar    eax,0xc
 1003823:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
 1003826:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003829:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
 100382c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100382f:	01 d0                	add    eax,edx
 1003831:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
 1003834:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 1003837:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 100383d:	85 c0                	test   eax,eax
 100383f:	0f 48 c2             	cmovs  eax,edx
 1003842:	c1 f8 0a             	sar    eax,0xa
 1003845:	89 c1                	mov    ecx,eax
 1003847:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 100384a:	99                   	cdq    
 100384b:	c1 ea 16             	shr    edx,0x16
 100384e:	01 d0                	add    eax,edx
 1003850:	25 ff 03 00 00       	and    eax,0x3ff
 1003855:	29 d0                	sub    eax,edx
 1003857:	01 c8                	add    eax,ecx
 1003859:	85 c0                	test   eax,eax
 100385b:	0f 95 c0             	setne  al
 100385e:	0f b6 c0             	movzx  eax,al
 1003861:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 1003864:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 1003867:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 100386d:	85 c0                	test   eax,eax
 100386f:	0f 48 c2             	cmovs  eax,edx
 1003872:	c1 f8 16             	sar    eax,0x16
 1003875:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
 1003878:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100387b:	05 f8 00 00 00       	add    eax,0xf8
 1003880:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003883:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003886:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 100388a:	0f b7 d0             	movzx  edx,ax
 100388d:	89 d0                	mov    eax,edx
 100388f:	c1 e0 02             	shl    eax,0x2
 1003892:	01 d0                	add    eax,edx
 1003894:	c1 e0 03             	shl    eax,0x3
 1003897:	05 38 01 00 00       	add    eax,0x138
 100389c:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 100389f:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10038a2:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
 10038a5:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 10038a8:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10038ab:	99                   	cdq    
 10038ac:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10038af:	89 d0                	mov    eax,edx
 10038b1:	85 c0                	test   eax,eax
 10038b3:	74 17                	je     10038cc <load_pe+0x1e0>
 10038b5:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10038b8:	99                   	cdq    
 10038b9:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10038bc:	89 d1                	mov    ecx,edx
 10038be:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10038c1:	29 c8                	sub    eax,ecx
 10038c3:	89 c2                	mov    edx,eax
 10038c5:	8b 45 84             	mov    eax,DWORD PTR [ebp-0x7c]
 10038c8:	01 d0                	add    eax,edx
 10038ca:	eb 03                	jmp    10038cf <load_pe+0x1e3>
 10038cc:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10038cf:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10038d2:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 10038d9:	eb 4e                	jmp    1003929 <load_pe+0x23d>
 10038db:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10038de:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 10038e1:	25 00 00 00 02       	and    eax,0x2000000
 10038e6:	89 85 34 ff ff ff    	mov    DWORD PTR [ebp-0xcc],eax
 10038ec:	83 bd 34 ff ff ff 00 	cmp    DWORD PTR [ebp-0xcc],0x0
 10038f3:	75 2b                	jne    1003920 <load_pe+0x234>
 10038f5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10038f8:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 10038fb:	89 c1                	mov    ecx,eax
 10038fd:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003900:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1003903:	89 c2                	mov    edx,eax
 1003905:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003908:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
 100390b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100390e:	01 d8                	add    eax,ebx
 1003910:	51                   	push   ecx
 1003911:	52                   	push   edx
 1003912:	50                   	push   eax
 1003913:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003916:	e8 f4 e0 ff ff       	call   1001a0f <sys_read>
 100391b:	83 c4 10             	add    esp,0x10
 100391e:	eb 01                	jmp    1003921 <load_pe+0x235>
 1003920:	90                   	nop
 1003921:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 1003925:	83 45 ec 28          	add    DWORD PTR [ebp-0x14],0x28
 1003929:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100392c:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 1003930:	0f b7 c0             	movzx  eax,ax
 1003933:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1003936:	7c a3                	jl     10038db <load_pe+0x1ef>
 1003938:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100393b:	83 e8 80             	sub    eax,0xffffff80
 100393e:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 1003941:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003944:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003947:	85 c0                	test   eax,eax
 1003949:	0f 84 22 02 00 00    	je     1003b71 <load_pe+0x485>
 100394f:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003952:	8b 10                	mov    edx,DWORD PTR [eax]
 1003954:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003957:	01 d0                	add    eax,edx
 1003959:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100395f:	8b 85 7c ff ff ff    	mov    eax,DWORD PTR [ebp-0x84]
 1003965:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1003968:	e9 f7 01 00 00       	jmp    1003b64 <load_pe+0x478>
 100396d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003970:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1003973:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003976:	01 d0                	add    eax,edx
 1003978:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 100397e:	83 ec 08             	sub    esp,0x8
 1003981:	68 3c 75 00 01       	push   0x100753c
 1003986:	ff b5 78 ff ff ff    	push   DWORD PTR [ebp-0x88]
 100398c:	e8 e0 31 00 00       	call   1006b71 <strcmp>
 1003991:	83 c4 10             	add    esp,0x10
 1003994:	85 c0                	test   eax,eax
 1003996:	75 09                	jne    10039a1 <load_pe+0x2b5>
 1003998:	c7 45 e0 00 00 c0 01 	mov    DWORD PTR [ebp-0x20],0x1c00000
 100399f:	eb 28                	jmp    10039c9 <load_pe+0x2dd>
 10039a1:	83 ec 0c             	sub    esp,0xc
 10039a4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10039a7:	e8 40 fd ff ff       	call   10036ec <load_pe>
 10039ac:	83 c4 10             	add    esp,0x10
 10039af:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 10039b5:	83 ec 0c             	sub    esp,0xc
 10039b8:	ff b5 74 ff ff ff    	push   DWORD PTR [ebp-0x8c]
 10039be:	e8 43 03 00 00       	call   1003d06 <get_module_addr>
 10039c3:	83 c4 10             	add    esp,0x10
 10039c6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10039c9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10039cc:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 10039d2:	8b 85 70 ff ff ff    	mov    eax,DWORD PTR [ebp-0x90]
 10039d8:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 10039db:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10039de:	01 d0                	add    eax,edx
 10039e0:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 10039e6:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
 10039ec:	8b 50 78             	mov    edx,DWORD PTR [eax+0x78]
 10039ef:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10039f2:	01 d0                	add    eax,edx
 10039f4:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
 10039fa:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003a00:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1003a03:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
 1003a09:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003a0f:	8b 50 20             	mov    edx,DWORD PTR [eax+0x20]
 1003a12:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003a15:	01 d0                	add    eax,edx
 1003a17:	89 85 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],eax
 1003a1d:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003a23:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
 1003a26:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003a29:	01 d0                	add    eax,edx
 1003a2b:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
 1003a31:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003a37:	8b 50 24             	mov    edx,DWORD PTR [eax+0x24]
 1003a3a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003a3d:	01 d0                	add    eax,edx
 1003a3f:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
 1003a45:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003a4b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1003a4e:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
 1003a54:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003a57:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1003a5a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003a5d:	01 d0                	add    eax,edx
 1003a5f:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1003a62:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003a65:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1003a68:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003a6b:	01 d0                	add    eax,edx
 1003a6d:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1003a70:	e9 de 00 00 00       	jmp    1003b53 <load_pe+0x467>
 1003a75:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003a78:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a7a:	85 c0                	test   eax,eax
 1003a7c:	79 3e                	jns    1003abc <load_pe+0x3d0>
 1003a7e:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003a81:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a83:	25 ff ff ff 7f       	and    eax,0x7fffffff
 1003a88:	2b 85 54 ff ff ff    	sub    eax,DWORD PTR [ebp-0xac]
 1003a8e:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
 1003a94:	8b 85 48 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb8]
 1003a9a:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003aa1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 1003aa7:	01 d0                	add    eax,edx
 1003aa9:	8b 10                	mov    edx,DWORD PTR [eax]
 1003aab:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003aae:	01 d0                	add    eax,edx
 1003ab0:	89 c2                	mov    edx,eax
 1003ab2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003ab5:	89 10                	mov    DWORD PTR [eax],edx
 1003ab7:	e9 8f 00 00 00       	jmp    1003b4b <load_pe+0x45f>
 1003abc:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003abf:	8b 00                	mov    eax,DWORD PTR [eax]
 1003ac1:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
 1003ac7:	83 85 50 ff ff ff 02 	add    DWORD PTR [ebp-0xb0],0x2
 1003ace:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 1003ad5:	eb 69                	jmp    1003b40 <load_pe+0x454>
 1003ad7:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003ada:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003ae1:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa0]
 1003ae7:	01 d0                	add    eax,edx
 1003ae9:	8b 00                	mov    eax,DWORD PTR [eax]
 1003aeb:	83 ec 08             	sub    esp,0x8
 1003aee:	50                   	push   eax
 1003aef:	ff b5 50 ff ff ff    	push   DWORD PTR [ebp-0xb0]
 1003af5:	e8 77 30 00 00       	call   1006b71 <strcmp>
 1003afa:	83 c4 10             	add    esp,0x10
 1003afd:	85 c0                	test   eax,eax
 1003aff:	75 3b                	jne    1003b3c <load_pe+0x450>
 1003b01:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003b04:	8d 14 00             	lea    edx,[eax+eax*1]
 1003b07:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa8]
 1003b0d:	01 d0                	add    eax,edx
 1003b0f:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003b12:	98                   	cwde   
 1003b13:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
 1003b19:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [ebp-0xb4]
 1003b1f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003b26:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 1003b2c:	01 d0                	add    eax,edx
 1003b2e:	8b 10                	mov    edx,DWORD PTR [eax]
 1003b30:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003b33:	01 d0                	add    eax,edx
 1003b35:	89 c2                	mov    edx,eax
 1003b37:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003b3a:	89 10                	mov    DWORD PTR [eax],edx
 1003b3c:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 1003b40:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003b43:	3b 85 64 ff ff ff    	cmp    eax,DWORD PTR [ebp-0x9c]
 1003b49:	7c 8c                	jl     1003ad7 <load_pe+0x3eb>
 1003b4b:	83 45 dc 04          	add    DWORD PTR [ebp-0x24],0x4
 1003b4f:	83 45 d8 04          	add    DWORD PTR [ebp-0x28],0x4
 1003b53:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003b56:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b58:	85 c0                	test   eax,eax
 1003b5a:	0f 85 15 ff ff ff    	jne    1003a75 <load_pe+0x389>
 1003b60:	83 45 e4 14          	add    DWORD PTR [ebp-0x1c],0x14
 1003b64:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003b67:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b69:	85 c0                	test   eax,eax
 1003b6b:	0f 85 fc fd ff ff    	jne    100396d <load_pe+0x281>
 1003b71:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
 1003b78:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003b7b:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [eax+0xa4]
 1003b81:	85 c0                	test   eax,eax
 1003b83:	0f 84 c7 00 00 00    	je     1003c50 <load_pe+0x564>
 1003b89:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003b8c:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [eax+0xa0]
 1003b92:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003b95:	01 d0                	add    eax,edx
 1003b97:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1003b9a:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003b9d:	83 c0 40             	add    eax,0x40
 1003ba0:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1003ba3:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1003ba6:	83 c0 02             	add    eax,0x2
 1003ba9:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1003bac:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003baf:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
 1003bb2:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
 1003bb8:	e9 86 00 00 00       	jmp    1003c43 <load_pe+0x557>
 1003bbd:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003bc0:	8b 10                	mov    edx,DWORD PTR [eax]
 1003bc2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003bc5:	01 d0                	add    eax,edx
 1003bc7:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
 1003bcd:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
 1003bd4:	eb 50                	jmp    1003c26 <load_pe+0x53a>
 1003bd6:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1003bd9:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003bdc:	66 85 c0             	test   ax,ax
 1003bdf:	74 40                	je     1003c21 <load_pe+0x535>
 1003be1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1003be4:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003be7:	0f b7 d0             	movzx  edx,ax
 1003bea:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
 1003bf0:	01 d0                	add    eax,edx
 1003bf2:	89 85 3c ff ff ff    	mov    DWORD PTR [ebp-0xc4],eax
 1003bf8:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 1003bfe:	8b 00                	mov    eax,DWORD PTR [eax]
 1003c00:	2b 85 44 ff ff ff    	sub    eax,DWORD PTR [ebp-0xbc]
 1003c06:	89 c2                	mov    edx,eax
 1003c08:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003c0b:	01 d0                	add    eax,edx
 1003c0d:	89 c2                	mov    edx,eax
 1003c0f:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 1003c15:	89 10                	mov    DWORD PTR [eax],edx
 1003c17:	83 45 cc 04          	add    DWORD PTR [ebp-0x34],0x4
 1003c1b:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
 1003c1f:	eb 01                	jmp    1003c22 <load_pe+0x536>
 1003c21:	90                   	nop
 1003c22:	83 45 c4 01          	add    DWORD PTR [ebp-0x3c],0x1
 1003c26:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003c29:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003c2c:	c1 e8 02             	shr    eax,0x2
 1003c2f:	89 c2                	mov    edx,eax
 1003c31:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1003c34:	39 c2                	cmp    edx,eax
 1003c36:	77 9e                	ja     1003bd6 <load_pe+0x4ea>
 1003c38:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003c3b:	05 00 10 00 00       	add    eax,0x1000
 1003c40:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1003c43:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003c46:	8b 00                	mov    eax,DWORD PTR [eax]
 1003c48:	85 c0                	test   eax,eax
 1003c4a:	0f 85 6d ff ff ff    	jne    1003bbd <load_pe+0x4d1>
 1003c50:	c7 85 ec fd ff ff 00 	mov    DWORD PTR [ebp-0x214],0x0
 1003c57:	00 00 00 
 1003c5a:	c7 85 f0 fd ff ff 00 	mov    DWORD PTR [ebp-0x210],0x0
 1003c61:	00 00 00 
 1003c64:	c7 85 f4 fd ff ff 00 	mov    DWORD PTR [ebp-0x20c],0x0
 1003c6b:	00 00 00 
 1003c6e:	c7 85 f8 fd ff ff 00 	mov    DWORD PTR [ebp-0x208],0x0
 1003c75:	00 00 00 
 1003c78:	83 ec 04             	sub    esp,0x4
 1003c7b:	6a 10                	push   0x10
 1003c7d:	8d 85 ec fd ff ff    	lea    eax,[ebp-0x214]
 1003c83:	50                   	push   eax
 1003c84:	68 00 00 00 01       	push   0x1000000
 1003c89:	e8 bd 2c 00 00       	call   100694b <memcpy>
 1003c8e:	83 c4 10             	add    esp,0x10
 1003c91:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1003c96:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003c9c:	05 10 49 40 00       	add    eax,0x404910
 1003ca1:	c7 40 04 00 00 00 01 	mov    DWORD PTR [eax+0x4],0x1000000
 1003ca8:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1003cad:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003cb3:	05 10 49 40 00       	add    eax,0x404910
 1003cb8:	c7 40 08 00 10 00 01 	mov    DWORD PTR [eax+0x8],0x1001000
 1003cbf:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 1003cc2:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
 1003cc8:	83 ec 08             	sub    esp,0x8
 1003ccb:	6a 00                	push   0x0
 1003ccd:	6a 00                	push   0x0
 1003ccf:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
 1003cd5:	ff d0                	call   eax
 1003cd7:	83 c4 10             	add    esp,0x10
 1003cda:	8b 15 68 a7 40 00    	mov    edx,DWORD PTR ds:0x40a768
 1003ce0:	89 c1                	mov    ecx,eax
 1003ce2:	69 c2 78 01 00 00    	imul   eax,edx,0x178
 1003ce8:	05 10 49 40 00       	add    eax,0x404910
 1003ced:	89 08                	mov    DWORD PTR [eax],ecx
 1003cef:	a1 68 a7 40 00       	mov    eax,ds:0x40a768
 1003cf4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003cfa:	05 10 49 40 00       	add    eax,0x404910
 1003cff:	8b 00                	mov    eax,DWORD PTR [eax]
 1003d01:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1003d04:	c9                   	leave  
 1003d05:	c3                   	ret    

01003d06 <get_module_addr>:
 1003d06:	55                   	push   ebp
 1003d07:	89 e5                	mov    ebp,esp
 1003d09:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003d0c:	8b 04 c5 80 d3 41 00 	mov    eax,DWORD PTR [eax*8+0x41d380]
 1003d13:	5d                   	pop    ebp
 1003d14:	c3                   	ret    

01003d15 <dispose_library>:
 1003d15:	55                   	push   ebp
 1003d16:	89 e5                	mov    ebp,esp
 1003d18:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1003d1c:	78 09                	js     1003d27 <dispose_library+0x12>
 1003d1e:	81 7d 08 ff 00 00 00 	cmp    DWORD PTR [ebp+0x8],0xff
 1003d25:	7e 07                	jle    1003d2e <dispose_library+0x19>
 1003d27:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003d2c:	eb 19                	jmp    1003d47 <dispose_library+0x32>
 1003d2e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003d31:	69 c0 2c 01 00 00    	imul   eax,eax,0x12c
 1003d37:	05 88 a7 40 00       	add    eax,0x40a788
 1003d3c:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003d42:	b8 00 00 00 00       	mov    eax,0x0
 1003d47:	5d                   	pop    ebp
 1003d48:	c3                   	ret    

01003d49 <load_elf>:
 1003d49:	55                   	push   ebp
 1003d4a:	89 e5                	mov    ebp,esp
 1003d4c:	56                   	push   esi
 1003d4d:	53                   	push   ebx
 1003d4e:	83 ec 60             	sub    esp,0x60
 1003d51:	89 e0                	mov    eax,esp
 1003d53:	89 c6                	mov    esi,eax
 1003d55:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003d58:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 1003d5e:	8b 00                	mov    eax,DWORD PTR [eax]
 1003d60:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003d63:	6a 34                	push   0x34
 1003d65:	6a 00                	push   0x0
 1003d67:	8d 45 98             	lea    eax,[ebp-0x68]
 1003d6a:	50                   	push   eax
 1003d6b:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003d6e:	e8 9c dc ff ff       	call   1001a0f <sys_read>
 1003d73:	83 c4 10             	add    esp,0x10
 1003d76:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 1003d7d:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1003d84:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003d87:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 1003d8d:	85 c0                	test   eax,eax
 1003d8f:	0f 48 c2             	cmovs  eax,edx
 1003d92:	c1 f8 16             	sar    eax,0x16
 1003d95:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1003d98:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003d9b:	99                   	cdq    
 1003d9c:	c1 ea 0a             	shr    edx,0xa
 1003d9f:	01 d0                	add    eax,edx
 1003da1:	25 ff ff 3f 00       	and    eax,0x3fffff
 1003da6:	29 d0                	sub    eax,edx
 1003da8:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1003dae:	85 c0                	test   eax,eax
 1003db0:	0f 48 c2             	cmovs  eax,edx
 1003db3:	c1 f8 0c             	sar    eax,0xc
 1003db6:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1003db9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003dbc:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 1003dc2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003dc5:	c1 e0 02             	shl    eax,0x2
 1003dc8:	01 d0                	add    eax,edx
 1003dca:	8b 00                	mov    eax,DWORD PTR [eax]
 1003dcc:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003dd1:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1003dd4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1003ddb:	eb 68                	jmp    1003e45 <load_elf+0xfc>
 1003ddd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003de0:	8b 88 84 00 00 00    	mov    ecx,DWORD PTR [eax+0x84]
 1003de6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003de9:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 1003def:	85 c0                	test   eax,eax
 1003df1:	0f 48 c2             	cmovs  eax,edx
 1003df4:	c1 f8 0a             	sar    eax,0xa
 1003df7:	89 c2                	mov    edx,eax
 1003df9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003dfc:	01 d0                	add    eax,edx
 1003dfe:	c1 e0 02             	shl    eax,0x2
 1003e01:	01 c8                	add    eax,ecx
 1003e03:	8b 00                	mov    eax,DWORD PTR [eax]
 1003e05:	83 e0 01             	and    eax,0x1
 1003e08:	85 c0                	test   eax,eax
 1003e0a:	75 2c                	jne    1003e38 <load_elf+0xef>
 1003e0c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003e0f:	99                   	cdq    
 1003e10:	c1 ea 16             	shr    edx,0x16
 1003e13:	01 d0                	add    eax,edx
 1003e15:	25 ff 03 00 00       	and    eax,0x3ff
 1003e1a:	29 d0                	sub    eax,edx
 1003e1c:	89 c2                	mov    edx,eax
 1003e1e:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003e21:	01 d0                	add    eax,edx
 1003e23:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003e2a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1003e2d:	01 d0                	add    eax,edx
 1003e2f:	8b 00                	mov    eax,DWORD PTR [eax]
 1003e31:	83 e0 01             	and    eax,0x1
 1003e34:	85 c0                	test   eax,eax
 1003e36:	74 09                	je     1003e41 <load_elf+0xf8>
 1003e38:	81 45 e8 00 10 00 00 	add    DWORD PTR [ebp-0x18],0x1000
 1003e3f:	eb 0c                	jmp    1003e4d <load_elf+0x104>
 1003e41:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1003e45:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003e48:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 1003e4b:	7c 90                	jl     1003ddd <load_elf+0x94>
 1003e4d:	90                   	nop
 1003e4e:	0f b7 45 c4          	movzx  eax,WORD PTR [ebp-0x3c]
 1003e52:	0f b7 c0             	movzx  eax,ax
 1003e55:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1003e58:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003e5b:	8d 50 ff             	lea    edx,[eax-0x1]
 1003e5e:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1003e61:	c1 e0 05             	shl    eax,0x5
 1003e64:	89 c2                	mov    edx,eax
 1003e66:	b8 10 00 00 00       	mov    eax,0x10
 1003e6b:	83 e8 01             	sub    eax,0x1
 1003e6e:	01 d0                	add    eax,edx
 1003e70:	bb 10 00 00 00       	mov    ebx,0x10
 1003e75:	ba 00 00 00 00       	mov    edx,0x0
 1003e7a:	f7 f3                	div    ebx
 1003e7c:	6b c0 10             	imul   eax,eax,0x10
 1003e7f:	89 c1                	mov    ecx,eax
 1003e81:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1003e87:	89 e2                	mov    edx,esp
 1003e89:	29 ca                	sub    edx,ecx
 1003e8b:	39 d4                	cmp    esp,edx
 1003e8d:	74 10                	je     1003e9f <load_elf+0x156>
 1003e8f:	81 ec 00 10 00 00    	sub    esp,0x1000
 1003e95:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1003e9c:	00 
 1003e9d:	eb ec                	jmp    1003e8b <load_elf+0x142>
 1003e9f:	89 c2                	mov    edx,eax
 1003ea1:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003ea7:	29 d4                	sub    esp,edx
 1003ea9:	89 c2                	mov    edx,eax
 1003eab:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003eb1:	85 d2                	test   edx,edx
 1003eb3:	74 0d                	je     1003ec2 <load_elf+0x179>
 1003eb5:	25 ff 0f 00 00       	and    eax,0xfff
 1003eba:	83 e8 04             	sub    eax,0x4
 1003ebd:	01 e0                	add    eax,esp
 1003ebf:	83 08 00             	or     DWORD PTR [eax],0x0
 1003ec2:	89 e0                	mov    eax,esp
 1003ec4:	83 c0 00             	add    eax,0x0
 1003ec7:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1003eca:	0f b7 45 c2          	movzx  eax,WORD PTR [ebp-0x3e]
 1003ece:	0f b7 c0             	movzx  eax,ax
 1003ed1:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
 1003ed4:	50                   	push   eax
 1003ed5:	52                   	push   edx
 1003ed6:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 1003ed9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003edc:	e8 2e db ff ff       	call   1001a0f <sys_read>
 1003ee1:	83 c4 10             	add    esp,0x10
 1003ee4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1003eeb:	eb 59                	jmp    1003f46 <load_elf+0x1fd>
 1003eed:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003ef0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003ef3:	c1 e0 05             	shl    eax,0x5
 1003ef6:	01 d0                	add    eax,edx
 1003ef8:	8b 00                	mov    eax,DWORD PTR [eax]
 1003efa:	83 e0 01             	and    eax,0x1
 1003efd:	85 c0                	test   eax,eax
 1003eff:	74 40                	je     1003f41 <load_elf+0x1f8>
 1003f01:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003f04:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003f07:	c1 e0 05             	shl    eax,0x5
 1003f0a:	01 d0                	add    eax,edx
 1003f0c:	83 c0 10             	add    eax,0x10
 1003f0f:	8b 00                	mov    eax,DWORD PTR [eax]
 1003f11:	89 c1                	mov    ecx,eax
 1003f13:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003f16:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003f19:	c1 e0 05             	shl    eax,0x5
 1003f1c:	01 d0                	add    eax,edx
 1003f1e:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003f21:	89 c2                	mov    edx,eax
 1003f23:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
 1003f26:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003f29:	c1 e0 05             	shl    eax,0x5
 1003f2c:	01 d8                	add    eax,ebx
 1003f2e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1003f31:	51                   	push   ecx
 1003f32:	52                   	push   edx
 1003f33:	50                   	push   eax
 1003f34:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003f37:	e8 d3 da ff ff       	call   1001a0f <sys_read>
 1003f3c:	83 c4 10             	add    esp,0x10
 1003f3f:	eb 01                	jmp    1003f42 <load_elf+0x1f9>
 1003f41:	90                   	nop
 1003f42:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1003f46:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003f49:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 1003f4c:	7c 9f                	jl     1003eed <load_elf+0x1a4>
 1003f4e:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1003f51:	89 c2                	mov    edx,eax
 1003f53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003f56:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 1003f5c:	b8 00 00 00 00       	mov    eax,0x0
 1003f61:	89 f4                	mov    esp,esi
 1003f63:	8d 65 f8             	lea    esp,[ebp-0x8]
 1003f66:	5b                   	pop    ebx
 1003f67:	5e                   	pop    esi
 1003f68:	5d                   	pop    ebp
 1003f69:	c3                   	ret    

01003f6a <sys_insmod>:
 1003f6a:	55                   	push   ebp
 1003f6b:	89 e5                	mov    ebp,esp
 1003f6d:	90                   	nop
 1003f6e:	5d                   	pop    ebp
 1003f6f:	c3                   	ret    

01003f70 <sys_rmmod>:
 1003f70:	55                   	push   ebp
 1003f71:	89 e5                	mov    ebp,esp
 1003f73:	90                   	nop
 1003f74:	5d                   	pop    ebp
 1003f75:	c3                   	ret    
 1003f76:	66 90                	xchg   ax,ax
 1003f78:	66 90                	xchg   ax,ax
 1003f7a:	66 90                	xchg   ax,ax
 1003f7c:	66 90                	xchg   ax,ax
 1003f7e:	66 90                	xchg   ax,ax

01003f80 <_syscall>:
 1003f80:	57                   	push   edi
 1003f81:	56                   	push   esi
 1003f82:	52                   	push   edx
 1003f83:	51                   	push   ecx
 1003f84:	53                   	push   ebx
 1003f85:	50                   	push   eax
 1003f86:	e8 99 c4 ff ff       	call   1000424 <syscall>
 1003f8b:	83 c4 18             	add    esp,0x18
 1003f8e:	cf                   	iret   

01003f8f <shift>:
 1003f8f:	55                   	push   ebp
 1003f90:	89 e5                	mov    ebp,esp
 1003f92:	0f b6 05 8d e1 41 00 	movzx  eax,BYTE PTR ds:0x41e18d
 1003f99:	84 c0                	test   al,al
 1003f9b:	0f 94 c0             	sete   al
 1003f9e:	a2 8d e1 41 00       	mov    ds:0x41e18d,al
 1003fa3:	90                   	nop
 1003fa4:	5d                   	pop    ebp
 1003fa5:	c3                   	ret    

01003fa6 <ctrl>:
 1003fa6:	55                   	push   ebp
 1003fa7:	89 e5                	mov    ebp,esp
 1003fa9:	0f b6 05 8e e1 41 00 	movzx  eax,BYTE PTR ds:0x41e18e
 1003fb0:	84 c0                	test   al,al
 1003fb2:	0f 94 c0             	sete   al
 1003fb5:	a2 8e e1 41 00       	mov    ds:0x41e18e,al
 1003fba:	90                   	nop
 1003fbb:	5d                   	pop    ebp
 1003fbc:	c3                   	ret    

01003fbd <capslock>:
 1003fbd:	55                   	push   ebp
 1003fbe:	89 e5                	mov    ebp,esp
 1003fc0:	0f b6 05 8f e1 41 00 	movzx  eax,BYTE PTR ds:0x41e18f
 1003fc7:	84 c0                	test   al,al
 1003fc9:	0f 94 c0             	sete   al
 1003fcc:	a2 8f e1 41 00       	mov    ds:0x41e18f,al
 1003fd1:	90                   	nop
 1003fd2:	5d                   	pop    ebp
 1003fd3:	c3                   	ret    

01003fd4 <to_ascii>:
 1003fd4:	55                   	push   ebp
 1003fd5:	89 e5                	mov    ebp,esp
 1003fd7:	83 ec 14             	sub    esp,0x14
 1003fda:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003fdd:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1003fe0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1003fe7:	e9 99 00 00 00       	jmp    1004085 <to_ascii+0xb1>
 1003fec:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003fef:	89 d0                	mov    eax,edx
 1003ff1:	c1 e0 02             	shl    eax,0x2
 1003ff4:	01 d0                	add    eax,edx
 1003ff6:	05 22 76 00 01       	add    eax,0x1007622
 1003ffb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003ffe:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 1004001:	75 7e                	jne    1004081 <to_ascii+0xad>
 1004003:	0f b6 05 8f e1 41 00 	movzx  eax,BYTE PTR ds:0x41e18f
 100400a:	84 c0                	test   al,al
 100400c:	74 40                	je     100404e <to_ascii+0x7a>
 100400e:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004011:	89 d0                	mov    eax,edx
 1004013:	c1 e0 02             	shl    eax,0x2
 1004016:	01 d0                	add    eax,edx
 1004018:	05 20 76 00 01       	add    eax,0x1007620
 100401d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004020:	3c 60                	cmp    al,0x60
 1004022:	7e 2a                	jle    100404e <to_ascii+0x7a>
 1004024:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004027:	89 d0                	mov    eax,edx
 1004029:	c1 e0 02             	shl    eax,0x2
 100402c:	01 d0                	add    eax,edx
 100402e:	05 20 76 00 01       	add    eax,0x1007620
 1004033:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004036:	3c 7a                	cmp    al,0x7a
 1004038:	7f 14                	jg     100404e <to_ascii+0x7a>
 100403a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 100403d:	89 d0                	mov    eax,edx
 100403f:	c1 e0 02             	shl    eax,0x2
 1004042:	01 d0                	add    eax,edx
 1004044:	05 21 76 00 01       	add    eax,0x1007621
 1004049:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100404c:	eb 46                	jmp    1004094 <to_ascii+0xc0>
 100404e:	0f b6 05 8d e1 41 00 	movzx  eax,BYTE PTR ds:0x41e18d
 1004055:	84 c0                	test   al,al
 1004057:	74 14                	je     100406d <to_ascii+0x99>
 1004059:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 100405c:	89 d0                	mov    eax,edx
 100405e:	c1 e0 02             	shl    eax,0x2
 1004061:	01 d0                	add    eax,edx
 1004063:	05 21 76 00 01       	add    eax,0x1007621
 1004068:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100406b:	eb 27                	jmp    1004094 <to_ascii+0xc0>
 100406d:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004070:	89 d0                	mov    eax,edx
 1004072:	c1 e0 02             	shl    eax,0x2
 1004075:	01 d0                	add    eax,edx
 1004077:	05 20 76 00 01       	add    eax,0x1007620
 100407c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100407f:	eb 13                	jmp    1004094 <to_ascii+0xc0>
 1004081:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1004085:	83 7d fc 5d          	cmp    DWORD PTR [ebp-0x4],0x5d
 1004089:	0f 8e 5d ff ff ff    	jle    1003fec <to_ascii+0x18>
 100408f:	b8 00 00 00 00       	mov    eax,0x0
 1004094:	c9                   	leave  
 1004095:	c3                   	ret    

01004096 <init_kb>:
 1004096:	55                   	push   ebp
 1004097:	89 e5                	mov    ebp,esp
 1004099:	83 ec 08             	sub    esp,0x8
 100409c:	83 ec 0c             	sub    esp,0xc
 100409f:	68 c0 75 00 01       	push   0x10075c0
 10040a4:	e8 b2 dd ff ff       	call   1001e5b <reg_device>
 10040a9:	83 c4 10             	add    esp,0x10
 10040ac:	83 ec 0c             	sub    esp,0xc
 10040af:	68 60 75 00 01       	push   0x1007560
 10040b4:	e8 10 de ff ff       	call   1001ec9 <reg_driver>
 10040b9:	83 c4 10             	add    esp,0x10
 10040bc:	90                   	nop
 10040bd:	c9                   	leave  
 10040be:	c3                   	ret    

010040bf <key_proc>:
 10040bf:	55                   	push   ebp
 10040c0:	89 e5                	mov    ebp,esp
 10040c2:	83 ec 18             	sub    esp,0x18
 10040c5:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
 10040c9:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
 10040cd:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
 10040d1:	83 ec 0c             	sub    esp,0xc
 10040d4:	6a 60                	push   0x60
 10040d6:	e8 05 f2 ff ff       	call   10032e0 <inb>
 10040db:	83 c4 10             	add    esp,0x10
 10040de:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
 10040e1:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 10040e5:	0f be c0             	movsx  eax,al
 10040e8:	83 ec 0c             	sub    esp,0xc
 10040eb:	50                   	push   eax
 10040ec:	e8 e3 fe ff ff       	call   1003fd4 <to_ascii>
 10040f1:	83 c4 10             	add    esp,0x10
 10040f4:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 10040f7:	80 7d f5 e0          	cmp    BYTE PTR [ebp-0xb],0xe0
 10040fb:	74 06                	je     1004103 <key_proc+0x44>
 10040fd:	80 7d f5 e1          	cmp    BYTE PTR [ebp-0xb],0xe1
 1004101:	75 26                	jne    1004129 <key_proc+0x6a>
 1004103:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1004107:	0f be c0             	movsx  eax,al
 100410a:	83 ec 0c             	sub    esp,0xc
 100410d:	50                   	push   eax
 100410e:	e8 c1 fe ff ff       	call   1003fd4 <to_ascii>
 1004113:	83 c4 10             	add    esp,0x10
 1004116:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 1004119:	83 ec 0c             	sub    esp,0xc
 100411c:	6a 60                	push   0x60
 100411e:	e8 bd f1 ff ff       	call   10032e0 <inb>
 1004123:	83 c4 10             	add    esp,0x10
 1004126:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 1004129:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 100412d:	88 45 f2             	mov    BYTE PTR [ebp-0xe],al
 1004130:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1004134:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
 1004137:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
 100413b:	88 45 f0             	mov    BYTE PTR [ebp-0x10],al
 100413e:	8b 15 5c 70 00 01    	mov    edx,DWORD PTR ds:0x100705c
 1004144:	a1 58 70 00 01       	mov    eax,ds:0x1007058
 1004149:	39 c2                	cmp    edx,eax
 100414b:	74 3a                	je     1004187 <key_proc+0xc8>
 100414d:	8b 15 54 70 00 01    	mov    edx,DWORD PTR ds:0x1007054
 1004153:	a1 5c 70 00 01       	mov    eax,ds:0x100705c
 1004158:	89 c1                	mov    ecx,eax
 100415a:	89 c8                	mov    eax,ecx
 100415c:	c1 e0 02             	shl    eax,0x2
 100415f:	01 c8                	add    eax,ecx
 1004161:	01 d0                	add    eax,edx
 1004163:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1004166:	89 10                	mov    DWORD PTR [eax],edx
 1004168:	0f b6 55 f4          	movzx  edx,BYTE PTR [ebp-0xc]
 100416c:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 100416f:	a1 5c 70 00 01       	mov    eax,ds:0x100705c
 1004174:	83 c0 01             	add    eax,0x1
 1004177:	8b 0d 60 70 00 01    	mov    ecx,DWORD PTR ds:0x1007060
 100417d:	99                   	cdq    
 100417e:	f7 f9                	idiv   ecx
 1004180:	89 d0                	mov    eax,edx
 1004182:	a3 5c 70 00 01       	mov    ds:0x100705c,eax
 1004187:	e8 6d f1 ff ff       	call   10032f9 <eoi>
 100418c:	c9                   	leave  
 100418d:	cf                   	iret   
 100418e:	90                   	nop
 100418f:	c9                   	leave  
 1004190:	c3                   	ret    

01004191 <sys_getkbc>:
 1004191:	55                   	push   ebp
 1004192:	89 e5                	mov    ebp,esp
 1004194:	83 ec 10             	sub    esp,0x10
 1004197:	8b 15 5c 70 00 01    	mov    edx,DWORD PTR ds:0x100705c
 100419d:	a1 58 70 00 01       	mov    eax,ds:0x1007058
 10041a2:	39 c2                	cmp    edx,eax
 10041a4:	75 07                	jne    10041ad <sys_getkbc+0x1c>
 10041a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10041ab:	eb 3a                	jmp    10041e7 <sys_getkbc+0x56>
 10041ad:	8b 15 5c 70 00 01    	mov    edx,DWORD PTR ds:0x100705c
 10041b3:	89 d0                	mov    eax,edx
 10041b5:	c1 e0 02             	shl    eax,0x2
 10041b8:	01 d0                	add    eax,edx
 10041ba:	05 80 d7 41 00       	add    eax,0x41d780
 10041bf:	8b 10                	mov    edx,DWORD PTR [eax]
 10041c1:	89 55 fb             	mov    DWORD PTR [ebp-0x5],edx
 10041c4:	0f b6 40 04          	movzx  eax,BYTE PTR [eax+0x4]
 10041c8:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 10041cb:	a1 5c 70 00 01       	mov    eax,ds:0x100705c
 10041d0:	83 c0 01             	add    eax,0x1
 10041d3:	8b 0d 60 70 00 01    	mov    ecx,DWORD PTR ds:0x1007060
 10041d9:	99                   	cdq    
 10041da:	f7 f9                	idiv   ecx
 10041dc:	89 d0                	mov    eax,edx
 10041de:	a3 5c 70 00 01       	mov    ds:0x100705c,eax
 10041e3:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
 10041e7:	c9                   	leave  
 10041e8:	c3                   	ret    

010041e9 <init_disk>:
 10041e9:	55                   	push   ebp
 10041ea:	89 e5                	mov    ebp,esp
 10041ec:	83 ec 08             	sub    esp,0x8
 10041ef:	83 ec 0c             	sub    esp,0xc
 10041f2:	68 80 70 00 01       	push   0x1007080
 10041f7:	e8 5f dc ff ff       	call   1001e5b <reg_device>
 10041fc:	83 c4 10             	add    esp,0x10
 10041ff:	a3 e8 fb 41 00       	mov    ds:0x41fbe8,eax
 1004204:	83 ec 0c             	sub    esp,0xc
 1004207:	68 e0 70 00 01       	push   0x10070e0
 100420c:	e8 b8 dc ff ff       	call   1001ec9 <reg_driver>
 1004211:	83 c4 10             	add    esp,0x10
 1004214:	a3 e4 fb 41 00       	mov    ds:0x41fbe4,eax
 1004219:	c7 05 c0 70 00 01 e0 	mov    DWORD PTR ds:0x10070c0,0x10070e0
 1004220:	70 00 01 
 1004223:	b8 00 00 00 00       	mov    eax,0x0
 1004228:	c9                   	leave  
 1004229:	c3                   	ret    

0100422a <disk_int_handler_c>:
 100422a:	55                   	push   ebp
 100422b:	89 e5                	mov    ebp,esp
 100422d:	83 ec 18             	sub    esp,0x18
 1004230:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004235:	85 c0                	test   eax,eax
 1004237:	75 0a                	jne    1004243 <disk_int_handler_c+0x19>
 1004239:	b8 01 00 00 00       	mov    eax,0x1
 100423e:	e9 e3 00 00 00       	jmp    1004326 <disk_int_handler_c+0xfc>
 1004243:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004248:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100424b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100424e:	c7 45 f0 f0 01 00 00 	mov    DWORD PTR [ebp-0x10],0x1f0
 1004255:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 100425a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100425d:	83 f8 02             	cmp    eax,0x2
 1004260:	74 0d                	je     100426f <disk_int_handler_c+0x45>
 1004262:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004267:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100426a:	83 f8 03             	cmp    eax,0x3
 100426d:	75 07                	jne    1004276 <disk_int_handler_c+0x4c>
 100426f:	c7 45 f0 70 01 00 00 	mov    DWORD PTR [ebp-0x10],0x170
 1004276:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 100427b:	8b 00                	mov    eax,DWORD PTR [eax]
 100427d:	85 c0                	test   eax,eax
 100427f:	75 3f                	jne    10042c0 <disk_int_handler_c+0x96>
 1004281:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1004288:	eb 24                	jmp    10042ae <disk_int_handler_c+0x84>
 100428a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100428d:	0f b7 c0             	movzx  eax,ax
 1004290:	83 ec 0c             	sub    esp,0xc
 1004293:	50                   	push   eax
 1004294:	e8 53 f0 ff ff       	call   10032ec <inw>
 1004299:	83 c4 10             	add    esp,0x10
 100429c:	89 c2                	mov    edx,eax
 100429e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10042a1:	8d 48 02             	lea    ecx,[eax+0x2]
 10042a4:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 10042a7:	66 89 10             	mov    WORD PTR [eax],dx
 10042aa:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 10042ae:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10042b3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 10042b6:	c1 e0 08             	shl    eax,0x8
 10042b9:	39 45 ec             	cmp    DWORD PTR [ebp-0x14],eax
 10042bc:	7c cc                	jl     100428a <disk_int_handler_c+0x60>
 10042be:	eb 4b                	jmp    100430b <disk_int_handler_c+0xe1>
 10042c0:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10042c5:	8b 00                	mov    eax,DWORD PTR [eax]
 10042c7:	83 f8 01             	cmp    eax,0x1
 10042ca:	75 3f                	jne    100430b <disk_int_handler_c+0xe1>
 10042cc:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 10042d3:	eb 26                	jmp    10042fb <disk_int_handler_c+0xd1>
 10042d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10042d8:	8d 50 02             	lea    edx,[eax+0x2]
 10042db:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10042de:	0f b7 00             	movzx  eax,WORD PTR [eax]
 10042e1:	0f b7 d0             	movzx  edx,ax
 10042e4:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10042e7:	0f b7 c0             	movzx  eax,ax
 10042ea:	83 ec 08             	sub    esp,0x8
 10042ed:	52                   	push   edx
 10042ee:	50                   	push   eax
 10042ef:	e8 dc ef ff ff       	call   10032d0 <outw>
 10042f4:	83 c4 10             	add    esp,0x10
 10042f7:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 10042fb:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004300:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1004303:	c1 e0 08             	shl    eax,0x8
 1004306:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1004309:	7c ca                	jl     10042d5 <disk_int_handler_c+0xab>
 100430b:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004310:	c7 40 18 02 00 00 00 	mov    DWORD PTR [eax+0x18],0x2
 1004317:	c7 05 e0 fb 41 00 00 	mov    DWORD PTR ds:0x41fbe0,0x0
 100431e:	00 00 00 
 1004321:	b8 00 00 00 00       	mov    eax,0x0
 1004326:	c9                   	leave  
 1004327:	c3                   	ret    

01004328 <check_dreq_stat>:
 1004328:	55                   	push   ebp
 1004329:	89 e5                	mov    ebp,esp
 100432b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100432e:	6b c0 1c             	imul   eax,eax,0x1c
 1004331:	05 b8 e1 41 00       	add    eax,0x41e1b8
 1004336:	8b 00                	mov    eax,DWORD PTR [eax]
 1004338:	5d                   	pop    ebp
 1004339:	c3                   	ret    

0100433a <request>:
 100433a:	55                   	push   ebp
 100433b:	89 e5                	mov    ebp,esp
 100433d:	83 ec 10             	sub    esp,0x10
 1004340:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 1004345:	8d 48 01             	lea    ecx,[eax+0x1]
 1004348:	ba 89 88 88 88       	mov    edx,0x88888889
 100434d:	89 c8                	mov    eax,ecx
 100434f:	f7 ea                	imul   edx
 1004351:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1004354:	c1 f8 07             	sar    eax,0x7
 1004357:	89 ca                	mov    edx,ecx
 1004359:	c1 fa 1f             	sar    edx,0x1f
 100435c:	29 d0                	sub    eax,edx
 100435e:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 1004364:	89 c8                	mov    eax,ecx
 1004366:	29 d0                	sub    eax,edx
 1004368:	8b 15 ec fb 41 00    	mov    edx,DWORD PTR ds:0x41fbec
 100436e:	39 d0                	cmp    eax,edx
 1004370:	75 0a                	jne    100437c <request+0x42>
 1004372:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004377:	e9 aa 00 00 00       	jmp    1004426 <request+0xec>
 100437c:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 1004381:	6b c0 1c             	imul   eax,eax,0x1c
 1004384:	8d 90 a4 e1 41 00    	lea    edx,[eax+0x41e1a4]
 100438a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100438d:	89 02                	mov    DWORD PTR [edx],eax
 100438f:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 1004394:	6b c0 1c             	imul   eax,eax,0x1c
 1004397:	8d 90 a0 e1 41 00    	lea    edx,[eax+0x41e1a0]
 100439d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10043a0:	89 02                	mov    DWORD PTR [edx],eax
 10043a2:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043a7:	6b c0 1c             	imul   eax,eax,0x1c
 10043aa:	8d 90 a8 e1 41 00    	lea    edx,[eax+0x41e1a8]
 10043b0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10043b3:	89 02                	mov    DWORD PTR [edx],eax
 10043b5:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043ba:	6b c0 1c             	imul   eax,eax,0x1c
 10043bd:	8d 90 ac e1 41 00    	lea    edx,[eax+0x41e1ac]
 10043c3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10043c6:	89 02                	mov    DWORD PTR [edx],eax
 10043c8:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043cd:	6b c0 1c             	imul   eax,eax,0x1c
 10043d0:	05 b8 e1 41 00       	add    eax,0x41e1b8
 10043d5:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 10043db:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043e0:	6b c0 1c             	imul   eax,eax,0x1c
 10043e3:	8d 90 b0 e1 41 00    	lea    edx,[eax+0x41e1b0]
 10043e9:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
 10043ec:	89 02                	mov    DWORD PTR [edx],eax
 10043ee:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043f3:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 10043f6:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 10043fb:	8d 48 01             	lea    ecx,[eax+0x1]
 10043fe:	ba 89 88 88 88       	mov    edx,0x88888889
 1004403:	89 c8                	mov    eax,ecx
 1004405:	f7 ea                	imul   edx
 1004407:	8d 04 0a             	lea    eax,[edx+ecx*1]
 100440a:	c1 f8 07             	sar    eax,0x7
 100440d:	89 ca                	mov    edx,ecx
 100440f:	c1 fa 1f             	sar    edx,0x1f
 1004412:	29 d0                	sub    eax,edx
 1004414:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 100441a:	89 c8                	mov    eax,ecx
 100441c:	29 d0                	sub    eax,edx
 100441e:	a3 f0 fb 41 00       	mov    ds:0x41fbf0,eax
 1004423:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004426:	c9                   	leave  
 1004427:	c3                   	ret    

01004428 <execute_request>:
 1004428:	55                   	push   ebp
 1004429:	89 e5                	mov    ebp,esp
 100442b:	53                   	push   ebx
 100442c:	83 ec 14             	sub    esp,0x14
 100442f:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004434:	85 c0                	test   eax,eax
 1004436:	74 0a                	je     1004442 <execute_request+0x1a>
 1004438:	b8 02 00 00 00       	mov    eax,0x2
 100443d:	e9 03 01 00 00       	jmp    1004545 <execute_request+0x11d>
 1004442:	8b 15 ec fb 41 00    	mov    edx,DWORD PTR ds:0x41fbec
 1004448:	a1 f0 fb 41 00       	mov    eax,ds:0x41fbf0
 100444d:	39 c2                	cmp    edx,eax
 100444f:	75 0a                	jne    100445b <execute_request+0x33>
 1004451:	b8 01 00 00 00       	mov    eax,0x1
 1004456:	e9 ea 00 00 00       	jmp    1004545 <execute_request+0x11d>
 100445b:	a1 ec fb 41 00       	mov    eax,ds:0x41fbec
 1004460:	6b c0 1c             	imul   eax,eax,0x1c
 1004463:	05 a0 e1 41 00       	add    eax,0x41e1a0
 1004468:	a3 e0 fb 41 00       	mov    ds:0x41fbe0,eax
 100446d:	a1 ec fb 41 00       	mov    eax,ds:0x41fbec
 1004472:	8d 48 01             	lea    ecx,[eax+0x1]
 1004475:	ba 89 88 88 88       	mov    edx,0x88888889
 100447a:	89 c8                	mov    eax,ecx
 100447c:	f7 ea                	imul   edx
 100447e:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1004481:	c1 f8 07             	sar    eax,0x7
 1004484:	89 ca                	mov    edx,ecx
 1004486:	c1 fa 1f             	sar    edx,0x1f
 1004489:	29 d0                	sub    eax,edx
 100448b:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 1004491:	89 c8                	mov    eax,ecx
 1004493:	29 d0                	sub    eax,edx
 1004495:	a3 ec fb 41 00       	mov    ds:0x41fbec,eax
 100449a:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 100449f:	c7 40 18 01 00 00 00 	mov    DWORD PTR [eax+0x18],0x1
 10044a6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10044ad:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10044b2:	8b 00                	mov    eax,DWORD PTR [eax]
 10044b4:	83 f8 02             	cmp    eax,0x2
 10044b7:	74 76                	je     100452f <execute_request+0x107>
 10044b9:	83 f8 02             	cmp    eax,0x2
 10044bc:	7f 74                	jg     1004532 <execute_request+0x10a>
 10044be:	85 c0                	test   eax,eax
 10044c0:	74 07                	je     10044c9 <execute_request+0xa1>
 10044c2:	83 f8 01             	cmp    eax,0x1
 10044c5:	74 35                	je     10044fc <execute_request+0xd4>
 10044c7:	eb 69                	jmp    1004532 <execute_request+0x10a>
 10044c9:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10044ce:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 10044d1:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10044d6:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10044d9:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10044de:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10044e1:	89 c3                	mov    ebx,eax
 10044e3:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 10044e8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10044eb:	51                   	push   ecx
 10044ec:	52                   	push   edx
 10044ed:	53                   	push   ebx
 10044ee:	50                   	push   eax
 10044ef:	e8 56 00 00 00       	call   100454a <async_read_disk>
 10044f4:	83 c4 10             	add    esp,0x10
 10044f7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10044fa:	eb 37                	jmp    1004533 <execute_request+0x10b>
 10044fc:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004501:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1004504:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004509:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100450c:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 1004511:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004514:	89 c3                	mov    ebx,eax
 1004516:	a1 e0 fb 41 00       	mov    eax,ds:0x41fbe0
 100451b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100451e:	51                   	push   ecx
 100451f:	52                   	push   edx
 1004520:	53                   	push   ebx
 1004521:	50                   	push   eax
 1004522:	e8 3e 01 00 00       	call   1004665 <async_write_disk>
 1004527:	83 c4 10             	add    esp,0x10
 100452a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100452d:	eb 04                	jmp    1004533 <execute_request+0x10b>
 100452f:	90                   	nop
 1004530:	eb 01                	jmp    1004533 <execute_request+0x10b>
 1004532:	90                   	nop
 1004533:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1004537:	75 07                	jne    1004540 <execute_request+0x118>
 1004539:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100453e:	eb 05                	jmp    1004545 <execute_request+0x11d>
 1004540:	b8 00 00 00 00       	mov    eax,0x0
 1004545:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1004548:	c9                   	leave  
 1004549:	c3                   	ret    

0100454a <async_read_disk>:
 100454a:	55                   	push   ebp
 100454b:	89 e5                	mov    ebp,esp
 100454d:	83 ec 18             	sub    esp,0x18
 1004550:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 1004556:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100455d:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 1004561:	74 06                	je     1004569 <async_read_disk+0x1f>
 1004563:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004567:	75 06                	jne    100456f <async_read_disk+0x25>
 1004569:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 100456f:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004573:	74 06                	je     100457b <async_read_disk+0x31>
 1004575:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 1004579:	75 07                	jne    1004582 <async_read_disk+0x38>
 100457b:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 1004582:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1004585:	0f b6 d0             	movzx  edx,al
 1004588:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100458c:	83 c0 02             	add    eax,0x2
 100458f:	0f b7 c0             	movzx  eax,ax
 1004592:	83 ec 08             	sub    esp,0x8
 1004595:	52                   	push   edx
 1004596:	50                   	push   eax
 1004597:	e8 24 ed ff ff       	call   10032c0 <outb>
 100459c:	83 c4 10             	add    esp,0x10
 100459f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10045a2:	0f b6 d0             	movzx  edx,al
 10045a5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10045a9:	83 c0 03             	add    eax,0x3
 10045ac:	0f b7 c0             	movzx  eax,ax
 10045af:	83 ec 08             	sub    esp,0x8
 10045b2:	52                   	push   edx
 10045b3:	50                   	push   eax
 10045b4:	e8 07 ed ff ff       	call   10032c0 <outb>
 10045b9:	83 c4 10             	add    esp,0x10
 10045bc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10045bf:	c1 e8 08             	shr    eax,0x8
 10045c2:	0f b6 d0             	movzx  edx,al
 10045c5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10045c9:	83 c0 04             	add    eax,0x4
 10045cc:	0f b7 c0             	movzx  eax,ax
 10045cf:	83 ec 08             	sub    esp,0x8
 10045d2:	52                   	push   edx
 10045d3:	50                   	push   eax
 10045d4:	e8 e7 ec ff ff       	call   10032c0 <outb>
 10045d9:	83 c4 10             	add    esp,0x10
 10045dc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10045df:	c1 e8 10             	shr    eax,0x10
 10045e2:	0f b6 d0             	movzx  edx,al
 10045e5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10045e9:	83 c0 05             	add    eax,0x5
 10045ec:	0f b7 c0             	movzx  eax,ax
 10045ef:	83 ec 08             	sub    esp,0x8
 10045f2:	52                   	push   edx
 10045f3:	50                   	push   eax
 10045f4:	e8 c7 ec ff ff       	call   10032c0 <outb>
 10045f9:	83 c4 10             	add    esp,0x10
 10045fc:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004600:	74 07                	je     1004609 <async_read_disk+0xbf>
 1004602:	b8 10 00 00 00       	mov    eax,0x10
 1004607:	eb 05                	jmp    100460e <async_read_disk+0xc4>
 1004609:	b8 00 00 00 00       	mov    eax,0x0
 100460e:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 1004611:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004614:	c1 e8 18             	shr    eax,0x18
 1004617:	83 e0 0f             	and    eax,0xf
 100461a:	89 c2                	mov    edx,eax
 100461c:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 1004620:	09 d0                	or     eax,edx
 1004622:	83 c8 e0             	or     eax,0xffffffe0
 1004625:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 1004628:	0f b6 45 ee          	movzx  eax,BYTE PTR [ebp-0x12]
 100462c:	0f b6 d0             	movzx  edx,al
 100462f:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004633:	83 c0 06             	add    eax,0x6
 1004636:	0f b7 c0             	movzx  eax,ax
 1004639:	83 ec 08             	sub    esp,0x8
 100463c:	52                   	push   edx
 100463d:	50                   	push   eax
 100463e:	e8 7d ec ff ff       	call   10032c0 <outb>
 1004643:	83 c4 10             	add    esp,0x10
 1004646:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100464a:	83 c0 07             	add    eax,0x7
 100464d:	0f b7 c0             	movzx  eax,ax
 1004650:	83 ec 08             	sub    esp,0x8
 1004653:	6a 20                	push   0x20
 1004655:	50                   	push   eax
 1004656:	e8 65 ec ff ff       	call   10032c0 <outb>
 100465b:	83 c4 10             	add    esp,0x10
 100465e:	b8 00 00 00 00       	mov    eax,0x0
 1004663:	c9                   	leave  
 1004664:	c3                   	ret    

01004665 <async_write_disk>:
 1004665:	55                   	push   ebp
 1004666:	89 e5                	mov    ebp,esp
 1004668:	83 ec 18             	sub    esp,0x18
 100466b:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 1004671:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004678:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 100467c:	74 06                	je     1004684 <async_write_disk+0x1f>
 100467e:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004682:	75 06                	jne    100468a <async_write_disk+0x25>
 1004684:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 100468a:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 100468e:	74 06                	je     1004696 <async_write_disk+0x31>
 1004690:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 1004694:	75 07                	jne    100469d <async_write_disk+0x38>
 1004696:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 100469d:	83 ec 0c             	sub    esp,0xc
 10046a0:	68 f7 00 00 00       	push   0xf7
 10046a5:	e8 36 ec ff ff       	call   10032e0 <inb>
 10046aa:	83 c4 10             	add    esp,0x10
 10046ad:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 10046b0:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 10046b4:	83 e0 01             	and    eax,0x1
 10046b7:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 10046ba:	80 7d ee 00          	cmp    BYTE PTR [ebp-0x12],0x0
 10046be:	74 0a                	je     10046ca <async_write_disk+0x65>
 10046c0:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10046c5:	e9 22 01 00 00       	jmp    10047ec <async_write_disk+0x187>
 10046ca:	80 65 ef 88          	and    BYTE PTR [ebp-0x11],0x88
 10046ce:	80 7d ef 08          	cmp    BYTE PTR [ebp-0x11],0x8
 10046d2:	74 02                	je     10046d6 <async_write_disk+0x71>
 10046d4:	eb c7                	jmp    100469d <async_write_disk+0x38>
 10046d6:	90                   	nop
 10046d7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10046da:	0f b6 d0             	movzx  edx,al
 10046dd:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10046e1:	83 c0 02             	add    eax,0x2
 10046e4:	0f b7 c0             	movzx  eax,ax
 10046e7:	83 ec 08             	sub    esp,0x8
 10046ea:	52                   	push   edx
 10046eb:	50                   	push   eax
 10046ec:	e8 cf eb ff ff       	call   10032c0 <outb>
 10046f1:	83 c4 10             	add    esp,0x10
 10046f4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10046f7:	0f b6 d0             	movzx  edx,al
 10046fa:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10046fe:	83 c0 03             	add    eax,0x3
 1004701:	0f b7 c0             	movzx  eax,ax
 1004704:	83 ec 08             	sub    esp,0x8
 1004707:	52                   	push   edx
 1004708:	50                   	push   eax
 1004709:	e8 b2 eb ff ff       	call   10032c0 <outb>
 100470e:	83 c4 10             	add    esp,0x10
 1004711:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004714:	c1 e8 08             	shr    eax,0x8
 1004717:	0f b6 d0             	movzx  edx,al
 100471a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100471e:	83 c0 04             	add    eax,0x4
 1004721:	0f b7 c0             	movzx  eax,ax
 1004724:	83 ec 08             	sub    esp,0x8
 1004727:	52                   	push   edx
 1004728:	50                   	push   eax
 1004729:	e8 92 eb ff ff       	call   10032c0 <outb>
 100472e:	83 c4 10             	add    esp,0x10
 1004731:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004734:	c1 e8 10             	shr    eax,0x10
 1004737:	0f b6 d0             	movzx  edx,al
 100473a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100473e:	83 c0 05             	add    eax,0x5
 1004741:	0f b7 c0             	movzx  eax,ax
 1004744:	83 ec 08             	sub    esp,0x8
 1004747:	52                   	push   edx
 1004748:	50                   	push   eax
 1004749:	e8 72 eb ff ff       	call   10032c0 <outb>
 100474e:	83 c4 10             	add    esp,0x10
 1004751:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004755:	74 07                	je     100475e <async_write_disk+0xf9>
 1004757:	b8 10 00 00 00       	mov    eax,0x10
 100475c:	eb 05                	jmp    1004763 <async_write_disk+0xfe>
 100475e:	b8 00 00 00 00       	mov    eax,0x0
 1004763:	88 45 ed             	mov    BYTE PTR [ebp-0x13],al
 1004766:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004769:	c1 e8 18             	shr    eax,0x18
 100476c:	83 e0 0f             	and    eax,0xf
 100476f:	89 c2                	mov    edx,eax
 1004771:	0f b6 45 ed          	movzx  eax,BYTE PTR [ebp-0x13]
 1004775:	09 d0                	or     eax,edx
 1004777:	83 c8 e0             	or     eax,0xffffffe0
 100477a:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 100477d:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 1004781:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004785:	83 c0 06             	add    eax,0x6
 1004788:	0f b7 c0             	movzx  eax,ax
 100478b:	83 ec 08             	sub    esp,0x8
 100478e:	52                   	push   edx
 100478f:	50                   	push   eax
 1004790:	e8 2b eb ff ff       	call   10032c0 <outb>
 1004795:	83 c4 10             	add    esp,0x10
 1004798:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100479c:	83 c0 07             	add    eax,0x7
 100479f:	0f b7 c0             	movzx  eax,ax
 10047a2:	83 ec 08             	sub    esp,0x8
 10047a5:	6a 30                	push   0x30
 10047a7:	50                   	push   eax
 10047a8:	e8 13 eb ff ff       	call   10032c0 <outb>
 10047ad:	83 c4 10             	add    esp,0x10
 10047b0:	83 ec 0c             	sub    esp,0xc
 10047b3:	68 f7 00 00 00       	push   0xf7
 10047b8:	e8 23 eb ff ff       	call   10032e0 <inb>
 10047bd:	83 c4 10             	add    esp,0x10
 10047c0:	88 45 eb             	mov    BYTE PTR [ebp-0x15],al
 10047c3:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 10047c7:	83 e0 01             	and    eax,0x1
 10047ca:	88 45 ea             	mov    BYTE PTR [ebp-0x16],al
 10047cd:	80 7d ea 00          	cmp    BYTE PTR [ebp-0x16],0x0
 10047d1:	74 07                	je     10047da <async_write_disk+0x175>
 10047d3:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10047d8:	eb 12                	jmp    10047ec <async_write_disk+0x187>
 10047da:	80 65 eb 88          	and    BYTE PTR [ebp-0x15],0x88
 10047de:	80 7d eb 08          	cmp    BYTE PTR [ebp-0x15],0x8
 10047e2:	74 02                	je     10047e6 <async_write_disk+0x181>
 10047e4:	eb ca                	jmp    10047b0 <async_write_disk+0x14b>
 10047e6:	90                   	nop
 10047e7:	b8 00 00 00 00       	mov    eax,0x0
 10047ec:	c9                   	leave  
 10047ed:	c3                   	ret    

010047ee <read_disk>:
 10047ee:	55                   	push   ebp
 10047ef:	89 e5                	mov    ebp,esp
 10047f1:	83 ec 08             	sub    esp,0x8
 10047f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10047f7:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10047fa:	89 c1                	mov    ecx,eax
 10047fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10047ff:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1004802:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004805:	8b 00                	mov    eax,DWORD PTR [eax]
 1004807:	83 ec 04             	sub    esp,0x4
 100480a:	51                   	push   ecx
 100480b:	52                   	push   edx
 100480c:	50                   	push   eax
 100480d:	e8 2f 00 00 00       	call   1004841 <read_disk_asm>
 1004812:	83 c4 10             	add    esp,0x10
 1004815:	c9                   	leave  
 1004816:	c3                   	ret    

01004817 <write_disk>:
 1004817:	55                   	push   ebp
 1004818:	89 e5                	mov    ebp,esp
 100481a:	83 ec 08             	sub    esp,0x8
 100481d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004820:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004823:	89 c1                	mov    ecx,eax
 1004825:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004828:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 100482b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100482e:	8b 00                	mov    eax,DWORD PTR [eax]
 1004830:	83 ec 04             	sub    esp,0x4
 1004833:	51                   	push   ecx
 1004834:	52                   	push   edx
 1004835:	50                   	push   eax
 1004836:	e8 7e 00 00 00       	call   10048b9 <write_disk_asm>
 100483b:	83 c4 10             	add    esp,0x10
 100483e:	c9                   	leave  
 100483f:	c3                   	ret    

01004840 <disk_int_handler>:
 1004840:	cf                   	iret   

01004841 <read_disk_asm>:
 1004841:	55                   	push   ebp
 1004842:	89 e5                	mov    ebp,esp
 1004844:	66 ba f7 01          	mov    dx,0x1f7
 1004848:	31 c9                	xor    ecx,ecx
 100484a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100484e:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1004852:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1004856:	89 c6                	mov    esi,eax
 1004858:	66 ba f2 01          	mov    dx,0x1f2
 100485c:	88 c8                	mov    al,cl
 100485e:	ee                   	out    dx,al
 100485f:	66 ba f3 01          	mov    dx,0x1f3
 1004863:	89 f0                	mov    eax,esi
 1004865:	ee                   	out    dx,al
 1004866:	66 42                	inc    dx
 1004868:	c1 e8 08             	shr    eax,0x8
 100486b:	ee                   	out    dx,al
 100486c:	66 42                	inc    dx
 100486e:	c1 e8 08             	shr    eax,0x8
 1004871:	ee                   	out    dx,al
 1004872:	66 42                	inc    dx
 1004874:	66 c1 e8 08          	shr    ax,0x8
 1004878:	24 0f                	and    al,0xf
 100487a:	0c e0                	or     al,0xe0
 100487c:	ee                   	out    dx,al
 100487d:	66 42                	inc    dx
 100487f:	b0 20                	mov    al,0x20
 1004881:	ee                   	out    dx,al

01004882 <read_disk_asm.wait>:
 1004882:	90                   	nop
 1004883:	ec                   	in     al,dx
 1004884:	24 88                	and    al,0x88
 1004886:	3c 08                	cmp    al,0x8
 1004888:	75 f8                	jne    1004882 <read_disk_asm.wait>
 100488a:	66 89 d7             	mov    di,dx
 100488d:	89 c8                	mov    eax,ecx
 100488f:	66 b9 00 01          	mov    cx,0x100
 1004893:	66 f7 e1             	mul    cx
 1004896:	89 c1                	mov    ecx,eax
 1004898:	66 ba f0 01          	mov    dx,0x1f0

0100489c <read_disk_asm.read>:
 100489c:	66 ed                	in     ax,dx
 100489e:	66 89 03             	mov    WORD PTR [ebx],ax
 10048a1:	83 c3 02             	add    ebx,0x2
 10048a4:	e2 f6                	loop   100489c <read_disk_asm.read>
 10048a6:	c9                   	leave  
 10048a7:	b8 00 00 00 00       	mov    eax,0x0
 10048ac:	c3                   	ret    

010048ad <read_disk_asm.err_disk_reading>:
 10048ad:	66 ba f1 01          	mov    dx,0x1f1
 10048b1:	31 c0                	xor    eax,eax
 10048b3:	66 ed                	in     ax,dx
 10048b5:	89 ec                	mov    esp,ebp
 10048b7:	5d                   	pop    ebp
 10048b8:	c3                   	ret    

010048b9 <write_disk_asm>:
 10048b9:	55                   	push   ebp
 10048ba:	89 e5                	mov    ebp,esp
 10048bc:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10048c0:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10048c4:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10048c8:	50                   	push   eax
 10048c9:	66 ba f2 01          	mov    dx,0x1f2
 10048cd:	88 c8                	mov    al,cl
 10048cf:	ee                   	out    dx,al
 10048d0:	58                   	pop    eax
 10048d1:	66 ba f3 01          	mov    dx,0x1f3
 10048d5:	ee                   	out    dx,al
 10048d6:	c1 e8 08             	shr    eax,0x8
 10048d9:	66 ba f4 01          	mov    dx,0x1f4
 10048dd:	ee                   	out    dx,al
 10048de:	c1 e8 08             	shr    eax,0x8
 10048e1:	66 ba f5 01          	mov    dx,0x1f5
 10048e5:	ee                   	out    dx,al
 10048e6:	c1 e8 08             	shr    eax,0x8
 10048e9:	24 0f                	and    al,0xf
 10048eb:	0c e0                	or     al,0xe0
 10048ed:	66 ba f6 01          	mov    dx,0x1f6
 10048f1:	ee                   	out    dx,al
 10048f2:	66 ba f7 01          	mov    dx,0x1f7
 10048f6:	b0 30                	mov    al,0x30
 10048f8:	ee                   	out    dx,al

010048f9 <write_disk_asm.not_ready2>:
 10048f9:	90                   	nop
 10048fa:	ec                   	in     al,dx
 10048fb:	24 88                	and    al,0x88
 10048fd:	3c 08                	cmp    al,0x8
 10048ff:	75 f8                	jne    10048f9 <write_disk_asm.not_ready2>
 1004901:	89 c8                	mov    eax,ecx
 1004903:	66 b9 00 01          	mov    cx,0x100
 1004907:	66 f7 e1             	mul    cx
 100490a:	89 c1                	mov    ecx,eax
 100490c:	66 ba f0 01          	mov    dx,0x1f0

01004910 <write_disk_asm.go_on_write>:
 1004910:	66 8b 03             	mov    ax,WORD PTR [ebx]
 1004913:	66 ef                	out    dx,ax
 1004915:	83 c3 02             	add    ebx,0x2
 1004918:	e2 f6                	loop   1004910 <write_disk_asm.go_on_write>
 100491a:	89 ec                	mov    esp,ebp
 100491c:	5d                   	pop    ebp
 100491d:	c3                   	ret    

0100491e <init_fat16>:
 100491e:	55                   	push   ebp
 100491f:	89 e5                	mov    ebp,esp
 1004921:	81 ec 98 00 00 00    	sub    esp,0x98
 1004927:	83 ec 0c             	sub    esp,0xc
 100492a:	68 60 78 00 01       	push   0x1007860
 100492f:	e8 27 d5 ff ff       	call   1001e5b <reg_device>
 1004934:	83 c4 10             	add    esp,0x10
 1004937:	83 ec 0c             	sub    esp,0xc
 100493a:	68 00 78 00 01       	push   0x1007800
 100493f:	e8 85 d5 ff ff       	call   1001ec9 <reg_driver>
 1004944:	83 c4 10             	add    esp,0x10
 1004947:	a3 64 7e 42 00       	mov    ds:0x427e64,eax
 100494c:	83 ec 0c             	sub    esp,0xc
 100494f:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
 1004955:	50                   	push   eax
 1004956:	e8 27 00 00 00       	call   1004982 <load>
 100495b:	83 c4 10             	add    esp,0x10
 100495e:	8b 15 64 7e 42 00    	mov    edx,DWORD PTR ds:0x427e64
 1004964:	a1 e4 fb 41 00       	mov    eax,ds:0x41fbe4
 1004969:	83 ec 04             	sub    esp,0x4
 100496c:	68 a4 78 00 01       	push   0x10078a4
 1004971:	52                   	push   edx
 1004972:	50                   	push   eax
 1004973:	e8 4a cc ff ff       	call   10015c2 <reg_vol>
 1004978:	83 c4 10             	add    esp,0x10
 100497b:	b8 00 00 00 00       	mov    eax,0x0
 1004980:	c9                   	leave  
 1004981:	c3                   	ret    

01004982 <load>:
 1004982:	55                   	push   ebp
 1004983:	89 e5                	mov    ebp,esp
 1004985:	83 ec 18             	sub    esp,0x18
 1004988:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 100498f:	83 ec 04             	sub    esp,0x4
 1004992:	6a 01                	push   0x1
 1004994:	6a 00                	push   0x0
 1004996:	68 00 fc 41 00       	push   0x41fc00
 100499b:	e8 21 0a 00 00       	call   10053c1 <read_sec>
 10049a0:	83 c4 10             	add    esp,0x10
 10049a3:	0f b7 05 16 fc 41 00 	movzx  eax,WORD PTR ds:0x41fc16
 10049aa:	0f b7 d0             	movzx  edx,ax
 10049ad:	0f b7 05 0e fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0e
 10049b4:	0f b7 c0             	movzx  eax,ax
 10049b7:	83 ec 04             	sub    esp,0x4
 10049ba:	52                   	push   edx
 10049bb:	50                   	push   eax
 10049bc:	68 60 3e 42 00       	push   0x423e60
 10049c1:	e8 fb 09 00 00       	call   10053c1 <read_sec>
 10049c6:	83 c4 10             	add    esp,0x10
 10049c9:	0f b7 05 0e fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0e
 10049d0:	0f b7 c8             	movzx  ecx,ax
 10049d3:	0f b7 05 16 fc 41 00 	movzx  eax,WORD PTR ds:0x41fc16
 10049da:	0f b7 d0             	movzx  edx,ax
 10049dd:	0f b6 05 10 fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc10
 10049e4:	0f b6 c0             	movzx  eax,al
 10049e7:	0f af c2             	imul   eax,edx
 10049ea:	01 c8                	add    eax,ecx
 10049ec:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10049ef:	0f b7 05 11 fc 41 00 	movzx  eax,WORD PTR ds:0x41fc11
 10049f6:	0f b7 c0             	movzx  eax,ax
 10049f9:	c1 e0 05             	shl    eax,0x5
 10049fc:	0f b7 15 0b fc 41 00 	movzx  edx,WORD PTR ds:0x41fc0b
 1004a03:	0f b7 ca             	movzx  ecx,dx
 1004a06:	ba 00 00 00 00       	mov    edx,0x0
 1004a0b:	f7 f1                	div    ecx
 1004a0d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004a10:	83 ec 04             	sub    esp,0x4
 1004a13:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004a16:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004a19:	68 40 fc 41 00       	push   0x41fc40
 1004a1e:	e8 9e 09 00 00       	call   10053c1 <read_sec>
 1004a23:	83 c4 10             	add    esp,0x10
 1004a26:	66 c7 05 5a 3c 42 00 	mov    WORD PTR ds:0x423c5a,0x0
 1004a2d:	00 00 
 1004a2f:	0f b7 05 0e fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0e
 1004a36:	0f b7 c0             	movzx  eax,ax
 1004a39:	83 c0 3e             	add    eax,0x3e
 1004a3c:	a3 30 71 00 01       	mov    ds:0x1007130,eax
 1004a41:	c7 05 60 7e 42 00 00 	mov    DWORD PTR ds:0x427e60,0x0
 1004a48:	00 00 00 
 1004a4b:	b8 00 00 00 00       	mov    eax,0x0
 1004a50:	c9                   	leave  
 1004a51:	c3                   	ret    

01004a52 <verify_name>:
 1004a52:	55                   	push   ebp
 1004a53:	89 e5                	mov    ebp,esp
 1004a55:	57                   	push   edi
 1004a56:	56                   	push   esi
 1004a57:	53                   	push   ebx
 1004a58:	83 ec 6c             	sub    esp,0x6c
 1004a5b:	8d 55 8a             	lea    edx,[ebp-0x76]
 1004a5e:	b8 a8 78 00 01       	mov    eax,0x10078a8
 1004a63:	b9 46 00 00 00       	mov    ecx,0x46
 1004a68:	8b 18                	mov    ebx,DWORD PTR [eax]
 1004a6a:	89 1a                	mov    DWORD PTR [edx],ebx
 1004a6c:	8b 5c 08 fc          	mov    ebx,DWORD PTR [eax+ecx*1-0x4]
 1004a70:	89 5c 0a fc          	mov    DWORD PTR [edx+ecx*1-0x4],ebx
 1004a74:	8d 5a 04             	lea    ebx,[edx+0x4]
 1004a77:	83 e3 fc             	and    ebx,0xfffffffc
 1004a7a:	29 da                	sub    edx,ebx
 1004a7c:	29 d0                	sub    eax,edx
 1004a7e:	01 d1                	add    ecx,edx
 1004a80:	83 e1 fc             	and    ecx,0xfffffffc
 1004a83:	c1 e9 02             	shr    ecx,0x2
 1004a86:	89 ca                	mov    edx,ecx
 1004a88:	89 df                	mov    edi,ebx
 1004a8a:	89 c6                	mov    esi,eax
 1004a8c:	89 d1                	mov    ecx,edx
 1004a8e:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1004a90:	83 ec 0c             	sub    esp,0xc
 1004a93:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1004a96:	e8 3e 21 00 00       	call   1006bd9 <strlen>
 1004a9b:	83 c4 10             	add    esp,0x10
 1004a9e:	83 f8 0b             	cmp    eax,0xb
 1004aa1:	7f 0a                	jg     1004aad <verify_name+0x5b>
 1004aa3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004aa6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004aa9:	84 c0                	test   al,al
 1004aab:	75 0a                	jne    1004ab7 <verify_name+0x65>
 1004aad:	b8 00 00 00 00       	mov    eax,0x0
 1004ab2:	e9 81 01 00 00       	jmp    1004c38 <verify_name+0x1e6>
 1004ab7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1004abe:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 1004ac5:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1004acc:	c7 45 d0 01 00 00 00 	mov    DWORD PTR [ebp-0x30],0x1
 1004ad3:	eb 62                	jmp    1004b37 <verify_name+0xe5>
 1004ad5:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 1004adc:	eb 1e                	jmp    1004afc <verify_name+0xaa>
 1004ade:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004ae1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004ae4:	01 d0                	add    eax,edx
 1004ae6:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1004ae9:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 1004aec:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1004aef:	01 c8                	add    eax,ecx
 1004af1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004af4:	38 c2                	cmp    dl,al
 1004af6:	74 0e                	je     1004b06 <verify_name+0xb4>
 1004af8:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1004afc:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1004aff:	83 f8 45             	cmp    eax,0x45
 1004b02:	76 da                	jbe    1004ade <verify_name+0x8c>
 1004b04:	eb 01                	jmp    1004b07 <verify_name+0xb5>
 1004b06:	90                   	nop
 1004b07:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1004b0a:	83 f8 45             	cmp    eax,0x45
 1004b0d:	76 0a                	jbe    1004b19 <verify_name+0xc7>
 1004b0f:	b8 00 00 00 00       	mov    eax,0x0
 1004b14:	e9 1f 01 00 00       	jmp    1004c38 <verify_name+0x1e6>
 1004b19:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004b1c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b1f:	01 d0                	add    eax,edx
 1004b21:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004b24:	3c 20                	cmp    al,0x20
 1004b26:	74 07                	je     1004b2f <verify_name+0xdd>
 1004b28:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 1004b2f:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004b33:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 1004b37:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004b3a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b3d:	01 d0                	add    eax,edx
 1004b3f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004b42:	3c 2e                	cmp    al,0x2e
 1004b44:	74 0f                	je     1004b55 <verify_name+0x103>
 1004b46:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004b49:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b4c:	01 d0                	add    eax,edx
 1004b4e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004b51:	84 c0                	test   al,al
 1004b53:	75 80                	jne    1004ad5 <verify_name+0x83>
 1004b55:	83 7d e4 08          	cmp    DWORD PTR [ebp-0x1c],0x8
 1004b59:	7f 06                	jg     1004b61 <verify_name+0x10f>
 1004b5b:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 1004b5f:	75 0a                	jne    1004b6b <verify_name+0x119>
 1004b61:	b8 00 00 00 00       	mov    eax,0x0
 1004b66:	e9 cd 00 00 00       	jmp    1004c38 <verify_name+0x1e6>
 1004b6b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004b6e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b71:	01 d0                	add    eax,edx
 1004b73:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004b76:	84 c0                	test   al,al
 1004b78:	75 0a                	jne    1004b84 <verify_name+0x132>
 1004b7a:	b8 01 00 00 00       	mov    eax,0x1
 1004b7f:	e9 b4 00 00 00       	jmp    1004c38 <verify_name+0x1e6>
 1004b84:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1004b8b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1004b92:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 1004b96:	eb 75                	jmp    1004c0d <verify_name+0x1bb>
 1004b98:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 1004b9f:	eb 1e                	jmp    1004bbf <verify_name+0x16d>
 1004ba1:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004ba4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004ba7:	01 d0                	add    eax,edx
 1004ba9:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1004bac:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 1004baf:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1004bb2:	01 c8                	add    eax,ecx
 1004bb4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004bb7:	38 c2                	cmp    dl,al
 1004bb9:	74 0e                	je     1004bc9 <verify_name+0x177>
 1004bbb:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 1004bbf:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1004bc2:	83 f8 45             	cmp    eax,0x45
 1004bc5:	76 da                	jbe    1004ba1 <verify_name+0x14f>
 1004bc7:	eb 01                	jmp    1004bca <verify_name+0x178>
 1004bc9:	90                   	nop
 1004bca:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1004bcd:	83 f8 45             	cmp    eax,0x45
 1004bd0:	76 07                	jbe    1004bd9 <verify_name+0x187>
 1004bd2:	b8 00 00 00 00       	mov    eax,0x0
 1004bd7:	eb 5f                	jmp    1004c38 <verify_name+0x1e6>
 1004bd9:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004bdc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004bdf:	01 d0                	add    eax,edx
 1004be1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004be4:	3c 20                	cmp    al,0x20
 1004be6:	74 07                	je     1004bef <verify_name+0x19d>
 1004be8:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 1004bef:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004bf2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004bf5:	01 d0                	add    eax,edx
 1004bf7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004bfa:	3c 2e                	cmp    al,0x2e
 1004bfc:	75 07                	jne    1004c05 <verify_name+0x1b3>
 1004bfe:	b8 00 00 00 00       	mov    eax,0x0
 1004c03:	eb 33                	jmp    1004c38 <verify_name+0x1e6>
 1004c05:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004c09:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 1004c0d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004c10:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c13:	01 d0                	add    eax,edx
 1004c15:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c18:	84 c0                	test   al,al
 1004c1a:	0f 85 78 ff ff ff    	jne    1004b98 <verify_name+0x146>
 1004c20:	83 7d e4 03          	cmp    DWORD PTR [ebp-0x1c],0x3
 1004c24:	7f 06                	jg     1004c2c <verify_name+0x1da>
 1004c26:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 1004c2a:	75 07                	jne    1004c33 <verify_name+0x1e1>
 1004c2c:	b8 00 00 00 00       	mov    eax,0x0
 1004c31:	eb 05                	jmp    1004c38 <verify_name+0x1e6>
 1004c33:	b8 01 00 00 00       	mov    eax,0x1
 1004c38:	8d 65 f4             	lea    esp,[ebp-0xc]
 1004c3b:	5b                   	pop    ebx
 1004c3c:	5e                   	pop    esi
 1004c3d:	5f                   	pop    edi
 1004c3e:	5d                   	pop    ebp
 1004c3f:	c3                   	ret    

01004c40 <format_name>:
 1004c40:	55                   	push   ebp
 1004c41:	89 e5                	mov    ebp,esp
 1004c43:	83 ec 28             	sub    esp,0x28
 1004c46:	c7 45 e0 20 20 20 20 	mov    DWORD PTR [ebp-0x20],0x20202020
 1004c4d:	c7 45 e4 20 20 20 20 	mov    DWORD PTR [ebp-0x1c],0x20202020
 1004c54:	c7 45 e8 20 20 20 00 	mov    DWORD PTR [ebp-0x18],0x202020
 1004c5b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1004c62:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004c69:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1004c70:	eb 7e                	jmp    1004cf0 <format_name+0xb0>
 1004c72:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004c75:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c78:	01 d0                	add    eax,edx
 1004c7a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c7d:	3c 60                	cmp    al,0x60
 1004c7f:	7e 32                	jle    1004cb3 <format_name+0x73>
 1004c81:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004c84:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c87:	01 d0                	add    eax,edx
 1004c89:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c8c:	3c 7a                	cmp    al,0x7a
 1004c8e:	7f 23                	jg     1004cb3 <format_name+0x73>
 1004c90:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004c93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c96:	01 d0                	add    eax,edx
 1004c98:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c9b:	8d 48 e0             	lea    ecx,[eax-0x20]
 1004c9e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004ca1:	8d 50 01             	lea    edx,[eax+0x1]
 1004ca4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1004ca7:	89 ca                	mov    edx,ecx
 1004ca9:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 1004cad:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004cb1:	eb 39                	jmp    1004cec <format_name+0xac>
 1004cb3:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004cb6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004cb9:	01 d0                	add    eax,edx
 1004cbb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004cbe:	3c 2e                	cmp    al,0x2e
 1004cc0:	75 0d                	jne    1004ccf <format_name+0x8f>
 1004cc2:	b8 08 00 00 00       	mov    eax,0x8
 1004cc7:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1004cca:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 1004ccd:	eb 1d                	jmp    1004cec <format_name+0xac>
 1004ccf:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004cd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004cd5:	8d 0c 02             	lea    ecx,[edx+eax*1]
 1004cd8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004cdb:	8d 50 01             	lea    edx,[eax+0x1]
 1004cde:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1004ce1:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 1004ce4:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 1004ce8:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004cec:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1004cf0:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004cf3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004cf6:	01 d0                	add    eax,edx
 1004cf8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004cfb:	84 c0                	test   al,al
 1004cfd:	0f 85 6f ff ff ff    	jne    1004c72 <format_name+0x32>
 1004d03:	c6 45 ec 00          	mov    BYTE PTR [ebp-0x14],0x0
 1004d07:	83 ec 08             	sub    esp,0x8
 1004d0a:	8d 45 e0             	lea    eax,[ebp-0x20]
 1004d0d:	50                   	push   eax
 1004d0e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1004d11:	e8 fd 1c 00 00       	call   1006a13 <strcpy>
 1004d16:	83 c4 10             	add    esp,0x10
 1004d19:	90                   	nop
 1004d1a:	c9                   	leave  
 1004d1b:	c3                   	ret    

01004d1c <req_cluster>:
 1004d1c:	55                   	push   ebp
 1004d1d:	89 e5                	mov    ebp,esp
 1004d1f:	83 ec 10             	sub    esp,0x10
 1004d22:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
 1004d29:	eb 26                	jmp    1004d51 <req_cluster+0x35>
 1004d2b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004d2e:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1004d35:	00 
 1004d36:	66 85 c0             	test   ax,ax
 1004d39:	75 12                	jne    1004d4d <req_cluster+0x31>
 1004d3b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004d3e:	66 c7 84 00 60 3e 42 	mov    WORD PTR [eax+eax*1+0x423e60],0xffff
 1004d45:	00 ff ff 
 1004d48:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004d4b:	eb 13                	jmp    1004d60 <req_cluster+0x44>
 1004d4d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1004d51:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004d54:	3d ff 1f 00 00       	cmp    eax,0x1fff
 1004d59:	76 d0                	jbe    1004d2b <req_cluster+0xf>
 1004d5b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004d60:	c9                   	leave  
 1004d61:	c3                   	ret    

01004d62 <write_sec>:
 1004d62:	55                   	push   ebp
 1004d63:	89 e5                	mov    ebp,esp
 1004d65:	57                   	push   edi
 1004d66:	81 ec 94 00 00 00    	sub    esp,0x94
 1004d6c:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
 1004d72:	b8 00 00 00 00       	mov    eax,0x0
 1004d77:	b9 22 00 00 00       	mov    ecx,0x22
 1004d7c:	89 d7                	mov    edi,edx
 1004d7e:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1004d80:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004d83:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1004d89:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004d8c:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 1004d8f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1004d92:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 1004d95:	a1 ec 70 00 01       	mov    eax,ds:0x10070ec
 1004d9a:	83 ec 0c             	sub    esp,0xc
 1004d9d:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
 1004da3:	52                   	push   edx
 1004da4:	ff d0                	call   eax
 1004da6:	83 c4 10             	add    esp,0x10
 1004da9:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1004dac:	c9                   	leave  
 1004dad:	c3                   	ret    

01004dae <set_attr>:
 1004dae:	55                   	push   ebp
 1004daf:	89 e5                	mov    ebp,esp
 1004db1:	83 ec 04             	sub    esp,0x4
 1004db4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004db7:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1004dba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004dbd:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
 1004dc1:	0a 45 fc             	or     al,BYTE PTR [ebp-0x4]
 1004dc4:	89 c2                	mov    edx,eax
 1004dc6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004dc9:	88 50 0b             	mov    BYTE PTR [eax+0xb],dl
 1004dcc:	90                   	nop
 1004dcd:	c9                   	leave  
 1004dce:	c3                   	ret    

01004dcf <update_fat_and_root>:
 1004dcf:	55                   	push   ebp
 1004dd0:	89 e5                	mov    ebp,esp
 1004dd2:	83 ec 18             	sub    esp,0x18
 1004dd5:	0f b7 05 0e fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0e
 1004ddc:	0f b7 c8             	movzx  ecx,ax
 1004ddf:	0f b7 05 16 fc 41 00 	movzx  eax,WORD PTR ds:0x41fc16
 1004de6:	0f b7 d0             	movzx  edx,ax
 1004de9:	0f b6 05 10 fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc10
 1004df0:	0f b6 c0             	movzx  eax,al
 1004df3:	0f af c2             	imul   eax,edx
 1004df6:	01 c8                	add    eax,ecx
 1004df8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004dfb:	83 ec 04             	sub    esp,0x4
 1004dfe:	68 00 40 00 00       	push   0x4000
 1004e03:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1004e06:	68 40 fc 41 00       	push   0x41fc40
 1004e0b:	e8 52 ff ff ff       	call   1004d62 <write_sec>
 1004e10:	83 c4 10             	add    esp,0x10
 1004e13:	0f b7 05 0e fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0e
 1004e1a:	0f b7 c0             	movzx  eax,ax
 1004e1d:	83 ec 04             	sub    esp,0x4
 1004e20:	68 00 40 00 00       	push   0x4000
 1004e25:	50                   	push   eax
 1004e26:	68 60 3e 42 00       	push   0x423e60
 1004e2b:	e8 32 ff ff ff       	call   1004d62 <write_sec>
 1004e30:	83 c4 10             	add    esp,0x10
 1004e33:	90                   	nop
 1004e34:	c9                   	leave  
 1004e35:	c3                   	ret    

01004e36 <add_dot_and_ddot_dir>:
 1004e36:	55                   	push   ebp
 1004e37:	89 e5                	mov    ebp,esp
 1004e39:	83 ec 18             	sub    esp,0x18
 1004e3c:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004e40:	0f b7 c0             	movzx  eax,ax
 1004e43:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004e46:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1004e4d:	0f b6 c0             	movzx  eax,al
 1004e50:	8b 0d 30 71 00 01    	mov    ecx,DWORD PTR ds:0x1007130
 1004e56:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1004e59:	01 ca                	add    edx,ecx
 1004e5b:	83 ec 04             	sub    esp,0x4
 1004e5e:	50                   	push   eax
 1004e5f:	52                   	push   edx
 1004e60:	68 60 3c 42 00       	push   0x423c60
 1004e65:	e8 57 05 00 00       	call   10053c1 <read_sec>
 1004e6a:	83 c4 10             	add    esp,0x10
 1004e6d:	83 ec 08             	sub    esp,0x8
 1004e70:	68 ee 78 00 01       	push   0x10078ee
 1004e75:	68 60 3c 42 00       	push   0x423c60
 1004e7a:	e8 94 1b 00 00       	call   1006a13 <strcpy>
 1004e7f:	83 c4 10             	add    esp,0x10
 1004e82:	83 ec 08             	sub    esp,0x8
 1004e85:	68 f7 78 00 01       	push   0x10078f7
 1004e8a:	68 68 3c 42 00       	push   0x423c68
 1004e8f:	e8 7f 1b 00 00       	call   1006a13 <strcpy>
 1004e94:	83 c4 10             	add    esp,0x10
 1004e97:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004e9b:	66 a3 7a 3c 42 00    	mov    ds:0x423c7a,ax
 1004ea1:	c7 05 7c 3c 42 00 00 	mov    DWORD PTR ds:0x423c7c,0x0
 1004ea8:	00 00 00 
 1004eab:	83 ec 08             	sub    esp,0x8
 1004eae:	6a 10                	push   0x10
 1004eb0:	68 60 3c 42 00       	push   0x423c60
 1004eb5:	e8 f4 fe ff ff       	call   1004dae <set_attr>
 1004eba:	83 c4 10             	add    esp,0x10
 1004ebd:	83 ec 08             	sub    esp,0x8
 1004ec0:	68 fb 78 00 01       	push   0x10078fb
 1004ec5:	68 80 3c 42 00       	push   0x423c80
 1004eca:	e8 44 1b 00 00       	call   1006a13 <strcpy>
 1004ecf:	83 c4 10             	add    esp,0x10
 1004ed2:	83 ec 08             	sub    esp,0x8
 1004ed5:	68 f7 78 00 01       	push   0x10078f7
 1004eda:	68 88 3c 42 00       	push   0x423c88
 1004edf:	e8 2f 1b 00 00       	call   1006a13 <strcpy>
 1004ee4:	83 c4 10             	add    esp,0x10
 1004ee7:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1004eee:	66 a3 9a 3c 42 00    	mov    ds:0x423c9a,ax
 1004ef4:	c7 05 9c 3c 42 00 00 	mov    DWORD PTR ds:0x423c9c,0x0
 1004efb:	00 00 00 
 1004efe:	83 ec 08             	sub    esp,0x8
 1004f01:	6a 10                	push   0x10
 1004f03:	68 80 3c 42 00       	push   0x423c80
 1004f08:	e8 a1 fe ff ff       	call   1004dae <set_attr>
 1004f0d:	83 c4 10             	add    esp,0x10
 1004f10:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1004f16:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004f19:	01 d0                	add    eax,edx
 1004f1b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1004f1e:	83 ec 04             	sub    esp,0x4
 1004f21:	68 00 02 00 00       	push   0x200
 1004f26:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004f29:	68 60 3c 42 00       	push   0x423c60
 1004f2e:	e8 2f fe ff ff       	call   1004d62 <write_sec>
 1004f33:	83 c4 10             	add    esp,0x10
 1004f36:	90                   	nop
 1004f37:	c9                   	leave  
 1004f38:	c3                   	ret    

01004f39 <translate_attr>:
 1004f39:	55                   	push   ebp
 1004f3a:	89 e5                	mov    ebp,esp
 1004f3c:	83 ec 14             	sub    esp,0x14
 1004f3f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004f42:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1004f45:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004f49:	83 e0 01             	and    eax,0x1
 1004f4c:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004f4f:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004f53:	74 09                	je     1004f5e <translate_attr+0x25>
 1004f55:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004f58:	83 c0 01             	add    eax,0x1
 1004f5b:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1004f5e:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004f62:	83 e0 02             	and    eax,0x2
 1004f65:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004f68:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004f6c:	74 09                	je     1004f77 <translate_attr+0x3e>
 1004f6e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004f71:	83 c0 02             	add    eax,0x2
 1004f74:	c6 00 68             	mov    BYTE PTR [eax],0x68
 1004f77:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004f7b:	83 e0 04             	and    eax,0x4
 1004f7e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004f81:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004f85:	74 09                	je     1004f90 <translate_attr+0x57>
 1004f87:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004f8a:	83 c0 04             	add    eax,0x4
 1004f8d:	c6 00 73             	mov    BYTE PTR [eax],0x73
 1004f90:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004f94:	83 e0 08             	and    eax,0x8
 1004f97:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004f9a:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004f9e:	74 09                	je     1004fa9 <translate_attr+0x70>
 1004fa0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004fa3:	83 c0 03             	add    eax,0x3
 1004fa6:	c6 00 76             	mov    BYTE PTR [eax],0x76
 1004fa9:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004fad:	83 e0 10             	and    eax,0x10
 1004fb0:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004fb3:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004fb7:	74 09                	je     1004fc2 <translate_attr+0x89>
 1004fb9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004fbc:	83 c0 03             	add    eax,0x3
 1004fbf:	c6 00 64             	mov    BYTE PTR [eax],0x64
 1004fc2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004fc5:	83 c0 05             	add    eax,0x5
 1004fc8:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1004fcb:	90                   	nop
 1004fcc:	c9                   	leave  
 1004fcd:	c3                   	ret    

01004fce <extend_cluster>:
 1004fce:	55                   	push   ebp
 1004fcf:	89 e5                	mov    ebp,esp
 1004fd1:	83 ec 14             	sub    esp,0x14
 1004fd4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004fd7:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 1004fdb:	e8 3c fd ff ff       	call   1004d1c <req_cluster>
 1004fe0:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004fe3:	83 7d fc ff          	cmp    DWORD PTR [ebp-0x4],0xffffffff
 1004fe7:	75 07                	jne    1004ff0 <extend_cluster+0x22>
 1004fe9:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004fee:	eb 14                	jmp    1005004 <extend_cluster+0x36>
 1004ff0:	0f bf 45 ec          	movsx  eax,WORD PTR [ebp-0x14]
 1004ff4:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004ff7:	66 89 94 00 60 3e 42 	mov    WORD PTR [eax+eax*1+0x423e60],dx
 1004ffe:	00 
 1004fff:	b8 00 00 00 00       	mov    eax,0x0
 1005004:	c9                   	leave  
 1005005:	c3                   	ret    

01005006 <touch>:
 1005006:	55                   	push   ebp
 1005007:	89 e5                	mov    ebp,esp
 1005009:	83 ec 48             	sub    esp,0x48
 100500c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100500f:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1005012:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005015:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005018:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 100501b:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 100501f:	c7 45 e8 10 00 00 00 	mov    DWORD PTR [ebp-0x18],0x10
 1005026:	c7 45 e4 60 3c 42 00 	mov    DWORD PTR [ebp-0x1c],0x423c60
 100502d:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005034:	0f b6 c0             	movzx  eax,al
 1005037:	0f b7 55 da          	movzx  edx,WORD PTR [ebp-0x26]
 100503b:	0f b7 ca             	movzx  ecx,dx
 100503e:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005044:	01 ca                	add    edx,ecx
 1005046:	83 ec 04             	sub    esp,0x4
 1005049:	50                   	push   eax
 100504a:	52                   	push   edx
 100504b:	68 60 3c 42 00       	push   0x423c60
 1005050:	e8 6c 03 00 00       	call   10053c1 <read_sec>
 1005055:	83 c4 10             	add    esp,0x10
 1005058:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 100505c:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1005060:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1005067:	e9 04 01 00 00       	jmp    1005170 <touch+0x16a>
 100506c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100506f:	c1 e0 05             	shl    eax,0x5
 1005072:	89 c2                	mov    edx,eax
 1005074:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005077:	01 d0                	add    eax,edx
 1005079:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100507c:	3c e5                	cmp    al,0xe5
 100507e:	74 18                	je     1005098 <touch+0x92>
 1005080:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005083:	c1 e0 05             	shl    eax,0x5
 1005086:	89 c2                	mov    edx,eax
 1005088:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100508b:	01 d0                	add    eax,edx
 100508d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005090:	84 c0                	test   al,al
 1005092:	0f 85 d4 00 00 00    	jne    100516c <touch+0x166>
 1005098:	83 ec 0c             	sub    esp,0xc
 100509b:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 100509e:	e8 9d fb ff ff       	call   1004c40 <format_name>
 10050a3:	83 c4 10             	add    esp,0x10
 10050a6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10050a9:	c1 e0 05             	shl    eax,0x5
 10050ac:	89 c2                	mov    edx,eax
 10050ae:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10050b1:	01 d0                	add    eax,edx
 10050b3:	83 ec 04             	sub    esp,0x4
 10050b6:	6a 0b                	push   0xb
 10050b8:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 10050bb:	50                   	push   eax
 10050bc:	e8 8a 18 00 00       	call   100694b <memcpy>
 10050c1:	83 c4 10             	add    esp,0x10
 10050c4:	e8 53 fc ff ff       	call   1004d1c <req_cluster>
 10050c9:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10050cc:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 10050d0:	75 0a                	jne    10050dc <touch+0xd6>
 10050d2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10050d7:	e9 ed 00 00 00       	jmp    10051c9 <touch+0x1c3>
 10050dc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10050df:	c1 e0 05             	shl    eax,0x5
 10050e2:	89 c2                	mov    edx,eax
 10050e4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10050e7:	01 d0                	add    eax,edx
 10050e9:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10050ec:	66 89 50 1a          	mov    WORD PTR [eax+0x1a],dx
 10050f0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10050f3:	c1 e0 05             	shl    eax,0x5
 10050f6:	89 c2                	mov    edx,eax
 10050f8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10050fb:	01 d0                	add    eax,edx
 10050fd:	83 ec 08             	sub    esp,0x8
 1005100:	6a 20                	push   0x20
 1005102:	50                   	push   eax
 1005103:	e8 a6 fc ff ff       	call   1004dae <set_attr>
 1005108:	83 c4 10             	add    esp,0x10
 100510b:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1005112:	0f b7 d0             	movzx  edx,ax
 1005115:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 100511c:	0f b6 c0             	movzx  eax,al
 100511f:	0f af d0             	imul   edx,eax
 1005122:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005125:	c1 e0 05             	shl    eax,0x5
 1005128:	89 c1                	mov    ecx,eax
 100512a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100512d:	01 c8                	add    eax,ecx
 100512f:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
 1005132:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1005139:	0f b7 d0             	movzx  edx,ax
 100513c:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005143:	0f b6 c0             	movzx  eax,al
 1005146:	0f af c2             	imul   eax,edx
 1005149:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 100514d:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005153:	01 ca                	add    edx,ecx
 1005155:	83 ec 04             	sub    esp,0x4
 1005158:	50                   	push   eax
 1005159:	52                   	push   edx
 100515a:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 100515d:	e8 00 fc ff ff       	call   1004d62 <write_sec>
 1005162:	83 c4 10             	add    esp,0x10
 1005165:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100516a:	eb 5d                	jmp    10051c9 <touch+0x1c3>
 100516c:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1005170:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005173:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 1005176:	0f 8c f0 fe ff ff    	jl     100506c <touch+0x66>
 100517c:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1005181:	77 36                	ja     10051b9 <touch+0x1b3>
 1005183:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1005187:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 100518e:	00 
 100518f:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1005193:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 100519a:	0f b6 c0             	movzx  eax,al
 100519d:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 10051a1:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 10051a7:	01 ca                	add    edx,ecx
 10051a9:	83 ec 04             	sub    esp,0x4
 10051ac:	50                   	push   eax
 10051ad:	52                   	push   edx
 10051ae:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 10051b1:	e8 0b 02 00 00       	call   10053c1 <read_sec>
 10051b6:	83 c4 10             	add    esp,0x10
 10051b9:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 10051be:	0f 86 9c fe ff ff    	jbe    1005060 <touch+0x5a>
 10051c4:	b8 00 00 00 00       	mov    eax,0x0
 10051c9:	c9                   	leave  
 10051ca:	c3                   	ret    

010051cb <mkdir>:
 10051cb:	55                   	push   ebp
 10051cc:	89 e5                	mov    ebp,esp
 10051ce:	83 ec 48             	sub    esp,0x48
 10051d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10051d4:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 10051d7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10051da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10051dd:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 10051e0:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 10051e4:	83 ec 0c             	sub    esp,0xc
 10051e7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 10051ea:	e8 51 fa ff ff       	call   1004c40 <format_name>
 10051ef:	83 c4 10             	add    esp,0x10
 10051f2:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 10051f6:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10051fa:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005201:	0f b6 c0             	movzx  eax,al
 1005204:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005208:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 100520e:	01 ca                	add    edx,ecx
 1005210:	83 ec 04             	sub    esp,0x4
 1005213:	50                   	push   eax
 1005214:	52                   	push   edx
 1005215:	68 60 3c 42 00       	push   0x423c60
 100521a:	e8 a2 01 00 00       	call   10053c1 <read_sec>
 100521f:	83 c4 10             	add    esp,0x10
 1005222:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1005229:	e9 60 01 00 00       	jmp    100538e <mkdir+0x1c3>
 100522e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005231:	c1 e0 05             	shl    eax,0x5
 1005234:	05 7a 3c 42 00       	add    eax,0x423c7a
 1005239:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100523c:	66 85 c0             	test   ax,ax
 100523f:	74 28                	je     1005269 <mkdir+0x9e>
 1005241:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005244:	c1 e0 05             	shl    eax,0x5
 1005247:	05 40 fc 41 00       	add    eax,0x41fc40
 100524c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100524f:	3c e5                	cmp    al,0xe5
 1005251:	74 16                	je     1005269 <mkdir+0x9e>
 1005253:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005256:	c1 e0 05             	shl    eax,0x5
 1005259:	05 40 fc 41 00       	add    eax,0x41fc40
 100525e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005261:	84 c0                	test   al,al
 1005263:	0f 85 21 01 00 00    	jne    100538a <mkdir+0x1bf>
 1005269:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100526c:	c1 e0 05             	shl    eax,0x5
 100526f:	05 60 3c 42 00       	add    eax,0x423c60
 1005274:	83 ec 04             	sub    esp,0x4
 1005277:	6a 20                	push   0x20
 1005279:	6a 00                	push   0x0
 100527b:	50                   	push   eax
 100527c:	e8 54 17 00 00       	call   10069d5 <memset>
 1005281:	83 c4 10             	add    esp,0x10
 1005284:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005287:	c1 e0 05             	shl    eax,0x5
 100528a:	05 60 3c 42 00       	add    eax,0x423c60
 100528f:	83 ec 04             	sub    esp,0x4
 1005292:	6a 0b                	push   0xb
 1005294:	6a 20                	push   0x20
 1005296:	50                   	push   eax
 1005297:	e8 39 17 00 00       	call   10069d5 <memset>
 100529c:	83 c4 10             	add    esp,0x10
 100529f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10052a2:	c1 e0 05             	shl    eax,0x5
 10052a5:	05 60 3c 42 00       	add    eax,0x423c60
 10052aa:	83 ec 08             	sub    esp,0x8
 10052ad:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 10052b0:	50                   	push   eax
 10052b1:	e8 5d 17 00 00       	call   1006a13 <strcpy>
 10052b6:	83 c4 10             	add    esp,0x10
 10052b9:	83 ec 0c             	sub    esp,0xc
 10052bc:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 10052bf:	e8 15 19 00 00       	call   1006bd9 <strlen>
 10052c4:	83 c4 10             	add    esp,0x10
 10052c7:	89 c2                	mov    edx,eax
 10052c9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10052cc:	c1 e0 05             	shl    eax,0x5
 10052cf:	01 d0                	add    eax,edx
 10052d1:	05 60 3c 42 00       	add    eax,0x423c60
 10052d6:	c6 00 20             	mov    BYTE PTR [eax],0x20
 10052d9:	e8 3e fa ff ff       	call   1004d1c <req_cluster>
 10052de:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 10052e1:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 10052e5:	75 0a                	jne    10052f1 <mkdir+0x126>
 10052e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10052ec:	e9 ce 00 00 00       	jmp    10053bf <mkdir+0x1f4>
 10052f1:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 10052f4:	89 c2                	mov    edx,eax
 10052f6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10052f9:	c1 e0 05             	shl    eax,0x5
 10052fc:	05 7a 3c 42 00       	add    eax,0x423c7a
 1005301:	66 89 10             	mov    WORD PTR [eax],dx
 1005304:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005307:	c1 e0 05             	shl    eax,0x5
 100530a:	05 60 3c 42 00       	add    eax,0x423c60
 100530f:	83 ec 08             	sub    esp,0x8
 1005312:	6a 10                	push   0x10
 1005314:	50                   	push   eax
 1005315:	e8 94 fa ff ff       	call   1004dae <set_attr>
 100531a:	83 c4 10             	add    esp,0x10
 100531d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005320:	c1 e0 05             	shl    eax,0x5
 1005323:	05 7c 3c 42 00       	add    eax,0x423c7c
 1005328:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100532e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005331:	c1 e0 05             	shl    eax,0x5
 1005334:	05 60 3c 42 00       	add    eax,0x423c60
 1005339:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 100533c:	ff 70 18             	push   DWORD PTR [eax+0x18]
 100533f:	ff 70 14             	push   DWORD PTR [eax+0x14]
 1005342:	ff 70 10             	push   DWORD PTR [eax+0x10]
 1005345:	ff 70 0c             	push   DWORD PTR [eax+0xc]
 1005348:	ff 70 08             	push   DWORD PTR [eax+0x8]
 100534b:	ff 70 04             	push   DWORD PTR [eax+0x4]
 100534e:	ff 30                	push   DWORD PTR [eax]
 1005350:	e8 e1 fa ff ff       	call   1004e36 <add_dot_and_ddot_dir>
 1005355:	83 c4 20             	add    esp,0x20
 1005358:	0f b7 55 f6          	movzx  edx,WORD PTR [ebp-0xa]
 100535c:	a1 30 71 00 01       	mov    eax,ds:0x1007130
 1005361:	01 d0                	add    eax,edx
 1005363:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005366:	83 ec 04             	sub    esp,0x4
 1005369:	68 00 02 00 00       	push   0x200
 100536e:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005371:	68 60 3c 42 00       	push   0x423c60
 1005376:	e8 e7 f9 ff ff       	call   1004d62 <write_sec>
 100537b:	83 c4 10             	add    esp,0x10
 100537e:	e8 4c fa ff ff       	call   1004dcf <update_fat_and_root>
 1005383:	b8 00 00 00 00       	mov    eax,0x0
 1005388:	eb 35                	jmp    10053bf <mkdir+0x1f4>
 100538a:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 100538e:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 1005392:	0f 8e 96 fe ff ff    	jle    100522e <mkdir+0x63>
 1005398:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 100539d:	77 10                	ja     10053af <mkdir+0x1e4>
 100539f:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10053a3:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10053aa:	00 
 10053ab:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10053af:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 10053b4:	0f 86 40 fe ff ff    	jbe    10051fa <mkdir+0x2f>
 10053ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10053bf:	c9                   	leave  
 10053c0:	c3                   	ret    

010053c1 <read_sec>:
 10053c1:	55                   	push   ebp
 10053c2:	89 e5                	mov    ebp,esp
 10053c4:	57                   	push   edi
 10053c5:	81 ec 94 00 00 00    	sub    esp,0x94
 10053cb:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
 10053d1:	b8 00 00 00 00       	mov    eax,0x0
 10053d6:	b9 22 00 00 00       	mov    ecx,0x22
 10053db:	89 d7                	mov    edi,edx
 10053dd:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10053df:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10053e2:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 10053e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10053eb:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 10053f1:	c7 45 84 01 00 00 00 	mov    DWORD PTR [ebp-0x7c],0x1
 10053f8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10053ff:	eb 3f                	jmp    1005440 <read_sec+0x7f>
 1005401:	a1 ec 70 00 01       	mov    eax,ds:0x10070ec
 1005406:	83 ec 0c             	sub    esp,0xc
 1005409:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
 100540f:	52                   	push   edx
 1005410:	ff d0                	call   eax
 1005412:	83 c4 10             	add    esp,0x10
 1005415:	8b 95 70 ff ff ff    	mov    edx,DWORD PTR [ebp-0x90]
 100541b:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1005422:	0f b7 c0             	movzx  eax,ax
 1005425:	01 d0                	add    eax,edx
 1005427:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 100542d:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
 1005433:	83 c0 01             	add    eax,0x1
 1005436:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 100543c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1005440:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005443:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1005446:	7c b9                	jl     1005401 <read_sec+0x40>
 1005448:	b8 00 00 00 00       	mov    eax,0x0
 100544d:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1005450:	c9                   	leave  
 1005451:	c3                   	ret    

01005452 <rm>:
 1005452:	55                   	push   ebp
 1005453:	89 e5                	mov    ebp,esp
 1005455:	57                   	push   edi
 1005456:	81 ec c4 00 00 00    	sub    esp,0xc4
 100545c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100545f:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1005462:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005465:	8d 95 3c ff ff ff    	lea    edx,[ebp-0xc4]
 100546b:	b8 00 00 00 00       	mov    eax,0x0
 1005470:	b9 22 00 00 00       	mov    ecx,0x22
 1005475:	89 d7                	mov    edi,edx
 1005477:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1005479:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100547c:	8b 80 80 00 00 00    	mov    eax,DWORD PTR [eax+0x80]
 1005482:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
 1005488:	83 ec 0c             	sub    esp,0xc
 100548b:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
 1005491:	50                   	push   eax
 1005492:	e8 86 08 00 00       	call   1005d1d <get_entry>
 1005497:	83 c4 10             	add    esp,0x10
 100549a:	83 f8 ff             	cmp    eax,0xffffffff
 100549d:	75 0a                	jne    10054a9 <rm+0x57>
 100549f:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10054a4:	e9 82 01 00 00       	jmp    100562b <rm+0x1d9>
 10054a9:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
 10054af:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 10054b3:	c7 45 e4 60 3c 42 00 	mov    DWORD PTR [ebp-0x1c],0x423c60
 10054ba:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10054c1:	0f b6 c0             	movzx  eax,al
 10054c4:	0f b7 55 de          	movzx  edx,WORD PTR [ebp-0x22]
 10054c8:	0f b7 ca             	movzx  ecx,dx
 10054cb:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 10054d1:	01 ca                	add    edx,ecx
 10054d3:	83 ec 04             	sub    esp,0x4
 10054d6:	50                   	push   eax
 10054d7:	52                   	push   edx
 10054d8:	68 60 3c 42 00       	push   0x423c60
 10054dd:	e8 df fe ff ff       	call   10053c1 <read_sec>
 10054e2:	83 c4 10             	add    esp,0x10
 10054e5:	c7 45 e4 60 3c 42 00 	mov    DWORD PTR [ebp-0x1c],0x423c60
 10054ec:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 10054f0:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10054f4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10054fb:	eb 79                	jmp    1005576 <rm+0x124>
 10054fd:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005504:	0f b6 c0             	movzx  eax,al
 1005507:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 100550b:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005511:	01 ca                	add    edx,ecx
 1005513:	83 ec 04             	sub    esp,0x4
 1005516:	50                   	push   eax
 1005517:	52                   	push   edx
 1005518:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 100551b:	e8 a1 fe ff ff       	call   10053c1 <read_sec>
 1005520:	83 c4 10             	add    esp,0x10
 1005523:	eb 34                	jmp    1005559 <rm+0x107>
 1005525:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005528:	c1 e0 05             	shl    eax,0x5
 100552b:	89 c2                	mov    edx,eax
 100552d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005530:	01 d0                	add    eax,edx
 1005532:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 1005536:	0f b7 d0             	movzx  edx,ax
 1005539:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100553c:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 100553f:	39 c2                	cmp    edx,eax
 1005541:	75 12                	jne    1005555 <rm+0x103>
 1005543:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005546:	c1 e0 05             	shl    eax,0x5
 1005549:	89 c2                	mov    edx,eax
 100554b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100554e:	01 d0                	add    eax,edx
 1005550:	c6 00 e5             	mov    BYTE PTR [eax],0xe5
 1005553:	eb 29                	jmp    100557e <rm+0x12c>
 1005555:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1005559:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 100555d:	7e c6                	jle    1005525 <rm+0xd3>
 100555f:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1005564:	77 10                	ja     1005576 <rm+0x124>
 1005566:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100556a:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005571:	00 
 1005572:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1005576:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 100557b:	76 80                	jbe    10054fd <rm+0xab>
 100557d:	90                   	nop
 100557e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005581:	c1 e0 05             	shl    eax,0x5
 1005584:	89 c2                	mov    edx,eax
 1005586:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005589:	01 d0                	add    eax,edx
 100558b:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 100558f:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 1005593:	66 83 7d ee f6       	cmp    WORD PTR [ebp-0x12],0xfff6
 1005598:	77 0e                	ja     10055a8 <rm+0x156>
 100559a:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 100559e:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10055a5:	00 
 10055a6:	eb 05                	jmp    10055ad <rm+0x15b>
 10055a8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10055ad:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 10055b1:	eb 26                	jmp    10055d9 <rm+0x187>
 10055b3:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10055b7:	66 c7 84 00 60 3e 42 	mov    WORD PTR [eax+eax*1+0x423e60],0x0
 10055be:	00 00 00 
 10055c1:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10055c5:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 10055c9:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10055cd:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10055d4:	00 
 10055d5:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 10055d9:	66 83 7d ec f6       	cmp    WORD PTR [ebp-0x14],0xfff6
 10055de:	76 d3                	jbe    10055b3 <rm+0x161>
 10055e0:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10055e4:	66 c7 84 00 60 3e 42 	mov    WORD PTR [eax+eax*1+0x423e60],0x0
 10055eb:	00 00 00 
 10055ee:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10055f5:	0f b6 d0             	movzx  edx,al
 10055f8:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 10055ff:	0f b7 c0             	movzx  eax,ax
 1005602:	0f af c2             	imul   eax,edx
 1005605:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005609:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 100560f:	01 ca                	add    edx,ecx
 1005611:	83 ec 04             	sub    esp,0x4
 1005614:	50                   	push   eax
 1005615:	52                   	push   edx
 1005616:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005619:	e8 44 f7 ff ff       	call   1004d62 <write_sec>
 100561e:	83 c4 10             	add    esp,0x10
 1005621:	e8 a9 f7 ff ff       	call   1004dcf <update_fat_and_root>
 1005626:	b8 00 00 00 00       	mov    eax,0x0
 100562b:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 100562e:	c9                   	leave  
 100562f:	c3                   	ret    

01005630 <find>:
 1005630:	55                   	push   ebp
 1005631:	89 e5                	mov    ebp,esp
 1005633:	83 ec 28             	sub    esp,0x28
 1005636:	c7 45 f4 00 02 00 00 	mov    DWORD PTR [ebp-0xc],0x200
 100563d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1005644:	c7 45 ec 60 3c 42 00 	mov    DWORD PTR [ebp-0x14],0x423c60
 100564b:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1005652:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005656:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 100565d:	66 85 c0             	test   ax,ax
 1005660:	75 09                	jne    100566b <find+0x3b>
 1005662:	c7 45 ec 40 fc 41 00 	mov    DWORD PTR [ebp-0x14],0x41fc40
 1005669:	eb 2d                	jmp    1005698 <find+0x68>
 100566b:	c7 45 f4 10 00 00 00 	mov    DWORD PTR [ebp-0xc],0x10
 1005672:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005679:	0f b6 c0             	movzx  eax,al
 100567c:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005680:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005686:	01 ca                	add    edx,ecx
 1005688:	83 ec 04             	sub    esp,0x4
 100568b:	50                   	push   eax
 100568c:	52                   	push   edx
 100568d:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1005690:	e8 2c fd ff ff       	call   10053c1 <read_sec>
 1005695:	83 c4 10             	add    esp,0x10
 1005698:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100569f:	eb 45                	jmp    10056e6 <find+0xb6>
 10056a1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10056a4:	c1 e0 05             	shl    eax,0x5
 10056a7:	89 c2                	mov    edx,eax
 10056a9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10056ac:	01 d0                	add    eax,edx
 10056ae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10056b1:	84 c0                	test   al,al
 10056b3:	74 2c                	je     10056e1 <find+0xb1>
 10056b5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10056b8:	c1 e0 05             	shl    eax,0x5
 10056bb:	89 c2                	mov    edx,eax
 10056bd:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10056c0:	01 d0                	add    eax,edx
 10056c2:	83 ec 04             	sub    esp,0x4
 10056c5:	6a 0b                	push   0xb
 10056c7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10056ca:	50                   	push   eax
 10056cb:	e8 b3 12 00 00       	call   1006983 <memcmp>
 10056d0:	83 c4 10             	add    esp,0x10
 10056d3:	85 c0                	test   eax,eax
 10056d5:	75 0b                	jne    10056e2 <find+0xb2>
 10056d7:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 10056da:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10056dd:	01 d0                	add    eax,edx
 10056df:	eb 71                	jmp    1005752 <find+0x122>
 10056e1:	90                   	nop
 10056e2:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10056e6:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10056e9:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 10056ec:	7c b3                	jl     10056a1 <find+0x71>
 10056ee:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 10056f5:	66 85 c0             	test   ax,ax
 10056f8:	75 07                	jne    1005701 <find+0xd1>
 10056fa:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10056ff:	eb 51                	jmp    1005752 <find+0x122>
 1005701:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005706:	77 3a                	ja     1005742 <find+0x112>
 1005708:	83 45 f0 10          	add    DWORD PTR [ebp-0x10],0x10
 100570c:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005710:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005717:	00 
 1005718:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100571c:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005723:	0f b6 c0             	movzx  eax,al
 1005726:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 100572a:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005730:	01 ca                	add    edx,ecx
 1005732:	83 ec 04             	sub    esp,0x4
 1005735:	50                   	push   eax
 1005736:	52                   	push   edx
 1005737:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 100573a:	e8 82 fc ff ff       	call   10053c1 <read_sec>
 100573f:	83 c4 10             	add    esp,0x10
 1005742:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005747:	0f 86 4b ff ff ff    	jbe    1005698 <find+0x68>
 100574d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005752:	c9                   	leave  
 1005753:	c3                   	ret    

01005754 <read_file_byname>:
 1005754:	55                   	push   ebp
 1005755:	89 e5                	mov    ebp,esp
 1005757:	53                   	push   ebx
 1005758:	83 ec 54             	sub    esp,0x54
 100575b:	89 e0                	mov    eax,esp
 100575d:	89 c3                	mov    ebx,eax
 100575f:	83 ec 0c             	sub    esp,0xc
 1005762:	6a 00                	push   0x0
 1005764:	e8 c7 fe ff ff       	call   1005630 <find>
 1005769:	83 c4 10             	add    esp,0x10
 100576c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100576f:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1005773:	74 06                	je     100577b <read_file_byname+0x27>
 1005775:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005779:	79 0a                	jns    1005785 <read_file_byname+0x31>
 100577b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005780:	e9 86 02 00 00       	jmp    1005a0b <read_file_byname+0x2b7>
 1005785:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 100578c:	c7 45 f0 40 fc 41 00 	mov    DWORD PTR [ebp-0x10],0x41fc40
 1005793:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 100579a:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 10057a1:	66 85 c0             	test   ax,ax
 10057a4:	74 43                	je     10057e9 <read_file_byname+0x95>
 10057a6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10057ad:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 10057b4:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10057bb:	0f b6 c0             	movzx  eax,al
 10057be:	0f b7 15 5a 3c 42 00 	movzx  edx,WORD PTR ds:0x423c5a
 10057c5:	0f b7 ca             	movzx  ecx,dx
 10057c8:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 10057ce:	01 ca                	add    edx,ecx
 10057d0:	83 ec 04             	sub    esp,0x4
 10057d3:	50                   	push   eax
 10057d4:	52                   	push   edx
 10057d5:	68 60 3c 42 00       	push   0x423c60
 10057da:	e8 e2 fb ff ff       	call   10053c1 <read_sec>
 10057df:	83 c4 10             	add    esp,0x10
 10057e2:	c7 45 f0 60 3c 42 00 	mov    DWORD PTR [ebp-0x10],0x423c60
 10057e9:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 10057f0:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10057f4:	eb 41                	jmp    1005837 <read_file_byname+0xe3>
 10057f6:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 10057fa:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 10057ff:	77 36                	ja     1005837 <read_file_byname+0xe3>
 1005801:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005805:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 100580c:	00 
 100580d:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005811:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005818:	0f b6 c0             	movzx  eax,al
 100581b:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 100581f:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005825:	01 ca                	add    edx,ecx
 1005827:	83 ec 04             	sub    esp,0x4
 100582a:	50                   	push   eax
 100582b:	52                   	push   edx
 100582c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 100582f:	e8 8d fb ff ff       	call   10053c1 <read_sec>
 1005834:	83 c4 10             	add    esp,0x10
 1005837:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 100583b:	75 0d                	jne    100584a <read_file_byname+0xf6>
 100583d:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005841:	7e 07                	jle    100584a <read_file_byname+0xf6>
 1005843:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005848:	76 ac                	jbe    10057f6 <read_file_byname+0xa2>
 100584a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100584d:	c1 e0 05             	shl    eax,0x5
 1005850:	89 c2                	mov    edx,eax
 1005852:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005855:	01 d0                	add    eax,edx
 1005857:	8b 10                	mov    edx,DWORD PTR [eax]
 1005859:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 100585c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 100585f:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005862:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005865:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005868:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100586b:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 100586e:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005871:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005874:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005877:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 100587a:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 100587d:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005880:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005883:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1005886:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 100588a:	0f b7 c0             	movzx  eax,ax
 100588d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005890:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1005897:	0f b7 d0             	movzx  edx,ax
 100589a:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10058a1:	0f b6 c0             	movzx  eax,al
 10058a4:	0f af c2             	imul   eax,edx
 10058a7:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10058aa:	eb 1d                	jmp    10058c9 <read_file_byname+0x175>
 10058ac:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10058af:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 10058b2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10058b5:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10058bc:	00 
 10058bd:	98                   	cwde   
 10058be:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10058c1:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058c4:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058c7:	7c 0a                	jl     10058d3 <read_file_byname+0x17f>
 10058c9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058cc:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058cf:	7d db                	jge    10058ac <read_file_byname+0x158>
 10058d1:	eb 01                	jmp    10058d4 <read_file_byname+0x180>
 10058d3:	90                   	nop
 10058d4:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10058db:	7e 12                	jle    10058ef <read_file_byname+0x19b>
 10058dd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058e0:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058e3:	7c 0a                	jl     10058ef <read_file_byname+0x19b>
 10058e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10058ea:	e9 1c 01 00 00       	jmp    1005a0b <read_file_byname+0x2b7>
 10058ef:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10058f2:	8d 50 ff             	lea    edx,[eax-0x1]
 10058f5:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 10058f8:	89 c2                	mov    edx,eax
 10058fa:	b8 10 00 00 00       	mov    eax,0x10
 10058ff:	83 e8 01             	sub    eax,0x1
 1005902:	01 d0                	add    eax,edx
 1005904:	b9 10 00 00 00       	mov    ecx,0x10
 1005909:	ba 00 00 00 00       	mov    edx,0x0
 100590e:	f7 f1                	div    ecx
 1005910:	6b c0 10             	imul   eax,eax,0x10
 1005913:	89 c1                	mov    ecx,eax
 1005915:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 100591b:	89 e2                	mov    edx,esp
 100591d:	29 ca                	sub    edx,ecx
 100591f:	39 d4                	cmp    esp,edx
 1005921:	74 10                	je     1005933 <read_file_byname+0x1df>
 1005923:	81 ec 00 10 00 00    	sub    esp,0x1000
 1005929:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1005930:	00 
 1005931:	eb ec                	jmp    100591f <read_file_byname+0x1cb>
 1005933:	89 c2                	mov    edx,eax
 1005935:	81 e2 ff 0f 00 00    	and    edx,0xfff
 100593b:	29 d4                	sub    esp,edx
 100593d:	89 c2                	mov    edx,eax
 100593f:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005945:	85 d2                	test   edx,edx
 1005947:	74 0d                	je     1005956 <read_file_byname+0x202>
 1005949:	25 ff 0f 00 00       	and    eax,0xfff
 100594e:	83 e8 04             	sub    eax,0x4
 1005951:	01 e0                	add    eax,esp
 1005953:	83 08 00             	or     DWORD PTR [eax],0x0
 1005956:	89 e0                	mov    eax,esp
 1005958:	83 c0 00             	add    eax,0x0
 100595b:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 100595e:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005965:	0f b6 c0             	movzx  eax,al
 1005968:	8b 0d 30 71 00 01    	mov    ecx,DWORD PTR ds:0x1007130
 100596e:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1005971:	01 ca                	add    edx,ecx
 1005973:	83 ec 04             	sub    esp,0x4
 1005976:	50                   	push   eax
 1005977:	52                   	push   edx
 1005978:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 100597b:	e8 41 fa ff ff       	call   10053c1 <read_sec>
 1005980:	83 c4 10             	add    esp,0x10
 1005983:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005986:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005989:	89 c2                	mov    edx,eax
 100598b:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 100598e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005991:	01 c8                	add    eax,ecx
 1005993:	83 ec 04             	sub    esp,0x4
 1005996:	52                   	push   edx
 1005997:	50                   	push   eax
 1005998:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100599b:	e8 ab 0f 00 00       	call   100694b <memcpy>
 10059a0:	83 c4 10             	add    esp,0x10
 10059a3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059a6:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10059a9:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10059ac:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059af:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10059b2:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10059b5:	eb 40                	jmp    10059f7 <read_file_byname+0x2a3>
 10059b7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10059ba:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10059c1:	00 
 10059c2:	98                   	cwde   
 10059c3:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10059c6:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10059cd:	0f b6 c0             	movzx  eax,al
 10059d0:	8b 0d 30 71 00 01    	mov    ecx,DWORD PTR ds:0x1007130
 10059d6:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10059d9:	01 ca                	add    edx,ecx
 10059db:	83 ec 04             	sub    esp,0x4
 10059de:	50                   	push   eax
 10059df:	52                   	push   edx
 10059e0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10059e3:	e8 d9 f9 ff ff       	call   10053c1 <read_sec>
 10059e8:	83 c4 10             	add    esp,0x10
 10059eb:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059ee:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10059f1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059f4:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10059f7:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10059fe:	7f 06                	jg     1005a06 <read_file_byname+0x2b2>
 1005a00:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 1005a04:	7f b1                	jg     10059b7 <read_file_byname+0x263>
 1005a06:	b8 00 00 00 00       	mov    eax,0x0
 1005a0b:	89 dc                	mov    esp,ebx
 1005a0d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005a10:	c9                   	leave  
 1005a11:	c3                   	ret    

01005a12 <write_file_byname>:
 1005a12:	55                   	push   ebp
 1005a13:	89 e5                	mov    ebp,esp
 1005a15:	53                   	push   ebx
 1005a16:	83 ec 54             	sub    esp,0x54
 1005a19:	89 e0                	mov    eax,esp
 1005a1b:	89 c3                	mov    ebx,eax
 1005a1d:	83 ec 0c             	sub    esp,0xc
 1005a20:	6a 00                	push   0x0
 1005a22:	e8 09 fc ff ff       	call   1005630 <find>
 1005a27:	83 c4 10             	add    esp,0x10
 1005a2a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005a2d:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1005a31:	74 06                	je     1005a39 <write_file_byname+0x27>
 1005a33:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005a37:	79 0a                	jns    1005a43 <write_file_byname+0x31>
 1005a39:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005a3e:	e9 b2 02 00 00       	jmp    1005cf5 <write_file_byname+0x2e3>
 1005a43:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 1005a4a:	c7 45 f0 40 fc 41 00 	mov    DWORD PTR [ebp-0x10],0x41fc40
 1005a51:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 1005a58:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1005a5f:	66 85 c0             	test   ax,ax
 1005a62:	74 43                	je     1005aa7 <write_file_byname+0x95>
 1005a64:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005a6b:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 1005a72:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005a79:	0f b6 c0             	movzx  eax,al
 1005a7c:	0f b7 15 5a 3c 42 00 	movzx  edx,WORD PTR ds:0x423c5a
 1005a83:	0f b7 ca             	movzx  ecx,dx
 1005a86:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005a8c:	01 ca                	add    edx,ecx
 1005a8e:	83 ec 04             	sub    esp,0x4
 1005a91:	50                   	push   eax
 1005a92:	52                   	push   edx
 1005a93:	68 60 3c 42 00       	push   0x423c60
 1005a98:	e8 24 f9 ff ff       	call   10053c1 <read_sec>
 1005a9d:	83 c4 10             	add    esp,0x10
 1005aa0:	c7 45 f0 60 3c 42 00 	mov    DWORD PTR [ebp-0x10],0x423c60
 1005aa7:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1005aae:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005ab2:	eb 41                	jmp    1005af5 <write_file_byname+0xe3>
 1005ab4:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 1005ab8:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005abd:	77 36                	ja     1005af5 <write_file_byname+0xe3>
 1005abf:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005ac3:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005aca:	00 
 1005acb:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005acf:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005ad6:	0f b6 c0             	movzx  eax,al
 1005ad9:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005add:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005ae3:	01 ca                	add    edx,ecx
 1005ae5:	83 ec 04             	sub    esp,0x4
 1005ae8:	50                   	push   eax
 1005ae9:	52                   	push   edx
 1005aea:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005aed:	e8 cf f8 ff ff       	call   10053c1 <read_sec>
 1005af2:	83 c4 10             	add    esp,0x10
 1005af5:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1005af9:	75 0d                	jne    1005b08 <write_file_byname+0xf6>
 1005afb:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005aff:	7e 07                	jle    1005b08 <write_file_byname+0xf6>
 1005b01:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005b06:	76 ac                	jbe    1005ab4 <write_file_byname+0xa2>
 1005b08:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005b0b:	c1 e0 05             	shl    eax,0x5
 1005b0e:	89 c2                	mov    edx,eax
 1005b10:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005b13:	01 d0                	add    eax,edx
 1005b15:	8b 10                	mov    edx,DWORD PTR [eax]
 1005b17:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005b1a:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005b1d:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005b20:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005b23:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005b26:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005b29:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005b2c:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005b2f:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005b32:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005b35:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 1005b38:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005b3b:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005b3e:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005b41:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1005b44:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 1005b48:	0f b7 c0             	movzx  eax,ax
 1005b4b:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005b4e:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1005b55:	0f b7 d0             	movzx  edx,ax
 1005b58:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 1005b5f:	0f b6 c0             	movzx  eax,al
 1005b62:	0f af c2             	imul   eax,edx
 1005b65:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1005b68:	eb 1d                	jmp    1005b87 <write_file_byname+0x175>
 1005b6a:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005b6d:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 1005b70:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005b73:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005b76:	7c 19                	jl     1005b91 <write_file_byname+0x17f>
 1005b78:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005b7b:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005b82:	00 
 1005b83:	98                   	cwde   
 1005b84:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005b87:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005b8a:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005b8d:	7d db                	jge    1005b6a <write_file_byname+0x158>
 1005b8f:	eb 01                	jmp    1005b92 <write_file_byname+0x180>
 1005b91:	90                   	nop
 1005b92:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 1005b99:	7e 12                	jle    1005bad <write_file_byname+0x19b>
 1005b9b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005b9e:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005ba1:	7c 0a                	jl     1005bad <write_file_byname+0x19b>
 1005ba3:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005ba8:	e9 48 01 00 00       	jmp    1005cf5 <write_file_byname+0x2e3>
 1005bad:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005bb0:	8d 50 ff             	lea    edx,[eax-0x1]
 1005bb3:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005bb6:	89 c2                	mov    edx,eax
 1005bb8:	b8 10 00 00 00       	mov    eax,0x10
 1005bbd:	83 e8 01             	sub    eax,0x1
 1005bc0:	01 d0                	add    eax,edx
 1005bc2:	b9 10 00 00 00       	mov    ecx,0x10
 1005bc7:	ba 00 00 00 00       	mov    edx,0x0
 1005bcc:	f7 f1                	div    ecx
 1005bce:	6b c0 10             	imul   eax,eax,0x10
 1005bd1:	89 c1                	mov    ecx,eax
 1005bd3:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1005bd9:	89 e2                	mov    edx,esp
 1005bdb:	29 ca                	sub    edx,ecx
 1005bdd:	39 d4                	cmp    esp,edx
 1005bdf:	74 10                	je     1005bf1 <write_file_byname+0x1df>
 1005be1:	81 ec 00 10 00 00    	sub    esp,0x1000
 1005be7:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1005bee:	00 
 1005bef:	eb ec                	jmp    1005bdd <write_file_byname+0x1cb>
 1005bf1:	89 c2                	mov    edx,eax
 1005bf3:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005bf9:	29 d4                	sub    esp,edx
 1005bfb:	89 c2                	mov    edx,eax
 1005bfd:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005c03:	85 d2                	test   edx,edx
 1005c05:	74 0d                	je     1005c14 <write_file_byname+0x202>
 1005c07:	25 ff 0f 00 00       	and    eax,0xfff
 1005c0c:	83 e8 04             	sub    eax,0x4
 1005c0f:	01 e0                	add    eax,esp
 1005c11:	83 08 00             	or     DWORD PTR [eax],0x0
 1005c14:	89 e0                	mov    eax,esp
 1005c16:	83 c0 00             	add    eax,0x0
 1005c19:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005c1c:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005c20:	0f 8e 81 00 00 00    	jle    1005ca7 <write_file_byname+0x295>
 1005c26:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005c29:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005c2c:	89 c2                	mov    edx,eax
 1005c2e:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 1005c31:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005c34:	01 c8                	add    eax,ecx
 1005c36:	83 ec 04             	sub    esp,0x4
 1005c39:	52                   	push   edx
 1005c3a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005c3d:	50                   	push   eax
 1005c3e:	e8 08 0d 00 00       	call   100694b <memcpy>
 1005c43:	83 c4 10             	add    esp,0x10
 1005c46:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005c49:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005c4c:	83 ec 04             	sub    esp,0x4
 1005c4f:	50                   	push   eax
 1005c50:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005c53:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005c56:	e8 07 f1 ff ff       	call   1004d62 <write_sec>
 1005c5b:	83 c4 10             	add    esp,0x10
 1005c5e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005c61:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005c68:	00 
 1005c69:	98                   	cwde   
 1005c6a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005c6d:	eb 38                	jmp    1005ca7 <write_file_byname+0x295>
 1005c6f:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005c75:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005c78:	01 d0                	add    eax,edx
 1005c7a:	83 ec 04             	sub    esp,0x4
 1005c7d:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 1005c80:	50                   	push   eax
 1005c81:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005c84:	e8 d9 f0 ff ff       	call   1004d62 <write_sec>
 1005c89:	83 c4 10             	add    esp,0x10
 1005c8c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005c8f:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 1005c92:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005c95:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 1005c98:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005c9b:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1005ca2:	00 
 1005ca3:	98                   	cwde   
 1005ca4:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005ca7:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 1005cae:	7f 08                	jg     1005cb8 <write_file_byname+0x2a6>
 1005cb0:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1005cb3:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005cb6:	7d b7                	jge    1005c6f <write_file_byname+0x25d>
 1005cb8:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 1005cbc:	7e 32                	jle    1005cf0 <write_file_byname+0x2de>
 1005cbe:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1005cc1:	83 ec 04             	sub    esp,0x4
 1005cc4:	50                   	push   eax
 1005cc5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005cc8:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005ccb:	e8 7b 0c 00 00       	call   100694b <memcpy>
 1005cd0:	83 c4 10             	add    esp,0x10
 1005cd3:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 1005cd9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005cdc:	01 d0                	add    eax,edx
 1005cde:	83 ec 04             	sub    esp,0x4
 1005ce1:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 1005ce4:	50                   	push   eax
 1005ce5:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005ce8:	e8 75 f0 ff ff       	call   1004d62 <write_sec>
 1005ced:	83 c4 10             	add    esp,0x10
 1005cf0:	b8 00 00 00 00       	mov    eax,0x0
 1005cf5:	89 dc                	mov    esp,ebx
 1005cf7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005cfa:	c9                   	leave  
 1005cfb:	c3                   	ret    

01005cfc <file_exist>:
 1005cfc:	55                   	push   ebp
 1005cfd:	89 e5                	mov    ebp,esp
 1005cff:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 1005d03:	3c e5                	cmp    al,0xe5
 1005d05:	74 08                	je     1005d0f <file_exist+0x13>
 1005d07:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 1005d0b:	84 c0                	test   al,al
 1005d0d:	75 07                	jne    1005d16 <file_exist+0x1a>
 1005d0f:	b8 00 00 00 00       	mov    eax,0x0
 1005d14:	eb 05                	jmp    1005d1b <file_exist+0x1f>
 1005d16:	b8 01 00 00 00       	mov    eax,0x1
 1005d1b:	5d                   	pop    ebp
 1005d1c:	c3                   	ret    

01005d1d <get_entry>:
 1005d1d:	55                   	push   ebp
 1005d1e:	89 e5                	mov    ebp,esp
 1005d20:	57                   	push   edi
 1005d21:	56                   	push   esi
 1005d22:	81 ec b0 00 00 00    	sub    esp,0xb0
 1005d28:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d2b:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1005d2e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005d31:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d34:	8b 40 7c             	mov    eax,DWORD PTR [eax+0x7c]
 1005d37:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005d3a:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
 1005d3e:	c6 45 ac e5          	mov    BYTE PTR [ebp-0x54],0xe5
 1005d42:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005d45:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005d48:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 1005d4f:	e9 50 01 00 00       	jmp    1005ea4 <get_entry+0x187>
 1005d54:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005d57:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005d5a:	3c 2f                	cmp    al,0x2f
 1005d5c:	0f 85 3e 01 00 00    	jne    1005ea0 <get_entry+0x183>
 1005d62:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005d65:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1005d68:	83 f8 0b             	cmp    eax,0xb
 1005d6b:	7e 0a                	jle    1005d77 <get_entry+0x5a>
 1005d6d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005d72:	e9 20 02 00 00       	jmp    1005f97 <get_entry+0x27a>
 1005d77:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005d7a:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1005d7d:	83 ec 04             	sub    esp,0x4
 1005d80:	50                   	push   eax
 1005d81:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005d84:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
 1005d8a:	50                   	push   eax
 1005d8b:	e8 bb 0b 00 00       	call   100694b <memcpy>
 1005d90:	83 c4 10             	add    esp,0x10
 1005d93:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1005d96:	a3 40 3c 42 00       	mov    ds:0x423c40,eax
 1005d9b:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1005d9e:	a3 44 3c 42 00       	mov    ds:0x423c44,eax
 1005da3:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005da6:	a3 48 3c 42 00       	mov    ds:0x423c48,eax
 1005dab:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005dae:	a3 4c 3c 42 00       	mov    ds:0x423c4c,eax
 1005db3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005db6:	a3 50 3c 42 00       	mov    ds:0x423c50,eax
 1005dbb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005dbe:	a3 54 3c 42 00       	mov    ds:0x423c54,eax
 1005dc3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005dc6:	a3 58 3c 42 00       	mov    ds:0x423c58,eax
 1005dcb:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1005dce:	a3 5c 3c 42 00       	mov    ds:0x423c5c,eax
 1005dd3:	83 ec 0c             	sub    esp,0xc
 1005dd6:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
 1005ddc:	50                   	push   eax
 1005ddd:	e8 5e ee ff ff       	call   1004c40 <format_name>
 1005de2:	83 c4 10             	add    esp,0x10
 1005de5:	83 ec 0c             	sub    esp,0xc
 1005de8:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
 1005dee:	50                   	push   eax
 1005def:	e8 3c f8 ff ff       	call   1005630 <find>
 1005df4:	83 c4 10             	add    esp,0x10
 1005df7:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005dfa:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005dfe:	75 0a                	jne    1005e0a <get_entry+0xed>
 1005e00:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005e05:	e9 8d 01 00 00       	jmp    1005f97 <get_entry+0x27a>
 1005e0a:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1005e11:	66 85 c0             	test   ax,ax
 1005e14:	75 3c                	jne    1005e52 <get_entry+0x135>
 1005e16:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e19:	c1 e0 05             	shl    eax,0x5
 1005e1c:	05 40 fc 41 00       	add    eax,0x41fc40
 1005e21:	8b 10                	mov    edx,DWORD PTR [eax]
 1005e23:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005e26:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005e29:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005e2c:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005e2f:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005e32:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005e35:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005e38:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005e3b:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005e3e:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005e41:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005e44:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005e47:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005e4a:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005e4d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005e50:	eb 45                	jmp    1005e97 <get_entry+0x17a>
 1005e52:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e55:	99                   	cdq    
 1005e56:	c1 ea 1c             	shr    edx,0x1c
 1005e59:	01 d0                	add    eax,edx
 1005e5b:	83 e0 0f             	and    eax,0xf
 1005e5e:	29 d0                	sub    eax,edx
 1005e60:	c1 e0 05             	shl    eax,0x5
 1005e63:	05 60 3c 42 00       	add    eax,0x423c60
 1005e68:	8b 10                	mov    edx,DWORD PTR [eax]
 1005e6a:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005e6d:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005e70:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005e73:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005e76:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005e79:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005e7c:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005e7f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005e82:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005e85:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005e88:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005e8b:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005e8e:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005e91:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005e94:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005e97:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005e9a:	83 c0 01             	add    eax,0x1
 1005e9d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005ea0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1005ea4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005ea7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005eaa:	84 c0                	test   al,al
 1005eac:	0f 85 a2 fe ff ff    	jne    1005d54 <get_entry+0x37>
 1005eb2:	83 ec 0c             	sub    esp,0xc
 1005eb5:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005eb8:	e8 83 ed ff ff       	call   1004c40 <format_name>
 1005ebd:	83 c4 10             	add    esp,0x10
 1005ec0:	83 ec 0c             	sub    esp,0xc
 1005ec3:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005ec6:	e8 65 f7 ff ff       	call   1005630 <find>
 1005ecb:	83 c4 10             	add    esp,0x10
 1005ece:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005ed1:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005ed5:	75 0a                	jne    1005ee1 <get_entry+0x1c4>
 1005ed7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005edc:	e9 b6 00 00 00       	jmp    1005f97 <get_entry+0x27a>
 1005ee1:	0f b7 05 5a 3c 42 00 	movzx  eax,WORD PTR ds:0x423c5a
 1005ee8:	66 85 c0             	test   ax,ax
 1005eeb:	75 3c                	jne    1005f29 <get_entry+0x20c>
 1005eed:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005ef0:	c1 e0 05             	shl    eax,0x5
 1005ef3:	05 40 fc 41 00       	add    eax,0x41fc40
 1005ef8:	8b 10                	mov    edx,DWORD PTR [eax]
 1005efa:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005efd:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005f00:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005f03:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005f06:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005f09:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005f0c:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005f0f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005f12:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005f15:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005f18:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005f1b:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005f1e:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005f21:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005f24:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005f27:	eb 45                	jmp    1005f6e <get_entry+0x251>
 1005f29:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005f2c:	99                   	cdq    
 1005f2d:	c1 ea 1c             	shr    edx,0x1c
 1005f30:	01 d0                	add    eax,edx
 1005f32:	83 e0 0f             	and    eax,0xf
 1005f35:	29 d0                	sub    eax,edx
 1005f37:	c1 e0 05             	shl    eax,0x5
 1005f3a:	05 60 3c 42 00       	add    eax,0x423c60
 1005f3f:	8b 10                	mov    edx,DWORD PTR [eax]
 1005f41:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005f44:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005f47:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005f4a:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005f4d:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005f50:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005f53:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005f56:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005f59:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005f5c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005f5f:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005f62:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005f65:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005f68:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005f6b:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005f6e:	0f b7 45 c6          	movzx  eax,WORD PTR [ebp-0x3a]
 1005f72:	0f b7 c0             	movzx  eax,ax
 1005f75:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 1005f7b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005f7e:	8d 50 24             	lea    edx,[eax+0x24]
 1005f81:	8d 85 60 ff ff ff    	lea    eax,[ebp-0xa0]
 1005f87:	b9 13 00 00 00       	mov    ecx,0x13
 1005f8c:	89 d7                	mov    edi,edx
 1005f8e:	89 c6                	mov    esi,eax
 1005f90:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1005f92:	b8 00 00 00 00       	mov    eax,0x0
 1005f97:	8d 65 f8             	lea    esp,[ebp-0x8]
 1005f9a:	5e                   	pop    esi
 1005f9b:	5f                   	pop    edi
 1005f9c:	5d                   	pop    ebp
 1005f9d:	c3                   	ret    

01005f9e <get_fname>:
 1005f9e:	55                   	push   ebp
 1005f9f:	89 e5                	mov    ebp,esp
 1005fa1:	83 ec 18             	sub    esp,0x18
 1005fa4:	83 ec 08             	sub    esp,0x8
 1005fa7:	6a 2f                	push   0x2f
 1005fa9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1005fac:	e8 91 0a 00 00       	call   1006a42 <strtok>
 1005fb1:	83 c4 10             	add    esp,0x10
 1005fb4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005fb7:	eb 18                	jmp    1005fd1 <get_fname+0x33>
 1005fb9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005fbc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005fbf:	83 ec 08             	sub    esp,0x8
 1005fc2:	6a 2f                	push   0x2f
 1005fc4:	6a 00                	push   0x0
 1005fc6:	e8 77 0a 00 00       	call   1006a42 <strtok>
 1005fcb:	83 c4 10             	add    esp,0x10
 1005fce:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005fd1:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1005fd5:	75 e2                	jne    1005fb9 <get_fname+0x1b>
 1005fd7:	83 ec 08             	sub    esp,0x8
 1005fda:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1005fdd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005fe0:	e8 2e 0a 00 00       	call   1006a13 <strcpy>
 1005fe5:	83 c4 10             	add    esp,0x10
 1005fe8:	90                   	nop
 1005fe9:	c9                   	leave  
 1005fea:	c3                   	ret    

01005feb <read_file>:
 1005feb:	55                   	push   ebp
 1005fec:	89 e5                	mov    ebp,esp
 1005fee:	83 ec 58             	sub    esp,0x58
 1005ff1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005ff4:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1005ff7:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1005ffa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005ffd:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1006000:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006003:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006006:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1006009:	66 89 45 ce          	mov    WORD PTR [ebp-0x32],ax
 100600d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006010:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1006013:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006016:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 100601d:	0f b7 c8             	movzx  ecx,ax
 1006020:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1006023:	99                   	cdq    
 1006024:	f7 f9                	idiv   ecx
 1006026:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1006029:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1006030:	0f b7 c8             	movzx  ecx,ax
 1006033:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1006036:	99                   	cdq    
 1006037:	f7 f9                	idiv   ecx
 1006039:	89 d0                	mov    eax,edx
 100603b:	85 c0                	test   eax,eax
 100603d:	0f 95 c0             	setne  al
 1006040:	0f b6 c0             	movzx  eax,al
 1006043:	01 45 dc             	add    DWORD PTR [ebp-0x24],eax
 1006046:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 100604d:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 1006051:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1006055:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 100605c:	0f b7 c8             	movzx  ecx,ax
 100605f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006062:	99                   	cdq    
 1006063:	f7 f9                	idiv   ecx
 1006065:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1006068:	eb 14                	jmp    100607e <read_file+0x93>
 100606a:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 100606e:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1006075:	00 
 1006076:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100607a:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
 100607e:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1006083:	77 06                	ja     100608b <read_file+0xa0>
 1006085:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1006089:	7f df                	jg     100606a <read_file+0x7f>
 100608b:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 100608f:	7e 0a                	jle    100609b <read_file+0xb0>
 1006091:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1006096:	e9 ca 00 00 00       	jmp    1006165 <read_file+0x17a>
 100609b:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 10060a2:	0f b7 c8             	movzx  ecx,ax
 10060a5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060a8:	99                   	cdq    
 10060a9:	f7 f9                	idiv   ecx
 10060ab:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10060ae:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10060b5:	0f b6 d0             	movzx  edx,al
 10060b8:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 10060bf:	0f b7 c0             	movzx  eax,ax
 10060c2:	0f af c2             	imul   eax,edx
 10060c5:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 10060c8:	e9 86 00 00 00       	jmp    1006153 <read_file+0x168>
 10060cd:	0f b6 05 0d fc 41 00 	movzx  eax,BYTE PTR ds:0x41fc0d
 10060d4:	0f b6 c0             	movzx  eax,al
 10060d7:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 10060db:	8b 15 30 71 00 01    	mov    edx,DWORD PTR ds:0x1007130
 10060e1:	01 ca                	add    edx,ecx
 10060e3:	83 ec 04             	sub    esp,0x4
 10060e6:	50                   	push   eax
 10060e7:	52                   	push   edx
 10060e8:	68 80 7e 42 00       	push   0x427e80
 10060ed:	e8 cf f2 ff ff       	call   10053c1 <read_sec>
 10060f2:	83 c4 10             	add    esp,0x10
 10060f5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10060f8:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 10060fb:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10060fe:	39 c2                	cmp    edx,eax
 1006100:	0f 4e c2             	cmovle eax,edx
 1006103:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1006106:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1006109:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 100610c:	81 c2 80 7e 42 00    	add    edx,0x427e80
 1006112:	83 ec 04             	sub    esp,0x4
 1006115:	50                   	push   eax
 1006116:	52                   	push   edx
 1006117:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 100611a:	e8 2c 08 00 00       	call   100694b <memcpy>
 100611f:	83 c4 10             	add    esp,0x10
 1006122:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1006126:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1006129:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 100612c:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 100612f:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1006133:	7e 07                	jle    100613c <read_file+0x151>
 1006135:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100613c:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1006140:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 1006147:	00 
 1006148:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100614c:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1006151:	77 0e                	ja     1006161 <read_file+0x176>
 1006153:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1006156:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1006159:	0f 8c 6e ff ff ff    	jl     10060cd <read_file+0xe2>
 100615f:	eb 01                	jmp    1006162 <read_file+0x177>
 1006161:	90                   	nop
 1006162:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1006165:	c9                   	leave  
 1006166:	c3                   	ret    

01006167 <write_file>:
 1006167:	55                   	push   ebp
 1006168:	89 e5                	mov    ebp,esp
 100616a:	83 ec 48             	sub    esp,0x48
 100616d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006170:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1006173:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1006176:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006179:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 100617c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100617f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006182:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1006185:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 1006189:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100618c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100618f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006192:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 1006199:	0f b7 c8             	movzx  ecx,ax
 100619c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100619f:	99                   	cdq    
 10061a0:	f7 f9                	idiv   ecx
 10061a2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10061a5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10061a8:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
 10061ae:	85 c0                	test   eax,eax
 10061b0:	0f 48 c2             	cmovs  eax,edx
 10061b3:	c1 f8 09             	sar    eax,0x9
 10061b6:	89 c1                	mov    ecx,eax
 10061b8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10061bb:	99                   	cdq    
 10061bc:	c1 ea 17             	shr    edx,0x17
 10061bf:	01 d0                	add    eax,edx
 10061c1:	25 ff 01 00 00       	and    eax,0x1ff
 10061c6:	29 d0                	sub    eax,edx
 10061c8:	01 c8                	add    eax,ecx
 10061ca:	85 c0                	test   eax,eax
 10061cc:	0f 95 c0             	setne  al
 10061cf:	0f b6 c0             	movzx  eax,al
 10061d2:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10061d5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10061dc:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 10061e0:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10061e4:	eb 14                	jmp    10061fa <write_file+0x93>
 10061e6:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 10061ea:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 10061ee:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 10061f5:	00 
 10061f6:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10061fa:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 10061ff:	77 06                	ja     1006207 <write_file+0xa0>
 1006201:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1006205:	7f df                	jg     10061e6 <write_file+0x7f>
 1006207:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 100620b:	7e 4b                	jle    1006258 <write_file+0xf1>
 100620d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1006212:	eb 52                	jmp    1006266 <write_file+0xff>
 1006214:	0f b7 55 ea          	movzx  edx,WORD PTR [ebp-0x16]
 1006218:	a1 30 71 00 01       	mov    eax,ds:0x1007130
 100621d:	01 d0                	add    eax,edx
 100621f:	83 ec 04             	sub    esp,0x4
 1006222:	6a 01                	push   0x1
 1006224:	50                   	push   eax
 1006225:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1006228:	e8 35 eb ff ff       	call   1004d62 <write_sec>
 100622d:	83 c4 10             	add    esp,0x10
 1006230:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1006234:	0f b7 05 0b fc 41 00 	movzx  eax,WORD PTR ds:0x41fc0b
 100623b:	0f b7 c0             	movzx  eax,ax
 100623e:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 1006241:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1006245:	0f b7 84 00 60 3e 42 	movzx  eax,WORD PTR [eax+eax*1+0x423e60]
 100624c:	00 
 100624d:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1006251:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1006256:	77 0a                	ja     1006262 <write_file+0xfb>
 1006258:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100625b:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 100625e:	7c b4                	jl     1006214 <write_file+0xad>
 1006260:	eb 01                	jmp    1006263 <write_file+0xfc>
 1006262:	90                   	nop
 1006263:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1006266:	c9                   	leave  
 1006267:	c3                   	ret    

01006268 <scrdown>:
 1006268:	55                   	push   ebp
 1006269:	89 e5                	mov    ebp,esp
 100626b:	83 ec 08             	sub    esp,0x8
 100626e:	a1 88 82 42 00       	mov    eax,ds:0x428288
 1006273:	05 a0 00 00 00       	add    eax,0xa0
 1006278:	a3 88 82 42 00       	mov    ds:0x428288,eax
 100627d:	a1 8c 82 42 00       	mov    eax,ds:0x42828c
 1006282:	05 a0 00 00 00       	add    eax,0xa0
 1006287:	a3 8c 82 42 00       	mov    ds:0x42828c,eax
 100628c:	8b 15 88 82 42 00    	mov    edx,DWORD PTR ds:0x428288
 1006292:	a1 84 82 42 00       	mov    eax,ds:0x428284
 1006297:	39 c2                	cmp    edx,eax
 1006299:	72 0a                	jb     10062a5 <scrdown+0x3d>
 100629b:	a1 80 82 42 00       	mov    eax,ds:0x428280
 10062a0:	a3 88 82 42 00       	mov    ds:0x428288,eax
 10062a5:	e8 52 00 00 00       	call   10062fc <set_origin>
 10062aa:	90                   	nop
 10062ab:	c9                   	leave  
 10062ac:	c3                   	ret    

010062ad <scrup>:
 10062ad:	55                   	push   ebp
 10062ae:	89 e5                	mov    ebp,esp
 10062b0:	83 ec 08             	sub    esp,0x8
 10062b3:	a1 8c 82 42 00       	mov    eax,ds:0x42828c
 10062b8:	85 c0                	test   eax,eax
 10062ba:	75 1b                	jne    10062d7 <scrup+0x2a>
 10062bc:	c7 05 8c 82 42 00 00 	mov    DWORD PTR ds:0x42828c,0x0
 10062c3:	00 00 00 
 10062c6:	a1 80 82 42 00       	mov    eax,ds:0x428280
 10062cb:	a3 88 82 42 00       	mov    ds:0x428288,eax
 10062d0:	e8 27 00 00 00       	call   10062fc <set_origin>
 10062d5:	eb 23                	jmp    10062fa <scrup+0x4d>
 10062d7:	a1 88 82 42 00       	mov    eax,ds:0x428288
 10062dc:	2d a0 00 00 00       	sub    eax,0xa0
 10062e1:	a3 88 82 42 00       	mov    ds:0x428288,eax
 10062e6:	a1 8c 82 42 00       	mov    eax,ds:0x42828c
 10062eb:	2d a0 00 00 00       	sub    eax,0xa0
 10062f0:	a3 8c 82 42 00       	mov    ds:0x42828c,eax
 10062f5:	e8 02 00 00 00       	call   10062fc <set_origin>
 10062fa:	c9                   	leave  
 10062fb:	c3                   	ret    

010062fc <set_origin>:
 10062fc:	55                   	push   ebp
 10062fd:	89 e5                	mov    ebp,esp
 10062ff:	83 ec 08             	sub    esp,0x8
 1006302:	fa                   	cli    
 1006303:	a1 9c 82 42 00       	mov    eax,ds:0x42829c
 1006308:	0f b7 c0             	movzx  eax,ax
 100630b:	83 ec 08             	sub    esp,0x8
 100630e:	6a 0c                	push   0xc
 1006310:	50                   	push   eax
 1006311:	e8 aa cf ff ff       	call   10032c0 <outb>
 1006316:	83 c4 10             	add    esp,0x10
 1006319:	a1 8c 82 42 00       	mov    eax,ds:0x42828c
 100631e:	c1 e8 09             	shr    eax,0x9
 1006321:	0f b6 d0             	movzx  edx,al
 1006324:	a1 a0 82 42 00       	mov    eax,ds:0x4282a0
 1006329:	0f b7 c0             	movzx  eax,ax
 100632c:	83 ec 08             	sub    esp,0x8
 100632f:	52                   	push   edx
 1006330:	50                   	push   eax
 1006331:	e8 8a cf ff ff       	call   10032c0 <outb>
 1006336:	83 c4 10             	add    esp,0x10
 1006339:	a1 9c 82 42 00       	mov    eax,ds:0x42829c
 100633e:	0f b7 c0             	movzx  eax,ax
 1006341:	83 ec 08             	sub    esp,0x8
 1006344:	6a 0d                	push   0xd
 1006346:	50                   	push   eax
 1006347:	e8 74 cf ff ff       	call   10032c0 <outb>
 100634c:	83 c4 10             	add    esp,0x10
 100634f:	a1 8c 82 42 00       	mov    eax,ds:0x42828c
 1006354:	d1 e8                	shr    eax,1
 1006356:	0f b6 d0             	movzx  edx,al
 1006359:	a1 a0 82 42 00       	mov    eax,ds:0x4282a0
 100635e:	0f b7 c0             	movzx  eax,ax
 1006361:	83 ec 08             	sub    esp,0x8
 1006364:	52                   	push   edx
 1006365:	50                   	push   eax
 1006366:	e8 55 cf ff ff       	call   10032c0 <outb>
 100636b:	83 c4 10             	add    esp,0x10
 100636e:	fb                   	sti    
 100636f:	90                   	nop
 1006370:	c9                   	leave  
 1006371:	c3                   	ret    

01006372 <init_tty>:
 1006372:	55                   	push   ebp
 1006373:	89 e5                	mov    ebp,esp
 1006375:	83 ec 18             	sub    esp,0x18
 1006378:	83 ec 08             	sub    esp,0x8
 100637b:	68 24 7a 00 01       	push   0x1007a24
 1006380:	68 8c 79 00 01       	push   0x100798c
 1006385:	e8 89 06 00 00       	call   1006a13 <strcpy>
 100638a:	83 c4 10             	add    esp,0x10
 100638d:	83 ec 08             	sub    esp,0x8
 1006390:	68 29 7a 00 01       	push   0x1007a29
 1006395:	68 ec 79 00 01       	push   0x10079ec
 100639a:	e8 74 06 00 00       	call   1006a13 <strcpy>
 100639f:	83 c4 10             	add    esp,0x10
 10063a2:	83 ec 0c             	sub    esp,0xc
 10063a5:	68 20 79 00 01       	push   0x1007920
 10063aa:	e8 1a bb ff ff       	call   1001ec9 <reg_driver>
 10063af:	83 c4 10             	add    esp,0x10
 10063b2:	83 ec 0c             	sub    esp,0xc
 10063b5:	68 80 79 00 01       	push   0x1007980
 10063ba:	e8 9c ba ff ff       	call   1001e5b <reg_device>
 10063bf:	83 c4 10             	add    esp,0x10
 10063c2:	83 ec 0c             	sub    esp,0xc
 10063c5:	68 e0 79 00 01       	push   0x10079e0
 10063ca:	e8 8c ba ff ff       	call   1001e5b <reg_device>
 10063cf:	83 c4 10             	add    esp,0x10
 10063d2:	c7 45 f4 00 00 02 00 	mov    DWORD PTR [ebp-0xc],0x20000
 10063d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10063dc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10063df:	3c 07                	cmp    al,0x7
 10063e1:	75 34                	jne    1006417 <init_tty+0xa5>
 10063e3:	c7 05 90 82 42 00 00 	mov    DWORD PTR ds:0x428290,0x0
 10063ea:	00 00 00 
 10063ed:	c7 05 80 82 42 00 00 	mov    DWORD PTR ds:0x428280,0xb0000
 10063f4:	00 0b 00 
 10063f7:	c7 05 84 82 42 00 ff 	mov    DWORD PTR ds:0x428284,0xb7fff
 10063fe:	7f 0b 00 
 1006401:	c7 05 9c 82 42 00 b4 	mov    DWORD PTR ds:0x42829c,0x3b4
 1006408:	03 00 00 
 100640b:	c7 05 a0 82 42 00 b5 	mov    DWORD PTR ds:0x4282a0,0x3b5
 1006412:	03 00 00 
 1006415:	eb 5c                	jmp    1006473 <init_tty+0x101>
 1006417:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100641a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100641d:	3c 03                	cmp    al,0x3
 100641f:	77 34                	ja     1006455 <init_tty+0xe3>
 1006421:	c7 05 90 82 42 00 01 	mov    DWORD PTR ds:0x428290,0x1
 1006428:	00 00 00 
 100642b:	c7 05 80 82 42 00 00 	mov    DWORD PTR ds:0x428280,0xb8000
 1006432:	80 0b 00 
 1006435:	c7 05 84 82 42 00 ff 	mov    DWORD PTR ds:0x428284,0xbffff
 100643c:	ff 0b 00 
 100643f:	c7 05 9c 82 42 00 d4 	mov    DWORD PTR ds:0x42829c,0x3d4
 1006446:	03 00 00 
 1006449:	c7 05 a0 82 42 00 d5 	mov    DWORD PTR ds:0x4282a0,0x3d5
 1006450:	03 00 00 
 1006453:	eb 1e                	jmp    1006473 <init_tty+0x101>
 1006455:	c7 05 90 82 42 00 02 	mov    DWORD PTR ds:0x428290,0x2
 100645c:	00 00 00 
 100645f:	c7 05 80 82 42 00 00 	mov    DWORD PTR ds:0x428280,0xa0000
 1006466:	00 0a 00 
 1006469:	c7 05 84 82 42 00 ff 	mov    DWORD PTR ds:0x428284,0xaffff
 1006470:	ff 0a 00 
 1006473:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006476:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006479:	3c 01                	cmp    al,0x1
 100647b:	77 0f                	ja     100648c <init_tty+0x11a>
 100647d:	c7 05 98 82 42 00 28 	mov    DWORD PTR ds:0x428298,0x28
 1006484:	00 00 00 
 1006487:	e9 88 00 00 00       	jmp    1006514 <init_tty+0x1a2>
 100648c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100648f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006492:	3c 03                	cmp    al,0x3
 1006494:	76 0a                	jbe    10064a0 <init_tty+0x12e>
 1006496:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006499:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100649c:	3c 07                	cmp    al,0x7
 100649e:	75 0c                	jne    10064ac <init_tty+0x13a>
 10064a0:	c7 05 98 82 42 00 50 	mov    DWORD PTR ds:0x428298,0x50
 10064a7:	00 00 00 
 10064aa:	eb 68                	jmp    1006514 <init_tty+0x1a2>
 10064ac:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064af:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064b2:	3c 05                	cmp    al,0x5
 10064b4:	76 14                	jbe    10064ca <init_tty+0x158>
 10064b6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064b9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064bc:	3c 09                	cmp    al,0x9
 10064be:	74 0a                	je     10064ca <init_tty+0x158>
 10064c0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064c3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064c6:	3c 0d                	cmp    al,0xd
 10064c8:	75 0c                	jne    10064d6 <init_tty+0x164>
 10064ca:	c7 05 98 82 42 00 40 	mov    DWORD PTR ds:0x428298,0x140
 10064d1:	01 00 00 
 10064d4:	eb 3e                	jmp    1006514 <init_tty+0x1a2>
 10064d6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064d9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064dc:	3c 06                	cmp    al,0x6
 10064de:	74 14                	je     10064f4 <init_tty+0x182>
 10064e0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064e3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064e6:	3c 0a                	cmp    al,0xa
 10064e8:	74 0a                	je     10064f4 <init_tty+0x182>
 10064ea:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064ed:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10064f0:	3c 0d                	cmp    al,0xd
 10064f2:	76 0c                	jbe    1006500 <init_tty+0x18e>
 10064f4:	c7 05 98 82 42 00 80 	mov    DWORD PTR ds:0x428298,0x280
 10064fb:	02 00 00 
 10064fe:	eb 14                	jmp    1006514 <init_tty+0x1a2>
 1006500:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006503:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006506:	3c 08                	cmp    al,0x8
 1006508:	75 0a                	jne    1006514 <init_tty+0x1a2>
 100650a:	c7 05 98 82 42 00 a0 	mov    DWORD PTR ds:0x428298,0xa0
 1006511:	00 00 00 
 1006514:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006517:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100651a:	0f b6 c0             	movzx  eax,al
 100651d:	83 f8 14             	cmp    eax,0x14
 1006520:	77 5d                	ja     100657f <init_tty+0x20d>
 1006522:	8b 04 85 30 7a 00 01 	mov    eax,DWORD PTR [eax*4+0x1007a30]
 1006529:	ff e0                	jmp    eax
 100652b:	c7 05 a4 82 42 00 e8 	mov    DWORD PTR ds:0x4282a4,0x3e8
 1006532:	03 00 00 
 1006535:	eb 49                	jmp    1006580 <init_tty+0x20e>
 1006537:	c7 05 a4 82 42 00 d0 	mov    DWORD PTR ds:0x4282a4,0x7d0
 100653e:	07 00 00 
 1006541:	eb 3d                	jmp    1006580 <init_tty+0x20e>
 1006543:	c7 05 a4 82 42 00 00 	mov    DWORD PTR ds:0x4282a4,0xfa00
 100654a:	fa 00 00 
 100654d:	eb 31                	jmp    1006580 <init_tty+0x20e>
 100654f:	c7 05 a4 82 42 00 00 	mov    DWORD PTR ds:0x4282a4,0x1f400
 1006556:	f4 01 00 
 1006559:	eb 25                	jmp    1006580 <init_tty+0x20e>
 100655b:	c7 05 a4 82 42 00 00 	mov    DWORD PTR ds:0x4282a4,0x7d00
 1006562:	7d 00 00 
 1006565:	eb 19                	jmp    1006580 <init_tty+0x20e>
 1006567:	c7 05 a4 82 42 00 00 	mov    DWORD PTR ds:0x4282a4,0x36b00
 100656e:	6b 03 00 
 1006571:	eb 0d                	jmp    1006580 <init_tty+0x20e>
 1006573:	c7 05 a4 82 42 00 00 	mov    DWORD PTR ds:0x4282a4,0x4b000
 100657a:	b0 04 00 
 100657d:	eb 01                	jmp    1006580 <init_tty+0x20e>
 100657f:	90                   	nop
 1006580:	a1 80 82 42 00       	mov    eax,ds:0x428280
 1006585:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 100658a:	c7 05 8c 82 42 00 00 	mov    DWORD PTR ds:0x42828c,0x0
 1006591:	00 00 00 
 1006594:	a1 80 82 42 00       	mov    eax,ds:0x428280
 1006599:	a3 88 82 42 00       	mov    ds:0x428288,eax
 100659e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10065a2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10065a5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065a8:	0f b6 c0             	movzx  eax,al
 10065ab:	a3 94 82 42 00       	mov    ds:0x428294,eax
 10065b0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10065b4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10065b7:	8d 50 01             	lea    edx,[eax+0x1]
 10065ba:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10065bd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065c0:	0f b6 c0             	movzx  eax,al
 10065c3:	a3 b0 82 42 00       	mov    ds:0x4282b0,eax
 10065c8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10065cb:	8d 50 01             	lea    edx,[eax+0x1]
 10065ce:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10065d1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065d4:	0f b6 c0             	movzx  eax,al
 10065d7:	a3 b4 82 42 00       	mov    ds:0x4282b4,eax
 10065dc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10065df:	8d 50 01             	lea    edx,[eax+0x1]
 10065e2:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10065e5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065e8:	0f b6 c0             	movzx  eax,al
 10065eb:	a3 ac 82 42 00       	mov    ds:0x4282ac,eax
 10065f0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10065f3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065f6:	0f b6 c0             	movzx  eax,al
 10065f9:	a3 a8 82 42 00       	mov    ds:0x4282a8,eax
 10065fe:	90                   	nop
 10065ff:	c9                   	leave  
 1006600:	c3                   	ret    

01006601 <seek_tty>:
 1006601:	55                   	push   ebp
 1006602:	89 e5                	mov    ebp,esp
 1006604:	83 ec 10             	sub    esp,0x10
 1006607:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100660a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 100660d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1006610:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006613:	05 00 c0 05 00       	add    eax,0x5c000
 1006618:	01 c0                	add    eax,eax
 100661a:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 100661f:	90                   	nop
 1006620:	c9                   	leave  
 1006621:	c3                   	ret    

01006622 <tell_monitor>:
 1006622:	55                   	push   ebp
 1006623:	89 e5                	mov    ebp,esp
 1006625:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 100662a:	8b 15 80 82 42 00    	mov    edx,DWORD PTR ds:0x428280
 1006630:	29 d0                	sub    eax,edx
 1006632:	89 c2                	mov    edx,eax
 1006634:	c1 ea 1f             	shr    edx,0x1f
 1006637:	01 d0                	add    eax,edx
 1006639:	d1 f8                	sar    eax,1
 100663b:	5d                   	pop    ebp
 100663c:	c3                   	ret    

0100663d <del_ch>:
 100663d:	55                   	push   ebp
 100663e:	89 e5                	mov    ebp,esp
 1006640:	57                   	push   edi
 1006641:	81 ec 94 00 00 00    	sub    esp,0x94
 1006647:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 100664c:	83 e8 02             	sub    eax,0x2
 100664f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006652:	e8 cb ff ff ff       	call   1006622 <tell_monitor>
 1006657:	89 c1                	mov    ecx,eax
 1006659:	ba 67 66 66 66       	mov    edx,0x66666667
 100665e:	89 c8                	mov    eax,ecx
 1006660:	f7 ea                	imul   edx
 1006662:	89 d0                	mov    eax,edx
 1006664:	c1 f8 05             	sar    eax,0x5
 1006667:	89 ca                	mov    edx,ecx
 1006669:	c1 fa 1f             	sar    edx,0x1f
 100666c:	29 d0                	sub    eax,edx
 100666e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006671:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1006674:	89 d0                	mov    eax,edx
 1006676:	c1 e0 02             	shl    eax,0x2
 1006679:	01 d0                	add    eax,edx
 100667b:	c1 e0 04             	shl    eax,0x4
 100667e:	29 c1                	sub    ecx,eax
 1006680:	89 ca                	mov    edx,ecx
 1006682:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 1006685:	eb 14                	jmp    100669b <del_ch+0x5e>
 1006687:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100668a:	0f b6 50 02          	movzx  edx,BYTE PTR [eax+0x2]
 100668e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006691:	88 10                	mov    BYTE PTR [eax],dl
 1006693:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 1006697:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 100669b:	83 7d f0 4e          	cmp    DWORD PTR [ebp-0x10],0x4e
 100669f:	7e e6                	jle    1006687 <del_ch+0x4a>
 10066a1:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
 10066a7:	b8 00 00 00 00       	mov    eax,0x0
 10066ac:	b9 22 00 00 00       	mov    ecx,0x22
 10066b1:	89 d7                	mov    edi,edx
 10066b3:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10066b5:	e8 68 ff ff ff       	call   1006622 <tell_monitor>
 10066ba:	83 e8 01             	sub    eax,0x1
 10066bd:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 10066c3:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
 10066c9:	50                   	push   eax
 10066ca:	e8 32 ff ff ff       	call   1006601 <seek_tty>
 10066cf:	83 c4 04             	add    esp,0x4
 10066d2:	e8 06 00 00 00       	call   10066dd <set_cur>
 10066d7:	90                   	nop
 10066d8:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 10066db:	c9                   	leave  
 10066dc:	c3                   	ret    

010066dd <set_cur>:
 10066dd:	55                   	push   ebp
 10066de:	89 e5                	mov    ebp,esp
 10066e0:	83 ec 08             	sub    esp,0x8
 10066e3:	fa                   	cli    
 10066e4:	a1 9c 82 42 00       	mov    eax,ds:0x42829c
 10066e9:	0f b7 c0             	movzx  eax,ax
 10066ec:	83 ec 08             	sub    esp,0x8
 10066ef:	6a 0e                	push   0xe
 10066f1:	50                   	push   eax
 10066f2:	e8 c9 cb ff ff       	call   10032c0 <outb>
 10066f7:	83 c4 10             	add    esp,0x10
 10066fa:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 10066ff:	8b 15 80 82 42 00    	mov    edx,DWORD PTR ds:0x428280
 1006705:	29 d0                	sub    eax,edx
 1006707:	c1 f8 09             	sar    eax,0x9
 100670a:	0f b6 d0             	movzx  edx,al
 100670d:	a1 a0 82 42 00       	mov    eax,ds:0x4282a0
 1006712:	0f b7 c0             	movzx  eax,ax
 1006715:	83 ec 08             	sub    esp,0x8
 1006718:	52                   	push   edx
 1006719:	50                   	push   eax
 100671a:	e8 a1 cb ff ff       	call   10032c0 <outb>
 100671f:	83 c4 10             	add    esp,0x10
 1006722:	a1 9c 82 42 00       	mov    eax,ds:0x42829c
 1006727:	0f b7 c0             	movzx  eax,ax
 100672a:	83 ec 08             	sub    esp,0x8
 100672d:	6a 0f                	push   0xf
 100672f:	50                   	push   eax
 1006730:	e8 8b cb ff ff       	call   10032c0 <outb>
 1006735:	83 c4 10             	add    esp,0x10
 1006738:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 100673d:	8b 15 80 82 42 00    	mov    edx,DWORD PTR ds:0x428280
 1006743:	29 d0                	sub    eax,edx
 1006745:	d1 f8                	sar    eax,1
 1006747:	0f b6 d0             	movzx  edx,al
 100674a:	a1 a0 82 42 00       	mov    eax,ds:0x4282a0
 100674f:	0f b7 c0             	movzx  eax,ax
 1006752:	83 ec 08             	sub    esp,0x8
 1006755:	52                   	push   edx
 1006756:	50                   	push   eax
 1006757:	e8 64 cb ff ff       	call   10032c0 <outb>
 100675c:	83 c4 10             	add    esp,0x10
 100675f:	fb                   	sti    
 1006760:	90                   	nop
 1006761:	c9                   	leave  
 1006762:	c3                   	ret    

01006763 <read_tty>:
 1006763:	55                   	push   ebp
 1006764:	89 e5                	mov    ebp,esp
 1006766:	83 ec 18             	sub    esp,0x18
 1006769:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100676c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100676f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006772:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006775:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1006778:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 100677b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1006782:	eb 3e                	jmp    10067c2 <read_tty+0x5f>
 1006784:	8b 15 34 71 00 01    	mov    edx,DWORD PTR ds:0x1007134
 100678a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100678d:	8d 48 01             	lea    ecx,[eax+0x1]
 1006790:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 1006793:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 1006796:	88 10                	mov    BYTE PTR [eax],dl
 1006798:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 100679d:	3d ff ff 0b 00       	cmp    eax,0xbffff
 10067a2:	75 0d                	jne    10067b1 <read_tty+0x4e>
 10067a4:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 10067a8:	7e 07                	jle    10067b1 <read_tty+0x4e>
 10067aa:	b8 01 00 00 00       	mov    eax,0x1
 10067af:	eb 23                	jmp    10067d4 <read_tty+0x71>
 10067b1:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 10067b6:	83 c0 02             	add    eax,0x2
 10067b9:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 10067be:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10067c2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10067c5:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10067c8:	7c ba                	jl     1006784 <read_tty+0x21>
 10067ca:	e8 0e ff ff ff       	call   10066dd <set_cur>
 10067cf:	b8 00 00 00 00       	mov    eax,0x0
 10067d4:	c9                   	leave  
 10067d5:	c3                   	ret    

010067d6 <write_tty>:
 10067d6:	55                   	push   ebp
 10067d7:	89 e5                	mov    ebp,esp
 10067d9:	83 ec 18             	sub    esp,0x18
 10067dc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10067df:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10067e2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10067e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10067e8:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 10067eb:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10067ee:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10067f5:	e9 df 00 00 00       	jmp    10068d9 <write_tty+0x103>
 10067fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10067fd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006800:	3c 0a                	cmp    al,0xa
 1006802:	75 42                	jne    1006846 <write_tty+0x70>
 1006804:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 1006809:	2d 00 80 0b 00       	sub    eax,0xb8000
 100680e:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006811:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006814:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1006819:	f7 e2                	mul    edx
 100681b:	89 d0                	mov    eax,edx
 100681d:	c1 e8 07             	shr    eax,0x7
 1006820:	8d 50 01             	lea    edx,[eax+0x1]
 1006823:	89 d0                	mov    eax,edx
 1006825:	c1 e0 02             	shl    eax,0x2
 1006828:	01 d0                	add    eax,edx
 100682a:	c1 e0 05             	shl    eax,0x5
 100682d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006830:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006833:	05 00 80 0b 00       	add    eax,0xb8000
 1006838:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 100683d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006841:	e9 8f 00 00 00       	jmp    10068d5 <write_tty+0xff>
 1006846:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006849:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100684c:	84 c0                	test   al,al
 100684e:	0f 84 93 00 00 00    	je     10068e7 <write_tty+0x111>
 1006854:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006857:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100685a:	3c 08                	cmp    al,0x8
 100685c:	75 17                	jne    1006875 <write_tty+0x9f>
 100685e:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 1006863:	83 e8 02             	sub    eax,0x2
 1006866:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 100686b:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 1006870:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006873:	eb 33                	jmp    10068a8 <write_tty+0xd2>
 1006875:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1006878:	8d 42 01             	lea    eax,[edx+0x1]
 100687b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100687e:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 1006883:	8d 48 01             	lea    ecx,[eax+0x1]
 1006886:	89 0d 34 71 00 01    	mov    DWORD PTR ds:0x1007134,ecx
 100688c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 100688f:	88 10                	mov    BYTE PTR [eax],dl
 1006891:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 1006896:	8d 50 01             	lea    edx,[eax+0x1]
 1006899:	89 15 34 71 00 01    	mov    DWORD PTR ds:0x1007134,edx
 100689f:	0f b6 15 38 71 00 01 	movzx  edx,BYTE PTR ds:0x1007138
 10068a6:	88 10                	mov    BYTE PTR [eax],dl
 10068a8:	a1 34 71 00 01       	mov    eax,ds:0x1007134
 10068ad:	8b 0d 88 82 42 00    	mov    ecx,DWORD PTR ds:0x428288
 10068b3:	29 c8                	sub    eax,ecx
 10068b5:	89 c2                	mov    edx,eax
 10068b7:	a1 a4 82 42 00       	mov    eax,ds:0x4282a4
 10068bc:	8b 0d 98 82 42 00    	mov    ecx,DWORD PTR ds:0x428298
 10068c2:	29 c8                	sub    eax,ecx
 10068c4:	01 c0                	add    eax,eax
 10068c6:	39 c2                	cmp    edx,eax
 10068c8:	7c 0b                	jl     10068d5 <write_tty+0xff>
 10068ca:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 10068ce:	7e 05                	jle    10068d5 <write_tty+0xff>
 10068d0:	e8 93 f9 ff ff       	call   1006268 <scrdown>
 10068d5:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10068d9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10068dc:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10068df:	0f 8c 15 ff ff ff    	jl     10067fa <write_tty+0x24>
 10068e5:	eb 01                	jmp    10068e8 <write_tty+0x112>
 10068e7:	90                   	nop
 10068e8:	e8 f0 fd ff ff       	call   10066dd <set_cur>
 10068ed:	b8 00 00 00 00       	mov    eax,0x0
 10068f2:	c9                   	leave  
 10068f3:	c3                   	ret    

010068f4 <cls>:
 10068f4:	55                   	push   ebp
 10068f5:	89 e5                	mov    ebp,esp
 10068f7:	83 ec 18             	sub    esp,0x18
 10068fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1006901:	eb 12                	jmp    1006915 <cls+0x21>
 1006903:	8b 15 88 82 42 00    	mov    edx,DWORD PTR ds:0x428288
 1006909:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100690c:	01 d0                	add    eax,edx
 100690e:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006911:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 1006915:	a1 a4 82 42 00       	mov    eax,ds:0x4282a4
 100691a:	01 c0                	add    eax,eax
 100691c:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 100691f:	7c e2                	jl     1006903 <cls+0xf>
 1006921:	a1 88 82 42 00       	mov    eax,ds:0x428288
 1006926:	a3 34 71 00 01       	mov    ds:0x1007134,eax
 100692b:	e8 ad fd ff ff       	call   10066dd <set_cur>
 1006930:	90                   	nop
 1006931:	c9                   	leave  
 1006932:	c3                   	ret    

01006933 <set_color>:
 1006933:	55                   	push   ebp
 1006934:	89 e5                	mov    ebp,esp
 1006936:	83 ec 04             	sub    esp,0x4
 1006939:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100693c:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 100693f:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 1006943:	a2 38 71 00 01       	mov    ds:0x1007138,al
 1006948:	90                   	nop
 1006949:	c9                   	leave  
 100694a:	c3                   	ret    

0100694b <memcpy>:
 100694b:	55                   	push   ebp
 100694c:	89 e5                	mov    ebp,esp
 100694e:	83 ec 10             	sub    esp,0x10
 1006951:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006954:	c6 00 ff             	mov    BYTE PTR [eax],0xff
 1006957:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100695e:	eb 17                	jmp    1006977 <memcpy+0x2c>
 1006960:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006963:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006966:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006969:	88 10                	mov    BYTE PTR [eax],dl
 100696b:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 100696f:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 1006973:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006977:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100697a:	39 45 10             	cmp    DWORD PTR [ebp+0x10],eax
 100697d:	77 e1                	ja     1006960 <memcpy+0x15>
 100697f:	90                   	nop
 1006980:	90                   	nop
 1006981:	c9                   	leave  
 1006982:	c3                   	ret    

01006983 <memcmp>:
 1006983:	55                   	push   ebp
 1006984:	89 e5                	mov    ebp,esp
 1006986:	83 ec 10             	sub    esp,0x10
 1006989:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006990:	eb 34                	jmp    10069c6 <memcmp+0x43>
 1006992:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006995:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006998:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100699b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100699e:	38 c2                	cmp    dl,al
 10069a0:	74 18                	je     10069ba <memcmp+0x37>
 10069a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10069a5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10069a8:	0f b6 d0             	movzx  edx,al
 10069ab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10069ae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10069b1:	0f b6 c8             	movzx  ecx,al
 10069b4:	89 d0                	mov    eax,edx
 10069b6:	29 c8                	sub    eax,ecx
 10069b8:	eb 19                	jmp    10069d3 <memcmp+0x50>
 10069ba:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10069be:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10069c2:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10069c6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10069c9:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 10069cc:	7c c4                	jl     1006992 <memcmp+0xf>
 10069ce:	b8 00 00 00 00       	mov    eax,0x0
 10069d3:	c9                   	leave  
 10069d4:	c3                   	ret    

010069d5 <memset>:
 10069d5:	55                   	push   ebp
 10069d6:	89 e5                	mov    ebp,esp
 10069d8:	83 ec 14             	sub    esp,0x14
 10069db:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10069de:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 10069e1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10069e8:	eb 13                	jmp    10069fd <memset+0x28>
 10069ea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10069ed:	8d 50 01             	lea    edx,[eax+0x1]
 10069f0:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 10069f3:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 10069f7:	88 10                	mov    BYTE PTR [eax],dl
 10069f9:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10069fd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006a00:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1006a03:	72 e5                	jb     10069ea <memset+0x15>
 1006a05:	90                   	nop
 1006a06:	90                   	nop
 1006a07:	c9                   	leave  
 1006a08:	c3                   	ret    

01006a09 <get_mem_size>:
 1006a09:	55                   	push   ebp
 1006a0a:	89 e5                	mov    ebp,esp
 1006a0c:	a1 b8 82 42 00       	mov    eax,ds:0x4282b8
 1006a11:	5d                   	pop    ebp
 1006a12:	c3                   	ret    

01006a13 <strcpy>:
 1006a13:	55                   	push   ebp
 1006a14:	89 e5                	mov    ebp,esp
 1006a16:	eb 17                	jmp    1006a2f <strcpy+0x1c>
 1006a18:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1006a1b:	8d 42 01             	lea    eax,[edx+0x1]
 1006a1e:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006a21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006a24:	8d 48 01             	lea    ecx,[eax+0x1]
 1006a27:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
 1006a2a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 1006a2d:	88 10                	mov    BYTE PTR [eax],dl
 1006a2f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006a32:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a35:	84 c0                	test   al,al
 1006a37:	75 df                	jne    1006a18 <strcpy+0x5>
 1006a39:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006a3c:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006a3f:	90                   	nop
 1006a40:	5d                   	pop    ebp
 1006a41:	c3                   	ret    

01006a42 <strtok>:
 1006a42:	55                   	push   ebp
 1006a43:	89 e5                	mov    ebp,esp
 1006a45:	83 ec 14             	sub    esp,0x14
 1006a48:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006a4b:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1006a4e:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1006a52:	0f 84 8c 00 00 00    	je     1006ae4 <strtok+0xa2>
 1006a58:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a5b:	68 c0 82 42 00       	push   0x4282c0
 1006a60:	e8 ae ff ff ff       	call   1006a13 <strcpy>
 1006a65:	83 c4 08             	add    esp,0x8
 1006a68:	c7 45 f4 c0 82 42 00 	mov    DWORD PTR [ebp-0xc],0x4282c0
 1006a6f:	c7 05 c0 84 42 00 00 	mov    DWORD PTR ds:0x4284c0,0x0
 1006a76:	00 00 00 
 1006a79:	eb 1a                	jmp    1006a95 <strtok+0x53>
 1006a7b:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006a80:	83 c0 01             	add    eax,0x1
 1006a83:	99                   	cdq    
 1006a84:	c1 ea 17             	shr    edx,0x17
 1006a87:	01 d0                	add    eax,edx
 1006a89:	25 ff 01 00 00       	and    eax,0x1ff
 1006a8e:	29 d0                	sub    eax,edx
 1006a90:	a3 c0 84 42 00       	mov    ds:0x4284c0,eax
 1006a95:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006a9a:	0f b6 80 c0 82 42 00 	movzx  eax,BYTE PTR [eax+0x4282c0]
 1006aa1:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 1006aa4:	74 10                	je     1006ab6 <strtok+0x74>
 1006aa6:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006aab:	0f b6 80 c0 82 42 00 	movzx  eax,BYTE PTR [eax+0x4282c0]
 1006ab2:	84 c0                	test   al,al
 1006ab4:	75 c5                	jne    1006a7b <strtok+0x39>
 1006ab6:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006abb:	c6 80 c0 82 42 00 00 	mov    BYTE PTR [eax+0x4282c0],0x0
 1006ac2:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006ac7:	83 c0 01             	add    eax,0x1
 1006aca:	99                   	cdq    
 1006acb:	c1 ea 17             	shr    edx,0x17
 1006ace:	01 d0                	add    eax,edx
 1006ad0:	25 ff 01 00 00       	and    eax,0x1ff
 1006ad5:	29 d0                	sub    eax,edx
 1006ad7:	a3 c0 84 42 00       	mov    ds:0x4284c0,eax
 1006adc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006adf:	e9 8b 00 00 00       	jmp    1006b6f <strtok+0x12d>
 1006ae4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006aeb:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006af0:	05 c0 82 42 00       	add    eax,0x4282c0
 1006af5:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1006af8:	eb 1e                	jmp    1006b18 <strtok+0xd6>
 1006afa:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006aff:	83 c0 01             	add    eax,0x1
 1006b02:	99                   	cdq    
 1006b03:	c1 ea 17             	shr    edx,0x17
 1006b06:	01 d0                	add    eax,edx
 1006b08:	25 ff 01 00 00       	and    eax,0x1ff
 1006b0d:	29 d0                	sub    eax,edx
 1006b0f:	a3 c0 84 42 00       	mov    ds:0x4284c0,eax
 1006b14:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006b18:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006b1d:	0f b6 80 c0 82 42 00 	movzx  eax,BYTE PTR [eax+0x4282c0]
 1006b24:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 1006b27:	74 10                	je     1006b39 <strtok+0xf7>
 1006b29:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006b2e:	0f b6 80 c0 82 42 00 	movzx  eax,BYTE PTR [eax+0x4282c0]
 1006b35:	84 c0                	test   al,al
 1006b37:	75 c1                	jne    1006afa <strtok+0xb8>
 1006b39:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006b3e:	c6 80 c0 82 42 00 00 	mov    BYTE PTR [eax+0x4282c0],0x0
 1006b45:	a1 c0 84 42 00       	mov    eax,ds:0x4284c0
 1006b4a:	83 c0 01             	add    eax,0x1
 1006b4d:	99                   	cdq    
 1006b4e:	c1 ea 17             	shr    edx,0x17
 1006b51:	01 d0                	add    eax,edx
 1006b53:	25 ff 01 00 00       	and    eax,0x1ff
 1006b58:	29 d0                	sub    eax,edx
 1006b5a:	a3 c0 84 42 00       	mov    ds:0x4284c0,eax
 1006b5f:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006b63:	74 05                	je     1006b6a <strtok+0x128>
 1006b65:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006b68:	eb 05                	jmp    1006b6f <strtok+0x12d>
 1006b6a:	b8 00 00 00 00       	mov    eax,0x0
 1006b6f:	c9                   	leave  
 1006b70:	c3                   	ret    

01006b71 <strcmp>:
 1006b71:	55                   	push   ebp
 1006b72:	89 e5                	mov    ebp,esp
 1006b74:	eb 36                	jmp    1006bac <strcmp+0x3b>
 1006b76:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006b79:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006b7c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006b7f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006b82:	38 c2                	cmp    dl,al
 1006b84:	7e 07                	jle    1006b8d <strcmp+0x1c>
 1006b86:	b8 01 00 00 00       	mov    eax,0x1
 1006b8b:	eb 4a                	jmp    1006bd7 <strcmp+0x66>
 1006b8d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006b90:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006b93:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006b96:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006b99:	38 c2                	cmp    dl,al
 1006b9b:	7d 07                	jge    1006ba4 <strcmp+0x33>
 1006b9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1006ba2:	eb 33                	jmp    1006bd7 <strcmp+0x66>
 1006ba4:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006ba8:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 1006bac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006baf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bb2:	84 c0                	test   al,al
 1006bb4:	74 0a                	je     1006bc0 <strcmp+0x4f>
 1006bb6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006bb9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bbc:	84 c0                	test   al,al
 1006bbe:	75 b6                	jne    1006b76 <strcmp+0x5>
 1006bc0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006bc3:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006bc6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006bc9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bcc:	38 c2                	cmp    dl,al
 1006bce:	75 07                	jne    1006bd7 <strcmp+0x66>
 1006bd0:	b8 00 00 00 00       	mov    eax,0x0
 1006bd5:	eb 00                	jmp    1006bd7 <strcmp+0x66>
 1006bd7:	5d                   	pop    ebp
 1006bd8:	c3                   	ret    

01006bd9 <strlen>:
 1006bd9:	55                   	push   ebp
 1006bda:	89 e5                	mov    ebp,esp
 1006bdc:	83 ec 10             	sub    esp,0x10
 1006bdf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006be6:	eb 08                	jmp    1006bf0 <strlen+0x17>
 1006be8:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006bec:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006bf0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006bf3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bf6:	84 c0                	test   al,al
 1006bf8:	75 ee                	jne    1006be8 <strlen+0xf>
 1006bfa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006bfd:	c9                   	leave  
 1006bfe:	c3                   	ret    

01006bff <sprintf>:
 1006bff:	55                   	push   ebp
 1006c00:	89 e5                	mov    ebp,esp
 1006c02:	83 ec 28             	sub    esp,0x28
 1006c05:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006c08:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006c0b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006c0e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006c11:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1006c18:	eb 22                	jmp    1006c3c <sprintf+0x3d>
 1006c1a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c1d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c20:	3c 25                	cmp    al,0x25
 1006c22:	75 0e                	jne    1006c32 <sprintf+0x33>
 1006c24:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1006c27:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c2a:	3c 25                	cmp    al,0x25
 1006c2c:	74 04                	je     1006c32 <sprintf+0x33>
 1006c2e:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1006c32:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c35:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006c38:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006c3c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c3f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c42:	3c 0a                	cmp    al,0xa
 1006c44:	75 d4                	jne    1006c1a <sprintf+0x1b>
 1006c46:	8d 45 10             	lea    eax,[ebp+0x10]
 1006c49:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1006c4c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006c4f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006c52:	e9 eb 00 00 00       	jmp    1006d42 <sprintf+0x143>
 1006c57:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c5a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c5d:	3c 25                	cmp    al,0x25
 1006c5f:	0f 85 c1 00 00 00    	jne    1006d26 <sprintf+0x127>
 1006c65:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c68:	83 c0 01             	add    eax,0x1
 1006c6b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c6e:	84 c0                	test   al,al
 1006c70:	0f 84 b0 00 00 00    	je     1006d26 <sprintf+0x127>
 1006c76:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006c7a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006c7d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006c80:	3c 78                	cmp    al,0x78
 1006c82:	75 25                	jne    1006ca9 <sprintf+0xaa>
 1006c84:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1006c87:	8d 50 04             	lea    edx,[eax+0x4]
 1006c8a:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1006c8d:	8b 00                	mov    eax,DWORD PTR [eax]
 1006c8f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1006c92:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1006c95:	83 ec 08             	sub    esp,0x8
 1006c98:	50                   	push   eax
 1006c99:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006c9c:	e8 87 01 00 00       	call   1006e28 <sprint_hex>
 1006ca1:	83 c4 10             	add    esp,0x10
 1006ca4:	e9 95 00 00 00       	jmp    1006d3e <sprintf+0x13f>
 1006ca9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006cac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006caf:	3c 73                	cmp    al,0x73
 1006cb1:	75 21                	jne    1006cd4 <sprintf+0xd5>
 1006cb3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1006cb6:	8d 50 04             	lea    edx,[eax+0x4]
 1006cb9:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1006cbc:	8b 00                	mov    eax,DWORD PTR [eax]
 1006cbe:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1006cc1:	83 ec 08             	sub    esp,0x8
 1006cc4:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1006cc7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006cca:	e8 cb 01 00 00       	call   1006e9a <sprintn>
 1006ccf:	83 c4 10             	add    esp,0x10
 1006cd2:	eb 6a                	jmp    1006d3e <sprintf+0x13f>
 1006cd4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006cd7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006cda:	3c 64                	cmp    al,0x64
 1006cdc:	75 22                	jne    1006d00 <sprintf+0x101>
 1006cde:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1006ce1:	8d 50 04             	lea    edx,[eax+0x4]
 1006ce4:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1006ce7:	8b 00                	mov    eax,DWORD PTR [eax]
 1006ce9:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006cec:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006cef:	83 ec 08             	sub    esp,0x8
 1006cf2:	50                   	push   eax
 1006cf3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006cf6:	e8 8d 00 00 00       	call   1006d88 <sprint_decimal>
 1006cfb:	83 c4 10             	add    esp,0x10
 1006cfe:	eb 3e                	jmp    1006d3e <sprintf+0x13f>
 1006d00:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006d03:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006d06:	3c 63                	cmp    al,0x63
 1006d08:	75 02                	jne    1006d0c <sprintf+0x10d>
 1006d0a:	0f 0b                	ud2    
 1006d0c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006d0f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006d12:	0f be c0             	movsx  eax,al
 1006d15:	83 ec 08             	sub    esp,0x8
 1006d18:	50                   	push   eax
 1006d19:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006d1c:	e8 33 00 00 00       	call   1006d54 <sprintchar>
 1006d21:	83 c4 10             	add    esp,0x10
 1006d24:	eb 18                	jmp    1006d3e <sprintf+0x13f>
 1006d26:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006d29:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006d2c:	0f be c0             	movsx  eax,al
 1006d2f:	83 ec 08             	sub    esp,0x8
 1006d32:	50                   	push   eax
 1006d33:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006d36:	e8 19 00 00 00       	call   1006d54 <sprintchar>
 1006d3b:	83 c4 10             	add    esp,0x10
 1006d3e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006d42:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006d45:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006d48:	84 c0                	test   al,al
 1006d4a:	0f 85 07 ff ff ff    	jne    1006c57 <sprintf+0x58>
 1006d50:	90                   	nop
 1006d51:	90                   	nop
 1006d52:	c9                   	leave  
 1006d53:	c3                   	ret    

01006d54 <sprintchar>:
 1006d54:	55                   	push   ebp
 1006d55:	89 e5                	mov    ebp,esp
 1006d57:	83 ec 04             	sub    esp,0x4
 1006d5a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006d5d:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1006d60:	eb 04                	jmp    1006d66 <sprintchar+0x12>
 1006d62:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006d66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006d69:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006d6c:	84 c0                	test   al,al
 1006d6e:	75 f2                	jne    1006d62 <sprintchar+0xe>
 1006d70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006d73:	8d 50 01             	lea    edx,[eax+0x1]
 1006d76:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1006d79:	0f b6 55 fc          	movzx  edx,BYTE PTR [ebp-0x4]
 1006d7d:	88 10                	mov    BYTE PTR [eax],dl
 1006d7f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006d82:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006d85:	90                   	nop
 1006d86:	c9                   	leave  
 1006d87:	c3                   	ret    

01006d88 <sprint_decimal>:
 1006d88:	55                   	push   ebp
 1006d89:	89 e5                	mov    ebp,esp
 1006d8b:	53                   	push   ebx
 1006d8c:	83 ec 20             	sub    esp,0x20
 1006d8f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1006d96:	eb 5b                	jmp    1006df3 <sprint_decimal+0x6b>
 1006d98:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006d9b:	ba 67 66 66 66       	mov    edx,0x66666667
 1006da0:	89 c8                	mov    eax,ecx
 1006da2:	f7 ea                	imul   edx
 1006da4:	89 d0                	mov    eax,edx
 1006da6:	c1 f8 02             	sar    eax,0x2
 1006da9:	89 cb                	mov    ebx,ecx
 1006dab:	c1 fb 1f             	sar    ebx,0x1f
 1006dae:	29 d8                	sub    eax,ebx
 1006db0:	89 c2                	mov    edx,eax
 1006db2:	89 d0                	mov    eax,edx
 1006db4:	c1 e0 02             	shl    eax,0x2
 1006db7:	01 d0                	add    eax,edx
 1006db9:	01 c0                	add    eax,eax
 1006dbb:	29 c1                	sub    ecx,eax
 1006dbd:	89 ca                	mov    edx,ecx
 1006dbf:	89 d0                	mov    eax,edx
 1006dc1:	83 c0 30             	add    eax,0x30
 1006dc4:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 1006dc7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006dca:	8d 50 01             	lea    edx,[eax+0x1]
 1006dcd:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 1006dd0:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
 1006dd4:	88 54 05 e1          	mov    BYTE PTR [ebp+eax*1-0x1f],dl
 1006dd8:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006ddb:	ba 67 66 66 66       	mov    edx,0x66666667
 1006de0:	89 c8                	mov    eax,ecx
 1006de2:	f7 ea                	imul   edx
 1006de4:	89 d0                	mov    eax,edx
 1006de6:	c1 f8 02             	sar    eax,0x2
 1006de9:	c1 f9 1f             	sar    ecx,0x1f
 1006dec:	89 ca                	mov    edx,ecx
 1006dee:	29 d0                	sub    eax,edx
 1006df0:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006df3:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006df6:	83 f8 07             	cmp    eax,0x7
 1006df9:	76 9d                	jbe    1006d98 <sprint_decimal+0x10>
 1006dfb:	eb 1e                	jmp    1006e1b <sprint_decimal+0x93>
 1006dfd:	83 6d f8 01          	sub    DWORD PTR [ebp-0x8],0x1
 1006e01:	8d 55 e1             	lea    edx,[ebp-0x1f]
 1006e04:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006e07:	01 d0                	add    eax,edx
 1006e09:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006e0c:	0f be c0             	movsx  eax,al
 1006e0f:	50                   	push   eax
 1006e10:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006e13:	e8 3c ff ff ff       	call   1006d54 <sprintchar>
 1006e18:	83 c4 08             	add    esp,0x8
 1006e1b:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1006e1f:	7f dc                	jg     1006dfd <sprint_decimal+0x75>
 1006e21:	90                   	nop
 1006e22:	90                   	nop
 1006e23:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1006e26:	c9                   	leave  
 1006e27:	c3                   	ret    

01006e28 <sprint_hex>:
 1006e28:	55                   	push   ebp
 1006e29:	89 e5                	mov    ebp,esp
 1006e2b:	83 ec 10             	sub    esp,0x10
 1006e2e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006e35:	eb 33                	jmp    1006e6a <sprint_hex+0x42>
 1006e37:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006e3a:	83 e0 0f             	and    eax,0xf
 1006e3d:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
 1006e40:	80 7d fb 09          	cmp    BYTE PTR [ebp-0x5],0x9
 1006e44:	76 06                	jbe    1006e4c <sprint_hex+0x24>
 1006e46:	80 45 fb 57          	add    BYTE PTR [ebp-0x5],0x57
 1006e4a:	eb 04                	jmp    1006e50 <sprint_hex+0x28>
 1006e4c:	80 45 fb 30          	add    BYTE PTR [ebp-0x5],0x30
 1006e50:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006e53:	8d 50 01             	lea    edx,[eax+0x1]
 1006e56:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1006e59:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
 1006e5d:	88 54 05 f1          	mov    BYTE PTR [ebp+eax*1-0xf],dl
 1006e61:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006e64:	c1 e8 04             	shr    eax,0x4
 1006e67:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006e6a:	83 7d fc 09          	cmp    DWORD PTR [ebp-0x4],0x9
 1006e6e:	7e c7                	jle    1006e37 <sprint_hex+0xf>
 1006e70:	eb 1e                	jmp    1006e90 <sprint_hex+0x68>
 1006e72:	83 6d fc 01          	sub    DWORD PTR [ebp-0x4],0x1
 1006e76:	8d 55 f1             	lea    edx,[ebp-0xf]
 1006e79:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006e7c:	01 d0                	add    eax,edx
 1006e7e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006e81:	0f be c0             	movsx  eax,al
 1006e84:	50                   	push   eax
 1006e85:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006e88:	e8 c7 fe ff ff       	call   1006d54 <sprintchar>
 1006e8d:	83 c4 08             	add    esp,0x8
 1006e90:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006e94:	7f dc                	jg     1006e72 <sprint_hex+0x4a>
 1006e96:	90                   	nop
 1006e97:	90                   	nop
 1006e98:	c9                   	leave  
 1006e99:	c3                   	ret    

01006e9a <sprintn>:
 1006e9a:	55                   	push   ebp
 1006e9b:	89 e5                	mov    ebp,esp
 1006e9d:	eb 1b                	jmp    1006eba <sprintn+0x20>
 1006e9f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006ea2:	8d 50 01             	lea    edx,[eax+0x1]
 1006ea5:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
 1006ea8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006eab:	0f be c0             	movsx  eax,al
 1006eae:	50                   	push   eax
 1006eaf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006eb2:	e8 9d fe ff ff       	call   1006d54 <sprintchar>
 1006eb7:	83 c4 08             	add    esp,0x8
 1006eba:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006ebd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006ec0:	84 c0                	test   al,al
 1006ec2:	75 db                	jne    1006e9f <sprintn+0x5>
 1006ec4:	90                   	nop
 1006ec5:	90                   	nop
 1006ec6:	c9                   	leave  
 1006ec7:	c3                   	ret    
 1006ec8:	66 90                	xchg   ax,ax
 1006eca:	66 90                	xchg   ax,ax
 1006ecc:	66 90                	xchg   ax,ax
 1006ece:	66 90                	xchg   ax,ax

01006ed0 <create_zero>:
 1006ed0:	e8 d4 b6 ff ff       	call   10025a9 <req_proc>
 1006ed5:	83 f8 ff             	cmp    eax,0xffffffff
 1006ed8:	74 1d                	je     1006ef7 <create_zero.retu>
 1006eda:	50                   	push   eax
 1006edb:	53                   	push   ebx
 1006edc:	51                   	push   ecx
 1006edd:	52                   	push   edx
 1006ede:	06                   	push   es
 1006edf:	0e                   	push   cs
 1006ee0:	16                   	push   ss
 1006ee1:	1e                   	push   ds
 1006ee2:	0f a0                	push   fs
 1006ee4:	0f a8                	push   gs
 1006ee6:	54                   	push   esp
 1006ee7:	55                   	push   ebp
 1006ee8:	56                   	push   esi
 1006ee9:	57                   	push   edi
 1006eea:	9c                   	pushf  
 1006eeb:	50                   	push   eax
 1006eec:	e8 69 b7 ff ff       	call   100265a <set_proc>
 1006ef1:	8b 04 24             	mov    eax,DWORD PTR [esp]
 1006ef4:	83 c4 40             	add    esp,0x40

01006ef7 <create_zero.retu>:
 1006ef7:	c3                   	ret    

01006ef8 <fill_desc>:
 1006ef8:	55                   	push   ebp
 1006ef9:	89 e5                	mov    ebp,esp
 1006efb:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1006efe:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
 1006f01:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006f04:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1006f07:	be 26 70 00 01       	mov    esi,0x1007026
 1006f0c:	c7 05 26 70 00 01 00 	mov    DWORD PTR ds:0x1007026,0x0
 1006f13:	00 00 00 
 1006f16:	c7 05 2a 70 00 01 00 	mov    DWORD PTR ds:0x100702a,0x0
 1006f1d:	00 00 00 
 1006f20:	66 89 0e             	mov    WORD PTR [esi],cx
 1006f23:	c1 e9 10             	shr    ecx,0x10
 1006f26:	66 89 56 02          	mov    WORD PTR [esi+0x2],dx
 1006f2a:	c1 ea 10             	shr    edx,0x10
 1006f2d:	88 56 04             	mov    BYTE PTR [esi+0x4],dl
 1006f30:	66 c1 ea 08          	shr    dx,0x8
 1006f34:	88 56 07             	mov    BYTE PTR [esi+0x7],dl
 1006f37:	66 89 5e 05          	mov    WORD PTR [esi+0x5],bx
 1006f3b:	8b 7e 04             	mov    edi,DWORD PTR [esi+0x4]
 1006f3e:	c1 e1 08             	shl    ecx,0x8
 1006f41:	09 cf                	or     edi,ecx
 1006f43:	89 7e 04             	mov    DWORD PTR [esi+0x4],edi
 1006f46:	8b 15 26 70 00 01    	mov    edx,DWORD PTR ds:0x1007026
 1006f4c:	89 10                	mov    DWORD PTR [eax],edx
 1006f4e:	8b 15 2a 70 00 01    	mov    edx,DWORD PTR ds:0x100702a
 1006f54:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1006f57:	89 ec                	mov    esp,ebp
 1006f59:	5d                   	pop    ebp
 1006f5a:	c3                   	ret    

01006f5b <switch_proc_asm>:
 1006f5b:	66 8b 44 24 04       	mov    ax,WORD PTR [esp+0x4]
 1006f60:	66 a3 75 6f 00 01    	mov    ds:0x1006f75,ax
 1006f66:	c7 05 71 6f 00 01 00 	mov    DWORD PTR ds:0x1006f71,0x0
 1006f6d:	00 00 00 

01006f70 <switch_proc_asm.ljmp>:
 1006f70:	ea 00 00 00 00 00 00 	jmp    0x0:0x0
 1006f77:	c3                   	ret    

01006f78 <switch_to>:
 1006f78:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
 1006f7c:	8b 5e 20             	mov    ebx,DWORD PTR [esi+0x20]
 1006f7f:	bf dc 6f 00 01       	mov    edi,0x1006fdc
 1006f84:	89 5f 01             	mov    DWORD PTR [edi+0x1],ebx
 1006f87:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 1006f8a:	89 c1                	mov    ecx,eax
 1006f8c:	83 e9 04             	sub    ecx,0x4
 1006f8f:	89 19                	mov    DWORD PTR [ecx],ebx
 1006f91:	50                   	push   eax
 1006f92:	89 f5                	mov    ebp,esi
 1006f94:	83 c5 28             	add    ebp,0x28
 1006f97:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006f9a:	50                   	push   eax
 1006f9b:	83 c5 04             	add    ebp,0x4
 1006f9e:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fa1:	50                   	push   eax
 1006fa2:	83 c5 04             	add    ebp,0x4
 1006fa5:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fa8:	50                   	push   eax
 1006fa9:	83 c5 04             	add    ebp,0x4
 1006fac:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006faf:	50                   	push   eax
 1006fb0:	83 c5 04             	add    ebp,0x4
 1006fb3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fb6:	50                   	push   eax
 1006fb7:	83 c5 04             	add    ebp,0x4
 1006fba:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fbd:	50                   	push   eax
 1006fbe:	83 c5 04             	add    ebp,0x4
 1006fc1:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fc4:	50                   	push   eax
 1006fc5:	83 c5 04             	add    ebp,0x4
 1006fc8:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006fcb:	50                   	push   eax
 1006fcc:	83 c5 04             	add    ebp,0x4
 1006fcf:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
 1006fd2:	0f 22 d8             	mov    cr3,eax
 1006fd5:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
 1006fd8:	50                   	push   eax
 1006fd9:	9d                   	popf   
 1006fda:	61                   	popa   
 1006fdb:	5c                   	pop    esp

01006fdc <switch_to.leap>:
 1006fdc:	ea 00 00 00 00 08 00 	jmp    0x8:0x0

01006fe3 <save_context>:
 1006fe3:	60                   	pusha  
 1006fe4:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
 1006fe8:	83 c0 44             	add    eax,0x44
 1006feb:	b9 08 00 00 00       	mov    ecx,0x8
 1006ff0:	89 e7                	mov    edi,esp

01006ff2 <save_context.loops>:
 1006ff2:	8b 17                	mov    edx,DWORD PTR [edi]
 1006ff4:	89 10                	mov    DWORD PTR [eax],edx
 1006ff6:	83 c7 04             	add    edi,0x4
 1006ff9:	83 e8 04             	sub    eax,0x4
 1006ffc:	e2 f4                	loop   1006ff2 <save_context.loops>
 1006ffe:	61                   	popa   
 1006fff:	9c                   	pushf  
 1007000:	5b                   	pop    ebx
 1007001:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1007005:	89 58 24             	mov    DWORD PTR [eax+0x24],ebx
 1007008:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 100700b:	89 58 20             	mov    DWORD PTR [eax+0x20],ebx
 100700e:	c3                   	ret    

0100700f <move_to_user_mode>:
 100700f:	66 b8 20 00          	mov    ax,0x20
 1007013:	8e d8                	mov    ds,eax
 1007015:	8e c0                	mov    es,eax
 1007017:	8e e8                	mov    gs,eax
 1007019:	6a 20                	push   0x20
 100701b:	54                   	push   esp
 100701c:	9c                   	pushf  
 100701d:	6a 18                	push   0x18
 100701f:	68 25 70 00 01       	push   0x1007025
 1007024:	cf                   	iret   

01007025 <move_to_user_mode.done>:
 1007025:	c3                   	ret    

01007026 <desc>:
	...
