
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
 1000148:	b8 c0 0e 00 01       	mov    eax,0x1000ec0
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
 10001bc:	b8 cf 3c 00 01       	mov    eax,0x1003ccf
 10001c1:	68 00 8f 00 00       	push   0x8f00
 10001c6:	6a 08                	push   0x8
 10001c8:	50                   	push   eax
 10001c9:	6a 21                	push   0x21
 10001cb:	e8 c0 00 00 00       	call   1000290 <set_gate>
 10001d0:	83 c4 10             	add    esp,0x10
 10001d3:	b8 10 31 00 01       	mov    eax,0x1003110
 10001d8:	68 00 8e 00 00       	push   0x8e00
 10001dd:	6a 08                	push   0x8
 10001df:	50                   	push   eax
 10001e0:	6a 20                	push   0x20
 10001e2:	e8 a9 00 00 00       	call   1000290 <set_gate>
 10001e7:	83 c4 10             	add    esp,0x10
 10001ea:	b8 90 3b 00 01       	mov    eax,0x1003b90
 10001ef:	68 00 8f 00 00       	push   0x8f00
 10001f4:	6a 08                	push   0x8
 10001f6:	50                   	push   eax
 10001f7:	68 80 00 00 00       	push   0x80
 10001fc:	e8 8f 00 00 00       	call   1000290 <set_gate>
 1000201:	83 c4 10             	add    esp,0x10
 1000204:	83 ec 08             	sub    esp,0x8
 1000207:	6a 11                	push   0x11
 1000209:	6a 20                	push   0x20
 100020b:	e8 b0 2c 00 00       	call   1002ec0 <outb>
 1000210:	83 c4 10             	add    esp,0x10
 1000213:	83 ec 08             	sub    esp,0x8
 1000216:	6a 11                	push   0x11
 1000218:	68 a0 00 00 00       	push   0xa0
 100021d:	e8 9e 2c 00 00       	call   1002ec0 <outb>
 1000222:	83 c4 10             	add    esp,0x10
 1000225:	83 ec 08             	sub    esp,0x8
 1000228:	6a 20                	push   0x20
 100022a:	6a 21                	push   0x21
 100022c:	e8 8f 2c 00 00       	call   1002ec0 <outb>
 1000231:	83 c4 10             	add    esp,0x10
 1000234:	83 ec 08             	sub    esp,0x8
 1000237:	6a 28                	push   0x28
 1000239:	68 a1 00 00 00       	push   0xa1
 100023e:	e8 7d 2c 00 00       	call   1002ec0 <outb>
 1000243:	83 c4 10             	add    esp,0x10
 1000246:	83 ec 08             	sub    esp,0x8
 1000249:	6a 04                	push   0x4
 100024b:	6a 21                	push   0x21
 100024d:	e8 6e 2c 00 00       	call   1002ec0 <outb>
 1000252:	83 c4 10             	add    esp,0x10
 1000255:	83 ec 08             	sub    esp,0x8
 1000258:	6a 02                	push   0x2
 100025a:	68 a1 00 00 00       	push   0xa1
 100025f:	e8 5c 2c 00 00       	call   1002ec0 <outb>
 1000264:	83 c4 10             	add    esp,0x10
 1000267:	83 ec 08             	sub    esp,0x8
 100026a:	6a 01                	push   0x1
 100026c:	6a 21                	push   0x21
 100026e:	e8 4d 2c 00 00       	call   1002ec0 <outb>
 1000273:	83 c4 10             	add    esp,0x10
 1000276:	83 ec 08             	sub    esp,0x8
 1000279:	6a 01                	push   0x1
 100027b:	68 a1 00 00 00       	push   0xa1
 1000280:	e8 3b 2c 00 00       	call   1002ec0 <outb>
 1000285:	83 c4 10             	add    esp,0x10
 1000288:	e8 78 2c 00 00       	call   1002f05 <turn_on_int>
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
 1000312:	e8 e2 2b 00 00       	call   1002ef9 <eoi>
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
 1000324:	e8 d0 2b 00 00       	call   1002ef9 <eoi>
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
 1000336:	e8 be 2b 00 00       	call   1002ef9 <eoi>
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
 1000348:	e8 ac 2b 00 00       	call   1002ef9 <eoi>
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
 100035a:	e8 9a 2b 00 00       	call   1002ef9 <eoi>
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
 100036c:	e8 88 2b 00 00       	call   1002ef9 <eoi>
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
 100037d:	e8 77 2b 00 00       	call   1002ef9 <eoi>
 1000382:	e8 9d 2b 00 00       	call   1002f24 <report_back_trace_of_err>
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
 1000395:	e8 5f 2b 00 00       	call   1002ef9 <eoi>
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
 10003a7:	e8 4d 2b 00 00       	call   1002ef9 <eoi>
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
 10003b8:	e8 3c 2b 00 00       	call   1002ef9 <eoi>
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
 10003c9:	e8 2b 2b 00 00       	call   1002ef9 <eoi>
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
 10003db:	e8 19 2b 00 00       	call   1002ef9 <eoi>
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
 10003ed:	e8 07 2b 00 00       	call   1002ef9 <eoi>
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
 1000406:	e8 ee 2a 00 00       	call   1002ef9 <eoi>
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
 1000419:	e8 db 2a 00 00       	call   1002ef9 <eoi>
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
 100042e:	0f 87 29 02 00 00    	ja     100065d <syscall+0x239>
 1000434:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000437:	c1 e0 02             	shl    eax,0x2
 100043a:	05 20 6d 00 01       	add    eax,0x1006d20
 100043f:	8b 00                	mov    eax,DWORD PTR [eax]
 1000441:	ff e0                	jmp    eax
 1000443:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000446:	83 ec 0c             	sub    esp,0xc
 1000449:	50                   	push   eax
 100044a:	e8 46 16 00 00       	call   1001a95 <reg_device>
 100044f:	83 c4 10             	add    esp,0x10
 1000452:	e9 06 02 00 00       	jmp    100065d <syscall+0x239>
 1000457:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100045a:	83 ec 0c             	sub    esp,0xc
 100045d:	50                   	push   eax
 100045e:	e8 ff 1b 00 00       	call   1002062 <dispose_device>
 1000463:	83 c4 10             	add    esp,0x10
 1000466:	e9 f2 01 00 00       	jmp    100065d <syscall+0x239>
 100046b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100046e:	83 ec 0c             	sub    esp,0xc
 1000471:	50                   	push   eax
 1000472:	e8 d3 16 00 00       	call   1001b4a <reg_driver>
 1000477:	83 c4 10             	add    esp,0x10
 100047a:	e9 de 01 00 00       	jmp    100065d <syscall+0x239>
 100047f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000482:	83 ec 0c             	sub    esp,0xc
 1000485:	50                   	push   eax
 1000486:	e8 dd 1b 00 00       	call   1002068 <dispose_driver>
 100048b:	83 c4 10             	add    esp,0x10
 100048e:	e9 ca 01 00 00       	jmp    100065d <syscall+0x239>
 1000493:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1000496:	83 ec 04             	sub    esp,0x4
 1000499:	50                   	push   eax
 100049a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100049d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004a0:	e8 d1 19 00 00       	call   1001e76 <call_drv_func>
 10004a5:	83 c4 10             	add    esp,0x10
 10004a8:	e9 b0 01 00 00       	jmp    100065d <syscall+0x239>
 10004ad:	83 ec 08             	sub    esp,0x8
 10004b0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10004b3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004b6:	e8 c7 0c 00 00       	call   1001182 <req_page_at>
 10004bb:	83 c4 10             	add    esp,0x10
 10004be:	e9 9a 01 00 00       	jmp    100065d <syscall+0x239>
 10004c3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10004c6:	83 ec 0c             	sub    esp,0xc
 10004c9:	50                   	push   eax
 10004ca:	e8 bf 0b 00 00       	call   100108e <free_page>
 10004cf:	83 c4 10             	add    esp,0x10
 10004d2:	e9 86 01 00 00       	jmp    100065d <syscall+0x239>
 10004d7:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10004da:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10004dd:	83 ec 04             	sub    esp,0x4
 10004e0:	52                   	push   edx
 10004e1:	50                   	push   eax
 10004e2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004e5:	e8 aa 26 00 00       	call   1002b94 <reg_proc>
 10004ea:	83 c4 10             	add    esp,0x10
 10004ed:	e9 6b 01 00 00       	jmp    100065d <syscall+0x239>
 10004f2:	83 ec 0c             	sub    esp,0xc
 10004f5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004f8:	e8 da 24 00 00       	call   10029d7 <del_proc>
 10004fd:	83 c4 10             	add    esp,0x10
 1000500:	83 ec 08             	sub    esp,0x8
 1000503:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000506:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000509:	e8 29 0d 00 00       	call   1001237 <chk_vm>
 100050e:	83 c4 10             	add    esp,0x10
 1000511:	83 ec 08             	sub    esp,0x8
 1000514:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000517:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100051a:	e8 3b 10 00 00       	call   100155a <sys_open>
 100051f:	83 c4 10             	add    esp,0x10
 1000522:	e9 36 01 00 00       	jmp    100065d <syscall+0x239>
 1000527:	83 ec 0c             	sub    esp,0xc
 100052a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100052d:	e8 10 13 00 00       	call   1001842 <sys_close>
 1000532:	83 c4 10             	add    esp,0x10
 1000535:	e9 23 01 00 00       	jmp    100065d <syscall+0x239>
 100053a:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 100053d:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000540:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000543:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000546:	e8 e7 13 00 00       	call   1001932 <sys_read>
 100054b:	83 c4 10             	add    esp,0x10
 100054e:	e9 0a 01 00 00       	jmp    100065d <syscall+0x239>
 1000553:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 1000556:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000559:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100055c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100055f:	e8 49 13 00 00       	call   10018ad <sys_write>
 1000564:	83 c4 10             	add    esp,0x10
 1000567:	e9 f1 00 00 00       	jmp    100065d <syscall+0x239>
 100056c:	83 ec 04             	sub    esp,0x4
 100056f:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000572:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000575:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000578:	e8 5a 14 00 00       	call   10019d7 <sys_seek>
 100057d:	83 c4 10             	add    esp,0x10
 1000580:	e9 d8 00 00 00       	jmp    100065d <syscall+0x239>
 1000585:	83 ec 0c             	sub    esp,0xc
 1000588:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100058b:	e8 80 14 00 00       	call   1001a10 <sys_tell>
 1000590:	83 c4 10             	add    esp,0x10
 1000593:	e9 c5 00 00 00       	jmp    100065d <syscall+0x239>
 1000598:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100059b:	83 ec 04             	sub    esp,0x4
 100059e:	50                   	push   eax
 100059f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10005a2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005a5:	e8 e7 0e 00 00       	call   1001491 <reg_vol>
 10005aa:	83 c4 10             	add    esp,0x10
 10005ad:	e9 ab 00 00 00       	jmp    100065d <syscall+0x239>
 10005b2:	83 ec 0c             	sub    esp,0xc
 10005b5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005b8:	e8 c0 0e 00 00       	call   100147d <free_vol>
 10005bd:	83 c4 10             	add    esp,0x10
 10005c0:	e9 98 00 00 00       	jmp    100065d <syscall+0x239>
 10005c5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005c8:	83 ec 0c             	sub    esp,0xc
 10005cb:	50                   	push   eax
 10005cc:	e8 b1 2b 00 00       	call   1003182 <execute>
 10005d1:	83 c4 10             	add    esp,0x10
 10005d4:	e9 84 00 00 00       	jmp    100065d <syscall+0x239>
 10005d9:	83 ec 0c             	sub    esp,0xc
 10005dc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005df:	e8 94 25 00 00       	call   1002b78 <sys_exit>
 10005e4:	83 c4 10             	add    esp,0x10
 10005e7:	eb 74                	jmp    100065d <syscall+0x239>
 10005e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005ec:	83 ec 0c             	sub    esp,0xc
 10005ef:	50                   	push   eax
 10005f0:	e8 66 2c 00 00       	call   100325b <exec_call>
 10005f5:	83 c4 10             	add    esp,0x10
 10005f8:	eb 63                	jmp    100065d <syscall+0x239>
 10005fa:	83 ec 0c             	sub    esp,0xc
 10005fd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000600:	e8 57 0d 00 00       	call   100135c <sys_mkfifo>
 1000605:	83 c4 10             	add    esp,0x10
 1000608:	eb 53                	jmp    100065d <syscall+0x239>
 100060a:	83 ec 0c             	sub    esp,0xc
 100060d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000610:	e8 b9 26 00 00       	call   1002cce <sys_malloc>
 1000615:	83 c4 10             	add    esp,0x10
 1000618:	eb 43                	jmp    100065d <syscall+0x239>
 100061a:	83 ec 0c             	sub    esp,0xc
 100061d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000620:	e8 fa 27 00 00       	call   1002e1f <sys_free>
 1000625:	83 c4 10             	add    esp,0x10
 1000628:	eb 33                	jmp    100065d <syscall+0x239>
 100062a:	e8 72 37 00 00       	call   1003da1 <sys_getkbc>
 100062f:	0f be c0             	movsx  eax,al
 1000632:	eb 29                	jmp    100065d <syscall+0x239>
 1000634:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000637:	83 ec 0c             	sub    esp,0xc
 100063a:	50                   	push   eax
 100063b:	e8 8d 15 00 00       	call   1001bcd <sys_find_dev>
 1000640:	83 c4 10             	add    esp,0x10
 1000643:	eb 18                	jmp    100065d <syscall+0x239>
 1000645:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 1000648:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100064b:	83 ec 04             	sub    esp,0x4
 100064e:	52                   	push   edx
 100064f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000652:	50                   	push   eax
 1000653:	e8 d8 15 00 00       	call   1001c30 <sys_operate_dev>
 1000658:	83 c4 10             	add    esp,0x10
 100065b:	eb 00                	jmp    100065d <syscall+0x239>
 100065d:	c9                   	leave  
 100065e:	c3                   	ret    

0100065f <main>:
 100065f:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1000663:	83 e4 f0             	and    esp,0xfffffff0
 1000666:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 1000669:	55                   	push   ebp
 100066a:	89 e5                	mov    ebp,esp
 100066c:	57                   	push   edi
 100066d:	56                   	push   esi
 100066e:	53                   	push   ebx
 100066f:	51                   	push   ecx
 1000670:	83 ec 58             	sub    esp,0x58
 1000673:	89 cb                	mov    ebx,ecx
 1000675:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 1000678:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100067b:	e8 97 04 00 00       	call   1000b17 <init_logging>
 1000680:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1000683:	8b 00                	mov    eax,DWORD PTR [eax]
 1000685:	3d d6 50 52 e8       	cmp    eax,0xe85250d6
 100068a:	74 10                	je     100069c <main+0x3d>
 100068c:	83 ec 0c             	sub    esp,0xc
 100068f:	68 b4 6e 00 01       	push   0x1006eb4
 1000694:	e8 32 06 00 00       	call   1000ccb <printf>
 1000699:	83 c4 10             	add    esp,0x10
 100069c:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 100069f:	8b 00                	mov    eax,DWORD PTR [eax]
 10006a1:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 10006a4:	83 ec 08             	sub    esp,0x8
 10006a7:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 10006aa:	68 de 6e 00 01       	push   0x1006ede
 10006af:	e8 17 06 00 00       	call   1000ccb <printf>
 10006b4:	83 c4 10             	add    esp,0x10
 10006b7:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 10006ba:	83 c0 08             	add    eax,0x8
 10006bd:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10006c0:	e9 f0 03 00 00       	jmp    1000ab5 <main+0x456>
 10006c5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006c8:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10006cb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006ce:	8b 00                	mov    eax,DWORD PTR [eax]
 10006d0:	83 ec 04             	sub    esp,0x4
 10006d3:	52                   	push   edx
 10006d4:	50                   	push   eax
 10006d5:	68 f7 6e 00 01       	push   0x1006ef7
 10006da:	e8 ec 05 00 00       	call   1000ccb <printf>
 10006df:	83 c4 10             	add    esp,0x10
 10006e2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006e5:	8b 00                	mov    eax,DWORD PTR [eax]
 10006e7:	83 f8 08             	cmp    eax,0x8
 10006ea:	0f 87 b6 03 00 00    	ja     1000aa6 <main+0x447>
 10006f0:	8b 04 85 ec 6f 00 01 	mov    eax,DWORD PTR [eax*4+0x1006fec]
 10006f7:	ff e0                	jmp    eax
 10006f9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006fc:	83 c0 08             	add    eax,0x8
 10006ff:	83 ec 08             	sub    esp,0x8
 1000702:	50                   	push   eax
 1000703:	68 0c 6f 00 01       	push   0x1006f0c
 1000708:	e8 be 05 00 00       	call   1000ccb <printf>
 100070d:	83 c4 10             	add    esp,0x10
 1000710:	e9 91 03 00 00       	jmp    1000aa6 <main+0x447>
 1000715:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000718:	83 c0 08             	add    eax,0x8
 100071b:	83 ec 08             	sub    esp,0x8
 100071e:	50                   	push   eax
 100071f:	68 1f 6f 00 01       	push   0x1006f1f
 1000724:	e8 a2 05 00 00       	call   1000ccb <printf>
 1000729:	83 c4 10             	add    esp,0x10
 100072c:	e9 75 03 00 00       	jmp    1000aa6 <main+0x447>
 1000731:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000734:	8d 48 10             	lea    ecx,[eax+0x10]
 1000737:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100073a:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100073d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000740:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000743:	51                   	push   ecx
 1000744:	52                   	push   edx
 1000745:	50                   	push   eax
 1000746:	68 38 6f 00 01       	push   0x1006f38
 100074b:	e8 7b 05 00 00       	call   1000ccb <printf>
 1000750:	83 c4 10             	add    esp,0x10
 1000753:	e9 4e 03 00 00       	jmp    1000aa6 <main+0x447>
 1000758:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100075b:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100075e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000761:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000764:	83 ec 04             	sub    esp,0x4
 1000767:	52                   	push   edx
 1000768:	50                   	push   eax
 1000769:	68 60 6f 00 01       	push   0x1006f60
 100076e:	e8 58 05 00 00       	call   1000ccb <printf>
 1000773:	83 c4 10             	add    esp,0x10
 1000776:	e9 2b 03 00 00       	jmp    1000aa6 <main+0x447>
 100077b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100077e:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1000781:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000784:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000787:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100078a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100078d:	51                   	push   ecx
 100078e:	52                   	push   edx
 100078f:	50                   	push   eax
 1000790:	68 84 6f 00 01       	push   0x1006f84
 1000795:	e8 31 05 00 00       	call   1000ccb <printf>
 100079a:	83 c4 10             	add    esp,0x10
 100079d:	e9 04 03 00 00       	jmp    1000aa6 <main+0x447>
 10007a2:	83 ec 0c             	sub    esp,0xc
 10007a5:	68 9c 6f 00 01       	push   0x1006f9c
 10007aa:	e8 1c 05 00 00       	call   1000ccb <printf>
 10007af:	83 c4 10             	add    esp,0x10
 10007b2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10007b5:	83 c0 10             	add    eax,0x10
 10007b8:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10007bb:	eb 5c                	jmp    1000819 <main+0x1ba>
 10007bd:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007c0:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 10007c3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007c6:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007c9:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007cc:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 10007cf:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007d2:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007d5:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007d8:	89 d0                	mov    eax,edx
 10007da:	31 d2                	xor    edx,edx
 10007dc:	89 c7                	mov    edi,eax
 10007de:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007e1:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10007e4:	8b 00                	mov    eax,DWORD PTR [eax]
 10007e6:	89 c6                	mov    esi,eax
 10007e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007eb:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10007ee:	8b 00                	mov    eax,DWORD PTR [eax]
 10007f0:	89 d0                	mov    eax,edx
 10007f2:	31 d2                	xor    edx,edx
 10007f4:	83 ec 08             	sub    esp,0x8
 10007f7:	51                   	push   ecx
 10007f8:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 10007fb:	57                   	push   edi
 10007fc:	56                   	push   esi
 10007fd:	50                   	push   eax
 10007fe:	68 a4 6f 00 01       	push   0x1006fa4
 1000803:	e8 c3 04 00 00       	call   1000ccb <printf>
 1000808:	83 c4 20             	add    esp,0x20
 100080b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100080e:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1000811:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000814:	01 d0                	add    eax,edx
 1000816:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1000819:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100081c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 100081f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000822:	01 d0                	add    eax,edx
 1000824:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 1000827:	72 94                	jb     10007bd <main+0x15e>
 1000829:	e9 78 02 00 00       	jmp    1000aa6 <main+0x447>
 100082e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000831:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1000834:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000837:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100083a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100083d:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 1000840:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000843:	0f b6 40 1d          	movzx  eax,BYTE PTR [eax+0x1d]
 1000847:	0f b6 c0             	movzx  eax,al
 100084a:	83 f8 02             	cmp    eax,0x2
 100084d:	0f 84 36 01 00 00    	je     1000989 <main+0x32a>
 1000853:	83 f8 02             	cmp    eax,0x2
 1000856:	0f 8f 36 01 00 00    	jg     1000992 <main+0x333>
 100085c:	85 c0                	test   eax,eax
 100085e:	74 0e                	je     100086e <main+0x20f>
 1000860:	83 f8 01             	cmp    eax,0x1
 1000863:	0f 84 f3 00 00 00    	je     100095c <main+0x2fd>
 1000869:	e9 24 01 00 00       	jmp    1000992 <main+0x333>
 100086e:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000871:	83 c0 22             	add    eax,0x22
 1000874:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1000877:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 100087e:	c7 45 d4 00 00 04 00 	mov    DWORD PTR [ebp-0x2c],0x40000
 1000885:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 100088c:	e9 b6 00 00 00       	jmp    1000947 <main+0x2e8>
 1000891:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000894:	89 d0                	mov    eax,edx
 1000896:	01 c0                	add    eax,eax
 1000898:	01 c2                	add    edx,eax
 100089a:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100089d:	01 d0                	add    eax,edx
 100089f:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 10008a3:	0f b6 c0             	movzx  eax,al
 10008a6:	ba ff 00 00 00       	mov    edx,0xff
 10008ab:	89 d1                	mov    ecx,edx
 10008ad:	29 c1                	sub    ecx,eax
 10008af:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10008b2:	89 d0                	mov    eax,edx
 10008b4:	01 c0                	add    eax,eax
 10008b6:	01 c2                	add    edx,eax
 10008b8:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10008bb:	01 d0                	add    eax,edx
 10008bd:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 10008c1:	0f b6 d0             	movzx  edx,al
 10008c4:	b8 ff 00 00 00       	mov    eax,0xff
 10008c9:	29 d0                	sub    eax,edx
 10008cb:	89 ce                	mov    esi,ecx
 10008cd:	0f af f0             	imul   esi,eax
 10008d0:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10008d3:	89 d0                	mov    eax,edx
 10008d5:	01 c0                	add    eax,eax
 10008d7:	01 c2                	add    edx,eax
 10008d9:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10008dc:	01 d0                	add    eax,edx
 10008de:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10008e1:	0f b6 c8             	movzx  ecx,al
 10008e4:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10008e7:	89 d0                	mov    eax,edx
 10008e9:	01 c0                	add    eax,eax
 10008eb:	01 c2                	add    edx,eax
 10008ed:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10008f0:	01 d0                	add    eax,edx
 10008f2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10008f5:	0f b6 c0             	movzx  eax,al
 10008f8:	0f af c1             	imul   eax,ecx
 10008fb:	01 c6                	add    esi,eax
 10008fd:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000900:	89 d0                	mov    eax,edx
 1000902:	01 c0                	add    eax,eax
 1000904:	01 c2                	add    edx,eax
 1000906:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1000909:	01 d0                	add    eax,edx
 100090b:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 100090f:	0f b6 c8             	movzx  ecx,al
 1000912:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000915:	89 d0                	mov    eax,edx
 1000917:	01 c0                	add    eax,eax
 1000919:	01 c2                	add    edx,eax
 100091b:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100091e:	01 d0                	add    eax,edx
 1000920:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 1000924:	0f b6 c0             	movzx  eax,al
 1000927:	0f af c1             	imul   eax,ecx
 100092a:	01 f0                	add    eax,esi
 100092c:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 100092f:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1000932:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 1000935:	73 0c                	jae    1000943 <main+0x2e4>
 1000937:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100093a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 100093d:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1000940:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1000943:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000947:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100094a:	0f b7 40 20          	movzx  eax,WORD PTR [eax+0x20]
 100094e:	0f b7 c0             	movzx  eax,ax
 1000951:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000954:	0f 82 37 ff ff ff    	jb     1000891 <main+0x232>
 100095a:	eb 3e                	jmp    100099a <main+0x33b>
 100095c:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100095f:	0f b6 40 25          	movzx  eax,BYTE PTR [eax+0x25]
 1000963:	0f b6 c0             	movzx  eax,al
 1000966:	ba 01 00 00 00       	mov    edx,0x1
 100096b:	89 c1                	mov    ecx,eax
 100096d:	d3 e2                	shl    edx,cl
 100096f:	89 d0                	mov    eax,edx
 1000971:	8d 50 ff             	lea    edx,[eax-0x1]
 1000974:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000977:	0f b6 40 24          	movzx  eax,BYTE PTR [eax+0x24]
 100097b:	0f b6 c0             	movzx  eax,al
 100097e:	89 c1                	mov    ecx,eax
 1000980:	d3 e2                	shl    edx,cl
 1000982:	89 d0                	mov    eax,edx
 1000984:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1000987:	eb 11                	jmp    100099a <main+0x33b>
 1000989:	c7 45 dc 5c 01 00 00 	mov    DWORD PTR [ebp-0x24],0x15c
 1000990:	eb 08                	jmp    100099a <main+0x33b>
 1000992:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
 1000999:	90                   	nop
 100099a:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 10009a1:	e9 e5 00 00 00       	jmp    1000a8b <main+0x42c>
 10009a6:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10009a9:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
 10009ad:	0f b6 c0             	movzx  eax,al
 10009b0:	83 f8 20             	cmp    eax,0x20
 10009b3:	0f 84 ae 00 00 00    	je     1000a67 <main+0x408>
 10009b9:	83 f8 20             	cmp    eax,0x20
 10009bc:	0f 8f c5 00 00 00    	jg     1000a87 <main+0x428>
 10009c2:	83 f8 18             	cmp    eax,0x18
 10009c5:	74 6c                	je     1000a33 <main+0x3d4>
 10009c7:	83 f8 18             	cmp    eax,0x18
 10009ca:	0f 8f b7 00 00 00    	jg     1000a87 <main+0x428>
 10009d0:	83 f8 08             	cmp    eax,0x8
 10009d3:	74 17                	je     10009ec <main+0x38d>
 10009d5:	83 f8 08             	cmp    eax,0x8
 10009d8:	0f 8c a9 00 00 00    	jl     1000a87 <main+0x428>
 10009de:	83 e8 0f             	sub    eax,0xf
 10009e1:	83 f8 01             	cmp    eax,0x1
 10009e4:	0f 87 9d 00 00 00    	ja     1000a87 <main+0x428>
 10009ea:	eb 23                	jmp    1000a0f <main+0x3b0>
 10009ec:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10009ef:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 10009f2:	83 c0 01             	add    eax,0x1
 10009f5:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 10009f9:	89 c2                	mov    edx,eax
 10009fb:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 10009fe:	01 d0                	add    eax,edx
 1000a00:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 1000a03:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000a06:	89 c2                	mov    edx,eax
 1000a08:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 1000a0b:	88 10                	mov    BYTE PTR [eax],dl
 1000a0d:	eb 78                	jmp    1000a87 <main+0x428>
 1000a0f:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a12:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000a15:	83 c0 02             	add    eax,0x2
 1000a18:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000a1c:	89 c2                	mov    edx,eax
 1000a1e:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000a21:	01 d0                	add    eax,edx
 1000a23:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 1000a26:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000a29:	89 c2                	mov    edx,eax
 1000a2b:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1000a2e:	66 89 10             	mov    WORD PTR [eax],dx
 1000a31:	eb 54                	jmp    1000a87 <main+0x428>
 1000a33:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a36:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000a39:	83 c0 03             	add    eax,0x3
 1000a3c:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000a40:	89 c2                	mov    edx,eax
 1000a42:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000a45:	01 d0                	add    eax,edx
 1000a47:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 1000a4a:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000a4d:	25 ff ff ff 00       	and    eax,0xffffff
 1000a52:	89 c2                	mov    edx,eax
 1000a54:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000a57:	8b 00                	mov    eax,DWORD PTR [eax]
 1000a59:	25 00 00 00 ff       	and    eax,0xff000000
 1000a5e:	09 c2                	or     edx,eax
 1000a60:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000a63:	89 10                	mov    DWORD PTR [eax],edx
 1000a65:	eb 20                	jmp    1000a87 <main+0x428>
 1000a67:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a6a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000a6d:	83 c0 04             	add    eax,0x4
 1000a70:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000a74:	89 c2                	mov    edx,eax
 1000a76:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000a79:	01 d0                	add    eax,edx
 1000a7b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1000a7e:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 1000a81:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
 1000a84:	89 10                	mov    DWORD PTR [eax],edx
 1000a86:	90                   	nop
 1000a87:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000a8b:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a8e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1000a91:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000a94:	73 0f                	jae    1000aa5 <main+0x446>
 1000a96:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a99:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1000a9c:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000a9f:	0f 82 01 ff ff ff    	jb     10009a6 <main+0x347>
 1000aa5:	90                   	nop
 1000aa6:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000aa9:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000aac:	83 c0 07             	add    eax,0x7
 1000aaf:	83 e0 f8             	and    eax,0xfffffff8
 1000ab2:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000ab5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000ab8:	8b 00                	mov    eax,DWORD PTR [eax]
 1000aba:	85 c0                	test   eax,eax
 1000abc:	0f 85 03 fc ff ff    	jne    10006c5 <main+0x66>
 1000ac2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000ac5:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000ac8:	83 c0 07             	add    eax,0x7
 1000acb:	83 e0 f8             	and    eax,0xfffffff8
 1000ace:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000ad1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000ad4:	2b 43 04             	sub    eax,DWORD PTR [ebx+0x4]
 1000ad7:	83 ec 08             	sub    esp,0x8
 1000ada:	50                   	push   eax
 1000adb:	68 d7 6f 00 01       	push   0x1006fd7
 1000ae0:	e8 e6 01 00 00       	call   1000ccb <printf>
 1000ae5:	83 c4 10             	add    esp,0x10
 1000ae8:	e8 13 f5 ff ff       	call   1000000 <init_int>
 1000aed:	e8 cb 04 00 00       	call   1000fbd <init_memory>
 1000af2:	e8 92 0f 00 00       	call   1001a89 <init_drvdev_man>
 1000af7:	e8 7d 54 00 00       	call   1005f79 <init_tty>
 1000afc:	e8 a5 31 00 00       	call   1003ca6 <init_kb>
 1000b01:	e8 f3 32 00 00       	call   1003df9 <init_disk>
 1000b06:	e8 23 3a 00 00       	call   100452e <init_fat16>
 1000b0b:	c7 05 40 6c 00 01 00 	mov    DWORD PTR ds:0x1006c40,0x0
 1000b12:	00 00 00 
 1000b15:	eb fe                	jmp    1000b15 <main+0x4b6>

01000b17 <init_logging>:
 1000b17:	55                   	push   ebp
 1000b18:	89 e5                	mov    ebp,esp
 1000b1a:	c7 05 04 00 40 00 00 	mov    DWORD PTR ds:0x400004,0xb8000
 1000b21:	80 0b 00 
 1000b24:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000b2b:	00 00 00 
 1000b2e:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000b35:	00 00 00 
 1000b38:	90                   	nop
 1000b39:	5d                   	pop    ebp
 1000b3a:	c3                   	ret    

01000b3b <itoa>:
 1000b3b:	55                   	push   ebp
 1000b3c:	89 e5                	mov    ebp,esp
 1000b3e:	83 ec 20             	sub    esp,0x20
 1000b41:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000b44:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000b47:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000b4a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000b4d:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
 1000b54:	83 7d 0c 64          	cmp    DWORD PTR [ebp+0xc],0x64
 1000b58:	75 20                	jne    1000b7a <itoa+0x3f>
 1000b5a:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1000b5e:	79 1a                	jns    1000b7a <itoa+0x3f>
 1000b60:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000b63:	8d 50 01             	lea    edx,[eax+0x1]
 1000b66:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000b69:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1000b6c:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1000b70:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000b73:	f7 d8                	neg    eax
 1000b75:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000b78:	eb 0d                	jmp    1000b87 <itoa+0x4c>
 1000b7a:	83 7d 0c 78          	cmp    DWORD PTR [ebp+0xc],0x78
 1000b7e:	75 07                	jne    1000b87 <itoa+0x4c>
 1000b80:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [ebp-0x14],0x10
 1000b87:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000b8a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000b8d:	ba 00 00 00 00       	mov    edx,0x0
 1000b92:	f7 f1                	div    ecx
 1000b94:	89 d0                	mov    eax,edx
 1000b96:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1000b99:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
 1000b9d:	7f 0a                	jg     1000ba9 <itoa+0x6e>
 1000b9f:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000ba2:	83 c0 30             	add    eax,0x30
 1000ba5:	89 c1                	mov    ecx,eax
 1000ba7:	eb 08                	jmp    1000bb1 <itoa+0x76>
 1000ba9:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000bac:	83 c0 57             	add    eax,0x57
 1000baf:	89 c1                	mov    ecx,eax
 1000bb1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000bb4:	8d 50 01             	lea    edx,[eax+0x1]
 1000bb7:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000bba:	88 08                	mov    BYTE PTR [eax],cl
 1000bbc:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000bbf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000bc2:	ba 00 00 00 00       	mov    edx,0x0
 1000bc7:	f7 f1                	div    ecx
 1000bc9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000bcc:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1000bd0:	75 b5                	jne    1000b87 <itoa+0x4c>
 1000bd2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000bd5:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1000bd8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000bdb:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000bde:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000be1:	83 e8 01             	sub    eax,0x1
 1000be4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000be7:	eb 25                	jmp    1000c0e <itoa+0xd3>
 1000be9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000bec:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000bef:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
 1000bf2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000bf5:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1000bf8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000bfb:	88 10                	mov    BYTE PTR [eax],dl
 1000bfd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000c00:	0f b6 55 e7          	movzx  edx,BYTE PTR [ebp-0x19]
 1000c04:	88 10                	mov    BYTE PTR [eax],dl
 1000c06:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000c0a:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1000c0e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000c11:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 1000c14:	72 d3                	jb     1000be9 <itoa+0xae>
 1000c16:	90                   	nop
 1000c17:	90                   	nop
 1000c18:	c9                   	leave  
 1000c19:	c3                   	ret    

01000c1a <putchar>:
 1000c1a:	55                   	push   ebp
 1000c1b:	89 e5                	mov    ebp,esp
 1000c1d:	83 7d 08 0a          	cmp    DWORD PTR [ebp+0x8],0xa
 1000c21:	74 06                	je     1000c29 <putchar+0xf>
 1000c23:	83 7d 08 0d          	cmp    DWORD PTR [ebp+0x8],0xd
 1000c27:	75 31                	jne    1000c5a <putchar+0x40>
 1000c29:	90                   	nop
 1000c2a:	eb 01                	jmp    1000c2d <putchar+0x13>
 1000c2c:	90                   	nop
 1000c2d:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000c34:	00 00 00 
 1000c37:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000c3c:	83 c0 01             	add    eax,0x1
 1000c3f:	a3 0c 00 40 00       	mov    ds:0x40000c,eax
 1000c44:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000c49:	83 f8 17             	cmp    eax,0x17
 1000c4c:	7e 7a                	jle    1000cc8 <putchar+0xae>
 1000c4e:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000c55:	00 00 00 
 1000c58:	eb 6e                	jmp    1000cc8 <putchar+0xae>
 1000c5a:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000c60:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000c66:	89 d0                	mov    eax,edx
 1000c68:	c1 e0 02             	shl    eax,0x2
 1000c6b:	01 d0                	add    eax,edx
 1000c6d:	c1 e0 04             	shl    eax,0x4
 1000c70:	89 c2                	mov    edx,eax
 1000c72:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000c77:	01 d0                	add    eax,edx
 1000c79:	01 c0                	add    eax,eax
 1000c7b:	01 c8                	add    eax,ecx
 1000c7d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1000c80:	88 10                	mov    BYTE PTR [eax],dl
 1000c82:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000c88:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000c8e:	89 d0                	mov    eax,edx
 1000c90:	c1 e0 02             	shl    eax,0x2
 1000c93:	01 d0                	add    eax,edx
 1000c95:	c1 e0 04             	shl    eax,0x4
 1000c98:	89 c2                	mov    edx,eax
 1000c9a:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000c9f:	01 d0                	add    eax,edx
 1000ca1:	01 c0                	add    eax,eax
 1000ca3:	83 c0 01             	add    eax,0x1
 1000ca6:	01 c8                	add    eax,ecx
 1000ca8:	c6 00 07             	mov    BYTE PTR [eax],0x7
 1000cab:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000cb0:	83 c0 01             	add    eax,0x1
 1000cb3:	a3 08 00 40 00       	mov    ds:0x400008,eax
 1000cb8:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000cbd:	83 f8 4f             	cmp    eax,0x4f
 1000cc0:	0f 8f 66 ff ff ff    	jg     1000c2c <putchar+0x12>
 1000cc6:	eb 01                	jmp    1000cc9 <putchar+0xaf>
 1000cc8:	90                   	nop
 1000cc9:	5d                   	pop    ebp
 1000cca:	c3                   	ret    

01000ccb <printf>:
 1000ccb:	55                   	push   ebp
 1000ccc:	89 e5                	mov    ebp,esp
 1000cce:	83 ec 20             	sub    esp,0x20
 1000cd1:	8d 45 08             	lea    eax,[ebp+0x8]
 1000cd4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000cd7:	83 45 fc 04          	add    DWORD PTR [ebp-0x4],0x4
 1000cdb:	e9 ce 00 00 00       	jmp    1000dae <printf+0xe3>
 1000ce0:	83 7d f4 25          	cmp    DWORD PTR [ebp-0xc],0x25
 1000ce4:	74 10                	je     1000cf6 <printf+0x2b>
 1000ce6:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000ce9:	e8 2c ff ff ff       	call   1000c1a <putchar>
 1000cee:	83 c4 04             	add    esp,0x4
 1000cf1:	e9 b8 00 00 00       	jmp    1000dae <printf+0xe3>
 1000cf6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000cf9:	8d 50 01             	lea    edx,[eax+0x1]
 1000cfc:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000cff:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000d02:	0f be c0             	movsx  eax,al
 1000d05:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000d08:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000d0c:	74 24                	je     1000d32 <printf+0x67>
 1000d0e:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000d12:	0f 8f 81 00 00 00    	jg     1000d99 <printf+0xce>
 1000d18:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000d1c:	74 14                	je     1000d32 <printf+0x67>
 1000d1e:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000d22:	7f 75                	jg     1000d99 <printf+0xce>
 1000d24:	83 7d f4 64          	cmp    DWORD PTR [ebp-0xc],0x64
 1000d28:	74 08                	je     1000d32 <printf+0x67>
 1000d2a:	83 7d f4 73          	cmp    DWORD PTR [ebp-0xc],0x73
 1000d2e:	74 25                	je     1000d55 <printf+0x8a>
 1000d30:	eb 67                	jmp    1000d99 <printf+0xce>
 1000d32:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000d35:	8d 50 04             	lea    edx,[eax+0x4]
 1000d38:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000d3b:	8b 00                	mov    eax,DWORD PTR [eax]
 1000d3d:	50                   	push   eax
 1000d3e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000d41:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000d44:	50                   	push   eax
 1000d45:	e8 f1 fd ff ff       	call   1000b3b <itoa>
 1000d4a:	83 c4 0c             	add    esp,0xc
 1000d4d:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000d50:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000d53:	eb 1e                	jmp    1000d73 <printf+0xa8>
 1000d55:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000d58:	8d 50 04             	lea    edx,[eax+0x4]
 1000d5b:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000d5e:	8b 00                	mov    eax,DWORD PTR [eax]
 1000d60:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000d63:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1000d67:	75 09                	jne    1000d72 <printf+0xa7>
 1000d69:	c7 45 f8 10 70 00 01 	mov    DWORD PTR [ebp-0x8],0x1007010
 1000d70:	eb 1b                	jmp    1000d8d <printf+0xc2>
 1000d72:	90                   	nop
 1000d73:	eb 18                	jmp    1000d8d <printf+0xc2>
 1000d75:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000d78:	8d 50 01             	lea    edx,[eax+0x1]
 1000d7b:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 1000d7e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000d81:	0f be c0             	movsx  eax,al
 1000d84:	50                   	push   eax
 1000d85:	e8 90 fe ff ff       	call   1000c1a <putchar>
 1000d8a:	83 c4 04             	add    esp,0x4
 1000d8d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000d90:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000d93:	84 c0                	test   al,al
 1000d95:	75 de                	jne    1000d75 <printf+0xaa>
 1000d97:	eb 15                	jmp    1000dae <printf+0xe3>
 1000d99:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000d9c:	8d 50 04             	lea    edx,[eax+0x4]
 1000d9f:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000da2:	8b 00                	mov    eax,DWORD PTR [eax]
 1000da4:	50                   	push   eax
 1000da5:	e8 70 fe ff ff       	call   1000c1a <putchar>
 1000daa:	83 c4 04             	add    esp,0x4
 1000dad:	90                   	nop
 1000dae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000db1:	8d 50 01             	lea    edx,[eax+0x1]
 1000db4:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000db7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000dba:	0f be c0             	movsx  eax,al
 1000dbd:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000dc0:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1000dc4:	0f 85 16 ff ff ff    	jne    1000ce0 <printf+0x15>
 1000dca:	90                   	nop
 1000dcb:	90                   	nop
 1000dcc:	c9                   	leave  
 1000dcd:	c3                   	ret    

01000dce <vmalloc>:
 1000dce:	55                   	push   ebp
 1000dcf:	89 e5                	mov    ebp,esp
 1000dd1:	53                   	push   ebx
 1000dd2:	83 ec 10             	sub    esp,0x10
 1000dd5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1000ddc:	eb 6e                	jmp    1000e4c <vmalloc+0x7e>
 1000dde:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1000de5:	eb 5b                	jmp    1000e42 <vmalloc+0x74>
 1000de7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000dea:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000df1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000df4:	bb 01 00 00 00       	mov    ebx,0x1
 1000df9:	89 c1                	mov    ecx,eax
 1000dfb:	d3 e3                	shl    ebx,cl
 1000dfd:	89 d8                	mov    eax,ebx
 1000dff:	21 d0                	and    eax,edx
 1000e01:	85 c0                	test   eax,eax
 1000e03:	75 39                	jne    1000e3e <vmalloc+0x70>
 1000e05:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e08:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000e0f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000e12:	bb 01 00 00 00       	mov    ebx,0x1
 1000e17:	89 c1                	mov    ecx,eax
 1000e19:	d3 e3                	shl    ebx,cl
 1000e1b:	89 d8                	mov    eax,ebx
 1000e1d:	09 c2                	or     edx,eax
 1000e1f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e22:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000e29:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e2c:	c1 e0 05             	shl    eax,0x5
 1000e2f:	89 c2                	mov    edx,eax
 1000e31:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000e34:	01 d0                	add    eax,edx
 1000e36:	83 c0 20             	add    eax,0x20
 1000e39:	c1 e0 0c             	shl    eax,0xc
 1000e3c:	eb 14                	jmp    1000e52 <vmalloc+0x84>
 1000e3e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1000e42:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 1000e46:	7e 9f                	jle    1000de7 <vmalloc+0x19>
 1000e48:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000e4c:	83 7d f8 03          	cmp    DWORD PTR [ebp-0x8],0x3
 1000e50:	7e 8c                	jle    1000dde <vmalloc+0x10>
 1000e52:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000e55:	c9                   	leave  
 1000e56:	c3                   	ret    

01000e57 <vmfree>:
 1000e57:	55                   	push   ebp
 1000e58:	89 e5                	mov    ebp,esp
 1000e5a:	53                   	push   ebx
 1000e5b:	83 ec 10             	sub    esp,0x10
 1000e5e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000e61:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1000e67:	85 c0                	test   eax,eax
 1000e69:	0f 48 c2             	cmovs  eax,edx
 1000e6c:	c1 f8 0c             	sar    eax,0xc
 1000e6f:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000e72:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e75:	8d 50 1f             	lea    edx,[eax+0x1f]
 1000e78:	85 c0                	test   eax,eax
 1000e7a:	0f 48 c2             	cmovs  eax,edx
 1000e7d:	c1 f8 05             	sar    eax,0x5
 1000e80:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000e83:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e86:	99                   	cdq    
 1000e87:	c1 ea 1b             	shr    edx,0x1b
 1000e8a:	01 d0                	add    eax,edx
 1000e8c:	83 e0 1f             	and    eax,0x1f
 1000e8f:	29 d0                	sub    eax,edx
 1000e91:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000e94:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000e97:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000e9e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000ea1:	bb 01 00 00 00       	mov    ebx,0x1
 1000ea6:	89 c1                	mov    ecx,eax
 1000ea8:	d3 e3                	shl    ebx,cl
 1000eaa:	89 d8                	mov    eax,ebx
 1000eac:	f7 d0                	not    eax
 1000eae:	21 c2                	and    edx,eax
 1000eb0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000eb3:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000eba:	90                   	nop
 1000ebb:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000ebe:	c9                   	leave  
 1000ebf:	c3                   	ret    

01000ec0 <page_err>:
 1000ec0:	55                   	push   ebp
 1000ec1:	89 e5                	mov    ebp,esp
 1000ec3:	53                   	push   ebx
 1000ec4:	83 ec 24             	sub    esp,0x24
 1000ec7:	fa                   	cli    
 1000ec8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1000ecf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1000ed6:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
 1000ed9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000edc:	0f 20 d0             	mov    eax,cr2
 1000edf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1000ee2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000ee5:	83 e0 01             	and    eax,0x1
 1000ee8:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1000eeb:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 1000eef:	0f 85 b7 00 00 00    	jne    1000fac <page_err+0xec>
 1000ef5:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1000efc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1000f03:	0f 20 d8             	mov    eax,cr3
 1000f06:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1000f09:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1000f0c:	c1 e8 16             	shr    eax,0x16
 1000f0f:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1000f16:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000f19:	01 d0                	add    eax,edx
 1000f1b:	8b 00                	mov    eax,DWORD PTR [eax]
 1000f1d:	83 e0 01             	and    eax,0x1
 1000f20:	85 c0                	test   eax,eax
 1000f22:	75 24                	jne    1000f48 <page_err+0x88>
 1000f24:	e8 a5 fe ff ff       	call   1000dce <vmalloc>
 1000f29:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000f2c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1000f2f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1000f32:	c1 e8 16             	shr    eax,0x16
 1000f35:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 1000f3c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000f3f:	01 c8                	add    eax,ecx
 1000f41:	83 ca 05             	or     edx,0x5
 1000f44:	89 10                	mov    DWORD PTR [eax],edx
 1000f46:	eb 1c                	jmp    1000f64 <page_err+0xa4>
 1000f48:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1000f4b:	c1 e8 16             	shr    eax,0x16
 1000f4e:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1000f55:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000f58:	01 d0                	add    eax,edx
 1000f5a:	8b 00                	mov    eax,DWORD PTR [eax]
 1000f5c:	25 00 f0 ff ff       	and    eax,0xfffff000
 1000f61:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000f64:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1000f67:	25 ff ff 3f 00       	and    eax,0x3fffff
 1000f6c:	c1 e8 0c             	shr    eax,0xc
 1000f6f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1000f72:	e8 71 00 00 00       	call   1000fe8 <req_a_page>
 1000f77:	83 ec 0c             	sub    esp,0xc
 1000f7a:	50                   	push   eax
 1000f7b:	e8 c5 01 00 00       	call   1001145 <get_phyaddr>
 1000f80:	83 c4 10             	add    esp,0x10
 1000f83:	83 c8 05             	or     eax,0x5
 1000f86:	89 c1                	mov    ecx,eax
 1000f88:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000f8b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1000f92:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f95:	01 d0                	add    eax,edx
 1000f97:	8b 10                	mov    edx,DWORD PTR [eax]
 1000f99:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000f9c:	8d 1c 85 00 00 00 00 	lea    ebx,[eax*4+0x0]
 1000fa3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000fa6:	01 d8                	add    eax,ebx
 1000fa8:	09 ca                	or     edx,ecx
 1000faa:	89 10                	mov    DWORD PTR [eax],edx
 1000fac:	e8 48 1f 00 00       	call   1002ef9 <eoi>
 1000fb1:	fb                   	sti    
 1000fb2:	c9                   	leave  
 1000fb3:	83 c4 04             	add    esp,0x4
 1000fb6:	cf                   	iret   
 1000fb7:	90                   	nop
 1000fb8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000fbb:	c9                   	leave  
 1000fbc:	c3                   	ret    

01000fbd <init_memory>:
 1000fbd:	55                   	push   ebp
 1000fbe:	89 e5                	mov    ebp,esp
 1000fc0:	83 ec 10             	sub    esp,0x10
 1000fc3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1000fca:	eb 12                	jmp    1000fde <init_memory+0x21>
 1000fcc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000fcf:	c7 04 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],0xffffffff
 1000fd6:	ff ff ff ff 
 1000fda:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1000fde:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
 1000fe2:	7e e8                	jle    1000fcc <init_memory+0xf>
 1000fe4:	90                   	nop
 1000fe5:	90                   	nop
 1000fe6:	c9                   	leave  
 1000fe7:	c3                   	ret    

01000fe8 <req_a_page>:
 1000fe8:	55                   	push   ebp
 1000fe9:	89 e5                	mov    ebp,esp
 1000feb:	53                   	push   ebx
 1000fec:	83 ec 10             	sub    esp,0x10
 1000fef:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1000ff6:	e9 84 00 00 00       	jmp    100107f <req_a_page+0x97>
 1000ffb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001002:	eb 71                	jmp    1001075 <req_a_page+0x8d>
 1001004:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001007:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 100100e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001011:	bb 01 00 00 00       	mov    ebx,0x1
 1001016:	89 c1                	mov    ecx,eax
 1001018:	d3 e3                	shl    ebx,cl
 100101a:	89 d8                	mov    eax,ebx
 100101c:	21 d0                	and    eax,edx
 100101e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1001021:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001024:	c1 e0 05             	shl    eax,0x5
 1001027:	89 c2                	mov    edx,eax
 1001029:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100102c:	01 d0                	add    eax,edx
 100102e:	c1 e0 0c             	shl    eax,0xc
 1001031:	3d ff ff 0f 00       	cmp    eax,0xfffff
 1001036:	7e 39                	jle    1001071 <req_a_page+0x89>
 1001038:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 100103c:	75 33                	jne    1001071 <req_a_page+0x89>
 100103e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001041:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001048:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100104b:	bb 01 00 00 00       	mov    ebx,0x1
 1001050:	89 c1                	mov    ecx,eax
 1001052:	d3 e3                	shl    ebx,cl
 1001054:	89 d8                	mov    eax,ebx
 1001056:	09 c2                	or     edx,eax
 1001058:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100105b:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001062:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001065:	c1 e0 05             	shl    eax,0x5
 1001068:	89 c2                	mov    edx,eax
 100106a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100106d:	01 d0                	add    eax,edx
 100106f:	eb 18                	jmp    1001089 <req_a_page+0xa1>
 1001071:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001075:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 1001079:	7e 89                	jle    1001004 <req_a_page+0x1c>
 100107b:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 100107f:	83 7d f8 3f          	cmp    DWORD PTR [ebp-0x8],0x3f
 1001083:	0f 8e 72 ff ff ff    	jle    1000ffb <req_a_page+0x13>
 1001089:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 100108c:	c9                   	leave  
 100108d:	c3                   	ret    

0100108e <free_page>:
 100108e:	55                   	push   ebp
 100108f:	89 e5                	mov    ebp,esp
 1001091:	53                   	push   ebx
 1001092:	83 ec 10             	sub    esp,0x10
 1001095:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001098:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 100109e:	85 c0                	test   eax,eax
 10010a0:	0f 48 c2             	cmovs  eax,edx
 10010a3:	c1 f8 0c             	sar    eax,0xc
 10010a6:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10010a9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10010ac:	8d 50 1f             	lea    edx,[eax+0x1f]
 10010af:	85 c0                	test   eax,eax
 10010b1:	0f 48 c2             	cmovs  eax,edx
 10010b4:	c1 f8 05             	sar    eax,0x5
 10010b7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10010ba:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10010bd:	99                   	cdq    
 10010be:	c1 ea 1b             	shr    edx,0x1b
 10010c1:	01 d0                	add    eax,edx
 10010c3:	83 e0 1f             	and    eax,0x1f
 10010c6:	29 d0                	sub    eax,edx
 10010c8:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10010cb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010ce:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 10010d5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10010d8:	bb 01 00 00 00       	mov    ebx,0x1
 10010dd:	89 c1                	mov    ecx,eax
 10010df:	d3 e3                	shl    ebx,cl
 10010e1:	89 d8                	mov    eax,ebx
 10010e3:	f7 d0                	not    eax
 10010e5:	21 c2                	and    edx,eax
 10010e7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010ea:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 10010f1:	90                   	nop
 10010f2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 10010f5:	c9                   	leave  
 10010f6:	c3                   	ret    

010010f7 <check_page>:
 10010f7:	55                   	push   ebp
 10010f8:	89 e5                	mov    ebp,esp
 10010fa:	53                   	push   ebx
 10010fb:	83 ec 10             	sub    esp,0x10
 10010fe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001101:	8d 50 1f             	lea    edx,[eax+0x1f]
 1001104:	85 c0                	test   eax,eax
 1001106:	0f 48 c2             	cmovs  eax,edx
 1001109:	c1 f8 05             	sar    eax,0x5
 100110c:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 100110f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001112:	99                   	cdq    
 1001113:	c1 ea 1b             	shr    edx,0x1b
 1001116:	01 d0                	add    eax,edx
 1001118:	83 e0 1f             	and    eax,0x1f
 100111b:	29 d0                	sub    eax,edx
 100111d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001120:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001123:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 100112a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100112d:	bb 01 00 00 00       	mov    ebx,0x1
 1001132:	89 c1                	mov    ecx,eax
 1001134:	d3 e3                	shl    ebx,cl
 1001136:	89 d8                	mov    eax,ebx
 1001138:	21 d0                	and    eax,edx
 100113a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100113d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001140:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001143:	c9                   	leave  
 1001144:	c3                   	ret    

01001145 <get_phyaddr>:
 1001145:	55                   	push   ebp
 1001146:	89 e5                	mov    ebp,esp
 1001148:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100114b:	c1 e0 0c             	shl    eax,0xc
 100114e:	5d                   	pop    ebp
 100114f:	c3                   	ret    

01001150 <set_page_item>:
 1001150:	55                   	push   ebp
 1001151:	89 e5                	mov    ebp,esp
 1001153:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001156:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100115c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100115f:	8b 10                	mov    edx,DWORD PTR [eax]
 1001161:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001164:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001169:	09 c2                	or     edx,eax
 100116b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100116e:	89 10                	mov    DWORD PTR [eax],edx
 1001170:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001173:	8b 10                	mov    edx,DWORD PTR [eax]
 1001175:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001178:	09 c2                	or     edx,eax
 100117a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100117d:	89 10                	mov    DWORD PTR [eax],edx
 100117f:	90                   	nop
 1001180:	5d                   	pop    ebp
 1001181:	c3                   	ret    

01001182 <req_page_at>:
 1001182:	55                   	push   ebp
 1001183:	89 e5                	mov    ebp,esp
 1001185:	53                   	push   ebx
 1001186:	83 ec 14             	sub    esp,0x14
 1001189:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 100118d:	75 13                	jne    10011a2 <req_page_at+0x20>
 100118f:	e8 54 fe ff ff       	call   1000fe8 <req_a_page>
 1001194:	50                   	push   eax
 1001195:	e8 ab ff ff ff       	call   1001145 <get_phyaddr>
 100119a:	83 c4 04             	add    esp,0x4
 100119d:	e9 90 00 00 00       	jmp    1001232 <req_page_at+0xb0>
 10011a2:	83 ec 08             	sub    esp,0x8
 10011a5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10011a8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10011ab:	e8 28 01 00 00       	call   10012d8 <is_pgs_ava>
 10011b0:	83 c4 10             	add    esp,0x10
 10011b3:	85 c0                	test   eax,eax
 10011b5:	75 07                	jne    10011be <req_page_at+0x3c>
 10011b7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10011bc:	eb 74                	jmp    1001232 <req_page_at+0xb0>
 10011be:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10011c1:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10011c7:	85 c0                	test   eax,eax
 10011c9:	0f 48 c2             	cmovs  eax,edx
 10011cc:	c1 f8 0c             	sar    eax,0xc
 10011cf:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10011d2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10011d5:	8d 50 1f             	lea    edx,[eax+0x1f]
 10011d8:	85 c0                	test   eax,eax
 10011da:	0f 48 c2             	cmovs  eax,edx
 10011dd:	c1 f8 05             	sar    eax,0x5
 10011e0:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10011e3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10011e6:	99                   	cdq    
 10011e7:	c1 ea 1b             	shr    edx,0x1b
 10011ea:	01 d0                	add    eax,edx
 10011ec:	83 e0 1f             	and    eax,0x1f
 10011ef:	29 d0                	sub    eax,edx
 10011f1:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 10011f4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10011fb:	eb 28                	jmp    1001225 <req_page_at+0xa3>
 10011fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001200:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001207:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 100120a:	bb 01 00 00 00       	mov    ebx,0x1
 100120f:	89 c1                	mov    ecx,eax
 1001211:	d3 e3                	shl    ebx,cl
 1001213:	89 d8                	mov    eax,ebx
 1001215:	09 c2                	or     edx,eax
 1001217:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100121a:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001221:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001225:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001228:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 100122b:	7c d0                	jl     10011fd <req_page_at+0x7b>
 100122d:	b8 00 00 00 00       	mov    eax,0x0
 1001232:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001235:	c9                   	leave  
 1001236:	c3                   	ret    

01001237 <chk_vm>:
 1001237:	55                   	push   ebp
 1001238:	89 e5                	mov    ebp,esp
 100123a:	83 ec 10             	sub    esp,0x10
 100123d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001244:	0f 20 d8             	mov    eax,cr3
 1001247:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100124a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100124d:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 1001253:	85 c0                	test   eax,eax
 1001255:	0f 48 c2             	cmovs  eax,edx
 1001258:	c1 f8 16             	sar    eax,0x16
 100125b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001262:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001265:	01 d0                	add    eax,edx
 1001267:	8b 00                	mov    eax,DWORD PTR [eax]
 1001269:	25 00 f0 ff ff       	and    eax,0xfffff000
 100126e:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1001271:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001274:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 100127a:	85 c0                	test   eax,eax
 100127c:	0f 48 c2             	cmovs  eax,edx
 100127f:	c1 f8 16             	sar    eax,0x16
 1001282:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001289:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100128c:	01 d0                	add    eax,edx
 100128e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001290:	83 e0 01             	and    eax,0x1
 1001293:	85 c0                	test   eax,eax
 1001295:	74 33                	je     10012ca <chk_vm+0x93>
 1001297:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100129a:	99                   	cdq    
 100129b:	c1 ea 0a             	shr    edx,0xa
 100129e:	01 d0                	add    eax,edx
 10012a0:	25 ff ff 3f 00       	and    eax,0x3fffff
 10012a5:	29 d0                	sub    eax,edx
 10012a7:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10012ad:	85 c0                	test   eax,eax
 10012af:	0f 48 c2             	cmovs  eax,edx
 10012b2:	c1 f8 0c             	sar    eax,0xc
 10012b5:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10012bc:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10012bf:	01 d0                	add    eax,edx
 10012c1:	8b 00                	mov    eax,DWORD PTR [eax]
 10012c3:	83 e0 01             	and    eax,0x1
 10012c6:	85 c0                	test   eax,eax
 10012c8:	75 07                	jne    10012d1 <chk_vm+0x9a>
 10012ca:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10012cf:	eb 05                	jmp    10012d6 <chk_vm+0x9f>
 10012d1:	b8 00 00 00 00       	mov    eax,0x0
 10012d6:	c9                   	leave  
 10012d7:	c3                   	ret    

010012d8 <is_pgs_ava>:
 10012d8:	55                   	push   ebp
 10012d9:	89 e5                	mov    ebp,esp
 10012db:	83 ec 10             	sub    esp,0x10
 10012de:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012e1:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10012e7:	85 c0                	test   eax,eax
 10012e9:	0f 48 c2             	cmovs  eax,edx
 10012ec:	c1 f8 0c             	sar    eax,0xc
 10012ef:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10012f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10012f9:	eb 20                	jmp    100131b <is_pgs_ava+0x43>
 10012fb:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 10012fe:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001301:	01 d0                	add    eax,edx
 1001303:	50                   	push   eax
 1001304:	e8 ee fd ff ff       	call   10010f7 <check_page>
 1001309:	83 c4 04             	add    esp,0x4
 100130c:	85 c0                	test   eax,eax
 100130e:	74 07                	je     1001317 <is_pgs_ava+0x3f>
 1001310:	b8 00 00 00 00       	mov    eax,0x0
 1001315:	eb 11                	jmp    1001328 <is_pgs_ava+0x50>
 1001317:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100131b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100131e:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 1001321:	7c d8                	jl     10012fb <is_pgs_ava+0x23>
 1001323:	b8 01 00 00 00       	mov    eax,0x1
 1001328:	c9                   	leave  
 1001329:	c3                   	ret    

0100132a <setup_sys_vol>:
 100132a:	55                   	push   ebp
 100132b:	89 e5                	mov    ebp,esp
 100132d:	c6 05 40 01 40 00 43 	mov    BYTE PTR ds:0x400140,0x43
 1001334:	c6 05 41 01 40 00 00 	mov    BYTE PTR ds:0x400141,0x0
 100133b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100133e:	a3 48 01 40 00       	mov    ds:0x400148,eax
 1001343:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001346:	a3 4c 01 40 00       	mov    ds:0x40014c,eax
 100134b:	c7 05 50 01 40 00 01 	mov    DWORD PTR ds:0x400150,0x1
 1001352:	00 00 00 
 1001355:	b8 00 00 00 00       	mov    eax,0x0
 100135a:	5d                   	pop    ebp
 100135b:	c3                   	ret    

0100135c <sys_mkfifo>:
 100135c:	55                   	push   ebp
 100135d:	89 e5                	mov    ebp,esp
 100135f:	83 ec 18             	sub    esp,0x18
 1001362:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001369:	eb 30                	jmp    100139b <sys_mkfifo+0x3f>
 100136b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100136e:	c1 e0 04             	shl    eax,0x4
 1001371:	05 6c 15 40 00       	add    eax,0x40156c
 1001376:	8b 00                	mov    eax,DWORD PTR [eax]
 1001378:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 100137b:	75 1a                	jne    1001397 <sys_mkfifo+0x3b>
 100137d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001380:	c1 e0 04             	shl    eax,0x4
 1001383:	05 68 15 40 00       	add    eax,0x401568
 1001388:	8b 00                	mov    eax,DWORD PTR [eax]
 100138a:	83 f8 01             	cmp    eax,0x1
 100138d:	75 08                	jne    1001397 <sys_mkfifo+0x3b>
 100138f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001392:	e9 8a 00 00 00       	jmp    1001421 <sys_mkfifo+0xc5>
 1001397:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100139b:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 100139f:	7e ca                	jle    100136b <sys_mkfifo+0xf>
 10013a1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10013a8:	eb 6c                	jmp    1001416 <sys_mkfifo+0xba>
 10013aa:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10013ad:	c1 e0 04             	shl    eax,0x4
 10013b0:	05 68 15 40 00       	add    eax,0x401568
 10013b5:	8b 00                	mov    eax,DWORD PTR [eax]
 10013b7:	85 c0                	test   eax,eax
 10013b9:	75 57                	jne    1001412 <sys_mkfifo+0xb6>
 10013bb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10013be:	c1 e0 04             	shl    eax,0x4
 10013c1:	05 68 15 40 00       	add    eax,0x401568
 10013c6:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 10013cc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10013cf:	c1 e0 04             	shl    eax,0x4
 10013d2:	8d 90 6c 15 40 00    	lea    edx,[eax+0x40156c]
 10013d8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10013db:	89 02                	mov    DWORD PTR [edx],eax
 10013dd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10013e0:	c1 e0 04             	shl    eax,0x4
 10013e3:	05 64 15 40 00       	add    eax,0x401564
 10013e8:	c7 00 00 10 00 00    	mov    DWORD PTR [eax],0x1000
 10013ee:	e8 f5 fb ff ff       	call   1000fe8 <req_a_page>
 10013f3:	83 ec 0c             	sub    esp,0xc
 10013f6:	50                   	push   eax
 10013f7:	e8 49 fd ff ff       	call   1001145 <get_phyaddr>
 10013fc:	83 c4 10             	add    esp,0x10
 10013ff:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001402:	c1 e2 04             	shl    edx,0x4
 1001405:	81 c2 60 15 40 00    	add    edx,0x401560
 100140b:	89 02                	mov    DWORD PTR [edx],eax
 100140d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001410:	eb 0f                	jmp    1001421 <sys_mkfifo+0xc5>
 1001412:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001416:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 100141a:	7e 8e                	jle    10013aa <sys_mkfifo+0x4e>
 100141c:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001421:	c9                   	leave  
 1001422:	c3                   	ret    

01001423 <sys_rmfifo>:
 1001423:	55                   	push   ebp
 1001424:	89 e5                	mov    ebp,esp
 1001426:	83 ec 10             	sub    esp,0x10
 1001429:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001430:	eb 3e                	jmp    1001470 <sys_rmfifo+0x4d>
 1001432:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001435:	c1 e0 04             	shl    eax,0x4
 1001438:	05 6c 15 40 00       	add    eax,0x40156c
 100143d:	8b 00                	mov    eax,DWORD PTR [eax]
 100143f:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001442:	75 28                	jne    100146c <sys_rmfifo+0x49>
 1001444:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001447:	c1 e0 04             	shl    eax,0x4
 100144a:	05 68 15 40 00       	add    eax,0x401568
 100144f:	8b 00                	mov    eax,DWORD PTR [eax]
 1001451:	83 f8 01             	cmp    eax,0x1
 1001454:	75 16                	jne    100146c <sys_rmfifo+0x49>
 1001456:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001459:	c1 e0 04             	shl    eax,0x4
 100145c:	05 68 15 40 00       	add    eax,0x401568
 1001461:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1001467:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100146a:	eb 0f                	jmp    100147b <sys_rmfifo+0x58>
 100146c:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001470:	83 7d fc 0f          	cmp    DWORD PTR [ebp-0x4],0xf
 1001474:	7e bc                	jle    1001432 <sys_rmfifo+0xf>
 1001476:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100147b:	c9                   	leave  
 100147c:	c3                   	ret    

0100147d <free_vol>:
 100147d:	55                   	push   ebp
 100147e:	89 e5                	mov    ebp,esp
 1001480:	c7 05 50 01 40 00 00 	mov    DWORD PTR ds:0x400150,0x0
 1001487:	00 00 00 
 100148a:	b8 00 00 00 00       	mov    eax,0x0
 100148f:	5d                   	pop    ebp
 1001490:	c3                   	ret    

01001491 <reg_vol>:
 1001491:	55                   	push   ebp
 1001492:	89 e5                	mov    ebp,esp
 1001494:	83 ec 18             	sub    esp,0x18
 1001497:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100149e:	e9 a6 00 00 00       	jmp    1001549 <reg_vol+0xb8>
 10014a3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10014a6:	89 d0                	mov    eax,edx
 10014a8:	c1 e0 02             	shl    eax,0x2
 10014ab:	01 d0                	add    eax,edx
 10014ad:	c1 e0 02             	shl    eax,0x2
 10014b0:	05 50 01 40 00       	add    eax,0x400150
 10014b5:	8b 00                	mov    eax,DWORD PTR [eax]
 10014b7:	85 c0                	test   eax,eax
 10014b9:	0f 85 86 00 00 00    	jne    1001545 <reg_vol+0xb4>
 10014bf:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10014c2:	89 d0                	mov    eax,edx
 10014c4:	c1 e0 02             	shl    eax,0x2
 10014c7:	01 d0                	add    eax,edx
 10014c9:	c1 e0 02             	shl    eax,0x2
 10014cc:	05 50 01 40 00       	add    eax,0x400150
 10014d1:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 10014d7:	83 ec 0c             	sub    esp,0xc
 10014da:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10014dd:	e8 a2 0b 00 00       	call   1002084 <get_drv>
 10014e2:	83 c4 10             	add    esp,0x10
 10014e5:	89 c2                	mov    edx,eax
 10014e7:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 10014ea:	89 c8                	mov    eax,ecx
 10014ec:	c1 e0 02             	shl    eax,0x2
 10014ef:	01 c8                	add    eax,ecx
 10014f1:	c1 e0 02             	shl    eax,0x2
 10014f4:	05 4c 01 40 00       	add    eax,0x40014c
 10014f9:	89 10                	mov    DWORD PTR [eax],edx
 10014fb:	83 ec 0c             	sub    esp,0xc
 10014fe:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001501:	e8 7e 0b 00 00       	call   1002084 <get_drv>
 1001506:	83 c4 10             	add    esp,0x10
 1001509:	89 c2                	mov    edx,eax
 100150b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 100150e:	89 c8                	mov    eax,ecx
 1001510:	c1 e0 02             	shl    eax,0x2
 1001513:	01 c8                	add    eax,ecx
 1001515:	c1 e0 02             	shl    eax,0x2
 1001518:	05 48 01 40 00       	add    eax,0x400148
 100151d:	89 10                	mov    DWORD PTR [eax],edx
 100151f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001522:	89 d0                	mov    eax,edx
 1001524:	c1 e0 02             	shl    eax,0x2
 1001527:	01 d0                	add    eax,edx
 1001529:	c1 e0 02             	shl    eax,0x2
 100152c:	05 40 01 40 00       	add    eax,0x400140
 1001531:	83 ec 08             	sub    esp,0x8
 1001534:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001537:	50                   	push   eax
 1001538:	e8 da 50 00 00       	call   1006617 <strcpy>
 100153d:	83 c4 10             	add    esp,0x10
 1001540:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001543:	eb 13                	jmp    1001558 <reg_vol+0xc7>
 1001545:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001549:	83 7d f4 19          	cmp    DWORD PTR [ebp-0xc],0x19
 100154d:	0f 8e 50 ff ff ff    	jle    10014a3 <reg_vol+0x12>
 1001553:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001558:	c9                   	leave  
 1001559:	c3                   	ret    

0100155a <sys_open>:
 100155a:	55                   	push   ebp
 100155b:	89 e5                	mov    ebp,esp
 100155d:	57                   	push   edi
 100155e:	56                   	push   esi
 100155f:	53                   	push   ebx
 1001560:	81 ec fc 00 00 00    	sub    esp,0xfc
 1001566:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100156d:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1001574:	eb 19                	jmp    100158f <sys_open+0x35>
 1001576:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001579:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100157c:	01 d0                	add    eax,edx
 100157e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1001581:	8d 4d be             	lea    ecx,[ebp-0x42]
 1001584:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001587:	01 ca                	add    edx,ecx
 1001589:	88 02                	mov    BYTE PTR [edx],al
 100158b:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100158f:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001592:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001595:	01 d0                	add    eax,edx
 1001597:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100159a:	3c 2f                	cmp    al,0x2f
 100159c:	74 06                	je     10015a4 <sys_open+0x4a>
 100159e:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 10015a2:	7e d2                	jle    1001576 <sys_open+0x1c>
 10015a4:	8d 55 be             	lea    edx,[ebp-0x42]
 10015a7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10015aa:	01 d0                	add    eax,edx
 10015ac:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10015af:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10015b2:	8d 50 01             	lea    edx,[eax+0x1]
 10015b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10015b8:	01 d0                	add    eax,edx
 10015ba:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10015bd:	84 c0                	test   al,al
 10015bf:	75 0a                	jne    10015cb <sys_open+0x71>
 10015c1:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 10015c6:	e9 6f 02 00 00       	jmp    100183a <sys_open+0x2e0>
 10015cb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10015ce:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10015d1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10015d8:	eb 43                	jmp    100161d <sys_open+0xc3>
 10015da:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10015dd:	89 d0                	mov    eax,edx
 10015df:	c1 e0 02             	shl    eax,0x2
 10015e2:	01 d0                	add    eax,edx
 10015e4:	c1 e0 02             	shl    eax,0x2
 10015e7:	05 50 01 40 00       	add    eax,0x400150
 10015ec:	8b 00                	mov    eax,DWORD PTR [eax]
 10015ee:	85 c0                	test   eax,eax
 10015f0:	74 27                	je     1001619 <sys_open+0xbf>
 10015f2:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10015f5:	89 d0                	mov    eax,edx
 10015f7:	c1 e0 02             	shl    eax,0x2
 10015fa:	01 d0                	add    eax,edx
 10015fc:	c1 e0 02             	shl    eax,0x2
 10015ff:	8d 90 40 01 40 00    	lea    edx,[eax+0x400140]
 1001605:	83 ec 08             	sub    esp,0x8
 1001608:	8d 45 be             	lea    eax,[ebp-0x42]
 100160b:	50                   	push   eax
 100160c:	52                   	push   edx
 100160d:	e8 63 51 00 00       	call   1006775 <strcmp>
 1001612:	83 c4 10             	add    esp,0x10
 1001615:	85 c0                	test   eax,eax
 1001617:	74 0c                	je     1001625 <sys_open+0xcb>
 1001619:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100161d:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 1001621:	7e b7                	jle    10015da <sys_open+0x80>
 1001623:	eb 01                	jmp    1001626 <sys_open+0xcc>
 1001625:	90                   	nop
 1001626:	83 7d e4 1a          	cmp    DWORD PTR [ebp-0x1c],0x1a
 100162a:	75 0a                	jne    1001636 <sys_open+0xdc>
 100162c:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001631:	e9 04 02 00 00       	jmp    100183a <sys_open+0x2e0>
 1001636:	8d 85 42 ff ff ff    	lea    eax,[ebp-0xbe]
 100163c:	b9 7c 00 00 00       	mov    ecx,0x7c
 1001641:	bb 00 00 00 00       	mov    ebx,0x0
 1001646:	89 18                	mov    DWORD PTR [eax],ebx
 1001648:	89 5c 08 fc          	mov    DWORD PTR [eax+ecx*1-0x4],ebx
 100164c:	8d 50 04             	lea    edx,[eax+0x4]
 100164f:	83 e2 fc             	and    edx,0xfffffffc
 1001652:	29 d0                	sub    eax,edx
 1001654:	01 c1                	add    ecx,eax
 1001656:	83 e1 fc             	and    ecx,0xfffffffc
 1001659:	c1 e9 02             	shr    ecx,0x2
 100165c:	89 d7                	mov    edi,edx
 100165e:	89 d8                	mov    eax,ebx
 1001660:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001662:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1001665:	8d 50 01             	lea    edx,[eax+0x1]
 1001668:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100166b:	01 d0                	add    eax,edx
 100166d:	89 85 62 ff ff ff    	mov    DWORD PTR [ebp-0x9e],eax
 1001673:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001676:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1001679:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100167c:	89 d0                	mov    eax,edx
 100167e:	c1 e0 02             	shl    eax,0x2
 1001681:	01 d0                	add    eax,edx
 1001683:	c1 e0 02             	shl    eax,0x2
 1001686:	05 4c 01 40 00       	add    eax,0x40014c
 100168b:	8b 00                	mov    eax,DWORD PTR [eax]
 100168d:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1001690:	83 ec 0c             	sub    esp,0xc
 1001693:	8d 95 42 ff ff ff    	lea    edx,[ebp-0xbe]
 1001699:	52                   	push   edx
 100169a:	ff d0                	call   eax
 100169c:	83 c4 10             	add    esp,0x10
 100169f:	83 f8 ff             	cmp    eax,0xffffffff
 10016a2:	75 3f                	jne    10016e3 <sys_open+0x189>
 10016a4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10016a7:	83 e0 02             	and    eax,0x2
 10016aa:	85 c0                	test   eax,eax
 10016ac:	74 2b                	je     10016d9 <sys_open+0x17f>
 10016ae:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016b1:	89 d0                	mov    eax,edx
 10016b3:	c1 e0 02             	shl    eax,0x2
 10016b6:	01 d0                	add    eax,edx
 10016b8:	c1 e0 02             	shl    eax,0x2
 10016bb:	05 4c 01 40 00       	add    eax,0x40014c
 10016c0:	8b 00                	mov    eax,DWORD PTR [eax]
 10016c2:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 10016c5:	83 ec 0c             	sub    esp,0xc
 10016c8:	8d 95 42 ff ff ff    	lea    edx,[ebp-0xbe]
 10016ce:	52                   	push   edx
 10016cf:	ff d0                	call   eax
 10016d1:	83 c4 10             	add    esp,0x10
 10016d4:	e9 61 01 00 00       	jmp    100183a <sys_open+0x2e0>
 10016d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10016de:	e9 57 01 00 00       	jmp    100183a <sys_open+0x2e0>
 10016e3:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
 10016e9:	8d 95 66 ff ff ff    	lea    edx,[ebp-0x9a]
 10016ef:	b9 12 00 00 00       	mov    ecx,0x12
 10016f4:	89 c7                	mov    edi,eax
 10016f6:	89 d6                	mov    esi,edx
 10016f8:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10016fa:	c7 45 e0 ff ff ff ff 	mov    DWORD PTR [ebp-0x20],0xffffffff
 1001701:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001708:	eb 4b                	jmp    1001755 <sys_open+0x1fb>
 100170a:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100170d:	89 d0                	mov    eax,edx
 100170f:	c1 e0 03             	shl    eax,0x3
 1001712:	01 d0                	add    eax,edx
 1001714:	c1 e0 03             	shl    eax,0x3
 1001717:	05 68 03 40 00       	add    eax,0x400368
 100171c:	8b 00                	mov    eax,DWORD PTR [eax]
 100171e:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1001721:	75 2e                	jne    1001751 <sys_open+0x1f7>
 1001723:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001726:	89 d0                	mov    eax,edx
 1001728:	c1 e0 03             	shl    eax,0x3
 100172b:	01 d0                	add    eax,edx
 100172d:	c1 e0 03             	shl    eax,0x3
 1001730:	05 74 03 40 00       	add    eax,0x400374
 1001735:	8b 10                	mov    edx,DWORD PTR [eax]
 1001737:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [ebp-0xf4]
 100173d:	39 c2                	cmp    edx,eax
 100173f:	75 10                	jne    1001751 <sys_open+0x1f7>
 1001741:	83 7d 0c 02          	cmp    DWORD PTR [ebp+0xc],0x2
 1001745:	75 0a                	jne    1001751 <sys_open+0x1f7>
 1001747:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100174c:	e9 e9 00 00 00       	jmp    100183a <sys_open+0x2e0>
 1001751:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1001755:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 1001759:	7e af                	jle    100170a <sys_open+0x1b0>
 100175b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001762:	eb 24                	jmp    1001788 <sys_open+0x22e>
 1001764:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001767:	89 d0                	mov    eax,edx
 1001769:	c1 e0 03             	shl    eax,0x3
 100176c:	01 d0                	add    eax,edx
 100176e:	c1 e0 03             	shl    eax,0x3
 1001771:	05 64 03 40 00       	add    eax,0x400364
 1001776:	8b 00                	mov    eax,DWORD PTR [eax]
 1001778:	85 c0                	test   eax,eax
 100177a:	75 08                	jne    1001784 <sys_open+0x22a>
 100177c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100177f:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1001782:	eb 0a                	jmp    100178e <sys_open+0x234>
 1001784:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1001788:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 100178c:	7e d6                	jle    1001764 <sys_open+0x20a>
 100178e:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 1001792:	75 0a                	jne    100179e <sys_open+0x244>
 1001794:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001799:	e9 9c 00 00 00       	jmp    100183a <sys_open+0x2e0>
 100179e:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10017a1:	89 d0                	mov    eax,edx
 10017a3:	c1 e0 03             	shl    eax,0x3
 10017a6:	01 d0                	add    eax,edx
 10017a8:	c1 e0 03             	shl    eax,0x3
 10017ab:	05 60 03 40 00       	add    eax,0x400360
 10017b0:	89 c3                	mov    ebx,eax
 10017b2:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
 10017b8:	ba 12 00 00 00       	mov    edx,0x12
 10017bd:	89 df                	mov    edi,ebx
 10017bf:	89 c6                	mov    esi,eax
 10017c1:	89 d1                	mov    ecx,edx
 10017c3:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10017c5:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10017c8:	89 d0                	mov    eax,edx
 10017ca:	c1 e0 03             	shl    eax,0x3
 10017cd:	01 d0                	add    eax,edx
 10017cf:	c1 e0 03             	shl    eax,0x3
 10017d2:	8d 90 60 03 40 00    	lea    edx,[eax+0x400360]
 10017d8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10017db:	89 02                	mov    DWORD PTR [edx],eax
 10017dd:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10017e0:	89 d0                	mov    eax,edx
 10017e2:	c1 e0 03             	shl    eax,0x3
 10017e5:	01 d0                	add    eax,edx
 10017e7:	c1 e0 03             	shl    eax,0x3
 10017ea:	05 6c 03 40 00       	add    eax,0x40036c
 10017ef:	8b 00                	mov    eax,DWORD PTR [eax]
 10017f1:	8d 48 01             	lea    ecx,[eax+0x1]
 10017f4:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10017f7:	89 d0                	mov    eax,edx
 10017f9:	c1 e0 03             	shl    eax,0x3
 10017fc:	01 d0                	add    eax,edx
 10017fe:	c1 e0 03             	shl    eax,0x3
 1001801:	05 6c 03 40 00       	add    eax,0x40036c
 1001806:	89 08                	mov    DWORD PTR [eax],ecx
 1001808:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100180b:	89 d0                	mov    eax,edx
 100180d:	c1 e0 03             	shl    eax,0x3
 1001810:	01 d0                	add    eax,edx
 1001812:	c1 e0 03             	shl    eax,0x3
 1001815:	05 60 03 40 00       	add    eax,0x400360
 100181a:	83 ec 0c             	sub    esp,0xc
 100181d:	50                   	push   eax
 100181e:	e8 f9 12 00 00       	call   1002b1c <add_proc_openf>
 1001823:	83 c4 10             	add    esp,0x10
 1001826:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1001829:	89 d0                	mov    eax,edx
 100182b:	c1 e0 03             	shl    eax,0x3
 100182e:	01 d0                	add    eax,edx
 1001830:	c1 e0 03             	shl    eax,0x3
 1001833:	05 60 03 40 00       	add    eax,0x400360
 1001838:	8b 00                	mov    eax,DWORD PTR [eax]
 100183a:	8d 65 f4             	lea    esp,[ebp-0xc]
 100183d:	5b                   	pop    ebx
 100183e:	5e                   	pop    esi
 100183f:	5f                   	pop    edi
 1001840:	5d                   	pop    ebp
 1001841:	c3                   	ret    

01001842 <sys_close>:
 1001842:	55                   	push   ebp
 1001843:	89 e5                	mov    ebp,esp
 1001845:	83 ec 10             	sub    esp,0x10
 1001848:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100184f:	eb 4f                	jmp    10018a0 <sys_close+0x5e>
 1001851:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001854:	89 d0                	mov    eax,edx
 1001856:	c1 e0 03             	shl    eax,0x3
 1001859:	01 d0                	add    eax,edx
 100185b:	c1 e0 03             	shl    eax,0x3
 100185e:	05 60 03 40 00       	add    eax,0x400360
 1001863:	8b 00                	mov    eax,DWORD PTR [eax]
 1001865:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001868:	75 32                	jne    100189c <sys_close+0x5a>
 100186a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 100186d:	89 d0                	mov    eax,edx
 100186f:	c1 e0 03             	shl    eax,0x3
 1001872:	01 d0                	add    eax,edx
 1001874:	c1 e0 03             	shl    eax,0x3
 1001877:	05 6c 03 40 00       	add    eax,0x40036c
 100187c:	8b 00                	mov    eax,DWORD PTR [eax]
 100187e:	8d 48 ff             	lea    ecx,[eax-0x1]
 1001881:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001884:	89 d0                	mov    eax,edx
 1001886:	c1 e0 03             	shl    eax,0x3
 1001889:	01 d0                	add    eax,edx
 100188b:	c1 e0 03             	shl    eax,0x3
 100188e:	05 6c 03 40 00       	add    eax,0x40036c
 1001893:	89 08                	mov    DWORD PTR [eax],ecx
 1001895:	b8 00 00 00 00       	mov    eax,0x0
 100189a:	eb 0f                	jmp    10018ab <sys_close+0x69>
 100189c:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10018a0:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 10018a4:	7e ab                	jle    1001851 <sys_close+0xf>
 10018a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10018ab:	c9                   	leave  
 10018ac:	c3                   	ret    

010018ad <sys_write>:
 10018ad:	55                   	push   ebp
 10018ae:	89 e5                	mov    ebp,esp
 10018b0:	57                   	push   edi
 10018b1:	81 ec 84 00 00 00    	sub    esp,0x84
 10018b7:	83 ec 0c             	sub    esp,0xc
 10018ba:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10018bd:	e8 7a 01 00 00       	call   1001a3c <get_vfs_entry>
 10018c2:	83 c4 10             	add    esp,0x10
 10018c5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10018c8:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 10018cc:	75 07                	jne    10018d5 <sys_write+0x28>
 10018ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10018d3:	eb 58                	jmp    100192d <sys_write+0x80>
 10018d5:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 10018db:	b8 00 00 00 00       	mov    eax,0x0
 10018e0:	b9 1f 00 00 00       	mov    ecx,0x1f
 10018e5:	89 d7                	mov    edi,edx
 10018e7:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10018e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10018ec:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 10018ef:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10018f2:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
 10018f5:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10018f8:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 10018fb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10018fe:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001901:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001904:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001907:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 100190a:	89 d0                	mov    eax,edx
 100190c:	c1 e0 02             	shl    eax,0x2
 100190f:	01 d0                	add    eax,edx
 1001911:	c1 e0 02             	shl    eax,0x2
 1001914:	05 4c 01 40 00       	add    eax,0x40014c
 1001919:	8b 00                	mov    eax,DWORD PTR [eax]
 100191b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100191e:	83 ec 0c             	sub    esp,0xc
 1001921:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 1001927:	52                   	push   edx
 1001928:	ff d0                	call   eax
 100192a:	83 c4 10             	add    esp,0x10
 100192d:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1001930:	c9                   	leave  
 1001931:	c3                   	ret    

01001932 <sys_read>:
 1001932:	55                   	push   ebp
 1001933:	89 e5                	mov    ebp,esp
 1001935:	57                   	push   edi
 1001936:	56                   	push   esi
 1001937:	53                   	push   ebx
 1001938:	81 ec 8c 00 00 00    	sub    esp,0x8c
 100193e:	83 ec 0c             	sub    esp,0xc
 1001941:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001944:	e8 f3 00 00 00       	call   1001a3c <get_vfs_entry>
 1001949:	83 c4 10             	add    esp,0x10
 100194c:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 100194f:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1001953:	75 07                	jne    100195c <sys_read+0x2a>
 1001955:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100195a:	eb 73                	jmp    10019cf <sys_read+0x9d>
 100195c:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
 1001962:	b8 00 00 00 00       	mov    eax,0x0
 1001967:	b9 1f 00 00 00       	mov    ecx,0x1f
 100196c:	89 d7                	mov    edi,edx
 100196e:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001970:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001973:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 1001979:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 100197c:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 1001982:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1001985:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 1001988:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100198b:	8d 45 8c             	lea    eax,[ebp-0x74]
 100198e:	89 d3                	mov    ebx,edx
 1001990:	ba 12 00 00 00       	mov    edx,0x12
 1001995:	89 c7                	mov    edi,eax
 1001997:	89 de                	mov    esi,ebx
 1001999:	89 d1                	mov    ecx,edx
 100199b:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 100199d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10019a0:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 10019a3:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 10019a6:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10019a9:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10019ac:	89 d0                	mov    eax,edx
 10019ae:	c1 e0 02             	shl    eax,0x2
 10019b1:	01 d0                	add    eax,edx
 10019b3:	c1 e0 02             	shl    eax,0x2
 10019b6:	05 4c 01 40 00       	add    eax,0x40014c
 10019bb:	8b 00                	mov    eax,DWORD PTR [eax]
 10019bd:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 10019c0:	83 ec 0c             	sub    esp,0xc
 10019c3:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
 10019c9:	52                   	push   edx
 10019ca:	ff d0                	call   eax
 10019cc:	83 c4 10             	add    esp,0x10
 10019cf:	8d 65 f4             	lea    esp,[ebp-0xc]
 10019d2:	5b                   	pop    ebx
 10019d3:	5e                   	pop    esi
 10019d4:	5f                   	pop    edi
 10019d5:	5d                   	pop    ebp
 10019d6:	c3                   	ret    

010019d7 <sys_seek>:
 10019d7:	55                   	push   ebp
 10019d8:	89 e5                	mov    ebp,esp
 10019da:	83 ec 18             	sub    esp,0x18
 10019dd:	83 ec 0c             	sub    esp,0xc
 10019e0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10019e3:	e8 54 00 00 00       	call   1001a3c <get_vfs_entry>
 10019e8:	83 c4 10             	add    esp,0x10
 10019eb:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10019ee:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 10019f2:	75 07                	jne    10019fb <sys_seek+0x24>
 10019f4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10019f9:	eb 13                	jmp    1001a0e <sys_seek+0x37>
 10019fb:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 10019fe:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001a01:	01 c2                	add    edx,eax
 1001a03:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001a06:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
 1001a09:	b8 00 00 00 00       	mov    eax,0x0
 1001a0e:	c9                   	leave  
 1001a0f:	c3                   	ret    

01001a10 <sys_tell>:
 1001a10:	55                   	push   ebp
 1001a11:	89 e5                	mov    ebp,esp
 1001a13:	83 ec 18             	sub    esp,0x18
 1001a16:	83 ec 0c             	sub    esp,0xc
 1001a19:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001a1c:	e8 1b 00 00 00       	call   1001a3c <get_vfs_entry>
 1001a21:	83 c4 10             	add    esp,0x10
 1001a24:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001a27:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001a2b:	75 07                	jne    1001a34 <sys_tell+0x24>
 1001a2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001a32:	eb 06                	jmp    1001a3a <sys_tell+0x2a>
 1001a34:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001a37:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001a3a:	c9                   	leave  
 1001a3b:	c3                   	ret    

01001a3c <get_vfs_entry>:
 1001a3c:	55                   	push   ebp
 1001a3d:	89 e5                	mov    ebp,esp
 1001a3f:	83 ec 10             	sub    esp,0x10
 1001a42:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001a49:	eb 31                	jmp    1001a7c <get_vfs_entry+0x40>
 1001a4b:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001a4e:	89 d0                	mov    eax,edx
 1001a50:	c1 e0 03             	shl    eax,0x3
 1001a53:	01 d0                	add    eax,edx
 1001a55:	c1 e0 03             	shl    eax,0x3
 1001a58:	05 60 03 40 00       	add    eax,0x400360
 1001a5d:	8b 00                	mov    eax,DWORD PTR [eax]
 1001a5f:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001a62:	75 14                	jne    1001a78 <get_vfs_entry+0x3c>
 1001a64:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001a67:	89 d0                	mov    eax,edx
 1001a69:	c1 e0 03             	shl    eax,0x3
 1001a6c:	01 d0                	add    eax,edx
 1001a6e:	c1 e0 03             	shl    eax,0x3
 1001a71:	05 60 03 40 00       	add    eax,0x400360
 1001a76:	eb 0f                	jmp    1001a87 <get_vfs_entry+0x4b>
 1001a78:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001a7c:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1001a80:	7e c9                	jle    1001a4b <get_vfs_entry+0xf>
 1001a82:	b8 00 00 00 00       	mov    eax,0x0
 1001a87:	c9                   	leave  
 1001a88:	c3                   	ret    

01001a89 <init_drvdev_man>:
 1001a89:	55                   	push   ebp
 1001a8a:	89 e5                	mov    ebp,esp
 1001a8c:	90                   	nop
 1001a8d:	5d                   	pop    ebp
 1001a8e:	c3                   	ret    

01001a8f <load_driver>:
 1001a8f:	55                   	push   ebp
 1001a90:	89 e5                	mov    ebp,esp
 1001a92:	90                   	nop
 1001a93:	5d                   	pop    ebp
 1001a94:	c3                   	ret    

01001a95 <reg_device>:
 1001a95:	55                   	push   ebp
 1001a96:	89 e5                	mov    ebp,esp
 1001a98:	83 ec 10             	sub    esp,0x10
 1001a9b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001aa2:	e9 92 00 00 00       	jmp    1001b39 <reg_device+0xa4>
 1001aa7:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001aaa:	89 d0                	mov    eax,edx
 1001aac:	01 c0                	add    eax,eax
 1001aae:	01 d0                	add    eax,edx
 1001ab0:	c1 e0 04             	shl    eax,0x4
 1001ab3:	05 64 16 40 00       	add    eax,0x401664
 1001ab8:	8b 00                	mov    eax,DWORD PTR [eax]
 1001aba:	85 c0                	test   eax,eax
 1001abc:	75 77                	jne    1001b35 <reg_device+0xa0>
 1001abe:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001ac1:	89 d0                	mov    eax,edx
 1001ac3:	01 c0                	add    eax,eax
 1001ac5:	01 d0                	add    eax,edx
 1001ac7:	c1 e0 04             	shl    eax,0x4
 1001aca:	8d 90 60 16 40 00    	lea    edx,[eax+0x401660]
 1001ad0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001ad3:	8b 08                	mov    ecx,DWORD PTR [eax]
 1001ad5:	89 0a                	mov    DWORD PTR [edx],ecx
 1001ad7:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
 1001ada:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
 1001add:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
 1001ae0:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
 1001ae3:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
 1001ae6:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
 1001ae9:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1001aec:	89 4a 10             	mov    DWORD PTR [edx+0x10],ecx
 1001aef:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
 1001af2:	89 4a 14             	mov    DWORD PTR [edx+0x14],ecx
 1001af5:	8b 48 18             	mov    ecx,DWORD PTR [eax+0x18]
 1001af8:	89 4a 18             	mov    DWORD PTR [edx+0x18],ecx
 1001afb:	8b 48 1c             	mov    ecx,DWORD PTR [eax+0x1c]
 1001afe:	89 4a 1c             	mov    DWORD PTR [edx+0x1c],ecx
 1001b01:	8b 48 20             	mov    ecx,DWORD PTR [eax+0x20]
 1001b04:	89 4a 20             	mov    DWORD PTR [edx+0x20],ecx
 1001b07:	8b 48 24             	mov    ecx,DWORD PTR [eax+0x24]
 1001b0a:	89 4a 24             	mov    DWORD PTR [edx+0x24],ecx
 1001b0d:	8b 48 28             	mov    ecx,DWORD PTR [eax+0x28]
 1001b10:	89 4a 28             	mov    DWORD PTR [edx+0x28],ecx
 1001b13:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
 1001b16:	89 42 2c             	mov    DWORD PTR [edx+0x2c],eax
 1001b19:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001b1c:	89 d0                	mov    eax,edx
 1001b1e:	01 c0                	add    eax,eax
 1001b20:	01 d0                	add    eax,edx
 1001b22:	c1 e0 04             	shl    eax,0x4
 1001b25:	05 64 16 40 00       	add    eax,0x401664
 1001b2a:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001b30:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001b33:	eb 13                	jmp    1001b48 <reg_device+0xb3>
 1001b35:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001b39:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1001b3d:	0f 8e 64 ff ff ff    	jle    1001aa7 <reg_device+0x12>
 1001b43:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001b48:	c9                   	leave  
 1001b49:	c3                   	ret    

01001b4a <reg_driver>:
 1001b4a:	55                   	push   ebp
 1001b4b:	89 e5                	mov    ebp,esp
 1001b4d:	57                   	push   edi
 1001b4e:	56                   	push   esi
 1001b4f:	53                   	push   ebx
 1001b50:	83 ec 10             	sub    esp,0x10
 1001b53:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1001b5a:	eb 5e                	jmp    1001bba <reg_driver+0x70>
 1001b5c:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001b5f:	89 d0                	mov    eax,edx
 1001b61:	c1 e0 02             	shl    eax,0x2
 1001b64:	01 d0                	add    eax,edx
 1001b66:	c1 e0 04             	shl    eax,0x4
 1001b69:	05 60 22 40 00       	add    eax,0x402260
 1001b6e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001b70:	85 c0                	test   eax,eax
 1001b72:	75 42                	jne    1001bb6 <reg_driver+0x6c>
 1001b74:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001b77:	89 d0                	mov    eax,edx
 1001b79:	c1 e0 02             	shl    eax,0x2
 1001b7c:	01 d0                	add    eax,edx
 1001b7e:	c1 e0 04             	shl    eax,0x4
 1001b81:	8d 90 60 22 40 00    	lea    edx,[eax+0x402260]
 1001b87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001b8a:	89 c3                	mov    ebx,eax
 1001b8c:	b8 14 00 00 00       	mov    eax,0x14
 1001b91:	89 d7                	mov    edi,edx
 1001b93:	89 de                	mov    esi,ebx
 1001b95:	89 c1                	mov    ecx,eax
 1001b97:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001b99:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001b9c:	89 d0                	mov    eax,edx
 1001b9e:	c1 e0 02             	shl    eax,0x2
 1001ba1:	01 d0                	add    eax,edx
 1001ba3:	c1 e0 04             	shl    eax,0x4
 1001ba6:	05 60 22 40 00       	add    eax,0x402260
 1001bab:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001bb1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001bb4:	eb 0f                	jmp    1001bc5 <reg_driver+0x7b>
 1001bb6:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001bba:	83 7d f0 1f          	cmp    DWORD PTR [ebp-0x10],0x1f
 1001bbe:	7e 9c                	jle    1001b5c <reg_driver+0x12>
 1001bc0:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001bc5:	83 c4 10             	add    esp,0x10
 1001bc8:	5b                   	pop    ebx
 1001bc9:	5e                   	pop    esi
 1001bca:	5f                   	pop    edi
 1001bcb:	5d                   	pop    ebp
 1001bcc:	c3                   	ret    

01001bcd <sys_find_dev>:
 1001bcd:	55                   	push   ebp
 1001bce:	89 e5                	mov    ebp,esp
 1001bd0:	83 ec 18             	sub    esp,0x18
 1001bd3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001bda:	eb 47                	jmp    1001c23 <sys_find_dev+0x56>
 1001bdc:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001bdf:	89 d0                	mov    eax,edx
 1001be1:	01 c0                	add    eax,eax
 1001be3:	01 d0                	add    eax,edx
 1001be5:	c1 e0 04             	shl    eax,0x4
 1001be8:	05 64 16 40 00       	add    eax,0x401664
 1001bed:	8b 00                	mov    eax,DWORD PTR [eax]
 1001bef:	85 c0                	test   eax,eax
 1001bf1:	74 2c                	je     1001c1f <sys_find_dev+0x52>
 1001bf3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001bf6:	89 d0                	mov    eax,edx
 1001bf8:	01 c0                	add    eax,eax
 1001bfa:	01 d0                	add    eax,edx
 1001bfc:	c1 e0 04             	shl    eax,0x4
 1001bff:	05 60 16 40 00       	add    eax,0x401660
 1001c04:	83 c0 08             	add    eax,0x8
 1001c07:	83 ec 08             	sub    esp,0x8
 1001c0a:	50                   	push   eax
 1001c0b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001c0e:	e8 62 4b 00 00       	call   1006775 <strcmp>
 1001c13:	83 c4 10             	add    esp,0x10
 1001c16:	85 c0                	test   eax,eax
 1001c18:	75 05                	jne    1001c1f <sys_find_dev+0x52>
 1001c1a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001c1d:	eb 0f                	jmp    1001c2e <sys_find_dev+0x61>
 1001c1f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001c23:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001c27:	7e b3                	jle    1001bdc <sys_find_dev+0xf>
 1001c29:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001c2e:	c9                   	leave  
 1001c2f:	c3                   	ret    

01001c30 <sys_operate_dev>:
 1001c30:	55                   	push   ebp
 1001c31:	89 e5                	mov    ebp,esp
 1001c33:	83 ec 18             	sub    esp,0x18
 1001c36:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001c3d:	eb 42                	jmp    1001c81 <sys_operate_dev+0x51>
 1001c3f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001c42:	89 d0                	mov    eax,edx
 1001c44:	01 c0                	add    eax,eax
 1001c46:	01 d0                	add    eax,edx
 1001c48:	c1 e0 04             	shl    eax,0x4
 1001c4b:	05 64 16 40 00       	add    eax,0x401664
 1001c50:	8b 00                	mov    eax,DWORD PTR [eax]
 1001c52:	85 c0                	test   eax,eax
 1001c54:	74 27                	je     1001c7d <sys_operate_dev+0x4d>
 1001c56:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001c59:	89 d0                	mov    eax,edx
 1001c5b:	01 c0                	add    eax,eax
 1001c5d:	01 d0                	add    eax,edx
 1001c5f:	c1 e0 04             	shl    eax,0x4
 1001c62:	05 60 16 40 00       	add    eax,0x401660
 1001c67:	83 c0 08             	add    eax,0x8
 1001c6a:	83 ec 08             	sub    esp,0x8
 1001c6d:	50                   	push   eax
 1001c6e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001c71:	e8 ff 4a 00 00       	call   1006775 <strcmp>
 1001c76:	83 c4 10             	add    esp,0x10
 1001c79:	85 c0                	test   eax,eax
 1001c7b:	74 0c                	je     1001c89 <sys_operate_dev+0x59>
 1001c7d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001c81:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001c85:	7e b8                	jle    1001c3f <sys_operate_dev+0xf>
 1001c87:	eb 01                	jmp    1001c8a <sys_operate_dev+0x5a>
 1001c89:	90                   	nop
 1001c8a:	83 7d f4 40          	cmp    DWORD PTR [ebp-0xc],0x40
 1001c8e:	75 0a                	jne    1001c9a <sys_operate_dev+0x6a>
 1001c90:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001c95:	e9 da 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001c9a:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 1001c9e:	0f 87 cb 01 00 00    	ja     1001e6f <sys_operate_dev+0x23f>
 1001ca4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001ca7:	c1 e0 02             	shl    eax,0x2
 1001caa:	05 18 70 00 01       	add    eax,0x1007018
 1001caf:	8b 00                	mov    eax,DWORD PTR [eax]
 1001cb1:	ff e0                	jmp    eax
 1001cb3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001cb6:	89 d0                	mov    eax,edx
 1001cb8:	01 c0                	add    eax,eax
 1001cba:	01 d0                	add    eax,edx
 1001cbc:	c1 e0 04             	shl    eax,0x4
 1001cbf:	05 8c 16 40 00       	add    eax,0x40168c
 1001cc4:	8b 00                	mov    eax,DWORD PTR [eax]
 1001cc6:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1001cc9:	83 ec 0c             	sub    esp,0xc
 1001ccc:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ccf:	ff d0                	call   eax
 1001cd1:	83 c4 10             	add    esp,0x10
 1001cd4:	e9 9b 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001cd9:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001cdc:	89 d0                	mov    eax,edx
 1001cde:	01 c0                	add    eax,eax
 1001ce0:	01 d0                	add    eax,edx
 1001ce2:	c1 e0 04             	shl    eax,0x4
 1001ce5:	05 8c 16 40 00       	add    eax,0x40168c
 1001cea:	8b 00                	mov    eax,DWORD PTR [eax]
 1001cec:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1001cef:	83 ec 0c             	sub    esp,0xc
 1001cf2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001cf5:	ff d0                	call   eax
 1001cf7:	83 c4 10             	add    esp,0x10
 1001cfa:	e9 75 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001cff:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d02:	89 d0                	mov    eax,edx
 1001d04:	01 c0                	add    eax,eax
 1001d06:	01 d0                	add    eax,edx
 1001d08:	c1 e0 04             	shl    eax,0x4
 1001d0b:	05 8c 16 40 00       	add    eax,0x40168c
 1001d10:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d12:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1001d15:	83 ec 0c             	sub    esp,0xc
 1001d18:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001d1b:	ff d0                	call   eax
 1001d1d:	83 c4 10             	add    esp,0x10
 1001d20:	e9 4f 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001d25:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d28:	89 d0                	mov    eax,edx
 1001d2a:	01 c0                	add    eax,eax
 1001d2c:	01 d0                	add    eax,edx
 1001d2e:	c1 e0 04             	shl    eax,0x4
 1001d31:	05 8c 16 40 00       	add    eax,0x40168c
 1001d36:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d38:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1001d3b:	83 ec 0c             	sub    esp,0xc
 1001d3e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001d41:	ff d0                	call   eax
 1001d43:	83 c4 10             	add    esp,0x10
 1001d46:	e9 29 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001d4b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d4e:	89 d0                	mov    eax,edx
 1001d50:	01 c0                	add    eax,eax
 1001d52:	01 d0                	add    eax,edx
 1001d54:	c1 e0 04             	shl    eax,0x4
 1001d57:	05 8c 16 40 00       	add    eax,0x40168c
 1001d5c:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d5e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001d61:	83 ec 0c             	sub    esp,0xc
 1001d64:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001d67:	ff d0                	call   eax
 1001d69:	83 c4 10             	add    esp,0x10
 1001d6c:	e9 03 01 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001d71:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d74:	89 d0                	mov    eax,edx
 1001d76:	01 c0                	add    eax,eax
 1001d78:	01 d0                	add    eax,edx
 1001d7a:	c1 e0 04             	shl    eax,0x4
 1001d7d:	05 8c 16 40 00       	add    eax,0x40168c
 1001d82:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d84:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001d87:	83 ec 0c             	sub    esp,0xc
 1001d8a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001d8d:	ff d0                	call   eax
 1001d8f:	83 c4 10             	add    esp,0x10
 1001d92:	e9 dd 00 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001d97:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d9a:	89 d0                	mov    eax,edx
 1001d9c:	01 c0                	add    eax,eax
 1001d9e:	01 d0                	add    eax,edx
 1001da0:	c1 e0 04             	shl    eax,0x4
 1001da3:	05 8c 16 40 00       	add    eax,0x40168c
 1001da8:	8b 00                	mov    eax,DWORD PTR [eax]
 1001daa:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1001dad:	83 ec 0c             	sub    esp,0xc
 1001db0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001db3:	ff d0                	call   eax
 1001db5:	83 c4 10             	add    esp,0x10
 1001db8:	e9 b7 00 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001dbd:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001dc0:	89 d0                	mov    eax,edx
 1001dc2:	01 c0                	add    eax,eax
 1001dc4:	01 d0                	add    eax,edx
 1001dc6:	c1 e0 04             	shl    eax,0x4
 1001dc9:	05 8c 16 40 00       	add    eax,0x40168c
 1001dce:	8b 00                	mov    eax,DWORD PTR [eax]
 1001dd0:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1001dd3:	83 ec 0c             	sub    esp,0xc
 1001dd6:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001dd9:	ff d0                	call   eax
 1001ddb:	83 c4 10             	add    esp,0x10
 1001dde:	e9 91 00 00 00       	jmp    1001e74 <sys_operate_dev+0x244>
 1001de3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001de6:	89 d0                	mov    eax,edx
 1001de8:	01 c0                	add    eax,eax
 1001dea:	01 d0                	add    eax,edx
 1001dec:	c1 e0 04             	shl    eax,0x4
 1001def:	05 8c 16 40 00       	add    eax,0x40168c
 1001df4:	8b 00                	mov    eax,DWORD PTR [eax]
 1001df6:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 1001df9:	83 ec 0c             	sub    esp,0xc
 1001dfc:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001dff:	ff d0                	call   eax
 1001e01:	83 c4 10             	add    esp,0x10
 1001e04:	eb 6e                	jmp    1001e74 <sys_operate_dev+0x244>
 1001e06:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e09:	89 d0                	mov    eax,edx
 1001e0b:	01 c0                	add    eax,eax
 1001e0d:	01 d0                	add    eax,edx
 1001e0f:	c1 e0 04             	shl    eax,0x4
 1001e12:	05 8c 16 40 00       	add    eax,0x40168c
 1001e17:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e19:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 1001e1c:	83 ec 0c             	sub    esp,0xc
 1001e1f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e22:	ff d0                	call   eax
 1001e24:	83 c4 10             	add    esp,0x10
 1001e27:	eb 4b                	jmp    1001e74 <sys_operate_dev+0x244>
 1001e29:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e2c:	89 d0                	mov    eax,edx
 1001e2e:	01 c0                	add    eax,eax
 1001e30:	01 d0                	add    eax,edx
 1001e32:	c1 e0 04             	shl    eax,0x4
 1001e35:	05 8c 16 40 00       	add    eax,0x40168c
 1001e3a:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e3c:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
 1001e3f:	83 ec 0c             	sub    esp,0xc
 1001e42:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e45:	ff d0                	call   eax
 1001e47:	83 c4 10             	add    esp,0x10
 1001e4a:	eb 28                	jmp    1001e74 <sys_operate_dev+0x244>
 1001e4c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e4f:	89 d0                	mov    eax,edx
 1001e51:	01 c0                	add    eax,eax
 1001e53:	01 d0                	add    eax,edx
 1001e55:	c1 e0 04             	shl    eax,0x4
 1001e58:	05 8c 16 40 00       	add    eax,0x40168c
 1001e5d:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e5f:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
 1001e62:	83 ec 0c             	sub    esp,0xc
 1001e65:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e68:	ff d0                	call   eax
 1001e6a:	83 c4 10             	add    esp,0x10
 1001e6d:	eb 05                	jmp    1001e74 <sys_operate_dev+0x244>
 1001e6f:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001e74:	c9                   	leave  
 1001e75:	c3                   	ret    

01001e76 <call_drv_func>:
 1001e76:	55                   	push   ebp
 1001e77:	89 e5                	mov    ebp,esp
 1001e79:	83 ec 08             	sub    esp,0x8
 1001e7c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001e7f:	89 d0                	mov    eax,edx
 1001e81:	c1 e0 02             	shl    eax,0x2
 1001e84:	01 d0                	add    eax,edx
 1001e86:	c1 e0 04             	shl    eax,0x4
 1001e89:	05 60 22 40 00       	add    eax,0x402260
 1001e8e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e90:	85 c0                	test   eax,eax
 1001e92:	75 0a                	jne    1001e9e <call_drv_func+0x28>
 1001e94:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001e99:	e9 c2 01 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001e9e:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 1001ea2:	0f 87 b3 01 00 00    	ja     100205b <call_drv_func+0x1e5>
 1001ea8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001eab:	c1 e0 02             	shl    eax,0x2
 1001eae:	05 48 70 00 01       	add    eax,0x1007048
 1001eb3:	8b 00                	mov    eax,DWORD PTR [eax]
 1001eb5:	ff e0                	jmp    eax
 1001eb7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001eba:	89 d0                	mov    eax,edx
 1001ebc:	c1 e0 02             	shl    eax,0x2
 1001ebf:	01 d0                	add    eax,edx
 1001ec1:	c1 e0 04             	shl    eax,0x4
 1001ec4:	05 64 22 40 00       	add    eax,0x402264
 1001ec9:	8b 00                	mov    eax,DWORD PTR [eax]
 1001ecb:	83 ec 0c             	sub    esp,0xc
 1001ece:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ed1:	ff d0                	call   eax
 1001ed3:	83 c4 10             	add    esp,0x10
 1001ed6:	e9 85 01 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001edb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001ede:	89 d0                	mov    eax,edx
 1001ee0:	c1 e0 02             	shl    eax,0x2
 1001ee3:	01 d0                	add    eax,edx
 1001ee5:	c1 e0 04             	shl    eax,0x4
 1001ee8:	05 68 22 40 00       	add    eax,0x402268
 1001eed:	8b 00                	mov    eax,DWORD PTR [eax]
 1001eef:	83 ec 0c             	sub    esp,0xc
 1001ef2:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ef5:	ff d0                	call   eax
 1001ef7:	83 c4 10             	add    esp,0x10
 1001efa:	e9 61 01 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001eff:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001f02:	89 d0                	mov    eax,edx
 1001f04:	c1 e0 02             	shl    eax,0x2
 1001f07:	01 d0                	add    eax,edx
 1001f09:	c1 e0 04             	shl    eax,0x4
 1001f0c:	05 6c 22 40 00       	add    eax,0x40226c
 1001f11:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f13:	83 ec 0c             	sub    esp,0xc
 1001f16:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f19:	ff d0                	call   eax
 1001f1b:	83 c4 10             	add    esp,0x10
 1001f1e:	e9 3d 01 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001f23:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001f26:	89 d0                	mov    eax,edx
 1001f28:	c1 e0 02             	shl    eax,0x2
 1001f2b:	01 d0                	add    eax,edx
 1001f2d:	c1 e0 04             	shl    eax,0x4
 1001f30:	05 70 22 40 00       	add    eax,0x402270
 1001f35:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f37:	83 ec 0c             	sub    esp,0xc
 1001f3a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f3d:	ff d0                	call   eax
 1001f3f:	83 c4 10             	add    esp,0x10
 1001f42:	e9 19 01 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001f47:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001f4a:	89 d0                	mov    eax,edx
 1001f4c:	c1 e0 02             	shl    eax,0x2
 1001f4f:	01 d0                	add    eax,edx
 1001f51:	c1 e0 04             	shl    eax,0x4
 1001f54:	05 74 22 40 00       	add    eax,0x402274
 1001f59:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f5b:	83 ec 0c             	sub    esp,0xc
 1001f5e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f61:	ff d0                	call   eax
 1001f63:	83 c4 10             	add    esp,0x10
 1001f66:	e9 f5 00 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001f6b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001f6e:	89 d0                	mov    eax,edx
 1001f70:	c1 e0 02             	shl    eax,0x2
 1001f73:	01 d0                	add    eax,edx
 1001f75:	c1 e0 04             	shl    eax,0x4
 1001f78:	05 78 22 40 00       	add    eax,0x402278
 1001f7d:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f7f:	83 ec 0c             	sub    esp,0xc
 1001f82:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f85:	ff d0                	call   eax
 1001f87:	83 c4 10             	add    esp,0x10
 1001f8a:	e9 d1 00 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001f8f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001f92:	89 d0                	mov    eax,edx
 1001f94:	c1 e0 02             	shl    eax,0x2
 1001f97:	01 d0                	add    eax,edx
 1001f99:	c1 e0 04             	shl    eax,0x4
 1001f9c:	05 7c 22 40 00       	add    eax,0x40227c
 1001fa1:	8b 00                	mov    eax,DWORD PTR [eax]
 1001fa3:	83 ec 0c             	sub    esp,0xc
 1001fa6:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001fa9:	ff d0                	call   eax
 1001fab:	83 c4 10             	add    esp,0x10
 1001fae:	e9 ad 00 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001fb3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001fb6:	89 d0                	mov    eax,edx
 1001fb8:	c1 e0 02             	shl    eax,0x2
 1001fbb:	01 d0                	add    eax,edx
 1001fbd:	c1 e0 04             	shl    eax,0x4
 1001fc0:	05 80 22 40 00       	add    eax,0x402280
 1001fc5:	8b 00                	mov    eax,DWORD PTR [eax]
 1001fc7:	83 ec 0c             	sub    esp,0xc
 1001fca:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001fcd:	ff d0                	call   eax
 1001fcf:	83 c4 10             	add    esp,0x10
 1001fd2:	e9 89 00 00 00       	jmp    1002060 <call_drv_func+0x1ea>
 1001fd7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001fda:	89 d0                	mov    eax,edx
 1001fdc:	c1 e0 02             	shl    eax,0x2
 1001fdf:	01 d0                	add    eax,edx
 1001fe1:	c1 e0 04             	shl    eax,0x4
 1001fe4:	05 84 22 40 00       	add    eax,0x402284
 1001fe9:	8b 00                	mov    eax,DWORD PTR [eax]
 1001feb:	83 ec 0c             	sub    esp,0xc
 1001fee:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ff1:	ff d0                	call   eax
 1001ff3:	83 c4 10             	add    esp,0x10
 1001ff6:	eb 68                	jmp    1002060 <call_drv_func+0x1ea>
 1001ff8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001ffb:	89 d0                	mov    eax,edx
 1001ffd:	c1 e0 02             	shl    eax,0x2
 1002000:	01 d0                	add    eax,edx
 1002002:	c1 e0 04             	shl    eax,0x4
 1002005:	05 88 22 40 00       	add    eax,0x402288
 100200a:	8b 00                	mov    eax,DWORD PTR [eax]
 100200c:	83 ec 0c             	sub    esp,0xc
 100200f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002012:	ff d0                	call   eax
 1002014:	83 c4 10             	add    esp,0x10
 1002017:	eb 47                	jmp    1002060 <call_drv_func+0x1ea>
 1002019:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100201c:	89 d0                	mov    eax,edx
 100201e:	c1 e0 02             	shl    eax,0x2
 1002021:	01 d0                	add    eax,edx
 1002023:	c1 e0 04             	shl    eax,0x4
 1002026:	05 8c 22 40 00       	add    eax,0x40228c
 100202b:	8b 00                	mov    eax,DWORD PTR [eax]
 100202d:	83 ec 0c             	sub    esp,0xc
 1002030:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002033:	ff d0                	call   eax
 1002035:	83 c4 10             	add    esp,0x10
 1002038:	eb 26                	jmp    1002060 <call_drv_func+0x1ea>
 100203a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100203d:	89 d0                	mov    eax,edx
 100203f:	c1 e0 02             	shl    eax,0x2
 1002042:	01 d0                	add    eax,edx
 1002044:	c1 e0 04             	shl    eax,0x4
 1002047:	05 90 22 40 00       	add    eax,0x402290
 100204c:	8b 00                	mov    eax,DWORD PTR [eax]
 100204e:	83 ec 0c             	sub    esp,0xc
 1002051:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002054:	ff d0                	call   eax
 1002056:	83 c4 10             	add    esp,0x10
 1002059:	eb 05                	jmp    1002060 <call_drv_func+0x1ea>
 100205b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002060:	c9                   	leave  
 1002061:	c3                   	ret    

01002062 <dispose_device>:
 1002062:	55                   	push   ebp
 1002063:	89 e5                	mov    ebp,esp
 1002065:	90                   	nop
 1002066:	5d                   	pop    ebp
 1002067:	c3                   	ret    

01002068 <dispose_driver>:
 1002068:	55                   	push   ebp
 1002069:	89 e5                	mov    ebp,esp
 100206b:	90                   	nop
 100206c:	5d                   	pop    ebp
 100206d:	c3                   	ret    

0100206e <get_dev>:
 100206e:	55                   	push   ebp
 100206f:	89 e5                	mov    ebp,esp
 1002071:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002074:	89 d0                	mov    eax,edx
 1002076:	01 c0                	add    eax,eax
 1002078:	01 d0                	add    eax,edx
 100207a:	c1 e0 04             	shl    eax,0x4
 100207d:	05 60 16 40 00       	add    eax,0x401660
 1002082:	5d                   	pop    ebp
 1002083:	c3                   	ret    

01002084 <get_drv>:
 1002084:	55                   	push   ebp
 1002085:	89 e5                	mov    ebp,esp
 1002087:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100208a:	89 d0                	mov    eax,edx
 100208c:	c1 e0 02             	shl    eax,0x2
 100208f:	01 d0                	add    eax,edx
 1002091:	c1 e0 04             	shl    eax,0x4
 1002094:	05 60 22 40 00       	add    eax,0x402260
 1002099:	5d                   	pop    ebp
 100209a:	c3                   	ret    

0100209b <init_proc>:
 100209b:	55                   	push   ebp
 100209c:	89 e5                	mov    ebp,esp
 100209e:	83 ec 18             	sub    esp,0x18
 10020a1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10020a8:	eb 40                	jmp    10020ea <init_proc+0x4f>
 10020aa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020ad:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10020b3:	05 60 2c 40 00       	add    eax,0x402c60
 10020b8:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 10020be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020c1:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10020c7:	05 64 2c 40 00       	add    eax,0x402c64
 10020cc:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 10020d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10020d5:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10020db:	05 c0 2c 40 00       	add    eax,0x402cc0
 10020e0:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 10020e6:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10020ea:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 10020ee:	7e ba                	jle    10020aa <init_proc+0xf>
 10020f0:	c7 05 c8 8a 40 00 00 	mov    DWORD PTR ds:0x408ac8,0x0
 10020f7:	00 00 00 
 10020fa:	c7 05 cc 8a 40 00 01 	mov    DWORD PTR ds:0x408acc,0x1
 1002101:	00 00 00 
 1002104:	e8 3c 00 00 00       	call   1002145 <create_proc>
 1002109:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100210c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100210f:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002115:	05 64 2c 40 00       	add    eax,0x402c64
 100211a:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002120:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002123:	83 c0 03             	add    eax,0x3
 1002126:	c1 e0 04             	shl    eax,0x4
 1002129:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 100212c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100212f:	01 c0                	add    eax,eax
 1002131:	83 c0 05             	add    eax,0x5
 1002134:	c1 e0 03             	shl    eax,0x3
 1002137:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100213a:	0f 00 55 ec          	lldt   WORD PTR [ebp-0x14]
 100213e:	0f 00 5d f0          	ltr    WORD PTR [ebp-0x10]
 1002142:	90                   	nop
 1002143:	c9                   	leave  
 1002144:	c3                   	ret    

01002145 <create_proc>:
 1002145:	55                   	push   ebp
 1002146:	89 e5                	mov    ebp,esp
 1002148:	83 ec 18             	sub    esp,0x18
 100214b:	e8 5f 00 00 00       	call   10021af <req_proc>
 1002150:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002153:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002157:	75 07                	jne    1002160 <create_proc+0x1b>
 1002159:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100215e:	eb 4d                	jmp    10021ad <create_proc+0x68>
 1002160:	c7 45 f0 ff fb 09 00 	mov    DWORD PTR [ebp-0x10],0x9fbff
 1002167:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
 100216a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100216d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002170:	6a 00                	push   0x0
 1002172:	6a 00                	push   0x0
 1002174:	6a 00                	push   0x0
 1002176:	6a 00                	push   0x0
 1002178:	50                   	push   eax
 1002179:	6a 17                	push   0x17
 100217b:	6a 17                	push   0x17
 100217d:	6a 17                	push   0x17
 100217f:	6a 17                	push   0x17
 1002181:	6a 0f                	push   0xf
 1002183:	6a 17                	push   0x17
 1002185:	6a 00                	push   0x0
 1002187:	6a 00                	push   0x0
 1002189:	6a 00                	push   0x0
 100218b:	6a 00                	push   0x0
 100218d:	e8 ce 00 00 00       	call   1002260 <set_proc>
 1002192:	83 c4 40             	add    esp,0x40
 1002195:	ba 5f 24 00 01       	mov    edx,0x100245f
 100219a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100219d:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10021a3:	05 90 2d 40 00       	add    eax,0x402d90
 10021a8:	89 10                	mov    DWORD PTR [eax],edx
 10021aa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10021ad:	c9                   	leave  
 10021ae:	c3                   	ret    

010021af <req_proc>:
 10021af:	55                   	push   ebp
 10021b0:	89 e5                	mov    ebp,esp
 10021b2:	83 ec 10             	sub    esp,0x10
 10021b5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10021bc:	eb 04                	jmp    10021c2 <req_proc+0x13>
 10021be:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10021c2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10021c5:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10021cb:	05 60 2c 40 00       	add    eax,0x402c60
 10021d0:	8b 00                	mov    eax,DWORD PTR [eax]
 10021d2:	83 f8 ff             	cmp    eax,0xffffffff
 10021d5:	74 1b                	je     10021f2 <req_proc+0x43>
 10021d7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10021da:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10021e0:	05 64 2c 40 00       	add    eax,0x402c64
 10021e5:	8b 00                	mov    eax,DWORD PTR [eax]
 10021e7:	83 f8 03             	cmp    eax,0x3
 10021ea:	74 06                	je     10021f2 <req_proc+0x43>
 10021ec:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 10021f0:	7e cc                	jle    10021be <req_proc+0xf>
 10021f2:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 10021f6:	7e 07                	jle    10021ff <req_proc+0x50>
 10021f8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10021fd:	eb 5f                	jmp    100225e <req_proc+0xaf>
 10021ff:	a1 cc 8a 40 00       	mov    eax,ds:0x408acc
 1002204:	8d 50 01             	lea    edx,[eax+0x1]
 1002207:	89 15 cc 8a 40 00    	mov    DWORD PTR ds:0x408acc,edx
 100220d:	89 c2                	mov    edx,eax
 100220f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002212:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002218:	05 60 2c 40 00       	add    eax,0x402c60
 100221d:	89 10                	mov    DWORD PTR [eax],edx
 100221f:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002222:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002228:	05 64 2c 40 00       	add    eax,0x402c64
 100222d:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 1002233:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002236:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100223c:	05 68 2c 40 00       	add    eax,0x402c68
 1002241:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002247:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100224a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002250:	05 6c 2c 40 00       	add    eax,0x402c6c
 1002255:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100225b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100225e:	c9                   	leave  
 100225f:	c3                   	ret    

01002260 <set_proc>:
 1002260:	55                   	push   ebp
 1002261:	89 e5                	mov    ebp,esp
 1002263:	83 ec 18             	sub    esp,0x18
 1002266:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 1002269:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100226f:	05 60 2c 40 00       	add    eax,0x402c60
 1002274:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002277:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100227a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100227d:	89 90 38 01 00 00    	mov    DWORD PTR [eax+0x138],edx
 1002283:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002286:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1002289:	89 90 44 01 00 00    	mov    DWORD PTR [eax+0x144],edx
 100228f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002292:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 1002295:	89 90 3c 01 00 00    	mov    DWORD PTR [eax+0x13c],edx
 100229b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100229e:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10022a1:	89 90 40 01 00 00    	mov    DWORD PTR [eax+0x140],edx
 10022a7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022aa:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 10022ad:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10022b3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022b6:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 10022b9:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 10022bf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022c2:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10022c5:	89 90 60 01 00 00    	mov    DWORD PTR [eax+0x160],edx
 10022cb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022ce:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10022d1:	89 90 18 01 00 00    	mov    DWORD PTR [eax+0x118],edx
 10022d7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022da:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10022dd:	89 90 20 01 00 00    	mov    DWORD PTR [eax+0x120],edx
 10022e3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022e6:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10022e9:	89 90 28 01 00 00    	mov    DWORD PTR [eax+0x128],edx
 10022ef:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022f2:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 10022f5:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 10022fb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022fe:	8b 55 28             	mov    edx,DWORD PTR [ebp+0x28]
 1002301:	89 90 68 01 00 00    	mov    DWORD PTR [eax+0x168],edx
 1002307:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100230a:	8b 55 2c             	mov    edx,DWORD PTR [ebp+0x2c]
 100230d:	89 90 6c 01 00 00    	mov    DWORD PTR [eax+0x16c],edx
 1002313:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002316:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002319:	89 90 48 01 00 00    	mov    DWORD PTR [eax+0x148],edx
 100231f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002322:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002325:	89 90 14 01 00 00    	mov    DWORD PTR [eax+0x114],edx
 100232b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100232e:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002331:	89 90 1c 01 00 00    	mov    DWORD PTR [eax+0x11c],edx
 1002337:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100233a:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 100233d:	89 90 24 01 00 00    	mov    DWORD PTR [eax+0x124],edx
 1002343:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002346:	8b 55 34             	mov    edx,DWORD PTR [ebp+0x34]
 1002349:	89 90 4c 01 00 00    	mov    DWORD PTR [eax+0x14c],edx
 100234f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002352:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
 1002355:	89 90 50 01 00 00    	mov    DWORD PTR [eax+0x150],edx
 100235b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100235e:	8b 55 3c             	mov    edx,DWORD PTR [ebp+0x3c]
 1002361:	89 90 54 01 00 00    	mov    DWORD PTR [eax+0x154],edx
 1002367:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100236a:	c7 80 34 01 00 00 02 	mov    DWORD PTR [eax+0x134],0x202
 1002371:	02 00 00 
 1002374:	ba 5f 24 00 01       	mov    edx,0x100245f
 1002379:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100237c:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 1002382:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002385:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 1002388:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 100238e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002391:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 1002394:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 100239a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100239d:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 10023a0:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10023a6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023a9:	c7 80 2c 01 00 00 00 	mov    DWORD PTR [eax+0x12c],0x1000
 10023b0:	10 00 00 
 10023b3:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10023b6:	83 c0 03             	add    eax,0x3
 10023b9:	c1 e0 04             	shl    eax,0x4
 10023bc:	89 c2                	mov    edx,eax
 10023be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023c1:	89 90 70 01 00 00    	mov    DWORD PTR [eax+0x170],edx
 10023c7:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10023ca:	01 c0                	add    eax,eax
 10023cc:	83 c0 05             	add    eax,0x5
 10023cf:	89 c2                	mov    edx,eax
 10023d1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023d4:	05 10 01 00 00       	add    eax,0x110
 10023d9:	52                   	push   edx
 10023da:	68 89 00 00 00       	push   0x89
 10023df:	68 ff ff 00 00       	push   0xffff
 10023e4:	50                   	push   eax
 10023e5:	e8 63 0b 00 00       	call   1002f4d <fill_desc>
 10023ea:	83 c4 10             	add    esp,0x10
 10023ed:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10023f0:	83 c0 03             	add    eax,0x3
 10023f3:	01 c0                	add    eax,eax
 10023f5:	89 c2                	mov    edx,eax
 10023f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023fa:	83 c0 34             	add    eax,0x34
 10023fd:	52                   	push   edx
 10023fe:	68 82 00 00 00       	push   0x82
 1002403:	6a 28                	push   0x28
 1002405:	50                   	push   eax
 1002406:	e8 42 0b 00 00       	call   1002f4d <fill_desc>
 100240b:	83 c4 10             	add    esp,0x10
 100240e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002411:	83 c0 34             	add    eax,0x34
 1002414:	50                   	push   eax
 1002415:	68 fe 80 00 00       	push   0x80fe
 100241a:	6a ff                	push   0xffffffff
 100241c:	6a 00                	push   0x0
 100241e:	e8 35 0c 00 00       	call   1003058 <fill_ldt_desc>
 1002423:	83 c4 10             	add    esp,0x10
 1002426:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002429:	83 c0 3c             	add    eax,0x3c
 100242c:	50                   	push   eax
 100242d:	68 f2 80 00 00       	push   0x80f2
 1002432:	6a ff                	push   0xffffffff
 1002434:	6a 00                	push   0x0
 1002436:	e8 1d 0c 00 00       	call   1003058 <fill_ldt_desc>
 100243b:	83 c4 10             	add    esp,0x10
 100243e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002441:	83 c0 44             	add    eax,0x44
 1002444:	50                   	push   eax
 1002445:	68 f6 00 00 00       	push   0xf6
 100244a:	68 00 10 00 00       	push   0x1000
 100244f:	68 00 f0 bf 01       	push   0x1bff000
 1002454:	e8 ff 0b 00 00       	call   1003058 <fill_ldt_desc>
 1002459:	83 c4 10             	add    esp,0x10
 100245c:	90                   	nop
 100245d:	c9                   	leave  
 100245e:	c3                   	ret    

0100245f <proc_zero>:
 100245f:	55                   	push   ebp
 1002460:	89 e5                	mov    ebp,esp
 1002462:	eb fe                	jmp    1002462 <proc_zero+0x3>

01002464 <manage_proc>:
 1002464:	55                   	push   ebp
 1002465:	89 e5                	mov    ebp,esp
 1002467:	83 ec 18             	sub    esp,0x18
 100246a:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 100246f:	83 f8 ff             	cmp    eax,0xffffffff
 1002472:	74 23                	je     1002497 <manage_proc+0x33>
 1002474:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002479:	69 d0 78 01 00 00    	imul   edx,eax,0x178
 100247f:	81 c2 68 2c 40 00    	add    edx,0x402c68
 1002485:	8b 12                	mov    edx,DWORD PTR [edx]
 1002487:	83 c2 01             	add    edx,0x1
 100248a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002490:	05 68 2c 40 00       	add    eax,0x402c68
 1002495:	89 10                	mov    DWORD PTR [eax],edx
 1002497:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 100249c:	83 f8 ff             	cmp    eax,0xffffffff
 100249f:	74 32                	je     10024d3 <manage_proc+0x6f>
 10024a1:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10024a6:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024ac:	05 68 2c 40 00       	add    eax,0x402c68
 10024b1:	8b 00                	mov    eax,DWORD PTR [eax]
 10024b3:	83 f8 01             	cmp    eax,0x1
 10024b6:	77 1b                	ja     10024d3 <manage_proc+0x6f>
 10024b8:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10024bd:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024c3:	05 64 2c 40 00       	add    eax,0x402c64
 10024c8:	8b 00                	mov    eax,DWORD PTR [eax]
 10024ca:	83 f8 01             	cmp    eax,0x1
 10024cd:	0f 84 85 00 00 00    	je     1002558 <manage_proc+0xf4>
 10024d3:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10024d8:	83 f8 ff             	cmp    eax,0xffffffff
 10024db:	74 16                	je     10024f3 <manage_proc+0x8f>
 10024dd:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10024e2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10024e8:	05 68 2c 40 00       	add    eax,0x402c68
 10024ed:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 10024f3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10024fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1002501:	eb 38                	jmp    100253b <manage_proc+0xd7>
 1002503:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002506:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100250c:	05 60 2c 40 00       	add    eax,0x402c60
 1002511:	8b 00                	mov    eax,DWORD PTR [eax]
 1002513:	83 f8 ff             	cmp    eax,0xffffffff
 1002516:	74 1f                	je     1002537 <manage_proc+0xd3>
 1002518:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100251b:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002521:	05 64 2c 40 00       	add    eax,0x402c64
 1002526:	8b 00                	mov    eax,DWORD PTR [eax]
 1002528:	83 f8 01             	cmp    eax,0x1
 100252b:	75 0a                	jne    1002537 <manage_proc+0xd3>
 100252d:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002532:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 1002535:	75 0c                	jne    1002543 <manage_proc+0xdf>
 1002537:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100253b:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 100253f:	7e c2                	jle    1002503 <manage_proc+0x9f>
 1002541:	eb 01                	jmp    1002544 <manage_proc+0xe0>
 1002543:	90                   	nop
 1002544:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1002548:	7f 11                	jg     100255b <manage_proc+0xf7>
 100254a:	83 ec 0c             	sub    esp,0xc
 100254d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002550:	e8 09 00 00 00       	call   100255e <switch_proc_tss>
 1002555:	83 c4 10             	add    esp,0x10
 1002558:	90                   	nop
 1002559:	eb 01                	jmp    100255c <manage_proc+0xf8>
 100255b:	90                   	nop
 100255c:	c9                   	leave  
 100255d:	c3                   	ret    

0100255e <switch_proc_tss>:
 100255e:	55                   	push   ebp
 100255f:	89 e5                	mov    ebp,esp
 1002561:	83 ec 18             	sub    esp,0x18
 1002564:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002567:	01 c0                	add    eax,eax
 1002569:	83 c0 05             	add    eax,0x5
 100256c:	c1 e0 03             	shl    eax,0x3
 100256f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002572:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002575:	a3 c8 8a 40 00       	mov    ds:0x408ac8,eax
 100257a:	83 ec 0c             	sub    esp,0xc
 100257d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002580:	e8 d6 45 00 00       	call   1006b5b <switch_proc_asm>
 1002585:	83 c4 10             	add    esp,0x10
 1002588:	90                   	nop
 1002589:	c9                   	leave  
 100258a:	c3                   	ret    

0100258b <switch_proc>:
 100258b:	55                   	push   ebp
 100258c:	89 e5                	mov    ebp,esp
 100258e:	57                   	push   edi
 100258f:	56                   	push   esi
 1002590:	53                   	push   ebx
 1002591:	81 ec 8c 01 00 00    	sub    esp,0x18c
 1002597:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100259a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025a0:	8d 90 60 2c 40 00    	lea    edx,[eax+0x402c60]
 10025a6:	8d 85 6c fe ff ff    	lea    eax,[ebp-0x194]
 10025ac:	89 d3                	mov    ebx,edx
 10025ae:	ba 5e 00 00 00       	mov    edx,0x5e
 10025b3:	89 c7                	mov    edi,eax
 10025b5:	89 de                	mov    esi,ebx
 10025b7:	89 d1                	mov    ecx,edx
 10025b9:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10025bb:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10025c0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025c6:	05 10 01 00 00       	add    eax,0x110
 10025cb:	05 60 2c 40 00       	add    eax,0x402c60
 10025d0:	83 ec 0c             	sub    esp,0xc
 10025d3:	50                   	push   eax
 10025d4:	e8 5f 00 00 00       	call   1002638 <save_context>
 10025d9:	83 c4 10             	add    esp,0x10
 10025dc:	b8 5f 24 00 01       	mov    eax,0x100245f
 10025e1:	a3 90 2d 40 00       	mov    ds:0x402d90,eax
 10025e6:	c7 05 8c 2d 40 00 00 	mov    DWORD PTR ds:0x402d8c,0x1000
 10025ed:	10 00 00 
 10025f0:	c7 05 94 2d 40 00 02 	mov    DWORD PTR ds:0x402d94,0x202
 10025f7:	02 00 00 
 10025fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10025fd:	a3 c8 8a 40 00       	mov    ds:0x408ac8,eax
 1002602:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002605:	01 c0                	add    eax,eax
 1002607:	83 c0 05             	add    eax,0x5
 100260a:	c1 e0 03             	shl    eax,0x3
 100260d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1002610:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002613:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002619:	05 10 01 00 00       	add    eax,0x110
 100261e:	05 60 2c 40 00       	add    eax,0x402c60
 1002623:	83 ec 0c             	sub    esp,0xc
 1002626:	50                   	push   eax
 1002627:	e8 4c 45 00 00       	call   1006b78 <switch_to>
 100262c:	83 c4 10             	add    esp,0x10
 100262f:	90                   	nop
 1002630:	8d 65 f4             	lea    esp,[ebp-0xc]
 1002633:	5b                   	pop    ebx
 1002634:	5e                   	pop    esi
 1002635:	5f                   	pop    edi
 1002636:	5d                   	pop    ebp
 1002637:	c3                   	ret    

01002638 <save_context>:
 1002638:	55                   	push   ebp
 1002639:	89 e5                	mov    ebp,esp
 100263b:	8b 15 80 8a 40 00    	mov    edx,DWORD PTR ds:0x408a80
 1002641:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002644:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
 1002647:	8b 15 88 8a 40 00    	mov    edx,DWORD PTR ds:0x408a88
 100264d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002650:	89 50 28             	mov    DWORD PTR [eax+0x28],edx
 1002653:	8b 15 94 8a 40 00    	mov    edx,DWORD PTR ds:0x408a94
 1002659:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100265c:	89 50 34             	mov    DWORD PTR [eax+0x34],edx
 100265f:	8b 15 8c 8a 40 00    	mov    edx,DWORD PTR ds:0x408a8c
 1002665:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002668:	89 50 2c             	mov    DWORD PTR [eax+0x2c],edx
 100266b:	8b 15 90 8a 40 00    	mov    edx,DWORD PTR ds:0x408a90
 1002671:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002674:	89 50 30             	mov    DWORD PTR [eax+0x30],edx
 1002677:	8b 15 a0 8a 40 00    	mov    edx,DWORD PTR ds:0x408aa0
 100267d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002680:	89 50 40             	mov    DWORD PTR [eax+0x40],edx
 1002683:	8b 15 a4 8a 40 00    	mov    edx,DWORD PTR ds:0x408aa4
 1002689:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100268c:	89 50 44             	mov    DWORD PTR [eax+0x44],edx
 100268f:	8b 15 84 8a 40 00    	mov    edx,DWORD PTR ds:0x408a84
 1002695:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002698:	89 50 24             	mov    DWORD PTR [eax+0x24],edx
 100269b:	8b 15 98 8a 40 00    	mov    edx,DWORD PTR ds:0x408a98
 10026a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10026a4:	89 50 38             	mov    DWORD PTR [eax+0x38],edx
 10026a7:	8b 15 9c 8a 40 00    	mov    edx,DWORD PTR ds:0x408a9c
 10026ad:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10026b0:	89 50 3c             	mov    DWORD PTR [eax+0x3c],edx
 10026b3:	90                   	nop
 10026b4:	5d                   	pop    ebp
 10026b5:	c3                   	ret    

010026b6 <palloc>:
 10026b6:	55                   	push   ebp
 10026b7:	89 e5                	mov    ebp,esp
 10026b9:	83 ec 48             	sub    esp,0x48
 10026bc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10026bf:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10026c5:	85 c0                	test   eax,eax
 10026c7:	0f 48 c2             	cmovs  eax,edx
 10026ca:	c1 f8 0c             	sar    eax,0xc
 10026cd:	89 c1                	mov    ecx,eax
 10026cf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10026d2:	99                   	cdq    
 10026d3:	c1 ea 14             	shr    edx,0x14
 10026d6:	01 d0                	add    eax,edx
 10026d8:	25 ff 0f 00 00       	and    eax,0xfff
 10026dd:	29 d0                	sub    eax,edx
 10026df:	01 c8                	add    eax,ecx
 10026e1:	85 c0                	test   eax,eax
 10026e3:	0f 95 c0             	setne  al
 10026e6:	0f b6 c0             	movzx  eax,al
 10026e9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10026ec:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10026f3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10026fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10026fd:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002703:	05 8c 2d 40 00       	add    eax,0x402d8c
 1002708:	8b 00                	mov    eax,DWORD PTR [eax]
 100270a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 100270d:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 1002711:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 1002718:	e9 ff 01 00 00       	jmp    100291c <palloc+0x266>
 100271d:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1002720:	8b 00                	mov    eax,DWORD PTR [eax]
 1002722:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002727:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 100272a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 1002731:	e9 d1 01 00 00       	jmp    1002907 <palloc+0x251>
 1002736:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1002739:	8b 00                	mov    eax,DWORD PTR [eax]
 100273b:	83 e0 01             	and    eax,0x1
 100273e:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1002741:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 1002745:	0f 85 b4 01 00 00    	jne    10028ff <palloc+0x249>
 100274b:	e8 98 e8 ff ff       	call   1000fe8 <req_a_page>
 1002750:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1002753:	83 7d d4 ff          	cmp    DWORD PTR [ebp-0x2c],0xffffffff
 1002757:	0f 85 a4 00 00 00    	jne    1002801 <palloc+0x14b>
 100275d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002760:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002766:	05 a4 2c 40 00       	add    eax,0x402ca4
 100276b:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100276e:	0f b7 c0             	movzx  eax,ax
 1002771:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1002774:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002777:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100277d:	05 a0 2c 40 00       	add    eax,0x402ca0
 1002782:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002786:	0f b7 c0             	movzx  eax,ax
 1002789:	c1 e0 10             	shl    eax,0x10
 100278c:	25 00 00 0f 00       	and    eax,0xf0000
 1002791:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 1002794:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002797:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 100279a:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100279d:	89 c2                	mov    edx,eax
 100279f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027a2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10027a8:	05 a4 2c 40 00       	add    eax,0x402ca4
 10027ad:	66 89 10             	mov    WORD PTR [eax],dx
 10027b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027b3:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10027b9:	05 a0 2c 40 00       	add    eax,0x402ca0
 10027be:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10027c2:	0f b7 c0             	movzx  eax,ax
 10027c5:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10027c8:	81 65 bc f0 ff 00 00 	and    DWORD PTR [ebp-0x44],0xfff0
 10027cf:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10027d2:	c1 e8 10             	shr    eax,0x10
 10027d5:	83 e0 0f             	and    eax,0xf
 10027d8:	89 c2                	mov    edx,eax
 10027da:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10027dd:	01 d0                	add    eax,edx
 10027df:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10027e2:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10027e5:	89 c2                	mov    edx,eax
 10027e7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027ea:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10027f0:	05 a0 2c 40 00       	add    eax,0x402ca0
 10027f5:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 10027f9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10027fc:	e9 2d 01 00 00       	jmp    100292e <palloc+0x278>
 1002801:	83 ec 0c             	sub    esp,0xc
 1002804:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1002807:	e8 39 e9 ff ff       	call   1001145 <get_phyaddr>
 100280c:	83 c4 10             	add    esp,0x10
 100280f:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1002812:	83 ec 04             	sub    esp,0x4
 1002815:	6a 07                	push   0x7
 1002817:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 100281a:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 100281d:	e8 2e e9 ff ff       	call   1001150 <set_page_item>
 1002822:	83 c4 10             	add    esp,0x10
 1002825:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002828:	c1 e0 0a             	shl    eax,0xa
 100282b:	89 c2                	mov    edx,eax
 100282d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1002830:	01 d0                	add    eax,edx
 1002832:	c1 e0 0c             	shl    eax,0xc
 1002835:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1002838:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 100283c:	75 0e                	jne    100284c <palloc+0x196>
 100283e:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1002841:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002844:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1002847:	a3 d0 8a 40 00       	mov    ds:0x408ad0,eax
 100284c:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1002850:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1002854:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1002858:	0f 85 a1 00 00 00    	jne    10028ff <palloc+0x249>
 100285e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002861:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002867:	05 a4 2c 40 00       	add    eax,0x402ca4
 100286c:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100286f:	0f b7 c0             	movzx  eax,ax
 1002872:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1002875:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002878:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100287e:	05 a0 2c 40 00       	add    eax,0x402ca0
 1002883:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 1002887:	0f b7 c0             	movzx  eax,ax
 100288a:	c1 e0 10             	shl    eax,0x10
 100288d:	25 00 00 0f 00       	and    eax,0xf0000
 1002892:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 1002895:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002898:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 100289b:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100289e:	89 c2                	mov    edx,eax
 10028a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028a3:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028a9:	05 a4 2c 40 00       	add    eax,0x402ca4
 10028ae:	66 89 10             	mov    WORD PTR [eax],dx
 10028b1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028b4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028ba:	05 a0 2c 40 00       	add    eax,0x402ca0
 10028bf:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10028c3:	0f b7 c0             	movzx  eax,ax
 10028c6:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 10028c9:	81 65 c4 f0 ff 00 00 	and    DWORD PTR [ebp-0x3c],0xfff0
 10028d0:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10028d3:	c1 e8 10             	shr    eax,0x10
 10028d6:	83 e0 0f             	and    eax,0xf
 10028d9:	89 c2                	mov    edx,eax
 10028db:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 10028de:	01 d0                	add    eax,edx
 10028e0:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 10028e3:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 10028e6:	89 c2                	mov    edx,eax
 10028e8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028eb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028f1:	05 a0 2c 40 00       	add    eax,0x402ca0
 10028f6:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 10028fa:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10028fd:	eb 2f                	jmp    100292e <palloc+0x278>
 10028ff:	83 45 e0 04          	add    DWORD PTR [ebp-0x20],0x4
 1002903:	83 45 dc 01          	add    DWORD PTR [ebp-0x24],0x1
 1002907:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [ebp-0x24],0x3ff
 100290e:	0f 8e 22 fe ff ff    	jle    1002736 <palloc+0x80>
 1002914:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 1002918:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100291c:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [ebp-0x1c],0x3ff
 1002923:	0f 8e f4 fd ff ff    	jle    100271d <palloc+0x67>
 1002929:	b8 00 00 00 00       	mov    eax,0x0
 100292e:	c9                   	leave  
 100292f:	c3                   	ret    

01002930 <malloc>:
 1002930:	55                   	push   ebp
 1002931:	89 e5                	mov    ebp,esp
 1002933:	83 ec 08             	sub    esp,0x8
 1002936:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 100293b:	83 ec 08             	sub    esp,0x8
 100293e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1002941:	50                   	push   eax
 1002942:	e8 6f fd ff ff       	call   10026b6 <palloc>
 1002947:	83 c4 10             	add    esp,0x10
 100294a:	c9                   	leave  
 100294b:	c3                   	ret    

0100294c <proc_end>:
 100294c:	55                   	push   ebp
 100294d:	89 e5                	mov    ebp,esp
 100294f:	83 ec 18             	sub    esp,0x18
 1002952:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002955:	a1 a8 2d 40 00       	mov    eax,ds:0x402da8
 100295a:	89 c4                	mov    esp,eax
 100295c:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002961:	83 ec 0c             	sub    esp,0xc
 1002964:	50                   	push   eax
 1002965:	e8 6d 00 00 00       	call   10029d7 <del_proc>
 100296a:	83 c4 10             	add    esp,0x10
 100296d:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002972:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002978:	05 c0 2c 40 00       	add    eax,0x402cc0
 100297d:	8b 00                	mov    eax,DWORD PTR [eax]
 100297f:	83 f8 ff             	cmp    eax,0xffffffff
 1002982:	74 43                	je     10029c7 <proc_end+0x7b>
 1002984:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002989:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100298f:	05 c0 2c 40 00       	add    eax,0x402cc0
 1002994:	8b 00                	mov    eax,DWORD PTR [eax]
 1002996:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100299c:	05 64 2c 40 00       	add    eax,0x402c64
 10029a1:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 10029a7:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10029ac:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029b2:	05 c0 2c 40 00       	add    eax,0x402cc0
 10029b7:	8b 00                	mov    eax,DWORD PTR [eax]
 10029b9:	83 ec 0c             	sub    esp,0xc
 10029bc:	50                   	push   eax
 10029bd:	e8 9c fb ff ff       	call   100255e <switch_proc_tss>
 10029c2:	83 c4 10             	add    esp,0x10
 10029c5:	eb 0d                	jmp    10029d4 <proc_end+0x88>
 10029c7:	83 ec 0c             	sub    esp,0xc
 10029ca:	6a 00                	push   0x0
 10029cc:	e8 8d fb ff ff       	call   100255e <switch_proc_tss>
 10029d1:	83 c4 10             	add    esp,0x10
 10029d4:	90                   	nop
 10029d5:	c9                   	leave  
 10029d6:	c3                   	ret    

010029d7 <del_proc>:
 10029d7:	55                   	push   ebp
 10029d8:	89 e5                	mov    ebp,esp
 10029da:	83 ec 18             	sub    esp,0x18
 10029dd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029e0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029e6:	05 64 2c 40 00       	add    eax,0x402c64
 10029eb:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 10029f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029f4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029fa:	05 60 2c 40 00       	add    eax,0x402c60
 10029ff:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 1002a05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a08:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002a0e:	05 8c 2d 40 00       	add    eax,0x402d8c
 1002a13:	8b 00                	mov    eax,DWORD PTR [eax]
 1002a15:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002a18:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002a1c:	eb 61                	jmp    1002a7f <del_proc+0xa8>
 1002a1e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002a21:	8b 00                	mov    eax,DWORD PTR [eax]
 1002a23:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002a28:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002a2b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1002a32:	eb 2f                	jmp    1002a63 <del_proc+0x8c>
 1002a34:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002a37:	8b 00                	mov    eax,DWORD PTR [eax]
 1002a39:	83 e0 01             	and    eax,0x1
 1002a3c:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002a3f:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 1002a43:	74 16                	je     1002a5b <del_proc+0x84>
 1002a45:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002a48:	8b 00                	mov    eax,DWORD PTR [eax]
 1002a4a:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002a4f:	83 ec 0c             	sub    esp,0xc
 1002a52:	50                   	push   eax
 1002a53:	e8 36 e6 ff ff       	call   100108e <free_page>
 1002a58:	83 c4 10             	add    esp,0x10
 1002a5b:	83 45 f0 04          	add    DWORD PTR [ebp-0x10],0x4
 1002a5f:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1002a63:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [ebp-0x14],0x3ff
 1002a6a:	7e c8                	jle    1002a34 <del_proc+0x5d>
 1002a6c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002a6f:	83 ec 0c             	sub    esp,0xc
 1002a72:	50                   	push   eax
 1002a73:	e8 df e3 ff ff       	call   1000e57 <vmfree>
 1002a78:	83 c4 10             	add    esp,0x10
 1002a7b:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002a7f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002a82:	8b 00                	mov    eax,DWORD PTR [eax]
 1002a84:	83 e0 01             	and    eax,0x1
 1002a87:	85 c0                	test   eax,eax
 1002a89:	75 93                	jne    1002a1e <del_proc+0x47>
 1002a8b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002a8e:	83 ec 0c             	sub    esp,0xc
 1002a91:	50                   	push   eax
 1002a92:	e8 c0 e3 ff ff       	call   1000e57 <vmfree>
 1002a97:	83 c4 10             	add    esp,0x10
 1002a9a:	90                   	nop
 1002a9b:	c9                   	leave  
 1002a9c:	c3                   	ret    

01002a9d <set_proc_stat>:
 1002a9d:	55                   	push   ebp
 1002a9e:	89 e5                	mov    ebp,esp
 1002aa0:	83 ec 10             	sub    esp,0x10
 1002aa3:	83 7d 08 ff          	cmp    DWORD PTR [ebp+0x8],0xffffffff
 1002aa7:	75 07                	jne    1002ab0 <set_proc_stat+0x13>
 1002aa9:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002aae:	eb 6a                	jmp    1002b1a <set_proc_stat+0x7d>
 1002ab0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002ab7:	eb 04                	jmp    1002abd <set_proc_stat+0x20>
 1002ab9:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002abd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002ac0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ac6:	05 60 2c 40 00       	add    eax,0x402c60
 1002acb:	8b 10                	mov    edx,DWORD PTR [eax]
 1002acd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002ad0:	39 c2                	cmp    edx,eax
 1002ad2:	75 e5                	jne    1002ab9 <set_proc_stat+0x1c>
 1002ad4:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 1002ad8:	75 07                	jne    1002ae1 <set_proc_stat+0x44>
 1002ada:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002adf:	eb 39                	jmp    1002b1a <set_proc_stat+0x7d>
 1002ae1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002ae4:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1002ae7:	69 d2 78 01 00 00    	imul   edx,edx,0x178
 1002aed:	81 c2 64 2c 40 00    	add    edx,0x402c64
 1002af3:	89 02                	mov    DWORD PTR [edx],eax
 1002af5:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002afa:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
 1002afd:	75 16                	jne    1002b15 <set_proc_stat+0x78>
 1002aff:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002b04:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b0a:	05 68 2c 40 00       	add    eax,0x402c68
 1002b0f:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002b15:	b8 00 00 00 00       	mov    eax,0x0
 1002b1a:	c9                   	leave  
 1002b1b:	c3                   	ret    

01002b1c <add_proc_openf>:
 1002b1c:	55                   	push   ebp
 1002b1d:	89 e5                	mov    ebp,esp
 1002b1f:	83 ec 10             	sub    esp,0x10
 1002b22:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002b29:	eb 40                	jmp    1002b6b <add_proc_openf+0x4f>
 1002b2b:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002b30:	6b d0 5e             	imul   edx,eax,0x5e
 1002b33:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002b36:	01 d0                	add    eax,edx
 1002b38:	83 c0 24             	add    eax,0x24
 1002b3b:	8b 04 85 60 2c 40 00 	mov    eax,DWORD PTR [eax*4+0x402c60]
 1002b42:	85 c0                	test   eax,eax
 1002b44:	75 21                	jne    1002b67 <add_proc_openf+0x4b>
 1002b46:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002b4b:	6b d0 5e             	imul   edx,eax,0x5e
 1002b4e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002b51:	01 d0                	add    eax,edx
 1002b53:	8d 50 24             	lea    edx,[eax+0x24]
 1002b56:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b59:	89 04 95 60 2c 40 00 	mov    DWORD PTR [edx*4+0x402c60],eax
 1002b60:	b8 00 00 00 00       	mov    eax,0x0
 1002b65:	eb 0f                	jmp    1002b76 <add_proc_openf+0x5a>
 1002b67:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002b6b:	83 7d fc 1f          	cmp    DWORD PTR [ebp-0x4],0x1f
 1002b6f:	7e ba                	jle    1002b2b <add_proc_openf+0xf>
 1002b71:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002b76:	c9                   	leave  
 1002b77:	c3                   	ret    

01002b78 <sys_exit>:
 1002b78:	55                   	push   ebp
 1002b79:	89 e5                	mov    ebp,esp
 1002b7b:	83 ec 08             	sub    esp,0x8
 1002b7e:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002b83:	83 ec 0c             	sub    esp,0xc
 1002b86:	50                   	push   eax
 1002b87:	e8 4b fe ff ff       	call   10029d7 <del_proc>
 1002b8c:	83 c4 10             	add    esp,0x10
 1002b8f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b92:	c9                   	leave  
 1002b93:	c3                   	ret    

01002b94 <reg_proc>:
 1002b94:	55                   	push   ebp
 1002b95:	89 e5                	mov    ebp,esp
 1002b97:	83 ec 18             	sub    esp,0x18
 1002b9a:	e8 10 f6 ff ff       	call   10021af <req_proc>
 1002b9f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002ba2:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002ba6:	75 0a                	jne    1002bb2 <reg_proc+0x1e>
 1002ba8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002bad:	e9 1a 01 00 00       	jmp    1002ccc <reg_proc+0x138>
 1002bb2:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002bb5:	6a 00                	push   0x0
 1002bb7:	6a 00                	push   0x0
 1002bb9:	6a 00                	push   0x0
 1002bbb:	6a 00                	push   0x0
 1002bbd:	68 fc ff bf 01       	push   0x1bffffc
 1002bc2:	6a 10                	push   0x10
 1002bc4:	6a 10                	push   0x10
 1002bc6:	6a 10                	push   0x10
 1002bc8:	6a 10                	push   0x10
 1002bca:	6a 08                	push   0x8
 1002bcc:	6a 10                	push   0x10
 1002bce:	6a 00                	push   0x0
 1002bd0:	6a 00                	push   0x0
 1002bd2:	6a 00                	push   0x0
 1002bd4:	6a 00                	push   0x0
 1002bd6:	e8 85 f6 ff ff       	call   1002260 <set_proc>
 1002bdb:	83 c4 40             	add    esp,0x40
 1002bde:	e8 eb e1 ff ff       	call   1000dce <vmalloc>
 1002be3:	89 c2                	mov    edx,eax
 1002be5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002be8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002bee:	05 e4 2c 40 00       	add    eax,0x402ce4
 1002bf3:	89 10                	mov    DWORD PTR [eax],edx
 1002bf5:	e8 d4 e1 ff ff       	call   1000dce <vmalloc>
 1002bfa:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002bfd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c00:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c06:	05 e4 2c 40 00       	add    eax,0x402ce4
 1002c0b:	8b 00                	mov    eax,DWORD PTR [eax]
 1002c0d:	c7 00 07 20 00 00    	mov    DWORD PTR [eax],0x2007
 1002c13:	e8 b6 e1 ff ff       	call   1000dce <vmalloc>
 1002c18:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002c1b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1002c1e:	83 c8 07             	or     eax,0x7
 1002c21:	89 c2                	mov    edx,eax
 1002c23:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c26:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c2c:	05 e4 2c 40 00       	add    eax,0x402ce4
 1002c31:	8b 00                	mov    eax,DWORD PTR [eax]
 1002c33:	83 c0 18             	add    eax,0x18
 1002c36:	89 10                	mov    DWORD PTR [eax],edx
 1002c38:	e8 ab e3 ff ff       	call   1000fe8 <req_a_page>
 1002c3d:	83 ec 0c             	sub    esp,0xc
 1002c40:	50                   	push   eax
 1002c41:	e8 ff e4 ff ff       	call   1001145 <get_phyaddr>
 1002c46:	83 c4 10             	add    esp,0x10
 1002c49:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1002c4c:	81 c2 fc 0f 00 00    	add    edx,0xffc
 1002c52:	83 c8 07             	or     eax,0x7
 1002c55:	89 02                	mov    DWORD PTR [edx],eax
 1002c57:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c5a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c60:	05 e4 2c 40 00       	add    eax,0x402ce4
 1002c65:	8b 00                	mov    eax,DWORD PTR [eax]
 1002c67:	89 c2                	mov    edx,eax
 1002c69:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c6c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c72:	05 8c 2d 40 00       	add    eax,0x402d8c
 1002c77:	89 10                	mov    DWORD PTR [eax],edx
 1002c79:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c7c:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c82:	05 64 2c 40 00       	add    eax,0x402c64
 1002c87:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002c8d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002c90:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c96:	8d 90 e8 2c 40 00    	lea    edx,[eax+0x402ce8]
 1002c9c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002c9f:	89 02                	mov    DWORD PTR [edx],eax
 1002ca1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002ca4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002caa:	8d 90 ec 2c 40 00    	lea    edx,[eax+0x402cec]
 1002cb0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1002cb3:	89 02                	mov    DWORD PTR [edx],eax
 1002cb5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002cb8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002cbe:	8d 90 90 2d 40 00    	lea    edx,[eax+0x402d90]
 1002cc4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002cc7:	89 02                	mov    DWORD PTR [edx],eax
 1002cc9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002ccc:	c9                   	leave  
 1002ccd:	c3                   	ret    

01002cce <sys_malloc>:
 1002cce:	55                   	push   ebp
 1002ccf:	89 e5                	mov    ebp,esp
 1002cd1:	83 ec 20             	sub    esp,0x20
 1002cd4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002cd7:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1002cdd:	85 c0                	test   eax,eax
 1002cdf:	0f 48 c2             	cmovs  eax,edx
 1002ce2:	c1 f8 0c             	sar    eax,0xc
 1002ce5:	89 c1                	mov    ecx,eax
 1002ce7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002cea:	99                   	cdq    
 1002ceb:	c1 ea 14             	shr    edx,0x14
 1002cee:	01 d0                	add    eax,edx
 1002cf0:	25 ff 0f 00 00       	and    eax,0xfff
 1002cf5:	29 d0                	sub    eax,edx
 1002cf7:	01 c8                	add    eax,ecx
 1002cf9:	85 c0                	test   eax,eax
 1002cfb:	0f 95 c0             	setne  al
 1002cfe:	0f b6 c0             	movzx  eax,al
 1002d01:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002d04:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002d09:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d0f:	05 74 2c 40 00       	add    eax,0x402c74
 1002d14:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d16:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002d19:	eb 09                	jmp    1002d24 <sys_malloc+0x56>
 1002d1b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d1e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002d21:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002d24:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d27:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002d2a:	85 c0                	test   eax,eax
 1002d2c:	74 14                	je     1002d42 <sys_malloc+0x74>
 1002d2e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d31:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002d34:	85 c0                	test   eax,eax
 1002d36:	75 0a                	jne    1002d42 <sys_malloc+0x74>
 1002d38:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d3b:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d3d:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002d40:	7e d9                	jle    1002d1b <sys_malloc+0x4d>
 1002d42:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d45:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d47:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002d4a:	7e 6f                	jle    1002dbb <sys_malloc+0xed>
 1002d4c:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002d51:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d57:	05 78 2c 40 00       	add    eax,0x402c78
 1002d5c:	8b 10                	mov    edx,DWORD PTR [eax]
 1002d5e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002d61:	c1 e0 0c             	shl    eax,0xc
 1002d64:	01 d0                	add    eax,edx
 1002d66:	3d ff ff ef 01       	cmp    eax,0x1efffff
 1002d6b:	7e 0a                	jle    1002d77 <sys_malloc+0xa9>
 1002d6d:	b8 00 00 00 00       	mov    eax,0x0
 1002d72:	e9 a6 00 00 00       	jmp    1002e1d <sys_malloc+0x14f>
 1002d77:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002d7a:	8b 10                	mov    edx,DWORD PTR [eax]
 1002d7c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002d7f:	29 d0                	sub    eax,edx
 1002d81:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002d84:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1002d89:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d8f:	05 78 2c 40 00       	add    eax,0x402c78
 1002d94:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d96:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1002d99:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1002da0:	eb 11                	jmp    1002db3 <sys_malloc+0xe5>
 1002da2:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002da5:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1002da8:	81 45 f8 00 10 00 00 	add    DWORD PTR [ebp-0x8],0x1000
 1002daf:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1002db3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002db6:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 1002db9:	7c e7                	jl     1002da2 <sys_malloc+0xd4>
 1002dbb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002dbe:	8b 00                	mov    eax,DWORD PTR [eax]
 1002dc0:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002dc3:	7d 46                	jge    1002e0b <sys_malloc+0x13d>
 1002dc5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002dc8:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002dcb:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002dce:	83 c0 01             	add    eax,0x1
 1002dd1:	c1 e0 0c             	shl    eax,0xc
 1002dd4:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
 1002dd7:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1002dda:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1002ddd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002de0:	8b 00                	mov    eax,DWORD PTR [eax]
 1002de2:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1002de5:	8d 50 ff             	lea    edx,[eax-0x1]
 1002de8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002deb:	89 10                	mov    DWORD PTR [eax],edx
 1002ded:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002df0:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1002df3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002df6:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1002df9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002dfc:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1002dff:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 1002e02:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e05:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1002e08:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1002e0b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e0e:	c7 40 04 01 00 00 00 	mov    DWORD PTR [eax+0x4],0x1
 1002e15:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e18:	05 00 10 00 00       	add    eax,0x1000
 1002e1d:	c9                   	leave  
 1002e1e:	c3                   	ret    

01002e1f <sys_free>:
 1002e1f:	55                   	push   ebp
 1002e20:	89 e5                	mov    ebp,esp
 1002e22:	83 ec 10             	sub    esp,0x10
 1002e25:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002e28:	2d 00 10 00 00       	sub    eax,0x1000
 1002e2d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1002e30:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e33:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 1002e3a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e3d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002e40:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002e43:	eb 27                	jmp    1002e6c <sys_free+0x4d>
 1002e45:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e48:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002e4b:	85 c0                	test   eax,eax
 1002e4d:	75 25                	jne    1002e74 <sys_free+0x55>
 1002e4f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e52:	8b 10                	mov    edx,DWORD PTR [eax]
 1002e54:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e57:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e59:	83 c0 01             	add    eax,0x1
 1002e5c:	01 c2                	add    edx,eax
 1002e5e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e61:	89 10                	mov    DWORD PTR [eax],edx
 1002e63:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e66:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002e69:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002e6c:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1002e70:	75 d3                	jne    1002e45 <sys_free+0x26>
 1002e72:	eb 01                	jmp    1002e75 <sys_free+0x56>
 1002e74:	90                   	nop
 1002e75:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e78:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1002e7b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002e7e:	eb 27                	jmp    1002ea7 <sys_free+0x88>
 1002e80:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e83:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002e86:	85 c0                	test   eax,eax
 1002e88:	75 25                	jne    1002eaf <sys_free+0x90>
 1002e8a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e8d:	8b 10                	mov    edx,DWORD PTR [eax]
 1002e8f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002e92:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e94:	83 c0 01             	add    eax,0x1
 1002e97:	01 c2                	add    edx,eax
 1002e99:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e9c:	89 10                	mov    DWORD PTR [eax],edx
 1002e9e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002ea1:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1002ea4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002ea7:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1002eab:	75 d3                	jne    1002e80 <sys_free+0x61>
 1002ead:	eb 01                	jmp    1002eb0 <sys_free+0x91>
 1002eaf:	90                   	nop
 1002eb0:	b8 00 00 00 00       	mov    eax,0x0
 1002eb5:	c9                   	leave  
 1002eb6:	c3                   	ret    
 1002eb7:	66 90                	xchg   ax,ax
 1002eb9:	66 90                	xchg   ax,ax
 1002ebb:	66 90                	xchg   ax,ax
 1002ebd:	66 90                	xchg   ax,ax
 1002ebf:	90                   	nop

01002ec0 <outb>:
 1002ec0:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1002ec5:	8a 44 24 08          	mov    al,BYTE PTR [esp+0x8]
 1002ec9:	ee                   	out    dx,al
 1002eca:	e8 31 00 00 00       	call   1002f00 <io_delay>
 1002ecf:	c3                   	ret    

01002ed0 <outw>:
 1002ed0:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1002ed5:	66 8b 44 24 08       	mov    ax,WORD PTR [esp+0x8]
 1002eda:	66 ef                	out    dx,ax
 1002edc:	90                   	nop
 1002edd:	90                   	nop
 1002ede:	90                   	nop
 1002edf:	c3                   	ret    

01002ee0 <inb>:
 1002ee0:	31 c0                	xor    eax,eax
 1002ee2:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1002ee7:	ec                   	in     al,dx
 1002ee8:	90                   	nop
 1002ee9:	90                   	nop
 1002eea:	90                   	nop
 1002eeb:	c3                   	ret    

01002eec <inw>:
 1002eec:	31 c0                	xor    eax,eax
 1002eee:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1002ef3:	66 ed                	in     ax,dx
 1002ef5:	90                   	nop
 1002ef6:	90                   	nop
 1002ef7:	90                   	nop
 1002ef8:	c3                   	ret    

01002ef9 <eoi>:
 1002ef9:	b0 20                	mov    al,0x20
 1002efb:	e6 a0                	out    0xa0,al
 1002efd:	e6 20                	out    0x20,al
 1002eff:	c3                   	ret    

01002f00 <io_delay>:
 1002f00:	90                   	nop
 1002f01:	90                   	nop
 1002f02:	90                   	nop
 1002f03:	90                   	nop
 1002f04:	c3                   	ret    

01002f05 <turn_on_int>:
 1002f05:	b0 f8                	mov    al,0xf8
 1002f07:	e6 21                	out    0x21,al
 1002f09:	e8 f2 ff ff ff       	call   1002f00 <io_delay>
 1002f0e:	b0 ef                	mov    al,0xef
 1002f10:	e6 a1                	out    0xa1,al
 1002f12:	e8 e9 ff ff ff       	call   1002f00 <io_delay>
 1002f17:	0f 01 1d 47 2f 00 01 	lidtd  ds:0x1002f47
 1002f1e:	90                   	nop
 1002f1f:	90                   	nop
 1002f20:	90                   	nop
 1002f21:	90                   	nop
 1002f22:	fb                   	sti    
 1002f23:	c3                   	ret    

01002f24 <report_back_trace_of_err>:
 1002f24:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1002f28:	50                   	push   eax
 1002f29:	68 32 2f 00 01       	push   0x1002f32
 1002f2e:	83 c4 08             	add    esp,0x8
 1002f31:	c3                   	ret    

01002f32 <bt_msg>:
 1002f32:	65 72 72             	gs jb  1002fa7 <fill_desc+0x5a>
 1002f35:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1002f36:	72 20                	jb     1002f58 <fill_desc+0xb>
 1002f38:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1002f39:	63 63 75             	arpl   WORD PTR [ebx+0x75],sp
 1002f3c:	72 73                	jb     1002fb1 <fill_desc+0x64>
 1002f3e:	20 61 74             	and    BYTE PTR [ecx+0x74],ah
 1002f41:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR ds:0x6e5c78

01002f47 <idtptr>:
 1002f47:	f8                   	clc    
 1002f48:	07                   	pop    es
 1002f49:	00 00                	add    BYTE PTR [eax],al
	...

01002f4d <fill_desc>:
 1002f4d:	55                   	push   ebp
 1002f4e:	89 e5                	mov    ebp,esp
 1002f50:	83 ec 04             	sub    esp,0x4
 1002f53:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1002f56:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 1002f5a:	8b 15 4c 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c4c
 1002f60:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1002f63:	c1 e0 03             	shl    eax,0x3
 1002f66:	01 d0                	add    eax,edx
 1002f68:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002f6b:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 1002f6f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002f72:	c1 e8 10             	shr    eax,0x10
 1002f75:	89 c1                	mov    ecx,eax
 1002f77:	8b 15 4c 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c4c
 1002f7d:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1002f80:	c1 e0 03             	shl    eax,0x3
 1002f83:	01 d0                	add    eax,edx
 1002f85:	89 ca                	mov    edx,ecx
 1002f87:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 1002f8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002f8d:	c1 e8 18             	shr    eax,0x18
 1002f90:	89 c1                	mov    ecx,eax
 1002f92:	8b 15 4c 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c4c
 1002f98:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1002f9b:	c1 e0 03             	shl    eax,0x3
 1002f9e:	01 d0                	add    eax,edx
 1002fa0:	89 ca                	mov    edx,ecx
 1002fa2:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 1002fa5:	8b 15 4c 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c4c
 1002fab:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1002fae:	c1 e0 03             	shl    eax,0x3
 1002fb1:	01 d0                	add    eax,edx
 1002fb3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1002fb6:	66 89 10             	mov    WORD PTR [eax],dx
 1002fb9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002fbc:	c1 e8 10             	shr    eax,0x10
 1002fbf:	83 e0 0f             	and    eax,0xf
 1002fc2:	8b 0d 4c 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006c4c
 1002fc8:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 1002fcb:	c1 e2 03             	shl    edx,0x3
 1002fce:	01 ca                	add    edx,ecx
 1002fd0:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 1002fd4:	66 89 42 05          	mov    WORD PTR [edx+0x5],ax
 1002fd8:	90                   	nop
 1002fd9:	c9                   	leave  
 1002fda:	c3                   	ret    

01002fdb <fill_gate>:
 1002fdb:	55                   	push   ebp
 1002fdc:	89 e5                	mov    ebp,esp
 1002fde:	83 ec 18             	sub    esp,0x18
 1002fe1:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 1002fe4:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1002fe7:	66 89 55 ec          	mov    WORD PTR [ebp-0x14],dx
 1002feb:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
 1002fef:	a1 4c 6c 00 01       	mov    eax,ds:0x1006c4c
 1002ff4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002ff7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002ffa:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003001:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003004:	01 d0                	add    eax,edx
 1003006:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1003009:	66 89 10             	mov    WORD PTR [eax],dx
 100300c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100300f:	c1 e8 10             	shr    eax,0x10
 1003012:	89 c2                	mov    edx,eax
 1003014:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003017:	8d 0c c5 00 00 00 00 	lea    ecx,[eax*8+0x0]
 100301e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003021:	01 c8                	add    eax,ecx
 1003023:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
 1003027:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100302a:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003031:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003034:	01 c2                	add    edx,eax
 1003036:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 100303a:	66 89 42 02          	mov    WORD PTR [edx+0x2],ax
 100303e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003041:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003048:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100304b:	01 c2                	add    edx,eax
 100304d:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
 1003051:	66 89 42 04          	mov    WORD PTR [edx+0x4],ax
 1003055:	90                   	nop
 1003056:	c9                   	leave  
 1003057:	c3                   	ret    

01003058 <fill_ldt_desc>:
 1003058:	55                   	push   ebp
 1003059:	89 e5                	mov    ebp,esp
 100305b:	83 ec 04             	sub    esp,0x4
 100305e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003061:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 1003065:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003068:	89 c2                	mov    edx,eax
 100306a:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100306d:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 1003071:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003074:	c1 e8 10             	shr    eax,0x10
 1003077:	89 c2                	mov    edx,eax
 1003079:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100307c:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 100307f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003082:	c1 e8 18             	shr    eax,0x18
 1003085:	89 c2                	mov    edx,eax
 1003087:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100308a:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 100308d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1003090:	89 c2                	mov    edx,eax
 1003092:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003095:	66 89 10             	mov    WORD PTR [eax],dx
 1003098:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100309b:	c1 e8 10             	shr    eax,0x10
 100309e:	c1 e0 08             	shl    eax,0x8
 10030a1:	66 25 00 0f          	and    ax,0xf00
 10030a5:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 10030a9:	89 c2                	mov    edx,eax
 10030ab:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10030ae:	66 89 50 05          	mov    WORD PTR [eax+0x5],dx
 10030b2:	90                   	nop
 10030b3:	c9                   	leave  
 10030b4:	c3                   	ret    
 10030b5:	66 90                	xchg   ax,ax
 10030b7:	66 90                	xchg   ax,ax
 10030b9:	66 90                	xchg   ax,ax
 10030bb:	66 90                	xchg   ax,ax
 10030bd:	66 90                	xchg   ax,ax
 10030bf:	90                   	nop

010030c0 <fill_desc>:
 10030c0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10030c4:	8b 5c 24 08          	mov    ebx,DWORD PTR [esp+0x8]
 10030c8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10030cc:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 10030d0:	be 00 60 00 00       	mov    esi,0x6000
 10030d5:	c1 e2 03             	shl    edx,0x3
 10030d8:	01 d6                	add    esi,edx
 10030da:	66 89 1e             	mov    WORD PTR [esi],bx
 10030dd:	66 89 46 02          	mov    WORD PTR [esi+0x2],ax
 10030e1:	c1 e8 10             	shr    eax,0x10
 10030e4:	88 46 04             	mov    BYTE PTR [esi+0x4],al
 10030e7:	c1 eb 10             	shr    ebx,0x10
 10030ea:	88 5e 06             	mov    BYTE PTR [esi+0x6],bl
 10030ed:	88 66 07             	mov    BYTE PTR [esi+0x7],ah
 10030f0:	09 4e 05             	or     DWORD PTR [esi+0x5],ecx
 10030f3:	c3                   	ret    

010030f4 <clock_c>:
 10030f4:	55                   	push   ebp
 10030f5:	89 e5                	mov    ebp,esp
 10030f7:	83 ec 08             	sub    esp,0x8
 10030fa:	a1 40 6c 00 01       	mov    eax,ds:0x1006c40
 10030ff:	85 c0                	test   eax,eax
 1003101:	75 05                	jne    1003108 <clock_c+0x14>
 1003103:	e8 5c f3 ff ff       	call   1002464 <manage_proc>
 1003108:	90                   	nop
 1003109:	c9                   	leave  
 100310a:	c3                   	ret    
 100310b:	66 90                	xchg   ax,ax
 100310d:	66 90                	xchg   ax,ax
 100310f:	90                   	nop

01003110 <clock>:
 1003110:	83 3d 40 6c 00 01 00 	cmp    DWORD PTR ds:0x1006c40,0x0
 1003117:	75 5d                	jne    1003176 <clock.normal_part>
 1003119:	60                   	pusha  
 100311a:	b9 08 00 00 00       	mov    ecx,0x8
 100311f:	89 e6                	mov    esi,esp
 1003121:	bf 60 8a 40 00       	mov    edi,0x408a60
 1003126:	83 c7 44             	add    edi,0x44

01003129 <clock.saver_loop>:
 1003129:	8b 1e                	mov    ebx,DWORD PTR [esi]
 100312b:	89 1f                	mov    DWORD PTR [edi],ebx
 100312d:	83 c6 04             	add    esi,0x4
 1003130:	83 ef 04             	sub    edi,0x4
 1003133:	e2 f4                	loop   1003129 <clock.saver_loop>
 1003135:	61                   	popa   
 1003136:	bf 60 8a 40 00       	mov    edi,0x408a60
 100313b:	8b 04 24             	mov    eax,DWORD PTR [esp]
 100313e:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
 1003141:	9c                   	pushf  
 1003142:	5b                   	pop    ebx
 1003143:	81 cb 00 02 00 00    	or     ebx,0x200
 1003149:	89 5f 24             	mov    DWORD PTR [edi+0x24],ebx
 100314c:	66 8c c0             	mov    ax,es
 100314f:	66 89 47 48          	mov    WORD PTR [edi+0x48],ax
 1003153:	66 8c c8             	mov    ax,cs
 1003156:	66 89 47 4c          	mov    WORD PTR [edi+0x4c],ax
 100315a:	66 8c d0             	mov    ax,ss
 100315d:	66 89 47 50          	mov    WORD PTR [edi+0x50],ax
 1003161:	66 8c d8             	mov    ax,ds
 1003164:	66 89 47 54          	mov    WORD PTR [edi+0x54],ax
 1003168:	66 8c e0             	mov    ax,fs
 100316b:	66 89 47 58          	mov    WORD PTR [edi+0x58],ax
 100316f:	66 8c e8             	mov    ax,gs
 1003172:	66 89 47 5c          	mov    WORD PTR [edi+0x5c],ax

01003176 <clock.normal_part>:
 1003176:	b0 20                	mov    al,0x20
 1003178:	e6 a0                	out    0xa0,al
 100317a:	e6 20                	out    0x20,al
 100317c:	e8 73 ff ff ff       	call   10030f4 <clock_c>
 1003181:	cf                   	iret   

01003182 <execute>:
 1003182:	55                   	push   ebp
 1003183:	89 e5                	mov    ebp,esp
 1003185:	83 ec 18             	sub    esp,0x18
 1003188:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 100318f:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 1003196:	83 ec 08             	sub    esp,0x8
 1003199:	6a 01                	push   0x1
 100319b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100319e:	e8 b7 e3 ff ff       	call   100155a <sys_open>
 10031a3:	83 c4 10             	add    esp,0x10
 10031a6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10031a9:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 10031ad:	75 0a                	jne    10031b9 <execute+0x37>
 10031af:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10031b4:	e9 a0 00 00 00       	jmp    1003259 <execute+0xd7>
 10031b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10031bc:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10031bf:	eb 04                	jmp    10031c5 <execute+0x43>
 10031c1:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10031c5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10031cb:	84 c0                	test   al,al
 10031cd:	75 f2                	jne    10031c1 <execute+0x3f>
 10031cf:	eb 04                	jmp    10031d5 <execute+0x53>
 10031d1:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
 10031d5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10031db:	3c 2f                	cmp    al,0x2f
 10031dd:	74 08                	je     10031e7 <execute+0x65>
 10031df:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031e2:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 10031e5:	77 ea                	ja     10031d1 <execute+0x4f>
 10031e7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031ea:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 10031ed:	76 2c                	jbe    100321b <execute+0x99>
 10031ef:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10031f2:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10031f5:	83 ec 08             	sub    esp,0x8
 10031f8:	6a 01                	push   0x1
 10031fa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10031fd:	e8 58 e3 ff ff       	call   100155a <sys_open>
 1003202:	83 c4 10             	add    esp,0x10
 1003205:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003208:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 100320c:	75 07                	jne    1003215 <execute+0x93>
 100320e:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003213:	eb 44                	jmp    1003259 <execute+0xd7>
 1003215:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003218:	c6 00 2f             	mov    BYTE PTR [eax],0x2f
 100321b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 100321e:	89 d0                	mov    eax,edx
 1003220:	c1 e0 03             	shl    eax,0x3
 1003223:	01 d0                	add    eax,edx
 1003225:	c1 e0 03             	shl    eax,0x3
 1003228:	8d 88 60 03 40 00    	lea    ecx,[eax+0x400360]
 100322e:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1003231:	89 d0                	mov    eax,edx
 1003233:	c1 e0 03             	shl    eax,0x3
 1003236:	01 d0                	add    eax,edx
 1003238:	c1 e0 03             	shl    eax,0x3
 100323b:	05 60 03 40 00       	add    eax,0x400360
 1003240:	ba b7 32 00 01       	mov    edx,0x10032b7
 1003245:	83 ec 04             	sub    esp,0x4
 1003248:	51                   	push   ecx
 1003249:	50                   	push   eax
 100324a:	52                   	push   edx
 100324b:	e8 44 f9 ff ff       	call   1002b94 <reg_proc>
 1003250:	83 c4 10             	add    esp,0x10
 1003253:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1003256:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003259:	c9                   	leave  
 100325a:	c3                   	ret    

0100325b <exec_call>:
 100325b:	55                   	push   ebp
 100325c:	89 e5                	mov    ebp,esp
 100325e:	83 ec 18             	sub    esp,0x18
 1003261:	83 ec 0c             	sub    esp,0xc
 1003264:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1003267:	e8 16 ff ff ff       	call   1003182 <execute>
 100326c:	83 c4 10             	add    esp,0x10
 100326f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003272:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003275:	01 c0                	add    eax,eax
 1003277:	83 c0 05             	add    eax,0x5
 100327a:	c1 e0 03             	shl    eax,0x3
 100327d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1003280:	83 ec 0c             	sub    esp,0xc
 1003283:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1003286:	e8 d3 f2 ff ff       	call   100255e <switch_proc_tss>
 100328b:	83 c4 10             	add    esp,0x10
 100328e:	90                   	nop
 100328f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003292:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003298:	05 60 2c 40 00       	add    eax,0x402c60
 100329d:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10032a0:	83 f8 03             	cmp    eax,0x3
 10032a3:	75 ea                	jne    100328f <exec_call+0x34>
 10032a5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10032a8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10032ae:	05 70 2c 40 00       	add    eax,0x402c70
 10032b3:	8b 00                	mov    eax,DWORD PTR [eax]
 10032b5:	c9                   	leave  
 10032b6:	c3                   	ret    

010032b7 <proc_start>:
 10032b7:	55                   	push   ebp
 10032b8:	89 e5                	mov    ebp,esp
 10032ba:	83 ec 08             	sub    esp,0x8
 10032bd:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10032c2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10032c8:	05 60 2c 40 00       	add    eax,0x402c60
 10032cd:	83 ec 0c             	sub    esp,0xc
 10032d0:	50                   	push   eax
 10032d1:	e8 24 00 00 00       	call   10032fa <load_pe>
 10032d6:	83 c4 10             	add    esp,0x10
 10032d9:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10032de:	83 ec 0c             	sub    esp,0xc
 10032e1:	50                   	push   eax
 10032e2:	e8 f0 f6 ff ff       	call   10029d7 <del_proc>
 10032e7:	83 c4 10             	add    esp,0x10
 10032ea:	83 ec 0c             	sub    esp,0xc
 10032ed:	6a 00                	push   0x0
 10032ef:	e8 6a f2 ff ff       	call   100255e <switch_proc_tss>
 10032f4:	83 c4 10             	add    esp,0x10
 10032f7:	90                   	nop
 10032f8:	c9                   	leave  
 10032f9:	c3                   	ret    

010032fa <load_pe>:
 10032fa:	55                   	push   ebp
 10032fb:	89 e5                	mov    ebp,esp
 10032fd:	53                   	push   ebx
 10032fe:	81 ec 14 02 00 00    	sub    esp,0x214
 1003304:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003307:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 100330d:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1003310:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1003313:	8b 00                	mov    eax,DWORD PTR [eax]
 1003315:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 1003318:	6a 40                	push   0x40
 100331a:	6a 00                	push   0x0
 100331c:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 1003322:	50                   	push   eax
 1003323:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003326:	e8 07 e6 ff ff       	call   1001932 <sys_read>
 100332b:	83 c4 10             	add    esp,0x10
 100332e:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [ebp-0xd0]
 1003334:	68 f8 00 00 00       	push   0xf8
 1003339:	50                   	push   eax
 100333a:	8d 85 fc fd ff ff    	lea    eax,[ebp-0x204]
 1003340:	50                   	push   eax
 1003341:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003344:	e8 e9 e5 ff ff       	call   1001932 <sys_read>
 1003349:	83 c4 10             	add    esp,0x10
 100334c:	8b 85 30 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1d0]
 1003352:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003355:	8b 85 4c fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b4]
 100335b:	c1 e8 0c             	shr    eax,0xc
 100335e:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1003361:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003364:	c1 e8 16             	shr    eax,0x16
 1003367:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 100336a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100336d:	25 ff ff 3f 00       	and    eax,0x3fffff
 1003372:	c1 e8 0c             	shr    eax,0xc
 1003375:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 1003378:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100337b:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 1003381:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1003384:	c1 e0 02             	shl    eax,0x2
 1003387:	01 d0                	add    eax,edx
 1003389:	8b 00                	mov    eax,DWORD PTR [eax]
 100338b:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003390:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 1003393:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100339a:	eb 3f                	jmp    10033db <load_pe+0xe1>
 100339c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100339f:	99                   	cdq    
 10033a0:	c1 ea 16             	shr    edx,0x16
 10033a3:	01 d0                	add    eax,edx
 10033a5:	25 ff 03 00 00       	and    eax,0x3ff
 10033aa:	29 d0                	sub    eax,edx
 10033ac:	89 c2                	mov    edx,eax
 10033ae:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 10033b1:	01 d0                	add    eax,edx
 10033b3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10033ba:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 10033bd:	01 d0                	add    eax,edx
 10033bf:	8b 00                	mov    eax,DWORD PTR [eax]
 10033c1:	83 e0 01             	and    eax,0x1
 10033c4:	85 c0                	test   eax,eax
 10033c6:	74 0f                	je     10033d7 <load_pe+0xdd>
 10033c8:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 10033cc:	74 09                	je     10033d7 <load_pe+0xdd>
 10033ce:	81 45 f4 00 10 00 00 	add    DWORD PTR [ebp-0xc],0x1000
 10033d5:	eb 8a                	jmp    1003361 <load_pe+0x67>
 10033d7:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10033db:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10033de:	3b 45 b8             	cmp    eax,DWORD PTR [ebp-0x48]
 10033e1:	7c b9                	jl     100339c <load_pe+0xa2>
 10033e3:	90                   	nop
 10033e4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10033e7:	68 00 10 00 00       	push   0x1000
 10033ec:	6a 00                	push   0x0
 10033ee:	50                   	push   eax
 10033ef:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 10033f2:	e8 3b e5 ff ff       	call   1001932 <sys_read>
 10033f7:	83 c4 10             	add    esp,0x10
 10033fa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10033fd:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
 1003400:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
 1003403:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 1003406:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003409:	01 d0                	add    eax,edx
 100340b:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 100340e:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003411:	83 c0 04             	add    eax,0x4
 1003414:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
 1003417:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100341a:	8b 40 50             	mov    eax,DWORD PTR [eax+0x50]
 100341d:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
 1003420:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
 1003423:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1003429:	85 c0                	test   eax,eax
 100342b:	0f 48 c2             	cmovs  eax,edx
 100342e:	c1 f8 0c             	sar    eax,0xc
 1003431:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
 1003434:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003437:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
 100343a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100343d:	01 d0                	add    eax,edx
 100343f:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
 1003442:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 1003445:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 100344b:	85 c0                	test   eax,eax
 100344d:	0f 48 c2             	cmovs  eax,edx
 1003450:	c1 f8 0a             	sar    eax,0xa
 1003453:	89 c1                	mov    ecx,eax
 1003455:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 1003458:	99                   	cdq    
 1003459:	c1 ea 16             	shr    edx,0x16
 100345c:	01 d0                	add    eax,edx
 100345e:	25 ff 03 00 00       	and    eax,0x3ff
 1003463:	29 d0                	sub    eax,edx
 1003465:	01 c8                	add    eax,ecx
 1003467:	85 c0                	test   eax,eax
 1003469:	0f 95 c0             	setne  al
 100346c:	0f b6 c0             	movzx  eax,al
 100346f:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 1003472:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 1003475:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 100347b:	85 c0                	test   eax,eax
 100347d:	0f 48 c2             	cmovs  eax,edx
 1003480:	c1 f8 16             	sar    eax,0x16
 1003483:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
 1003486:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003489:	05 f8 00 00 00       	add    eax,0xf8
 100348e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003491:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003494:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 1003498:	0f b7 d0             	movzx  edx,ax
 100349b:	89 d0                	mov    eax,edx
 100349d:	c1 e0 02             	shl    eax,0x2
 10034a0:	01 d0                	add    eax,edx
 10034a2:	c1 e0 03             	shl    eax,0x3
 10034a5:	05 38 01 00 00       	add    eax,0x138
 10034aa:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10034ad:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10034b0:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
 10034b3:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 10034b6:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10034b9:	99                   	cdq    
 10034ba:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10034bd:	89 d0                	mov    eax,edx
 10034bf:	85 c0                	test   eax,eax
 10034c1:	74 17                	je     10034da <load_pe+0x1e0>
 10034c3:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10034c6:	99                   	cdq    
 10034c7:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10034ca:	89 d1                	mov    ecx,edx
 10034cc:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10034cf:	29 c8                	sub    eax,ecx
 10034d1:	89 c2                	mov    edx,eax
 10034d3:	8b 45 84             	mov    eax,DWORD PTR [ebp-0x7c]
 10034d6:	01 d0                	add    eax,edx
 10034d8:	eb 03                	jmp    10034dd <load_pe+0x1e3>
 10034da:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10034dd:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10034e0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 10034e7:	eb 4e                	jmp    1003537 <load_pe+0x23d>
 10034e9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10034ec:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 10034ef:	25 00 00 00 02       	and    eax,0x2000000
 10034f4:	89 85 34 ff ff ff    	mov    DWORD PTR [ebp-0xcc],eax
 10034fa:	83 bd 34 ff ff ff 00 	cmp    DWORD PTR [ebp-0xcc],0x0
 1003501:	75 2b                	jne    100352e <load_pe+0x234>
 1003503:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003506:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1003509:	89 c1                	mov    ecx,eax
 100350b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100350e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1003511:	89 c2                	mov    edx,eax
 1003513:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003516:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
 1003519:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100351c:	01 d8                	add    eax,ebx
 100351e:	51                   	push   ecx
 100351f:	52                   	push   edx
 1003520:	50                   	push   eax
 1003521:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003524:	e8 09 e4 ff ff       	call   1001932 <sys_read>
 1003529:	83 c4 10             	add    esp,0x10
 100352c:	eb 01                	jmp    100352f <load_pe+0x235>
 100352e:	90                   	nop
 100352f:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 1003533:	83 45 ec 28          	add    DWORD PTR [ebp-0x14],0x28
 1003537:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100353a:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 100353e:	0f b7 c0             	movzx  eax,ax
 1003541:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1003544:	7c a3                	jl     10034e9 <load_pe+0x1ef>
 1003546:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003549:	83 e8 80             	sub    eax,0xffffff80
 100354c:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 100354f:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003552:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003555:	85 c0                	test   eax,eax
 1003557:	0f 84 22 02 00 00    	je     100377f <load_pe+0x485>
 100355d:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003560:	8b 10                	mov    edx,DWORD PTR [eax]
 1003562:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003565:	01 d0                	add    eax,edx
 1003567:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100356d:	8b 85 7c ff ff ff    	mov    eax,DWORD PTR [ebp-0x84]
 1003573:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1003576:	e9 f7 01 00 00       	jmp    1003772 <load_pe+0x478>
 100357b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100357e:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1003581:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003584:	01 d0                	add    eax,edx
 1003586:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 100358c:	83 ec 08             	sub    esp,0x8
 100358f:	68 78 70 00 01       	push   0x1007078
 1003594:	ff b5 78 ff ff ff    	push   DWORD PTR [ebp-0x88]
 100359a:	e8 d6 31 00 00       	call   1006775 <strcmp>
 100359f:	83 c4 10             	add    esp,0x10
 10035a2:	85 c0                	test   eax,eax
 10035a4:	75 09                	jne    10035af <load_pe+0x2b5>
 10035a6:	c7 45 e0 00 00 c0 01 	mov    DWORD PTR [ebp-0x20],0x1c00000
 10035ad:	eb 28                	jmp    10035d7 <load_pe+0x2dd>
 10035af:	83 ec 0c             	sub    esp,0xc
 10035b2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10035b5:	e8 40 fd ff ff       	call   10032fa <load_pe>
 10035ba:	83 c4 10             	add    esp,0x10
 10035bd:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 10035c3:	83 ec 0c             	sub    esp,0xc
 10035c6:	ff b5 74 ff ff ff    	push   DWORD PTR [ebp-0x8c]
 10035cc:	e8 43 03 00 00       	call   1003914 <get_module_addr>
 10035d1:	83 c4 10             	add    esp,0x10
 10035d4:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10035d7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10035da:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 10035e0:	8b 85 70 ff ff ff    	mov    eax,DWORD PTR [ebp-0x90]
 10035e6:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 10035e9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10035ec:	01 d0                	add    eax,edx
 10035ee:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 10035f4:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
 10035fa:	8b 50 78             	mov    edx,DWORD PTR [eax+0x78]
 10035fd:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003600:	01 d0                	add    eax,edx
 1003602:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
 1003608:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 100360e:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1003611:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
 1003617:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 100361d:	8b 50 20             	mov    edx,DWORD PTR [eax+0x20]
 1003620:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003623:	01 d0                	add    eax,edx
 1003625:	89 85 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],eax
 100362b:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003631:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
 1003634:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003637:	01 d0                	add    eax,edx
 1003639:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
 100363f:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003645:	8b 50 24             	mov    edx,DWORD PTR [eax+0x24]
 1003648:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100364b:	01 d0                	add    eax,edx
 100364d:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
 1003653:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003659:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100365c:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
 1003662:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003665:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1003668:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100366b:	01 d0                	add    eax,edx
 100366d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1003670:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003673:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1003676:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003679:	01 d0                	add    eax,edx
 100367b:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 100367e:	e9 de 00 00 00       	jmp    1003761 <load_pe+0x467>
 1003683:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003686:	8b 00                	mov    eax,DWORD PTR [eax]
 1003688:	85 c0                	test   eax,eax
 100368a:	79 3e                	jns    10036ca <load_pe+0x3d0>
 100368c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100368f:	8b 00                	mov    eax,DWORD PTR [eax]
 1003691:	25 ff ff ff 7f       	and    eax,0x7fffffff
 1003696:	2b 85 54 ff ff ff    	sub    eax,DWORD PTR [ebp-0xac]
 100369c:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
 10036a2:	8b 85 48 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb8]
 10036a8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10036af:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 10036b5:	01 d0                	add    eax,edx
 10036b7:	8b 10                	mov    edx,DWORD PTR [eax]
 10036b9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10036bc:	01 d0                	add    eax,edx
 10036be:	89 c2                	mov    edx,eax
 10036c0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10036c3:	89 10                	mov    DWORD PTR [eax],edx
 10036c5:	e9 8f 00 00 00       	jmp    1003759 <load_pe+0x45f>
 10036ca:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10036cd:	8b 00                	mov    eax,DWORD PTR [eax]
 10036cf:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
 10036d5:	83 85 50 ff ff ff 02 	add    DWORD PTR [ebp-0xb0],0x2
 10036dc:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 10036e3:	eb 69                	jmp    100374e <load_pe+0x454>
 10036e5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10036e8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10036ef:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa0]
 10036f5:	01 d0                	add    eax,edx
 10036f7:	8b 00                	mov    eax,DWORD PTR [eax]
 10036f9:	83 ec 08             	sub    esp,0x8
 10036fc:	50                   	push   eax
 10036fd:	ff b5 50 ff ff ff    	push   DWORD PTR [ebp-0xb0]
 1003703:	e8 6d 30 00 00       	call   1006775 <strcmp>
 1003708:	83 c4 10             	add    esp,0x10
 100370b:	85 c0                	test   eax,eax
 100370d:	75 3b                	jne    100374a <load_pe+0x450>
 100370f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003712:	8d 14 00             	lea    edx,[eax+eax*1]
 1003715:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa8]
 100371b:	01 d0                	add    eax,edx
 100371d:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003720:	98                   	cwde   
 1003721:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
 1003727:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [ebp-0xb4]
 100372d:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003734:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 100373a:	01 d0                	add    eax,edx
 100373c:	8b 10                	mov    edx,DWORD PTR [eax]
 100373e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003741:	01 d0                	add    eax,edx
 1003743:	89 c2                	mov    edx,eax
 1003745:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003748:	89 10                	mov    DWORD PTR [eax],edx
 100374a:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 100374e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003751:	3b 85 64 ff ff ff    	cmp    eax,DWORD PTR [ebp-0x9c]
 1003757:	7c 8c                	jl     10036e5 <load_pe+0x3eb>
 1003759:	83 45 dc 04          	add    DWORD PTR [ebp-0x24],0x4
 100375d:	83 45 d8 04          	add    DWORD PTR [ebp-0x28],0x4
 1003761:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003764:	8b 00                	mov    eax,DWORD PTR [eax]
 1003766:	85 c0                	test   eax,eax
 1003768:	0f 85 15 ff ff ff    	jne    1003683 <load_pe+0x389>
 100376e:	83 45 e4 14          	add    DWORD PTR [ebp-0x1c],0x14
 1003772:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003775:	8b 00                	mov    eax,DWORD PTR [eax]
 1003777:	85 c0                	test   eax,eax
 1003779:	0f 85 fc fd ff ff    	jne    100357b <load_pe+0x281>
 100377f:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
 1003786:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003789:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [eax+0xa4]
 100378f:	85 c0                	test   eax,eax
 1003791:	0f 84 c7 00 00 00    	je     100385e <load_pe+0x564>
 1003797:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100379a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [eax+0xa0]
 10037a0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037a3:	01 d0                	add    eax,edx
 10037a5:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 10037a8:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 10037ab:	83 c0 40             	add    eax,0x40
 10037ae:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 10037b1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 10037b4:	83 c0 02             	add    eax,0x2
 10037b7:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10037ba:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10037bd:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
 10037c0:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
 10037c6:	e9 86 00 00 00       	jmp    1003851 <load_pe+0x557>
 10037cb:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 10037ce:	8b 10                	mov    edx,DWORD PTR [eax]
 10037d0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037d3:	01 d0                	add    eax,edx
 10037d5:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
 10037db:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
 10037e2:	eb 50                	jmp    1003834 <load_pe+0x53a>
 10037e4:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10037e7:	0f b7 00             	movzx  eax,WORD PTR [eax]
 10037ea:	66 85 c0             	test   ax,ax
 10037ed:	74 40                	je     100382f <load_pe+0x535>
 10037ef:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 10037f2:	0f b7 00             	movzx  eax,WORD PTR [eax]
 10037f5:	0f b7 d0             	movzx  edx,ax
 10037f8:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
 10037fe:	01 d0                	add    eax,edx
 1003800:	89 85 3c ff ff ff    	mov    DWORD PTR [ebp-0xc4],eax
 1003806:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 100380c:	8b 00                	mov    eax,DWORD PTR [eax]
 100380e:	2b 85 44 ff ff ff    	sub    eax,DWORD PTR [ebp-0xbc]
 1003814:	89 c2                	mov    edx,eax
 1003816:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003819:	01 d0                	add    eax,edx
 100381b:	89 c2                	mov    edx,eax
 100381d:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 1003823:	89 10                	mov    DWORD PTR [eax],edx
 1003825:	83 45 cc 04          	add    DWORD PTR [ebp-0x34],0x4
 1003829:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
 100382d:	eb 01                	jmp    1003830 <load_pe+0x536>
 100382f:	90                   	nop
 1003830:	83 45 c4 01          	add    DWORD PTR [ebp-0x3c],0x1
 1003834:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003837:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100383a:	c1 e8 02             	shr    eax,0x2
 100383d:	89 c2                	mov    edx,eax
 100383f:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1003842:	39 c2                	cmp    edx,eax
 1003844:	77 9e                	ja     10037e4 <load_pe+0x4ea>
 1003846:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003849:	05 00 10 00 00       	add    eax,0x1000
 100384e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1003851:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003854:	8b 00                	mov    eax,DWORD PTR [eax]
 1003856:	85 c0                	test   eax,eax
 1003858:	0f 85 6d ff ff ff    	jne    10037cb <load_pe+0x4d1>
 100385e:	c7 85 ec fd ff ff 00 	mov    DWORD PTR [ebp-0x214],0x0
 1003865:	00 00 00 
 1003868:	c7 85 f0 fd ff ff 00 	mov    DWORD PTR [ebp-0x210],0x0
 100386f:	00 00 00 
 1003872:	c7 85 f4 fd ff ff 00 	mov    DWORD PTR [ebp-0x20c],0x0
 1003879:	00 00 00 
 100387c:	c7 85 f8 fd ff ff 00 	mov    DWORD PTR [ebp-0x208],0x0
 1003883:	00 00 00 
 1003886:	83 ec 04             	sub    esp,0x4
 1003889:	6a 10                	push   0x10
 100388b:	8d 85 ec fd ff ff    	lea    eax,[ebp-0x214]
 1003891:	50                   	push   eax
 1003892:	68 00 00 00 01       	push   0x1000000
 1003897:	e8 b3 2c 00 00       	call   100654f <memcpy>
 100389c:	83 c4 10             	add    esp,0x10
 100389f:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10038a4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10038aa:	05 70 2c 40 00       	add    eax,0x402c70
 10038af:	c7 40 04 00 00 00 01 	mov    DWORD PTR [eax+0x4],0x1000000
 10038b6:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 10038bb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10038c1:	05 70 2c 40 00       	add    eax,0x402c70
 10038c6:	c7 40 08 00 10 00 01 	mov    DWORD PTR [eax+0x8],0x1001000
 10038cd:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 10038d0:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
 10038d6:	83 ec 08             	sub    esp,0x8
 10038d9:	6a 00                	push   0x0
 10038db:	6a 00                	push   0x0
 10038dd:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
 10038e3:	ff d0                	call   eax
 10038e5:	83 c4 10             	add    esp,0x10
 10038e8:	8b 15 c8 8a 40 00    	mov    edx,DWORD PTR ds:0x408ac8
 10038ee:	89 c1                	mov    ecx,eax
 10038f0:	69 c2 78 01 00 00    	imul   eax,edx,0x178
 10038f6:	05 70 2c 40 00       	add    eax,0x402c70
 10038fb:	89 08                	mov    DWORD PTR [eax],ecx
 10038fd:	a1 c8 8a 40 00       	mov    eax,ds:0x408ac8
 1003902:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003908:	05 70 2c 40 00       	add    eax,0x402c70
 100390d:	8b 00                	mov    eax,DWORD PTR [eax]
 100390f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1003912:	c9                   	leave  
 1003913:	c3                   	ret    

01003914 <get_module_addr>:
 1003914:	55                   	push   ebp
 1003915:	89 e5                	mov    ebp,esp
 1003917:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100391a:	8b 04 c5 e0 b6 41 00 	mov    eax,DWORD PTR [eax*8+0x41b6e0]
 1003921:	5d                   	pop    ebp
 1003922:	c3                   	ret    

01003923 <dispose_library>:
 1003923:	55                   	push   ebp
 1003924:	89 e5                	mov    ebp,esp
 1003926:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 100392a:	78 09                	js     1003935 <dispose_library+0x12>
 100392c:	81 7d 08 ff 00 00 00 	cmp    DWORD PTR [ebp+0x8],0xff
 1003933:	7e 07                	jle    100393c <dispose_library+0x19>
 1003935:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100393a:	eb 19                	jmp    1003955 <dispose_library+0x32>
 100393c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100393f:	69 c0 2c 01 00 00    	imul   eax,eax,0x12c
 1003945:	05 e8 8a 40 00       	add    eax,0x408ae8
 100394a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003950:	b8 00 00 00 00       	mov    eax,0x0
 1003955:	5d                   	pop    ebp
 1003956:	c3                   	ret    

01003957 <load_elf>:
 1003957:	55                   	push   ebp
 1003958:	89 e5                	mov    ebp,esp
 100395a:	56                   	push   esi
 100395b:	53                   	push   ebx
 100395c:	83 ec 60             	sub    esp,0x60
 100395f:	89 e0                	mov    eax,esp
 1003961:	89 c6                	mov    esi,eax
 1003963:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003966:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 100396c:	8b 00                	mov    eax,DWORD PTR [eax]
 100396e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003971:	6a 34                	push   0x34
 1003973:	6a 00                	push   0x0
 1003975:	8d 45 98             	lea    eax,[ebp-0x68]
 1003978:	50                   	push   eax
 1003979:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 100397c:	e8 b1 df ff ff       	call   1001932 <sys_read>
 1003981:	83 c4 10             	add    esp,0x10
 1003984:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 100398b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1003992:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003995:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 100399b:	85 c0                	test   eax,eax
 100399d:	0f 48 c2             	cmovs  eax,edx
 10039a0:	c1 f8 16             	sar    eax,0x16
 10039a3:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10039a6:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 10039a9:	99                   	cdq    
 10039aa:	c1 ea 0a             	shr    edx,0xa
 10039ad:	01 d0                	add    eax,edx
 10039af:	25 ff ff 3f 00       	and    eax,0x3fffff
 10039b4:	29 d0                	sub    eax,edx
 10039b6:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10039bc:	85 c0                	test   eax,eax
 10039be:	0f 48 c2             	cmovs  eax,edx
 10039c1:	c1 f8 0c             	sar    eax,0xc
 10039c4:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10039c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10039ca:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 10039d0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10039d3:	c1 e0 02             	shl    eax,0x2
 10039d6:	01 d0                	add    eax,edx
 10039d8:	8b 00                	mov    eax,DWORD PTR [eax]
 10039da:	25 00 f0 ff ff       	and    eax,0xfffff000
 10039df:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 10039e2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10039e9:	eb 68                	jmp    1003a53 <load_elf+0xfc>
 10039eb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10039ee:	8b 88 84 00 00 00    	mov    ecx,DWORD PTR [eax+0x84]
 10039f4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10039f7:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 10039fd:	85 c0                	test   eax,eax
 10039ff:	0f 48 c2             	cmovs  eax,edx
 1003a02:	c1 f8 0a             	sar    eax,0xa
 1003a05:	89 c2                	mov    edx,eax
 1003a07:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003a0a:	01 d0                	add    eax,edx
 1003a0c:	c1 e0 02             	shl    eax,0x2
 1003a0f:	01 c8                	add    eax,ecx
 1003a11:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a13:	83 e0 01             	and    eax,0x1
 1003a16:	85 c0                	test   eax,eax
 1003a18:	75 2c                	jne    1003a46 <load_elf+0xef>
 1003a1a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003a1d:	99                   	cdq    
 1003a1e:	c1 ea 16             	shr    edx,0x16
 1003a21:	01 d0                	add    eax,edx
 1003a23:	25 ff 03 00 00       	and    eax,0x3ff
 1003a28:	29 d0                	sub    eax,edx
 1003a2a:	89 c2                	mov    edx,eax
 1003a2c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003a2f:	01 d0                	add    eax,edx
 1003a31:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003a38:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1003a3b:	01 d0                	add    eax,edx
 1003a3d:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a3f:	83 e0 01             	and    eax,0x1
 1003a42:	85 c0                	test   eax,eax
 1003a44:	74 09                	je     1003a4f <load_elf+0xf8>
 1003a46:	81 45 e8 00 10 00 00 	add    DWORD PTR [ebp-0x18],0x1000
 1003a4d:	eb 0c                	jmp    1003a5b <load_elf+0x104>
 1003a4f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1003a53:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003a56:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 1003a59:	7c 90                	jl     10039eb <load_elf+0x94>
 1003a5b:	90                   	nop
 1003a5c:	0f b7 45 c4          	movzx  eax,WORD PTR [ebp-0x3c]
 1003a60:	0f b7 c0             	movzx  eax,ax
 1003a63:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1003a66:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003a69:	8d 50 ff             	lea    edx,[eax-0x1]
 1003a6c:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1003a6f:	c1 e0 05             	shl    eax,0x5
 1003a72:	89 c2                	mov    edx,eax
 1003a74:	b8 10 00 00 00       	mov    eax,0x10
 1003a79:	83 e8 01             	sub    eax,0x1
 1003a7c:	01 d0                	add    eax,edx
 1003a7e:	bb 10 00 00 00       	mov    ebx,0x10
 1003a83:	ba 00 00 00 00       	mov    edx,0x0
 1003a88:	f7 f3                	div    ebx
 1003a8a:	6b c0 10             	imul   eax,eax,0x10
 1003a8d:	89 c1                	mov    ecx,eax
 1003a8f:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1003a95:	89 e2                	mov    edx,esp
 1003a97:	29 ca                	sub    edx,ecx
 1003a99:	39 d4                	cmp    esp,edx
 1003a9b:	74 10                	je     1003aad <load_elf+0x156>
 1003a9d:	81 ec 00 10 00 00    	sub    esp,0x1000
 1003aa3:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1003aaa:	00 
 1003aab:	eb ec                	jmp    1003a99 <load_elf+0x142>
 1003aad:	89 c2                	mov    edx,eax
 1003aaf:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003ab5:	29 d4                	sub    esp,edx
 1003ab7:	89 c2                	mov    edx,eax
 1003ab9:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003abf:	85 d2                	test   edx,edx
 1003ac1:	74 0d                	je     1003ad0 <load_elf+0x179>
 1003ac3:	25 ff 0f 00 00       	and    eax,0xfff
 1003ac8:	83 e8 04             	sub    eax,0x4
 1003acb:	01 e0                	add    eax,esp
 1003acd:	83 08 00             	or     DWORD PTR [eax],0x0
 1003ad0:	89 e0                	mov    eax,esp
 1003ad2:	83 c0 00             	add    eax,0x0
 1003ad5:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1003ad8:	0f b7 45 c2          	movzx  eax,WORD PTR [ebp-0x3e]
 1003adc:	0f b7 c0             	movzx  eax,ax
 1003adf:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
 1003ae2:	50                   	push   eax
 1003ae3:	52                   	push   edx
 1003ae4:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 1003ae7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003aea:	e8 43 de ff ff       	call   1001932 <sys_read>
 1003aef:	83 c4 10             	add    esp,0x10
 1003af2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1003af9:	eb 59                	jmp    1003b54 <load_elf+0x1fd>
 1003afb:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003afe:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003b01:	c1 e0 05             	shl    eax,0x5
 1003b04:	01 d0                	add    eax,edx
 1003b06:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b08:	83 e0 01             	and    eax,0x1
 1003b0b:	85 c0                	test   eax,eax
 1003b0d:	74 40                	je     1003b4f <load_elf+0x1f8>
 1003b0f:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003b12:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003b15:	c1 e0 05             	shl    eax,0x5
 1003b18:	01 d0                	add    eax,edx
 1003b1a:	83 c0 10             	add    eax,0x10
 1003b1d:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b1f:	89 c1                	mov    ecx,eax
 1003b21:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003b24:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003b27:	c1 e0 05             	shl    eax,0x5
 1003b2a:	01 d0                	add    eax,edx
 1003b2c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003b2f:	89 c2                	mov    edx,eax
 1003b31:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
 1003b34:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003b37:	c1 e0 05             	shl    eax,0x5
 1003b3a:	01 d8                	add    eax,ebx
 1003b3c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1003b3f:	51                   	push   ecx
 1003b40:	52                   	push   edx
 1003b41:	50                   	push   eax
 1003b42:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003b45:	e8 e8 dd ff ff       	call   1001932 <sys_read>
 1003b4a:	83 c4 10             	add    esp,0x10
 1003b4d:	eb 01                	jmp    1003b50 <load_elf+0x1f9>
 1003b4f:	90                   	nop
 1003b50:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1003b54:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003b57:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 1003b5a:	7c 9f                	jl     1003afb <load_elf+0x1a4>
 1003b5c:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1003b5f:	89 c2                	mov    edx,eax
 1003b61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003b64:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 1003b6a:	b8 00 00 00 00       	mov    eax,0x0
 1003b6f:	89 f4                	mov    esp,esi
 1003b71:	8d 65 f8             	lea    esp,[ebp-0x8]
 1003b74:	5b                   	pop    ebx
 1003b75:	5e                   	pop    esi
 1003b76:	5d                   	pop    ebp
 1003b77:	c3                   	ret    

01003b78 <sys_insmod>:
 1003b78:	55                   	push   ebp
 1003b79:	89 e5                	mov    ebp,esp
 1003b7b:	90                   	nop
 1003b7c:	5d                   	pop    ebp
 1003b7d:	c3                   	ret    

01003b7e <sys_rmmod>:
 1003b7e:	55                   	push   ebp
 1003b7f:	89 e5                	mov    ebp,esp
 1003b81:	90                   	nop
 1003b82:	5d                   	pop    ebp
 1003b83:	c3                   	ret    
 1003b84:	66 90                	xchg   ax,ax
 1003b86:	66 90                	xchg   ax,ax
 1003b88:	66 90                	xchg   ax,ax
 1003b8a:	66 90                	xchg   ax,ax
 1003b8c:	66 90                	xchg   ax,ax
 1003b8e:	66 90                	xchg   ax,ax

01003b90 <_syscall>:
 1003b90:	57                   	push   edi
 1003b91:	56                   	push   esi
 1003b92:	52                   	push   edx
 1003b93:	51                   	push   ecx
 1003b94:	53                   	push   ebx
 1003b95:	50                   	push   eax
 1003b96:	e8 89 c8 ff ff       	call   1000424 <syscall>
 1003b9b:	83 c4 18             	add    esp,0x18
 1003b9e:	cf                   	iret   

01003b9f <shift>:
 1003b9f:	55                   	push   ebp
 1003ba0:	89 e5                	mov    ebp,esp
 1003ba2:	0f b6 05 ed c4 41 00 	movzx  eax,BYTE PTR ds:0x41c4ed
 1003ba9:	84 c0                	test   al,al
 1003bab:	0f 94 c0             	sete   al
 1003bae:	a2 ed c4 41 00       	mov    ds:0x41c4ed,al
 1003bb3:	90                   	nop
 1003bb4:	5d                   	pop    ebp
 1003bb5:	c3                   	ret    

01003bb6 <ctrl>:
 1003bb6:	55                   	push   ebp
 1003bb7:	89 e5                	mov    ebp,esp
 1003bb9:	0f b6 05 ee c4 41 00 	movzx  eax,BYTE PTR ds:0x41c4ee
 1003bc0:	84 c0                	test   al,al
 1003bc2:	0f 94 c0             	sete   al
 1003bc5:	a2 ee c4 41 00       	mov    ds:0x41c4ee,al
 1003bca:	90                   	nop
 1003bcb:	5d                   	pop    ebp
 1003bcc:	c3                   	ret    

01003bcd <capslock>:
 1003bcd:	55                   	push   ebp
 1003bce:	89 e5                	mov    ebp,esp
 1003bd0:	0f b6 05 ef c4 41 00 	movzx  eax,BYTE PTR ds:0x41c4ef
 1003bd7:	84 c0                	test   al,al
 1003bd9:	0f 94 c0             	sete   al
 1003bdc:	a2 ef c4 41 00       	mov    ds:0x41c4ef,al
 1003be1:	90                   	nop
 1003be2:	5d                   	pop    ebp
 1003be3:	c3                   	ret    

01003be4 <to_ascii>:
 1003be4:	55                   	push   ebp
 1003be5:	89 e5                	mov    ebp,esp
 1003be7:	83 ec 14             	sub    esp,0x14
 1003bea:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003bed:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1003bf0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1003bf7:	e9 99 00 00 00       	jmp    1003c95 <to_ascii+0xb1>
 1003bfc:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003bff:	89 d0                	mov    eax,edx
 1003c01:	c1 e0 02             	shl    eax,0x2
 1003c04:	01 d0                	add    eax,edx
 1003c06:	05 22 71 00 01       	add    eax,0x1007122
 1003c0b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c0e:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 1003c11:	75 7e                	jne    1003c91 <to_ascii+0xad>
 1003c13:	0f b6 05 ef c4 41 00 	movzx  eax,BYTE PTR ds:0x41c4ef
 1003c1a:	84 c0                	test   al,al
 1003c1c:	74 40                	je     1003c5e <to_ascii+0x7a>
 1003c1e:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003c21:	89 d0                	mov    eax,edx
 1003c23:	c1 e0 02             	shl    eax,0x2
 1003c26:	01 d0                	add    eax,edx
 1003c28:	05 20 71 00 01       	add    eax,0x1007120
 1003c2d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c30:	3c 60                	cmp    al,0x60
 1003c32:	7e 2a                	jle    1003c5e <to_ascii+0x7a>
 1003c34:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003c37:	89 d0                	mov    eax,edx
 1003c39:	c1 e0 02             	shl    eax,0x2
 1003c3c:	01 d0                	add    eax,edx
 1003c3e:	05 20 71 00 01       	add    eax,0x1007120
 1003c43:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c46:	3c 7a                	cmp    al,0x7a
 1003c48:	7f 14                	jg     1003c5e <to_ascii+0x7a>
 1003c4a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003c4d:	89 d0                	mov    eax,edx
 1003c4f:	c1 e0 02             	shl    eax,0x2
 1003c52:	01 d0                	add    eax,edx
 1003c54:	05 21 71 00 01       	add    eax,0x1007121
 1003c59:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c5c:	eb 46                	jmp    1003ca4 <to_ascii+0xc0>
 1003c5e:	0f b6 05 ed c4 41 00 	movzx  eax,BYTE PTR ds:0x41c4ed
 1003c65:	84 c0                	test   al,al
 1003c67:	74 14                	je     1003c7d <to_ascii+0x99>
 1003c69:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003c6c:	89 d0                	mov    eax,edx
 1003c6e:	c1 e0 02             	shl    eax,0x2
 1003c71:	01 d0                	add    eax,edx
 1003c73:	05 21 71 00 01       	add    eax,0x1007121
 1003c78:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c7b:	eb 27                	jmp    1003ca4 <to_ascii+0xc0>
 1003c7d:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003c80:	89 d0                	mov    eax,edx
 1003c82:	c1 e0 02             	shl    eax,0x2
 1003c85:	01 d0                	add    eax,edx
 1003c87:	05 20 71 00 01       	add    eax,0x1007120
 1003c8c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003c8f:	eb 13                	jmp    1003ca4 <to_ascii+0xc0>
 1003c91:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1003c95:	83 7d fc 5d          	cmp    DWORD PTR [ebp-0x4],0x5d
 1003c99:	0f 8e 5d ff ff ff    	jle    1003bfc <to_ascii+0x18>
 1003c9f:	b8 00 00 00 00       	mov    eax,0x0
 1003ca4:	c9                   	leave  
 1003ca5:	c3                   	ret    

01003ca6 <init_kb>:
 1003ca6:	55                   	push   ebp
 1003ca7:	89 e5                	mov    ebp,esp
 1003ca9:	83 ec 08             	sub    esp,0x8
 1003cac:	83 ec 0c             	sub    esp,0xc
 1003caf:	68 e0 70 00 01       	push   0x10070e0
 1003cb4:	e8 dc dd ff ff       	call   1001a95 <reg_device>
 1003cb9:	83 c4 10             	add    esp,0x10
 1003cbc:	83 ec 0c             	sub    esp,0xc
 1003cbf:	68 80 70 00 01       	push   0x1007080
 1003cc4:	e8 81 de ff ff       	call   1001b4a <reg_driver>
 1003cc9:	83 c4 10             	add    esp,0x10
 1003ccc:	90                   	nop
 1003ccd:	c9                   	leave  
 1003cce:	c3                   	ret    

01003ccf <key_proc>:
 1003ccf:	55                   	push   ebp
 1003cd0:	89 e5                	mov    ebp,esp
 1003cd2:	83 ec 18             	sub    esp,0x18
 1003cd5:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
 1003cd9:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
 1003cdd:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
 1003ce1:	83 ec 0c             	sub    esp,0xc
 1003ce4:	6a 60                	push   0x60
 1003ce6:	e8 f5 f1 ff ff       	call   1002ee0 <inb>
 1003ceb:	83 c4 10             	add    esp,0x10
 1003cee:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
 1003cf1:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 1003cf5:	0f be c0             	movsx  eax,al
 1003cf8:	83 ec 0c             	sub    esp,0xc
 1003cfb:	50                   	push   eax
 1003cfc:	e8 e3 fe ff ff       	call   1003be4 <to_ascii>
 1003d01:	83 c4 10             	add    esp,0x10
 1003d04:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 1003d07:	80 7d f5 e0          	cmp    BYTE PTR [ebp-0xb],0xe0
 1003d0b:	74 06                	je     1003d13 <key_proc+0x44>
 1003d0d:	80 7d f5 e1          	cmp    BYTE PTR [ebp-0xb],0xe1
 1003d11:	75 26                	jne    1003d39 <key_proc+0x6a>
 1003d13:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1003d17:	0f be c0             	movsx  eax,al
 1003d1a:	83 ec 0c             	sub    esp,0xc
 1003d1d:	50                   	push   eax
 1003d1e:	e8 c1 fe ff ff       	call   1003be4 <to_ascii>
 1003d23:	83 c4 10             	add    esp,0x10
 1003d26:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 1003d29:	83 ec 0c             	sub    esp,0xc
 1003d2c:	6a 60                	push   0x60
 1003d2e:	e8 ad f1 ff ff       	call   1002ee0 <inb>
 1003d33:	83 c4 10             	add    esp,0x10
 1003d36:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 1003d39:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 1003d3d:	88 45 f2             	mov    BYTE PTR [ebp-0xe],al
 1003d40:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1003d44:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
 1003d47:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
 1003d4b:	88 45 f0             	mov    BYTE PTR [ebp-0x10],al
 1003d4e:	8b 15 58 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c58
 1003d54:	a1 54 6c 00 01       	mov    eax,ds:0x1006c54
 1003d59:	39 c2                	cmp    edx,eax
 1003d5b:	74 3a                	je     1003d97 <key_proc+0xc8>
 1003d5d:	8b 15 50 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c50
 1003d63:	a1 58 6c 00 01       	mov    eax,ds:0x1006c58
 1003d68:	89 c1                	mov    ecx,eax
 1003d6a:	89 c8                	mov    eax,ecx
 1003d6c:	c1 e0 02             	shl    eax,0x2
 1003d6f:	01 c8                	add    eax,ecx
 1003d71:	01 d0                	add    eax,edx
 1003d73:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1003d76:	89 10                	mov    DWORD PTR [eax],edx
 1003d78:	0f b6 55 f4          	movzx  edx,BYTE PTR [ebp-0xc]
 1003d7c:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 1003d7f:	a1 58 6c 00 01       	mov    eax,ds:0x1006c58
 1003d84:	83 c0 01             	add    eax,0x1
 1003d87:	8b 0d 5c 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006c5c
 1003d8d:	99                   	cdq    
 1003d8e:	f7 f9                	idiv   ecx
 1003d90:	89 d0                	mov    eax,edx
 1003d92:	a3 58 6c 00 01       	mov    ds:0x1006c58,eax
 1003d97:	e8 5d f1 ff ff       	call   1002ef9 <eoi>
 1003d9c:	c9                   	leave  
 1003d9d:	cf                   	iret   
 1003d9e:	90                   	nop
 1003d9f:	c9                   	leave  
 1003da0:	c3                   	ret    

01003da1 <sys_getkbc>:
 1003da1:	55                   	push   ebp
 1003da2:	89 e5                	mov    ebp,esp
 1003da4:	83 ec 10             	sub    esp,0x10
 1003da7:	8b 15 58 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c58
 1003dad:	a1 54 6c 00 01       	mov    eax,ds:0x1006c54
 1003db2:	39 c2                	cmp    edx,eax
 1003db4:	75 07                	jne    1003dbd <sys_getkbc+0x1c>
 1003db6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003dbb:	eb 3a                	jmp    1003df7 <sys_getkbc+0x56>
 1003dbd:	8b 15 58 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c58
 1003dc3:	89 d0                	mov    eax,edx
 1003dc5:	c1 e0 02             	shl    eax,0x2
 1003dc8:	01 d0                	add    eax,edx
 1003dca:	05 e0 ba 41 00       	add    eax,0x41bae0
 1003dcf:	8b 10                	mov    edx,DWORD PTR [eax]
 1003dd1:	89 55 fb             	mov    DWORD PTR [ebp-0x5],edx
 1003dd4:	0f b6 40 04          	movzx  eax,BYTE PTR [eax+0x4]
 1003dd8:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 1003ddb:	a1 58 6c 00 01       	mov    eax,ds:0x1006c58
 1003de0:	83 c0 01             	add    eax,0x1
 1003de3:	8b 0d 5c 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006c5c
 1003de9:	99                   	cdq    
 1003dea:	f7 f9                	idiv   ecx
 1003dec:	89 d0                	mov    eax,edx
 1003dee:	a3 58 6c 00 01       	mov    ds:0x1006c58,eax
 1003df3:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
 1003df7:	c9                   	leave  
 1003df8:	c3                   	ret    

01003df9 <init_disk>:
 1003df9:	55                   	push   ebp
 1003dfa:	89 e5                	mov    ebp,esp
 1003dfc:	83 ec 08             	sub    esp,0x8
 1003dff:	83 ec 0c             	sub    esp,0xc
 1003e02:	68 60 6c 00 01       	push   0x1006c60
 1003e07:	e8 89 dc ff ff       	call   1001a95 <reg_device>
 1003e0c:	83 c4 10             	add    esp,0x10
 1003e0f:	a3 48 df 41 00       	mov    ds:0x41df48,eax
 1003e14:	83 ec 0c             	sub    esp,0xc
 1003e17:	68 a0 6c 00 01       	push   0x1006ca0
 1003e1c:	e8 29 dd ff ff       	call   1001b4a <reg_driver>
 1003e21:	83 c4 10             	add    esp,0x10
 1003e24:	a3 44 df 41 00       	mov    ds:0x41df44,eax
 1003e29:	c7 05 8c 6c 00 01 a0 	mov    DWORD PTR ds:0x1006c8c,0x1006ca0
 1003e30:	6c 00 01 
 1003e33:	b8 00 00 00 00       	mov    eax,0x0
 1003e38:	c9                   	leave  
 1003e39:	c3                   	ret    

01003e3a <disk_int_handler_c>:
 1003e3a:	55                   	push   ebp
 1003e3b:	89 e5                	mov    ebp,esp
 1003e3d:	83 ec 18             	sub    esp,0x18
 1003e40:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003e45:	85 c0                	test   eax,eax
 1003e47:	75 0a                	jne    1003e53 <disk_int_handler_c+0x19>
 1003e49:	b8 01 00 00 00       	mov    eax,0x1
 1003e4e:	e9 e3 00 00 00       	jmp    1003f36 <disk_int_handler_c+0xfc>
 1003e53:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003e58:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1003e5b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003e5e:	c7 45 f0 f0 01 00 00 	mov    DWORD PTR [ebp-0x10],0x1f0
 1003e65:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003e6a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003e6d:	83 f8 02             	cmp    eax,0x2
 1003e70:	74 0d                	je     1003e7f <disk_int_handler_c+0x45>
 1003e72:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003e77:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003e7a:	83 f8 03             	cmp    eax,0x3
 1003e7d:	75 07                	jne    1003e86 <disk_int_handler_c+0x4c>
 1003e7f:	c7 45 f0 70 01 00 00 	mov    DWORD PTR [ebp-0x10],0x170
 1003e86:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003e8b:	8b 00                	mov    eax,DWORD PTR [eax]
 1003e8d:	85 c0                	test   eax,eax
 1003e8f:	75 3f                	jne    1003ed0 <disk_int_handler_c+0x96>
 1003e91:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1003e98:	eb 24                	jmp    1003ebe <disk_int_handler_c+0x84>
 1003e9a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003e9d:	0f b7 c0             	movzx  eax,ax
 1003ea0:	83 ec 0c             	sub    esp,0xc
 1003ea3:	50                   	push   eax
 1003ea4:	e8 43 f0 ff ff       	call   1002eec <inw>
 1003ea9:	83 c4 10             	add    esp,0x10
 1003eac:	89 c2                	mov    edx,eax
 1003eae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003eb1:	8d 48 02             	lea    ecx,[eax+0x2]
 1003eb4:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 1003eb7:	66 89 10             	mov    WORD PTR [eax],dx
 1003eba:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1003ebe:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003ec3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1003ec6:	c1 e0 08             	shl    eax,0x8
 1003ec9:	39 45 ec             	cmp    DWORD PTR [ebp-0x14],eax
 1003ecc:	7c cc                	jl     1003e9a <disk_int_handler_c+0x60>
 1003ece:	eb 4b                	jmp    1003f1b <disk_int_handler_c+0xe1>
 1003ed0:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003ed5:	8b 00                	mov    eax,DWORD PTR [eax]
 1003ed7:	83 f8 01             	cmp    eax,0x1
 1003eda:	75 3f                	jne    1003f1b <disk_int_handler_c+0xe1>
 1003edc:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 1003ee3:	eb 26                	jmp    1003f0b <disk_int_handler_c+0xd1>
 1003ee5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003ee8:	8d 50 02             	lea    edx,[eax+0x2]
 1003eeb:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1003eee:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003ef1:	0f b7 d0             	movzx  edx,ax
 1003ef4:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003ef7:	0f b7 c0             	movzx  eax,ax
 1003efa:	83 ec 08             	sub    esp,0x8
 1003efd:	52                   	push   edx
 1003efe:	50                   	push   eax
 1003eff:	e8 cc ef ff ff       	call   1002ed0 <outw>
 1003f04:	83 c4 10             	add    esp,0x10
 1003f07:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 1003f0b:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003f10:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1003f13:	c1 e0 08             	shl    eax,0x8
 1003f16:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1003f19:	7c ca                	jl     1003ee5 <disk_int_handler_c+0xab>
 1003f1b:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1003f20:	c7 40 18 02 00 00 00 	mov    DWORD PTR [eax+0x18],0x2
 1003f27:	c7 05 40 df 41 00 00 	mov    DWORD PTR ds:0x41df40,0x0
 1003f2e:	00 00 00 
 1003f31:	b8 00 00 00 00       	mov    eax,0x0
 1003f36:	c9                   	leave  
 1003f37:	c3                   	ret    

01003f38 <check_dreq_stat>:
 1003f38:	55                   	push   ebp
 1003f39:	89 e5                	mov    ebp,esp
 1003f3b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003f3e:	6b c0 1c             	imul   eax,eax,0x1c
 1003f41:	05 18 c5 41 00       	add    eax,0x41c518
 1003f46:	8b 00                	mov    eax,DWORD PTR [eax]
 1003f48:	5d                   	pop    ebp
 1003f49:	c3                   	ret    

01003f4a <request>:
 1003f4a:	55                   	push   ebp
 1003f4b:	89 e5                	mov    ebp,esp
 1003f4d:	83 ec 10             	sub    esp,0x10
 1003f50:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003f55:	8d 48 01             	lea    ecx,[eax+0x1]
 1003f58:	ba 89 88 88 88       	mov    edx,0x88888889
 1003f5d:	89 c8                	mov    eax,ecx
 1003f5f:	f7 ea                	imul   edx
 1003f61:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1003f64:	c1 f8 07             	sar    eax,0x7
 1003f67:	89 ca                	mov    edx,ecx
 1003f69:	c1 fa 1f             	sar    edx,0x1f
 1003f6c:	29 d0                	sub    eax,edx
 1003f6e:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 1003f74:	89 c8                	mov    eax,ecx
 1003f76:	29 d0                	sub    eax,edx
 1003f78:	8b 15 4c df 41 00    	mov    edx,DWORD PTR ds:0x41df4c
 1003f7e:	39 d0                	cmp    eax,edx
 1003f80:	75 0a                	jne    1003f8c <request+0x42>
 1003f82:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003f87:	e9 aa 00 00 00       	jmp    1004036 <request+0xec>
 1003f8c:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003f91:	6b c0 1c             	imul   eax,eax,0x1c
 1003f94:	8d 90 04 c5 41 00    	lea    edx,[eax+0x41c504]
 1003f9a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003f9d:	89 02                	mov    DWORD PTR [edx],eax
 1003f9f:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003fa4:	6b c0 1c             	imul   eax,eax,0x1c
 1003fa7:	8d 90 00 c5 41 00    	lea    edx,[eax+0x41c500]
 1003fad:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1003fb0:	89 02                	mov    DWORD PTR [edx],eax
 1003fb2:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003fb7:	6b c0 1c             	imul   eax,eax,0x1c
 1003fba:	8d 90 08 c5 41 00    	lea    edx,[eax+0x41c508]
 1003fc0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003fc3:	89 02                	mov    DWORD PTR [edx],eax
 1003fc5:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003fca:	6b c0 1c             	imul   eax,eax,0x1c
 1003fcd:	8d 90 0c c5 41 00    	lea    edx,[eax+0x41c50c]
 1003fd3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003fd6:	89 02                	mov    DWORD PTR [edx],eax
 1003fd8:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003fdd:	6b c0 1c             	imul   eax,eax,0x1c
 1003fe0:	05 18 c5 41 00       	add    eax,0x41c518
 1003fe5:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003feb:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1003ff0:	6b c0 1c             	imul   eax,eax,0x1c
 1003ff3:	8d 90 10 c5 41 00    	lea    edx,[eax+0x41c510]
 1003ff9:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
 1003ffc:	89 02                	mov    DWORD PTR [edx],eax
 1003ffe:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 1004003:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004006:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 100400b:	8d 48 01             	lea    ecx,[eax+0x1]
 100400e:	ba 89 88 88 88       	mov    edx,0x88888889
 1004013:	89 c8                	mov    eax,ecx
 1004015:	f7 ea                	imul   edx
 1004017:	8d 04 0a             	lea    eax,[edx+ecx*1]
 100401a:	c1 f8 07             	sar    eax,0x7
 100401d:	89 ca                	mov    edx,ecx
 100401f:	c1 fa 1f             	sar    edx,0x1f
 1004022:	29 d0                	sub    eax,edx
 1004024:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 100402a:	89 c8                	mov    eax,ecx
 100402c:	29 d0                	sub    eax,edx
 100402e:	a3 50 df 41 00       	mov    ds:0x41df50,eax
 1004033:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004036:	c9                   	leave  
 1004037:	c3                   	ret    

01004038 <execute_request>:
 1004038:	55                   	push   ebp
 1004039:	89 e5                	mov    ebp,esp
 100403b:	53                   	push   ebx
 100403c:	83 ec 14             	sub    esp,0x14
 100403f:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1004044:	85 c0                	test   eax,eax
 1004046:	74 0a                	je     1004052 <execute_request+0x1a>
 1004048:	b8 02 00 00 00       	mov    eax,0x2
 100404d:	e9 03 01 00 00       	jmp    1004155 <execute_request+0x11d>
 1004052:	8b 15 4c df 41 00    	mov    edx,DWORD PTR ds:0x41df4c
 1004058:	a1 50 df 41 00       	mov    eax,ds:0x41df50
 100405d:	39 c2                	cmp    edx,eax
 100405f:	75 0a                	jne    100406b <execute_request+0x33>
 1004061:	b8 01 00 00 00       	mov    eax,0x1
 1004066:	e9 ea 00 00 00       	jmp    1004155 <execute_request+0x11d>
 100406b:	a1 4c df 41 00       	mov    eax,ds:0x41df4c
 1004070:	6b c0 1c             	imul   eax,eax,0x1c
 1004073:	05 00 c5 41 00       	add    eax,0x41c500
 1004078:	a3 40 df 41 00       	mov    ds:0x41df40,eax
 100407d:	a1 4c df 41 00       	mov    eax,ds:0x41df4c
 1004082:	8d 48 01             	lea    ecx,[eax+0x1]
 1004085:	ba 89 88 88 88       	mov    edx,0x88888889
 100408a:	89 c8                	mov    eax,ecx
 100408c:	f7 ea                	imul   edx
 100408e:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1004091:	c1 f8 07             	sar    eax,0x7
 1004094:	89 ca                	mov    edx,ecx
 1004096:	c1 fa 1f             	sar    edx,0x1f
 1004099:	29 d0                	sub    eax,edx
 100409b:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 10040a1:	89 c8                	mov    eax,ecx
 10040a3:	29 d0                	sub    eax,edx
 10040a5:	a3 4c df 41 00       	mov    ds:0x41df4c,eax
 10040aa:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040af:	c7 40 18 01 00 00 00 	mov    DWORD PTR [eax+0x18],0x1
 10040b6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10040bd:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040c2:	8b 00                	mov    eax,DWORD PTR [eax]
 10040c4:	83 f8 02             	cmp    eax,0x2
 10040c7:	74 76                	je     100413f <execute_request+0x107>
 10040c9:	83 f8 02             	cmp    eax,0x2
 10040cc:	7f 74                	jg     1004142 <execute_request+0x10a>
 10040ce:	85 c0                	test   eax,eax
 10040d0:	74 07                	je     10040d9 <execute_request+0xa1>
 10040d2:	83 f8 01             	cmp    eax,0x1
 10040d5:	74 35                	je     100410c <execute_request+0xd4>
 10040d7:	eb 69                	jmp    1004142 <execute_request+0x10a>
 10040d9:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040de:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 10040e1:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040e6:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10040e9:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040ee:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10040f1:	89 c3                	mov    ebx,eax
 10040f3:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 10040f8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10040fb:	51                   	push   ecx
 10040fc:	52                   	push   edx
 10040fd:	53                   	push   ebx
 10040fe:	50                   	push   eax
 10040ff:	e8 56 00 00 00       	call   100415a <async_read_disk>
 1004104:	83 c4 10             	add    esp,0x10
 1004107:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100410a:	eb 37                	jmp    1004143 <execute_request+0x10b>
 100410c:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1004111:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1004114:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1004119:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100411c:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 1004121:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004124:	89 c3                	mov    ebx,eax
 1004126:	a1 40 df 41 00       	mov    eax,ds:0x41df40
 100412b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100412e:	51                   	push   ecx
 100412f:	52                   	push   edx
 1004130:	53                   	push   ebx
 1004131:	50                   	push   eax
 1004132:	e8 3e 01 00 00       	call   1004275 <async_write_disk>
 1004137:	83 c4 10             	add    esp,0x10
 100413a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100413d:	eb 04                	jmp    1004143 <execute_request+0x10b>
 100413f:	90                   	nop
 1004140:	eb 01                	jmp    1004143 <execute_request+0x10b>
 1004142:	90                   	nop
 1004143:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1004147:	75 07                	jne    1004150 <execute_request+0x118>
 1004149:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100414e:	eb 05                	jmp    1004155 <execute_request+0x11d>
 1004150:	b8 00 00 00 00       	mov    eax,0x0
 1004155:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1004158:	c9                   	leave  
 1004159:	c3                   	ret    

0100415a <async_read_disk>:
 100415a:	55                   	push   ebp
 100415b:	89 e5                	mov    ebp,esp
 100415d:	83 ec 18             	sub    esp,0x18
 1004160:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 1004166:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100416d:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 1004171:	74 06                	je     1004179 <async_read_disk+0x1f>
 1004173:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004177:	75 06                	jne    100417f <async_read_disk+0x25>
 1004179:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 100417f:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004183:	74 06                	je     100418b <async_read_disk+0x31>
 1004185:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 1004189:	75 07                	jne    1004192 <async_read_disk+0x38>
 100418b:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 1004192:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1004195:	0f b6 d0             	movzx  edx,al
 1004198:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100419c:	83 c0 02             	add    eax,0x2
 100419f:	0f b7 c0             	movzx  eax,ax
 10041a2:	83 ec 08             	sub    esp,0x8
 10041a5:	52                   	push   edx
 10041a6:	50                   	push   eax
 10041a7:	e8 14 ed ff ff       	call   1002ec0 <outb>
 10041ac:	83 c4 10             	add    esp,0x10
 10041af:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10041b2:	0f b6 d0             	movzx  edx,al
 10041b5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10041b9:	83 c0 03             	add    eax,0x3
 10041bc:	0f b7 c0             	movzx  eax,ax
 10041bf:	83 ec 08             	sub    esp,0x8
 10041c2:	52                   	push   edx
 10041c3:	50                   	push   eax
 10041c4:	e8 f7 ec ff ff       	call   1002ec0 <outb>
 10041c9:	83 c4 10             	add    esp,0x10
 10041cc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10041cf:	c1 e8 08             	shr    eax,0x8
 10041d2:	0f b6 d0             	movzx  edx,al
 10041d5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10041d9:	83 c0 04             	add    eax,0x4
 10041dc:	0f b7 c0             	movzx  eax,ax
 10041df:	83 ec 08             	sub    esp,0x8
 10041e2:	52                   	push   edx
 10041e3:	50                   	push   eax
 10041e4:	e8 d7 ec ff ff       	call   1002ec0 <outb>
 10041e9:	83 c4 10             	add    esp,0x10
 10041ec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10041ef:	c1 e8 10             	shr    eax,0x10
 10041f2:	0f b6 d0             	movzx  edx,al
 10041f5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10041f9:	83 c0 05             	add    eax,0x5
 10041fc:	0f b7 c0             	movzx  eax,ax
 10041ff:	83 ec 08             	sub    esp,0x8
 1004202:	52                   	push   edx
 1004203:	50                   	push   eax
 1004204:	e8 b7 ec ff ff       	call   1002ec0 <outb>
 1004209:	83 c4 10             	add    esp,0x10
 100420c:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004210:	74 07                	je     1004219 <async_read_disk+0xbf>
 1004212:	b8 10 00 00 00       	mov    eax,0x10
 1004217:	eb 05                	jmp    100421e <async_read_disk+0xc4>
 1004219:	b8 00 00 00 00       	mov    eax,0x0
 100421e:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 1004221:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004224:	c1 e8 18             	shr    eax,0x18
 1004227:	83 e0 0f             	and    eax,0xf
 100422a:	89 c2                	mov    edx,eax
 100422c:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 1004230:	09 d0                	or     eax,edx
 1004232:	83 c8 e0             	or     eax,0xffffffe0
 1004235:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 1004238:	0f b6 45 ee          	movzx  eax,BYTE PTR [ebp-0x12]
 100423c:	0f b6 d0             	movzx  edx,al
 100423f:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004243:	83 c0 06             	add    eax,0x6
 1004246:	0f b7 c0             	movzx  eax,ax
 1004249:	83 ec 08             	sub    esp,0x8
 100424c:	52                   	push   edx
 100424d:	50                   	push   eax
 100424e:	e8 6d ec ff ff       	call   1002ec0 <outb>
 1004253:	83 c4 10             	add    esp,0x10
 1004256:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100425a:	83 c0 07             	add    eax,0x7
 100425d:	0f b7 c0             	movzx  eax,ax
 1004260:	83 ec 08             	sub    esp,0x8
 1004263:	6a 20                	push   0x20
 1004265:	50                   	push   eax
 1004266:	e8 55 ec ff ff       	call   1002ec0 <outb>
 100426b:	83 c4 10             	add    esp,0x10
 100426e:	b8 00 00 00 00       	mov    eax,0x0
 1004273:	c9                   	leave  
 1004274:	c3                   	ret    

01004275 <async_write_disk>:
 1004275:	55                   	push   ebp
 1004276:	89 e5                	mov    ebp,esp
 1004278:	83 ec 18             	sub    esp,0x18
 100427b:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 1004281:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004288:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 100428c:	74 06                	je     1004294 <async_write_disk+0x1f>
 100428e:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 1004292:	75 06                	jne    100429a <async_write_disk+0x25>
 1004294:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 100429a:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 100429e:	74 06                	je     10042a6 <async_write_disk+0x31>
 10042a0:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 10042a4:	75 07                	jne    10042ad <async_write_disk+0x38>
 10042a6:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 10042ad:	83 ec 0c             	sub    esp,0xc
 10042b0:	68 f7 00 00 00       	push   0xf7
 10042b5:	e8 26 ec ff ff       	call   1002ee0 <inb>
 10042ba:	83 c4 10             	add    esp,0x10
 10042bd:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 10042c0:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 10042c4:	83 e0 01             	and    eax,0x1
 10042c7:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 10042ca:	80 7d ee 00          	cmp    BYTE PTR [ebp-0x12],0x0
 10042ce:	74 0a                	je     10042da <async_write_disk+0x65>
 10042d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10042d5:	e9 22 01 00 00       	jmp    10043fc <async_write_disk+0x187>
 10042da:	80 65 ef 88          	and    BYTE PTR [ebp-0x11],0x88
 10042de:	80 7d ef 08          	cmp    BYTE PTR [ebp-0x11],0x8
 10042e2:	74 02                	je     10042e6 <async_write_disk+0x71>
 10042e4:	eb c7                	jmp    10042ad <async_write_disk+0x38>
 10042e6:	90                   	nop
 10042e7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10042ea:	0f b6 d0             	movzx  edx,al
 10042ed:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10042f1:	83 c0 02             	add    eax,0x2
 10042f4:	0f b7 c0             	movzx  eax,ax
 10042f7:	83 ec 08             	sub    esp,0x8
 10042fa:	52                   	push   edx
 10042fb:	50                   	push   eax
 10042fc:	e8 bf eb ff ff       	call   1002ec0 <outb>
 1004301:	83 c4 10             	add    esp,0x10
 1004304:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004307:	0f b6 d0             	movzx  edx,al
 100430a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100430e:	83 c0 03             	add    eax,0x3
 1004311:	0f b7 c0             	movzx  eax,ax
 1004314:	83 ec 08             	sub    esp,0x8
 1004317:	52                   	push   edx
 1004318:	50                   	push   eax
 1004319:	e8 a2 eb ff ff       	call   1002ec0 <outb>
 100431e:	83 c4 10             	add    esp,0x10
 1004321:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004324:	c1 e8 08             	shr    eax,0x8
 1004327:	0f b6 d0             	movzx  edx,al
 100432a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100432e:	83 c0 04             	add    eax,0x4
 1004331:	0f b7 c0             	movzx  eax,ax
 1004334:	83 ec 08             	sub    esp,0x8
 1004337:	52                   	push   edx
 1004338:	50                   	push   eax
 1004339:	e8 82 eb ff ff       	call   1002ec0 <outb>
 100433e:	83 c4 10             	add    esp,0x10
 1004341:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004344:	c1 e8 10             	shr    eax,0x10
 1004347:	0f b6 d0             	movzx  edx,al
 100434a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100434e:	83 c0 05             	add    eax,0x5
 1004351:	0f b7 c0             	movzx  eax,ax
 1004354:	83 ec 08             	sub    esp,0x8
 1004357:	52                   	push   edx
 1004358:	50                   	push   eax
 1004359:	e8 62 eb ff ff       	call   1002ec0 <outb>
 100435e:	83 c4 10             	add    esp,0x10
 1004361:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004365:	74 07                	je     100436e <async_write_disk+0xf9>
 1004367:	b8 10 00 00 00       	mov    eax,0x10
 100436c:	eb 05                	jmp    1004373 <async_write_disk+0xfe>
 100436e:	b8 00 00 00 00       	mov    eax,0x0
 1004373:	88 45 ed             	mov    BYTE PTR [ebp-0x13],al
 1004376:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004379:	c1 e8 18             	shr    eax,0x18
 100437c:	83 e0 0f             	and    eax,0xf
 100437f:	89 c2                	mov    edx,eax
 1004381:	0f b6 45 ed          	movzx  eax,BYTE PTR [ebp-0x13]
 1004385:	09 d0                	or     eax,edx
 1004387:	83 c8 e0             	or     eax,0xffffffe0
 100438a:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 100438d:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 1004391:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004395:	83 c0 06             	add    eax,0x6
 1004398:	0f b7 c0             	movzx  eax,ax
 100439b:	83 ec 08             	sub    esp,0x8
 100439e:	52                   	push   edx
 100439f:	50                   	push   eax
 10043a0:	e8 1b eb ff ff       	call   1002ec0 <outb>
 10043a5:	83 c4 10             	add    esp,0x10
 10043a8:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10043ac:	83 c0 07             	add    eax,0x7
 10043af:	0f b7 c0             	movzx  eax,ax
 10043b2:	83 ec 08             	sub    esp,0x8
 10043b5:	6a 30                	push   0x30
 10043b7:	50                   	push   eax
 10043b8:	e8 03 eb ff ff       	call   1002ec0 <outb>
 10043bd:	83 c4 10             	add    esp,0x10
 10043c0:	83 ec 0c             	sub    esp,0xc
 10043c3:	68 f7 00 00 00       	push   0xf7
 10043c8:	e8 13 eb ff ff       	call   1002ee0 <inb>
 10043cd:	83 c4 10             	add    esp,0x10
 10043d0:	88 45 eb             	mov    BYTE PTR [ebp-0x15],al
 10043d3:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 10043d7:	83 e0 01             	and    eax,0x1
 10043da:	88 45 ea             	mov    BYTE PTR [ebp-0x16],al
 10043dd:	80 7d ea 00          	cmp    BYTE PTR [ebp-0x16],0x0
 10043e1:	74 07                	je     10043ea <async_write_disk+0x175>
 10043e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10043e8:	eb 12                	jmp    10043fc <async_write_disk+0x187>
 10043ea:	80 65 eb 88          	and    BYTE PTR [ebp-0x15],0x88
 10043ee:	80 7d eb 08          	cmp    BYTE PTR [ebp-0x15],0x8
 10043f2:	74 02                	je     10043f6 <async_write_disk+0x181>
 10043f4:	eb ca                	jmp    10043c0 <async_write_disk+0x14b>
 10043f6:	90                   	nop
 10043f7:	b8 00 00 00 00       	mov    eax,0x0
 10043fc:	c9                   	leave  
 10043fd:	c3                   	ret    

010043fe <read_disk>:
 10043fe:	55                   	push   ebp
 10043ff:	89 e5                	mov    ebp,esp
 1004401:	83 ec 08             	sub    esp,0x8
 1004404:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004407:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100440a:	89 c1                	mov    ecx,eax
 100440c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100440f:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1004412:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004415:	8b 00                	mov    eax,DWORD PTR [eax]
 1004417:	83 ec 04             	sub    esp,0x4
 100441a:	51                   	push   ecx
 100441b:	52                   	push   edx
 100441c:	50                   	push   eax
 100441d:	e8 2f 00 00 00       	call   1004451 <read_disk_asm>
 1004422:	83 c4 10             	add    esp,0x10
 1004425:	c9                   	leave  
 1004426:	c3                   	ret    

01004427 <write_disk>:
 1004427:	55                   	push   ebp
 1004428:	89 e5                	mov    ebp,esp
 100442a:	83 ec 08             	sub    esp,0x8
 100442d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004430:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004433:	89 c1                	mov    ecx,eax
 1004435:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004438:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 100443b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100443e:	8b 00                	mov    eax,DWORD PTR [eax]
 1004440:	83 ec 04             	sub    esp,0x4
 1004443:	51                   	push   ecx
 1004444:	52                   	push   edx
 1004445:	50                   	push   eax
 1004446:	e8 7e 00 00 00       	call   10044c9 <write_disk_asm>
 100444b:	83 c4 10             	add    esp,0x10
 100444e:	c9                   	leave  
 100444f:	c3                   	ret    

01004450 <disk_int_handler>:
 1004450:	cf                   	iret   

01004451 <read_disk_asm>:
 1004451:	55                   	push   ebp
 1004452:	89 e5                	mov    ebp,esp
 1004454:	66 ba f7 01          	mov    dx,0x1f7
 1004458:	31 c9                	xor    ecx,ecx
 100445a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100445e:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1004462:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1004466:	89 c6                	mov    esi,eax
 1004468:	66 ba f2 01          	mov    dx,0x1f2
 100446c:	88 c8                	mov    al,cl
 100446e:	ee                   	out    dx,al
 100446f:	66 ba f3 01          	mov    dx,0x1f3
 1004473:	89 f0                	mov    eax,esi
 1004475:	ee                   	out    dx,al
 1004476:	66 42                	inc    dx
 1004478:	c1 e8 08             	shr    eax,0x8
 100447b:	ee                   	out    dx,al
 100447c:	66 42                	inc    dx
 100447e:	c1 e8 08             	shr    eax,0x8
 1004481:	ee                   	out    dx,al
 1004482:	66 42                	inc    dx
 1004484:	66 c1 e8 08          	shr    ax,0x8
 1004488:	24 0f                	and    al,0xf
 100448a:	0c e0                	or     al,0xe0
 100448c:	ee                   	out    dx,al
 100448d:	66 42                	inc    dx
 100448f:	b0 20                	mov    al,0x20
 1004491:	ee                   	out    dx,al

01004492 <read_disk_asm.wait>:
 1004492:	90                   	nop
 1004493:	ec                   	in     al,dx
 1004494:	24 88                	and    al,0x88
 1004496:	3c 08                	cmp    al,0x8
 1004498:	75 f8                	jne    1004492 <read_disk_asm.wait>
 100449a:	66 89 d7             	mov    di,dx
 100449d:	89 c8                	mov    eax,ecx
 100449f:	66 b9 00 01          	mov    cx,0x100
 10044a3:	66 f7 e1             	mul    cx
 10044a6:	89 c1                	mov    ecx,eax
 10044a8:	66 ba f0 01          	mov    dx,0x1f0

010044ac <read_disk_asm.read>:
 10044ac:	66 ed                	in     ax,dx
 10044ae:	66 89 03             	mov    WORD PTR [ebx],ax
 10044b1:	83 c3 02             	add    ebx,0x2
 10044b4:	e2 f6                	loop   10044ac <read_disk_asm.read>
 10044b6:	c9                   	leave  
 10044b7:	b8 00 00 00 00       	mov    eax,0x0
 10044bc:	c3                   	ret    

010044bd <read_disk_asm.err_disk_reading>:
 10044bd:	66 ba f1 01          	mov    dx,0x1f1
 10044c1:	31 c0                	xor    eax,eax
 10044c3:	66 ed                	in     ax,dx
 10044c5:	89 ec                	mov    esp,ebp
 10044c7:	5d                   	pop    ebp
 10044c8:	c3                   	ret    

010044c9 <write_disk_asm>:
 10044c9:	55                   	push   ebp
 10044ca:	89 e5                	mov    ebp,esp
 10044cc:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10044d0:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10044d4:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10044d8:	50                   	push   eax
 10044d9:	66 ba f2 01          	mov    dx,0x1f2
 10044dd:	88 c8                	mov    al,cl
 10044df:	ee                   	out    dx,al
 10044e0:	58                   	pop    eax
 10044e1:	66 ba f3 01          	mov    dx,0x1f3
 10044e5:	ee                   	out    dx,al
 10044e6:	c1 e8 08             	shr    eax,0x8
 10044e9:	66 ba f4 01          	mov    dx,0x1f4
 10044ed:	ee                   	out    dx,al
 10044ee:	c1 e8 08             	shr    eax,0x8
 10044f1:	66 ba f5 01          	mov    dx,0x1f5
 10044f5:	ee                   	out    dx,al
 10044f6:	c1 e8 08             	shr    eax,0x8
 10044f9:	24 0f                	and    al,0xf
 10044fb:	0c e0                	or     al,0xe0
 10044fd:	66 ba f6 01          	mov    dx,0x1f6
 1004501:	ee                   	out    dx,al
 1004502:	66 ba f7 01          	mov    dx,0x1f7
 1004506:	b0 30                	mov    al,0x30
 1004508:	ee                   	out    dx,al

01004509 <write_disk_asm.not_ready2>:
 1004509:	90                   	nop
 100450a:	ec                   	in     al,dx
 100450b:	24 88                	and    al,0x88
 100450d:	3c 08                	cmp    al,0x8
 100450f:	75 f8                	jne    1004509 <write_disk_asm.not_ready2>
 1004511:	89 c8                	mov    eax,ecx
 1004513:	66 b9 00 01          	mov    cx,0x100
 1004517:	66 f7 e1             	mul    cx
 100451a:	89 c1                	mov    ecx,eax
 100451c:	66 ba f0 01          	mov    dx,0x1f0

01004520 <write_disk_asm.go_on_write>:
 1004520:	66 8b 03             	mov    ax,WORD PTR [ebx]
 1004523:	66 ef                	out    dx,ax
 1004525:	83 c3 02             	add    ebx,0x2
 1004528:	e2 f6                	loop   1004520 <write_disk_asm.go_on_write>
 100452a:	89 ec                	mov    esp,ebp
 100452c:	5d                   	pop    ebp
 100452d:	c3                   	ret    

0100452e <init_fat16>:
 100452e:	55                   	push   ebp
 100452f:	89 e5                	mov    ebp,esp
 1004531:	81 ec 88 00 00 00    	sub    esp,0x88
 1004537:	83 ec 0c             	sub    esp,0xc
 100453a:	68 60 73 00 01       	push   0x1007360
 100453f:	e8 51 d5 ff ff       	call   1001a95 <reg_device>
 1004544:	83 c4 10             	add    esp,0x10
 1004547:	83 ec 0c             	sub    esp,0xc
 100454a:	68 00 73 00 01       	push   0x1007300
 100454f:	e8 f6 d5 ff ff       	call   1001b4a <reg_driver>
 1004554:	83 c4 10             	add    esp,0x10
 1004557:	a3 c4 61 42 00       	mov    ds:0x4261c4,eax
 100455c:	83 ec 0c             	sub    esp,0xc
 100455f:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
 1004565:	50                   	push   eax
 1004566:	e8 27 00 00 00       	call   1004592 <load>
 100456b:	83 c4 10             	add    esp,0x10
 100456e:	8b 15 c4 61 42 00    	mov    edx,DWORD PTR ds:0x4261c4
 1004574:	a1 44 df 41 00       	mov    eax,ds:0x41df44
 1004579:	83 ec 04             	sub    esp,0x4
 100457c:	68 90 73 00 01       	push   0x1007390
 1004581:	52                   	push   edx
 1004582:	50                   	push   eax
 1004583:	e8 09 cf ff ff       	call   1001491 <reg_vol>
 1004588:	83 c4 10             	add    esp,0x10
 100458b:	b8 00 00 00 00       	mov    eax,0x0
 1004590:	c9                   	leave  
 1004591:	c3                   	ret    

01004592 <load>:
 1004592:	55                   	push   ebp
 1004593:	89 e5                	mov    ebp,esp
 1004595:	83 ec 18             	sub    esp,0x18
 1004598:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 100459f:	83 ec 04             	sub    esp,0x4
 10045a2:	6a 01                	push   0x1
 10045a4:	6a 00                	push   0x0
 10045a6:	68 60 df 41 00       	push   0x41df60
 10045ab:	e8 1e 0a 00 00       	call   1004fce <read_sec>
 10045b0:	83 c4 10             	add    esp,0x10
 10045b3:	0f b7 05 76 df 41 00 	movzx  eax,WORD PTR ds:0x41df76
 10045ba:	0f b7 d0             	movzx  edx,ax
 10045bd:	0f b7 05 6e df 41 00 	movzx  eax,WORD PTR ds:0x41df6e
 10045c4:	0f b7 c0             	movzx  eax,ax
 10045c7:	83 ec 04             	sub    esp,0x4
 10045ca:	52                   	push   edx
 10045cb:	50                   	push   eax
 10045cc:	68 c0 21 42 00       	push   0x4221c0
 10045d1:	e8 f8 09 00 00       	call   1004fce <read_sec>
 10045d6:	83 c4 10             	add    esp,0x10
 10045d9:	0f b7 05 6e df 41 00 	movzx  eax,WORD PTR ds:0x41df6e
 10045e0:	0f b7 c8             	movzx  ecx,ax
 10045e3:	0f b7 05 76 df 41 00 	movzx  eax,WORD PTR ds:0x41df76
 10045ea:	0f b7 d0             	movzx  edx,ax
 10045ed:	0f b6 05 70 df 41 00 	movzx  eax,BYTE PTR ds:0x41df70
 10045f4:	0f b6 c0             	movzx  eax,al
 10045f7:	0f af c2             	imul   eax,edx
 10045fa:	01 c8                	add    eax,ecx
 10045fc:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10045ff:	0f b7 05 71 df 41 00 	movzx  eax,WORD PTR ds:0x41df71
 1004606:	0f b7 c0             	movzx  eax,ax
 1004609:	c1 e0 05             	shl    eax,0x5
 100460c:	0f b7 15 6b df 41 00 	movzx  edx,WORD PTR ds:0x41df6b
 1004613:	0f b7 ca             	movzx  ecx,dx
 1004616:	ba 00 00 00 00       	mov    edx,0x0
 100461b:	f7 f1                	div    ecx
 100461d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004620:	83 ec 04             	sub    esp,0x4
 1004623:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004626:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004629:	68 a0 df 41 00       	push   0x41dfa0
 100462e:	e8 9b 09 00 00       	call   1004fce <read_sec>
 1004633:	83 c4 10             	add    esp,0x10
 1004636:	66 c7 05 ba 1f 42 00 	mov    WORD PTR ds:0x421fba,0x0
 100463d:	00 00 
 100463f:	0f b7 05 6e df 41 00 	movzx  eax,WORD PTR ds:0x41df6e
 1004646:	0f b7 c0             	movzx  eax,ax
 1004649:	83 c0 3e             	add    eax,0x3e
 100464c:	a3 f0 6c 00 01       	mov    ds:0x1006cf0,eax
 1004651:	c7 05 c0 61 42 00 00 	mov    DWORD PTR ds:0x4261c0,0x0
 1004658:	00 00 00 
 100465b:	b8 00 00 00 00       	mov    eax,0x0
 1004660:	c9                   	leave  
 1004661:	c3                   	ret    

01004662 <verify_name>:
 1004662:	55                   	push   ebp
 1004663:	89 e5                	mov    ebp,esp
 1004665:	57                   	push   edi
 1004666:	56                   	push   esi
 1004667:	53                   	push   ebx
 1004668:	83 ec 6c             	sub    esp,0x6c
 100466b:	8d 55 8a             	lea    edx,[ebp-0x76]
 100466e:	b8 94 73 00 01       	mov    eax,0x1007394
 1004673:	b9 46 00 00 00       	mov    ecx,0x46
 1004678:	8b 18                	mov    ebx,DWORD PTR [eax]
 100467a:	89 1a                	mov    DWORD PTR [edx],ebx
 100467c:	8b 5c 08 fc          	mov    ebx,DWORD PTR [eax+ecx*1-0x4]
 1004680:	89 5c 0a fc          	mov    DWORD PTR [edx+ecx*1-0x4],ebx
 1004684:	8d 5a 04             	lea    ebx,[edx+0x4]
 1004687:	83 e3 fc             	and    ebx,0xfffffffc
 100468a:	29 da                	sub    edx,ebx
 100468c:	29 d0                	sub    eax,edx
 100468e:	01 d1                	add    ecx,edx
 1004690:	83 e1 fc             	and    ecx,0xfffffffc
 1004693:	c1 e9 02             	shr    ecx,0x2
 1004696:	89 ca                	mov    edx,ecx
 1004698:	89 df                	mov    edi,ebx
 100469a:	89 c6                	mov    esi,eax
 100469c:	89 d1                	mov    ecx,edx
 100469e:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10046a0:	83 ec 0c             	sub    esp,0xc
 10046a3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10046a6:	e8 32 21 00 00       	call   10067dd <strlen>
 10046ab:	83 c4 10             	add    esp,0x10
 10046ae:	83 f8 0b             	cmp    eax,0xb
 10046b1:	7f 0a                	jg     10046bd <verify_name+0x5b>
 10046b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10046b6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10046b9:	84 c0                	test   al,al
 10046bb:	75 0a                	jne    10046c7 <verify_name+0x65>
 10046bd:	b8 00 00 00 00       	mov    eax,0x0
 10046c2:	e9 81 01 00 00       	jmp    1004848 <verify_name+0x1e6>
 10046c7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10046ce:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 10046d5:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 10046dc:	c7 45 d0 01 00 00 00 	mov    DWORD PTR [ebp-0x30],0x1
 10046e3:	eb 62                	jmp    1004747 <verify_name+0xe5>
 10046e5:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 10046ec:	eb 1e                	jmp    100470c <verify_name+0xaa>
 10046ee:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10046f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10046f4:	01 d0                	add    eax,edx
 10046f6:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10046f9:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 10046fc:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10046ff:	01 c8                	add    eax,ecx
 1004701:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004704:	38 c2                	cmp    dl,al
 1004706:	74 0e                	je     1004716 <verify_name+0xb4>
 1004708:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 100470c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100470f:	83 f8 45             	cmp    eax,0x45
 1004712:	76 da                	jbe    10046ee <verify_name+0x8c>
 1004714:	eb 01                	jmp    1004717 <verify_name+0xb5>
 1004716:	90                   	nop
 1004717:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100471a:	83 f8 45             	cmp    eax,0x45
 100471d:	76 0a                	jbe    1004729 <verify_name+0xc7>
 100471f:	b8 00 00 00 00       	mov    eax,0x0
 1004724:	e9 1f 01 00 00       	jmp    1004848 <verify_name+0x1e6>
 1004729:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100472c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100472f:	01 d0                	add    eax,edx
 1004731:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004734:	3c 20                	cmp    al,0x20
 1004736:	74 07                	je     100473f <verify_name+0xdd>
 1004738:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 100473f:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004743:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 1004747:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100474a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100474d:	01 d0                	add    eax,edx
 100474f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004752:	3c 2e                	cmp    al,0x2e
 1004754:	74 0f                	je     1004765 <verify_name+0x103>
 1004756:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004759:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100475c:	01 d0                	add    eax,edx
 100475e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004761:	84 c0                	test   al,al
 1004763:	75 80                	jne    10046e5 <verify_name+0x83>
 1004765:	83 7d e4 08          	cmp    DWORD PTR [ebp-0x1c],0x8
 1004769:	7f 06                	jg     1004771 <verify_name+0x10f>
 100476b:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 100476f:	75 0a                	jne    100477b <verify_name+0x119>
 1004771:	b8 00 00 00 00       	mov    eax,0x0
 1004776:	e9 cd 00 00 00       	jmp    1004848 <verify_name+0x1e6>
 100477b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100477e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004781:	01 d0                	add    eax,edx
 1004783:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004786:	84 c0                	test   al,al
 1004788:	75 0a                	jne    1004794 <verify_name+0x132>
 100478a:	b8 01 00 00 00       	mov    eax,0x1
 100478f:	e9 b4 00 00 00       	jmp    1004848 <verify_name+0x1e6>
 1004794:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100479b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 10047a2:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 10047a6:	eb 75                	jmp    100481d <verify_name+0x1bb>
 10047a8:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 10047af:	eb 1e                	jmp    10047cf <verify_name+0x16d>
 10047b1:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10047b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10047b7:	01 d0                	add    eax,edx
 10047b9:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10047bc:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 10047bf:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10047c2:	01 c8                	add    eax,ecx
 10047c4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10047c7:	38 c2                	cmp    dl,al
 10047c9:	74 0e                	je     10047d9 <verify_name+0x177>
 10047cb:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 10047cf:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10047d2:	83 f8 45             	cmp    eax,0x45
 10047d5:	76 da                	jbe    10047b1 <verify_name+0x14f>
 10047d7:	eb 01                	jmp    10047da <verify_name+0x178>
 10047d9:	90                   	nop
 10047da:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10047dd:	83 f8 45             	cmp    eax,0x45
 10047e0:	76 07                	jbe    10047e9 <verify_name+0x187>
 10047e2:	b8 00 00 00 00       	mov    eax,0x0
 10047e7:	eb 5f                	jmp    1004848 <verify_name+0x1e6>
 10047e9:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10047ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10047ef:	01 d0                	add    eax,edx
 10047f1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10047f4:	3c 20                	cmp    al,0x20
 10047f6:	74 07                	je     10047ff <verify_name+0x19d>
 10047f8:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 10047ff:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004802:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004805:	01 d0                	add    eax,edx
 1004807:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100480a:	3c 2e                	cmp    al,0x2e
 100480c:	75 07                	jne    1004815 <verify_name+0x1b3>
 100480e:	b8 00 00 00 00       	mov    eax,0x0
 1004813:	eb 33                	jmp    1004848 <verify_name+0x1e6>
 1004815:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004819:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 100481d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004820:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004823:	01 d0                	add    eax,edx
 1004825:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004828:	84 c0                	test   al,al
 100482a:	0f 85 78 ff ff ff    	jne    10047a8 <verify_name+0x146>
 1004830:	83 7d e4 03          	cmp    DWORD PTR [ebp-0x1c],0x3
 1004834:	7f 06                	jg     100483c <verify_name+0x1da>
 1004836:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 100483a:	75 07                	jne    1004843 <verify_name+0x1e1>
 100483c:	b8 00 00 00 00       	mov    eax,0x0
 1004841:	eb 05                	jmp    1004848 <verify_name+0x1e6>
 1004843:	b8 01 00 00 00       	mov    eax,0x1
 1004848:	8d 65 f4             	lea    esp,[ebp-0xc]
 100484b:	5b                   	pop    ebx
 100484c:	5e                   	pop    esi
 100484d:	5f                   	pop    edi
 100484e:	5d                   	pop    ebp
 100484f:	c3                   	ret    

01004850 <format_name>:
 1004850:	55                   	push   ebp
 1004851:	89 e5                	mov    ebp,esp
 1004853:	83 ec 28             	sub    esp,0x28
 1004856:	c7 45 e0 20 20 20 20 	mov    DWORD PTR [ebp-0x20],0x20202020
 100485d:	c7 45 e4 20 20 20 20 	mov    DWORD PTR [ebp-0x1c],0x20202020
 1004864:	c7 45 e8 20 20 20 00 	mov    DWORD PTR [ebp-0x18],0x202020
 100486b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1004872:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004879:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1004880:	eb 7e                	jmp    1004900 <format_name+0xb0>
 1004882:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004885:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004888:	01 d0                	add    eax,edx
 100488a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100488d:	3c 60                	cmp    al,0x60
 100488f:	7e 32                	jle    10048c3 <format_name+0x73>
 1004891:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004894:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004897:	01 d0                	add    eax,edx
 1004899:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100489c:	3c 7a                	cmp    al,0x7a
 100489e:	7f 23                	jg     10048c3 <format_name+0x73>
 10048a0:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10048a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10048a6:	01 d0                	add    eax,edx
 10048a8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10048ab:	8d 48 e0             	lea    ecx,[eax-0x20]
 10048ae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10048b1:	8d 50 01             	lea    edx,[eax+0x1]
 10048b4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10048b7:	89 ca                	mov    edx,ecx
 10048b9:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 10048bd:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10048c1:	eb 39                	jmp    10048fc <format_name+0xac>
 10048c3:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10048c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10048c9:	01 d0                	add    eax,edx
 10048cb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10048ce:	3c 2e                	cmp    al,0x2e
 10048d0:	75 0d                	jne    10048df <format_name+0x8f>
 10048d2:	b8 08 00 00 00       	mov    eax,0x8
 10048d7:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 10048da:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 10048dd:	eb 1d                	jmp    10048fc <format_name+0xac>
 10048df:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10048e2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10048e5:	8d 0c 02             	lea    ecx,[edx+eax*1]
 10048e8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10048eb:	8d 50 01             	lea    edx,[eax+0x1]
 10048ee:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10048f1:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 10048f4:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 10048f8:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10048fc:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1004900:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004903:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004906:	01 d0                	add    eax,edx
 1004908:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100490b:	84 c0                	test   al,al
 100490d:	0f 85 6f ff ff ff    	jne    1004882 <format_name+0x32>
 1004913:	c6 45 ec 00          	mov    BYTE PTR [ebp-0x14],0x0
 1004917:	83 ec 08             	sub    esp,0x8
 100491a:	8d 45 e0             	lea    eax,[ebp-0x20]
 100491d:	50                   	push   eax
 100491e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1004921:	e8 f1 1c 00 00       	call   1006617 <strcpy>
 1004926:	83 c4 10             	add    esp,0x10
 1004929:	90                   	nop
 100492a:	c9                   	leave  
 100492b:	c3                   	ret    

0100492c <req_cluster>:
 100492c:	55                   	push   ebp
 100492d:	89 e5                	mov    ebp,esp
 100492f:	83 ec 10             	sub    esp,0x10
 1004932:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
 1004939:	eb 26                	jmp    1004961 <req_cluster+0x35>
 100493b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100493e:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1004945:	00 
 1004946:	66 85 c0             	test   ax,ax
 1004949:	75 12                	jne    100495d <req_cluster+0x31>
 100494b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100494e:	66 c7 84 00 c0 21 42 	mov    WORD PTR [eax+eax*1+0x4221c0],0xffff
 1004955:	00 ff ff 
 1004958:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100495b:	eb 13                	jmp    1004970 <req_cluster+0x44>
 100495d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1004961:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004964:	3d ff 1f 00 00       	cmp    eax,0x1fff
 1004969:	76 d0                	jbe    100493b <req_cluster+0xf>
 100496b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004970:	c9                   	leave  
 1004971:	c3                   	ret    

01004972 <write_sec>:
 1004972:	55                   	push   ebp
 1004973:	89 e5                	mov    ebp,esp
 1004975:	57                   	push   edi
 1004976:	81 ec 84 00 00 00    	sub    esp,0x84
 100497c:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
 1004982:	b8 00 00 00 00       	mov    eax,0x0
 1004987:	b9 1f 00 00 00       	mov    ecx,0x1f
 100498c:	89 d7                	mov    edi,edx
 100498e:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1004990:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004993:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 1004996:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004999:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 100499c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 100499f:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
 10049a2:	a1 ac 6c 00 01       	mov    eax,ds:0x1006cac
 10049a7:	83 ec 0c             	sub    esp,0xc
 10049aa:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
 10049b0:	52                   	push   edx
 10049b1:	ff d0                	call   eax
 10049b3:	83 c4 10             	add    esp,0x10
 10049b6:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 10049b9:	c9                   	leave  
 10049ba:	c3                   	ret    

010049bb <set_attr>:
 10049bb:	55                   	push   ebp
 10049bc:	89 e5                	mov    ebp,esp
 10049be:	83 ec 04             	sub    esp,0x4
 10049c1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10049c4:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 10049c7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049ca:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
 10049ce:	0a 45 fc             	or     al,BYTE PTR [ebp-0x4]
 10049d1:	89 c2                	mov    edx,eax
 10049d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049d6:	88 50 0b             	mov    BYTE PTR [eax+0xb],dl
 10049d9:	90                   	nop
 10049da:	c9                   	leave  
 10049db:	c3                   	ret    

010049dc <update_fat_and_root>:
 10049dc:	55                   	push   ebp
 10049dd:	89 e5                	mov    ebp,esp
 10049df:	83 ec 18             	sub    esp,0x18
 10049e2:	0f b7 05 6e df 41 00 	movzx  eax,WORD PTR ds:0x41df6e
 10049e9:	0f b7 c8             	movzx  ecx,ax
 10049ec:	0f b7 05 76 df 41 00 	movzx  eax,WORD PTR ds:0x41df76
 10049f3:	0f b7 d0             	movzx  edx,ax
 10049f6:	0f b6 05 70 df 41 00 	movzx  eax,BYTE PTR ds:0x41df70
 10049fd:	0f b6 c0             	movzx  eax,al
 1004a00:	0f af c2             	imul   eax,edx
 1004a03:	01 c8                	add    eax,ecx
 1004a05:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004a08:	83 ec 04             	sub    esp,0x4
 1004a0b:	68 00 40 00 00       	push   0x4000
 1004a10:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1004a13:	68 a0 df 41 00       	push   0x41dfa0
 1004a18:	e8 55 ff ff ff       	call   1004972 <write_sec>
 1004a1d:	83 c4 10             	add    esp,0x10
 1004a20:	0f b7 05 6e df 41 00 	movzx  eax,WORD PTR ds:0x41df6e
 1004a27:	0f b7 c0             	movzx  eax,ax
 1004a2a:	83 ec 04             	sub    esp,0x4
 1004a2d:	68 00 40 00 00       	push   0x4000
 1004a32:	50                   	push   eax
 1004a33:	68 c0 21 42 00       	push   0x4221c0
 1004a38:	e8 35 ff ff ff       	call   1004972 <write_sec>
 1004a3d:	83 c4 10             	add    esp,0x10
 1004a40:	90                   	nop
 1004a41:	c9                   	leave  
 1004a42:	c3                   	ret    

01004a43 <add_dot_and_ddot_dir>:
 1004a43:	55                   	push   ebp
 1004a44:	89 e5                	mov    ebp,esp
 1004a46:	83 ec 18             	sub    esp,0x18
 1004a49:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004a4d:	0f b7 c0             	movzx  eax,ax
 1004a50:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004a53:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004a5a:	0f b6 c0             	movzx  eax,al
 1004a5d:	8b 0d f0 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006cf0
 1004a63:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1004a66:	01 ca                	add    edx,ecx
 1004a68:	83 ec 04             	sub    esp,0x4
 1004a6b:	50                   	push   eax
 1004a6c:	52                   	push   edx
 1004a6d:	68 c0 1f 42 00       	push   0x421fc0
 1004a72:	e8 57 05 00 00       	call   1004fce <read_sec>
 1004a77:	83 c4 10             	add    esp,0x10
 1004a7a:	83 ec 08             	sub    esp,0x8
 1004a7d:	68 da 73 00 01       	push   0x10073da
 1004a82:	68 c0 1f 42 00       	push   0x421fc0
 1004a87:	e8 8b 1b 00 00       	call   1006617 <strcpy>
 1004a8c:	83 c4 10             	add    esp,0x10
 1004a8f:	83 ec 08             	sub    esp,0x8
 1004a92:	68 e3 73 00 01       	push   0x10073e3
 1004a97:	68 c8 1f 42 00       	push   0x421fc8
 1004a9c:	e8 76 1b 00 00       	call   1006617 <strcpy>
 1004aa1:	83 c4 10             	add    esp,0x10
 1004aa4:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004aa8:	66 a3 da 1f 42 00    	mov    ds:0x421fda,ax
 1004aae:	c7 05 dc 1f 42 00 00 	mov    DWORD PTR ds:0x421fdc,0x0
 1004ab5:	00 00 00 
 1004ab8:	83 ec 08             	sub    esp,0x8
 1004abb:	6a 10                	push   0x10
 1004abd:	68 c0 1f 42 00       	push   0x421fc0
 1004ac2:	e8 f4 fe ff ff       	call   10049bb <set_attr>
 1004ac7:	83 c4 10             	add    esp,0x10
 1004aca:	83 ec 08             	sub    esp,0x8
 1004acd:	68 e7 73 00 01       	push   0x10073e7
 1004ad2:	68 e0 1f 42 00       	push   0x421fe0
 1004ad7:	e8 3b 1b 00 00       	call   1006617 <strcpy>
 1004adc:	83 c4 10             	add    esp,0x10
 1004adf:	83 ec 08             	sub    esp,0x8
 1004ae2:	68 e3 73 00 01       	push   0x10073e3
 1004ae7:	68 e8 1f 42 00       	push   0x421fe8
 1004aec:	e8 26 1b 00 00       	call   1006617 <strcpy>
 1004af1:	83 c4 10             	add    esp,0x10
 1004af4:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1004afb:	66 a3 fa 1f 42 00    	mov    ds:0x421ffa,ax
 1004b01:	c7 05 fc 1f 42 00 00 	mov    DWORD PTR ds:0x421ffc,0x0
 1004b08:	00 00 00 
 1004b0b:	83 ec 08             	sub    esp,0x8
 1004b0e:	6a 10                	push   0x10
 1004b10:	68 e0 1f 42 00       	push   0x421fe0
 1004b15:	e8 a1 fe ff ff       	call   10049bb <set_attr>
 1004b1a:	83 c4 10             	add    esp,0x10
 1004b1d:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1004b23:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004b26:	01 d0                	add    eax,edx
 1004b28:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1004b2b:	83 ec 04             	sub    esp,0x4
 1004b2e:	68 00 02 00 00       	push   0x200
 1004b33:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004b36:	68 c0 1f 42 00       	push   0x421fc0
 1004b3b:	e8 32 fe ff ff       	call   1004972 <write_sec>
 1004b40:	83 c4 10             	add    esp,0x10
 1004b43:	90                   	nop
 1004b44:	c9                   	leave  
 1004b45:	c3                   	ret    

01004b46 <translate_attr>:
 1004b46:	55                   	push   ebp
 1004b47:	89 e5                	mov    ebp,esp
 1004b49:	83 ec 14             	sub    esp,0x14
 1004b4c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b4f:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1004b52:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004b56:	83 e0 01             	and    eax,0x1
 1004b59:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004b5c:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004b60:	74 09                	je     1004b6b <translate_attr+0x25>
 1004b62:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004b65:	83 c0 01             	add    eax,0x1
 1004b68:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1004b6b:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004b6f:	83 e0 02             	and    eax,0x2
 1004b72:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004b75:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004b79:	74 09                	je     1004b84 <translate_attr+0x3e>
 1004b7b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004b7e:	83 c0 02             	add    eax,0x2
 1004b81:	c6 00 68             	mov    BYTE PTR [eax],0x68
 1004b84:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004b88:	83 e0 04             	and    eax,0x4
 1004b8b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004b8e:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004b92:	74 09                	je     1004b9d <translate_attr+0x57>
 1004b94:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004b97:	83 c0 04             	add    eax,0x4
 1004b9a:	c6 00 73             	mov    BYTE PTR [eax],0x73
 1004b9d:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004ba1:	83 e0 08             	and    eax,0x8
 1004ba4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004ba7:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004bab:	74 09                	je     1004bb6 <translate_attr+0x70>
 1004bad:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004bb0:	83 c0 03             	add    eax,0x3
 1004bb3:	c6 00 76             	mov    BYTE PTR [eax],0x76
 1004bb6:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004bba:	83 e0 10             	and    eax,0x10
 1004bbd:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004bc0:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004bc4:	74 09                	je     1004bcf <translate_attr+0x89>
 1004bc6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004bc9:	83 c0 03             	add    eax,0x3
 1004bcc:	c6 00 64             	mov    BYTE PTR [eax],0x64
 1004bcf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004bd2:	83 c0 05             	add    eax,0x5
 1004bd5:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1004bd8:	90                   	nop
 1004bd9:	c9                   	leave  
 1004bda:	c3                   	ret    

01004bdb <extend_cluster>:
 1004bdb:	55                   	push   ebp
 1004bdc:	89 e5                	mov    ebp,esp
 1004bde:	83 ec 14             	sub    esp,0x14
 1004be1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004be4:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 1004be8:	e8 3f fd ff ff       	call   100492c <req_cluster>
 1004bed:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004bf0:	83 7d fc ff          	cmp    DWORD PTR [ebp-0x4],0xffffffff
 1004bf4:	75 07                	jne    1004bfd <extend_cluster+0x22>
 1004bf6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004bfb:	eb 14                	jmp    1004c11 <extend_cluster+0x36>
 1004bfd:	0f bf 45 ec          	movsx  eax,WORD PTR [ebp-0x14]
 1004c01:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004c04:	66 89 94 00 c0 21 42 	mov    WORD PTR [eax+eax*1+0x4221c0],dx
 1004c0b:	00 
 1004c0c:	b8 00 00 00 00       	mov    eax,0x0
 1004c11:	c9                   	leave  
 1004c12:	c3                   	ret    

01004c13 <touch>:
 1004c13:	55                   	push   ebp
 1004c14:	89 e5                	mov    ebp,esp
 1004c16:	83 ec 48             	sub    esp,0x48
 1004c19:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c1c:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1004c1f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004c22:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c25:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1004c28:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 1004c2c:	c7 45 e8 10 00 00 00 	mov    DWORD PTR [ebp-0x18],0x10
 1004c33:	c7 45 e4 c0 1f 42 00 	mov    DWORD PTR [ebp-0x1c],0x421fc0
 1004c3a:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004c41:	0f b6 c0             	movzx  eax,al
 1004c44:	0f b7 55 da          	movzx  edx,WORD PTR [ebp-0x26]
 1004c48:	0f b7 ca             	movzx  ecx,dx
 1004c4b:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1004c51:	01 ca                	add    edx,ecx
 1004c53:	83 ec 04             	sub    esp,0x4
 1004c56:	50                   	push   eax
 1004c57:	52                   	push   edx
 1004c58:	68 c0 1f 42 00       	push   0x421fc0
 1004c5d:	e8 6c 03 00 00       	call   1004fce <read_sec>
 1004c62:	83 c4 10             	add    esp,0x10
 1004c65:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 1004c69:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004c6d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004c74:	e9 04 01 00 00       	jmp    1004d7d <touch+0x16a>
 1004c79:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004c7c:	c1 e0 05             	shl    eax,0x5
 1004c7f:	89 c2                	mov    edx,eax
 1004c81:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004c84:	01 d0                	add    eax,edx
 1004c86:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c89:	3c e5                	cmp    al,0xe5
 1004c8b:	74 18                	je     1004ca5 <touch+0x92>
 1004c8d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004c90:	c1 e0 05             	shl    eax,0x5
 1004c93:	89 c2                	mov    edx,eax
 1004c95:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004c98:	01 d0                	add    eax,edx
 1004c9a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004c9d:	84 c0                	test   al,al
 1004c9f:	0f 85 d4 00 00 00    	jne    1004d79 <touch+0x166>
 1004ca5:	83 ec 0c             	sub    esp,0xc
 1004ca8:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004cab:	e8 a0 fb ff ff       	call   1004850 <format_name>
 1004cb0:	83 c4 10             	add    esp,0x10
 1004cb3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004cb6:	c1 e0 05             	shl    eax,0x5
 1004cb9:	89 c2                	mov    edx,eax
 1004cbb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004cbe:	01 d0                	add    eax,edx
 1004cc0:	83 ec 04             	sub    esp,0x4
 1004cc3:	6a 0b                	push   0xb
 1004cc5:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004cc8:	50                   	push   eax
 1004cc9:	e8 81 18 00 00       	call   100654f <memcpy>
 1004cce:	83 c4 10             	add    esp,0x10
 1004cd1:	e8 56 fc ff ff       	call   100492c <req_cluster>
 1004cd6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1004cd9:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 1004cdd:	75 0a                	jne    1004ce9 <touch+0xd6>
 1004cdf:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004ce4:	e9 ed 00 00 00       	jmp    1004dd6 <touch+0x1c3>
 1004ce9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004cec:	c1 e0 05             	shl    eax,0x5
 1004cef:	89 c2                	mov    edx,eax
 1004cf1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004cf4:	01 d0                	add    eax,edx
 1004cf6:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004cf9:	66 89 50 1a          	mov    WORD PTR [eax+0x1a],dx
 1004cfd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004d00:	c1 e0 05             	shl    eax,0x5
 1004d03:	89 c2                	mov    edx,eax
 1004d05:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004d08:	01 d0                	add    eax,edx
 1004d0a:	83 ec 08             	sub    esp,0x8
 1004d0d:	6a 20                	push   0x20
 1004d0f:	50                   	push   eax
 1004d10:	e8 a6 fc ff ff       	call   10049bb <set_attr>
 1004d15:	83 c4 10             	add    esp,0x10
 1004d18:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1004d1f:	0f b7 d0             	movzx  edx,ax
 1004d22:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004d29:	0f b6 c0             	movzx  eax,al
 1004d2c:	0f af d0             	imul   edx,eax
 1004d2f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004d32:	c1 e0 05             	shl    eax,0x5
 1004d35:	89 c1                	mov    ecx,eax
 1004d37:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004d3a:	01 c8                	add    eax,ecx
 1004d3c:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
 1004d3f:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1004d46:	0f b7 d0             	movzx  edx,ax
 1004d49:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004d50:	0f b6 c0             	movzx  eax,al
 1004d53:	0f af c2             	imul   eax,edx
 1004d56:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004d5a:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1004d60:	01 ca                	add    edx,ecx
 1004d62:	83 ec 04             	sub    esp,0x4
 1004d65:	50                   	push   eax
 1004d66:	52                   	push   edx
 1004d67:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1004d6a:	e8 03 fc ff ff       	call   1004972 <write_sec>
 1004d6f:	83 c4 10             	add    esp,0x10
 1004d72:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004d77:	eb 5d                	jmp    1004dd6 <touch+0x1c3>
 1004d79:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004d7d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004d80:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 1004d83:	0f 8c f0 fe ff ff    	jl     1004c79 <touch+0x66>
 1004d89:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004d8e:	77 36                	ja     1004dc6 <touch+0x1b3>
 1004d90:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004d94:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1004d9b:	00 
 1004d9c:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004da0:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004da7:	0f b6 c0             	movzx  eax,al
 1004daa:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004dae:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1004db4:	01 ca                	add    edx,ecx
 1004db6:	83 ec 04             	sub    esp,0x4
 1004db9:	50                   	push   eax
 1004dba:	52                   	push   edx
 1004dbb:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1004dbe:	e8 0b 02 00 00       	call   1004fce <read_sec>
 1004dc3:	83 c4 10             	add    esp,0x10
 1004dc6:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004dcb:	0f 86 9c fe ff ff    	jbe    1004c6d <touch+0x5a>
 1004dd1:	b8 00 00 00 00       	mov    eax,0x0
 1004dd6:	c9                   	leave  
 1004dd7:	c3                   	ret    

01004dd8 <mkdir>:
 1004dd8:	55                   	push   ebp
 1004dd9:	89 e5                	mov    ebp,esp
 1004ddb:	83 ec 48             	sub    esp,0x48
 1004dde:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004de1:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1004de4:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004de7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004dea:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1004ded:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 1004df1:	83 ec 0c             	sub    esp,0xc
 1004df4:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004df7:	e8 54 fa ff ff       	call   1004850 <format_name>
 1004dfc:	83 c4 10             	add    esp,0x10
 1004dff:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 1004e03:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004e07:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1004e0e:	0f b6 c0             	movzx  eax,al
 1004e11:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004e15:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1004e1b:	01 ca                	add    edx,ecx
 1004e1d:	83 ec 04             	sub    esp,0x4
 1004e20:	50                   	push   eax
 1004e21:	52                   	push   edx
 1004e22:	68 c0 1f 42 00       	push   0x421fc0
 1004e27:	e8 a2 01 00 00       	call   1004fce <read_sec>
 1004e2c:	83 c4 10             	add    esp,0x10
 1004e2f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004e36:	e9 60 01 00 00       	jmp    1004f9b <mkdir+0x1c3>
 1004e3b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e3e:	c1 e0 05             	shl    eax,0x5
 1004e41:	05 da 1f 42 00       	add    eax,0x421fda
 1004e46:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1004e49:	66 85 c0             	test   ax,ax
 1004e4c:	74 28                	je     1004e76 <mkdir+0x9e>
 1004e4e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e51:	c1 e0 05             	shl    eax,0x5
 1004e54:	05 a0 df 41 00       	add    eax,0x41dfa0
 1004e59:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004e5c:	3c e5                	cmp    al,0xe5
 1004e5e:	74 16                	je     1004e76 <mkdir+0x9e>
 1004e60:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e63:	c1 e0 05             	shl    eax,0x5
 1004e66:	05 a0 df 41 00       	add    eax,0x41dfa0
 1004e6b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004e6e:	84 c0                	test   al,al
 1004e70:	0f 85 21 01 00 00    	jne    1004f97 <mkdir+0x1bf>
 1004e76:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e79:	c1 e0 05             	shl    eax,0x5
 1004e7c:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004e81:	83 ec 04             	sub    esp,0x4
 1004e84:	6a 20                	push   0x20
 1004e86:	6a 00                	push   0x0
 1004e88:	50                   	push   eax
 1004e89:	e8 4b 17 00 00       	call   10065d9 <memset>
 1004e8e:	83 c4 10             	add    esp,0x10
 1004e91:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e94:	c1 e0 05             	shl    eax,0x5
 1004e97:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004e9c:	83 ec 04             	sub    esp,0x4
 1004e9f:	6a 0b                	push   0xb
 1004ea1:	6a 20                	push   0x20
 1004ea3:	50                   	push   eax
 1004ea4:	e8 30 17 00 00       	call   10065d9 <memset>
 1004ea9:	83 c4 10             	add    esp,0x10
 1004eac:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004eaf:	c1 e0 05             	shl    eax,0x5
 1004eb2:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004eb7:	83 ec 08             	sub    esp,0x8
 1004eba:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004ebd:	50                   	push   eax
 1004ebe:	e8 54 17 00 00       	call   1006617 <strcpy>
 1004ec3:	83 c4 10             	add    esp,0x10
 1004ec6:	83 ec 0c             	sub    esp,0xc
 1004ec9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004ecc:	e8 0c 19 00 00       	call   10067dd <strlen>
 1004ed1:	83 c4 10             	add    esp,0x10
 1004ed4:	89 c2                	mov    edx,eax
 1004ed6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004ed9:	c1 e0 05             	shl    eax,0x5
 1004edc:	01 d0                	add    eax,edx
 1004ede:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004ee3:	c6 00 20             	mov    BYTE PTR [eax],0x20
 1004ee6:	e8 41 fa ff ff       	call   100492c <req_cluster>
 1004eeb:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1004eee:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 1004ef2:	75 0a                	jne    1004efe <mkdir+0x126>
 1004ef4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004ef9:	e9 ce 00 00 00       	jmp    1004fcc <mkdir+0x1f4>
 1004efe:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1004f01:	89 c2                	mov    edx,eax
 1004f03:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f06:	c1 e0 05             	shl    eax,0x5
 1004f09:	05 da 1f 42 00       	add    eax,0x421fda
 1004f0e:	66 89 10             	mov    WORD PTR [eax],dx
 1004f11:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f14:	c1 e0 05             	shl    eax,0x5
 1004f17:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004f1c:	83 ec 08             	sub    esp,0x8
 1004f1f:	6a 10                	push   0x10
 1004f21:	50                   	push   eax
 1004f22:	e8 94 fa ff ff       	call   10049bb <set_attr>
 1004f27:	83 c4 10             	add    esp,0x10
 1004f2a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f2d:	c1 e0 05             	shl    eax,0x5
 1004f30:	05 dc 1f 42 00       	add    eax,0x421fdc
 1004f35:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1004f3b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f3e:	c1 e0 05             	shl    eax,0x5
 1004f41:	05 c0 1f 42 00       	add    eax,0x421fc0
 1004f46:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1004f49:	ff 70 18             	push   DWORD PTR [eax+0x18]
 1004f4c:	ff 70 14             	push   DWORD PTR [eax+0x14]
 1004f4f:	ff 70 10             	push   DWORD PTR [eax+0x10]
 1004f52:	ff 70 0c             	push   DWORD PTR [eax+0xc]
 1004f55:	ff 70 08             	push   DWORD PTR [eax+0x8]
 1004f58:	ff 70 04             	push   DWORD PTR [eax+0x4]
 1004f5b:	ff 30                	push   DWORD PTR [eax]
 1004f5d:	e8 e1 fa ff ff       	call   1004a43 <add_dot_and_ddot_dir>
 1004f62:	83 c4 20             	add    esp,0x20
 1004f65:	0f b7 55 f6          	movzx  edx,WORD PTR [ebp-0xa]
 1004f69:	a1 f0 6c 00 01       	mov    eax,ds:0x1006cf0
 1004f6e:	01 d0                	add    eax,edx
 1004f70:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1004f73:	83 ec 04             	sub    esp,0x4
 1004f76:	68 00 02 00 00       	push   0x200
 1004f7b:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1004f7e:	68 c0 1f 42 00       	push   0x421fc0
 1004f83:	e8 ea f9 ff ff       	call   1004972 <write_sec>
 1004f88:	83 c4 10             	add    esp,0x10
 1004f8b:	e8 4c fa ff ff       	call   10049dc <update_fat_and_root>
 1004f90:	b8 00 00 00 00       	mov    eax,0x0
 1004f95:	eb 35                	jmp    1004fcc <mkdir+0x1f4>
 1004f97:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004f9b:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 1004f9f:	0f 8e 96 fe ff ff    	jle    1004e3b <mkdir+0x63>
 1004fa5:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004faa:	77 10                	ja     1004fbc <mkdir+0x1e4>
 1004fac:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004fb0:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1004fb7:	00 
 1004fb8:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004fbc:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004fc1:	0f 86 40 fe ff ff    	jbe    1004e07 <mkdir+0x2f>
 1004fc7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004fcc:	c9                   	leave  
 1004fcd:	c3                   	ret    

01004fce <read_sec>:
 1004fce:	55                   	push   ebp
 1004fcf:	89 e5                	mov    ebp,esp
 1004fd1:	57                   	push   edi
 1004fd2:	81 ec 84 00 00 00    	sub    esp,0x84
 1004fd8:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 1004fde:	b8 00 00 00 00       	mov    eax,0x0
 1004fe3:	b9 1f 00 00 00       	mov    ecx,0x1f
 1004fe8:	89 d7                	mov    edi,edx
 1004fea:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1004fec:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004fef:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1004ff5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004ff8:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 1004ffe:	c7 45 90 01 00 00 00 	mov    DWORD PTR [ebp-0x70],0x1
 1005005:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100500c:	eb 3f                	jmp    100504d <read_sec+0x7f>
 100500e:	a1 ac 6c 00 01       	mov    eax,ds:0x1006cac
 1005013:	83 ec 0c             	sub    esp,0xc
 1005016:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 100501c:	52                   	push   edx
 100501d:	ff d0                	call   eax
 100501f:	83 c4 10             	add    esp,0x10
 1005022:	8b 95 7c ff ff ff    	mov    edx,DWORD PTR [ebp-0x84]
 1005028:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 100502f:	0f b7 c0             	movzx  eax,ax
 1005032:	01 d0                	add    eax,edx
 1005034:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100503a:	8b 85 78 ff ff ff    	mov    eax,DWORD PTR [ebp-0x88]
 1005040:	83 c0 01             	add    eax,0x1
 1005043:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1005049:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100504d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005050:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1005053:	7c b9                	jl     100500e <read_sec+0x40>
 1005055:	b8 00 00 00 00       	mov    eax,0x0
 100505a:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 100505d:	c9                   	leave  
 100505e:	c3                   	ret    

0100505f <rm>:
 100505f:	55                   	push   ebp
 1005060:	89 e5                	mov    ebp,esp
 1005062:	57                   	push   edi
 1005063:	81 ec b4 00 00 00    	sub    esp,0xb4
 1005069:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100506c:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 100506f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005072:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
 1005078:	b8 00 00 00 00       	mov    eax,0x0
 100507d:	b9 1f 00 00 00       	mov    ecx,0x1f
 1005082:	89 d7                	mov    edi,edx
 1005084:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1005086:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005089:	8b 40 78             	mov    eax,DWORD PTR [eax+0x78]
 100508c:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
 1005092:	83 ec 0c             	sub    esp,0xc
 1005095:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
 100509b:	50                   	push   eax
 100509c:	e8 83 08 00 00       	call   1005924 <get_entry>
 10050a1:	83 c4 10             	add    esp,0x10
 10050a4:	83 f8 ff             	cmp    eax,0xffffffff
 10050a7:	75 0a                	jne    10050b3 <rm+0x54>
 10050a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10050ae:	e9 7f 01 00 00       	jmp    1005232 <rm+0x1d3>
 10050b3:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 10050b6:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 10050ba:	c7 45 e4 c0 1f 42 00 	mov    DWORD PTR [ebp-0x1c],0x421fc0
 10050c1:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10050c8:	0f b6 c0             	movzx  eax,al
 10050cb:	0f b7 55 de          	movzx  edx,WORD PTR [ebp-0x22]
 10050cf:	0f b7 ca             	movzx  ecx,dx
 10050d2:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 10050d8:	01 ca                	add    edx,ecx
 10050da:	83 ec 04             	sub    esp,0x4
 10050dd:	50                   	push   eax
 10050de:	52                   	push   edx
 10050df:	68 c0 1f 42 00       	push   0x421fc0
 10050e4:	e8 e5 fe ff ff       	call   1004fce <read_sec>
 10050e9:	83 c4 10             	add    esp,0x10
 10050ec:	c7 45 e4 c0 1f 42 00 	mov    DWORD PTR [ebp-0x1c],0x421fc0
 10050f3:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 10050f7:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10050fb:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1005102:	eb 79                	jmp    100517d <rm+0x11e>
 1005104:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 100510b:	0f b6 c0             	movzx  eax,al
 100510e:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005112:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1005118:	01 ca                	add    edx,ecx
 100511a:	83 ec 04             	sub    esp,0x4
 100511d:	50                   	push   eax
 100511e:	52                   	push   edx
 100511f:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005122:	e8 a7 fe ff ff       	call   1004fce <read_sec>
 1005127:	83 c4 10             	add    esp,0x10
 100512a:	eb 34                	jmp    1005160 <rm+0x101>
 100512c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100512f:	c1 e0 05             	shl    eax,0x5
 1005132:	89 c2                	mov    edx,eax
 1005134:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005137:	01 d0                	add    eax,edx
 1005139:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 100513d:	0f b7 d0             	movzx  edx,ax
 1005140:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005143:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005146:	39 c2                	cmp    edx,eax
 1005148:	75 12                	jne    100515c <rm+0xfd>
 100514a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100514d:	c1 e0 05             	shl    eax,0x5
 1005150:	89 c2                	mov    edx,eax
 1005152:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005155:	01 d0                	add    eax,edx
 1005157:	c6 00 e5             	mov    BYTE PTR [eax],0xe5
 100515a:	eb 29                	jmp    1005185 <rm+0x126>
 100515c:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1005160:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 1005164:	7e c6                	jle    100512c <rm+0xcd>
 1005166:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 100516b:	77 10                	ja     100517d <rm+0x11e>
 100516d:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1005171:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005178:	00 
 1005179:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 100517d:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1005182:	76 80                	jbe    1005104 <rm+0xa5>
 1005184:	90                   	nop
 1005185:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005188:	c1 e0 05             	shl    eax,0x5
 100518b:	89 c2                	mov    edx,eax
 100518d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005190:	01 d0                	add    eax,edx
 1005192:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 1005196:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 100519a:	66 83 7d ee f6       	cmp    WORD PTR [ebp-0x12],0xfff6
 100519f:	77 0e                	ja     10051af <rm+0x150>
 10051a1:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10051a5:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10051ac:	00 
 10051ad:	eb 05                	jmp    10051b4 <rm+0x155>
 10051af:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10051b4:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 10051b8:	eb 26                	jmp    10051e0 <rm+0x181>
 10051ba:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10051be:	66 c7 84 00 c0 21 42 	mov    WORD PTR [eax+eax*1+0x4221c0],0x0
 10051c5:	00 00 00 
 10051c8:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10051cc:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 10051d0:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10051d4:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10051db:	00 
 10051dc:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 10051e0:	66 83 7d ec f6       	cmp    WORD PTR [ebp-0x14],0xfff6
 10051e5:	76 d3                	jbe    10051ba <rm+0x15b>
 10051e7:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10051eb:	66 c7 84 00 c0 21 42 	mov    WORD PTR [eax+eax*1+0x4221c0],0x0
 10051f2:	00 00 00 
 10051f5:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10051fc:	0f b6 d0             	movzx  edx,al
 10051ff:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005206:	0f b7 c0             	movzx  eax,ax
 1005209:	0f af c2             	imul   eax,edx
 100520c:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005210:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1005216:	01 ca                	add    edx,ecx
 1005218:	83 ec 04             	sub    esp,0x4
 100521b:	50                   	push   eax
 100521c:	52                   	push   edx
 100521d:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005220:	e8 4d f7 ff ff       	call   1004972 <write_sec>
 1005225:	83 c4 10             	add    esp,0x10
 1005228:	e8 af f7 ff ff       	call   10049dc <update_fat_and_root>
 100522d:	b8 00 00 00 00       	mov    eax,0x0
 1005232:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1005235:	c9                   	leave  
 1005236:	c3                   	ret    

01005237 <find>:
 1005237:	55                   	push   ebp
 1005238:	89 e5                	mov    ebp,esp
 100523a:	83 ec 28             	sub    esp,0x28
 100523d:	c7 45 f4 00 02 00 00 	mov    DWORD PTR [ebp-0xc],0x200
 1005244:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100524b:	c7 45 ec c0 1f 42 00 	mov    DWORD PTR [ebp-0x14],0x421fc0
 1005252:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1005259:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100525d:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1005264:	66 85 c0             	test   ax,ax
 1005267:	75 09                	jne    1005272 <find+0x3b>
 1005269:	c7 45 ec a0 df 41 00 	mov    DWORD PTR [ebp-0x14],0x41dfa0
 1005270:	eb 2d                	jmp    100529f <find+0x68>
 1005272:	c7 45 f4 10 00 00 00 	mov    DWORD PTR [ebp-0xc],0x10
 1005279:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1005280:	0f b6 c0             	movzx  eax,al
 1005283:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005287:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 100528d:	01 ca                	add    edx,ecx
 100528f:	83 ec 04             	sub    esp,0x4
 1005292:	50                   	push   eax
 1005293:	52                   	push   edx
 1005294:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1005297:	e8 32 fd ff ff       	call   1004fce <read_sec>
 100529c:	83 c4 10             	add    esp,0x10
 100529f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10052a6:	eb 45                	jmp    10052ed <find+0xb6>
 10052a8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10052ab:	c1 e0 05             	shl    eax,0x5
 10052ae:	89 c2                	mov    edx,eax
 10052b0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10052b3:	01 d0                	add    eax,edx
 10052b5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10052b8:	84 c0                	test   al,al
 10052ba:	74 2c                	je     10052e8 <find+0xb1>
 10052bc:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10052bf:	c1 e0 05             	shl    eax,0x5
 10052c2:	89 c2                	mov    edx,eax
 10052c4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10052c7:	01 d0                	add    eax,edx
 10052c9:	83 ec 04             	sub    esp,0x4
 10052cc:	6a 0b                	push   0xb
 10052ce:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10052d1:	50                   	push   eax
 10052d2:	e8 b0 12 00 00       	call   1006587 <memcmp>
 10052d7:	83 c4 10             	add    esp,0x10
 10052da:	85 c0                	test   eax,eax
 10052dc:	75 0b                	jne    10052e9 <find+0xb2>
 10052de:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 10052e1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10052e4:	01 d0                	add    eax,edx
 10052e6:	eb 71                	jmp    1005359 <find+0x122>
 10052e8:	90                   	nop
 10052e9:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10052ed:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10052f0:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 10052f3:	7c b3                	jl     10052a8 <find+0x71>
 10052f5:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 10052fc:	66 85 c0             	test   ax,ax
 10052ff:	75 07                	jne    1005308 <find+0xd1>
 1005301:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005306:	eb 51                	jmp    1005359 <find+0x122>
 1005308:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100530d:	77 3a                	ja     1005349 <find+0x112>
 100530f:	83 45 f0 10          	add    DWORD PTR [ebp-0x10],0x10
 1005313:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005317:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 100531e:	00 
 100531f:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005323:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 100532a:	0f b6 c0             	movzx  eax,al
 100532d:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005331:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1005337:	01 ca                	add    edx,ecx
 1005339:	83 ec 04             	sub    esp,0x4
 100533c:	50                   	push   eax
 100533d:	52                   	push   edx
 100533e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1005341:	e8 88 fc ff ff       	call   1004fce <read_sec>
 1005346:	83 c4 10             	add    esp,0x10
 1005349:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100534e:	0f 86 4b ff ff ff    	jbe    100529f <find+0x68>
 1005354:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005359:	c9                   	leave  
 100535a:	c3                   	ret    

0100535b <read_file_byname>:
 100535b:	55                   	push   ebp
 100535c:	89 e5                	mov    ebp,esp
 100535e:	53                   	push   ebx
 100535f:	83 ec 54             	sub    esp,0x54
 1005362:	89 e0                	mov    eax,esp
 1005364:	89 c3                	mov    ebx,eax
 1005366:	83 ec 0c             	sub    esp,0xc
 1005369:	6a 00                	push   0x0
 100536b:	e8 c7 fe ff ff       	call   1005237 <find>
 1005370:	83 c4 10             	add    esp,0x10
 1005373:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005376:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 100537a:	74 06                	je     1005382 <read_file_byname+0x27>
 100537c:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005380:	79 0a                	jns    100538c <read_file_byname+0x31>
 1005382:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005387:	e9 86 02 00 00       	jmp    1005612 <read_file_byname+0x2b7>
 100538c:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 1005393:	c7 45 f0 a0 df 41 00 	mov    DWORD PTR [ebp-0x10],0x41dfa0
 100539a:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 10053a1:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 10053a8:	66 85 c0             	test   ax,ax
 10053ab:	74 43                	je     10053f0 <read_file_byname+0x95>
 10053ad:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10053b4:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 10053bb:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10053c2:	0f b6 c0             	movzx  eax,al
 10053c5:	0f b7 15 ba 1f 42 00 	movzx  edx,WORD PTR ds:0x421fba
 10053cc:	0f b7 ca             	movzx  ecx,dx
 10053cf:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 10053d5:	01 ca                	add    edx,ecx
 10053d7:	83 ec 04             	sub    esp,0x4
 10053da:	50                   	push   eax
 10053db:	52                   	push   edx
 10053dc:	68 c0 1f 42 00       	push   0x421fc0
 10053e1:	e8 e8 fb ff ff       	call   1004fce <read_sec>
 10053e6:	83 c4 10             	add    esp,0x10
 10053e9:	c7 45 f0 c0 1f 42 00 	mov    DWORD PTR [ebp-0x10],0x421fc0
 10053f0:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 10053f7:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10053fb:	eb 41                	jmp    100543e <read_file_byname+0xe3>
 10053fd:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 1005401:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005406:	77 36                	ja     100543e <read_file_byname+0xe3>
 1005408:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 100540c:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005413:	00 
 1005414:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005418:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 100541f:	0f b6 c0             	movzx  eax,al
 1005422:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005426:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 100542c:	01 ca                	add    edx,ecx
 100542e:	83 ec 04             	sub    esp,0x4
 1005431:	50                   	push   eax
 1005432:	52                   	push   edx
 1005433:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005436:	e8 93 fb ff ff       	call   1004fce <read_sec>
 100543b:	83 c4 10             	add    esp,0x10
 100543e:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1005442:	75 0d                	jne    1005451 <read_file_byname+0xf6>
 1005444:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005448:	7e 07                	jle    1005451 <read_file_byname+0xf6>
 100544a:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100544f:	76 ac                	jbe    10053fd <read_file_byname+0xa2>
 1005451:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005454:	c1 e0 05             	shl    eax,0x5
 1005457:	89 c2                	mov    edx,eax
 1005459:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100545c:	01 d0                	add    eax,edx
 100545e:	8b 10                	mov    edx,DWORD PTR [eax]
 1005460:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005463:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005466:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005469:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 100546c:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 100546f:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005472:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005475:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005478:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 100547b:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 100547e:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 1005481:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005484:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005487:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 100548a:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100548d:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 1005491:	0f b7 c0             	movzx  eax,ax
 1005494:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005497:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 100549e:	0f b7 d0             	movzx  edx,ax
 10054a1:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10054a8:	0f b6 c0             	movzx  eax,al
 10054ab:	0f af c2             	imul   eax,edx
 10054ae:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10054b1:	eb 1d                	jmp    10054d0 <read_file_byname+0x175>
 10054b3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10054b6:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 10054b9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10054bc:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10054c3:	00 
 10054c4:	98                   	cwde   
 10054c5:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10054c8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10054cb:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10054ce:	7c 0a                	jl     10054da <read_file_byname+0x17f>
 10054d0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10054d3:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10054d6:	7d db                	jge    10054b3 <read_file_byname+0x158>
 10054d8:	eb 01                	jmp    10054db <read_file_byname+0x180>
 10054da:	90                   	nop
 10054db:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10054e2:	7e 12                	jle    10054f6 <read_file_byname+0x19b>
 10054e4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10054e7:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10054ea:	7c 0a                	jl     10054f6 <read_file_byname+0x19b>
 10054ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10054f1:	e9 1c 01 00 00       	jmp    1005612 <read_file_byname+0x2b7>
 10054f6:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10054f9:	8d 50 ff             	lea    edx,[eax-0x1]
 10054fc:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 10054ff:	89 c2                	mov    edx,eax
 1005501:	b8 10 00 00 00       	mov    eax,0x10
 1005506:	83 e8 01             	sub    eax,0x1
 1005509:	01 d0                	add    eax,edx
 100550b:	b9 10 00 00 00       	mov    ecx,0x10
 1005510:	ba 00 00 00 00       	mov    edx,0x0
 1005515:	f7 f1                	div    ecx
 1005517:	6b c0 10             	imul   eax,eax,0x10
 100551a:	89 c1                	mov    ecx,eax
 100551c:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1005522:	89 e2                	mov    edx,esp
 1005524:	29 ca                	sub    edx,ecx
 1005526:	39 d4                	cmp    esp,edx
 1005528:	74 10                	je     100553a <read_file_byname+0x1df>
 100552a:	81 ec 00 10 00 00    	sub    esp,0x1000
 1005530:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1005537:	00 
 1005538:	eb ec                	jmp    1005526 <read_file_byname+0x1cb>
 100553a:	89 c2                	mov    edx,eax
 100553c:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005542:	29 d4                	sub    esp,edx
 1005544:	89 c2                	mov    edx,eax
 1005546:	81 e2 ff 0f 00 00    	and    edx,0xfff
 100554c:	85 d2                	test   edx,edx
 100554e:	74 0d                	je     100555d <read_file_byname+0x202>
 1005550:	25 ff 0f 00 00       	and    eax,0xfff
 1005555:	83 e8 04             	sub    eax,0x4
 1005558:	01 e0                	add    eax,esp
 100555a:	83 08 00             	or     DWORD PTR [eax],0x0
 100555d:	89 e0                	mov    eax,esp
 100555f:	83 c0 00             	add    eax,0x0
 1005562:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005565:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 100556c:	0f b6 c0             	movzx  eax,al
 100556f:	8b 0d f0 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006cf0
 1005575:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1005578:	01 ca                	add    edx,ecx
 100557a:	83 ec 04             	sub    esp,0x4
 100557d:	50                   	push   eax
 100557e:	52                   	push   edx
 100557f:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005582:	e8 47 fa ff ff       	call   1004fce <read_sec>
 1005587:	83 c4 10             	add    esp,0x10
 100558a:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100558d:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005590:	89 c2                	mov    edx,eax
 1005592:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 1005595:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005598:	01 c8                	add    eax,ecx
 100559a:	83 ec 04             	sub    esp,0x4
 100559d:	52                   	push   edx
 100559e:	50                   	push   eax
 100559f:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10055a2:	e8 a8 0f 00 00       	call   100654f <memcpy>
 10055a7:	83 c4 10             	add    esp,0x10
 10055aa:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10055ad:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10055b0:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10055b3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10055b6:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10055b9:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10055bc:	eb 40                	jmp    10055fe <read_file_byname+0x2a3>
 10055be:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10055c1:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10055c8:	00 
 10055c9:	98                   	cwde   
 10055ca:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10055cd:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10055d4:	0f b6 c0             	movzx  eax,al
 10055d7:	8b 0d f0 6c 00 01    	mov    ecx,DWORD PTR ds:0x1006cf0
 10055dd:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10055e0:	01 ca                	add    edx,ecx
 10055e2:	83 ec 04             	sub    esp,0x4
 10055e5:	50                   	push   eax
 10055e6:	52                   	push   edx
 10055e7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10055ea:	e8 df f9 ff ff       	call   1004fce <read_sec>
 10055ef:	83 c4 10             	add    esp,0x10
 10055f2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10055f5:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10055f8:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10055fb:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10055fe:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 1005605:	7f 06                	jg     100560d <read_file_byname+0x2b2>
 1005607:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 100560b:	7f b1                	jg     10055be <read_file_byname+0x263>
 100560d:	b8 00 00 00 00       	mov    eax,0x0
 1005612:	89 dc                	mov    esp,ebx
 1005614:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005617:	c9                   	leave  
 1005618:	c3                   	ret    

01005619 <write_file_byname>:
 1005619:	55                   	push   ebp
 100561a:	89 e5                	mov    ebp,esp
 100561c:	53                   	push   ebx
 100561d:	83 ec 54             	sub    esp,0x54
 1005620:	89 e0                	mov    eax,esp
 1005622:	89 c3                	mov    ebx,eax
 1005624:	83 ec 0c             	sub    esp,0xc
 1005627:	6a 00                	push   0x0
 1005629:	e8 09 fc ff ff       	call   1005237 <find>
 100562e:	83 c4 10             	add    esp,0x10
 1005631:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005634:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1005638:	74 06                	je     1005640 <write_file_byname+0x27>
 100563a:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 100563e:	79 0a                	jns    100564a <write_file_byname+0x31>
 1005640:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005645:	e9 b2 02 00 00       	jmp    10058fc <write_file_byname+0x2e3>
 100564a:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 1005651:	c7 45 f0 a0 df 41 00 	mov    DWORD PTR [ebp-0x10],0x41dfa0
 1005658:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 100565f:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1005666:	66 85 c0             	test   ax,ax
 1005669:	74 43                	je     10056ae <write_file_byname+0x95>
 100566b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005672:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 1005679:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1005680:	0f b6 c0             	movzx  eax,al
 1005683:	0f b7 15 ba 1f 42 00 	movzx  edx,WORD PTR ds:0x421fba
 100568a:	0f b7 ca             	movzx  ecx,dx
 100568d:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1005693:	01 ca                	add    edx,ecx
 1005695:	83 ec 04             	sub    esp,0x4
 1005698:	50                   	push   eax
 1005699:	52                   	push   edx
 100569a:	68 c0 1f 42 00       	push   0x421fc0
 100569f:	e8 2a f9 ff ff       	call   1004fce <read_sec>
 10056a4:	83 c4 10             	add    esp,0x10
 10056a7:	c7 45 f0 c0 1f 42 00 	mov    DWORD PTR [ebp-0x10],0x421fc0
 10056ae:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 10056b5:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10056b9:	eb 41                	jmp    10056fc <write_file_byname+0xe3>
 10056bb:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 10056bf:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 10056c4:	77 36                	ja     10056fc <write_file_byname+0xe3>
 10056c6:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 10056ca:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10056d1:	00 
 10056d2:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10056d6:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 10056dd:	0f b6 c0             	movzx  eax,al
 10056e0:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 10056e4:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 10056ea:	01 ca                	add    edx,ecx
 10056ec:	83 ec 04             	sub    esp,0x4
 10056ef:	50                   	push   eax
 10056f0:	52                   	push   edx
 10056f1:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 10056f4:	e8 d5 f8 ff ff       	call   1004fce <read_sec>
 10056f9:	83 c4 10             	add    esp,0x10
 10056fc:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1005700:	75 0d                	jne    100570f <write_file_byname+0xf6>
 1005702:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005706:	7e 07                	jle    100570f <write_file_byname+0xf6>
 1005708:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100570d:	76 ac                	jbe    10056bb <write_file_byname+0xa2>
 100570f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005712:	c1 e0 05             	shl    eax,0x5
 1005715:	89 c2                	mov    edx,eax
 1005717:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100571a:	01 d0                	add    eax,edx
 100571c:	8b 10                	mov    edx,DWORD PTR [eax]
 100571e:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005721:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005724:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005727:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 100572a:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 100572d:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005730:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005733:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005736:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005739:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 100573c:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 100573f:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005742:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005745:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005748:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100574b:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 100574f:	0f b7 c0             	movzx  eax,ax
 1005752:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005755:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 100575c:	0f b7 d0             	movzx  edx,ax
 100575f:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1005766:	0f b6 c0             	movzx  eax,al
 1005769:	0f af c2             	imul   eax,edx
 100576c:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 100576f:	eb 1d                	jmp    100578e <write_file_byname+0x175>
 1005771:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005774:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 1005777:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 100577a:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 100577d:	7c 19                	jl     1005798 <write_file_byname+0x17f>
 100577f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005782:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005789:	00 
 100578a:	98                   	cwde   
 100578b:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 100578e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005791:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005794:	7d db                	jge    1005771 <write_file_byname+0x158>
 1005796:	eb 01                	jmp    1005799 <write_file_byname+0x180>
 1005798:	90                   	nop
 1005799:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10057a0:	7e 12                	jle    10057b4 <write_file_byname+0x19b>
 10057a2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10057a5:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10057a8:	7c 0a                	jl     10057b4 <write_file_byname+0x19b>
 10057aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10057af:	e9 48 01 00 00       	jmp    10058fc <write_file_byname+0x2e3>
 10057b4:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10057b7:	8d 50 ff             	lea    edx,[eax-0x1]
 10057ba:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 10057bd:	89 c2                	mov    edx,eax
 10057bf:	b8 10 00 00 00       	mov    eax,0x10
 10057c4:	83 e8 01             	sub    eax,0x1
 10057c7:	01 d0                	add    eax,edx
 10057c9:	b9 10 00 00 00       	mov    ecx,0x10
 10057ce:	ba 00 00 00 00       	mov    edx,0x0
 10057d3:	f7 f1                	div    ecx
 10057d5:	6b c0 10             	imul   eax,eax,0x10
 10057d8:	89 c1                	mov    ecx,eax
 10057da:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 10057e0:	89 e2                	mov    edx,esp
 10057e2:	29 ca                	sub    edx,ecx
 10057e4:	39 d4                	cmp    esp,edx
 10057e6:	74 10                	je     10057f8 <write_file_byname+0x1df>
 10057e8:	81 ec 00 10 00 00    	sub    esp,0x1000
 10057ee:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 10057f5:	00 
 10057f6:	eb ec                	jmp    10057e4 <write_file_byname+0x1cb>
 10057f8:	89 c2                	mov    edx,eax
 10057fa:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005800:	29 d4                	sub    esp,edx
 1005802:	89 c2                	mov    edx,eax
 1005804:	81 e2 ff 0f 00 00    	and    edx,0xfff
 100580a:	85 d2                	test   edx,edx
 100580c:	74 0d                	je     100581b <write_file_byname+0x202>
 100580e:	25 ff 0f 00 00       	and    eax,0xfff
 1005813:	83 e8 04             	sub    eax,0x4
 1005816:	01 e0                	add    eax,esp
 1005818:	83 08 00             	or     DWORD PTR [eax],0x0
 100581b:	89 e0                	mov    eax,esp
 100581d:	83 c0 00             	add    eax,0x0
 1005820:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005823:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005827:	0f 8e 81 00 00 00    	jle    10058ae <write_file_byname+0x295>
 100582d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005830:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005833:	89 c2                	mov    edx,eax
 1005835:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 1005838:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 100583b:	01 c8                	add    eax,ecx
 100583d:	83 ec 04             	sub    esp,0x4
 1005840:	52                   	push   edx
 1005841:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005844:	50                   	push   eax
 1005845:	e8 05 0d 00 00       	call   100654f <memcpy>
 100584a:	83 c4 10             	add    esp,0x10
 100584d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005850:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005853:	83 ec 04             	sub    esp,0x4
 1005856:	50                   	push   eax
 1005857:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 100585a:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 100585d:	e8 10 f1 ff ff       	call   1004972 <write_sec>
 1005862:	83 c4 10             	add    esp,0x10
 1005865:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005868:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 100586f:	00 
 1005870:	98                   	cwde   
 1005871:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005874:	eb 38                	jmp    10058ae <write_file_byname+0x295>
 1005876:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 100587c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100587f:	01 d0                	add    eax,edx
 1005881:	83 ec 04             	sub    esp,0x4
 1005884:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 1005887:	50                   	push   eax
 1005888:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100588b:	e8 e2 f0 ff ff       	call   1004972 <write_sec>
 1005890:	83 c4 10             	add    esp,0x10
 1005893:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005896:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 1005899:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100589c:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 100589f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10058a2:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 10058a9:	00 
 10058aa:	98                   	cwde   
 10058ab:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10058ae:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10058b5:	7f 08                	jg     10058bf <write_file_byname+0x2a6>
 10058b7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10058ba:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058bd:	7d b7                	jge    1005876 <write_file_byname+0x25d>
 10058bf:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 10058c3:	7e 32                	jle    10058f7 <write_file_byname+0x2de>
 10058c5:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10058c8:	83 ec 04             	sub    esp,0x4
 10058cb:	50                   	push   eax
 10058cc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10058cf:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 10058d2:	e8 78 0c 00 00       	call   100654f <memcpy>
 10058d7:	83 c4 10             	add    esp,0x10
 10058da:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 10058e0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10058e3:	01 d0                	add    eax,edx
 10058e5:	83 ec 04             	sub    esp,0x4
 10058e8:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 10058eb:	50                   	push   eax
 10058ec:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 10058ef:	e8 7e f0 ff ff       	call   1004972 <write_sec>
 10058f4:	83 c4 10             	add    esp,0x10
 10058f7:	b8 00 00 00 00       	mov    eax,0x0
 10058fc:	89 dc                	mov    esp,ebx
 10058fe:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005901:	c9                   	leave  
 1005902:	c3                   	ret    

01005903 <file_exist>:
 1005903:	55                   	push   ebp
 1005904:	89 e5                	mov    ebp,esp
 1005906:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 100590a:	3c e5                	cmp    al,0xe5
 100590c:	74 08                	je     1005916 <file_exist+0x13>
 100590e:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 1005912:	84 c0                	test   al,al
 1005914:	75 07                	jne    100591d <file_exist+0x1a>
 1005916:	b8 00 00 00 00       	mov    eax,0x0
 100591b:	eb 05                	jmp    1005922 <file_exist+0x1f>
 100591d:	b8 01 00 00 00       	mov    eax,0x1
 1005922:	5d                   	pop    ebp
 1005923:	c3                   	ret    

01005924 <get_entry>:
 1005924:	55                   	push   ebp
 1005925:	89 e5                	mov    ebp,esp
 1005927:	57                   	push   edi
 1005928:	56                   	push   esi
 1005929:	81 ec a0 00 00 00    	sub    esp,0xa0
 100592f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005932:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1005935:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005938:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100593b:	8b 40 74             	mov    eax,DWORD PTR [eax+0x74]
 100593e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005941:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
 1005945:	c6 45 ac e5          	mov    BYTE PTR [ebp-0x54],0xe5
 1005949:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100594c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100594f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 1005956:	e9 50 01 00 00       	jmp    1005aab <get_entry+0x187>
 100595b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100595e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005961:	3c 2f                	cmp    al,0x2f
 1005963:	0f 85 3e 01 00 00    	jne    1005aa7 <get_entry+0x183>
 1005969:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100596c:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 100596f:	83 f8 0b             	cmp    eax,0xb
 1005972:	7e 0a                	jle    100597e <get_entry+0x5a>
 1005974:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005979:	e9 20 02 00 00       	jmp    1005b9e <get_entry+0x27a>
 100597e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005981:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1005984:	83 ec 04             	sub    esp,0x4
 1005987:	50                   	push   eax
 1005988:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 100598b:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 1005991:	50                   	push   eax
 1005992:	e8 b8 0b 00 00       	call   100654f <memcpy>
 1005997:	83 c4 10             	add    esp,0x10
 100599a:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 100599d:	a3 a0 1f 42 00       	mov    ds:0x421fa0,eax
 10059a2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 10059a5:	a3 a4 1f 42 00       	mov    ds:0x421fa4,eax
 10059aa:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10059ad:	a3 a8 1f 42 00       	mov    ds:0x421fa8,eax
 10059b2:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10059b5:	a3 ac 1f 42 00       	mov    ds:0x421fac,eax
 10059ba:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059bd:	a3 b0 1f 42 00       	mov    ds:0x421fb0,eax
 10059c2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10059c5:	a3 b4 1f 42 00       	mov    ds:0x421fb4,eax
 10059ca:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10059cd:	a3 b8 1f 42 00       	mov    ds:0x421fb8,eax
 10059d2:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 10059d5:	a3 bc 1f 42 00       	mov    ds:0x421fbc,eax
 10059da:	83 ec 0c             	sub    esp,0xc
 10059dd:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 10059e3:	50                   	push   eax
 10059e4:	e8 67 ee ff ff       	call   1004850 <format_name>
 10059e9:	83 c4 10             	add    esp,0x10
 10059ec:	83 ec 0c             	sub    esp,0xc
 10059ef:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 10059f5:	50                   	push   eax
 10059f6:	e8 3c f8 ff ff       	call   1005237 <find>
 10059fb:	83 c4 10             	add    esp,0x10
 10059fe:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005a01:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005a05:	75 0a                	jne    1005a11 <get_entry+0xed>
 1005a07:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005a0c:	e9 8d 01 00 00       	jmp    1005b9e <get_entry+0x27a>
 1005a11:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1005a18:	66 85 c0             	test   ax,ax
 1005a1b:	75 3c                	jne    1005a59 <get_entry+0x135>
 1005a1d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005a20:	c1 e0 05             	shl    eax,0x5
 1005a23:	05 a0 df 41 00       	add    eax,0x41dfa0
 1005a28:	8b 10                	mov    edx,DWORD PTR [eax]
 1005a2a:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005a2d:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005a30:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005a33:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005a36:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005a39:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005a3c:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005a3f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005a42:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005a45:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005a48:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005a4b:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005a4e:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005a51:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005a54:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005a57:	eb 45                	jmp    1005a9e <get_entry+0x17a>
 1005a59:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005a5c:	99                   	cdq    
 1005a5d:	c1 ea 1c             	shr    edx,0x1c
 1005a60:	01 d0                	add    eax,edx
 1005a62:	83 e0 0f             	and    eax,0xf
 1005a65:	29 d0                	sub    eax,edx
 1005a67:	c1 e0 05             	shl    eax,0x5
 1005a6a:	05 c0 1f 42 00       	add    eax,0x421fc0
 1005a6f:	8b 10                	mov    edx,DWORD PTR [eax]
 1005a71:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005a74:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005a77:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005a7a:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005a7d:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005a80:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005a83:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005a86:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005a89:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005a8c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005a8f:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005a92:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005a95:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005a98:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005a9b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005a9e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005aa1:	83 c0 01             	add    eax,0x1
 1005aa4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005aa7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1005aab:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005aae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005ab1:	84 c0                	test   al,al
 1005ab3:	0f 85 a2 fe ff ff    	jne    100595b <get_entry+0x37>
 1005ab9:	83 ec 0c             	sub    esp,0xc
 1005abc:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005abf:	e8 8c ed ff ff       	call   1004850 <format_name>
 1005ac4:	83 c4 10             	add    esp,0x10
 1005ac7:	83 ec 0c             	sub    esp,0xc
 1005aca:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005acd:	e8 65 f7 ff ff       	call   1005237 <find>
 1005ad2:	83 c4 10             	add    esp,0x10
 1005ad5:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005ad8:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005adc:	75 0a                	jne    1005ae8 <get_entry+0x1c4>
 1005ade:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005ae3:	e9 b6 00 00 00       	jmp    1005b9e <get_entry+0x27a>
 1005ae8:	0f b7 05 ba 1f 42 00 	movzx  eax,WORD PTR ds:0x421fba
 1005aef:	66 85 c0             	test   ax,ax
 1005af2:	75 3c                	jne    1005b30 <get_entry+0x20c>
 1005af4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005af7:	c1 e0 05             	shl    eax,0x5
 1005afa:	05 a0 df 41 00       	add    eax,0x41dfa0
 1005aff:	8b 10                	mov    edx,DWORD PTR [eax]
 1005b01:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005b04:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005b07:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005b0a:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005b0d:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005b10:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005b13:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005b16:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005b19:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005b1c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005b1f:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005b22:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005b25:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005b28:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005b2b:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005b2e:	eb 45                	jmp    1005b75 <get_entry+0x251>
 1005b30:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005b33:	99                   	cdq    
 1005b34:	c1 ea 1c             	shr    edx,0x1c
 1005b37:	01 d0                	add    eax,edx
 1005b39:	83 e0 0f             	and    eax,0xf
 1005b3c:	29 d0                	sub    eax,edx
 1005b3e:	c1 e0 05             	shl    eax,0x5
 1005b41:	05 c0 1f 42 00       	add    eax,0x421fc0
 1005b46:	8b 10                	mov    edx,DWORD PTR [eax]
 1005b48:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005b4b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005b4e:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005b51:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005b54:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005b57:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005b5a:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005b5d:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005b60:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005b63:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005b66:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005b69:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005b6c:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005b6f:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005b72:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005b75:	0f b7 45 c6          	movzx  eax,WORD PTR [ebp-0x3a]
 1005b79:	0f b7 c0             	movzx  eax,ax
 1005b7c:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1005b82:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005b85:	8d 50 24             	lea    edx,[eax+0x24]
 1005b88:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
 1005b8e:	b9 12 00 00 00       	mov    ecx,0x12
 1005b93:	89 d7                	mov    edi,edx
 1005b95:	89 c6                	mov    esi,eax
 1005b97:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1005b99:	b8 00 00 00 00       	mov    eax,0x0
 1005b9e:	8d 65 f8             	lea    esp,[ebp-0x8]
 1005ba1:	5e                   	pop    esi
 1005ba2:	5f                   	pop    edi
 1005ba3:	5d                   	pop    ebp
 1005ba4:	c3                   	ret    

01005ba5 <get_fname>:
 1005ba5:	55                   	push   ebp
 1005ba6:	89 e5                	mov    ebp,esp
 1005ba8:	83 ec 18             	sub    esp,0x18
 1005bab:	83 ec 08             	sub    esp,0x8
 1005bae:	6a 2f                	push   0x2f
 1005bb0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1005bb3:	e8 8e 0a 00 00       	call   1006646 <strtok>
 1005bb8:	83 c4 10             	add    esp,0x10
 1005bbb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005bbe:	eb 18                	jmp    1005bd8 <get_fname+0x33>
 1005bc0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005bc3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005bc6:	83 ec 08             	sub    esp,0x8
 1005bc9:	6a 2f                	push   0x2f
 1005bcb:	6a 00                	push   0x0
 1005bcd:	e8 74 0a 00 00       	call   1006646 <strtok>
 1005bd2:	83 c4 10             	add    esp,0x10
 1005bd5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005bd8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1005bdc:	75 e2                	jne    1005bc0 <get_fname+0x1b>
 1005bde:	83 ec 08             	sub    esp,0x8
 1005be1:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1005be4:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005be7:	e8 2b 0a 00 00       	call   1006617 <strcpy>
 1005bec:	83 c4 10             	add    esp,0x10
 1005bef:	90                   	nop
 1005bf0:	c9                   	leave  
 1005bf1:	c3                   	ret    

01005bf2 <read_file>:
 1005bf2:	55                   	push   ebp
 1005bf3:	89 e5                	mov    ebp,esp
 1005bf5:	83 ec 58             	sub    esp,0x58
 1005bf8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005bfb:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1005bfe:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1005c01:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005c04:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005c07:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005c0a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005c0d:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005c10:	66 89 45 ce          	mov    WORD PTR [ebp-0x32],ax
 1005c14:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005c17:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1005c1a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005c1d:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005c24:	0f b7 c8             	movzx  ecx,ax
 1005c27:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005c2a:	99                   	cdq    
 1005c2b:	f7 f9                	idiv   ecx
 1005c2d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1005c30:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005c37:	0f b7 c8             	movzx  ecx,ax
 1005c3a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005c3d:	99                   	cdq    
 1005c3e:	f7 f9                	idiv   ecx
 1005c40:	89 d0                	mov    eax,edx
 1005c42:	85 c0                	test   eax,eax
 1005c44:	0f 95 c0             	setne  al
 1005c47:	0f b6 c0             	movzx  eax,al
 1005c4a:	01 45 dc             	add    DWORD PTR [ebp-0x24],eax
 1005c4d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005c54:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 1005c58:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005c5c:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005c63:	0f b7 c8             	movzx  ecx,ax
 1005c66:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005c69:	99                   	cdq    
 1005c6a:	f7 f9                	idiv   ecx
 1005c6c:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005c6f:	eb 14                	jmp    1005c85 <read_file+0x93>
 1005c71:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005c75:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005c7c:	00 
 1005c7d:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005c81:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
 1005c85:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005c8a:	77 06                	ja     1005c92 <read_file+0xa0>
 1005c8c:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1005c90:	7f df                	jg     1005c71 <read_file+0x7f>
 1005c92:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1005c96:	7e 0a                	jle    1005ca2 <read_file+0xb0>
 1005c98:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005c9d:	e9 ca 00 00 00       	jmp    1005d6c <read_file+0x17a>
 1005ca2:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005ca9:	0f b7 c8             	movzx  ecx,ax
 1005cac:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005caf:	99                   	cdq    
 1005cb0:	f7 f9                	idiv   ecx
 1005cb2:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1005cb5:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1005cbc:	0f b6 d0             	movzx  edx,al
 1005cbf:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005cc6:	0f b7 c0             	movzx  eax,ax
 1005cc9:	0f af c2             	imul   eax,edx
 1005ccc:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1005ccf:	e9 86 00 00 00       	jmp    1005d5a <read_file+0x168>
 1005cd4:	0f b6 05 6d df 41 00 	movzx  eax,BYTE PTR ds:0x41df6d
 1005cdb:	0f b6 c0             	movzx  eax,al
 1005cde:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005ce2:	8b 15 f0 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf0
 1005ce8:	01 ca                	add    edx,ecx
 1005cea:	83 ec 04             	sub    esp,0x4
 1005ced:	50                   	push   eax
 1005cee:	52                   	push   edx
 1005cef:	68 e0 61 42 00       	push   0x4261e0
 1005cf4:	e8 d5 f2 ff ff       	call   1004fce <read_sec>
 1005cf9:	83 c4 10             	add    esp,0x10
 1005cfc:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005cff:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 1005d02:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1005d05:	39 c2                	cmp    edx,eax
 1005d07:	0f 4e c2             	cmovle eax,edx
 1005d0a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005d0d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005d10:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1005d13:	81 c2 e0 61 42 00    	add    edx,0x4261e0
 1005d19:	83 ec 04             	sub    esp,0x4
 1005d1c:	50                   	push   eax
 1005d1d:	52                   	push   edx
 1005d1e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005d21:	e8 29 08 00 00       	call   100654f <memcpy>
 1005d26:	83 c4 10             	add    esp,0x10
 1005d29:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1005d2d:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005d30:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 1005d33:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 1005d36:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005d3a:	7e 07                	jle    1005d43 <read_file+0x151>
 1005d3c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1005d43:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005d47:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005d4e:	00 
 1005d4f:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005d53:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005d58:	77 0e                	ja     1005d68 <read_file+0x176>
 1005d5a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005d5d:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005d60:	0f 8c 6e ff ff ff    	jl     1005cd4 <read_file+0xe2>
 1005d66:	eb 01                	jmp    1005d69 <read_file+0x177>
 1005d68:	90                   	nop
 1005d69:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005d6c:	c9                   	leave  
 1005d6d:	c3                   	ret    

01005d6e <write_file>:
 1005d6e:	55                   	push   ebp
 1005d6f:	89 e5                	mov    ebp,esp
 1005d71:	83 ec 48             	sub    esp,0x48
 1005d74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d77:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1005d7a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005d7d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d80:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005d83:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005d86:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d89:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005d8c:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 1005d90:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d93:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1005d96:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005d99:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005da0:	0f b7 c8             	movzx  ecx,ax
 1005da3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005da6:	99                   	cdq    
 1005da7:	f7 f9                	idiv   ecx
 1005da9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005dac:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005daf:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
 1005db5:	85 c0                	test   eax,eax
 1005db7:	0f 48 c2             	cmovs  eax,edx
 1005dba:	c1 f8 09             	sar    eax,0x9
 1005dbd:	89 c1                	mov    ecx,eax
 1005dbf:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005dc2:	99                   	cdq    
 1005dc3:	c1 ea 17             	shr    edx,0x17
 1005dc6:	01 d0                	add    eax,edx
 1005dc8:	25 ff 01 00 00       	and    eax,0x1ff
 1005dcd:	29 d0                	sub    eax,edx
 1005dcf:	01 c8                	add    eax,ecx
 1005dd1:	85 c0                	test   eax,eax
 1005dd3:	0f 95 c0             	setne  al
 1005dd6:	0f b6 c0             	movzx  eax,al
 1005dd9:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1005ddc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005de3:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 1005de7:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005deb:	eb 14                	jmp    1005e01 <write_file+0x93>
 1005ded:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1005df1:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005df5:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005dfc:	00 
 1005dfd:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005e01:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005e06:	77 06                	ja     1005e0e <write_file+0xa0>
 1005e08:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005e0c:	7f df                	jg     1005ded <write_file+0x7f>
 1005e0e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005e12:	7e 4b                	jle    1005e5f <write_file+0xf1>
 1005e14:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005e19:	eb 52                	jmp    1005e6d <write_file+0xff>
 1005e1b:	0f b7 55 ea          	movzx  edx,WORD PTR [ebp-0x16]
 1005e1f:	a1 f0 6c 00 01       	mov    eax,ds:0x1006cf0
 1005e24:	01 d0                	add    eax,edx
 1005e26:	83 ec 04             	sub    esp,0x4
 1005e29:	6a 01                	push   0x1
 1005e2b:	50                   	push   eax
 1005e2c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005e2f:	e8 3e eb ff ff       	call   1004972 <write_sec>
 1005e34:	83 c4 10             	add    esp,0x10
 1005e37:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1005e3b:	0f b7 05 6b df 41 00 	movzx  eax,WORD PTR ds:0x41df6b
 1005e42:	0f b7 c0             	movzx  eax,ax
 1005e45:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 1005e48:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005e4c:	0f b7 84 00 c0 21 42 	movzx  eax,WORD PTR [eax+eax*1+0x4221c0]
 1005e53:	00 
 1005e54:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005e58:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005e5d:	77 0a                	ja     1005e69 <write_file+0xfb>
 1005e5f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e62:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 1005e65:	7c b4                	jl     1005e1b <write_file+0xad>
 1005e67:	eb 01                	jmp    1005e6a <write_file+0xfc>
 1005e69:	90                   	nop
 1005e6a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e6d:	c9                   	leave  
 1005e6e:	c3                   	ret    

01005e6f <scrdown>:
 1005e6f:	55                   	push   ebp
 1005e70:	89 e5                	mov    ebp,esp
 1005e72:	83 ec 08             	sub    esp,0x8
 1005e75:	a1 e8 65 42 00       	mov    eax,ds:0x4265e8
 1005e7a:	05 a0 00 00 00       	add    eax,0xa0
 1005e7f:	a3 e8 65 42 00       	mov    ds:0x4265e8,eax
 1005e84:	a1 ec 65 42 00       	mov    eax,ds:0x4265ec
 1005e89:	05 a0 00 00 00       	add    eax,0xa0
 1005e8e:	a3 ec 65 42 00       	mov    ds:0x4265ec,eax
 1005e93:	8b 15 e8 65 42 00    	mov    edx,DWORD PTR ds:0x4265e8
 1005e99:	a1 e4 65 42 00       	mov    eax,ds:0x4265e4
 1005e9e:	39 c2                	cmp    edx,eax
 1005ea0:	72 0a                	jb     1005eac <scrdown+0x3d>
 1005ea2:	a1 e0 65 42 00       	mov    eax,ds:0x4265e0
 1005ea7:	a3 e8 65 42 00       	mov    ds:0x4265e8,eax
 1005eac:	e8 52 00 00 00       	call   1005f03 <set_origin>
 1005eb1:	90                   	nop
 1005eb2:	c9                   	leave  
 1005eb3:	c3                   	ret    

01005eb4 <scrup>:
 1005eb4:	55                   	push   ebp
 1005eb5:	89 e5                	mov    ebp,esp
 1005eb7:	83 ec 08             	sub    esp,0x8
 1005eba:	a1 ec 65 42 00       	mov    eax,ds:0x4265ec
 1005ebf:	85 c0                	test   eax,eax
 1005ec1:	75 1b                	jne    1005ede <scrup+0x2a>
 1005ec3:	c7 05 ec 65 42 00 00 	mov    DWORD PTR ds:0x4265ec,0x0
 1005eca:	00 00 00 
 1005ecd:	a1 e0 65 42 00       	mov    eax,ds:0x4265e0
 1005ed2:	a3 e8 65 42 00       	mov    ds:0x4265e8,eax
 1005ed7:	e8 27 00 00 00       	call   1005f03 <set_origin>
 1005edc:	eb 23                	jmp    1005f01 <scrup+0x4d>
 1005ede:	a1 e8 65 42 00       	mov    eax,ds:0x4265e8
 1005ee3:	2d a0 00 00 00       	sub    eax,0xa0
 1005ee8:	a3 e8 65 42 00       	mov    ds:0x4265e8,eax
 1005eed:	a1 ec 65 42 00       	mov    eax,ds:0x4265ec
 1005ef2:	2d a0 00 00 00       	sub    eax,0xa0
 1005ef7:	a3 ec 65 42 00       	mov    ds:0x4265ec,eax
 1005efc:	e8 02 00 00 00       	call   1005f03 <set_origin>
 1005f01:	c9                   	leave  
 1005f02:	c3                   	ret    

01005f03 <set_origin>:
 1005f03:	55                   	push   ebp
 1005f04:	89 e5                	mov    ebp,esp
 1005f06:	83 ec 08             	sub    esp,0x8
 1005f09:	fa                   	cli    
 1005f0a:	a1 fc 65 42 00       	mov    eax,ds:0x4265fc
 1005f0f:	0f b7 c0             	movzx  eax,ax
 1005f12:	83 ec 08             	sub    esp,0x8
 1005f15:	6a 0c                	push   0xc
 1005f17:	50                   	push   eax
 1005f18:	e8 a3 cf ff ff       	call   1002ec0 <outb>
 1005f1d:	83 c4 10             	add    esp,0x10
 1005f20:	a1 ec 65 42 00       	mov    eax,ds:0x4265ec
 1005f25:	c1 e8 09             	shr    eax,0x9
 1005f28:	0f b6 d0             	movzx  edx,al
 1005f2b:	a1 00 66 42 00       	mov    eax,ds:0x426600
 1005f30:	0f b7 c0             	movzx  eax,ax
 1005f33:	83 ec 08             	sub    esp,0x8
 1005f36:	52                   	push   edx
 1005f37:	50                   	push   eax
 1005f38:	e8 83 cf ff ff       	call   1002ec0 <outb>
 1005f3d:	83 c4 10             	add    esp,0x10
 1005f40:	a1 fc 65 42 00       	mov    eax,ds:0x4265fc
 1005f45:	0f b7 c0             	movzx  eax,ax
 1005f48:	83 ec 08             	sub    esp,0x8
 1005f4b:	6a 0d                	push   0xd
 1005f4d:	50                   	push   eax
 1005f4e:	e8 6d cf ff ff       	call   1002ec0 <outb>
 1005f53:	83 c4 10             	add    esp,0x10
 1005f56:	a1 ec 65 42 00       	mov    eax,ds:0x4265ec
 1005f5b:	d1 e8                	shr    eax,1
 1005f5d:	0f b6 d0             	movzx  edx,al
 1005f60:	a1 00 66 42 00       	mov    eax,ds:0x426600
 1005f65:	0f b7 c0             	movzx  eax,ax
 1005f68:	83 ec 08             	sub    esp,0x8
 1005f6b:	52                   	push   edx
 1005f6c:	50                   	push   eax
 1005f6d:	e8 4e cf ff ff       	call   1002ec0 <outb>
 1005f72:	83 c4 10             	add    esp,0x10
 1005f75:	fb                   	sti    
 1005f76:	90                   	nop
 1005f77:	c9                   	leave  
 1005f78:	c3                   	ret    

01005f79 <init_tty>:
 1005f79:	55                   	push   ebp
 1005f7a:	89 e5                	mov    ebp,esp
 1005f7c:	83 ec 18             	sub    esp,0x18
 1005f7f:	83 ec 08             	sub    esp,0x8
 1005f82:	68 d0 74 00 01       	push   0x10074d0
 1005f87:	68 68 74 00 01       	push   0x1007468
 1005f8c:	e8 86 06 00 00       	call   1006617 <strcpy>
 1005f91:	83 c4 10             	add    esp,0x10
 1005f94:	83 ec 08             	sub    esp,0x8
 1005f97:	68 d5 74 00 01       	push   0x10074d5
 1005f9c:	68 a8 74 00 01       	push   0x10074a8
 1005fa1:	e8 71 06 00 00       	call   1006617 <strcpy>
 1005fa6:	83 c4 10             	add    esp,0x10
 1005fa9:	83 ec 0c             	sub    esp,0xc
 1005fac:	68 00 74 00 01       	push   0x1007400
 1005fb1:	e8 94 bb ff ff       	call   1001b4a <reg_driver>
 1005fb6:	83 c4 10             	add    esp,0x10
 1005fb9:	83 ec 0c             	sub    esp,0xc
 1005fbc:	68 60 74 00 01       	push   0x1007460
 1005fc1:	e8 cf ba ff ff       	call   1001a95 <reg_device>
 1005fc6:	83 c4 10             	add    esp,0x10
 1005fc9:	83 ec 0c             	sub    esp,0xc
 1005fcc:	68 a0 74 00 01       	push   0x10074a0
 1005fd1:	e8 bf ba ff ff       	call   1001a95 <reg_device>
 1005fd6:	83 c4 10             	add    esp,0x10
 1005fd9:	c7 45 f4 00 00 02 00 	mov    DWORD PTR [ebp-0xc],0x20000
 1005fe0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005fe3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005fe6:	3c 07                	cmp    al,0x7
 1005fe8:	75 34                	jne    100601e <init_tty+0xa5>
 1005fea:	c7 05 f0 65 42 00 00 	mov    DWORD PTR ds:0x4265f0,0x0
 1005ff1:	00 00 00 
 1005ff4:	c7 05 e0 65 42 00 00 	mov    DWORD PTR ds:0x4265e0,0xb0000
 1005ffb:	00 0b 00 
 1005ffe:	c7 05 e4 65 42 00 ff 	mov    DWORD PTR ds:0x4265e4,0xb7fff
 1006005:	7f 0b 00 
 1006008:	c7 05 fc 65 42 00 b4 	mov    DWORD PTR ds:0x4265fc,0x3b4
 100600f:	03 00 00 
 1006012:	c7 05 00 66 42 00 b5 	mov    DWORD PTR ds:0x426600,0x3b5
 1006019:	03 00 00 
 100601c:	eb 5c                	jmp    100607a <init_tty+0x101>
 100601e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006021:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006024:	3c 03                	cmp    al,0x3
 1006026:	77 34                	ja     100605c <init_tty+0xe3>
 1006028:	c7 05 f0 65 42 00 01 	mov    DWORD PTR ds:0x4265f0,0x1
 100602f:	00 00 00 
 1006032:	c7 05 e0 65 42 00 00 	mov    DWORD PTR ds:0x4265e0,0xb8000
 1006039:	80 0b 00 
 100603c:	c7 05 e4 65 42 00 ff 	mov    DWORD PTR ds:0x4265e4,0xbffff
 1006043:	ff 0b 00 
 1006046:	c7 05 fc 65 42 00 d4 	mov    DWORD PTR ds:0x4265fc,0x3d4
 100604d:	03 00 00 
 1006050:	c7 05 00 66 42 00 d5 	mov    DWORD PTR ds:0x426600,0x3d5
 1006057:	03 00 00 
 100605a:	eb 1e                	jmp    100607a <init_tty+0x101>
 100605c:	c7 05 f0 65 42 00 02 	mov    DWORD PTR ds:0x4265f0,0x2
 1006063:	00 00 00 
 1006066:	c7 05 e0 65 42 00 00 	mov    DWORD PTR ds:0x4265e0,0xa0000
 100606d:	00 0a 00 
 1006070:	c7 05 e4 65 42 00 ff 	mov    DWORD PTR ds:0x4265e4,0xaffff
 1006077:	ff 0a 00 
 100607a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100607d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006080:	3c 01                	cmp    al,0x1
 1006082:	77 0f                	ja     1006093 <init_tty+0x11a>
 1006084:	c7 05 f8 65 42 00 28 	mov    DWORD PTR ds:0x4265f8,0x28
 100608b:	00 00 00 
 100608e:	e9 88 00 00 00       	jmp    100611b <init_tty+0x1a2>
 1006093:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006096:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006099:	3c 03                	cmp    al,0x3
 100609b:	76 0a                	jbe    10060a7 <init_tty+0x12e>
 100609d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060a0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060a3:	3c 07                	cmp    al,0x7
 10060a5:	75 0c                	jne    10060b3 <init_tty+0x13a>
 10060a7:	c7 05 f8 65 42 00 50 	mov    DWORD PTR ds:0x4265f8,0x50
 10060ae:	00 00 00 
 10060b1:	eb 68                	jmp    100611b <init_tty+0x1a2>
 10060b3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060b6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060b9:	3c 05                	cmp    al,0x5
 10060bb:	76 14                	jbe    10060d1 <init_tty+0x158>
 10060bd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060c0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060c3:	3c 09                	cmp    al,0x9
 10060c5:	74 0a                	je     10060d1 <init_tty+0x158>
 10060c7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060ca:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060cd:	3c 0d                	cmp    al,0xd
 10060cf:	75 0c                	jne    10060dd <init_tty+0x164>
 10060d1:	c7 05 f8 65 42 00 40 	mov    DWORD PTR ds:0x4265f8,0x140
 10060d8:	01 00 00 
 10060db:	eb 3e                	jmp    100611b <init_tty+0x1a2>
 10060dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060e0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060e3:	3c 06                	cmp    al,0x6
 10060e5:	74 14                	je     10060fb <init_tty+0x182>
 10060e7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060ea:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060ed:	3c 0a                	cmp    al,0xa
 10060ef:	74 0a                	je     10060fb <init_tty+0x182>
 10060f1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10060f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10060f7:	3c 0d                	cmp    al,0xd
 10060f9:	76 0c                	jbe    1006107 <init_tty+0x18e>
 10060fb:	c7 05 f8 65 42 00 80 	mov    DWORD PTR ds:0x4265f8,0x280
 1006102:	02 00 00 
 1006105:	eb 14                	jmp    100611b <init_tty+0x1a2>
 1006107:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100610a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100610d:	3c 08                	cmp    al,0x8
 100610f:	75 0a                	jne    100611b <init_tty+0x1a2>
 1006111:	c7 05 f8 65 42 00 a0 	mov    DWORD PTR ds:0x4265f8,0xa0
 1006118:	00 00 00 
 100611b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100611e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006121:	0f b6 c0             	movzx  eax,al
 1006124:	83 f8 14             	cmp    eax,0x14
 1006127:	77 5d                	ja     1006186 <init_tty+0x20d>
 1006129:	8b 04 85 dc 74 00 01 	mov    eax,DWORD PTR [eax*4+0x10074dc]
 1006130:	ff e0                	jmp    eax
 1006132:	c7 05 04 66 42 00 e8 	mov    DWORD PTR ds:0x426604,0x3e8
 1006139:	03 00 00 
 100613c:	eb 49                	jmp    1006187 <init_tty+0x20e>
 100613e:	c7 05 04 66 42 00 d0 	mov    DWORD PTR ds:0x426604,0x7d0
 1006145:	07 00 00 
 1006148:	eb 3d                	jmp    1006187 <init_tty+0x20e>
 100614a:	c7 05 04 66 42 00 00 	mov    DWORD PTR ds:0x426604,0xfa00
 1006151:	fa 00 00 
 1006154:	eb 31                	jmp    1006187 <init_tty+0x20e>
 1006156:	c7 05 04 66 42 00 00 	mov    DWORD PTR ds:0x426604,0x1f400
 100615d:	f4 01 00 
 1006160:	eb 25                	jmp    1006187 <init_tty+0x20e>
 1006162:	c7 05 04 66 42 00 00 	mov    DWORD PTR ds:0x426604,0x7d00
 1006169:	7d 00 00 
 100616c:	eb 19                	jmp    1006187 <init_tty+0x20e>
 100616e:	c7 05 04 66 42 00 00 	mov    DWORD PTR ds:0x426604,0x36b00
 1006175:	6b 03 00 
 1006178:	eb 0d                	jmp    1006187 <init_tty+0x20e>
 100617a:	c7 05 04 66 42 00 00 	mov    DWORD PTR ds:0x426604,0x4b000
 1006181:	b0 04 00 
 1006184:	eb 01                	jmp    1006187 <init_tty+0x20e>
 1006186:	90                   	nop
 1006187:	a1 e0 65 42 00       	mov    eax,ds:0x4265e0
 100618c:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 1006191:	c7 05 ec 65 42 00 00 	mov    DWORD PTR ds:0x4265ec,0x0
 1006198:	00 00 00 
 100619b:	a1 e0 65 42 00       	mov    eax,ds:0x4265e0
 10061a0:	a3 e8 65 42 00       	mov    ds:0x4265e8,eax
 10061a5:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10061a9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061ac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061af:	0f b6 c0             	movzx  eax,al
 10061b2:	a3 f4 65 42 00       	mov    ds:0x4265f4,eax
 10061b7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10061bb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061be:	8d 50 01             	lea    edx,[eax+0x1]
 10061c1:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10061c4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061c7:	0f b6 c0             	movzx  eax,al
 10061ca:	a3 10 66 42 00       	mov    ds:0x426610,eax
 10061cf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061d2:	8d 50 01             	lea    edx,[eax+0x1]
 10061d5:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10061d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061db:	0f b6 c0             	movzx  eax,al
 10061de:	a3 14 66 42 00       	mov    ds:0x426614,eax
 10061e3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061e6:	8d 50 01             	lea    edx,[eax+0x1]
 10061e9:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10061ec:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061ef:	0f b6 c0             	movzx  eax,al
 10061f2:	a3 0c 66 42 00       	mov    ds:0x42660c,eax
 10061f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061fa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061fd:	0f b6 c0             	movzx  eax,al
 1006200:	a3 08 66 42 00       	mov    ds:0x426608,eax
 1006205:	90                   	nop
 1006206:	c9                   	leave  
 1006207:	c3                   	ret    

01006208 <seek_tty>:
 1006208:	55                   	push   ebp
 1006209:	89 e5                	mov    ebp,esp
 100620b:	83 ec 10             	sub    esp,0x10
 100620e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006211:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1006214:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1006217:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100621a:	05 00 c0 05 00       	add    eax,0x5c000
 100621f:	01 c0                	add    eax,eax
 1006221:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 1006226:	90                   	nop
 1006227:	c9                   	leave  
 1006228:	c3                   	ret    

01006229 <tell_monitor>:
 1006229:	55                   	push   ebp
 100622a:	89 e5                	mov    ebp,esp
 100622c:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006231:	8b 15 e0 65 42 00    	mov    edx,DWORD PTR ds:0x4265e0
 1006237:	29 d0                	sub    eax,edx
 1006239:	89 c2                	mov    edx,eax
 100623b:	c1 ea 1f             	shr    edx,0x1f
 100623e:	01 d0                	add    eax,edx
 1006240:	d1 f8                	sar    eax,1
 1006242:	5d                   	pop    ebp
 1006243:	c3                   	ret    

01006244 <del_ch>:
 1006244:	55                   	push   ebp
 1006245:	89 e5                	mov    ebp,esp
 1006247:	57                   	push   edi
 1006248:	81 ec 94 00 00 00    	sub    esp,0x94
 100624e:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006253:	83 e8 02             	sub    eax,0x2
 1006256:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006259:	e8 cb ff ff ff       	call   1006229 <tell_monitor>
 100625e:	89 c1                	mov    ecx,eax
 1006260:	ba 67 66 66 66       	mov    edx,0x66666667
 1006265:	89 c8                	mov    eax,ecx
 1006267:	f7 ea                	imul   edx
 1006269:	89 d0                	mov    eax,edx
 100626b:	c1 f8 05             	sar    eax,0x5
 100626e:	89 ca                	mov    edx,ecx
 1006270:	c1 fa 1f             	sar    edx,0x1f
 1006273:	29 d0                	sub    eax,edx
 1006275:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006278:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 100627b:	89 d0                	mov    eax,edx
 100627d:	c1 e0 02             	shl    eax,0x2
 1006280:	01 d0                	add    eax,edx
 1006282:	c1 e0 04             	shl    eax,0x4
 1006285:	29 c1                	sub    ecx,eax
 1006287:	89 ca                	mov    edx,ecx
 1006289:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 100628c:	eb 14                	jmp    10062a2 <del_ch+0x5e>
 100628e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006291:	0f b6 50 02          	movzx  edx,BYTE PTR [eax+0x2]
 1006295:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006298:	88 10                	mov    BYTE PTR [eax],dl
 100629a:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 100629e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10062a2:	83 7d f0 4e          	cmp    DWORD PTR [ebp-0x10],0x4e
 10062a6:	7e e6                	jle    100628e <del_ch+0x4a>
 10062a8:	8d 95 74 ff ff ff    	lea    edx,[ebp-0x8c]
 10062ae:	b8 00 00 00 00       	mov    eax,0x0
 10062b3:	b9 1f 00 00 00       	mov    ecx,0x1f
 10062b8:	89 d7                	mov    edi,edx
 10062ba:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10062bc:	e8 68 ff ff ff       	call   1006229 <tell_monitor>
 10062c1:	83 e8 01             	sub    eax,0x1
 10062c4:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10062c7:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
 10062cd:	50                   	push   eax
 10062ce:	e8 35 ff ff ff       	call   1006208 <seek_tty>
 10062d3:	83 c4 04             	add    esp,0x4
 10062d6:	e8 06 00 00 00       	call   10062e1 <set_cur>
 10062db:	90                   	nop
 10062dc:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 10062df:	c9                   	leave  
 10062e0:	c3                   	ret    

010062e1 <set_cur>:
 10062e1:	55                   	push   ebp
 10062e2:	89 e5                	mov    ebp,esp
 10062e4:	83 ec 08             	sub    esp,0x8
 10062e7:	fa                   	cli    
 10062e8:	a1 fc 65 42 00       	mov    eax,ds:0x4265fc
 10062ed:	0f b7 c0             	movzx  eax,ax
 10062f0:	83 ec 08             	sub    esp,0x8
 10062f3:	6a 0e                	push   0xe
 10062f5:	50                   	push   eax
 10062f6:	e8 c5 cb ff ff       	call   1002ec0 <outb>
 10062fb:	83 c4 10             	add    esp,0x10
 10062fe:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006303:	8b 15 e0 65 42 00    	mov    edx,DWORD PTR ds:0x4265e0
 1006309:	29 d0                	sub    eax,edx
 100630b:	c1 f8 09             	sar    eax,0x9
 100630e:	0f b6 d0             	movzx  edx,al
 1006311:	a1 00 66 42 00       	mov    eax,ds:0x426600
 1006316:	0f b7 c0             	movzx  eax,ax
 1006319:	83 ec 08             	sub    esp,0x8
 100631c:	52                   	push   edx
 100631d:	50                   	push   eax
 100631e:	e8 9d cb ff ff       	call   1002ec0 <outb>
 1006323:	83 c4 10             	add    esp,0x10
 1006326:	a1 fc 65 42 00       	mov    eax,ds:0x4265fc
 100632b:	0f b7 c0             	movzx  eax,ax
 100632e:	83 ec 08             	sub    esp,0x8
 1006331:	6a 0f                	push   0xf
 1006333:	50                   	push   eax
 1006334:	e8 87 cb ff ff       	call   1002ec0 <outb>
 1006339:	83 c4 10             	add    esp,0x10
 100633c:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006341:	8b 15 e0 65 42 00    	mov    edx,DWORD PTR ds:0x4265e0
 1006347:	29 d0                	sub    eax,edx
 1006349:	d1 f8                	sar    eax,1
 100634b:	0f b6 d0             	movzx  edx,al
 100634e:	a1 00 66 42 00       	mov    eax,ds:0x426600
 1006353:	0f b7 c0             	movzx  eax,ax
 1006356:	83 ec 08             	sub    esp,0x8
 1006359:	52                   	push   edx
 100635a:	50                   	push   eax
 100635b:	e8 60 cb ff ff       	call   1002ec0 <outb>
 1006360:	83 c4 10             	add    esp,0x10
 1006363:	fb                   	sti    
 1006364:	90                   	nop
 1006365:	c9                   	leave  
 1006366:	c3                   	ret    

01006367 <read_tty>:
 1006367:	55                   	push   ebp
 1006368:	89 e5                	mov    ebp,esp
 100636a:	83 ec 18             	sub    esp,0x18
 100636d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006370:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1006373:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006376:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006379:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 100637c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 100637f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1006386:	eb 3e                	jmp    10063c6 <read_tty+0x5f>
 1006388:	8b 15 f4 6c 00 01    	mov    edx,DWORD PTR ds:0x1006cf4
 100638e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006391:	8d 48 01             	lea    ecx,[eax+0x1]
 1006394:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 1006397:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 100639a:	88 10                	mov    BYTE PTR [eax],dl
 100639c:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 10063a1:	3d ff ff 0b 00       	cmp    eax,0xbffff
 10063a6:	75 0d                	jne    10063b5 <read_tty+0x4e>
 10063a8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 10063ac:	7e 07                	jle    10063b5 <read_tty+0x4e>
 10063ae:	b8 01 00 00 00       	mov    eax,0x1
 10063b3:	eb 23                	jmp    10063d8 <read_tty+0x71>
 10063b5:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 10063ba:	83 c0 02             	add    eax,0x2
 10063bd:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 10063c2:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10063c6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10063c9:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10063cc:	7c ba                	jl     1006388 <read_tty+0x21>
 10063ce:	e8 0e ff ff ff       	call   10062e1 <set_cur>
 10063d3:	b8 00 00 00 00       	mov    eax,0x0
 10063d8:	c9                   	leave  
 10063d9:	c3                   	ret    

010063da <write_tty>:
 10063da:	55                   	push   ebp
 10063db:	89 e5                	mov    ebp,esp
 10063dd:	83 ec 18             	sub    esp,0x18
 10063e0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10063e3:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10063e6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10063e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10063ec:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 10063ef:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10063f2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10063f9:	e9 df 00 00 00       	jmp    10064dd <write_tty+0x103>
 10063fe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006401:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006404:	3c 0a                	cmp    al,0xa
 1006406:	75 42                	jne    100644a <write_tty+0x70>
 1006408:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 100640d:	2d 00 80 0b 00       	sub    eax,0xb8000
 1006412:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006415:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006418:	ba cd cc cc cc       	mov    edx,0xcccccccd
 100641d:	f7 e2                	mul    edx
 100641f:	89 d0                	mov    eax,edx
 1006421:	c1 e8 07             	shr    eax,0x7
 1006424:	8d 50 01             	lea    edx,[eax+0x1]
 1006427:	89 d0                	mov    eax,edx
 1006429:	c1 e0 02             	shl    eax,0x2
 100642c:	01 d0                	add    eax,edx
 100642e:	c1 e0 05             	shl    eax,0x5
 1006431:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006434:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006437:	05 00 80 0b 00       	add    eax,0xb8000
 100643c:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 1006441:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006445:	e9 8f 00 00 00       	jmp    10064d9 <write_tty+0xff>
 100644a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100644d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006450:	84 c0                	test   al,al
 1006452:	0f 84 93 00 00 00    	je     10064eb <write_tty+0x111>
 1006458:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100645b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100645e:	3c 08                	cmp    al,0x8
 1006460:	75 17                	jne    1006479 <write_tty+0x9f>
 1006462:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006467:	83 e8 02             	sub    eax,0x2
 100646a:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 100646f:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006474:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006477:	eb 33                	jmp    10064ac <write_tty+0xd2>
 1006479:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 100647c:	8d 42 01             	lea    eax,[edx+0x1]
 100647f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006482:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 1006487:	8d 48 01             	lea    ecx,[eax+0x1]
 100648a:	89 0d f4 6c 00 01    	mov    DWORD PTR ds:0x1006cf4,ecx
 1006490:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 1006493:	88 10                	mov    BYTE PTR [eax],dl
 1006495:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 100649a:	8d 50 01             	lea    edx,[eax+0x1]
 100649d:	89 15 f4 6c 00 01    	mov    DWORD PTR ds:0x1006cf4,edx
 10064a3:	0f b6 15 f8 6c 00 01 	movzx  edx,BYTE PTR ds:0x1006cf8
 10064aa:	88 10                	mov    BYTE PTR [eax],dl
 10064ac:	a1 f4 6c 00 01       	mov    eax,ds:0x1006cf4
 10064b1:	8b 0d e8 65 42 00    	mov    ecx,DWORD PTR ds:0x4265e8
 10064b7:	29 c8                	sub    eax,ecx
 10064b9:	89 c2                	mov    edx,eax
 10064bb:	a1 04 66 42 00       	mov    eax,ds:0x426604
 10064c0:	8b 0d f8 65 42 00    	mov    ecx,DWORD PTR ds:0x4265f8
 10064c6:	29 c8                	sub    eax,ecx
 10064c8:	01 c0                	add    eax,eax
 10064ca:	39 c2                	cmp    edx,eax
 10064cc:	7c 0b                	jl     10064d9 <write_tty+0xff>
 10064ce:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 10064d2:	7e 05                	jle    10064d9 <write_tty+0xff>
 10064d4:	e8 96 f9 ff ff       	call   1005e6f <scrdown>
 10064d9:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10064dd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10064e0:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10064e3:	0f 8c 15 ff ff ff    	jl     10063fe <write_tty+0x24>
 10064e9:	eb 01                	jmp    10064ec <write_tty+0x112>
 10064eb:	90                   	nop
 10064ec:	e8 f0 fd ff ff       	call   10062e1 <set_cur>
 10064f1:	b8 00 00 00 00       	mov    eax,0x0
 10064f6:	c9                   	leave  
 10064f7:	c3                   	ret    

010064f8 <cls>:
 10064f8:	55                   	push   ebp
 10064f9:	89 e5                	mov    ebp,esp
 10064fb:	83 ec 18             	sub    esp,0x18
 10064fe:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1006505:	eb 12                	jmp    1006519 <cls+0x21>
 1006507:	8b 15 e8 65 42 00    	mov    edx,DWORD PTR ds:0x4265e8
 100650d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006510:	01 d0                	add    eax,edx
 1006512:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006515:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 1006519:	a1 04 66 42 00       	mov    eax,ds:0x426604
 100651e:	01 c0                	add    eax,eax
 1006520:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 1006523:	7c e2                	jl     1006507 <cls+0xf>
 1006525:	a1 e8 65 42 00       	mov    eax,ds:0x4265e8
 100652a:	a3 f4 6c 00 01       	mov    ds:0x1006cf4,eax
 100652f:	e8 ad fd ff ff       	call   10062e1 <set_cur>
 1006534:	90                   	nop
 1006535:	c9                   	leave  
 1006536:	c3                   	ret    

01006537 <set_color>:
 1006537:	55                   	push   ebp
 1006538:	89 e5                	mov    ebp,esp
 100653a:	83 ec 04             	sub    esp,0x4
 100653d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006540:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1006543:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 1006547:	a2 f8 6c 00 01       	mov    ds:0x1006cf8,al
 100654c:	90                   	nop
 100654d:	c9                   	leave  
 100654e:	c3                   	ret    

0100654f <memcpy>:
 100654f:	55                   	push   ebp
 1006550:	89 e5                	mov    ebp,esp
 1006552:	83 ec 10             	sub    esp,0x10
 1006555:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006558:	c6 00 ff             	mov    BYTE PTR [eax],0xff
 100655b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006562:	eb 17                	jmp    100657b <memcpy+0x2c>
 1006564:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006567:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 100656a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100656d:	88 10                	mov    BYTE PTR [eax],dl
 100656f:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006573:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 1006577:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100657b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100657e:	39 45 10             	cmp    DWORD PTR [ebp+0x10],eax
 1006581:	77 e1                	ja     1006564 <memcpy+0x15>
 1006583:	90                   	nop
 1006584:	90                   	nop
 1006585:	c9                   	leave  
 1006586:	c3                   	ret    

01006587 <memcmp>:
 1006587:	55                   	push   ebp
 1006588:	89 e5                	mov    ebp,esp
 100658a:	83 ec 10             	sub    esp,0x10
 100658d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006594:	eb 34                	jmp    10065ca <memcmp+0x43>
 1006596:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006599:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 100659c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100659f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065a2:	38 c2                	cmp    dl,al
 10065a4:	74 18                	je     10065be <memcmp+0x37>
 10065a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10065a9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065ac:	0f b6 d0             	movzx  edx,al
 10065af:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10065b2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10065b5:	0f b6 c8             	movzx  ecx,al
 10065b8:	89 d0                	mov    eax,edx
 10065ba:	29 c8                	sub    eax,ecx
 10065bc:	eb 19                	jmp    10065d7 <memcmp+0x50>
 10065be:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10065c2:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10065c6:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10065ca:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10065cd:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 10065d0:	7c c4                	jl     1006596 <memcmp+0xf>
 10065d2:	b8 00 00 00 00       	mov    eax,0x0
 10065d7:	c9                   	leave  
 10065d8:	c3                   	ret    

010065d9 <memset>:
 10065d9:	55                   	push   ebp
 10065da:	89 e5                	mov    ebp,esp
 10065dc:	83 ec 14             	sub    esp,0x14
 10065df:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10065e2:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 10065e5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10065ec:	eb 13                	jmp    1006601 <memset+0x28>
 10065ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10065f1:	8d 50 01             	lea    edx,[eax+0x1]
 10065f4:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 10065f7:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 10065fb:	88 10                	mov    BYTE PTR [eax],dl
 10065fd:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006601:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006604:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1006607:	72 e5                	jb     10065ee <memset+0x15>
 1006609:	90                   	nop
 100660a:	90                   	nop
 100660b:	c9                   	leave  
 100660c:	c3                   	ret    

0100660d <get_mem_size>:
 100660d:	55                   	push   ebp
 100660e:	89 e5                	mov    ebp,esp
 1006610:	a1 18 66 42 00       	mov    eax,ds:0x426618
 1006615:	5d                   	pop    ebp
 1006616:	c3                   	ret    

01006617 <strcpy>:
 1006617:	55                   	push   ebp
 1006618:	89 e5                	mov    ebp,esp
 100661a:	eb 17                	jmp    1006633 <strcpy+0x1c>
 100661c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 100661f:	8d 42 01             	lea    eax,[edx+0x1]
 1006622:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006625:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006628:	8d 48 01             	lea    ecx,[eax+0x1]
 100662b:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
 100662e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 1006631:	88 10                	mov    BYTE PTR [eax],dl
 1006633:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006636:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006639:	84 c0                	test   al,al
 100663b:	75 df                	jne    100661c <strcpy+0x5>
 100663d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006640:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006643:	90                   	nop
 1006644:	5d                   	pop    ebp
 1006645:	c3                   	ret    

01006646 <strtok>:
 1006646:	55                   	push   ebp
 1006647:	89 e5                	mov    ebp,esp
 1006649:	83 ec 14             	sub    esp,0x14
 100664c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100664f:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1006652:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1006656:	0f 84 8c 00 00 00    	je     10066e8 <strtok+0xa2>
 100665c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100665f:	68 20 66 42 00       	push   0x426620
 1006664:	e8 ae ff ff ff       	call   1006617 <strcpy>
 1006669:	83 c4 08             	add    esp,0x8
 100666c:	c7 45 f4 20 66 42 00 	mov    DWORD PTR [ebp-0xc],0x426620
 1006673:	c7 05 20 68 42 00 00 	mov    DWORD PTR ds:0x426820,0x0
 100667a:	00 00 00 
 100667d:	eb 1a                	jmp    1006699 <strtok+0x53>
 100667f:	a1 20 68 42 00       	mov    eax,ds:0x426820
 1006684:	83 c0 01             	add    eax,0x1
 1006687:	99                   	cdq    
 1006688:	c1 ea 17             	shr    edx,0x17
 100668b:	01 d0                	add    eax,edx
 100668d:	25 ff 01 00 00       	and    eax,0x1ff
 1006692:	29 d0                	sub    eax,edx
 1006694:	a3 20 68 42 00       	mov    ds:0x426820,eax
 1006699:	a1 20 68 42 00       	mov    eax,ds:0x426820
 100669e:	0f b6 80 20 66 42 00 	movzx  eax,BYTE PTR [eax+0x426620]
 10066a5:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 10066a8:	74 10                	je     10066ba <strtok+0x74>
 10066aa:	a1 20 68 42 00       	mov    eax,ds:0x426820
 10066af:	0f b6 80 20 66 42 00 	movzx  eax,BYTE PTR [eax+0x426620]
 10066b6:	84 c0                	test   al,al
 10066b8:	75 c5                	jne    100667f <strtok+0x39>
 10066ba:	a1 20 68 42 00       	mov    eax,ds:0x426820
 10066bf:	c6 80 20 66 42 00 00 	mov    BYTE PTR [eax+0x426620],0x0
 10066c6:	a1 20 68 42 00       	mov    eax,ds:0x426820
 10066cb:	83 c0 01             	add    eax,0x1
 10066ce:	99                   	cdq    
 10066cf:	c1 ea 17             	shr    edx,0x17
 10066d2:	01 d0                	add    eax,edx
 10066d4:	25 ff 01 00 00       	and    eax,0x1ff
 10066d9:	29 d0                	sub    eax,edx
 10066db:	a3 20 68 42 00       	mov    ds:0x426820,eax
 10066e0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10066e3:	e9 8b 00 00 00       	jmp    1006773 <strtok+0x12d>
 10066e8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10066ef:	a1 20 68 42 00       	mov    eax,ds:0x426820
 10066f4:	05 20 66 42 00       	add    eax,0x426620
 10066f9:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10066fc:	eb 1e                	jmp    100671c <strtok+0xd6>
 10066fe:	a1 20 68 42 00       	mov    eax,ds:0x426820
 1006703:	83 c0 01             	add    eax,0x1
 1006706:	99                   	cdq    
 1006707:	c1 ea 17             	shr    edx,0x17
 100670a:	01 d0                	add    eax,edx
 100670c:	25 ff 01 00 00       	and    eax,0x1ff
 1006711:	29 d0                	sub    eax,edx
 1006713:	a3 20 68 42 00       	mov    ds:0x426820,eax
 1006718:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100671c:	a1 20 68 42 00       	mov    eax,ds:0x426820
 1006721:	0f b6 80 20 66 42 00 	movzx  eax,BYTE PTR [eax+0x426620]
 1006728:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 100672b:	74 10                	je     100673d <strtok+0xf7>
 100672d:	a1 20 68 42 00       	mov    eax,ds:0x426820
 1006732:	0f b6 80 20 66 42 00 	movzx  eax,BYTE PTR [eax+0x426620]
 1006739:	84 c0                	test   al,al
 100673b:	75 c1                	jne    10066fe <strtok+0xb8>
 100673d:	a1 20 68 42 00       	mov    eax,ds:0x426820
 1006742:	c6 80 20 66 42 00 00 	mov    BYTE PTR [eax+0x426620],0x0
 1006749:	a1 20 68 42 00       	mov    eax,ds:0x426820
 100674e:	83 c0 01             	add    eax,0x1
 1006751:	99                   	cdq    
 1006752:	c1 ea 17             	shr    edx,0x17
 1006755:	01 d0                	add    eax,edx
 1006757:	25 ff 01 00 00       	and    eax,0x1ff
 100675c:	29 d0                	sub    eax,edx
 100675e:	a3 20 68 42 00       	mov    ds:0x426820,eax
 1006763:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006767:	74 05                	je     100676e <strtok+0x128>
 1006769:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100676c:	eb 05                	jmp    1006773 <strtok+0x12d>
 100676e:	b8 00 00 00 00       	mov    eax,0x0
 1006773:	c9                   	leave  
 1006774:	c3                   	ret    

01006775 <strcmp>:
 1006775:	55                   	push   ebp
 1006776:	89 e5                	mov    ebp,esp
 1006778:	eb 36                	jmp    10067b0 <strcmp+0x3b>
 100677a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100677d:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006780:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006783:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006786:	38 c2                	cmp    dl,al
 1006788:	7e 07                	jle    1006791 <strcmp+0x1c>
 100678a:	b8 01 00 00 00       	mov    eax,0x1
 100678f:	eb 4a                	jmp    10067db <strcmp+0x66>
 1006791:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006794:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1006797:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100679a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100679d:	38 c2                	cmp    dl,al
 100679f:	7d 07                	jge    10067a8 <strcmp+0x33>
 10067a1:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10067a6:	eb 33                	jmp    10067db <strcmp+0x66>
 10067a8:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10067ac:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10067b0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10067b3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10067b6:	84 c0                	test   al,al
 10067b8:	74 0a                	je     10067c4 <strcmp+0x4f>
 10067ba:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10067bd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10067c0:	84 c0                	test   al,al
 10067c2:	75 b6                	jne    100677a <strcmp+0x5>
 10067c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10067c7:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10067ca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10067cd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10067d0:	38 c2                	cmp    dl,al
 10067d2:	75 07                	jne    10067db <strcmp+0x66>
 10067d4:	b8 00 00 00 00       	mov    eax,0x0
 10067d9:	eb 00                	jmp    10067db <strcmp+0x66>
 10067db:	5d                   	pop    ebp
 10067dc:	c3                   	ret    

010067dd <strlen>:
 10067dd:	55                   	push   ebp
 10067de:	89 e5                	mov    ebp,esp
 10067e0:	83 ec 10             	sub    esp,0x10
 10067e3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10067ea:	eb 08                	jmp    10067f4 <strlen+0x17>
 10067ec:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10067f0:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10067f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10067f7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10067fa:	84 c0                	test   al,al
 10067fc:	75 ee                	jne    10067ec <strlen+0xf>
 10067fe:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006801:	c9                   	leave  
 1006802:	c3                   	ret    

01006803 <sprintf>:
 1006803:	55                   	push   ebp
 1006804:	89 e5                	mov    ebp,esp
 1006806:	83 ec 28             	sub    esp,0x28
 1006809:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100680c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100680f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006812:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006815:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 100681c:	eb 22                	jmp    1006840 <sprintf+0x3d>
 100681e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006821:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006824:	3c 25                	cmp    al,0x25
 1006826:	75 0e                	jne    1006836 <sprintf+0x33>
 1006828:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100682b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100682e:	3c 25                	cmp    al,0x25
 1006830:	74 04                	je     1006836 <sprintf+0x33>
 1006832:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1006836:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006839:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100683c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006840:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006843:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006846:	3c 0a                	cmp    al,0xa
 1006848:	75 d4                	jne    100681e <sprintf+0x1b>
 100684a:	8d 45 10             	lea    eax,[ebp+0x10]
 100684d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1006850:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006853:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006856:	e9 eb 00 00 00       	jmp    1006946 <sprintf+0x143>
 100685b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100685e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006861:	3c 25                	cmp    al,0x25
 1006863:	0f 85 c1 00 00 00    	jne    100692a <sprintf+0x127>
 1006869:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100686c:	83 c0 01             	add    eax,0x1
 100686f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006872:	84 c0                	test   al,al
 1006874:	0f 84 b0 00 00 00    	je     100692a <sprintf+0x127>
 100687a:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100687e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006881:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006884:	3c 78                	cmp    al,0x78
 1006886:	75 25                	jne    10068ad <sprintf+0xaa>
 1006888:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100688b:	8d 50 04             	lea    edx,[eax+0x4]
 100688e:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1006891:	8b 00                	mov    eax,DWORD PTR [eax]
 1006893:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1006896:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1006899:	83 ec 08             	sub    esp,0x8
 100689c:	50                   	push   eax
 100689d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10068a0:	e8 87 01 00 00       	call   1006a2c <sprint_hex>
 10068a5:	83 c4 10             	add    esp,0x10
 10068a8:	e9 95 00 00 00       	jmp    1006942 <sprintf+0x13f>
 10068ad:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10068b0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068b3:	3c 73                	cmp    al,0x73
 10068b5:	75 21                	jne    10068d8 <sprintf+0xd5>
 10068b7:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10068ba:	8d 50 04             	lea    edx,[eax+0x4]
 10068bd:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 10068c0:	8b 00                	mov    eax,DWORD PTR [eax]
 10068c2:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10068c5:	83 ec 08             	sub    esp,0x8
 10068c8:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 10068cb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10068ce:	e8 cb 01 00 00       	call   1006a9e <sprintn>
 10068d3:	83 c4 10             	add    esp,0x10
 10068d6:	eb 6a                	jmp    1006942 <sprintf+0x13f>
 10068d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10068db:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068de:	3c 64                	cmp    al,0x64
 10068e0:	75 22                	jne    1006904 <sprintf+0x101>
 10068e2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10068e5:	8d 50 04             	lea    edx,[eax+0x4]
 10068e8:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 10068eb:	8b 00                	mov    eax,DWORD PTR [eax]
 10068ed:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 10068f0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 10068f3:	83 ec 08             	sub    esp,0x8
 10068f6:	50                   	push   eax
 10068f7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10068fa:	e8 8d 00 00 00       	call   100698c <sprint_decimal>
 10068ff:	83 c4 10             	add    esp,0x10
 1006902:	eb 3e                	jmp    1006942 <sprintf+0x13f>
 1006904:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006907:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100690a:	3c 63                	cmp    al,0x63
 100690c:	75 02                	jne    1006910 <sprintf+0x10d>
 100690e:	0f 0b                	ud2    
 1006910:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006913:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006916:	0f be c0             	movsx  eax,al
 1006919:	83 ec 08             	sub    esp,0x8
 100691c:	50                   	push   eax
 100691d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006920:	e8 33 00 00 00       	call   1006958 <sprintchar>
 1006925:	83 c4 10             	add    esp,0x10
 1006928:	eb 18                	jmp    1006942 <sprintf+0x13f>
 100692a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100692d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006930:	0f be c0             	movsx  eax,al
 1006933:	83 ec 08             	sub    esp,0x8
 1006936:	50                   	push   eax
 1006937:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100693a:	e8 19 00 00 00       	call   1006958 <sprintchar>
 100693f:	83 c4 10             	add    esp,0x10
 1006942:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006946:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006949:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100694c:	84 c0                	test   al,al
 100694e:	0f 85 07 ff ff ff    	jne    100685b <sprintf+0x58>
 1006954:	90                   	nop
 1006955:	90                   	nop
 1006956:	c9                   	leave  
 1006957:	c3                   	ret    

01006958 <sprintchar>:
 1006958:	55                   	push   ebp
 1006959:	89 e5                	mov    ebp,esp
 100695b:	83 ec 04             	sub    esp,0x4
 100695e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006961:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1006964:	eb 04                	jmp    100696a <sprintchar+0x12>
 1006966:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 100696a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100696d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006970:	84 c0                	test   al,al
 1006972:	75 f2                	jne    1006966 <sprintchar+0xe>
 1006974:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006977:	8d 50 01             	lea    edx,[eax+0x1]
 100697a:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 100697d:	0f b6 55 fc          	movzx  edx,BYTE PTR [ebp-0x4]
 1006981:	88 10                	mov    BYTE PTR [eax],dl
 1006983:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006986:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006989:	90                   	nop
 100698a:	c9                   	leave  
 100698b:	c3                   	ret    

0100698c <sprint_decimal>:
 100698c:	55                   	push   ebp
 100698d:	89 e5                	mov    ebp,esp
 100698f:	53                   	push   ebx
 1006990:	83 ec 20             	sub    esp,0x20
 1006993:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 100699a:	eb 5b                	jmp    10069f7 <sprint_decimal+0x6b>
 100699c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 100699f:	ba 67 66 66 66       	mov    edx,0x66666667
 10069a4:	89 c8                	mov    eax,ecx
 10069a6:	f7 ea                	imul   edx
 10069a8:	89 d0                	mov    eax,edx
 10069aa:	c1 f8 02             	sar    eax,0x2
 10069ad:	89 cb                	mov    ebx,ecx
 10069af:	c1 fb 1f             	sar    ebx,0x1f
 10069b2:	29 d8                	sub    eax,ebx
 10069b4:	89 c2                	mov    edx,eax
 10069b6:	89 d0                	mov    eax,edx
 10069b8:	c1 e0 02             	shl    eax,0x2
 10069bb:	01 d0                	add    eax,edx
 10069bd:	01 c0                	add    eax,eax
 10069bf:	29 c1                	sub    ecx,eax
 10069c1:	89 ca                	mov    edx,ecx
 10069c3:	89 d0                	mov    eax,edx
 10069c5:	83 c0 30             	add    eax,0x30
 10069c8:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 10069cb:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10069ce:	8d 50 01             	lea    edx,[eax+0x1]
 10069d1:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 10069d4:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
 10069d8:	88 54 05 e1          	mov    BYTE PTR [ebp+eax*1-0x1f],dl
 10069dc:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 10069df:	ba 67 66 66 66       	mov    edx,0x66666667
 10069e4:	89 c8                	mov    eax,ecx
 10069e6:	f7 ea                	imul   edx
 10069e8:	89 d0                	mov    eax,edx
 10069ea:	c1 f8 02             	sar    eax,0x2
 10069ed:	c1 f9 1f             	sar    ecx,0x1f
 10069f0:	89 ca                	mov    edx,ecx
 10069f2:	29 d0                	sub    eax,edx
 10069f4:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 10069f7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10069fa:	83 f8 07             	cmp    eax,0x7
 10069fd:	76 9d                	jbe    100699c <sprint_decimal+0x10>
 10069ff:	eb 1e                	jmp    1006a1f <sprint_decimal+0x93>
 1006a01:	83 6d f8 01          	sub    DWORD PTR [ebp-0x8],0x1
 1006a05:	8d 55 e1             	lea    edx,[ebp-0x1f]
 1006a08:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006a0b:	01 d0                	add    eax,edx
 1006a0d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a10:	0f be c0             	movsx  eax,al
 1006a13:	50                   	push   eax
 1006a14:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a17:	e8 3c ff ff ff       	call   1006958 <sprintchar>
 1006a1c:	83 c4 08             	add    esp,0x8
 1006a1f:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1006a23:	7f dc                	jg     1006a01 <sprint_decimal+0x75>
 1006a25:	90                   	nop
 1006a26:	90                   	nop
 1006a27:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1006a2a:	c9                   	leave  
 1006a2b:	c3                   	ret    

01006a2c <sprint_hex>:
 1006a2c:	55                   	push   ebp
 1006a2d:	89 e5                	mov    ebp,esp
 1006a2f:	83 ec 10             	sub    esp,0x10
 1006a32:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006a39:	eb 33                	jmp    1006a6e <sprint_hex+0x42>
 1006a3b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006a3e:	83 e0 0f             	and    eax,0xf
 1006a41:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
 1006a44:	80 7d fb 09          	cmp    BYTE PTR [ebp-0x5],0x9
 1006a48:	76 06                	jbe    1006a50 <sprint_hex+0x24>
 1006a4a:	80 45 fb 57          	add    BYTE PTR [ebp-0x5],0x57
 1006a4e:	eb 04                	jmp    1006a54 <sprint_hex+0x28>
 1006a50:	80 45 fb 30          	add    BYTE PTR [ebp-0x5],0x30
 1006a54:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006a57:	8d 50 01             	lea    edx,[eax+0x1]
 1006a5a:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1006a5d:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
 1006a61:	88 54 05 f1          	mov    BYTE PTR [ebp+eax*1-0xf],dl
 1006a65:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006a68:	c1 e8 04             	shr    eax,0x4
 1006a6b:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006a6e:	83 7d fc 09          	cmp    DWORD PTR [ebp-0x4],0x9
 1006a72:	7e c7                	jle    1006a3b <sprint_hex+0xf>
 1006a74:	eb 1e                	jmp    1006a94 <sprint_hex+0x68>
 1006a76:	83 6d fc 01          	sub    DWORD PTR [ebp-0x4],0x1
 1006a7a:	8d 55 f1             	lea    edx,[ebp-0xf]
 1006a7d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006a80:	01 d0                	add    eax,edx
 1006a82:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a85:	0f be c0             	movsx  eax,al
 1006a88:	50                   	push   eax
 1006a89:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a8c:	e8 c7 fe ff ff       	call   1006958 <sprintchar>
 1006a91:	83 c4 08             	add    esp,0x8
 1006a94:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006a98:	7f dc                	jg     1006a76 <sprint_hex+0x4a>
 1006a9a:	90                   	nop
 1006a9b:	90                   	nop
 1006a9c:	c9                   	leave  
 1006a9d:	c3                   	ret    

01006a9e <sprintn>:
 1006a9e:	55                   	push   ebp
 1006a9f:	89 e5                	mov    ebp,esp
 1006aa1:	eb 1b                	jmp    1006abe <sprintn+0x20>
 1006aa3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006aa6:	8d 50 01             	lea    edx,[eax+0x1]
 1006aa9:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
 1006aac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006aaf:	0f be c0             	movsx  eax,al
 1006ab2:	50                   	push   eax
 1006ab3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006ab6:	e8 9d fe ff ff       	call   1006958 <sprintchar>
 1006abb:	83 c4 08             	add    esp,0x8
 1006abe:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006ac1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006ac4:	84 c0                	test   al,al
 1006ac6:	75 db                	jne    1006aa3 <sprintn+0x5>
 1006ac8:	90                   	nop
 1006ac9:	90                   	nop
 1006aca:	c9                   	leave  
 1006acb:	c3                   	ret    
 1006acc:	66 90                	xchg   ax,ax
 1006ace:	66 90                	xchg   ax,ax

01006ad0 <create_zero>:
 1006ad0:	e8 da b6 ff ff       	call   10021af <req_proc>
 1006ad5:	83 f8 ff             	cmp    eax,0xffffffff
 1006ad8:	74 1d                	je     1006af7 <create_zero.retu>
 1006ada:	50                   	push   eax
 1006adb:	53                   	push   ebx
 1006adc:	51                   	push   ecx
 1006add:	52                   	push   edx
 1006ade:	06                   	push   es
 1006adf:	0e                   	push   cs
 1006ae0:	16                   	push   ss
 1006ae1:	1e                   	push   ds
 1006ae2:	0f a0                	push   fs
 1006ae4:	0f a8                	push   gs
 1006ae6:	54                   	push   esp
 1006ae7:	55                   	push   ebp
 1006ae8:	56                   	push   esi
 1006ae9:	57                   	push   edi
 1006aea:	9c                   	pushf  
 1006aeb:	50                   	push   eax
 1006aec:	e8 6f b7 ff ff       	call   1002260 <set_proc>
 1006af1:	8b 04 24             	mov    eax,DWORD PTR [esp]
 1006af4:	83 c4 40             	add    esp,0x40

01006af7 <create_zero.retu>:
 1006af7:	c3                   	ret    

01006af8 <fill_desc>:
 1006af8:	55                   	push   ebp
 1006af9:	89 e5                	mov    ebp,esp
 1006afb:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1006afe:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
 1006b01:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006b04:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1006b07:	be 26 6c 00 01       	mov    esi,0x1006c26
 1006b0c:	c7 05 26 6c 00 01 00 	mov    DWORD PTR ds:0x1006c26,0x0
 1006b13:	00 00 00 
 1006b16:	c7 05 2a 6c 00 01 00 	mov    DWORD PTR ds:0x1006c2a,0x0
 1006b1d:	00 00 00 
 1006b20:	66 89 0e             	mov    WORD PTR [esi],cx
 1006b23:	c1 e9 10             	shr    ecx,0x10
 1006b26:	66 89 56 02          	mov    WORD PTR [esi+0x2],dx
 1006b2a:	c1 ea 10             	shr    edx,0x10
 1006b2d:	88 56 04             	mov    BYTE PTR [esi+0x4],dl
 1006b30:	66 c1 ea 08          	shr    dx,0x8
 1006b34:	88 56 07             	mov    BYTE PTR [esi+0x7],dl
 1006b37:	66 89 5e 05          	mov    WORD PTR [esi+0x5],bx
 1006b3b:	8b 7e 04             	mov    edi,DWORD PTR [esi+0x4]
 1006b3e:	c1 e1 08             	shl    ecx,0x8
 1006b41:	09 cf                	or     edi,ecx
 1006b43:	89 7e 04             	mov    DWORD PTR [esi+0x4],edi
 1006b46:	8b 15 26 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c26
 1006b4c:	89 10                	mov    DWORD PTR [eax],edx
 1006b4e:	8b 15 2a 6c 00 01    	mov    edx,DWORD PTR ds:0x1006c2a
 1006b54:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1006b57:	89 ec                	mov    esp,ebp
 1006b59:	5d                   	pop    ebp
 1006b5a:	c3                   	ret    

01006b5b <switch_proc_asm>:
 1006b5b:	66 8b 44 24 04       	mov    ax,WORD PTR [esp+0x4]
 1006b60:	66 a3 75 6b 00 01    	mov    ds:0x1006b75,ax
 1006b66:	c7 05 71 6b 00 01 00 	mov    DWORD PTR ds:0x1006b71,0x0
 1006b6d:	00 00 00 

01006b70 <switch_proc_asm.ljmp>:
 1006b70:	ea 00 00 00 00 00 00 	jmp    0x0:0x0
 1006b77:	c3                   	ret    

01006b78 <switch_to>:
 1006b78:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
 1006b7c:	8b 5e 20             	mov    ebx,DWORD PTR [esi+0x20]
 1006b7f:	bf dc 6b 00 01       	mov    edi,0x1006bdc
 1006b84:	89 5f 01             	mov    DWORD PTR [edi+0x1],ebx
 1006b87:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 1006b8a:	89 c1                	mov    ecx,eax
 1006b8c:	83 e9 04             	sub    ecx,0x4
 1006b8f:	89 19                	mov    DWORD PTR [ecx],ebx
 1006b91:	50                   	push   eax
 1006b92:	89 f5                	mov    ebp,esi
 1006b94:	83 c5 28             	add    ebp,0x28
 1006b97:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006b9a:	50                   	push   eax
 1006b9b:	83 c5 04             	add    ebp,0x4
 1006b9e:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006ba1:	50                   	push   eax
 1006ba2:	83 c5 04             	add    ebp,0x4
 1006ba5:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006ba8:	50                   	push   eax
 1006ba9:	83 c5 04             	add    ebp,0x4
 1006bac:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006baf:	50                   	push   eax
 1006bb0:	83 c5 04             	add    ebp,0x4
 1006bb3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006bb6:	50                   	push   eax
 1006bb7:	83 c5 04             	add    ebp,0x4
 1006bba:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006bbd:	50                   	push   eax
 1006bbe:	83 c5 04             	add    ebp,0x4
 1006bc1:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006bc4:	50                   	push   eax
 1006bc5:	83 c5 04             	add    ebp,0x4
 1006bc8:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006bcb:	50                   	push   eax
 1006bcc:	83 c5 04             	add    ebp,0x4
 1006bcf:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
 1006bd2:	0f 22 d8             	mov    cr3,eax
 1006bd5:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
 1006bd8:	50                   	push   eax
 1006bd9:	9d                   	popf   
 1006bda:	61                   	popa   
 1006bdb:	5c                   	pop    esp

01006bdc <switch_to.leap>:
 1006bdc:	ea 00 00 00 00 08 00 	jmp    0x8:0x0

01006be3 <save_context>:
 1006be3:	60                   	pusha  
 1006be4:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
 1006be8:	83 c0 44             	add    eax,0x44
 1006beb:	b9 08 00 00 00       	mov    ecx,0x8
 1006bf0:	89 e7                	mov    edi,esp

01006bf2 <save_context.loops>:
 1006bf2:	8b 17                	mov    edx,DWORD PTR [edi]
 1006bf4:	89 10                	mov    DWORD PTR [eax],edx
 1006bf6:	83 c7 04             	add    edi,0x4
 1006bf9:	83 e8 04             	sub    eax,0x4
 1006bfc:	e2 f4                	loop   1006bf2 <save_context.loops>
 1006bfe:	61                   	popa   
 1006bff:	9c                   	pushf  
 1006c00:	5b                   	pop    ebx
 1006c01:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1006c05:	89 58 24             	mov    DWORD PTR [eax+0x24],ebx
 1006c08:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1006c0b:	89 58 20             	mov    DWORD PTR [eax+0x20],ebx
 1006c0e:	c3                   	ret    

01006c0f <move_to_user_mode>:
 1006c0f:	66 b8 20 00          	mov    ax,0x20
 1006c13:	8e d8                	mov    ds,eax
 1006c15:	8e c0                	mov    es,eax
 1006c17:	8e e8                	mov    gs,eax
 1006c19:	6a 20                	push   0x20
 1006c1b:	54                   	push   esp
 1006c1c:	9c                   	pushf  
 1006c1d:	6a 18                	push   0x18
 1006c1f:	68 25 6c 00 01       	push   0x1006c25
 1006c24:	cf                   	iret   

01006c25 <move_to_user_mode.done>:
 1006c25:	c3                   	ret    

01006c26 <desc>:
	...
