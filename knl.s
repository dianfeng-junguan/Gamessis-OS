
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
 1000148:	b8 ee 0f 00 01       	mov    eax,0x1000fee
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
 10001bc:	b8 ff 3d 00 01       	mov    eax,0x1003dff
 10001c1:	68 00 8f 00 00       	push   0x8f00
 10001c6:	6a 08                	push   0x8
 10001c8:	50                   	push   eax
 10001c9:	6a 21                	push   0x21
 10001cb:	e8 c0 00 00 00       	call   1000290 <set_gate>
 10001d0:	83 c4 10             	add    esp,0x10
 10001d3:	b8 40 32 00 01       	mov    eax,0x1003240
 10001d8:	68 00 8e 00 00       	push   0x8e00
 10001dd:	6a 08                	push   0x8
 10001df:	50                   	push   eax
 10001e0:	6a 20                	push   0x20
 10001e2:	e8 a9 00 00 00       	call   1000290 <set_gate>
 10001e7:	83 c4 10             	add    esp,0x10
 10001ea:	b8 c0 3c 00 01       	mov    eax,0x1003cc0
 10001ef:	68 00 8f 00 00       	push   0x8f00
 10001f4:	6a 08                	push   0x8
 10001f6:	50                   	push   eax
 10001f7:	68 80 00 00 00       	push   0x80
 10001fc:	e8 8f 00 00 00       	call   1000290 <set_gate>
 1000201:	83 c4 10             	add    esp,0x10
 1000204:	83 ec 08             	sub    esp,0x8
 1000207:	6a 11                	push   0x11
 1000209:	6a 20                	push   0x20
 100020b:	e8 e0 2d 00 00       	call   1002ff0 <outb>
 1000210:	83 c4 10             	add    esp,0x10
 1000213:	83 ec 08             	sub    esp,0x8
 1000216:	6a 11                	push   0x11
 1000218:	68 a0 00 00 00       	push   0xa0
 100021d:	e8 ce 2d 00 00       	call   1002ff0 <outb>
 1000222:	83 c4 10             	add    esp,0x10
 1000225:	83 ec 08             	sub    esp,0x8
 1000228:	6a 20                	push   0x20
 100022a:	6a 21                	push   0x21
 100022c:	e8 bf 2d 00 00       	call   1002ff0 <outb>
 1000231:	83 c4 10             	add    esp,0x10
 1000234:	83 ec 08             	sub    esp,0x8
 1000237:	6a 28                	push   0x28
 1000239:	68 a1 00 00 00       	push   0xa1
 100023e:	e8 ad 2d 00 00       	call   1002ff0 <outb>
 1000243:	83 c4 10             	add    esp,0x10
 1000246:	83 ec 08             	sub    esp,0x8
 1000249:	6a 04                	push   0x4
 100024b:	6a 21                	push   0x21
 100024d:	e8 9e 2d 00 00       	call   1002ff0 <outb>
 1000252:	83 c4 10             	add    esp,0x10
 1000255:	83 ec 08             	sub    esp,0x8
 1000258:	6a 02                	push   0x2
 100025a:	68 a1 00 00 00       	push   0xa1
 100025f:	e8 8c 2d 00 00       	call   1002ff0 <outb>
 1000264:	83 c4 10             	add    esp,0x10
 1000267:	83 ec 08             	sub    esp,0x8
 100026a:	6a 01                	push   0x1
 100026c:	6a 21                	push   0x21
 100026e:	e8 7d 2d 00 00       	call   1002ff0 <outb>
 1000273:	83 c4 10             	add    esp,0x10
 1000276:	83 ec 08             	sub    esp,0x8
 1000279:	6a 01                	push   0x1
 100027b:	68 a1 00 00 00       	push   0xa1
 1000280:	e8 6b 2d 00 00       	call   1002ff0 <outb>
 1000285:	83 c4 10             	add    esp,0x10
 1000288:	e8 a8 2d 00 00       	call   1003035 <turn_on_int>
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
 1000312:	e8 12 2d 00 00       	call   1003029 <eoi>
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
 1000324:	e8 00 2d 00 00       	call   1003029 <eoi>
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
 1000336:	e8 ee 2c 00 00       	call   1003029 <eoi>
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
 1000348:	e8 dc 2c 00 00       	call   1003029 <eoi>
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
 100035a:	e8 ca 2c 00 00       	call   1003029 <eoi>
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
 100036c:	e8 b8 2c 00 00       	call   1003029 <eoi>
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
 100037d:	e8 a7 2c 00 00       	call   1003029 <eoi>
 1000382:	e8 cd 2c 00 00       	call   1003054 <report_back_trace_of_err>
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
 1000395:	e8 8f 2c 00 00       	call   1003029 <eoi>
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
 10003a7:	e8 7d 2c 00 00       	call   1003029 <eoi>
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
 10003b8:	e8 6c 2c 00 00       	call   1003029 <eoi>
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
 10003c9:	e8 5b 2c 00 00       	call   1003029 <eoi>
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
 10003db:	e8 49 2c 00 00       	call   1003029 <eoi>
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
 10003ed:	e8 37 2c 00 00       	call   1003029 <eoi>
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
 1000406:	e8 1e 2c 00 00       	call   1003029 <eoi>
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
 1000419:	e8 0b 2c 00 00       	call   1003029 <eoi>
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
 100043a:	05 60 6e 00 01       	add    eax,0x1006e60
 100043f:	8b 00                	mov    eax,DWORD PTR [eax]
 1000441:	ff e0                	jmp    eax
 1000443:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000446:	83 ec 0c             	sub    esp,0xc
 1000449:	50                   	push   eax
 100044a:	e8 74 17 00 00       	call   1001bc3 <reg_device>
 100044f:	83 c4 10             	add    esp,0x10
 1000452:	e9 06 02 00 00       	jmp    100065d <syscall+0x239>
 1000457:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100045a:	83 ec 0c             	sub    esp,0xc
 100045d:	50                   	push   eax
 100045e:	e8 2d 1d 00 00       	call   1002190 <dispose_device>
 1000463:	83 c4 10             	add    esp,0x10
 1000466:	e9 f2 01 00 00       	jmp    100065d <syscall+0x239>
 100046b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100046e:	83 ec 0c             	sub    esp,0xc
 1000471:	50                   	push   eax
 1000472:	e8 01 18 00 00       	call   1001c78 <reg_driver>
 1000477:	83 c4 10             	add    esp,0x10
 100047a:	e9 de 01 00 00       	jmp    100065d <syscall+0x239>
 100047f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000482:	83 ec 0c             	sub    esp,0xc
 1000485:	50                   	push   eax
 1000486:	e8 0b 1d 00 00       	call   1002196 <dispose_driver>
 100048b:	83 c4 10             	add    esp,0x10
 100048e:	e9 ca 01 00 00       	jmp    100065d <syscall+0x239>
 1000493:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1000496:	83 ec 04             	sub    esp,0x4
 1000499:	50                   	push   eax
 100049a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100049d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004a0:	e8 ff 1a 00 00       	call   1001fa4 <call_drv_func>
 10004a5:	83 c4 10             	add    esp,0x10
 10004a8:	e9 b0 01 00 00       	jmp    100065d <syscall+0x239>
 10004ad:	83 ec 08             	sub    esp,0x8
 10004b0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10004b3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004b6:	e8 f5 0d 00 00       	call   10012b0 <req_page_at>
 10004bb:	83 c4 10             	add    esp,0x10
 10004be:	e9 9a 01 00 00       	jmp    100065d <syscall+0x239>
 10004c3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10004c6:	83 ec 0c             	sub    esp,0xc
 10004c9:	50                   	push   eax
 10004ca:	e8 ed 0c 00 00       	call   10011bc <free_page>
 10004cf:	83 c4 10             	add    esp,0x10
 10004d2:	e9 86 01 00 00       	jmp    100065d <syscall+0x239>
 10004d7:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10004da:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10004dd:	83 ec 04             	sub    esp,0x4
 10004e0:	52                   	push   edx
 10004e1:	50                   	push   eax
 10004e2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004e5:	e8 d8 27 00 00       	call   1002cc2 <reg_proc>
 10004ea:	83 c4 10             	add    esp,0x10
 10004ed:	e9 6b 01 00 00       	jmp    100065d <syscall+0x239>
 10004f2:	83 ec 0c             	sub    esp,0xc
 10004f5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10004f8:	e8 08 26 00 00       	call   1002b05 <del_proc>
 10004fd:	83 c4 10             	add    esp,0x10
 1000500:	83 ec 08             	sub    esp,0x8
 1000503:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000506:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000509:	e8 57 0e 00 00       	call   1001365 <chk_vm>
 100050e:	83 c4 10             	add    esp,0x10
 1000511:	83 ec 08             	sub    esp,0x8
 1000514:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000517:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100051a:	e8 69 11 00 00       	call   1001688 <sys_open>
 100051f:	83 c4 10             	add    esp,0x10
 1000522:	e9 36 01 00 00       	jmp    100065d <syscall+0x239>
 1000527:	83 ec 0c             	sub    esp,0xc
 100052a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100052d:	e8 3e 14 00 00       	call   1001970 <sys_close>
 1000532:	83 c4 10             	add    esp,0x10
 1000535:	e9 23 01 00 00       	jmp    100065d <syscall+0x239>
 100053a:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 100053d:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000540:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000543:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000546:	e8 15 15 00 00       	call   1001a60 <sys_read>
 100054b:	83 c4 10             	add    esp,0x10
 100054e:	e9 0a 01 00 00       	jmp    100065d <syscall+0x239>
 1000553:	ff 75 18             	push   DWORD PTR [ebp+0x18]
 1000556:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000559:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100055c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100055f:	e8 77 14 00 00       	call   10019db <sys_write>
 1000564:	83 c4 10             	add    esp,0x10
 1000567:	e9 f1 00 00 00       	jmp    100065d <syscall+0x239>
 100056c:	83 ec 04             	sub    esp,0x4
 100056f:	ff 75 14             	push   DWORD PTR [ebp+0x14]
 1000572:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000575:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000578:	e8 88 15 00 00       	call   1001b05 <sys_seek>
 100057d:	83 c4 10             	add    esp,0x10
 1000580:	e9 d8 00 00 00       	jmp    100065d <syscall+0x239>
 1000585:	83 ec 0c             	sub    esp,0xc
 1000588:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100058b:	e8 ae 15 00 00       	call   1001b3e <sys_tell>
 1000590:	83 c4 10             	add    esp,0x10
 1000593:	e9 c5 00 00 00       	jmp    100065d <syscall+0x239>
 1000598:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100059b:	83 ec 04             	sub    esp,0x4
 100059e:	50                   	push   eax
 100059f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10005a2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005a5:	e8 15 10 00 00       	call   10015bf <reg_vol>
 10005aa:	83 c4 10             	add    esp,0x10
 10005ad:	e9 ab 00 00 00       	jmp    100065d <syscall+0x239>
 10005b2:	83 ec 0c             	sub    esp,0xc
 10005b5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005b8:	e8 ee 0f 00 00       	call   10015ab <free_vol>
 10005bd:	83 c4 10             	add    esp,0x10
 10005c0:	e9 98 00 00 00       	jmp    100065d <syscall+0x239>
 10005c5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005c8:	83 ec 0c             	sub    esp,0xc
 10005cb:	50                   	push   eax
 10005cc:	e8 e1 2c 00 00       	call   10032b2 <execute>
 10005d1:	83 c4 10             	add    esp,0x10
 10005d4:	e9 84 00 00 00       	jmp    100065d <syscall+0x239>
 10005d9:	83 ec 0c             	sub    esp,0xc
 10005dc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10005df:	e8 c2 26 00 00       	call   1002ca6 <sys_exit>
 10005e4:	83 c4 10             	add    esp,0x10
 10005e7:	eb 74                	jmp    100065d <syscall+0x239>
 10005e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10005ec:	83 ec 0c             	sub    esp,0xc
 10005ef:	50                   	push   eax
 10005f0:	e8 96 2d 00 00       	call   100338b <exec_call>
 10005f5:	83 c4 10             	add    esp,0x10
 10005f8:	eb 63                	jmp    100065d <syscall+0x239>
 10005fa:	83 ec 0c             	sub    esp,0xc
 10005fd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000600:	e8 85 0e 00 00       	call   100148a <sys_mkfifo>
 1000605:	83 c4 10             	add    esp,0x10
 1000608:	eb 53                	jmp    100065d <syscall+0x239>
 100060a:	83 ec 0c             	sub    esp,0xc
 100060d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000610:	e8 e7 27 00 00       	call   1002dfc <sys_malloc>
 1000615:	83 c4 10             	add    esp,0x10
 1000618:	eb 43                	jmp    100065d <syscall+0x239>
 100061a:	83 ec 0c             	sub    esp,0xc
 100061d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1000620:	e8 28 29 00 00       	call   1002f4d <sys_free>
 1000625:	83 c4 10             	add    esp,0x10
 1000628:	eb 33                	jmp    100065d <syscall+0x239>
 100062a:	e8 a2 38 00 00       	call   1003ed1 <sys_getkbc>
 100062f:	0f be c0             	movsx  eax,al
 1000632:	eb 29                	jmp    100065d <syscall+0x239>
 1000634:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000637:	83 ec 0c             	sub    esp,0xc
 100063a:	50                   	push   eax
 100063b:	e8 bb 16 00 00       	call   1001cfb <sys_find_dev>
 1000640:	83 c4 10             	add    esp,0x10
 1000643:	eb 18                	jmp    100065d <syscall+0x239>
 1000645:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 1000648:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100064b:	83 ec 04             	sub    esp,0x4
 100064e:	52                   	push   edx
 100064f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1000652:	50                   	push   eax
 1000653:	e8 06 17 00 00       	call   1001d5e <sys_operate_dev>
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
 100067b:	e8 5b 05 00 00       	call   1000bdb <init_logging>
 1000680:	81 3b d6 50 52 e8    	cmp    DWORD PTR [ebx],0xe85250d6
 1000686:	74 10                	je     1000698 <main+0x39>
 1000688:	83 ec 0c             	sub    esp,0xc
 100068b:	68 f4 6f 00 01       	push   0x1006ff4
 1000690:	e8 fa 06 00 00       	call   1000d8f <printf>
 1000695:	83 c4 10             	add    esp,0x10
 1000698:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 100069b:	8b 00                	mov    eax,DWORD PTR [eax]
 100069d:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 10006a0:	83 ec 08             	sub    esp,0x8
 10006a3:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 10006a6:	68 1e 70 00 01       	push   0x100701e
 10006ab:	e8 df 06 00 00       	call   1000d8f <printf>
 10006b0:	83 c4 10             	add    esp,0x10
 10006b3:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 10006b6:	83 c0 08             	add    eax,0x8
 10006b9:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10006bc:	e9 b3 04 00 00       	jmp    1000b74 <main+0x515>
 10006c1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006c4:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10006c7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006ca:	8b 00                	mov    eax,DWORD PTR [eax]
 10006cc:	83 ec 04             	sub    esp,0x4
 10006cf:	52                   	push   edx
 10006d0:	50                   	push   eax
 10006d1:	68 37 70 00 01       	push   0x1007037
 10006d6:	e8 b4 06 00 00       	call   1000d8f <printf>
 10006db:	83 c4 10             	add    esp,0x10
 10006de:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006e1:	8b 00                	mov    eax,DWORD PTR [eax]
 10006e3:	83 f8 08             	cmp    eax,0x8
 10006e6:	0f 87 79 04 00 00    	ja     1000b65 <main+0x506>
 10006ec:	8b 04 85 98 71 00 01 	mov    eax,DWORD PTR [eax*4+0x1007198]
 10006f3:	ff e0                	jmp    eax
 10006f5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10006f8:	83 c0 08             	add    eax,0x8
 10006fb:	83 ec 08             	sub    esp,0x8
 10006fe:	50                   	push   eax
 10006ff:	68 4c 70 00 01       	push   0x100704c
 1000704:	e8 86 06 00 00       	call   1000d8f <printf>
 1000709:	83 c4 10             	add    esp,0x10
 100070c:	e9 54 04 00 00       	jmp    1000b65 <main+0x506>
 1000711:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000714:	83 c0 08             	add    eax,0x8
 1000717:	83 ec 08             	sub    esp,0x8
 100071a:	50                   	push   eax
 100071b:	68 5f 70 00 01       	push   0x100705f
 1000720:	e8 6a 06 00 00       	call   1000d8f <printf>
 1000725:	83 c4 10             	add    esp,0x10
 1000728:	e9 38 04 00 00       	jmp    1000b65 <main+0x506>
 100072d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000730:	8d 48 10             	lea    ecx,[eax+0x10]
 1000733:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000736:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000739:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100073c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100073f:	51                   	push   ecx
 1000740:	52                   	push   edx
 1000741:	50                   	push   eax
 1000742:	68 78 70 00 01       	push   0x1007078
 1000747:	e8 43 06 00 00       	call   1000d8f <printf>
 100074c:	83 c4 10             	add    esp,0x10
 100074f:	e9 11 04 00 00       	jmp    1000b65 <main+0x506>
 1000754:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000757:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100075a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100075d:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000760:	83 ec 04             	sub    esp,0x4
 1000763:	52                   	push   edx
 1000764:	50                   	push   eax
 1000765:	68 a0 70 00 01       	push   0x10070a0
 100076a:	e8 20 06 00 00       	call   1000d8f <printf>
 100076f:	83 c4 10             	add    esp,0x10
 1000772:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000775:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000778:	83 ec 0c             	sub    esp,0xc
 100077b:	50                   	push   eax
 100077c:	e8 11 07 00 00       	call   1000e92 <set_high_mem_base>
 1000781:	83 c4 10             	add    esp,0x10
 1000784:	e9 dc 03 00 00       	jmp    1000b65 <main+0x506>
 1000789:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100078c:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 100078f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000792:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000795:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000798:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100079b:	51                   	push   ecx
 100079c:	52                   	push   edx
 100079d:	50                   	push   eax
 100079e:	68 c4 70 00 01       	push   0x10070c4
 10007a3:	e8 e7 05 00 00       	call   1000d8f <printf>
 10007a8:	83 c4 10             	add    esp,0x10
 10007ab:	e9 b5 03 00 00       	jmp    1000b65 <main+0x506>
 10007b0:	83 ec 0c             	sub    esp,0xc
 10007b3:	68 dc 70 00 01       	push   0x10070dc
 10007b8:	e8 d2 05 00 00       	call   1000d8f <printf>
 10007bd:	83 c4 10             	add    esp,0x10
 10007c0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10007c3:	83 c0 10             	add    eax,0x10
 10007c6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10007c9:	e9 06 01 00 00       	jmp    10008d4 <main+0x275>
 10007ce:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007d1:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 10007d4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007d7:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007da:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007dd:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 10007e0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007e3:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10007e6:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10007e9:	89 d0                	mov    eax,edx
 10007eb:	31 d2                	xor    edx,edx
 10007ed:	89 c7                	mov    edi,eax
 10007ef:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007f2:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10007f5:	8b 00                	mov    eax,DWORD PTR [eax]
 10007f7:	89 c6                	mov    esi,eax
 10007f9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10007fc:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10007ff:	8b 00                	mov    eax,DWORD PTR [eax]
 1000801:	89 d0                	mov    eax,edx
 1000803:	31 d2                	xor    edx,edx
 1000805:	83 ec 08             	sub    esp,0x8
 1000808:	51                   	push   ecx
 1000809:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 100080c:	57                   	push   edi
 100080d:	56                   	push   esi
 100080e:	50                   	push   eax
 100080f:	68 e4 70 00 01       	push   0x10070e4
 1000814:	e8 76 05 00 00       	call   1000d8f <printf>
 1000819:	83 c4 20             	add    esp,0x20
 100081c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100081f:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000822:	89 c6                	mov    esi,eax
 1000824:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000827:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100082a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100082d:	89 c1                	mov    ecx,eax
 100082f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000832:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1000835:	8b 00                	mov    eax,DWORD PTR [eax]
 1000837:	83 ec 04             	sub    esp,0x4
 100083a:	56                   	push   esi
 100083b:	51                   	push   ecx
 100083c:	50                   	push   eax
 100083d:	e8 5e 06 00 00       	call   1000ea0 <set_mem_area>
 1000842:	83 c4 10             	add    esp,0x10
 1000845:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000848:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100084b:	83 f8 05             	cmp    eax,0x5
 100084e:	77 75                	ja     10008c5 <main+0x266>
 1000850:	8b 04 85 bc 71 00 01 	mov    eax,DWORD PTR [eax*4+0x10071bc]
 1000857:	ff e0                	jmp    eax
 1000859:	83 ec 0c             	sub    esp,0xc
 100085c:	68 17 71 00 01       	push   0x1007117
 1000861:	e8 29 05 00 00       	call   1000d8f <printf>
 1000866:	83 c4 10             	add    esp,0x10
 1000869:	eb 5b                	jmp    10008c6 <main+0x267>
 100086b:	83 ec 0c             	sub    esp,0xc
 100086e:	68 26 71 00 01       	push   0x1007126
 1000873:	e8 17 05 00 00       	call   1000d8f <printf>
 1000878:	83 c4 10             	add    esp,0x10
 100087b:	eb 49                	jmp    10008c6 <main+0x267>
 100087d:	83 ec 0c             	sub    esp,0xc
 1000880:	68 28 71 00 01       	push   0x1007128
 1000885:	e8 05 05 00 00       	call   1000d8f <printf>
 100088a:	83 c4 10             	add    esp,0x10
 100088d:	eb 37                	jmp    10008c6 <main+0x267>
 100088f:	83 ec 0c             	sub    esp,0xc
 1000892:	68 34 71 00 01       	push   0x1007134
 1000897:	e8 f3 04 00 00       	call   1000d8f <printf>
 100089c:	83 c4 10             	add    esp,0x10
 100089f:	eb 25                	jmp    10008c6 <main+0x267>
 10008a1:	83 ec 0c             	sub    esp,0xc
 10008a4:	68 64 71 00 01       	push   0x1007164
 10008a9:	e8 e1 04 00 00       	call   1000d8f <printf>
 10008ae:	83 c4 10             	add    esp,0x10
 10008b1:	eb 13                	jmp    10008c6 <main+0x267>
 10008b3:	83 ec 0c             	sub    esp,0xc
 10008b6:	68 72 71 00 01       	push   0x1007172
 10008bb:	e8 cf 04 00 00       	call   1000d8f <printf>
 10008c0:	83 c4 10             	add    esp,0x10
 10008c3:	eb 01                	jmp    10008c6 <main+0x267>
 10008c5:	90                   	nop
 10008c6:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008c9:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10008cc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10008cf:	01 d0                	add    eax,edx
 10008d1:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10008d4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008d7:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10008da:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008dd:	01 d0                	add    eax,edx
 10008df:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 10008e2:	0f 82 e6 fe ff ff    	jb     10007ce <main+0x16f>
 10008e8:	e9 78 02 00 00       	jmp    1000b65 <main+0x506>
 10008ed:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10008f0:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10008f3:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10008f6:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10008f9:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10008fc:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 10008ff:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000902:	0f b6 40 1d          	movzx  eax,BYTE PTR [eax+0x1d]
 1000906:	0f b6 c0             	movzx  eax,al
 1000909:	83 f8 02             	cmp    eax,0x2
 100090c:	0f 84 36 01 00 00    	je     1000a48 <main+0x3e9>
 1000912:	83 f8 02             	cmp    eax,0x2
 1000915:	0f 8f 36 01 00 00    	jg     1000a51 <main+0x3f2>
 100091b:	85 c0                	test   eax,eax
 100091d:	74 0e                	je     100092d <main+0x2ce>
 100091f:	83 f8 01             	cmp    eax,0x1
 1000922:	0f 84 f3 00 00 00    	je     1000a1b <main+0x3bc>
 1000928:	e9 24 01 00 00       	jmp    1000a51 <main+0x3f2>
 100092d:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000930:	83 c0 22             	add    eax,0x22
 1000933:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1000936:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 100093d:	c7 45 d4 00 00 04 00 	mov    DWORD PTR [ebp-0x2c],0x40000
 1000944:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 100094b:	e9 b6 00 00 00       	jmp    1000a06 <main+0x3a7>
 1000950:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000953:	89 d0                	mov    eax,edx
 1000955:	01 c0                	add    eax,eax
 1000957:	01 c2                	add    edx,eax
 1000959:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100095c:	01 d0                	add    eax,edx
 100095e:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000962:	0f b6 c0             	movzx  eax,al
 1000965:	ba ff 00 00 00       	mov    edx,0xff
 100096a:	89 d1                	mov    ecx,edx
 100096c:	29 c1                	sub    ecx,eax
 100096e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000971:	89 d0                	mov    eax,edx
 1000973:	01 c0                	add    eax,eax
 1000975:	01 c2                	add    edx,eax
 1000977:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100097a:	01 d0                	add    eax,edx
 100097c:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000980:	0f b6 d0             	movzx  edx,al
 1000983:	b8 ff 00 00 00       	mov    eax,0xff
 1000988:	29 d0                	sub    eax,edx
 100098a:	89 ce                	mov    esi,ecx
 100098c:	0f af f0             	imul   esi,eax
 100098f:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000992:	89 d0                	mov    eax,edx
 1000994:	01 c0                	add    eax,eax
 1000996:	01 c2                	add    edx,eax
 1000998:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100099b:	01 d0                	add    eax,edx
 100099d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10009a0:	0f b6 c8             	movzx  ecx,al
 10009a3:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009a6:	89 d0                	mov    eax,edx
 10009a8:	01 c0                	add    eax,eax
 10009aa:	01 c2                	add    edx,eax
 10009ac:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009af:	01 d0                	add    eax,edx
 10009b1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10009b4:	0f b6 c0             	movzx  eax,al
 10009b7:	0f af c1             	imul   eax,ecx
 10009ba:	01 c6                	add    esi,eax
 10009bc:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009bf:	89 d0                	mov    eax,edx
 10009c1:	01 c0                	add    eax,eax
 10009c3:	01 c2                	add    edx,eax
 10009c5:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009c8:	01 d0                	add    eax,edx
 10009ca:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10009ce:	0f b6 c8             	movzx  ecx,al
 10009d1:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10009d4:	89 d0                	mov    eax,edx
 10009d6:	01 c0                	add    eax,eax
 10009d8:	01 c2                	add    edx,eax
 10009da:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10009dd:	01 d0                	add    eax,edx
 10009df:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10009e3:	0f b6 c0             	movzx  eax,al
 10009e6:	0f af c1             	imul   eax,ecx
 10009e9:	01 f0                	add    eax,esi
 10009eb:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10009ee:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10009f1:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 10009f4:	73 0c                	jae    1000a02 <main+0x3a3>
 10009f6:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10009f9:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10009fc:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10009ff:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1000a02:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000a06:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a09:	0f b7 40 20          	movzx  eax,WORD PTR [eax+0x20]
 1000a0d:	0f b7 c0             	movzx  eax,ax
 1000a10:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000a13:	0f 82 37 ff ff ff    	jb     1000950 <main+0x2f1>
 1000a19:	eb 3e                	jmp    1000a59 <main+0x3fa>
 1000a1b:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a1e:	0f b6 40 25          	movzx  eax,BYTE PTR [eax+0x25]
 1000a22:	0f b6 c0             	movzx  eax,al
 1000a25:	ba 01 00 00 00       	mov    edx,0x1
 1000a2a:	89 c1                	mov    ecx,eax
 1000a2c:	d3 e2                	shl    edx,cl
 1000a2e:	89 d0                	mov    eax,edx
 1000a30:	8d 50 ff             	lea    edx,[eax-0x1]
 1000a33:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a36:	0f b6 40 24          	movzx  eax,BYTE PTR [eax+0x24]
 1000a3a:	0f b6 c0             	movzx  eax,al
 1000a3d:	89 c1                	mov    ecx,eax
 1000a3f:	d3 e2                	shl    edx,cl
 1000a41:	89 d0                	mov    eax,edx
 1000a43:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1000a46:	eb 11                	jmp    1000a59 <main+0x3fa>
 1000a48:	c7 45 dc 5c 01 00 00 	mov    DWORD PTR [ebp-0x24],0x15c
 1000a4f:	eb 08                	jmp    1000a59 <main+0x3fa>
 1000a51:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
 1000a58:	90                   	nop
 1000a59:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 1000a60:	e9 e5 00 00 00       	jmp    1000b4a <main+0x4eb>
 1000a65:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000a68:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
 1000a6c:	0f b6 c0             	movzx  eax,al
 1000a6f:	83 f8 20             	cmp    eax,0x20
 1000a72:	0f 84 ae 00 00 00    	je     1000b26 <main+0x4c7>
 1000a78:	83 f8 20             	cmp    eax,0x20
 1000a7b:	0f 8f c5 00 00 00    	jg     1000b46 <main+0x4e7>
 1000a81:	83 f8 18             	cmp    eax,0x18
 1000a84:	74 6c                	je     1000af2 <main+0x493>
 1000a86:	83 f8 18             	cmp    eax,0x18
 1000a89:	0f 8f b7 00 00 00    	jg     1000b46 <main+0x4e7>
 1000a8f:	83 f8 08             	cmp    eax,0x8
 1000a92:	74 17                	je     1000aab <main+0x44c>
 1000a94:	83 f8 08             	cmp    eax,0x8
 1000a97:	0f 8c a9 00 00 00    	jl     1000b46 <main+0x4e7>
 1000a9d:	83 e8 0f             	sub    eax,0xf
 1000aa0:	83 f8 01             	cmp    eax,0x1
 1000aa3:	0f 87 9d 00 00 00    	ja     1000b46 <main+0x4e7>
 1000aa9:	eb 23                	jmp    1000ace <main+0x46f>
 1000aab:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000aae:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000ab1:	83 c0 01             	add    eax,0x1
 1000ab4:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000ab8:	89 c2                	mov    edx,eax
 1000aba:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000abd:	01 d0                	add    eax,edx
 1000abf:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 1000ac2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000ac5:	89 c2                	mov    edx,eax
 1000ac7:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 1000aca:	88 10                	mov    BYTE PTR [eax],dl
 1000acc:	eb 78                	jmp    1000b46 <main+0x4e7>
 1000ace:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000ad1:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000ad4:	83 c0 02             	add    eax,0x2
 1000ad7:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000adb:	89 c2                	mov    edx,eax
 1000add:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000ae0:	01 d0                	add    eax,edx
 1000ae2:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 1000ae5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000ae8:	89 c2                	mov    edx,eax
 1000aea:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1000aed:	66 89 10             	mov    WORD PTR [eax],dx
 1000af0:	eb 54                	jmp    1000b46 <main+0x4e7>
 1000af2:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000af5:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000af8:	83 c0 03             	add    eax,0x3
 1000afb:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000aff:	89 c2                	mov    edx,eax
 1000b01:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000b04:	01 d0                	add    eax,edx
 1000b06:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 1000b09:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1000b0c:	25 ff ff ff 00       	and    eax,0xffffff
 1000b11:	89 c2                	mov    edx,eax
 1000b13:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000b16:	8b 00                	mov    eax,DWORD PTR [eax]
 1000b18:	25 00 00 00 ff       	and    eax,0xff000000
 1000b1d:	09 c2                	or     edx,eax
 1000b1f:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000b22:	89 10                	mov    DWORD PTR [eax],edx
 1000b24:	eb 20                	jmp    1000b46 <main+0x4e7>
 1000b26:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b29:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000b2c:	83 c0 04             	add    eax,0x4
 1000b2f:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000b33:	89 c2                	mov    edx,eax
 1000b35:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1000b38:	01 d0                	add    eax,edx
 1000b3a:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1000b3d:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 1000b40:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
 1000b43:	89 10                	mov    DWORD PTR [eax],edx
 1000b45:	90                   	nop
 1000b46:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 1000b4a:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b4d:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1000b50:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000b53:	73 0f                	jae    1000b64 <main+0x505>
 1000b55:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000b58:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1000b5b:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000b5e:	0f 82 01 ff ff ff    	jb     1000a65 <main+0x406>
 1000b64:	90                   	nop
 1000b65:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b68:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000b6b:	83 c0 07             	add    eax,0x7
 1000b6e:	83 e0 f8             	and    eax,0xfffffff8
 1000b71:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000b74:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b77:	8b 00                	mov    eax,DWORD PTR [eax]
 1000b79:	85 c0                	test   eax,eax
 1000b7b:	0f 85 40 fb ff ff    	jne    10006c1 <main+0x62>
 1000b81:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b84:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000b87:	83 c0 07             	add    eax,0x7
 1000b8a:	83 e0 f8             	and    eax,0xfffffff8
 1000b8d:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000b90:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000b93:	2b 43 04             	sub    eax,DWORD PTR [ebx+0x4]
 1000b96:	83 ec 08             	sub    esp,0x8
 1000b99:	50                   	push   eax
 1000b9a:	68 80 71 00 01       	push   0x1007180
 1000b9f:	e8 eb 01 00 00       	call   1000d8f <printf>
 1000ba4:	83 c4 10             	add    esp,0x10
 1000ba7:	e8 54 f4 ff ff       	call   1000000 <init_int>
 1000bac:	e8 3a 05 00 00       	call   10010eb <init_memory>
 1000bb1:	e8 01 10 00 00       	call   1001bb7 <init_drvdev_man>
 1000bb6:	e8 0e 16 00 00       	call   10021c9 <init_proc>
 1000bbb:	e8 e9 54 00 00       	call   10060a9 <init_tty>
 1000bc0:	e8 11 32 00 00       	call   1003dd6 <init_kb>
 1000bc5:	e8 5f 33 00 00       	call   1003f29 <init_disk>
 1000bca:	e8 8f 3a 00 00       	call   100465e <init_fat16>
 1000bcf:	c7 05 60 6d 00 01 00 	mov    DWORD PTR ds:0x1006d60,0x0
 1000bd6:	00 00 00 
 1000bd9:	eb fe                	jmp    1000bd9 <main+0x57a>

01000bdb <init_logging>:
 1000bdb:	55                   	push   ebp
 1000bdc:	89 e5                	mov    ebp,esp
 1000bde:	c7 05 04 00 40 00 00 	mov    DWORD PTR ds:0x400004,0xb8000
 1000be5:	80 0b 00 
 1000be8:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000bef:	00 00 00 
 1000bf2:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000bf9:	00 00 00 
 1000bfc:	90                   	nop
 1000bfd:	5d                   	pop    ebp
 1000bfe:	c3                   	ret    

01000bff <itoa>:
 1000bff:	55                   	push   ebp
 1000c00:	89 e5                	mov    ebp,esp
 1000c02:	83 ec 20             	sub    esp,0x20
 1000c05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000c08:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000c0b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000c0e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c11:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
 1000c18:	83 7d 0c 64          	cmp    DWORD PTR [ebp+0xc],0x64
 1000c1c:	75 20                	jne    1000c3e <itoa+0x3f>
 1000c1e:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1000c22:	79 1a                	jns    1000c3e <itoa+0x3f>
 1000c24:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c27:	8d 50 01             	lea    edx,[eax+0x1]
 1000c2a:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000c2d:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1000c30:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1000c34:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000c37:	f7 d8                	neg    eax
 1000c39:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c3c:	eb 0d                	jmp    1000c4b <itoa+0x4c>
 1000c3e:	83 7d 0c 78          	cmp    DWORD PTR [ebp+0xc],0x78
 1000c42:	75 07                	jne    1000c4b <itoa+0x4c>
 1000c44:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [ebp-0x14],0x10
 1000c4b:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000c4e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000c51:	ba 00 00 00 00       	mov    edx,0x0
 1000c56:	f7 f1                	div    ecx
 1000c58:	89 d0                	mov    eax,edx
 1000c5a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1000c5d:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
 1000c61:	7f 0a                	jg     1000c6d <itoa+0x6e>
 1000c63:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000c66:	83 c0 30             	add    eax,0x30
 1000c69:	89 c1                	mov    ecx,eax
 1000c6b:	eb 08                	jmp    1000c75 <itoa+0x76>
 1000c6d:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000c70:	83 c0 57             	add    eax,0x57
 1000c73:	89 c1                	mov    ecx,eax
 1000c75:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c78:	8d 50 01             	lea    edx,[eax+0x1]
 1000c7b:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000c7e:	88 08                	mov    BYTE PTR [eax],cl
 1000c80:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000c83:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000c86:	ba 00 00 00 00       	mov    edx,0x0
 1000c8b:	f7 f1                	div    ecx
 1000c8d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000c90:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1000c94:	75 b5                	jne    1000c4b <itoa+0x4c>
 1000c96:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000c99:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1000c9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000c9f:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000ca2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000ca5:	83 e8 01             	sub    eax,0x1
 1000ca8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000cab:	eb 25                	jmp    1000cd2 <itoa+0xd3>
 1000cad:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cb0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000cb3:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
 1000cb6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000cb9:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1000cbc:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cbf:	88 10                	mov    BYTE PTR [eax],dl
 1000cc1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000cc4:	0f b6 55 e7          	movzx  edx,BYTE PTR [ebp-0x19]
 1000cc8:	88 10                	mov    BYTE PTR [eax],dl
 1000cca:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000cce:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1000cd2:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000cd5:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 1000cd8:	72 d3                	jb     1000cad <itoa+0xae>
 1000cda:	90                   	nop
 1000cdb:	90                   	nop
 1000cdc:	c9                   	leave  
 1000cdd:	c3                   	ret    

01000cde <putchar>:
 1000cde:	55                   	push   ebp
 1000cdf:	89 e5                	mov    ebp,esp
 1000ce1:	83 7d 08 0a          	cmp    DWORD PTR [ebp+0x8],0xa
 1000ce5:	74 06                	je     1000ced <putchar+0xf>
 1000ce7:	83 7d 08 0d          	cmp    DWORD PTR [ebp+0x8],0xd
 1000ceb:	75 31                	jne    1000d1e <putchar+0x40>
 1000ced:	90                   	nop
 1000cee:	eb 01                	jmp    1000cf1 <putchar+0x13>
 1000cf0:	90                   	nop
 1000cf1:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 1000cf8:	00 00 00 
 1000cfb:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000d00:	83 c0 01             	add    eax,0x1
 1000d03:	a3 0c 00 40 00       	mov    ds:0x40000c,eax
 1000d08:	a1 0c 00 40 00       	mov    eax,ds:0x40000c
 1000d0d:	83 f8 17             	cmp    eax,0x17
 1000d10:	7e 7a                	jle    1000d8c <putchar+0xae>
 1000d12:	c7 05 0c 00 40 00 00 	mov    DWORD PTR ds:0x40000c,0x0
 1000d19:	00 00 00 
 1000d1c:	eb 6e                	jmp    1000d8c <putchar+0xae>
 1000d1e:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000d24:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000d2a:	89 d0                	mov    eax,edx
 1000d2c:	c1 e0 02             	shl    eax,0x2
 1000d2f:	01 d0                	add    eax,edx
 1000d31:	c1 e0 04             	shl    eax,0x4
 1000d34:	89 c2                	mov    edx,eax
 1000d36:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d3b:	01 d0                	add    eax,edx
 1000d3d:	01 c0                	add    eax,eax
 1000d3f:	01 c8                	add    eax,ecx
 1000d41:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1000d44:	88 10                	mov    BYTE PTR [eax],dl
 1000d46:	8b 0d 04 00 40 00    	mov    ecx,DWORD PTR ds:0x400004
 1000d4c:	8b 15 0c 00 40 00    	mov    edx,DWORD PTR ds:0x40000c
 1000d52:	89 d0                	mov    eax,edx
 1000d54:	c1 e0 02             	shl    eax,0x2
 1000d57:	01 d0                	add    eax,edx
 1000d59:	c1 e0 04             	shl    eax,0x4
 1000d5c:	89 c2                	mov    edx,eax
 1000d5e:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d63:	01 d0                	add    eax,edx
 1000d65:	01 c0                	add    eax,eax
 1000d67:	83 c0 01             	add    eax,0x1
 1000d6a:	01 c8                	add    eax,ecx
 1000d6c:	c6 00 07             	mov    BYTE PTR [eax],0x7
 1000d6f:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d74:	83 c0 01             	add    eax,0x1
 1000d77:	a3 08 00 40 00       	mov    ds:0x400008,eax
 1000d7c:	a1 08 00 40 00       	mov    eax,ds:0x400008
 1000d81:	83 f8 4f             	cmp    eax,0x4f
 1000d84:	0f 8f 66 ff ff ff    	jg     1000cf0 <putchar+0x12>
 1000d8a:	eb 01                	jmp    1000d8d <putchar+0xaf>
 1000d8c:	90                   	nop
 1000d8d:	5d                   	pop    ebp
 1000d8e:	c3                   	ret    

01000d8f <printf>:
 1000d8f:	55                   	push   ebp
 1000d90:	89 e5                	mov    ebp,esp
 1000d92:	83 ec 20             	sub    esp,0x20
 1000d95:	8d 45 08             	lea    eax,[ebp+0x8]
 1000d98:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1000d9b:	83 45 fc 04          	add    DWORD PTR [ebp-0x4],0x4
 1000d9f:	e9 ce 00 00 00       	jmp    1000e72 <printf+0xe3>
 1000da4:	83 7d f4 25          	cmp    DWORD PTR [ebp-0xc],0x25
 1000da8:	74 10                	je     1000dba <printf+0x2b>
 1000daa:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000dad:	e8 2c ff ff ff       	call   1000cde <putchar>
 1000db2:	83 c4 04             	add    esp,0x4
 1000db5:	e9 b8 00 00 00       	jmp    1000e72 <printf+0xe3>
 1000dba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000dbd:	8d 50 01             	lea    edx,[eax+0x1]
 1000dc0:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000dc3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000dc6:	0f be c0             	movsx  eax,al
 1000dc9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000dcc:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000dd0:	74 24                	je     1000df6 <printf+0x67>
 1000dd2:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000dd6:	0f 8f 81 00 00 00    	jg     1000e5d <printf+0xce>
 1000ddc:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000de0:	74 14                	je     1000df6 <printf+0x67>
 1000de2:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000de6:	7f 75                	jg     1000e5d <printf+0xce>
 1000de8:	83 7d f4 64          	cmp    DWORD PTR [ebp-0xc],0x64
 1000dec:	74 08                	je     1000df6 <printf+0x67>
 1000dee:	83 7d f4 73          	cmp    DWORD PTR [ebp-0xc],0x73
 1000df2:	74 25                	je     1000e19 <printf+0x8a>
 1000df4:	eb 67                	jmp    1000e5d <printf+0xce>
 1000df6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000df9:	8d 50 04             	lea    edx,[eax+0x4]
 1000dfc:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000dff:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e01:	50                   	push   eax
 1000e02:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1000e05:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000e08:	50                   	push   eax
 1000e09:	e8 f1 fd ff ff       	call   1000bff <itoa>
 1000e0e:	83 c4 0c             	add    esp,0xc
 1000e11:	8d 45 e0             	lea    eax,[ebp-0x20]
 1000e14:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000e17:	eb 1e                	jmp    1000e37 <printf+0xa8>
 1000e19:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000e1c:	8d 50 04             	lea    edx,[eax+0x4]
 1000e1f:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000e22:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e24:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000e27:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1000e2b:	75 09                	jne    1000e36 <printf+0xa7>
 1000e2d:	c7 45 f8 d4 71 00 01 	mov    DWORD PTR [ebp-0x8],0x10071d4
 1000e34:	eb 1b                	jmp    1000e51 <printf+0xc2>
 1000e36:	90                   	nop
 1000e37:	eb 18                	jmp    1000e51 <printf+0xc2>
 1000e39:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e3c:	8d 50 01             	lea    edx,[eax+0x1]
 1000e3f:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 1000e42:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e45:	0f be c0             	movsx  eax,al
 1000e48:	50                   	push   eax
 1000e49:	e8 90 fe ff ff       	call   1000cde <putchar>
 1000e4e:	83 c4 04             	add    esp,0x4
 1000e51:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000e54:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e57:	84 c0                	test   al,al
 1000e59:	75 de                	jne    1000e39 <printf+0xaa>
 1000e5b:	eb 15                	jmp    1000e72 <printf+0xe3>
 1000e5d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000e60:	8d 50 04             	lea    edx,[eax+0x4]
 1000e63:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000e66:	8b 00                	mov    eax,DWORD PTR [eax]
 1000e68:	50                   	push   eax
 1000e69:	e8 70 fe ff ff       	call   1000cde <putchar>
 1000e6e:	83 c4 04             	add    esp,0x4
 1000e71:	90                   	nop
 1000e72:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000e75:	8d 50 01             	lea    edx,[eax+0x1]
 1000e78:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000e7b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000e7e:	0f be c0             	movsx  eax,al
 1000e81:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000e84:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1000e88:	0f 85 16 ff ff ff    	jne    1000da4 <printf+0x15>
 1000e8e:	90                   	nop
 1000e8f:	90                   	nop
 1000e90:	c9                   	leave  
 1000e91:	c3                   	ret    

01000e92 <set_high_mem_base>:
 1000e92:	55                   	push   ebp
 1000e93:	89 e5                	mov    ebp,esp
 1000e95:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000e98:	a3 6c 6d 00 01       	mov    ds:0x1006d6c,eax
 1000e9d:	90                   	nop
 1000e9e:	5d                   	pop    ebp
 1000e9f:	c3                   	ret    

01000ea0 <set_mem_area>:
 1000ea0:	55                   	push   ebp
 1000ea1:	89 e5                	mov    ebp,esp
 1000ea3:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000ea9:	89 d0                	mov    eax,edx
 1000eab:	01 c0                	add    eax,eax
 1000ead:	01 d0                	add    eax,edx
 1000eaf:	c1 e0 02             	shl    eax,0x2
 1000eb2:	8d 90 40 01 40 00    	lea    edx,[eax+0x400140]
 1000eb8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000ebb:	89 02                	mov    DWORD PTR [edx],eax
 1000ebd:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000ec3:	89 d0                	mov    eax,edx
 1000ec5:	01 c0                	add    eax,eax
 1000ec7:	01 d0                	add    eax,edx
 1000ec9:	c1 e0 02             	shl    eax,0x2
 1000ecc:	8d 90 44 01 40 00    	lea    edx,[eax+0x400144]
 1000ed2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1000ed5:	89 02                	mov    DWORD PTR [edx],eax
 1000ed7:	8b 15 30 02 40 00    	mov    edx,DWORD PTR ds:0x400230
 1000edd:	8d 42 01             	lea    eax,[edx+0x1]
 1000ee0:	a3 30 02 40 00       	mov    ds:0x400230,eax
 1000ee5:	89 d0                	mov    eax,edx
 1000ee7:	01 c0                	add    eax,eax
 1000ee9:	01 d0                	add    eax,edx
 1000eeb:	c1 e0 02             	shl    eax,0x2
 1000eee:	8d 90 48 01 40 00    	lea    edx,[eax+0x400148]
 1000ef4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1000ef7:	89 02                	mov    DWORD PTR [edx],eax
 1000ef9:	90                   	nop
 1000efa:	5d                   	pop    ebp
 1000efb:	c3                   	ret    

01000efc <vmalloc>:
 1000efc:	55                   	push   ebp
 1000efd:	89 e5                	mov    ebp,esp
 1000eff:	53                   	push   ebx
 1000f00:	83 ec 10             	sub    esp,0x10
 1000f03:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1000f0a:	eb 6e                	jmp    1000f7a <vmalloc+0x7e>
 1000f0c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1000f13:	eb 5b                	jmp    1000f70 <vmalloc+0x74>
 1000f15:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f18:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000f1f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f22:	bb 01 00 00 00       	mov    ebx,0x1
 1000f27:	89 c1                	mov    ecx,eax
 1000f29:	d3 e3                	shl    ebx,cl
 1000f2b:	89 d8                	mov    eax,ebx
 1000f2d:	21 d0                	and    eax,edx
 1000f2f:	85 c0                	test   eax,eax
 1000f31:	75 39                	jne    1000f6c <vmalloc+0x70>
 1000f33:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f36:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000f3d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f40:	bb 01 00 00 00       	mov    ebx,0x1
 1000f45:	89 c1                	mov    ecx,eax
 1000f47:	d3 e3                	shl    ebx,cl
 1000f49:	89 d8                	mov    eax,ebx
 1000f4b:	09 c2                	or     edx,eax
 1000f4d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f50:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000f57:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000f5a:	c1 e0 05             	shl    eax,0x5
 1000f5d:	89 c2                	mov    edx,eax
 1000f5f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000f62:	01 d0                	add    eax,edx
 1000f64:	83 c0 20             	add    eax,0x20
 1000f67:	c1 e0 0c             	shl    eax,0xc
 1000f6a:	eb 14                	jmp    1000f80 <vmalloc+0x84>
 1000f6c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1000f70:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 1000f74:	7e 9f                	jle    1000f15 <vmalloc+0x19>
 1000f76:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 1000f7a:	83 7d f8 03          	cmp    DWORD PTR [ebp-0x8],0x3
 1000f7e:	7e 8c                	jle    1000f0c <vmalloc+0x10>
 1000f80:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000f83:	c9                   	leave  
 1000f84:	c3                   	ret    

01000f85 <vmfree>:
 1000f85:	55                   	push   ebp
 1000f86:	89 e5                	mov    ebp,esp
 1000f88:	53                   	push   ebx
 1000f89:	83 ec 10             	sub    esp,0x10
 1000f8c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000f8f:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1000f95:	85 c0                	test   eax,eax
 1000f97:	0f 48 c2             	cmovs  eax,edx
 1000f9a:	c1 f8 0c             	sar    eax,0xc
 1000f9d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000fa0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000fa3:	8d 50 1f             	lea    edx,[eax+0x1f]
 1000fa6:	85 c0                	test   eax,eax
 1000fa8:	0f 48 c2             	cmovs  eax,edx
 1000fab:	c1 f8 05             	sar    eax,0x5
 1000fae:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000fb1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000fb4:	99                   	cdq    
 1000fb5:	c1 ea 1b             	shr    edx,0x1b
 1000fb8:	01 d0                	add    eax,edx
 1000fba:	83 e0 1f             	and    eax,0x1f
 1000fbd:	29 d0                	sub    eax,edx
 1000fbf:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000fc2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000fc5:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [eax*4+0x400120]
 1000fcc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000fcf:	bb 01 00 00 00       	mov    ebx,0x1
 1000fd4:	89 c1                	mov    ecx,eax
 1000fd6:	d3 e3                	shl    ebx,cl
 1000fd8:	89 d8                	mov    eax,ebx
 1000fda:	f7 d0                	not    eax
 1000fdc:	21 c2                	and    edx,eax
 1000fde:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000fe1:	89 14 85 20 01 40 00 	mov    DWORD PTR [eax*4+0x400120],edx
 1000fe8:	90                   	nop
 1000fe9:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1000fec:	c9                   	leave  
 1000fed:	c3                   	ret    

01000fee <page_err>:
 1000fee:	55                   	push   ebp
 1000fef:	89 e5                	mov    ebp,esp
 1000ff1:	53                   	push   ebx
 1000ff2:	83 ec 24             	sub    esp,0x24
 1000ff5:	fa                   	cli    
 1000ff6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1000ffd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1001004:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
 1001007:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100100a:	0f 20 d0             	mov    eax,cr2
 100100d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1001010:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001013:	83 e0 01             	and    eax,0x1
 1001016:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1001019:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 100101d:	0f 85 b7 00 00 00    	jne    10010da <page_err+0xec>
 1001023:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100102a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001031:	0f 20 d8             	mov    eax,cr3
 1001034:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001037:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100103a:	c1 e8 16             	shr    eax,0x16
 100103d:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001044:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001047:	01 d0                	add    eax,edx
 1001049:	8b 00                	mov    eax,DWORD PTR [eax]
 100104b:	83 e0 01             	and    eax,0x1
 100104e:	85 c0                	test   eax,eax
 1001050:	75 24                	jne    1001076 <page_err+0x88>
 1001052:	e8 a5 fe ff ff       	call   1000efc <vmalloc>
 1001057:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100105a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 100105d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1001060:	c1 e8 16             	shr    eax,0x16
 1001063:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 100106a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100106d:	01 c8                	add    eax,ecx
 100106f:	83 ca 05             	or     edx,0x5
 1001072:	89 10                	mov    DWORD PTR [eax],edx
 1001074:	eb 1c                	jmp    1001092 <page_err+0xa4>
 1001076:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1001079:	c1 e8 16             	shr    eax,0x16
 100107c:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001083:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001086:	01 d0                	add    eax,edx
 1001088:	8b 00                	mov    eax,DWORD PTR [eax]
 100108a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100108f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001092:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1001095:	25 ff ff 3f 00       	and    eax,0x3fffff
 100109a:	c1 e8 0c             	shr    eax,0xc
 100109d:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10010a0:	e8 71 00 00 00       	call   1001116 <req_a_page>
 10010a5:	83 ec 0c             	sub    esp,0xc
 10010a8:	50                   	push   eax
 10010a9:	e8 c5 01 00 00       	call   1001273 <get_phyaddr>
 10010ae:	83 c4 10             	add    esp,0x10
 10010b1:	83 c8 05             	or     eax,0x5
 10010b4:	89 c1                	mov    ecx,eax
 10010b6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10010b9:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10010c0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010c3:	01 d0                	add    eax,edx
 10010c5:	8b 10                	mov    edx,DWORD PTR [eax]
 10010c7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10010ca:	8d 1c 85 00 00 00 00 	lea    ebx,[eax*4+0x0]
 10010d1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10010d4:	01 d8                	add    eax,ebx
 10010d6:	09 ca                	or     edx,ecx
 10010d8:	89 10                	mov    DWORD PTR [eax],edx
 10010da:	e8 4a 1f 00 00       	call   1003029 <eoi>
 10010df:	fb                   	sti    
 10010e0:	c9                   	leave  
 10010e1:	83 c4 04             	add    esp,0x4
 10010e4:	cf                   	iret   
 10010e5:	90                   	nop
 10010e6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 10010e9:	c9                   	leave  
 10010ea:	c3                   	ret    

010010eb <init_memory>:
 10010eb:	55                   	push   ebp
 10010ec:	89 e5                	mov    ebp,esp
 10010ee:	83 ec 10             	sub    esp,0x10
 10010f1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10010f8:	eb 12                	jmp    100110c <init_memory+0x21>
 10010fa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10010fd:	c7 04 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],0xffffffff
 1001104:	ff ff ff ff 
 1001108:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100110c:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
 1001110:	7e e8                	jle    10010fa <init_memory+0xf>
 1001112:	90                   	nop
 1001113:	90                   	nop
 1001114:	c9                   	leave  
 1001115:	c3                   	ret    

01001116 <req_a_page>:
 1001116:	55                   	push   ebp
 1001117:	89 e5                	mov    ebp,esp
 1001119:	53                   	push   ebx
 100111a:	83 ec 10             	sub    esp,0x10
 100111d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1001124:	e9 84 00 00 00       	jmp    10011ad <req_a_page+0x97>
 1001129:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001130:	eb 71                	jmp    10011a3 <req_a_page+0x8d>
 1001132:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001135:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 100113c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100113f:	bb 01 00 00 00       	mov    ebx,0x1
 1001144:	89 c1                	mov    ecx,eax
 1001146:	d3 e3                	shl    ebx,cl
 1001148:	89 d8                	mov    eax,ebx
 100114a:	21 d0                	and    eax,edx
 100114c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100114f:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001152:	c1 e0 05             	shl    eax,0x5
 1001155:	89 c2                	mov    edx,eax
 1001157:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100115a:	01 d0                	add    eax,edx
 100115c:	c1 e0 0c             	shl    eax,0xc
 100115f:	3d ff ff 0f 00       	cmp    eax,0xfffff
 1001164:	7e 39                	jle    100119f <req_a_page+0x89>
 1001166:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 100116a:	75 33                	jne    100119f <req_a_page+0x89>
 100116c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100116f:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001176:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001179:	bb 01 00 00 00       	mov    ebx,0x1
 100117e:	89 c1                	mov    ecx,eax
 1001180:	d3 e3                	shl    ebx,cl
 1001182:	89 d8                	mov    eax,ebx
 1001184:	09 c2                	or     edx,eax
 1001186:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001189:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 1001190:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001193:	c1 e0 05             	shl    eax,0x5
 1001196:	89 c2                	mov    edx,eax
 1001198:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100119b:	01 d0                	add    eax,edx
 100119d:	eb 18                	jmp    10011b7 <req_a_page+0xa1>
 100119f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10011a3:	83 7d f4 1f          	cmp    DWORD PTR [ebp-0xc],0x1f
 10011a7:	7e 89                	jle    1001132 <req_a_page+0x1c>
 10011a9:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 10011ad:	83 7d f8 3f          	cmp    DWORD PTR [ebp-0x8],0x3f
 10011b1:	0f 8e 72 ff ff ff    	jle    1001129 <req_a_page+0x13>
 10011b7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 10011ba:	c9                   	leave  
 10011bb:	c3                   	ret    

010011bc <free_page>:
 10011bc:	55                   	push   ebp
 10011bd:	89 e5                	mov    ebp,esp
 10011bf:	53                   	push   ebx
 10011c0:	83 ec 10             	sub    esp,0x10
 10011c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10011c6:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10011cc:	85 c0                	test   eax,eax
 10011ce:	0f 48 c2             	cmovs  eax,edx
 10011d1:	c1 f8 0c             	sar    eax,0xc
 10011d4:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10011d7:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10011da:	8d 50 1f             	lea    edx,[eax+0x1f]
 10011dd:	85 c0                	test   eax,eax
 10011df:	0f 48 c2             	cmovs  eax,edx
 10011e2:	c1 f8 05             	sar    eax,0x5
 10011e5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10011e8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10011eb:	99                   	cdq    
 10011ec:	c1 ea 1b             	shr    edx,0x1b
 10011ef:	01 d0                	add    eax,edx
 10011f1:	83 e0 1f             	and    eax,0x1f
 10011f4:	29 d0                	sub    eax,edx
 10011f6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10011f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10011fc:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001203:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001206:	bb 01 00 00 00       	mov    ebx,0x1
 100120b:	89 c1                	mov    ecx,eax
 100120d:	d3 e3                	shl    ebx,cl
 100120f:	89 d8                	mov    eax,ebx
 1001211:	f7 d0                	not    eax
 1001213:	21 c2                	and    edx,eax
 1001215:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001218:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 100121f:	90                   	nop
 1001220:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001223:	c9                   	leave  
 1001224:	c3                   	ret    

01001225 <check_page>:
 1001225:	55                   	push   ebp
 1001226:	89 e5                	mov    ebp,esp
 1001228:	53                   	push   ebx
 1001229:	83 ec 10             	sub    esp,0x10
 100122c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100122f:	8d 50 1f             	lea    edx,[eax+0x1f]
 1001232:	85 c0                	test   eax,eax
 1001234:	0f 48 c2             	cmovs  eax,edx
 1001237:	c1 f8 05             	sar    eax,0x5
 100123a:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 100123d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001240:	99                   	cdq    
 1001241:	c1 ea 1b             	shr    edx,0x1b
 1001244:	01 d0                	add    eax,edx
 1001246:	83 e0 1f             	and    eax,0x1f
 1001249:	29 d0                	sub    eax,edx
 100124b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100124e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1001251:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001258:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100125b:	bb 01 00 00 00       	mov    ebx,0x1
 1001260:	89 c1                	mov    ecx,eax
 1001262:	d3 e3                	shl    ebx,cl
 1001264:	89 d8                	mov    eax,ebx
 1001266:	21 d0                	and    eax,edx
 1001268:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100126b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100126e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001271:	c9                   	leave  
 1001272:	c3                   	ret    

01001273 <get_phyaddr>:
 1001273:	55                   	push   ebp
 1001274:	89 e5                	mov    ebp,esp
 1001276:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001279:	c1 e0 0c             	shl    eax,0xc
 100127c:	5d                   	pop    ebp
 100127d:	c3                   	ret    

0100127e <set_page_item>:
 100127e:	55                   	push   ebp
 100127f:	89 e5                	mov    ebp,esp
 1001281:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001284:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100128a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100128d:	8b 10                	mov    edx,DWORD PTR [eax]
 100128f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001292:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001297:	09 c2                	or     edx,eax
 1001299:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100129c:	89 10                	mov    DWORD PTR [eax],edx
 100129e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012a1:	8b 10                	mov    edx,DWORD PTR [eax]
 10012a3:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10012a6:	09 c2                	or     edx,eax
 10012a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012ab:	89 10                	mov    DWORD PTR [eax],edx
 10012ad:	90                   	nop
 10012ae:	5d                   	pop    ebp
 10012af:	c3                   	ret    

010012b0 <req_page_at>:
 10012b0:	55                   	push   ebp
 10012b1:	89 e5                	mov    ebp,esp
 10012b3:	53                   	push   ebx
 10012b4:	83 ec 14             	sub    esp,0x14
 10012b7:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 10012bb:	75 13                	jne    10012d0 <req_page_at+0x20>
 10012bd:	e8 54 fe ff ff       	call   1001116 <req_a_page>
 10012c2:	50                   	push   eax
 10012c3:	e8 ab ff ff ff       	call   1001273 <get_phyaddr>
 10012c8:	83 c4 04             	add    esp,0x4
 10012cb:	e9 90 00 00 00       	jmp    1001360 <req_page_at+0xb0>
 10012d0:	83 ec 08             	sub    esp,0x8
 10012d3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10012d6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10012d9:	e8 28 01 00 00       	call   1001406 <is_pgs_ava>
 10012de:	83 c4 10             	add    esp,0x10
 10012e1:	85 c0                	test   eax,eax
 10012e3:	75 07                	jne    10012ec <req_page_at+0x3c>
 10012e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10012ea:	eb 74                	jmp    1001360 <req_page_at+0xb0>
 10012ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10012ef:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10012f5:	85 c0                	test   eax,eax
 10012f7:	0f 48 c2             	cmovs  eax,edx
 10012fa:	c1 f8 0c             	sar    eax,0xc
 10012fd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1001300:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001303:	8d 50 1f             	lea    edx,[eax+0x1f]
 1001306:	85 c0                	test   eax,eax
 1001308:	0f 48 c2             	cmovs  eax,edx
 100130b:	c1 f8 05             	sar    eax,0x5
 100130e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1001311:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001314:	99                   	cdq    
 1001315:	c1 ea 1b             	shr    edx,0x1b
 1001318:	01 d0                	add    eax,edx
 100131a:	83 e0 1f             	and    eax,0x1f
 100131d:	29 d0                	sub    eax,edx
 100131f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1001322:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001329:	eb 28                	jmp    1001353 <req_page_at+0xa3>
 100132b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100132e:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [eax*4+0x400020]
 1001335:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1001338:	bb 01 00 00 00       	mov    ebx,0x1
 100133d:	89 c1                	mov    ecx,eax
 100133f:	d3 e3                	shl    ebx,cl
 1001341:	89 d8                	mov    eax,ebx
 1001343:	09 c2                	or     edx,eax
 1001345:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001348:	89 14 85 20 00 40 00 	mov    DWORD PTR [eax*4+0x400020],edx
 100134f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001353:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001356:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 1001359:	7c d0                	jl     100132b <req_page_at+0x7b>
 100135b:	b8 00 00 00 00       	mov    eax,0x0
 1001360:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1001363:	c9                   	leave  
 1001364:	c3                   	ret    

01001365 <chk_vm>:
 1001365:	55                   	push   ebp
 1001366:	89 e5                	mov    ebp,esp
 1001368:	83 ec 10             	sub    esp,0x10
 100136b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001372:	0f 20 d8             	mov    eax,cr3
 1001375:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1001378:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100137b:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 1001381:	85 c0                	test   eax,eax
 1001383:	0f 48 c2             	cmovs  eax,edx
 1001386:	c1 f8 16             	sar    eax,0x16
 1001389:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1001390:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001393:	01 d0                	add    eax,edx
 1001395:	8b 00                	mov    eax,DWORD PTR [eax]
 1001397:	25 00 f0 ff ff       	and    eax,0xfffff000
 100139c:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 100139f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10013a2:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 10013a8:	85 c0                	test   eax,eax
 10013aa:	0f 48 c2             	cmovs  eax,edx
 10013ad:	c1 f8 16             	sar    eax,0x16
 10013b0:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10013b7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10013ba:	01 d0                	add    eax,edx
 10013bc:	8b 00                	mov    eax,DWORD PTR [eax]
 10013be:	83 e0 01             	and    eax,0x1
 10013c1:	85 c0                	test   eax,eax
 10013c3:	74 33                	je     10013f8 <chk_vm+0x93>
 10013c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10013c8:	99                   	cdq    
 10013c9:	c1 ea 0a             	shr    edx,0xa
 10013cc:	01 d0                	add    eax,edx
 10013ce:	25 ff ff 3f 00       	and    eax,0x3fffff
 10013d3:	29 d0                	sub    eax,edx
 10013d5:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10013db:	85 c0                	test   eax,eax
 10013dd:	0f 48 c2             	cmovs  eax,edx
 10013e0:	c1 f8 0c             	sar    eax,0xc
 10013e3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10013ea:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10013ed:	01 d0                	add    eax,edx
 10013ef:	8b 00                	mov    eax,DWORD PTR [eax]
 10013f1:	83 e0 01             	and    eax,0x1
 10013f4:	85 c0                	test   eax,eax
 10013f6:	75 07                	jne    10013ff <chk_vm+0x9a>
 10013f8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10013fd:	eb 05                	jmp    1001404 <chk_vm+0x9f>
 10013ff:	b8 00 00 00 00       	mov    eax,0x0
 1001404:	c9                   	leave  
 1001405:	c3                   	ret    

01001406 <is_pgs_ava>:
 1001406:	55                   	push   ebp
 1001407:	89 e5                	mov    ebp,esp
 1001409:	83 ec 10             	sub    esp,0x10
 100140c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100140f:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1001415:	85 c0                	test   eax,eax
 1001417:	0f 48 c2             	cmovs  eax,edx
 100141a:	c1 f8 0c             	sar    eax,0xc
 100141d:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1001420:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001427:	eb 20                	jmp    1001449 <is_pgs_ava+0x43>
 1001429:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
 100142c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100142f:	01 d0                	add    eax,edx
 1001431:	50                   	push   eax
 1001432:	e8 ee fd ff ff       	call   1001225 <check_page>
 1001437:	83 c4 04             	add    esp,0x4
 100143a:	85 c0                	test   eax,eax
 100143c:	74 07                	je     1001445 <is_pgs_ava+0x3f>
 100143e:	b8 00 00 00 00       	mov    eax,0x0
 1001443:	eb 11                	jmp    1001456 <is_pgs_ava+0x50>
 1001445:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001449:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100144c:	3b 45 0c             	cmp    eax,DWORD PTR [ebp+0xc]
 100144f:	7c d8                	jl     1001429 <is_pgs_ava+0x23>
 1001451:	b8 01 00 00 00       	mov    eax,0x1
 1001456:	c9                   	leave  
 1001457:	c3                   	ret    

01001458 <setup_sys_vol>:
 1001458:	55                   	push   ebp
 1001459:	89 e5                	mov    ebp,esp
 100145b:	c6 05 40 02 40 00 43 	mov    BYTE PTR ds:0x400240,0x43
 1001462:	c6 05 41 02 40 00 00 	mov    BYTE PTR ds:0x400241,0x0
 1001469:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100146c:	a3 48 02 40 00       	mov    ds:0x400248,eax
 1001471:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001474:	a3 4c 02 40 00       	mov    ds:0x40024c,eax
 1001479:	c7 05 50 02 40 00 01 	mov    DWORD PTR ds:0x400250,0x1
 1001480:	00 00 00 
 1001483:	b8 00 00 00 00       	mov    eax,0x0
 1001488:	5d                   	pop    ebp
 1001489:	c3                   	ret    

0100148a <sys_mkfifo>:
 100148a:	55                   	push   ebp
 100148b:	89 e5                	mov    ebp,esp
 100148d:	83 ec 18             	sub    esp,0x18
 1001490:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001497:	eb 30                	jmp    10014c9 <sys_mkfifo+0x3f>
 1001499:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100149c:	c1 e0 04             	shl    eax,0x4
 100149f:	05 6c 16 40 00       	add    eax,0x40166c
 10014a4:	8b 00                	mov    eax,DWORD PTR [eax]
 10014a6:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 10014a9:	75 1a                	jne    10014c5 <sys_mkfifo+0x3b>
 10014ab:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10014ae:	c1 e0 04             	shl    eax,0x4
 10014b1:	05 68 16 40 00       	add    eax,0x401668
 10014b6:	8b 00                	mov    eax,DWORD PTR [eax]
 10014b8:	83 f8 01             	cmp    eax,0x1
 10014bb:	75 08                	jne    10014c5 <sys_mkfifo+0x3b>
 10014bd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10014c0:	e9 8a 00 00 00       	jmp    100154f <sys_mkfifo+0xc5>
 10014c5:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10014c9:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 10014cd:	7e ca                	jle    1001499 <sys_mkfifo+0xf>
 10014cf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10014d6:	eb 6c                	jmp    1001544 <sys_mkfifo+0xba>
 10014d8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10014db:	c1 e0 04             	shl    eax,0x4
 10014de:	05 68 16 40 00       	add    eax,0x401668
 10014e3:	8b 00                	mov    eax,DWORD PTR [eax]
 10014e5:	85 c0                	test   eax,eax
 10014e7:	75 57                	jne    1001540 <sys_mkfifo+0xb6>
 10014e9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10014ec:	c1 e0 04             	shl    eax,0x4
 10014ef:	05 68 16 40 00       	add    eax,0x401668
 10014f4:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 10014fa:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10014fd:	c1 e0 04             	shl    eax,0x4
 1001500:	8d 90 6c 16 40 00    	lea    edx,[eax+0x40166c]
 1001506:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001509:	89 02                	mov    DWORD PTR [edx],eax
 100150b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100150e:	c1 e0 04             	shl    eax,0x4
 1001511:	05 64 16 40 00       	add    eax,0x401664
 1001516:	c7 00 00 10 00 00    	mov    DWORD PTR [eax],0x1000
 100151c:	e8 f5 fb ff ff       	call   1001116 <req_a_page>
 1001521:	83 ec 0c             	sub    esp,0xc
 1001524:	50                   	push   eax
 1001525:	e8 49 fd ff ff       	call   1001273 <get_phyaddr>
 100152a:	83 c4 10             	add    esp,0x10
 100152d:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001530:	c1 e2 04             	shl    edx,0x4
 1001533:	81 c2 60 16 40 00    	add    edx,0x401660
 1001539:	89 02                	mov    DWORD PTR [edx],eax
 100153b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100153e:	eb 0f                	jmp    100154f <sys_mkfifo+0xc5>
 1001540:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001544:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 1001548:	7e 8e                	jle    10014d8 <sys_mkfifo+0x4e>
 100154a:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100154f:	c9                   	leave  
 1001550:	c3                   	ret    

01001551 <sys_rmfifo>:
 1001551:	55                   	push   ebp
 1001552:	89 e5                	mov    ebp,esp
 1001554:	83 ec 10             	sub    esp,0x10
 1001557:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100155e:	eb 3e                	jmp    100159e <sys_rmfifo+0x4d>
 1001560:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001563:	c1 e0 04             	shl    eax,0x4
 1001566:	05 6c 16 40 00       	add    eax,0x40166c
 100156b:	8b 00                	mov    eax,DWORD PTR [eax]
 100156d:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001570:	75 28                	jne    100159a <sys_rmfifo+0x49>
 1001572:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001575:	c1 e0 04             	shl    eax,0x4
 1001578:	05 68 16 40 00       	add    eax,0x401668
 100157d:	8b 00                	mov    eax,DWORD PTR [eax]
 100157f:	83 f8 01             	cmp    eax,0x1
 1001582:	75 16                	jne    100159a <sys_rmfifo+0x49>
 1001584:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001587:	c1 e0 04             	shl    eax,0x4
 100158a:	05 68 16 40 00       	add    eax,0x401668
 100158f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1001595:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001598:	eb 0f                	jmp    10015a9 <sys_rmfifo+0x58>
 100159a:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100159e:	83 7d fc 0f          	cmp    DWORD PTR [ebp-0x4],0xf
 10015a2:	7e bc                	jle    1001560 <sys_rmfifo+0xf>
 10015a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10015a9:	c9                   	leave  
 10015aa:	c3                   	ret    

010015ab <free_vol>:
 10015ab:	55                   	push   ebp
 10015ac:	89 e5                	mov    ebp,esp
 10015ae:	c7 05 50 02 40 00 00 	mov    DWORD PTR ds:0x400250,0x0
 10015b5:	00 00 00 
 10015b8:	b8 00 00 00 00       	mov    eax,0x0
 10015bd:	5d                   	pop    ebp
 10015be:	c3                   	ret    

010015bf <reg_vol>:
 10015bf:	55                   	push   ebp
 10015c0:	89 e5                	mov    ebp,esp
 10015c2:	83 ec 18             	sub    esp,0x18
 10015c5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10015cc:	e9 a6 00 00 00       	jmp    1001677 <reg_vol+0xb8>
 10015d1:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10015d4:	89 d0                	mov    eax,edx
 10015d6:	c1 e0 02             	shl    eax,0x2
 10015d9:	01 d0                	add    eax,edx
 10015db:	c1 e0 02             	shl    eax,0x2
 10015de:	05 50 02 40 00       	add    eax,0x400250
 10015e3:	8b 00                	mov    eax,DWORD PTR [eax]
 10015e5:	85 c0                	test   eax,eax
 10015e7:	0f 85 86 00 00 00    	jne    1001673 <reg_vol+0xb4>
 10015ed:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10015f0:	89 d0                	mov    eax,edx
 10015f2:	c1 e0 02             	shl    eax,0x2
 10015f5:	01 d0                	add    eax,edx
 10015f7:	c1 e0 02             	shl    eax,0x2
 10015fa:	05 50 02 40 00       	add    eax,0x400250
 10015ff:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001605:	83 ec 0c             	sub    esp,0xc
 1001608:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100160b:	e8 a2 0b 00 00       	call   10021b2 <get_drv>
 1001610:	83 c4 10             	add    esp,0x10
 1001613:	89 c2                	mov    edx,eax
 1001615:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 1001618:	89 c8                	mov    eax,ecx
 100161a:	c1 e0 02             	shl    eax,0x2
 100161d:	01 c8                	add    eax,ecx
 100161f:	c1 e0 02             	shl    eax,0x2
 1001622:	05 4c 02 40 00       	add    eax,0x40024c
 1001627:	89 10                	mov    DWORD PTR [eax],edx
 1001629:	83 ec 0c             	sub    esp,0xc
 100162c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100162f:	e8 7e 0b 00 00       	call   10021b2 <get_drv>
 1001634:	83 c4 10             	add    esp,0x10
 1001637:	89 c2                	mov    edx,eax
 1001639:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 100163c:	89 c8                	mov    eax,ecx
 100163e:	c1 e0 02             	shl    eax,0x2
 1001641:	01 c8                	add    eax,ecx
 1001643:	c1 e0 02             	shl    eax,0x2
 1001646:	05 48 02 40 00       	add    eax,0x400248
 100164b:	89 10                	mov    DWORD PTR [eax],edx
 100164d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001650:	89 d0                	mov    eax,edx
 1001652:	c1 e0 02             	shl    eax,0x2
 1001655:	01 d0                	add    eax,edx
 1001657:	c1 e0 02             	shl    eax,0x2
 100165a:	05 40 02 40 00       	add    eax,0x400240
 100165f:	83 ec 08             	sub    esp,0x8
 1001662:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001665:	50                   	push   eax
 1001666:	e8 dc 50 00 00       	call   1006747 <strcpy>
 100166b:	83 c4 10             	add    esp,0x10
 100166e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001671:	eb 13                	jmp    1001686 <reg_vol+0xc7>
 1001673:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001677:	83 7d f4 19          	cmp    DWORD PTR [ebp-0xc],0x19
 100167b:	0f 8e 50 ff ff ff    	jle    10015d1 <reg_vol+0x12>
 1001681:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001686:	c9                   	leave  
 1001687:	c3                   	ret    

01001688 <sys_open>:
 1001688:	55                   	push   ebp
 1001689:	89 e5                	mov    ebp,esp
 100168b:	57                   	push   edi
 100168c:	56                   	push   esi
 100168d:	53                   	push   ebx
 100168e:	81 ec fc 00 00 00    	sub    esp,0xfc
 1001694:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 100169b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 10016a2:	eb 19                	jmp    10016bd <sys_open+0x35>
 10016a4:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016aa:	01 d0                	add    eax,edx
 10016ac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016af:	8d 4d be             	lea    ecx,[ebp-0x42]
 10016b2:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016b5:	01 ca                	add    edx,ecx
 10016b7:	88 02                	mov    BYTE PTR [edx],al
 10016b9:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10016bd:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10016c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016c3:	01 d0                	add    eax,edx
 10016c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016c8:	3c 2f                	cmp    al,0x2f
 10016ca:	74 06                	je     10016d2 <sys_open+0x4a>
 10016cc:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 10016d0:	7e d2                	jle    10016a4 <sys_open+0x1c>
 10016d2:	8d 55 be             	lea    edx,[ebp-0x42]
 10016d5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016d8:	01 d0                	add    eax,edx
 10016da:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10016dd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016e0:	8d 50 01             	lea    edx,[eax+0x1]
 10016e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10016e6:	01 d0                	add    eax,edx
 10016e8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10016eb:	84 c0                	test   al,al
 10016ed:	75 0a                	jne    10016f9 <sys_open+0x71>
 10016ef:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 10016f4:	e9 6f 02 00 00       	jmp    1001968 <sys_open+0x2e0>
 10016f9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10016fc:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10016ff:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001706:	eb 43                	jmp    100174b <sys_open+0xc3>
 1001708:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100170b:	89 d0                	mov    eax,edx
 100170d:	c1 e0 02             	shl    eax,0x2
 1001710:	01 d0                	add    eax,edx
 1001712:	c1 e0 02             	shl    eax,0x2
 1001715:	05 50 02 40 00       	add    eax,0x400250
 100171a:	8b 00                	mov    eax,DWORD PTR [eax]
 100171c:	85 c0                	test   eax,eax
 100171e:	74 27                	je     1001747 <sys_open+0xbf>
 1001720:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001723:	89 d0                	mov    eax,edx
 1001725:	c1 e0 02             	shl    eax,0x2
 1001728:	01 d0                	add    eax,edx
 100172a:	c1 e0 02             	shl    eax,0x2
 100172d:	8d 90 40 02 40 00    	lea    edx,[eax+0x400240]
 1001733:	83 ec 08             	sub    esp,0x8
 1001736:	8d 45 be             	lea    eax,[ebp-0x42]
 1001739:	50                   	push   eax
 100173a:	52                   	push   edx
 100173b:	e8 65 51 00 00       	call   10068a5 <strcmp>
 1001740:	83 c4 10             	add    esp,0x10
 1001743:	85 c0                	test   eax,eax
 1001745:	74 0c                	je     1001753 <sys_open+0xcb>
 1001747:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100174b:	83 7d e4 19          	cmp    DWORD PTR [ebp-0x1c],0x19
 100174f:	7e b7                	jle    1001708 <sys_open+0x80>
 1001751:	eb 01                	jmp    1001754 <sys_open+0xcc>
 1001753:	90                   	nop
 1001754:	83 7d e4 1a          	cmp    DWORD PTR [ebp-0x1c],0x1a
 1001758:	75 0a                	jne    1001764 <sys_open+0xdc>
 100175a:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100175f:	e9 04 02 00 00       	jmp    1001968 <sys_open+0x2e0>
 1001764:	8d 85 42 ff ff ff    	lea    eax,[ebp-0xbe]
 100176a:	b9 7c 00 00 00       	mov    ecx,0x7c
 100176f:	bb 00 00 00 00       	mov    ebx,0x0
 1001774:	89 18                	mov    DWORD PTR [eax],ebx
 1001776:	89 5c 08 fc          	mov    DWORD PTR [eax+ecx*1-0x4],ebx
 100177a:	8d 50 04             	lea    edx,[eax+0x4]
 100177d:	83 e2 fc             	and    edx,0xfffffffc
 1001780:	29 d0                	sub    eax,edx
 1001782:	01 c1                	add    ecx,eax
 1001784:	83 e1 fc             	and    ecx,0xfffffffc
 1001787:	c1 e9 02             	shr    ecx,0x2
 100178a:	89 d7                	mov    edi,edx
 100178c:	89 d8                	mov    eax,ebx
 100178e:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001790:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1001793:	8d 50 01             	lea    edx,[eax+0x1]
 1001796:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001799:	01 d0                	add    eax,edx
 100179b:	89 85 62 ff ff ff    	mov    DWORD PTR [ebp-0x9e],eax
 10017a1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10017a4:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 10017a7:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10017aa:	89 d0                	mov    eax,edx
 10017ac:	c1 e0 02             	shl    eax,0x2
 10017af:	01 d0                	add    eax,edx
 10017b1:	c1 e0 02             	shl    eax,0x2
 10017b4:	05 4c 02 40 00       	add    eax,0x40024c
 10017b9:	8b 00                	mov    eax,DWORD PTR [eax]
 10017bb:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 10017be:	83 ec 0c             	sub    esp,0xc
 10017c1:	8d 95 42 ff ff ff    	lea    edx,[ebp-0xbe]
 10017c7:	52                   	push   edx
 10017c8:	ff d0                	call   eax
 10017ca:	83 c4 10             	add    esp,0x10
 10017cd:	83 f8 ff             	cmp    eax,0xffffffff
 10017d0:	75 3f                	jne    1001811 <sys_open+0x189>
 10017d2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10017d5:	83 e0 02             	and    eax,0x2
 10017d8:	85 c0                	test   eax,eax
 10017da:	74 2b                	je     1001807 <sys_open+0x17f>
 10017dc:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10017df:	89 d0                	mov    eax,edx
 10017e1:	c1 e0 02             	shl    eax,0x2
 10017e4:	01 d0                	add    eax,edx
 10017e6:	c1 e0 02             	shl    eax,0x2
 10017e9:	05 4c 02 40 00       	add    eax,0x40024c
 10017ee:	8b 00                	mov    eax,DWORD PTR [eax]
 10017f0:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 10017f3:	83 ec 0c             	sub    esp,0xc
 10017f6:	8d 95 42 ff ff ff    	lea    edx,[ebp-0xbe]
 10017fc:	52                   	push   edx
 10017fd:	ff d0                	call   eax
 10017ff:	83 c4 10             	add    esp,0x10
 1001802:	e9 61 01 00 00       	jmp    1001968 <sys_open+0x2e0>
 1001807:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100180c:	e9 57 01 00 00       	jmp    1001968 <sys_open+0x2e0>
 1001811:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
 1001817:	8d 95 66 ff ff ff    	lea    edx,[ebp-0x9a]
 100181d:	b9 12 00 00 00       	mov    ecx,0x12
 1001822:	89 c7                	mov    edi,eax
 1001824:	89 d6                	mov    esi,edx
 1001826:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001828:	c7 45 e0 ff ff ff ff 	mov    DWORD PTR [ebp-0x20],0xffffffff
 100182f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001836:	eb 4b                	jmp    1001883 <sys_open+0x1fb>
 1001838:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 100183b:	89 d0                	mov    eax,edx
 100183d:	c1 e0 03             	shl    eax,0x3
 1001840:	01 d0                	add    eax,edx
 1001842:	c1 e0 03             	shl    eax,0x3
 1001845:	05 68 04 40 00       	add    eax,0x400468
 100184a:	8b 00                	mov    eax,DWORD PTR [eax]
 100184c:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 100184f:	75 2e                	jne    100187f <sys_open+0x1f7>
 1001851:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001854:	89 d0                	mov    eax,edx
 1001856:	c1 e0 03             	shl    eax,0x3
 1001859:	01 d0                	add    eax,edx
 100185b:	c1 e0 03             	shl    eax,0x3
 100185e:	05 74 04 40 00       	add    eax,0x400474
 1001863:	8b 10                	mov    edx,DWORD PTR [eax]
 1001865:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [ebp-0xf4]
 100186b:	39 c2                	cmp    edx,eax
 100186d:	75 10                	jne    100187f <sys_open+0x1f7>
 100186f:	83 7d 0c 02          	cmp    DWORD PTR [ebp+0xc],0x2
 1001873:	75 0a                	jne    100187f <sys_open+0x1f7>
 1001875:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100187a:	e9 e9 00 00 00       	jmp    1001968 <sys_open+0x2e0>
 100187f:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1001883:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 1001887:	7e af                	jle    1001838 <sys_open+0x1b0>
 1001889:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1001890:	eb 24                	jmp    10018b6 <sys_open+0x22e>
 1001892:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001895:	89 d0                	mov    eax,edx
 1001897:	c1 e0 03             	shl    eax,0x3
 100189a:	01 d0                	add    eax,edx
 100189c:	c1 e0 03             	shl    eax,0x3
 100189f:	05 64 04 40 00       	add    eax,0x400464
 10018a4:	8b 00                	mov    eax,DWORD PTR [eax]
 10018a6:	85 c0                	test   eax,eax
 10018a8:	75 08                	jne    10018b2 <sys_open+0x22a>
 10018aa:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10018ad:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10018b0:	eb 0a                	jmp    10018bc <sys_open+0x234>
 10018b2:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 10018b6:	83 7d e4 3f          	cmp    DWORD PTR [ebp-0x1c],0x3f
 10018ba:	7e d6                	jle    1001892 <sys_open+0x20a>
 10018bc:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 10018c0:	75 0a                	jne    10018cc <sys_open+0x244>
 10018c2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10018c7:	e9 9c 00 00 00       	jmp    1001968 <sys_open+0x2e0>
 10018cc:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10018cf:	89 d0                	mov    eax,edx
 10018d1:	c1 e0 03             	shl    eax,0x3
 10018d4:	01 d0                	add    eax,edx
 10018d6:	c1 e0 03             	shl    eax,0x3
 10018d9:	05 60 04 40 00       	add    eax,0x400460
 10018de:	89 c3                	mov    ebx,eax
 10018e0:	8d 85 f8 fe ff ff    	lea    eax,[ebp-0x108]
 10018e6:	ba 12 00 00 00       	mov    edx,0x12
 10018eb:	89 df                	mov    edi,ebx
 10018ed:	89 c6                	mov    esi,eax
 10018ef:	89 d1                	mov    ecx,edx
 10018f1:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10018f3:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10018f6:	89 d0                	mov    eax,edx
 10018f8:	c1 e0 03             	shl    eax,0x3
 10018fb:	01 d0                	add    eax,edx
 10018fd:	c1 e0 03             	shl    eax,0x3
 1001900:	8d 90 60 04 40 00    	lea    edx,[eax+0x400460]
 1001906:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001909:	89 02                	mov    DWORD PTR [edx],eax
 100190b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100190e:	89 d0                	mov    eax,edx
 1001910:	c1 e0 03             	shl    eax,0x3
 1001913:	01 d0                	add    eax,edx
 1001915:	c1 e0 03             	shl    eax,0x3
 1001918:	05 6c 04 40 00       	add    eax,0x40046c
 100191d:	8b 00                	mov    eax,DWORD PTR [eax]
 100191f:	8d 48 01             	lea    ecx,[eax+0x1]
 1001922:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1001925:	89 d0                	mov    eax,edx
 1001927:	c1 e0 03             	shl    eax,0x3
 100192a:	01 d0                	add    eax,edx
 100192c:	c1 e0 03             	shl    eax,0x3
 100192f:	05 6c 04 40 00       	add    eax,0x40046c
 1001934:	89 08                	mov    DWORD PTR [eax],ecx
 1001936:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1001939:	89 d0                	mov    eax,edx
 100193b:	c1 e0 03             	shl    eax,0x3
 100193e:	01 d0                	add    eax,edx
 1001940:	c1 e0 03             	shl    eax,0x3
 1001943:	05 60 04 40 00       	add    eax,0x400460
 1001948:	83 ec 0c             	sub    esp,0xc
 100194b:	50                   	push   eax
 100194c:	e8 f9 12 00 00       	call   1002c4a <add_proc_openf>
 1001951:	83 c4 10             	add    esp,0x10
 1001954:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1001957:	89 d0                	mov    eax,edx
 1001959:	c1 e0 03             	shl    eax,0x3
 100195c:	01 d0                	add    eax,edx
 100195e:	c1 e0 03             	shl    eax,0x3
 1001961:	05 60 04 40 00       	add    eax,0x400460
 1001966:	8b 00                	mov    eax,DWORD PTR [eax]
 1001968:	8d 65 f4             	lea    esp,[ebp-0xc]
 100196b:	5b                   	pop    ebx
 100196c:	5e                   	pop    esi
 100196d:	5f                   	pop    edi
 100196e:	5d                   	pop    ebp
 100196f:	c3                   	ret    

01001970 <sys_close>:
 1001970:	55                   	push   ebp
 1001971:	89 e5                	mov    ebp,esp
 1001973:	83 ec 10             	sub    esp,0x10
 1001976:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100197d:	eb 4f                	jmp    10019ce <sys_close+0x5e>
 100197f:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001982:	89 d0                	mov    eax,edx
 1001984:	c1 e0 03             	shl    eax,0x3
 1001987:	01 d0                	add    eax,edx
 1001989:	c1 e0 03             	shl    eax,0x3
 100198c:	05 60 04 40 00       	add    eax,0x400460
 1001991:	8b 00                	mov    eax,DWORD PTR [eax]
 1001993:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001996:	75 32                	jne    10019ca <sys_close+0x5a>
 1001998:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 100199b:	89 d0                	mov    eax,edx
 100199d:	c1 e0 03             	shl    eax,0x3
 10019a0:	01 d0                	add    eax,edx
 10019a2:	c1 e0 03             	shl    eax,0x3
 10019a5:	05 6c 04 40 00       	add    eax,0x40046c
 10019aa:	8b 00                	mov    eax,DWORD PTR [eax]
 10019ac:	8d 48 ff             	lea    ecx,[eax-0x1]
 10019af:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 10019b2:	89 d0                	mov    eax,edx
 10019b4:	c1 e0 03             	shl    eax,0x3
 10019b7:	01 d0                	add    eax,edx
 10019b9:	c1 e0 03             	shl    eax,0x3
 10019bc:	05 6c 04 40 00       	add    eax,0x40046c
 10019c1:	89 08                	mov    DWORD PTR [eax],ecx
 10019c3:	b8 00 00 00 00       	mov    eax,0x0
 10019c8:	eb 0f                	jmp    10019d9 <sys_close+0x69>
 10019ca:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10019ce:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 10019d2:	7e ab                	jle    100197f <sys_close+0xf>
 10019d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10019d9:	c9                   	leave  
 10019da:	c3                   	ret    

010019db <sys_write>:
 10019db:	55                   	push   ebp
 10019dc:	89 e5                	mov    ebp,esp
 10019de:	57                   	push   edi
 10019df:	81 ec 84 00 00 00    	sub    esp,0x84
 10019e5:	83 ec 0c             	sub    esp,0xc
 10019e8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10019eb:	e8 7a 01 00 00       	call   1001b6a <get_vfs_entry>
 10019f0:	83 c4 10             	add    esp,0x10
 10019f3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10019f6:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 10019fa:	75 07                	jne    1001a03 <sys_write+0x28>
 10019fc:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001a01:	eb 58                	jmp    1001a5b <sys_write+0x80>
 1001a03:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 1001a09:	b8 00 00 00 00       	mov    eax,0x0
 1001a0e:	b9 1f 00 00 00       	mov    ecx,0x1f
 1001a13:	89 d7                	mov    edi,edx
 1001a15:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001a17:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001a1a:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 1001a1d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001a20:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
 1001a23:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1001a26:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 1001a29:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001a2c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001a2f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001a32:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001a35:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1001a38:	89 d0                	mov    eax,edx
 1001a3a:	c1 e0 02             	shl    eax,0x2
 1001a3d:	01 d0                	add    eax,edx
 1001a3f:	c1 e0 02             	shl    eax,0x2
 1001a42:	05 4c 02 40 00       	add    eax,0x40024c
 1001a47:	8b 00                	mov    eax,DWORD PTR [eax]
 1001a49:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1001a4c:	83 ec 0c             	sub    esp,0xc
 1001a4f:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 1001a55:	52                   	push   edx
 1001a56:	ff d0                	call   eax
 1001a58:	83 c4 10             	add    esp,0x10
 1001a5b:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1001a5e:	c9                   	leave  
 1001a5f:	c3                   	ret    

01001a60 <sys_read>:
 1001a60:	55                   	push   ebp
 1001a61:	89 e5                	mov    ebp,esp
 1001a63:	57                   	push   edi
 1001a64:	56                   	push   esi
 1001a65:	53                   	push   ebx
 1001a66:	81 ec 8c 00 00 00    	sub    esp,0x8c
 1001a6c:	83 ec 0c             	sub    esp,0xc
 1001a6f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001a72:	e8 f3 00 00 00       	call   1001b6a <get_vfs_entry>
 1001a77:	83 c4 10             	add    esp,0x10
 1001a7a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1001a7d:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1001a81:	75 07                	jne    1001a8a <sys_read+0x2a>
 1001a83:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001a88:	eb 73                	jmp    1001afd <sys_read+0x9d>
 1001a8a:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
 1001a90:	b8 00 00 00 00       	mov    eax,0x0
 1001a95:	b9 1f 00 00 00       	mov    ecx,0x1f
 1001a9a:	89 d7                	mov    edi,edx
 1001a9c:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1001a9e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001aa1:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 1001aa7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001aaa:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 1001ab0:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1001ab3:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 1001ab6:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1001ab9:	8d 45 8c             	lea    eax,[ebp-0x74]
 1001abc:	89 d3                	mov    ebx,edx
 1001abe:	ba 12 00 00 00       	mov    edx,0x12
 1001ac3:	89 c7                	mov    edi,eax
 1001ac5:	89 de                	mov    esi,ebx
 1001ac7:	89 d1                	mov    ecx,edx
 1001ac9:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001acb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001ace:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001ad1:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1001ad4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1001ad7:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1001ada:	89 d0                	mov    eax,edx
 1001adc:	c1 e0 02             	shl    eax,0x2
 1001adf:	01 d0                	add    eax,edx
 1001ae1:	c1 e0 02             	shl    eax,0x2
 1001ae4:	05 4c 02 40 00       	add    eax,0x40024c
 1001ae9:	8b 00                	mov    eax,DWORD PTR [eax]
 1001aeb:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1001aee:	83 ec 0c             	sub    esp,0xc
 1001af1:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
 1001af7:	52                   	push   edx
 1001af8:	ff d0                	call   eax
 1001afa:	83 c4 10             	add    esp,0x10
 1001afd:	8d 65 f4             	lea    esp,[ebp-0xc]
 1001b00:	5b                   	pop    ebx
 1001b01:	5e                   	pop    esi
 1001b02:	5f                   	pop    edi
 1001b03:	5d                   	pop    ebp
 1001b04:	c3                   	ret    

01001b05 <sys_seek>:
 1001b05:	55                   	push   ebp
 1001b06:	89 e5                	mov    ebp,esp
 1001b08:	83 ec 18             	sub    esp,0x18
 1001b0b:	83 ec 0c             	sub    esp,0xc
 1001b0e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001b11:	e8 54 00 00 00       	call   1001b6a <get_vfs_entry>
 1001b16:	83 c4 10             	add    esp,0x10
 1001b19:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001b1c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001b20:	75 07                	jne    1001b29 <sys_seek+0x24>
 1001b22:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001b27:	eb 13                	jmp    1001b3c <sys_seek+0x37>
 1001b29:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1001b2c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1001b2f:	01 c2                	add    edx,eax
 1001b31:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001b34:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
 1001b37:	b8 00 00 00 00       	mov    eax,0x0
 1001b3c:	c9                   	leave  
 1001b3d:	c3                   	ret    

01001b3e <sys_tell>:
 1001b3e:	55                   	push   ebp
 1001b3f:	89 e5                	mov    ebp,esp
 1001b41:	83 ec 18             	sub    esp,0x18
 1001b44:	83 ec 0c             	sub    esp,0xc
 1001b47:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001b4a:	e8 1b 00 00 00       	call   1001b6a <get_vfs_entry>
 1001b4f:	83 c4 10             	add    esp,0x10
 1001b52:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1001b55:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1001b59:	75 07                	jne    1001b62 <sys_tell+0x24>
 1001b5b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001b60:	eb 06                	jmp    1001b68 <sys_tell+0x2a>
 1001b62:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001b65:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001b68:	c9                   	leave  
 1001b69:	c3                   	ret    

01001b6a <get_vfs_entry>:
 1001b6a:	55                   	push   ebp
 1001b6b:	89 e5                	mov    ebp,esp
 1001b6d:	83 ec 10             	sub    esp,0x10
 1001b70:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001b77:	eb 31                	jmp    1001baa <get_vfs_entry+0x40>
 1001b79:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001b7c:	89 d0                	mov    eax,edx
 1001b7e:	c1 e0 03             	shl    eax,0x3
 1001b81:	01 d0                	add    eax,edx
 1001b83:	c1 e0 03             	shl    eax,0x3
 1001b86:	05 60 04 40 00       	add    eax,0x400460
 1001b8b:	8b 00                	mov    eax,DWORD PTR [eax]
 1001b8d:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
 1001b90:	75 14                	jne    1001ba6 <get_vfs_entry+0x3c>
 1001b92:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001b95:	89 d0                	mov    eax,edx
 1001b97:	c1 e0 03             	shl    eax,0x3
 1001b9a:	01 d0                	add    eax,edx
 1001b9c:	c1 e0 03             	shl    eax,0x3
 1001b9f:	05 60 04 40 00       	add    eax,0x400460
 1001ba4:	eb 0f                	jmp    1001bb5 <get_vfs_entry+0x4b>
 1001ba6:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001baa:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1001bae:	7e c9                	jle    1001b79 <get_vfs_entry+0xf>
 1001bb0:	b8 00 00 00 00       	mov    eax,0x0
 1001bb5:	c9                   	leave  
 1001bb6:	c3                   	ret    

01001bb7 <init_drvdev_man>:
 1001bb7:	55                   	push   ebp
 1001bb8:	89 e5                	mov    ebp,esp
 1001bba:	90                   	nop
 1001bbb:	5d                   	pop    ebp
 1001bbc:	c3                   	ret    

01001bbd <load_driver>:
 1001bbd:	55                   	push   ebp
 1001bbe:	89 e5                	mov    ebp,esp
 1001bc0:	90                   	nop
 1001bc1:	5d                   	pop    ebp
 1001bc2:	c3                   	ret    

01001bc3 <reg_device>:
 1001bc3:	55                   	push   ebp
 1001bc4:	89 e5                	mov    ebp,esp
 1001bc6:	83 ec 10             	sub    esp,0x10
 1001bc9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1001bd0:	e9 92 00 00 00       	jmp    1001c67 <reg_device+0xa4>
 1001bd5:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001bd8:	89 d0                	mov    eax,edx
 1001bda:	01 c0                	add    eax,eax
 1001bdc:	01 d0                	add    eax,edx
 1001bde:	c1 e0 04             	shl    eax,0x4
 1001be1:	05 64 17 40 00       	add    eax,0x401764
 1001be6:	8b 00                	mov    eax,DWORD PTR [eax]
 1001be8:	85 c0                	test   eax,eax
 1001bea:	75 77                	jne    1001c63 <reg_device+0xa0>
 1001bec:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001bef:	89 d0                	mov    eax,edx
 1001bf1:	01 c0                	add    eax,eax
 1001bf3:	01 d0                	add    eax,edx
 1001bf5:	c1 e0 04             	shl    eax,0x4
 1001bf8:	8d 90 60 17 40 00    	lea    edx,[eax+0x401760]
 1001bfe:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001c01:	8b 08                	mov    ecx,DWORD PTR [eax]
 1001c03:	89 0a                	mov    DWORD PTR [edx],ecx
 1001c05:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
 1001c08:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
 1001c0b:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
 1001c0e:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
 1001c11:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
 1001c14:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
 1001c17:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1001c1a:	89 4a 10             	mov    DWORD PTR [edx+0x10],ecx
 1001c1d:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
 1001c20:	89 4a 14             	mov    DWORD PTR [edx+0x14],ecx
 1001c23:	8b 48 18             	mov    ecx,DWORD PTR [eax+0x18]
 1001c26:	89 4a 18             	mov    DWORD PTR [edx+0x18],ecx
 1001c29:	8b 48 1c             	mov    ecx,DWORD PTR [eax+0x1c]
 1001c2c:	89 4a 1c             	mov    DWORD PTR [edx+0x1c],ecx
 1001c2f:	8b 48 20             	mov    ecx,DWORD PTR [eax+0x20]
 1001c32:	89 4a 20             	mov    DWORD PTR [edx+0x20],ecx
 1001c35:	8b 48 24             	mov    ecx,DWORD PTR [eax+0x24]
 1001c38:	89 4a 24             	mov    DWORD PTR [edx+0x24],ecx
 1001c3b:	8b 48 28             	mov    ecx,DWORD PTR [eax+0x28]
 1001c3e:	89 4a 28             	mov    DWORD PTR [edx+0x28],ecx
 1001c41:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
 1001c44:	89 42 2c             	mov    DWORD PTR [edx+0x2c],eax
 1001c47:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1001c4a:	89 d0                	mov    eax,edx
 1001c4c:	01 c0                	add    eax,eax
 1001c4e:	01 d0                	add    eax,edx
 1001c50:	c1 e0 04             	shl    eax,0x4
 1001c53:	05 64 17 40 00       	add    eax,0x401764
 1001c58:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001c5e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1001c61:	eb 13                	jmp    1001c76 <reg_device+0xb3>
 1001c63:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1001c67:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1001c6b:	0f 8e 64 ff ff ff    	jle    1001bd5 <reg_device+0x12>
 1001c71:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001c76:	c9                   	leave  
 1001c77:	c3                   	ret    

01001c78 <reg_driver>:
 1001c78:	55                   	push   ebp
 1001c79:	89 e5                	mov    ebp,esp
 1001c7b:	57                   	push   edi
 1001c7c:	56                   	push   esi
 1001c7d:	53                   	push   ebx
 1001c7e:	83 ec 10             	sub    esp,0x10
 1001c81:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1001c88:	eb 5e                	jmp    1001ce8 <reg_driver+0x70>
 1001c8a:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001c8d:	89 d0                	mov    eax,edx
 1001c8f:	c1 e0 02             	shl    eax,0x2
 1001c92:	01 d0                	add    eax,edx
 1001c94:	c1 e0 04             	shl    eax,0x4
 1001c97:	05 60 23 40 00       	add    eax,0x402360
 1001c9c:	8b 00                	mov    eax,DWORD PTR [eax]
 1001c9e:	85 c0                	test   eax,eax
 1001ca0:	75 42                	jne    1001ce4 <reg_driver+0x6c>
 1001ca2:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001ca5:	89 d0                	mov    eax,edx
 1001ca7:	c1 e0 02             	shl    eax,0x2
 1001caa:	01 d0                	add    eax,edx
 1001cac:	c1 e0 04             	shl    eax,0x4
 1001caf:	8d 90 60 23 40 00    	lea    edx,[eax+0x402360]
 1001cb5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1001cb8:	89 c3                	mov    ebx,eax
 1001cba:	b8 14 00 00 00       	mov    eax,0x14
 1001cbf:	89 d7                	mov    edi,edx
 1001cc1:	89 de                	mov    esi,ebx
 1001cc3:	89 c1                	mov    ecx,eax
 1001cc5:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1001cc7:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1001cca:	89 d0                	mov    eax,edx
 1001ccc:	c1 e0 02             	shl    eax,0x2
 1001ccf:	01 d0                	add    eax,edx
 1001cd1:	c1 e0 04             	shl    eax,0x4
 1001cd4:	05 60 23 40 00       	add    eax,0x402360
 1001cd9:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1001cdf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1001ce2:	eb 0f                	jmp    1001cf3 <reg_driver+0x7b>
 1001ce4:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1001ce8:	83 7d f0 1f          	cmp    DWORD PTR [ebp-0x10],0x1f
 1001cec:	7e 9c                	jle    1001c8a <reg_driver+0x12>
 1001cee:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001cf3:	83 c4 10             	add    esp,0x10
 1001cf6:	5b                   	pop    ebx
 1001cf7:	5e                   	pop    esi
 1001cf8:	5f                   	pop    edi
 1001cf9:	5d                   	pop    ebp
 1001cfa:	c3                   	ret    

01001cfb <sys_find_dev>:
 1001cfb:	55                   	push   ebp
 1001cfc:	89 e5                	mov    ebp,esp
 1001cfe:	83 ec 18             	sub    esp,0x18
 1001d01:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001d08:	eb 47                	jmp    1001d51 <sys_find_dev+0x56>
 1001d0a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d0d:	89 d0                	mov    eax,edx
 1001d0f:	01 c0                	add    eax,eax
 1001d11:	01 d0                	add    eax,edx
 1001d13:	c1 e0 04             	shl    eax,0x4
 1001d16:	05 64 17 40 00       	add    eax,0x401764
 1001d1b:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d1d:	85 c0                	test   eax,eax
 1001d1f:	74 2c                	je     1001d4d <sys_find_dev+0x52>
 1001d21:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d24:	89 d0                	mov    eax,edx
 1001d26:	01 c0                	add    eax,eax
 1001d28:	01 d0                	add    eax,edx
 1001d2a:	c1 e0 04             	shl    eax,0x4
 1001d2d:	05 60 17 40 00       	add    eax,0x401760
 1001d32:	83 c0 08             	add    eax,0x8
 1001d35:	83 ec 08             	sub    esp,0x8
 1001d38:	50                   	push   eax
 1001d39:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001d3c:	e8 64 4b 00 00       	call   10068a5 <strcmp>
 1001d41:	83 c4 10             	add    esp,0x10
 1001d44:	85 c0                	test   eax,eax
 1001d46:	75 05                	jne    1001d4d <sys_find_dev+0x52>
 1001d48:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1001d4b:	eb 0f                	jmp    1001d5c <sys_find_dev+0x61>
 1001d4d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001d51:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001d55:	7e b3                	jle    1001d0a <sys_find_dev+0xf>
 1001d57:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001d5c:	c9                   	leave  
 1001d5d:	c3                   	ret    

01001d5e <sys_operate_dev>:
 1001d5e:	55                   	push   ebp
 1001d5f:	89 e5                	mov    ebp,esp
 1001d61:	83 ec 18             	sub    esp,0x18
 1001d64:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1001d6b:	eb 42                	jmp    1001daf <sys_operate_dev+0x51>
 1001d6d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d70:	89 d0                	mov    eax,edx
 1001d72:	01 c0                	add    eax,eax
 1001d74:	01 d0                	add    eax,edx
 1001d76:	c1 e0 04             	shl    eax,0x4
 1001d79:	05 64 17 40 00       	add    eax,0x401764
 1001d7e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001d80:	85 c0                	test   eax,eax
 1001d82:	74 27                	je     1001dab <sys_operate_dev+0x4d>
 1001d84:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001d87:	89 d0                	mov    eax,edx
 1001d89:	01 c0                	add    eax,eax
 1001d8b:	01 d0                	add    eax,edx
 1001d8d:	c1 e0 04             	shl    eax,0x4
 1001d90:	05 60 17 40 00       	add    eax,0x401760
 1001d95:	83 c0 08             	add    eax,0x8
 1001d98:	83 ec 08             	sub    esp,0x8
 1001d9b:	50                   	push   eax
 1001d9c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1001d9f:	e8 01 4b 00 00       	call   10068a5 <strcmp>
 1001da4:	83 c4 10             	add    esp,0x10
 1001da7:	85 c0                	test   eax,eax
 1001da9:	74 0c                	je     1001db7 <sys_operate_dev+0x59>
 1001dab:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1001daf:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1001db3:	7e b8                	jle    1001d6d <sys_operate_dev+0xf>
 1001db5:	eb 01                	jmp    1001db8 <sys_operate_dev+0x5a>
 1001db7:	90                   	nop
 1001db8:	83 7d f4 40          	cmp    DWORD PTR [ebp-0xc],0x40
 1001dbc:	75 0a                	jne    1001dc8 <sys_operate_dev+0x6a>
 1001dbe:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001dc3:	e9 da 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001dc8:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 1001dcc:	0f 87 cb 01 00 00    	ja     1001f9d <sys_operate_dev+0x23f>
 1001dd2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001dd5:	c1 e0 02             	shl    eax,0x2
 1001dd8:	05 dc 71 00 01       	add    eax,0x10071dc
 1001ddd:	8b 00                	mov    eax,DWORD PTR [eax]
 1001ddf:	ff e0                	jmp    eax
 1001de1:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001de4:	89 d0                	mov    eax,edx
 1001de6:	01 c0                	add    eax,eax
 1001de8:	01 d0                	add    eax,edx
 1001dea:	c1 e0 04             	shl    eax,0x4
 1001ded:	05 8c 17 40 00       	add    eax,0x40178c
 1001df2:	8b 00                	mov    eax,DWORD PTR [eax]
 1001df4:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1001df7:	83 ec 0c             	sub    esp,0xc
 1001dfa:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001dfd:	ff d0                	call   eax
 1001dff:	83 c4 10             	add    esp,0x10
 1001e02:	e9 9b 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001e07:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e0a:	89 d0                	mov    eax,edx
 1001e0c:	01 c0                	add    eax,eax
 1001e0e:	01 d0                	add    eax,edx
 1001e10:	c1 e0 04             	shl    eax,0x4
 1001e13:	05 8c 17 40 00       	add    eax,0x40178c
 1001e18:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e1a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1001e1d:	83 ec 0c             	sub    esp,0xc
 1001e20:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e23:	ff d0                	call   eax
 1001e25:	83 c4 10             	add    esp,0x10
 1001e28:	e9 75 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001e2d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e30:	89 d0                	mov    eax,edx
 1001e32:	01 c0                	add    eax,eax
 1001e34:	01 d0                	add    eax,edx
 1001e36:	c1 e0 04             	shl    eax,0x4
 1001e39:	05 8c 17 40 00       	add    eax,0x40178c
 1001e3e:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e40:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1001e43:	83 ec 0c             	sub    esp,0xc
 1001e46:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e49:	ff d0                	call   eax
 1001e4b:	83 c4 10             	add    esp,0x10
 1001e4e:	e9 4f 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001e53:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e56:	89 d0                	mov    eax,edx
 1001e58:	01 c0                	add    eax,eax
 1001e5a:	01 d0                	add    eax,edx
 1001e5c:	c1 e0 04             	shl    eax,0x4
 1001e5f:	05 8c 17 40 00       	add    eax,0x40178c
 1001e64:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e66:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1001e69:	83 ec 0c             	sub    esp,0xc
 1001e6c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e6f:	ff d0                	call   eax
 1001e71:	83 c4 10             	add    esp,0x10
 1001e74:	e9 29 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001e79:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001e7c:	89 d0                	mov    eax,edx
 1001e7e:	01 c0                	add    eax,eax
 1001e80:	01 d0                	add    eax,edx
 1001e82:	c1 e0 04             	shl    eax,0x4
 1001e85:	05 8c 17 40 00       	add    eax,0x40178c
 1001e8a:	8b 00                	mov    eax,DWORD PTR [eax]
 1001e8c:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1001e8f:	83 ec 0c             	sub    esp,0xc
 1001e92:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001e95:	ff d0                	call   eax
 1001e97:	83 c4 10             	add    esp,0x10
 1001e9a:	e9 03 01 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001e9f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001ea2:	89 d0                	mov    eax,edx
 1001ea4:	01 c0                	add    eax,eax
 1001ea6:	01 d0                	add    eax,edx
 1001ea8:	c1 e0 04             	shl    eax,0x4
 1001eab:	05 8c 17 40 00       	add    eax,0x40178c
 1001eb0:	8b 00                	mov    eax,DWORD PTR [eax]
 1001eb2:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1001eb5:	83 ec 0c             	sub    esp,0xc
 1001eb8:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ebb:	ff d0                	call   eax
 1001ebd:	83 c4 10             	add    esp,0x10
 1001ec0:	e9 dd 00 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001ec5:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001ec8:	89 d0                	mov    eax,edx
 1001eca:	01 c0                	add    eax,eax
 1001ecc:	01 d0                	add    eax,edx
 1001ece:	c1 e0 04             	shl    eax,0x4
 1001ed1:	05 8c 17 40 00       	add    eax,0x40178c
 1001ed6:	8b 00                	mov    eax,DWORD PTR [eax]
 1001ed8:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1001edb:	83 ec 0c             	sub    esp,0xc
 1001ede:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001ee1:	ff d0                	call   eax
 1001ee3:	83 c4 10             	add    esp,0x10
 1001ee6:	e9 b7 00 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001eeb:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001eee:	89 d0                	mov    eax,edx
 1001ef0:	01 c0                	add    eax,eax
 1001ef2:	01 d0                	add    eax,edx
 1001ef4:	c1 e0 04             	shl    eax,0x4
 1001ef7:	05 8c 17 40 00       	add    eax,0x40178c
 1001efc:	8b 00                	mov    eax,DWORD PTR [eax]
 1001efe:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1001f01:	83 ec 0c             	sub    esp,0xc
 1001f04:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f07:	ff d0                	call   eax
 1001f09:	83 c4 10             	add    esp,0x10
 1001f0c:	e9 91 00 00 00       	jmp    1001fa2 <sys_operate_dev+0x244>
 1001f11:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001f14:	89 d0                	mov    eax,edx
 1001f16:	01 c0                	add    eax,eax
 1001f18:	01 d0                	add    eax,edx
 1001f1a:	c1 e0 04             	shl    eax,0x4
 1001f1d:	05 8c 17 40 00       	add    eax,0x40178c
 1001f22:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f24:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 1001f27:	83 ec 0c             	sub    esp,0xc
 1001f2a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f2d:	ff d0                	call   eax
 1001f2f:	83 c4 10             	add    esp,0x10
 1001f32:	eb 6e                	jmp    1001fa2 <sys_operate_dev+0x244>
 1001f34:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001f37:	89 d0                	mov    eax,edx
 1001f39:	01 c0                	add    eax,eax
 1001f3b:	01 d0                	add    eax,edx
 1001f3d:	c1 e0 04             	shl    eax,0x4
 1001f40:	05 8c 17 40 00       	add    eax,0x40178c
 1001f45:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f47:	8b 40 28             	mov    eax,DWORD PTR [eax+0x28]
 1001f4a:	83 ec 0c             	sub    esp,0xc
 1001f4d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f50:	ff d0                	call   eax
 1001f52:	83 c4 10             	add    esp,0x10
 1001f55:	eb 4b                	jmp    1001fa2 <sys_operate_dev+0x244>
 1001f57:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001f5a:	89 d0                	mov    eax,edx
 1001f5c:	01 c0                	add    eax,eax
 1001f5e:	01 d0                	add    eax,edx
 1001f60:	c1 e0 04             	shl    eax,0x4
 1001f63:	05 8c 17 40 00       	add    eax,0x40178c
 1001f68:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f6a:	8b 40 2c             	mov    eax,DWORD PTR [eax+0x2c]
 1001f6d:	83 ec 0c             	sub    esp,0xc
 1001f70:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f73:	ff d0                	call   eax
 1001f75:	83 c4 10             	add    esp,0x10
 1001f78:	eb 28                	jmp    1001fa2 <sys_operate_dev+0x244>
 1001f7a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1001f7d:	89 d0                	mov    eax,edx
 1001f7f:	01 c0                	add    eax,eax
 1001f81:	01 d0                	add    eax,edx
 1001f83:	c1 e0 04             	shl    eax,0x4
 1001f86:	05 8c 17 40 00       	add    eax,0x40178c
 1001f8b:	8b 00                	mov    eax,DWORD PTR [eax]
 1001f8d:	8b 40 30             	mov    eax,DWORD PTR [eax+0x30]
 1001f90:	83 ec 0c             	sub    esp,0xc
 1001f93:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001f96:	ff d0                	call   eax
 1001f98:	83 c4 10             	add    esp,0x10
 1001f9b:	eb 05                	jmp    1001fa2 <sys_operate_dev+0x244>
 1001f9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001fa2:	c9                   	leave  
 1001fa3:	c3                   	ret    

01001fa4 <call_drv_func>:
 1001fa4:	55                   	push   ebp
 1001fa5:	89 e5                	mov    ebp,esp
 1001fa7:	83 ec 08             	sub    esp,0x8
 1001faa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001fad:	89 d0                	mov    eax,edx
 1001faf:	c1 e0 02             	shl    eax,0x2
 1001fb2:	01 d0                	add    eax,edx
 1001fb4:	c1 e0 04             	shl    eax,0x4
 1001fb7:	05 60 23 40 00       	add    eax,0x402360
 1001fbc:	8b 00                	mov    eax,DWORD PTR [eax]
 1001fbe:	85 c0                	test   eax,eax
 1001fc0:	75 0a                	jne    1001fcc <call_drv_func+0x28>
 1001fc2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1001fc7:	e9 c2 01 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1001fcc:	83 7d 0c 0b          	cmp    DWORD PTR [ebp+0xc],0xb
 1001fd0:	0f 87 b3 01 00 00    	ja     1002189 <call_drv_func+0x1e5>
 1001fd6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1001fd9:	c1 e0 02             	shl    eax,0x2
 1001fdc:	05 0c 72 00 01       	add    eax,0x100720c
 1001fe1:	8b 00                	mov    eax,DWORD PTR [eax]
 1001fe3:	ff e0                	jmp    eax
 1001fe5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1001fe8:	89 d0                	mov    eax,edx
 1001fea:	c1 e0 02             	shl    eax,0x2
 1001fed:	01 d0                	add    eax,edx
 1001fef:	c1 e0 04             	shl    eax,0x4
 1001ff2:	05 64 23 40 00       	add    eax,0x402364
 1001ff7:	8b 00                	mov    eax,DWORD PTR [eax]
 1001ff9:	83 ec 0c             	sub    esp,0xc
 1001ffc:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1001fff:	ff d0                	call   eax
 1002001:	83 c4 10             	add    esp,0x10
 1002004:	e9 85 01 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1002009:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100200c:	89 d0                	mov    eax,edx
 100200e:	c1 e0 02             	shl    eax,0x2
 1002011:	01 d0                	add    eax,edx
 1002013:	c1 e0 04             	shl    eax,0x4
 1002016:	05 68 23 40 00       	add    eax,0x402368
 100201b:	8b 00                	mov    eax,DWORD PTR [eax]
 100201d:	83 ec 0c             	sub    esp,0xc
 1002020:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002023:	ff d0                	call   eax
 1002025:	83 c4 10             	add    esp,0x10
 1002028:	e9 61 01 00 00       	jmp    100218e <call_drv_func+0x1ea>
 100202d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002030:	89 d0                	mov    eax,edx
 1002032:	c1 e0 02             	shl    eax,0x2
 1002035:	01 d0                	add    eax,edx
 1002037:	c1 e0 04             	shl    eax,0x4
 100203a:	05 6c 23 40 00       	add    eax,0x40236c
 100203f:	8b 00                	mov    eax,DWORD PTR [eax]
 1002041:	83 ec 0c             	sub    esp,0xc
 1002044:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002047:	ff d0                	call   eax
 1002049:	83 c4 10             	add    esp,0x10
 100204c:	e9 3d 01 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1002051:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002054:	89 d0                	mov    eax,edx
 1002056:	c1 e0 02             	shl    eax,0x2
 1002059:	01 d0                	add    eax,edx
 100205b:	c1 e0 04             	shl    eax,0x4
 100205e:	05 70 23 40 00       	add    eax,0x402370
 1002063:	8b 00                	mov    eax,DWORD PTR [eax]
 1002065:	83 ec 0c             	sub    esp,0xc
 1002068:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100206b:	ff d0                	call   eax
 100206d:	83 c4 10             	add    esp,0x10
 1002070:	e9 19 01 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1002075:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002078:	89 d0                	mov    eax,edx
 100207a:	c1 e0 02             	shl    eax,0x2
 100207d:	01 d0                	add    eax,edx
 100207f:	c1 e0 04             	shl    eax,0x4
 1002082:	05 74 23 40 00       	add    eax,0x402374
 1002087:	8b 00                	mov    eax,DWORD PTR [eax]
 1002089:	83 ec 0c             	sub    esp,0xc
 100208c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100208f:	ff d0                	call   eax
 1002091:	83 c4 10             	add    esp,0x10
 1002094:	e9 f5 00 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1002099:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100209c:	89 d0                	mov    eax,edx
 100209e:	c1 e0 02             	shl    eax,0x2
 10020a1:	01 d0                	add    eax,edx
 10020a3:	c1 e0 04             	shl    eax,0x4
 10020a6:	05 78 23 40 00       	add    eax,0x402378
 10020ab:	8b 00                	mov    eax,DWORD PTR [eax]
 10020ad:	83 ec 0c             	sub    esp,0xc
 10020b0:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020b3:	ff d0                	call   eax
 10020b5:	83 c4 10             	add    esp,0x10
 10020b8:	e9 d1 00 00 00       	jmp    100218e <call_drv_func+0x1ea>
 10020bd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10020c0:	89 d0                	mov    eax,edx
 10020c2:	c1 e0 02             	shl    eax,0x2
 10020c5:	01 d0                	add    eax,edx
 10020c7:	c1 e0 04             	shl    eax,0x4
 10020ca:	05 7c 23 40 00       	add    eax,0x40237c
 10020cf:	8b 00                	mov    eax,DWORD PTR [eax]
 10020d1:	83 ec 0c             	sub    esp,0xc
 10020d4:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020d7:	ff d0                	call   eax
 10020d9:	83 c4 10             	add    esp,0x10
 10020dc:	e9 ad 00 00 00       	jmp    100218e <call_drv_func+0x1ea>
 10020e1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10020e4:	89 d0                	mov    eax,edx
 10020e6:	c1 e0 02             	shl    eax,0x2
 10020e9:	01 d0                	add    eax,edx
 10020eb:	c1 e0 04             	shl    eax,0x4
 10020ee:	05 80 23 40 00       	add    eax,0x402380
 10020f3:	8b 00                	mov    eax,DWORD PTR [eax]
 10020f5:	83 ec 0c             	sub    esp,0xc
 10020f8:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 10020fb:	ff d0                	call   eax
 10020fd:	83 c4 10             	add    esp,0x10
 1002100:	e9 89 00 00 00       	jmp    100218e <call_drv_func+0x1ea>
 1002105:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002108:	89 d0                	mov    eax,edx
 100210a:	c1 e0 02             	shl    eax,0x2
 100210d:	01 d0                	add    eax,edx
 100210f:	c1 e0 04             	shl    eax,0x4
 1002112:	05 84 23 40 00       	add    eax,0x402384
 1002117:	8b 00                	mov    eax,DWORD PTR [eax]
 1002119:	83 ec 0c             	sub    esp,0xc
 100211c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 100211f:	ff d0                	call   eax
 1002121:	83 c4 10             	add    esp,0x10
 1002124:	eb 68                	jmp    100218e <call_drv_func+0x1ea>
 1002126:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1002129:	89 d0                	mov    eax,edx
 100212b:	c1 e0 02             	shl    eax,0x2
 100212e:	01 d0                	add    eax,edx
 1002130:	c1 e0 04             	shl    eax,0x4
 1002133:	05 88 23 40 00       	add    eax,0x402388
 1002138:	8b 00                	mov    eax,DWORD PTR [eax]
 100213a:	83 ec 0c             	sub    esp,0xc
 100213d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002140:	ff d0                	call   eax
 1002142:	83 c4 10             	add    esp,0x10
 1002145:	eb 47                	jmp    100218e <call_drv_func+0x1ea>
 1002147:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100214a:	89 d0                	mov    eax,edx
 100214c:	c1 e0 02             	shl    eax,0x2
 100214f:	01 d0                	add    eax,edx
 1002151:	c1 e0 04             	shl    eax,0x4
 1002154:	05 8c 23 40 00       	add    eax,0x40238c
 1002159:	8b 00                	mov    eax,DWORD PTR [eax]
 100215b:	83 ec 0c             	sub    esp,0xc
 100215e:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002161:	ff d0                	call   eax
 1002163:	83 c4 10             	add    esp,0x10
 1002166:	eb 26                	jmp    100218e <call_drv_func+0x1ea>
 1002168:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100216b:	89 d0                	mov    eax,edx
 100216d:	c1 e0 02             	shl    eax,0x2
 1002170:	01 d0                	add    eax,edx
 1002172:	c1 e0 04             	shl    eax,0x4
 1002175:	05 90 23 40 00       	add    eax,0x402390
 100217a:	8b 00                	mov    eax,DWORD PTR [eax]
 100217c:	83 ec 0c             	sub    esp,0xc
 100217f:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 1002182:	ff d0                	call   eax
 1002184:	83 c4 10             	add    esp,0x10
 1002187:	eb 05                	jmp    100218e <call_drv_func+0x1ea>
 1002189:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100218e:	c9                   	leave  
 100218f:	c3                   	ret    

01002190 <dispose_device>:
 1002190:	55                   	push   ebp
 1002191:	89 e5                	mov    ebp,esp
 1002193:	90                   	nop
 1002194:	5d                   	pop    ebp
 1002195:	c3                   	ret    

01002196 <dispose_driver>:
 1002196:	55                   	push   ebp
 1002197:	89 e5                	mov    ebp,esp
 1002199:	90                   	nop
 100219a:	5d                   	pop    ebp
 100219b:	c3                   	ret    

0100219c <get_dev>:
 100219c:	55                   	push   ebp
 100219d:	89 e5                	mov    ebp,esp
 100219f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10021a2:	89 d0                	mov    eax,edx
 10021a4:	01 c0                	add    eax,eax
 10021a6:	01 d0                	add    eax,edx
 10021a8:	c1 e0 04             	shl    eax,0x4
 10021ab:	05 60 17 40 00       	add    eax,0x401760
 10021b0:	5d                   	pop    ebp
 10021b1:	c3                   	ret    

010021b2 <get_drv>:
 10021b2:	55                   	push   ebp
 10021b3:	89 e5                	mov    ebp,esp
 10021b5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10021b8:	89 d0                	mov    eax,edx
 10021ba:	c1 e0 02             	shl    eax,0x2
 10021bd:	01 d0                	add    eax,edx
 10021bf:	c1 e0 04             	shl    eax,0x4
 10021c2:	05 60 23 40 00       	add    eax,0x402360
 10021c7:	5d                   	pop    ebp
 10021c8:	c3                   	ret    

010021c9 <init_proc>:
 10021c9:	55                   	push   ebp
 10021ca:	89 e5                	mov    ebp,esp
 10021cc:	83 ec 18             	sub    esp,0x18
 10021cf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10021d6:	eb 40                	jmp    1002218 <init_proc+0x4f>
 10021d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10021db:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10021e1:	05 60 2d 40 00       	add    eax,0x402d60
 10021e6:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 10021ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10021ef:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10021f5:	05 64 2d 40 00       	add    eax,0x402d64
 10021fa:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 1002200:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002203:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002209:	05 c0 2d 40 00       	add    eax,0x402dc0
 100220e:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 1002214:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1002218:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 100221c:	7e ba                	jle    10021d8 <init_proc+0xf>
 100221e:	c7 05 c8 8b 40 00 00 	mov    DWORD PTR ds:0x408bc8,0x0
 1002225:	00 00 00 
 1002228:	c7 05 cc 8b 40 00 01 	mov    DWORD PTR ds:0x408bcc,0x1
 100222f:	00 00 00 
 1002232:	e8 3c 00 00 00       	call   1002273 <create_proc>
 1002237:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100223a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100223d:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002243:	05 64 2d 40 00       	add    eax,0x402d64
 1002248:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 100224e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002251:	83 c0 03             	add    eax,0x3
 1002254:	c1 e0 04             	shl    eax,0x4
 1002257:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 100225a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100225d:	01 c0                	add    eax,eax
 100225f:	83 c0 05             	add    eax,0x5
 1002262:	c1 e0 03             	shl    eax,0x3
 1002265:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002268:	0f 00 55 ec          	lldt   WORD PTR [ebp-0x14]
 100226c:	0f 00 5d f0          	ltr    WORD PTR [ebp-0x10]
 1002270:	90                   	nop
 1002271:	c9                   	leave  
 1002272:	c3                   	ret    

01002273 <create_proc>:
 1002273:	55                   	push   ebp
 1002274:	89 e5                	mov    ebp,esp
 1002276:	83 ec 18             	sub    esp,0x18
 1002279:	e8 5f 00 00 00       	call   10022dd <req_proc>
 100227e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002281:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002285:	75 07                	jne    100228e <create_proc+0x1b>
 1002287:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100228c:	eb 4d                	jmp    10022db <create_proc+0x68>
 100228e:	c7 45 f0 ff fb 09 00 	mov    DWORD PTR [ebp-0x10],0x9fbff
 1002295:	89 65 f0             	mov    DWORD PTR [ebp-0x10],esp
 1002298:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100229b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100229e:	6a 00                	push   0x0
 10022a0:	6a 00                	push   0x0
 10022a2:	6a 00                	push   0x0
 10022a4:	6a 00                	push   0x0
 10022a6:	50                   	push   eax
 10022a7:	6a 17                	push   0x17
 10022a9:	6a 17                	push   0x17
 10022ab:	6a 17                	push   0x17
 10022ad:	6a 17                	push   0x17
 10022af:	6a 0f                	push   0xf
 10022b1:	6a 17                	push   0x17
 10022b3:	6a 00                	push   0x0
 10022b5:	6a 00                	push   0x0
 10022b7:	6a 00                	push   0x0
 10022b9:	6a 00                	push   0x0
 10022bb:	e8 ce 00 00 00       	call   100238e <set_proc>
 10022c0:	83 c4 40             	add    esp,0x40
 10022c3:	ba 8d 25 00 01       	mov    edx,0x100258d
 10022c8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022cb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10022d1:	05 90 2e 40 00       	add    eax,0x402e90
 10022d6:	89 10                	mov    DWORD PTR [eax],edx
 10022d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10022db:	c9                   	leave  
 10022dc:	c3                   	ret    

010022dd <req_proc>:
 10022dd:	55                   	push   ebp
 10022de:	89 e5                	mov    ebp,esp
 10022e0:	83 ec 10             	sub    esp,0x10
 10022e3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10022ea:	eb 04                	jmp    10022f0 <req_proc+0x13>
 10022ec:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10022f0:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10022f3:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10022f9:	05 60 2d 40 00       	add    eax,0x402d60
 10022fe:	8b 00                	mov    eax,DWORD PTR [eax]
 1002300:	83 f8 ff             	cmp    eax,0xffffffff
 1002303:	74 1b                	je     1002320 <req_proc+0x43>
 1002305:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002308:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100230e:	05 64 2d 40 00       	add    eax,0x402d64
 1002313:	8b 00                	mov    eax,DWORD PTR [eax]
 1002315:	83 f8 03             	cmp    eax,0x3
 1002318:	74 06                	je     1002320 <req_proc+0x43>
 100231a:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 100231e:	7e cc                	jle    10022ec <req_proc+0xf>
 1002320:	83 7d fc 3f          	cmp    DWORD PTR [ebp-0x4],0x3f
 1002324:	7e 07                	jle    100232d <req_proc+0x50>
 1002326:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100232b:	eb 5f                	jmp    100238c <req_proc+0xaf>
 100232d:	a1 cc 8b 40 00       	mov    eax,ds:0x408bcc
 1002332:	8d 50 01             	lea    edx,[eax+0x1]
 1002335:	89 15 cc 8b 40 00    	mov    DWORD PTR ds:0x408bcc,edx
 100233b:	89 c2                	mov    edx,eax
 100233d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002340:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002346:	05 60 2d 40 00       	add    eax,0x402d60
 100234b:	89 10                	mov    DWORD PTR [eax],edx
 100234d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002350:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002356:	05 64 2d 40 00       	add    eax,0x402d64
 100235b:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 1002361:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002364:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100236a:	05 68 2d 40 00       	add    eax,0x402d68
 100236f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002375:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002378:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100237e:	05 6c 2d 40 00       	add    eax,0x402d6c
 1002383:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002389:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100238c:	c9                   	leave  
 100238d:	c3                   	ret    

0100238e <set_proc>:
 100238e:	55                   	push   ebp
 100238f:	89 e5                	mov    ebp,esp
 1002391:	83 ec 18             	sub    esp,0x18
 1002394:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 1002397:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100239d:	05 60 2d 40 00       	add    eax,0x402d60
 10023a2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10023a5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023a8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10023ab:	89 90 38 01 00 00    	mov    DWORD PTR [eax+0x138],edx
 10023b1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023b4:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 10023b7:	89 90 44 01 00 00    	mov    DWORD PTR [eax+0x144],edx
 10023bd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023c0:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 10023c3:	89 90 3c 01 00 00    	mov    DWORD PTR [eax+0x13c],edx
 10023c9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023cc:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10023cf:	89 90 40 01 00 00    	mov    DWORD PTR [eax+0x140],edx
 10023d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023d8:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 10023db:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10023e1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023e4:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 10023e7:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 10023ed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023f0:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10023f3:	89 90 60 01 00 00    	mov    DWORD PTR [eax+0x160],edx
 10023f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10023fc:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 10023ff:	89 90 18 01 00 00    	mov    DWORD PTR [eax+0x118],edx
 1002405:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002408:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 100240b:	89 90 20 01 00 00    	mov    DWORD PTR [eax+0x120],edx
 1002411:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002414:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
 1002417:	89 90 28 01 00 00    	mov    DWORD PTR [eax+0x128],edx
 100241d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002420:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 1002423:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 1002429:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100242c:	8b 55 28             	mov    edx,DWORD PTR [ebp+0x28]
 100242f:	89 90 68 01 00 00    	mov    DWORD PTR [eax+0x168],edx
 1002435:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002438:	8b 55 2c             	mov    edx,DWORD PTR [ebp+0x2c]
 100243b:	89 90 6c 01 00 00    	mov    DWORD PTR [eax+0x16c],edx
 1002441:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002444:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002447:	89 90 48 01 00 00    	mov    DWORD PTR [eax+0x148],edx
 100244d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002450:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 1002453:	89 90 14 01 00 00    	mov    DWORD PTR [eax+0x114],edx
 1002459:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100245c:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 100245f:	89 90 1c 01 00 00    	mov    DWORD PTR [eax+0x11c],edx
 1002465:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002468:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
 100246b:	89 90 24 01 00 00    	mov    DWORD PTR [eax+0x124],edx
 1002471:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002474:	8b 55 34             	mov    edx,DWORD PTR [ebp+0x34]
 1002477:	89 90 4c 01 00 00    	mov    DWORD PTR [eax+0x14c],edx
 100247d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002480:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
 1002483:	89 90 50 01 00 00    	mov    DWORD PTR [eax+0x150],edx
 1002489:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100248c:	8b 55 3c             	mov    edx,DWORD PTR [ebp+0x3c]
 100248f:	89 90 54 01 00 00    	mov    DWORD PTR [eax+0x154],edx
 1002495:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002498:	c7 80 34 01 00 00 02 	mov    DWORD PTR [eax+0x134],0x202
 100249f:	02 00 00 
 10024a2:	ba 8d 25 00 01       	mov    edx,0x100258d
 10024a7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024aa:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 10024b0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024b3:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
 10024b6:	89 90 5c 01 00 00    	mov    DWORD PTR [eax+0x15c],edx
 10024bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024bf:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
 10024c2:	89 90 64 01 00 00    	mov    DWORD PTR [eax+0x164],edx
 10024c8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024cb:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
 10024ce:	89 90 58 01 00 00    	mov    DWORD PTR [eax+0x158],edx
 10024d4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024d7:	c7 80 2c 01 00 00 00 	mov    DWORD PTR [eax+0x12c],0x1000
 10024de:	10 00 00 
 10024e1:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10024e4:	83 c0 03             	add    eax,0x3
 10024e7:	c1 e0 04             	shl    eax,0x4
 10024ea:	89 c2                	mov    edx,eax
 10024ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10024ef:	89 90 70 01 00 00    	mov    DWORD PTR [eax+0x170],edx
 10024f5:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 10024f8:	01 c0                	add    eax,eax
 10024fa:	83 c0 05             	add    eax,0x5
 10024fd:	89 c2                	mov    edx,eax
 10024ff:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002502:	05 10 01 00 00       	add    eax,0x110
 1002507:	52                   	push   edx
 1002508:	68 89 00 00 00       	push   0x89
 100250d:	68 ff ff 00 00       	push   0xffff
 1002512:	50                   	push   eax
 1002513:	e8 65 0b 00 00       	call   100307d <fill_desc>
 1002518:	83 c4 10             	add    esp,0x10
 100251b:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
 100251e:	83 c0 03             	add    eax,0x3
 1002521:	01 c0                	add    eax,eax
 1002523:	89 c2                	mov    edx,eax
 1002525:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002528:	83 c0 34             	add    eax,0x34
 100252b:	52                   	push   edx
 100252c:	68 82 00 00 00       	push   0x82
 1002531:	6a 28                	push   0x28
 1002533:	50                   	push   eax
 1002534:	e8 44 0b 00 00       	call   100307d <fill_desc>
 1002539:	83 c4 10             	add    esp,0x10
 100253c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100253f:	83 c0 34             	add    eax,0x34
 1002542:	50                   	push   eax
 1002543:	68 fe 80 00 00       	push   0x80fe
 1002548:	6a ff                	push   0xffffffff
 100254a:	6a 00                	push   0x0
 100254c:	e8 37 0c 00 00       	call   1003188 <fill_ldt_desc>
 1002551:	83 c4 10             	add    esp,0x10
 1002554:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002557:	83 c0 3c             	add    eax,0x3c
 100255a:	50                   	push   eax
 100255b:	68 f2 80 00 00       	push   0x80f2
 1002560:	6a ff                	push   0xffffffff
 1002562:	6a 00                	push   0x0
 1002564:	e8 1f 0c 00 00       	call   1003188 <fill_ldt_desc>
 1002569:	83 c4 10             	add    esp,0x10
 100256c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100256f:	83 c0 44             	add    eax,0x44
 1002572:	50                   	push   eax
 1002573:	68 f6 00 00 00       	push   0xf6
 1002578:	68 00 10 00 00       	push   0x1000
 100257d:	68 00 f0 bf 01       	push   0x1bff000
 1002582:	e8 01 0c 00 00       	call   1003188 <fill_ldt_desc>
 1002587:	83 c4 10             	add    esp,0x10
 100258a:	90                   	nop
 100258b:	c9                   	leave  
 100258c:	c3                   	ret    

0100258d <proc_zero>:
 100258d:	55                   	push   ebp
 100258e:	89 e5                	mov    ebp,esp
 1002590:	eb fe                	jmp    1002590 <proc_zero+0x3>

01002592 <manage_proc>:
 1002592:	55                   	push   ebp
 1002593:	89 e5                	mov    ebp,esp
 1002595:	83 ec 18             	sub    esp,0x18
 1002598:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 100259d:	83 f8 ff             	cmp    eax,0xffffffff
 10025a0:	74 23                	je     10025c5 <manage_proc+0x33>
 10025a2:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10025a7:	69 d0 78 01 00 00    	imul   edx,eax,0x178
 10025ad:	81 c2 68 2d 40 00    	add    edx,0x402d68
 10025b3:	8b 12                	mov    edx,DWORD PTR [edx]
 10025b5:	83 c2 01             	add    edx,0x1
 10025b8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025be:	05 68 2d 40 00       	add    eax,0x402d68
 10025c3:	89 10                	mov    DWORD PTR [eax],edx
 10025c5:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10025ca:	83 f8 ff             	cmp    eax,0xffffffff
 10025cd:	74 32                	je     1002601 <manage_proc+0x6f>
 10025cf:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10025d4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025da:	05 68 2d 40 00       	add    eax,0x402d68
 10025df:	8b 00                	mov    eax,DWORD PTR [eax]
 10025e1:	83 f8 01             	cmp    eax,0x1
 10025e4:	77 1b                	ja     1002601 <manage_proc+0x6f>
 10025e6:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10025eb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10025f1:	05 64 2d 40 00       	add    eax,0x402d64
 10025f6:	8b 00                	mov    eax,DWORD PTR [eax]
 10025f8:	83 f8 01             	cmp    eax,0x1
 10025fb:	0f 84 85 00 00 00    	je     1002686 <manage_proc+0xf4>
 1002601:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002606:	83 f8 ff             	cmp    eax,0xffffffff
 1002609:	74 16                	je     1002621 <manage_proc+0x8f>
 100260b:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002610:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002616:	05 68 2d 40 00       	add    eax,0x402d68
 100261b:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1002621:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1002628:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100262f:	eb 38                	jmp    1002669 <manage_proc+0xd7>
 1002631:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002634:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100263a:	05 60 2d 40 00       	add    eax,0x402d60
 100263f:	8b 00                	mov    eax,DWORD PTR [eax]
 1002641:	83 f8 ff             	cmp    eax,0xffffffff
 1002644:	74 1f                	je     1002665 <manage_proc+0xd3>
 1002646:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002649:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100264f:	05 64 2d 40 00       	add    eax,0x402d64
 1002654:	8b 00                	mov    eax,DWORD PTR [eax]
 1002656:	83 f8 01             	cmp    eax,0x1
 1002659:	75 0a                	jne    1002665 <manage_proc+0xd3>
 100265b:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002660:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 1002663:	75 0c                	jne    1002671 <manage_proc+0xdf>
 1002665:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1002669:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 100266d:	7e c2                	jle    1002631 <manage_proc+0x9f>
 100266f:	eb 01                	jmp    1002672 <manage_proc+0xe0>
 1002671:	90                   	nop
 1002672:	83 7d f4 3f          	cmp    DWORD PTR [ebp-0xc],0x3f
 1002676:	7f 11                	jg     1002689 <manage_proc+0xf7>
 1002678:	83 ec 0c             	sub    esp,0xc
 100267b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100267e:	e8 09 00 00 00       	call   100268c <switch_proc_tss>
 1002683:	83 c4 10             	add    esp,0x10
 1002686:	90                   	nop
 1002687:	eb 01                	jmp    100268a <manage_proc+0xf8>
 1002689:	90                   	nop
 100268a:	c9                   	leave  
 100268b:	c3                   	ret    

0100268c <switch_proc_tss>:
 100268c:	55                   	push   ebp
 100268d:	89 e5                	mov    ebp,esp
 100268f:	83 ec 18             	sub    esp,0x18
 1002692:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002695:	01 c0                	add    eax,eax
 1002697:	83 c0 05             	add    eax,0x5
 100269a:	c1 e0 03             	shl    eax,0x3
 100269d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10026a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10026a3:	a3 c8 8b 40 00       	mov    ds:0x408bc8,eax
 10026a8:	83 ec 0c             	sub    esp,0xc
 10026ab:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 10026ae:	e8 d8 45 00 00       	call   1006c8b <switch_proc_asm>
 10026b3:	83 c4 10             	add    esp,0x10
 10026b6:	90                   	nop
 10026b7:	c9                   	leave  
 10026b8:	c3                   	ret    

010026b9 <switch_proc>:
 10026b9:	55                   	push   ebp
 10026ba:	89 e5                	mov    ebp,esp
 10026bc:	57                   	push   edi
 10026bd:	56                   	push   esi
 10026be:	53                   	push   ebx
 10026bf:	81 ec 8c 01 00 00    	sub    esp,0x18c
 10026c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10026c8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10026ce:	8d 90 60 2d 40 00    	lea    edx,[eax+0x402d60]
 10026d4:	8d 85 6c fe ff ff    	lea    eax,[ebp-0x194]
 10026da:	89 d3                	mov    ebx,edx
 10026dc:	ba 5e 00 00 00       	mov    edx,0x5e
 10026e1:	89 c7                	mov    edi,eax
 10026e3:	89 de                	mov    esi,ebx
 10026e5:	89 d1                	mov    ecx,edx
 10026e7:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10026e9:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10026ee:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10026f4:	05 10 01 00 00       	add    eax,0x110
 10026f9:	05 60 2d 40 00       	add    eax,0x402d60
 10026fe:	83 ec 0c             	sub    esp,0xc
 1002701:	50                   	push   eax
 1002702:	e8 5f 00 00 00       	call   1002766 <save_context>
 1002707:	83 c4 10             	add    esp,0x10
 100270a:	b8 8d 25 00 01       	mov    eax,0x100258d
 100270f:	a3 90 2e 40 00       	mov    ds:0x402e90,eax
 1002714:	c7 05 8c 2e 40 00 00 	mov    DWORD PTR ds:0x402e8c,0x1000
 100271b:	10 00 00 
 100271e:	c7 05 94 2e 40 00 02 	mov    DWORD PTR ds:0x402e94,0x202
 1002725:	02 00 00 
 1002728:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100272b:	a3 c8 8b 40 00       	mov    ds:0x408bc8,eax
 1002730:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002733:	01 c0                	add    eax,eax
 1002735:	83 c0 05             	add    eax,0x5
 1002738:	c1 e0 03             	shl    eax,0x3
 100273b:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 100273e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002741:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002747:	05 10 01 00 00       	add    eax,0x110
 100274c:	05 60 2d 40 00       	add    eax,0x402d60
 1002751:	83 ec 0c             	sub    esp,0xc
 1002754:	50                   	push   eax
 1002755:	e8 4e 45 00 00       	call   1006ca8 <switch_to>
 100275a:	83 c4 10             	add    esp,0x10
 100275d:	90                   	nop
 100275e:	8d 65 f4             	lea    esp,[ebp-0xc]
 1002761:	5b                   	pop    ebx
 1002762:	5e                   	pop    esi
 1002763:	5f                   	pop    edi
 1002764:	5d                   	pop    ebp
 1002765:	c3                   	ret    

01002766 <save_context>:
 1002766:	55                   	push   ebp
 1002767:	89 e5                	mov    ebp,esp
 1002769:	8b 15 80 8b 40 00    	mov    edx,DWORD PTR ds:0x408b80
 100276f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002772:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
 1002775:	8b 15 88 8b 40 00    	mov    edx,DWORD PTR ds:0x408b88
 100277b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100277e:	89 50 28             	mov    DWORD PTR [eax+0x28],edx
 1002781:	8b 15 94 8b 40 00    	mov    edx,DWORD PTR ds:0x408b94
 1002787:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100278a:	89 50 34             	mov    DWORD PTR [eax+0x34],edx
 100278d:	8b 15 8c 8b 40 00    	mov    edx,DWORD PTR ds:0x408b8c
 1002793:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002796:	89 50 2c             	mov    DWORD PTR [eax+0x2c],edx
 1002799:	8b 15 90 8b 40 00    	mov    edx,DWORD PTR ds:0x408b90
 100279f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027a2:	89 50 30             	mov    DWORD PTR [eax+0x30],edx
 10027a5:	8b 15 a0 8b 40 00    	mov    edx,DWORD PTR ds:0x408ba0
 10027ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027ae:	89 50 40             	mov    DWORD PTR [eax+0x40],edx
 10027b1:	8b 15 a4 8b 40 00    	mov    edx,DWORD PTR ds:0x408ba4
 10027b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027ba:	89 50 44             	mov    DWORD PTR [eax+0x44],edx
 10027bd:	8b 15 84 8b 40 00    	mov    edx,DWORD PTR ds:0x408b84
 10027c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027c6:	89 50 24             	mov    DWORD PTR [eax+0x24],edx
 10027c9:	8b 15 98 8b 40 00    	mov    edx,DWORD PTR ds:0x408b98
 10027cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027d2:	89 50 38             	mov    DWORD PTR [eax+0x38],edx
 10027d5:	8b 15 9c 8b 40 00    	mov    edx,DWORD PTR ds:0x408b9c
 10027db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10027de:	89 50 3c             	mov    DWORD PTR [eax+0x3c],edx
 10027e1:	90                   	nop
 10027e2:	5d                   	pop    ebp
 10027e3:	c3                   	ret    

010027e4 <palloc>:
 10027e4:	55                   	push   ebp
 10027e5:	89 e5                	mov    ebp,esp
 10027e7:	83 ec 48             	sub    esp,0x48
 10027ea:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10027ed:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 10027f3:	85 c0                	test   eax,eax
 10027f5:	0f 48 c2             	cmovs  eax,edx
 10027f8:	c1 f8 0c             	sar    eax,0xc
 10027fb:	89 c1                	mov    ecx,eax
 10027fd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002800:	99                   	cdq    
 1002801:	c1 ea 14             	shr    edx,0x14
 1002804:	01 d0                	add    eax,edx
 1002806:	25 ff 0f 00 00       	and    eax,0xfff
 100280b:	29 d0                	sub    eax,edx
 100280d:	01 c8                	add    eax,ecx
 100280f:	85 c0                	test   eax,eax
 1002811:	0f 95 c0             	setne  al
 1002814:	0f b6 c0             	movzx  eax,al
 1002817:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100281a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1002821:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1002828:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100282b:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002831:	05 8c 2e 40 00       	add    eax,0x402e8c
 1002836:	8b 00                	mov    eax,DWORD PTR [eax]
 1002838:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 100283b:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 100283f:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 1002846:	e9 ff 01 00 00       	jmp    1002a4a <palloc+0x266>
 100284b:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 100284e:	8b 00                	mov    eax,DWORD PTR [eax]
 1002850:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002855:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1002858:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 100285f:	e9 d1 01 00 00       	jmp    1002a35 <palloc+0x251>
 1002864:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1002867:	8b 00                	mov    eax,DWORD PTR [eax]
 1002869:	83 e0 01             	and    eax,0x1
 100286c:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 100286f:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 1002873:	0f 85 b4 01 00 00    	jne    1002a2d <palloc+0x249>
 1002879:	e8 98 e8 ff ff       	call   1001116 <req_a_page>
 100287e:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1002881:	83 7d d4 ff          	cmp    DWORD PTR [ebp-0x2c],0xffffffff
 1002885:	0f 85 a4 00 00 00    	jne    100292f <palloc+0x14b>
 100288b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100288e:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002894:	05 a4 2d 40 00       	add    eax,0x402da4
 1002899:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100289c:	0f b7 c0             	movzx  eax,ax
 100289f:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 10028a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028a5:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028ab:	05 a0 2d 40 00       	add    eax,0x402da0
 10028b0:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10028b4:	0f b7 c0             	movzx  eax,ax
 10028b7:	c1 e0 10             	shl    eax,0x10
 10028ba:	25 00 00 0f 00       	and    eax,0xf0000
 10028bf:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 10028c2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10028c5:	01 45 c0             	add    DWORD PTR [ebp-0x40],eax
 10028c8:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10028cb:	89 c2                	mov    edx,eax
 10028cd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028d0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028d6:	05 a4 2d 40 00       	add    eax,0x402da4
 10028db:	66 89 10             	mov    WORD PTR [eax],dx
 10028de:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10028e1:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10028e7:	05 a0 2d 40 00       	add    eax,0x402da0
 10028ec:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10028f0:	0f b7 c0             	movzx  eax,ax
 10028f3:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10028f6:	81 65 bc f0 ff 00 00 	and    DWORD PTR [ebp-0x44],0xfff0
 10028fd:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1002900:	c1 e8 10             	shr    eax,0x10
 1002903:	83 e0 0f             	and    eax,0xf
 1002906:	89 c2                	mov    edx,eax
 1002908:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 100290b:	01 d0                	add    eax,edx
 100290d:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 1002910:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 1002913:	89 c2                	mov    edx,eax
 1002915:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002918:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 100291e:	05 a0 2d 40 00       	add    eax,0x402da0
 1002923:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 1002927:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100292a:	e9 2d 01 00 00       	jmp    1002a5c <palloc+0x278>
 100292f:	83 ec 0c             	sub    esp,0xc
 1002932:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1002935:	e8 39 e9 ff ff       	call   1001273 <get_phyaddr>
 100293a:	83 c4 10             	add    esp,0x10
 100293d:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1002940:	83 ec 04             	sub    esp,0x4
 1002943:	6a 07                	push   0x7
 1002945:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 1002948:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 100294b:	e8 2e e9 ff ff       	call   100127e <set_page_item>
 1002950:	83 c4 10             	add    esp,0x10
 1002953:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002956:	c1 e0 0a             	shl    eax,0xa
 1002959:	89 c2                	mov    edx,eax
 100295b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100295e:	01 d0                	add    eax,edx
 1002960:	c1 e0 0c             	shl    eax,0xc
 1002963:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1002966:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 100296a:	75 0e                	jne    100297a <palloc+0x196>
 100296c:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 100296f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002972:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1002975:	a3 d0 8b 40 00       	mov    ds:0x408bd0,eax
 100297a:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 100297e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1002982:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1002986:	0f 85 a1 00 00 00    	jne    1002a2d <palloc+0x249>
 100298c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100298f:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002995:	05 a4 2d 40 00       	add    eax,0x402da4
 100299a:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100299d:	0f b7 c0             	movzx  eax,ax
 10029a0:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10029a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029a6:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029ac:	05 a0 2d 40 00       	add    eax,0x402da0
 10029b1:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10029b5:	0f b7 c0             	movzx  eax,ax
 10029b8:	c1 e0 10             	shl    eax,0x10
 10029bb:	25 00 00 0f 00       	and    eax,0xf0000
 10029c0:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 10029c3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10029c6:	01 45 c8             	add    DWORD PTR [ebp-0x38],eax
 10029c9:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10029cc:	89 c2                	mov    edx,eax
 10029ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029d1:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029d7:	05 a4 2d 40 00       	add    eax,0x402da4
 10029dc:	66 89 10             	mov    WORD PTR [eax],dx
 10029df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10029e2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10029e8:	05 a0 2d 40 00       	add    eax,0x402da0
 10029ed:	0f b7 40 09          	movzx  eax,WORD PTR [eax+0x9]
 10029f1:	0f b7 c0             	movzx  eax,ax
 10029f4:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 10029f7:	81 65 c4 f0 ff 00 00 	and    DWORD PTR [ebp-0x3c],0xfff0
 10029fe:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1002a01:	c1 e8 10             	shr    eax,0x10
 1002a04:	83 e0 0f             	and    eax,0xf
 1002a07:	89 c2                	mov    edx,eax
 1002a09:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1002a0c:	01 d0                	add    eax,edx
 1002a0e:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 1002a11:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1002a14:	89 c2                	mov    edx,eax
 1002a16:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002a19:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002a1f:	05 a0 2d 40 00       	add    eax,0x402da0
 1002a24:	66 89 50 09          	mov    WORD PTR [eax+0x9],dx
 1002a28:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1002a2b:	eb 2f                	jmp    1002a5c <palloc+0x278>
 1002a2d:	83 45 e0 04          	add    DWORD PTR [ebp-0x20],0x4
 1002a31:	83 45 dc 01          	add    DWORD PTR [ebp-0x24],0x1
 1002a35:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [ebp-0x24],0x3ff
 1002a3c:	0f 8e 22 fe ff ff    	jle    1002864 <palloc+0x80>
 1002a42:	83 45 e8 04          	add    DWORD PTR [ebp-0x18],0x4
 1002a46:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1002a4a:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [ebp-0x1c],0x3ff
 1002a51:	0f 8e f4 fd ff ff    	jle    100284b <palloc+0x67>
 1002a57:	b8 00 00 00 00       	mov    eax,0x0
 1002a5c:	c9                   	leave  
 1002a5d:	c3                   	ret    

01002a5e <malloc>:
 1002a5e:	55                   	push   ebp
 1002a5f:	89 e5                	mov    ebp,esp
 1002a61:	83 ec 08             	sub    esp,0x8
 1002a64:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002a69:	83 ec 08             	sub    esp,0x8
 1002a6c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1002a6f:	50                   	push   eax
 1002a70:	e8 6f fd ff ff       	call   10027e4 <palloc>
 1002a75:	83 c4 10             	add    esp,0x10
 1002a78:	c9                   	leave  
 1002a79:	c3                   	ret    

01002a7a <proc_end>:
 1002a7a:	55                   	push   ebp
 1002a7b:	89 e5                	mov    ebp,esp
 1002a7d:	83 ec 18             	sub    esp,0x18
 1002a80:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002a83:	a1 a8 2e 40 00       	mov    eax,ds:0x402ea8
 1002a88:	89 c4                	mov    esp,eax
 1002a8a:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002a8f:	83 ec 0c             	sub    esp,0xc
 1002a92:	50                   	push   eax
 1002a93:	e8 6d 00 00 00       	call   1002b05 <del_proc>
 1002a98:	83 c4 10             	add    esp,0x10
 1002a9b:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002aa0:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002aa6:	05 c0 2d 40 00       	add    eax,0x402dc0
 1002aab:	8b 00                	mov    eax,DWORD PTR [eax]
 1002aad:	83 f8 ff             	cmp    eax,0xffffffff
 1002ab0:	74 43                	je     1002af5 <proc_end+0x7b>
 1002ab2:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002ab7:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002abd:	05 c0 2d 40 00       	add    eax,0x402dc0
 1002ac2:	8b 00                	mov    eax,DWORD PTR [eax]
 1002ac4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002aca:	05 64 2d 40 00       	add    eax,0x402d64
 1002acf:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002ad5:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002ada:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ae0:	05 c0 2d 40 00       	add    eax,0x402dc0
 1002ae5:	8b 00                	mov    eax,DWORD PTR [eax]
 1002ae7:	83 ec 0c             	sub    esp,0xc
 1002aea:	50                   	push   eax
 1002aeb:	e8 9c fb ff ff       	call   100268c <switch_proc_tss>
 1002af0:	83 c4 10             	add    esp,0x10
 1002af3:	eb 0d                	jmp    1002b02 <proc_end+0x88>
 1002af5:	83 ec 0c             	sub    esp,0xc
 1002af8:	6a 00                	push   0x0
 1002afa:	e8 8d fb ff ff       	call   100268c <switch_proc_tss>
 1002aff:	83 c4 10             	add    esp,0x10
 1002b02:	90                   	nop
 1002b03:	c9                   	leave  
 1002b04:	c3                   	ret    

01002b05 <del_proc>:
 1002b05:	55                   	push   ebp
 1002b06:	89 e5                	mov    ebp,esp
 1002b08:	83 ec 18             	sub    esp,0x18
 1002b0b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b0e:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b14:	05 64 2d 40 00       	add    eax,0x402d64
 1002b19:	c7 00 03 00 00 00    	mov    DWORD PTR [eax],0x3
 1002b1f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b22:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b28:	05 60 2d 40 00       	add    eax,0x402d60
 1002b2d:	c7 00 ff ff ff ff    	mov    DWORD PTR [eax],0xffffffff
 1002b33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002b36:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002b3c:	05 8c 2e 40 00       	add    eax,0x402e8c
 1002b41:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b43:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002b46:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002b4a:	eb 61                	jmp    1002bad <del_proc+0xa8>
 1002b4c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002b4f:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b51:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002b56:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002b59:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1002b60:	eb 2f                	jmp    1002b91 <del_proc+0x8c>
 1002b62:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002b65:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b67:	83 e0 01             	and    eax,0x1
 1002b6a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002b6d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 1002b71:	74 16                	je     1002b89 <del_proc+0x84>
 1002b73:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002b76:	8b 00                	mov    eax,DWORD PTR [eax]
 1002b78:	25 00 f0 ff ff       	and    eax,0xfffff000
 1002b7d:	83 ec 0c             	sub    esp,0xc
 1002b80:	50                   	push   eax
 1002b81:	e8 36 e6 ff ff       	call   10011bc <free_page>
 1002b86:	83 c4 10             	add    esp,0x10
 1002b89:	83 45 f0 04          	add    DWORD PTR [ebp-0x10],0x4
 1002b8d:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1002b91:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [ebp-0x14],0x3ff
 1002b98:	7e c8                	jle    1002b62 <del_proc+0x5d>
 1002b9a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002b9d:	83 ec 0c             	sub    esp,0xc
 1002ba0:	50                   	push   eax
 1002ba1:	e8 df e3 ff ff       	call   1000f85 <vmfree>
 1002ba6:	83 c4 10             	add    esp,0x10
 1002ba9:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
 1002bad:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002bb0:	8b 00                	mov    eax,DWORD PTR [eax]
 1002bb2:	83 e0 01             	and    eax,0x1
 1002bb5:	85 c0                	test   eax,eax
 1002bb7:	75 93                	jne    1002b4c <del_proc+0x47>
 1002bb9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002bbc:	83 ec 0c             	sub    esp,0xc
 1002bbf:	50                   	push   eax
 1002bc0:	e8 c0 e3 ff ff       	call   1000f85 <vmfree>
 1002bc5:	83 c4 10             	add    esp,0x10
 1002bc8:	90                   	nop
 1002bc9:	c9                   	leave  
 1002bca:	c3                   	ret    

01002bcb <set_proc_stat>:
 1002bcb:	55                   	push   ebp
 1002bcc:	89 e5                	mov    ebp,esp
 1002bce:	83 ec 10             	sub    esp,0x10
 1002bd1:	83 7d 08 ff          	cmp    DWORD PTR [ebp+0x8],0xffffffff
 1002bd5:	75 07                	jne    1002bde <set_proc_stat+0x13>
 1002bd7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002bdc:	eb 6a                	jmp    1002c48 <set_proc_stat+0x7d>
 1002bde:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002be5:	eb 04                	jmp    1002beb <set_proc_stat+0x20>
 1002be7:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002beb:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002bee:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002bf4:	05 60 2d 40 00       	add    eax,0x402d60
 1002bf9:	8b 10                	mov    edx,DWORD PTR [eax]
 1002bfb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002bfe:	39 c2                	cmp    edx,eax
 1002c00:	75 e5                	jne    1002be7 <set_proc_stat+0x1c>
 1002c02:	83 7d fc 40          	cmp    DWORD PTR [ebp-0x4],0x40
 1002c06:	75 07                	jne    1002c0f <set_proc_stat+0x44>
 1002c08:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002c0d:	eb 39                	jmp    1002c48 <set_proc_stat+0x7d>
 1002c0f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002c12:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1002c15:	69 d2 78 01 00 00    	imul   edx,edx,0x178
 1002c1b:	81 c2 64 2d 40 00    	add    edx,0x402d64
 1002c21:	89 02                	mov    DWORD PTR [edx],eax
 1002c23:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002c28:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
 1002c2b:	75 16                	jne    1002c43 <set_proc_stat+0x78>
 1002c2d:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002c32:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002c38:	05 68 2d 40 00       	add    eax,0x402d68
 1002c3d:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002c43:	b8 00 00 00 00       	mov    eax,0x0
 1002c48:	c9                   	leave  
 1002c49:	c3                   	ret    

01002c4a <add_proc_openf>:
 1002c4a:	55                   	push   ebp
 1002c4b:	89 e5                	mov    ebp,esp
 1002c4d:	83 ec 10             	sub    esp,0x10
 1002c50:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1002c57:	eb 40                	jmp    1002c99 <add_proc_openf+0x4f>
 1002c59:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002c5e:	6b d0 5e             	imul   edx,eax,0x5e
 1002c61:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002c64:	01 d0                	add    eax,edx
 1002c66:	83 c0 24             	add    eax,0x24
 1002c69:	8b 04 85 60 2d 40 00 	mov    eax,DWORD PTR [eax*4+0x402d60]
 1002c70:	85 c0                	test   eax,eax
 1002c72:	75 21                	jne    1002c95 <add_proc_openf+0x4b>
 1002c74:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002c79:	6b d0 5e             	imul   edx,eax,0x5e
 1002c7c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002c7f:	01 d0                	add    eax,edx
 1002c81:	8d 50 24             	lea    edx,[eax+0x24]
 1002c84:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002c87:	89 04 95 60 2d 40 00 	mov    DWORD PTR [edx*4+0x402d60],eax
 1002c8e:	b8 00 00 00 00       	mov    eax,0x0
 1002c93:	eb 0f                	jmp    1002ca4 <add_proc_openf+0x5a>
 1002c95:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1002c99:	83 7d fc 1f          	cmp    DWORD PTR [ebp-0x4],0x1f
 1002c9d:	7e ba                	jle    1002c59 <add_proc_openf+0xf>
 1002c9f:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002ca4:	c9                   	leave  
 1002ca5:	c3                   	ret    

01002ca6 <sys_exit>:
 1002ca6:	55                   	push   ebp
 1002ca7:	89 e5                	mov    ebp,esp
 1002ca9:	83 ec 08             	sub    esp,0x8
 1002cac:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002cb1:	83 ec 0c             	sub    esp,0xc
 1002cb4:	50                   	push   eax
 1002cb5:	e8 4b fe ff ff       	call   1002b05 <del_proc>
 1002cba:	83 c4 10             	add    esp,0x10
 1002cbd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002cc0:	c9                   	leave  
 1002cc1:	c3                   	ret    

01002cc2 <reg_proc>:
 1002cc2:	55                   	push   ebp
 1002cc3:	89 e5                	mov    ebp,esp
 1002cc5:	83 ec 18             	sub    esp,0x18
 1002cc8:	e8 10 f6 ff ff       	call   10022dd <req_proc>
 1002ccd:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1002cd0:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1002cd4:	75 0a                	jne    1002ce0 <reg_proc+0x1e>
 1002cd6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1002cdb:	e9 1a 01 00 00       	jmp    1002dfa <reg_proc+0x138>
 1002ce0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1002ce3:	6a 00                	push   0x0
 1002ce5:	6a 00                	push   0x0
 1002ce7:	6a 00                	push   0x0
 1002ce9:	6a 00                	push   0x0
 1002ceb:	68 fc ff bf 01       	push   0x1bffffc
 1002cf0:	6a 10                	push   0x10
 1002cf2:	6a 10                	push   0x10
 1002cf4:	6a 10                	push   0x10
 1002cf6:	6a 10                	push   0x10
 1002cf8:	6a 08                	push   0x8
 1002cfa:	6a 10                	push   0x10
 1002cfc:	6a 00                	push   0x0
 1002cfe:	6a 00                	push   0x0
 1002d00:	6a 00                	push   0x0
 1002d02:	6a 00                	push   0x0
 1002d04:	e8 85 f6 ff ff       	call   100238e <set_proc>
 1002d09:	83 c4 40             	add    esp,0x40
 1002d0c:	e8 eb e1 ff ff       	call   1000efc <vmalloc>
 1002d11:	89 c2                	mov    edx,eax
 1002d13:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002d16:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d1c:	05 e4 2d 40 00       	add    eax,0x402de4
 1002d21:	89 10                	mov    DWORD PTR [eax],edx
 1002d23:	e8 d4 e1 ff ff       	call   1000efc <vmalloc>
 1002d28:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002d2b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002d2e:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d34:	05 e4 2d 40 00       	add    eax,0x402de4
 1002d39:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d3b:	c7 00 07 20 00 00    	mov    DWORD PTR [eax],0x2007
 1002d41:	e8 b6 e1 ff ff       	call   1000efc <vmalloc>
 1002d46:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002d49:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1002d4c:	83 c8 07             	or     eax,0x7
 1002d4f:	89 c2                	mov    edx,eax
 1002d51:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002d54:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d5a:	05 e4 2d 40 00       	add    eax,0x402de4
 1002d5f:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d61:	83 c0 18             	add    eax,0x18
 1002d64:	89 10                	mov    DWORD PTR [eax],edx
 1002d66:	e8 ab e3 ff ff       	call   1001116 <req_a_page>
 1002d6b:	83 ec 0c             	sub    esp,0xc
 1002d6e:	50                   	push   eax
 1002d6f:	e8 ff e4 ff ff       	call   1001273 <get_phyaddr>
 1002d74:	83 c4 10             	add    esp,0x10
 1002d77:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1002d7a:	81 c2 fc 0f 00 00    	add    edx,0xffc
 1002d80:	83 c8 07             	or     eax,0x7
 1002d83:	89 02                	mov    DWORD PTR [edx],eax
 1002d85:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002d88:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002d8e:	05 e4 2d 40 00       	add    eax,0x402de4
 1002d93:	8b 00                	mov    eax,DWORD PTR [eax]
 1002d95:	89 c2                	mov    edx,eax
 1002d97:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002d9a:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002da0:	05 8c 2e 40 00       	add    eax,0x402e8c
 1002da5:	89 10                	mov    DWORD PTR [eax],edx
 1002da7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002daa:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002db0:	05 64 2d 40 00       	add    eax,0x402d64
 1002db5:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 1002dbb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002dbe:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002dc4:	8d 90 e8 2d 40 00    	lea    edx,[eax+0x402de8]
 1002dca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1002dcd:	89 02                	mov    DWORD PTR [edx],eax
 1002dcf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002dd2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002dd8:	8d 90 ec 2d 40 00    	lea    edx,[eax+0x402dec]
 1002dde:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1002de1:	89 02                	mov    DWORD PTR [edx],eax
 1002de3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002de6:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002dec:	8d 90 90 2e 40 00    	lea    edx,[eax+0x402e90]
 1002df2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002df5:	89 02                	mov    DWORD PTR [edx],eax
 1002df7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002dfa:	c9                   	leave  
 1002dfb:	c3                   	ret    

01002dfc <sys_malloc>:
 1002dfc:	55                   	push   ebp
 1002dfd:	89 e5                	mov    ebp,esp
 1002dff:	83 ec 20             	sub    esp,0x20
 1002e02:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002e05:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1002e0b:	85 c0                	test   eax,eax
 1002e0d:	0f 48 c2             	cmovs  eax,edx
 1002e10:	c1 f8 0c             	sar    eax,0xc
 1002e13:	89 c1                	mov    ecx,eax
 1002e15:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002e18:	99                   	cdq    
 1002e19:	c1 ea 14             	shr    edx,0x14
 1002e1c:	01 d0                	add    eax,edx
 1002e1e:	25 ff 0f 00 00       	and    eax,0xfff
 1002e23:	29 d0                	sub    eax,edx
 1002e25:	01 c8                	add    eax,ecx
 1002e27:	85 c0                	test   eax,eax
 1002e29:	0f 95 c0             	setne  al
 1002e2c:	0f b6 c0             	movzx  eax,al
 1002e2f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1002e32:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002e37:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002e3d:	05 74 2d 40 00       	add    eax,0x402d74
 1002e42:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e44:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002e47:	eb 09                	jmp    1002e52 <sys_malloc+0x56>
 1002e49:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e4c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002e4f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002e52:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e55:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002e58:	85 c0                	test   eax,eax
 1002e5a:	74 14                	je     1002e70 <sys_malloc+0x74>
 1002e5c:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e5f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002e62:	85 c0                	test   eax,eax
 1002e64:	75 0a                	jne    1002e70 <sys_malloc+0x74>
 1002e66:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e69:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e6b:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002e6e:	7e d9                	jle    1002e49 <sys_malloc+0x4d>
 1002e70:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002e73:	8b 00                	mov    eax,DWORD PTR [eax]
 1002e75:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002e78:	7e 6f                	jle    1002ee9 <sys_malloc+0xed>
 1002e7a:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002e7f:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002e85:	05 78 2d 40 00       	add    eax,0x402d78
 1002e8a:	8b 10                	mov    edx,DWORD PTR [eax]
 1002e8c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002e8f:	c1 e0 0c             	shl    eax,0xc
 1002e92:	01 d0                	add    eax,edx
 1002e94:	3d ff ff ef 01       	cmp    eax,0x1efffff
 1002e99:	7e 0a                	jle    1002ea5 <sys_malloc+0xa9>
 1002e9b:	b8 00 00 00 00       	mov    eax,0x0
 1002ea0:	e9 a6 00 00 00       	jmp    1002f4b <sys_malloc+0x14f>
 1002ea5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002ea8:	8b 10                	mov    edx,DWORD PTR [eax]
 1002eaa:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002ead:	29 d0                	sub    eax,edx
 1002eaf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1002eb2:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1002eb7:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1002ebd:	05 78 2d 40 00       	add    eax,0x402d78
 1002ec2:	8b 00                	mov    eax,DWORD PTR [eax]
 1002ec4:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1002ec7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1002ece:	eb 11                	jmp    1002ee1 <sys_malloc+0xe5>
 1002ed0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002ed3:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1002ed6:	81 45 f8 00 10 00 00 	add    DWORD PTR [ebp-0x8],0x1000
 1002edd:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1002ee1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1002ee4:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 1002ee7:	7c e7                	jl     1002ed0 <sys_malloc+0xd4>
 1002ee9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002eec:	8b 00                	mov    eax,DWORD PTR [eax]
 1002eee:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
 1002ef1:	7d 46                	jge    1002f39 <sys_malloc+0x13d>
 1002ef3:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002ef6:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1002ef9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1002efc:	83 c0 01             	add    eax,0x1
 1002eff:	c1 e0 0c             	shl    eax,0xc
 1002f02:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
 1002f05:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1002f08:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1002f0b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f0e:	8b 00                	mov    eax,DWORD PTR [eax]
 1002f10:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1002f13:	8d 50 ff             	lea    edx,[eax-0x1]
 1002f16:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002f19:	89 10                	mov    DWORD PTR [eax],edx
 1002f1b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f1e:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1002f21:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002f24:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1002f27:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1002f2a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1002f2d:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
 1002f30:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f33:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1002f36:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
 1002f39:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f3c:	c7 40 04 01 00 00 00 	mov    DWORD PTR [eax+0x4],0x1
 1002f43:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f46:	05 00 10 00 00       	add    eax,0x1000
 1002f4b:	c9                   	leave  
 1002f4c:	c3                   	ret    

01002f4d <sys_free>:
 1002f4d:	55                   	push   ebp
 1002f4e:	89 e5                	mov    ebp,esp
 1002f50:	83 ec 10             	sub    esp,0x10
 1002f53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1002f56:	2d 00 10 00 00       	sub    eax,0x1000
 1002f5b:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1002f5e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002f61:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 1002f68:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002f6b:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002f6e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002f71:	eb 27                	jmp    1002f9a <sys_free+0x4d>
 1002f73:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f76:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002f79:	85 c0                	test   eax,eax
 1002f7b:	75 25                	jne    1002fa2 <sys_free+0x55>
 1002f7d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002f80:	8b 10                	mov    edx,DWORD PTR [eax]
 1002f82:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f85:	8b 00                	mov    eax,DWORD PTR [eax]
 1002f87:	83 c0 01             	add    eax,0x1
 1002f8a:	01 c2                	add    edx,eax
 1002f8c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002f8f:	89 10                	mov    DWORD PTR [eax],edx
 1002f91:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002f94:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1002f97:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002f9a:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1002f9e:	75 d3                	jne    1002f73 <sys_free+0x26>
 1002fa0:	eb 01                	jmp    1002fa3 <sys_free+0x56>
 1002fa2:	90                   	nop
 1002fa3:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002fa6:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1002fa9:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002fac:	eb 27                	jmp    1002fd5 <sys_free+0x88>
 1002fae:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002fb1:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1002fb4:	85 c0                	test   eax,eax
 1002fb6:	75 25                	jne    1002fdd <sys_free+0x90>
 1002fb8:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002fbb:	8b 10                	mov    edx,DWORD PTR [eax]
 1002fbd:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1002fc0:	8b 00                	mov    eax,DWORD PTR [eax]
 1002fc2:	83 c0 01             	add    eax,0x1
 1002fc5:	01 c2                	add    edx,eax
 1002fc7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002fca:	89 10                	mov    DWORD PTR [eax],edx
 1002fcc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1002fcf:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1002fd2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1002fd5:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1002fd9:	75 d3                	jne    1002fae <sys_free+0x61>
 1002fdb:	eb 01                	jmp    1002fde <sys_free+0x91>
 1002fdd:	90                   	nop
 1002fde:	b8 00 00 00 00       	mov    eax,0x0
 1002fe3:	c9                   	leave  
 1002fe4:	c3                   	ret    
 1002fe5:	66 90                	xchg   ax,ax
 1002fe7:	66 90                	xchg   ax,ax
 1002fe9:	66 90                	xchg   ax,ax
 1002feb:	66 90                	xchg   ax,ax
 1002fed:	66 90                	xchg   ax,ax
 1002fef:	90                   	nop

01002ff0 <outb>:
 1002ff0:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1002ff5:	8a 44 24 08          	mov    al,BYTE PTR [esp+0x8]
 1002ff9:	ee                   	out    dx,al
 1002ffa:	e8 31 00 00 00       	call   1003030 <io_delay>
 1002fff:	c3                   	ret    

01003000 <outw>:
 1003000:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1003005:	66 8b 44 24 08       	mov    ax,WORD PTR [esp+0x8]
 100300a:	66 ef                	out    dx,ax
 100300c:	90                   	nop
 100300d:	90                   	nop
 100300e:	90                   	nop
 100300f:	c3                   	ret    

01003010 <inb>:
 1003010:	31 c0                	xor    eax,eax
 1003012:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1003017:	ec                   	in     al,dx
 1003018:	90                   	nop
 1003019:	90                   	nop
 100301a:	90                   	nop
 100301b:	c3                   	ret    

0100301c <inw>:
 100301c:	31 c0                	xor    eax,eax
 100301e:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
 1003023:	66 ed                	in     ax,dx
 1003025:	90                   	nop
 1003026:	90                   	nop
 1003027:	90                   	nop
 1003028:	c3                   	ret    

01003029 <eoi>:
 1003029:	b0 20                	mov    al,0x20
 100302b:	e6 a0                	out    0xa0,al
 100302d:	e6 20                	out    0x20,al
 100302f:	c3                   	ret    

01003030 <io_delay>:
 1003030:	90                   	nop
 1003031:	90                   	nop
 1003032:	90                   	nop
 1003033:	90                   	nop
 1003034:	c3                   	ret    

01003035 <turn_on_int>:
 1003035:	b0 f8                	mov    al,0xf8
 1003037:	e6 21                	out    0x21,al
 1003039:	e8 f2 ff ff ff       	call   1003030 <io_delay>
 100303e:	b0 ef                	mov    al,0xef
 1003040:	e6 a1                	out    0xa1,al
 1003042:	e8 e9 ff ff ff       	call   1003030 <io_delay>
 1003047:	0f 01 1d 77 30 00 01 	lidtd  ds:0x1003077
 100304e:	90                   	nop
 100304f:	90                   	nop
 1003050:	90                   	nop
 1003051:	90                   	nop
 1003052:	fb                   	sti    
 1003053:	c3                   	ret    

01003054 <report_back_trace_of_err>:
 1003054:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1003058:	50                   	push   eax
 1003059:	68 62 30 00 01       	push   0x1003062
 100305e:	83 c4 08             	add    esp,0x8
 1003061:	c3                   	ret    

01003062 <bt_msg>:
 1003062:	65 72 72             	gs jb  10030d7 <fill_desc+0x5a>
 1003065:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1003066:	72 20                	jb     1003088 <fill_desc+0xb>
 1003068:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1003069:	63 63 75             	arpl   WORD PTR [ebx+0x75],sp
 100306c:	72 73                	jb     10030e1 <fill_desc+0x64>
 100306e:	20 61 74             	and    BYTE PTR [ecx+0x74],ah
 1003071:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR ds:0x6e5c78

01003077 <idtptr>:
 1003077:	f8                   	clc    
 1003078:	07                   	pop    es
 1003079:	00 00                	add    BYTE PTR [eax],al
	...

0100307d <fill_desc>:
 100307d:	55                   	push   ebp
 100307e:	89 e5                	mov    ebp,esp
 1003080:	83 ec 04             	sub    esp,0x4
 1003083:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003086:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 100308a:	8b 15 70 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d70
 1003090:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003093:	c1 e0 03             	shl    eax,0x3
 1003096:	01 d0                	add    eax,edx
 1003098:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 100309b:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 100309f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10030a2:	c1 e8 10             	shr    eax,0x10
 10030a5:	89 c1                	mov    ecx,eax
 10030a7:	8b 15 70 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d70
 10030ad:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10030b0:	c1 e0 03             	shl    eax,0x3
 10030b3:	01 d0                	add    eax,edx
 10030b5:	89 ca                	mov    edx,ecx
 10030b7:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 10030ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10030bd:	c1 e8 18             	shr    eax,0x18
 10030c0:	89 c1                	mov    ecx,eax
 10030c2:	8b 15 70 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d70
 10030c8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10030cb:	c1 e0 03             	shl    eax,0x3
 10030ce:	01 d0                	add    eax,edx
 10030d0:	89 ca                	mov    edx,ecx
 10030d2:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 10030d5:	8b 15 70 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d70
 10030db:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10030de:	c1 e0 03             	shl    eax,0x3
 10030e1:	01 d0                	add    eax,edx
 10030e3:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 10030e6:	66 89 10             	mov    WORD PTR [eax],dx
 10030e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10030ec:	c1 e8 10             	shr    eax,0x10
 10030ef:	83 e0 0f             	and    eax,0xf
 10030f2:	8b 0d 70 6d 00 01    	mov    ecx,DWORD PTR ds:0x1006d70
 10030f8:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
 10030fb:	c1 e2 03             	shl    edx,0x3
 10030fe:	01 ca                	add    edx,ecx
 1003100:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 1003104:	66 89 42 05          	mov    WORD PTR [edx+0x5],ax
 1003108:	90                   	nop
 1003109:	c9                   	leave  
 100310a:	c3                   	ret    

0100310b <fill_gate>:
 100310b:	55                   	push   ebp
 100310c:	89 e5                	mov    ebp,esp
 100310e:	83 ec 18             	sub    esp,0x18
 1003111:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 1003114:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1003117:	66 89 55 ec          	mov    WORD PTR [ebp-0x14],dx
 100311b:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
 100311f:	a1 70 6d 00 01       	mov    eax,ds:0x1006d70
 1003124:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1003127:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100312a:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003131:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003134:	01 d0                	add    eax,edx
 1003136:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 1003139:	66 89 10             	mov    WORD PTR [eax],dx
 100313c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100313f:	c1 e8 10             	shr    eax,0x10
 1003142:	89 c2                	mov    edx,eax
 1003144:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003147:	8d 0c c5 00 00 00 00 	lea    ecx,[eax*8+0x0]
 100314e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003151:	01 c8                	add    eax,ecx
 1003153:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
 1003157:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100315a:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003161:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1003164:	01 c2                	add    edx,eax
 1003166:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 100316a:	66 89 42 02          	mov    WORD PTR [edx+0x2],ax
 100316e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003171:	8d 14 c5 00 00 00 00 	lea    edx,[eax*8+0x0]
 1003178:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100317b:	01 c2                	add    edx,eax
 100317d:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
 1003181:	66 89 42 04          	mov    WORD PTR [edx+0x4],ax
 1003185:	90                   	nop
 1003186:	c9                   	leave  
 1003187:	c3                   	ret    

01003188 <fill_ldt_desc>:
 1003188:	55                   	push   ebp
 1003189:	89 e5                	mov    ebp,esp
 100318b:	83 ec 04             	sub    esp,0x4
 100318e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1003191:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
 1003195:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003198:	89 c2                	mov    edx,eax
 100319a:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 100319d:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
 10031a1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10031a4:	c1 e8 10             	shr    eax,0x10
 10031a7:	89 c2                	mov    edx,eax
 10031a9:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10031ac:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 10031af:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10031b2:	c1 e8 18             	shr    eax,0x18
 10031b5:	89 c2                	mov    edx,eax
 10031b7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10031ba:	88 50 07             	mov    BYTE PTR [eax+0x7],dl
 10031bd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10031c0:	89 c2                	mov    edx,eax
 10031c2:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10031c5:	66 89 10             	mov    WORD PTR [eax],dx
 10031c8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10031cb:	c1 e8 10             	shr    eax,0x10
 10031ce:	c1 e0 08             	shl    eax,0x8
 10031d1:	66 25 00 0f          	and    ax,0xf00
 10031d5:	66 0b 45 fc          	or     ax,WORD PTR [ebp-0x4]
 10031d9:	89 c2                	mov    edx,eax
 10031db:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10031de:	66 89 50 05          	mov    WORD PTR [eax+0x5],dx
 10031e2:	90                   	nop
 10031e3:	c9                   	leave  
 10031e4:	c3                   	ret    
 10031e5:	66 90                	xchg   ax,ax
 10031e7:	66 90                	xchg   ax,ax
 10031e9:	66 90                	xchg   ax,ax
 10031eb:	66 90                	xchg   ax,ax
 10031ed:	66 90                	xchg   ax,ax
 10031ef:	90                   	nop

010031f0 <fill_desc>:
 10031f0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10031f4:	8b 5c 24 08          	mov    ebx,DWORD PTR [esp+0x8]
 10031f8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10031fc:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 1003200:	be 00 60 00 00       	mov    esi,0x6000
 1003205:	c1 e2 03             	shl    edx,0x3
 1003208:	01 d6                	add    esi,edx
 100320a:	66 89 1e             	mov    WORD PTR [esi],bx
 100320d:	66 89 46 02          	mov    WORD PTR [esi+0x2],ax
 1003211:	c1 e8 10             	shr    eax,0x10
 1003214:	88 46 04             	mov    BYTE PTR [esi+0x4],al
 1003217:	c1 eb 10             	shr    ebx,0x10
 100321a:	88 5e 06             	mov    BYTE PTR [esi+0x6],bl
 100321d:	88 66 07             	mov    BYTE PTR [esi+0x7],ah
 1003220:	09 4e 05             	or     DWORD PTR [esi+0x5],ecx
 1003223:	c3                   	ret    

01003224 <clock_c>:
 1003224:	55                   	push   ebp
 1003225:	89 e5                	mov    ebp,esp
 1003227:	83 ec 08             	sub    esp,0x8
 100322a:	a1 60 6d 00 01       	mov    eax,ds:0x1006d60
 100322f:	85 c0                	test   eax,eax
 1003231:	75 05                	jne    1003238 <clock_c+0x14>
 1003233:	e8 5a f3 ff ff       	call   1002592 <manage_proc>
 1003238:	90                   	nop
 1003239:	c9                   	leave  
 100323a:	c3                   	ret    
 100323b:	66 90                	xchg   ax,ax
 100323d:	66 90                	xchg   ax,ax
 100323f:	90                   	nop

01003240 <clock>:
 1003240:	83 3d 60 6d 00 01 00 	cmp    DWORD PTR ds:0x1006d60,0x0
 1003247:	75 5d                	jne    10032a6 <clock.normal_part>
 1003249:	60                   	pusha  
 100324a:	b9 08 00 00 00       	mov    ecx,0x8
 100324f:	89 e6                	mov    esi,esp
 1003251:	bf 60 8b 40 00       	mov    edi,0x408b60
 1003256:	83 c7 44             	add    edi,0x44

01003259 <clock.saver_loop>:
 1003259:	8b 1e                	mov    ebx,DWORD PTR [esi]
 100325b:	89 1f                	mov    DWORD PTR [edi],ebx
 100325d:	83 c6 04             	add    esi,0x4
 1003260:	83 ef 04             	sub    edi,0x4
 1003263:	e2 f4                	loop   1003259 <clock.saver_loop>
 1003265:	61                   	popa   
 1003266:	bf 60 8b 40 00       	mov    edi,0x408b60
 100326b:	8b 04 24             	mov    eax,DWORD PTR [esp]
 100326e:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
 1003271:	9c                   	pushf  
 1003272:	5b                   	pop    ebx
 1003273:	81 cb 00 02 00 00    	or     ebx,0x200
 1003279:	89 5f 24             	mov    DWORD PTR [edi+0x24],ebx
 100327c:	66 8c c0             	mov    ax,es
 100327f:	66 89 47 48          	mov    WORD PTR [edi+0x48],ax
 1003283:	66 8c c8             	mov    ax,cs
 1003286:	66 89 47 4c          	mov    WORD PTR [edi+0x4c],ax
 100328a:	66 8c d0             	mov    ax,ss
 100328d:	66 89 47 50          	mov    WORD PTR [edi+0x50],ax
 1003291:	66 8c d8             	mov    ax,ds
 1003294:	66 89 47 54          	mov    WORD PTR [edi+0x54],ax
 1003298:	66 8c e0             	mov    ax,fs
 100329b:	66 89 47 58          	mov    WORD PTR [edi+0x58],ax
 100329f:	66 8c e8             	mov    ax,gs
 10032a2:	66 89 47 5c          	mov    WORD PTR [edi+0x5c],ax

010032a6 <clock.normal_part>:
 10032a6:	b0 20                	mov    al,0x20
 10032a8:	e6 a0                	out    0xa0,al
 10032aa:	e6 20                	out    0x20,al
 10032ac:	e8 73 ff ff ff       	call   1003224 <clock_c>
 10032b1:	cf                   	iret   

010032b2 <execute>:
 10032b2:	55                   	push   ebp
 10032b3:	89 e5                	mov    ebp,esp
 10032b5:	83 ec 18             	sub    esp,0x18
 10032b8:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 10032bf:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 10032c6:	83 ec 08             	sub    esp,0x8
 10032c9:	6a 01                	push   0x1
 10032cb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10032ce:	e8 b5 e3 ff ff       	call   1001688 <sys_open>
 10032d3:	83 c4 10             	add    esp,0x10
 10032d6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10032d9:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 10032dd:	75 0a                	jne    10032e9 <execute+0x37>
 10032df:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10032e4:	e9 a0 00 00 00       	jmp    1003389 <execute+0xd7>
 10032e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10032ec:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10032ef:	eb 04                	jmp    10032f5 <execute+0x43>
 10032f1:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10032f5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10032f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10032fb:	84 c0                	test   al,al
 10032fd:	75 f2                	jne    10032f1 <execute+0x3f>
 10032ff:	eb 04                	jmp    1003305 <execute+0x53>
 1003301:	83 6d f0 01          	sub    DWORD PTR [ebp-0x10],0x1
 1003305:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003308:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100330b:	3c 2f                	cmp    al,0x2f
 100330d:	74 08                	je     1003317 <execute+0x65>
 100330f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003312:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 1003315:	77 ea                	ja     1003301 <execute+0x4f>
 1003317:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100331a:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 100331d:	76 2c                	jbe    100334b <execute+0x99>
 100331f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003322:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1003325:	83 ec 08             	sub    esp,0x8
 1003328:	6a 01                	push   0x1
 100332a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100332d:	e8 56 e3 ff ff       	call   1001688 <sys_open>
 1003332:	83 c4 10             	add    esp,0x10
 1003335:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003338:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 100333c:	75 07                	jne    1003345 <execute+0x93>
 100333e:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003343:	eb 44                	jmp    1003389 <execute+0xd7>
 1003345:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003348:	c6 00 2f             	mov    BYTE PTR [eax],0x2f
 100334b:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 100334e:	89 d0                	mov    eax,edx
 1003350:	c1 e0 03             	shl    eax,0x3
 1003353:	01 d0                	add    eax,edx
 1003355:	c1 e0 03             	shl    eax,0x3
 1003358:	8d 88 60 04 40 00    	lea    ecx,[eax+0x400460]
 100335e:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1003361:	89 d0                	mov    eax,edx
 1003363:	c1 e0 03             	shl    eax,0x3
 1003366:	01 d0                	add    eax,edx
 1003368:	c1 e0 03             	shl    eax,0x3
 100336b:	05 60 04 40 00       	add    eax,0x400460
 1003370:	ba e7 33 00 01       	mov    edx,0x10033e7
 1003375:	83 ec 04             	sub    esp,0x4
 1003378:	51                   	push   ecx
 1003379:	50                   	push   eax
 100337a:	52                   	push   edx
 100337b:	e8 42 f9 ff ff       	call   1002cc2 <reg_proc>
 1003380:	83 c4 10             	add    esp,0x10
 1003383:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1003386:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003389:	c9                   	leave  
 100338a:	c3                   	ret    

0100338b <exec_call>:
 100338b:	55                   	push   ebp
 100338c:	89 e5                	mov    ebp,esp
 100338e:	83 ec 18             	sub    esp,0x18
 1003391:	83 ec 0c             	sub    esp,0xc
 1003394:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1003397:	e8 16 ff ff ff       	call   10032b2 <execute>
 100339c:	83 c4 10             	add    esp,0x10
 100339f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10033a2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10033a5:	01 c0                	add    eax,eax
 10033a7:	83 c0 05             	add    eax,0x5
 10033aa:	c1 e0 03             	shl    eax,0x3
 10033ad:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10033b0:	83 ec 0c             	sub    esp,0xc
 10033b3:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 10033b6:	e8 d1 f2 ff ff       	call   100268c <switch_proc_tss>
 10033bb:	83 c4 10             	add    esp,0x10
 10033be:	90                   	nop
 10033bf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10033c2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10033c8:	05 60 2d 40 00       	add    eax,0x402d60
 10033cd:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10033d0:	83 f8 03             	cmp    eax,0x3
 10033d3:	75 ea                	jne    10033bf <exec_call+0x34>
 10033d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10033d8:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10033de:	05 70 2d 40 00       	add    eax,0x402d70
 10033e3:	8b 00                	mov    eax,DWORD PTR [eax]
 10033e5:	c9                   	leave  
 10033e6:	c3                   	ret    

010033e7 <proc_start>:
 10033e7:	55                   	push   ebp
 10033e8:	89 e5                	mov    ebp,esp
 10033ea:	83 ec 08             	sub    esp,0x8
 10033ed:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10033f2:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10033f8:	05 60 2d 40 00       	add    eax,0x402d60
 10033fd:	83 ec 0c             	sub    esp,0xc
 1003400:	50                   	push   eax
 1003401:	e8 24 00 00 00       	call   100342a <load_pe>
 1003406:	83 c4 10             	add    esp,0x10
 1003409:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 100340e:	83 ec 0c             	sub    esp,0xc
 1003411:	50                   	push   eax
 1003412:	e8 ee f6 ff ff       	call   1002b05 <del_proc>
 1003417:	83 c4 10             	add    esp,0x10
 100341a:	83 ec 0c             	sub    esp,0xc
 100341d:	6a 00                	push   0x0
 100341f:	e8 68 f2 ff ff       	call   100268c <switch_proc_tss>
 1003424:	83 c4 10             	add    esp,0x10
 1003427:	90                   	nop
 1003428:	c9                   	leave  
 1003429:	c3                   	ret    

0100342a <load_pe>:
 100342a:	55                   	push   ebp
 100342b:	89 e5                	mov    ebp,esp
 100342d:	53                   	push   ebx
 100342e:	81 ec 14 02 00 00    	sub    esp,0x214
 1003434:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003437:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 100343d:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1003440:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1003443:	8b 00                	mov    eax,DWORD PTR [eax]
 1003445:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 1003448:	6a 40                	push   0x40
 100344a:	6a 00                	push   0x0
 100344c:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 1003452:	50                   	push   eax
 1003453:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003456:	e8 05 e6 ff ff       	call   1001a60 <sys_read>
 100345b:	83 c4 10             	add    esp,0x10
 100345e:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [ebp-0xd0]
 1003464:	68 f8 00 00 00       	push   0xf8
 1003469:	50                   	push   eax
 100346a:	8d 85 fc fd ff ff    	lea    eax,[ebp-0x204]
 1003470:	50                   	push   eax
 1003471:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003474:	e8 e7 e5 ff ff       	call   1001a60 <sys_read>
 1003479:	83 c4 10             	add    esp,0x10
 100347c:	8b 85 30 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1d0]
 1003482:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003485:	8b 85 4c fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b4]
 100348b:	c1 e8 0c             	shr    eax,0xc
 100348e:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 1003491:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003494:	c1 e8 16             	shr    eax,0x16
 1003497:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 100349a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100349d:	25 ff ff 3f 00       	and    eax,0x3fffff
 10034a2:	c1 e8 0c             	shr    eax,0xc
 10034a5:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 10034a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10034ab:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 10034b1:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 10034b4:	c1 e0 02             	shl    eax,0x2
 10034b7:	01 d0                	add    eax,edx
 10034b9:	8b 00                	mov    eax,DWORD PTR [eax]
 10034bb:	25 00 f0 ff ff       	and    eax,0xfffff000
 10034c0:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 10034c3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10034ca:	eb 3f                	jmp    100350b <load_pe+0xe1>
 10034cc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10034cf:	99                   	cdq    
 10034d0:	c1 ea 16             	shr    edx,0x16
 10034d3:	01 d0                	add    eax,edx
 10034d5:	25 ff 03 00 00       	and    eax,0x3ff
 10034da:	29 d0                	sub    eax,edx
 10034dc:	89 c2                	mov    edx,eax
 10034de:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 10034e1:	01 d0                	add    eax,edx
 10034e3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10034ea:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 10034ed:	01 d0                	add    eax,edx
 10034ef:	8b 00                	mov    eax,DWORD PTR [eax]
 10034f1:	83 e0 01             	and    eax,0x1
 10034f4:	85 c0                	test   eax,eax
 10034f6:	74 0f                	je     1003507 <load_pe+0xdd>
 10034f8:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 10034fc:	74 09                	je     1003507 <load_pe+0xdd>
 10034fe:	81 45 f4 00 10 00 00 	add    DWORD PTR [ebp-0xc],0x1000
 1003505:	eb 8a                	jmp    1003491 <load_pe+0x67>
 1003507:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 100350b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100350e:	3b 45 b8             	cmp    eax,DWORD PTR [ebp-0x48]
 1003511:	7c b9                	jl     10034cc <load_pe+0xa2>
 1003513:	90                   	nop
 1003514:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003517:	68 00 10 00 00       	push   0x1000
 100351c:	6a 00                	push   0x0
 100351e:	50                   	push   eax
 100351f:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003522:	e8 39 e5 ff ff       	call   1001a60 <sys_read>
 1003527:	83 c4 10             	add    esp,0x10
 100352a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100352d:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
 1003530:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
 1003533:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 1003536:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003539:	01 d0                	add    eax,edx
 100353b:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 100353e:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003541:	83 c0 04             	add    eax,0x4
 1003544:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
 1003547:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100354a:	8b 40 50             	mov    eax,DWORD PTR [eax+0x50]
 100354d:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
 1003550:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
 1003553:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1003559:	85 c0                	test   eax,eax
 100355b:	0f 48 c2             	cmovs  eax,edx
 100355e:	c1 f8 0c             	sar    eax,0xc
 1003561:	89 45 98             	mov    DWORD PTR [ebp-0x68],eax
 1003564:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003567:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
 100356a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100356d:	01 d0                	add    eax,edx
 100356f:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
 1003572:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 1003575:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 100357b:	85 c0                	test   eax,eax
 100357d:	0f 48 c2             	cmovs  eax,edx
 1003580:	c1 f8 0a             	sar    eax,0xa
 1003583:	89 c1                	mov    ecx,eax
 1003585:	8b 45 98             	mov    eax,DWORD PTR [ebp-0x68]
 1003588:	99                   	cdq    
 1003589:	c1 ea 16             	shr    edx,0x16
 100358c:	01 d0                	add    eax,edx
 100358e:	25 ff 03 00 00       	and    eax,0x3ff
 1003593:	29 d0                	sub    eax,edx
 1003595:	01 c8                	add    eax,ecx
 1003597:	85 c0                	test   eax,eax
 1003599:	0f 95 c0             	setne  al
 100359c:	0f b6 c0             	movzx  eax,al
 100359f:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 10035a2:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 10035a5:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 10035ab:	85 c0                	test   eax,eax
 10035ad:	0f 48 c2             	cmovs  eax,edx
 10035b0:	c1 f8 16             	sar    eax,0x16
 10035b3:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
 10035b6:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10035b9:	05 f8 00 00 00       	add    eax,0xf8
 10035be:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10035c1:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10035c4:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 10035c8:	0f b7 d0             	movzx  edx,ax
 10035cb:	89 d0                	mov    eax,edx
 10035cd:	c1 e0 02             	shl    eax,0x2
 10035d0:	01 d0                	add    eax,edx
 10035d2:	c1 e0 03             	shl    eax,0x3
 10035d5:	05 38 01 00 00       	add    eax,0x138
 10035da:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10035dd:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10035e0:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
 10035e3:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 10035e6:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10035e9:	99                   	cdq    
 10035ea:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10035ed:	89 d0                	mov    eax,edx
 10035ef:	85 c0                	test   eax,eax
 10035f1:	74 17                	je     100360a <load_pe+0x1e0>
 10035f3:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10035f6:	99                   	cdq    
 10035f7:	f7 7d 84             	idiv   DWORD PTR [ebp-0x7c]
 10035fa:	89 d1                	mov    ecx,edx
 10035fc:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 10035ff:	29 c8                	sub    eax,ecx
 1003601:	89 c2                	mov    edx,eax
 1003603:	8b 45 84             	mov    eax,DWORD PTR [ebp-0x7c]
 1003606:	01 d0                	add    eax,edx
 1003608:	eb 03                	jmp    100360d <load_pe+0x1e3>
 100360a:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
 100360d:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 1003610:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 1003617:	eb 4e                	jmp    1003667 <load_pe+0x23d>
 1003619:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100361c:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
 100361f:	25 00 00 00 02       	and    eax,0x2000000
 1003624:	89 85 34 ff ff ff    	mov    DWORD PTR [ebp-0xcc],eax
 100362a:	83 bd 34 ff ff ff 00 	cmp    DWORD PTR [ebp-0xcc],0x0
 1003631:	75 2b                	jne    100365e <load_pe+0x234>
 1003633:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003636:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1003639:	89 c1                	mov    ecx,eax
 100363b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 100363e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1003641:	89 c2                	mov    edx,eax
 1003643:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1003646:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
 1003649:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100364c:	01 d8                	add    eax,ebx
 100364e:	51                   	push   ecx
 100364f:	52                   	push   edx
 1003650:	50                   	push   eax
 1003651:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 1003654:	e8 07 e4 ff ff       	call   1001a60 <sys_read>
 1003659:	83 c4 10             	add    esp,0x10
 100365c:	eb 01                	jmp    100365f <load_pe+0x235>
 100365e:	90                   	nop
 100365f:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 1003663:	83 45 ec 28          	add    DWORD PTR [ebp-0x14],0x28
 1003667:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 100366a:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
 100366e:	0f b7 c0             	movzx  eax,ax
 1003671:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1003674:	7c a3                	jl     1003619 <load_pe+0x1ef>
 1003676:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 1003679:	83 e8 80             	sub    eax,0xffffff80
 100367c:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
 100367f:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003682:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003685:	85 c0                	test   eax,eax
 1003687:	0f 84 22 02 00 00    	je     10038af <load_pe+0x485>
 100368d:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 1003690:	8b 10                	mov    edx,DWORD PTR [eax]
 1003692:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003695:	01 d0                	add    eax,edx
 1003697:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100369d:	8b 85 7c ff ff ff    	mov    eax,DWORD PTR [ebp-0x84]
 10036a3:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10036a6:	e9 f7 01 00 00       	jmp    10038a2 <load_pe+0x478>
 10036ab:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10036ae:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10036b1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10036b4:	01 d0                	add    eax,edx
 10036b6:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 10036bc:	83 ec 08             	sub    esp,0x8
 10036bf:	68 3c 72 00 01       	push   0x100723c
 10036c4:	ff b5 78 ff ff ff    	push   DWORD PTR [ebp-0x88]
 10036ca:	e8 d6 31 00 00       	call   10068a5 <strcmp>
 10036cf:	83 c4 10             	add    esp,0x10
 10036d2:	85 c0                	test   eax,eax
 10036d4:	75 09                	jne    10036df <load_pe+0x2b5>
 10036d6:	c7 45 e0 00 00 c0 01 	mov    DWORD PTR [ebp-0x20],0x1c00000
 10036dd:	eb 28                	jmp    1003707 <load_pe+0x2dd>
 10036df:	83 ec 0c             	sub    esp,0xc
 10036e2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10036e5:	e8 40 fd ff ff       	call   100342a <load_pe>
 10036ea:	83 c4 10             	add    esp,0x10
 10036ed:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
 10036f3:	83 ec 0c             	sub    esp,0xc
 10036f6:	ff b5 74 ff ff ff    	push   DWORD PTR [ebp-0x8c]
 10036fc:	e8 43 03 00 00       	call   1003a44 <get_module_addr>
 1003701:	83 c4 10             	add    esp,0x10
 1003704:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1003707:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100370a:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
 1003710:	8b 85 70 ff ff ff    	mov    eax,DWORD PTR [ebp-0x90]
 1003716:	8b 50 3c             	mov    edx,DWORD PTR [eax+0x3c]
 1003719:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100371c:	01 d0                	add    eax,edx
 100371e:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
 1003724:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
 100372a:	8b 50 78             	mov    edx,DWORD PTR [eax+0x78]
 100372d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003730:	01 d0                	add    eax,edx
 1003732:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
 1003738:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 100373e:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1003741:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
 1003747:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 100374d:	8b 50 20             	mov    edx,DWORD PTR [eax+0x20]
 1003750:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003753:	01 d0                	add    eax,edx
 1003755:	89 85 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],eax
 100375b:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003761:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
 1003764:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003767:	01 d0                	add    eax,edx
 1003769:	89 85 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],eax
 100376f:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003775:	8b 50 24             	mov    edx,DWORD PTR [eax+0x24]
 1003778:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100377b:	01 d0                	add    eax,edx
 100377d:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
 1003783:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
 1003789:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100378c:	89 85 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],eax
 1003792:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1003795:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1003798:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100379b:	01 d0                	add    eax,edx
 100379d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10037a0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10037a3:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 10037a6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10037a9:	01 d0                	add    eax,edx
 10037ab:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 10037ae:	e9 de 00 00 00       	jmp    1003891 <load_pe+0x467>
 10037b3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10037b6:	8b 00                	mov    eax,DWORD PTR [eax]
 10037b8:	85 c0                	test   eax,eax
 10037ba:	79 3e                	jns    10037fa <load_pe+0x3d0>
 10037bc:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10037bf:	8b 00                	mov    eax,DWORD PTR [eax]
 10037c1:	25 ff ff ff 7f       	and    eax,0x7fffffff
 10037c6:	2b 85 54 ff ff ff    	sub    eax,DWORD PTR [ebp-0xac]
 10037cc:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
 10037d2:	8b 85 48 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb8]
 10037d8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 10037df:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 10037e5:	01 d0                	add    eax,edx
 10037e7:	8b 10                	mov    edx,DWORD PTR [eax]
 10037e9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10037ec:	01 d0                	add    eax,edx
 10037ee:	89 c2                	mov    edx,eax
 10037f0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10037f3:	89 10                	mov    DWORD PTR [eax],edx
 10037f5:	e9 8f 00 00 00       	jmp    1003889 <load_pe+0x45f>
 10037fa:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10037fd:	8b 00                	mov    eax,DWORD PTR [eax]
 10037ff:	89 85 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],eax
 1003805:	83 85 50 ff ff ff 02 	add    DWORD PTR [ebp-0xb0],0x2
 100380c:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 1003813:	eb 69                	jmp    100387e <load_pe+0x454>
 1003815:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003818:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 100381f:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa0]
 1003825:	01 d0                	add    eax,edx
 1003827:	8b 00                	mov    eax,DWORD PTR [eax]
 1003829:	83 ec 08             	sub    esp,0x8
 100382c:	50                   	push   eax
 100382d:	ff b5 50 ff ff ff    	push   DWORD PTR [ebp-0xb0]
 1003833:	e8 6d 30 00 00       	call   10068a5 <strcmp>
 1003838:	83 c4 10             	add    esp,0x10
 100383b:	85 c0                	test   eax,eax
 100383d:	75 3b                	jne    100387a <load_pe+0x450>
 100383f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003842:	8d 14 00             	lea    edx,[eax+eax*1]
 1003845:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [ebp-0xa8]
 100384b:	01 d0                	add    eax,edx
 100384d:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003850:	98                   	cwde   
 1003851:	89 85 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],eax
 1003857:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [ebp-0xb4]
 100385d:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003864:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [ebp-0xa4]
 100386a:	01 d0                	add    eax,edx
 100386c:	8b 10                	mov    edx,DWORD PTR [eax]
 100386e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003871:	01 d0                	add    eax,edx
 1003873:	89 c2                	mov    edx,eax
 1003875:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003878:	89 10                	mov    DWORD PTR [eax],edx
 100387a:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 100387e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003881:	3b 85 64 ff ff ff    	cmp    eax,DWORD PTR [ebp-0x9c]
 1003887:	7c 8c                	jl     1003815 <load_pe+0x3eb>
 1003889:	83 45 dc 04          	add    DWORD PTR [ebp-0x24],0x4
 100388d:	83 45 d8 04          	add    DWORD PTR [ebp-0x28],0x4
 1003891:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003894:	8b 00                	mov    eax,DWORD PTR [eax]
 1003896:	85 c0                	test   eax,eax
 1003898:	0f 85 15 ff ff ff    	jne    10037b3 <load_pe+0x389>
 100389e:	83 45 e4 14          	add    DWORD PTR [ebp-0x1c],0x14
 10038a2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10038a5:	8b 00                	mov    eax,DWORD PTR [eax]
 10038a7:	85 c0                	test   eax,eax
 10038a9:	0f 85 fc fd ff ff    	jne    10036ab <load_pe+0x281>
 10038af:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
 10038b6:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10038b9:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [eax+0xa4]
 10038bf:	85 c0                	test   eax,eax
 10038c1:	0f 84 c7 00 00 00    	je     100398e <load_pe+0x564>
 10038c7:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10038ca:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [eax+0xa0]
 10038d0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10038d3:	01 d0                	add    eax,edx
 10038d5:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 10038d8:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 10038db:	83 c0 40             	add    eax,0x40
 10038de:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 10038e1:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 10038e4:	83 c0 02             	add    eax,0x2
 10038e7:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10038ea:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 10038ed:	8b 40 34             	mov    eax,DWORD PTR [eax+0x34]
 10038f0:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
 10038f6:	e9 86 00 00 00       	jmp    1003981 <load_pe+0x557>
 10038fb:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 10038fe:	8b 10                	mov    edx,DWORD PTR [eax]
 1003900:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003903:	01 d0                	add    eax,edx
 1003905:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
 100390b:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
 1003912:	eb 50                	jmp    1003964 <load_pe+0x53a>
 1003914:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1003917:	0f b7 00             	movzx  eax,WORD PTR [eax]
 100391a:	66 85 c0             	test   ax,ax
 100391d:	74 40                	je     100395f <load_pe+0x535>
 100391f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1003922:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1003925:	0f b7 d0             	movzx  edx,ax
 1003928:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
 100392e:	01 d0                	add    eax,edx
 1003930:	89 85 3c ff ff ff    	mov    DWORD PTR [ebp-0xc4],eax
 1003936:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 100393c:	8b 00                	mov    eax,DWORD PTR [eax]
 100393e:	2b 85 44 ff ff ff    	sub    eax,DWORD PTR [ebp-0xbc]
 1003944:	89 c2                	mov    edx,eax
 1003946:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003949:	01 d0                	add    eax,edx
 100394b:	89 c2                	mov    edx,eax
 100394d:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
 1003953:	89 10                	mov    DWORD PTR [eax],edx
 1003955:	83 45 cc 04          	add    DWORD PTR [ebp-0x34],0x4
 1003959:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
 100395d:	eb 01                	jmp    1003960 <load_pe+0x536>
 100395f:	90                   	nop
 1003960:	83 45 c4 01          	add    DWORD PTR [ebp-0x3c],0x1
 1003964:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003967:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100396a:	c1 e8 02             	shr    eax,0x2
 100396d:	89 c2                	mov    edx,eax
 100396f:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 1003972:	39 c2                	cmp    edx,eax
 1003974:	77 9e                	ja     1003914 <load_pe+0x4ea>
 1003976:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003979:	05 00 10 00 00       	add    eax,0x1000
 100397e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 1003981:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1003984:	8b 00                	mov    eax,DWORD PTR [eax]
 1003986:	85 c0                	test   eax,eax
 1003988:	0f 85 6d ff ff ff    	jne    10038fb <load_pe+0x4d1>
 100398e:	c7 85 ec fd ff ff 00 	mov    DWORD PTR [ebp-0x214],0x0
 1003995:	00 00 00 
 1003998:	c7 85 f0 fd ff ff 00 	mov    DWORD PTR [ebp-0x210],0x0
 100399f:	00 00 00 
 10039a2:	c7 85 f4 fd ff ff 00 	mov    DWORD PTR [ebp-0x20c],0x0
 10039a9:	00 00 00 
 10039ac:	c7 85 f8 fd ff ff 00 	mov    DWORD PTR [ebp-0x208],0x0
 10039b3:	00 00 00 
 10039b6:	83 ec 04             	sub    esp,0x4
 10039b9:	6a 10                	push   0x10
 10039bb:	8d 85 ec fd ff ff    	lea    eax,[ebp-0x214]
 10039c1:	50                   	push   eax
 10039c2:	68 00 00 00 01       	push   0x1000000
 10039c7:	e8 b3 2c 00 00       	call   100667f <memcpy>
 10039cc:	83 c4 10             	add    esp,0x10
 10039cf:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10039d4:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10039da:	05 70 2d 40 00       	add    eax,0x402d70
 10039df:	c7 40 04 00 00 00 01 	mov    DWORD PTR [eax+0x4],0x1000000
 10039e6:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 10039eb:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 10039f1:	05 70 2d 40 00       	add    eax,0x402d70
 10039f6:	c7 40 08 00 10 00 01 	mov    DWORD PTR [eax+0x8],0x1001000
 10039fd:	8b 45 94             	mov    eax,DWORD PTR [ebp-0x6c]
 1003a00:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
 1003a06:	83 ec 08             	sub    esp,0x8
 1003a09:	6a 00                	push   0x0
 1003a0b:	6a 00                	push   0x0
 1003a0d:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
 1003a13:	ff d0                	call   eax
 1003a15:	83 c4 10             	add    esp,0x10
 1003a18:	8b 15 c8 8b 40 00    	mov    edx,DWORD PTR ds:0x408bc8
 1003a1e:	89 c1                	mov    ecx,eax
 1003a20:	69 c2 78 01 00 00    	imul   eax,edx,0x178
 1003a26:	05 70 2d 40 00       	add    eax,0x402d70
 1003a2b:	89 08                	mov    DWORD PTR [eax],ecx
 1003a2d:	a1 c8 8b 40 00       	mov    eax,ds:0x408bc8
 1003a32:	69 c0 78 01 00 00    	imul   eax,eax,0x178
 1003a38:	05 70 2d 40 00       	add    eax,0x402d70
 1003a3d:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a3f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1003a42:	c9                   	leave  
 1003a43:	c3                   	ret    

01003a44 <get_module_addr>:
 1003a44:	55                   	push   ebp
 1003a45:	89 e5                	mov    ebp,esp
 1003a47:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003a4a:	8b 04 c5 e0 b7 41 00 	mov    eax,DWORD PTR [eax*8+0x41b7e0]
 1003a51:	5d                   	pop    ebp
 1003a52:	c3                   	ret    

01003a53 <dispose_library>:
 1003a53:	55                   	push   ebp
 1003a54:	89 e5                	mov    ebp,esp
 1003a56:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1003a5a:	78 09                	js     1003a65 <dispose_library+0x12>
 1003a5c:	81 7d 08 ff 00 00 00 	cmp    DWORD PTR [ebp+0x8],0xff
 1003a63:	7e 07                	jle    1003a6c <dispose_library+0x19>
 1003a65:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003a6a:	eb 19                	jmp    1003a85 <dispose_library+0x32>
 1003a6c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003a6f:	69 c0 2c 01 00 00    	imul   eax,eax,0x12c
 1003a75:	05 e8 8b 40 00       	add    eax,0x408be8
 1003a7a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003a80:	b8 00 00 00 00       	mov    eax,0x0
 1003a85:	5d                   	pop    ebp
 1003a86:	c3                   	ret    

01003a87 <load_elf>:
 1003a87:	55                   	push   ebp
 1003a88:	89 e5                	mov    ebp,esp
 1003a8a:	56                   	push   esi
 1003a8b:	53                   	push   ebx
 1003a8c:	83 ec 60             	sub    esp,0x60
 1003a8f:	89 e0                	mov    eax,esp
 1003a91:	89 c6                	mov    esi,eax
 1003a93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003a96:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [eax+0x8c]
 1003a9c:	8b 00                	mov    eax,DWORD PTR [eax]
 1003a9e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1003aa1:	6a 34                	push   0x34
 1003aa3:	6a 00                	push   0x0
 1003aa5:	8d 45 98             	lea    eax,[ebp-0x68]
 1003aa8:	50                   	push   eax
 1003aa9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003aac:	e8 af df ff ff       	call   1001a60 <sys_read>
 1003ab1:	83 c4 10             	add    esp,0x10
 1003ab4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 1003abb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 1003ac2:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003ac5:	8d 90 ff ff 3f 00    	lea    edx,[eax+0x3fffff]
 1003acb:	85 c0                	test   eax,eax
 1003acd:	0f 48 c2             	cmovs  eax,edx
 1003ad0:	c1 f8 16             	sar    eax,0x16
 1003ad3:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1003ad6:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1003ad9:	99                   	cdq    
 1003ada:	c1 ea 0a             	shr    edx,0xa
 1003add:	01 d0                	add    eax,edx
 1003adf:	25 ff ff 3f 00       	and    eax,0x3fffff
 1003ae4:	29 d0                	sub    eax,edx
 1003ae6:	8d 90 ff 0f 00 00    	lea    edx,[eax+0xfff]
 1003aec:	85 c0                	test   eax,eax
 1003aee:	0f 48 c2             	cmovs  eax,edx
 1003af1:	c1 f8 0c             	sar    eax,0xc
 1003af4:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1003af7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003afa:	8b 90 84 00 00 00    	mov    edx,DWORD PTR [eax+0x84]
 1003b00:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003b03:	c1 e0 02             	shl    eax,0x2
 1003b06:	01 d0                	add    eax,edx
 1003b08:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b0a:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003b0f:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1003b12:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1003b19:	eb 68                	jmp    1003b83 <load_elf+0xfc>
 1003b1b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003b1e:	8b 88 84 00 00 00    	mov    ecx,DWORD PTR [eax+0x84]
 1003b24:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003b27:	8d 90 ff 03 00 00    	lea    edx,[eax+0x3ff]
 1003b2d:	85 c0                	test   eax,eax
 1003b2f:	0f 48 c2             	cmovs  eax,edx
 1003b32:	c1 f8 0a             	sar    eax,0xa
 1003b35:	89 c2                	mov    edx,eax
 1003b37:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1003b3a:	01 d0                	add    eax,edx
 1003b3c:	c1 e0 02             	shl    eax,0x2
 1003b3f:	01 c8                	add    eax,ecx
 1003b41:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b43:	83 e0 01             	and    eax,0x1
 1003b46:	85 c0                	test   eax,eax
 1003b48:	75 2c                	jne    1003b76 <load_elf+0xef>
 1003b4a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003b4d:	99                   	cdq    
 1003b4e:	c1 ea 16             	shr    edx,0x16
 1003b51:	01 d0                	add    eax,edx
 1003b53:	25 ff 03 00 00       	and    eax,0x3ff
 1003b58:	29 d0                	sub    eax,edx
 1003b5a:	89 c2                	mov    edx,eax
 1003b5c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1003b5f:	01 d0                	add    eax,edx
 1003b61:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 1003b68:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1003b6b:	01 d0                	add    eax,edx
 1003b6d:	8b 00                	mov    eax,DWORD PTR [eax]
 1003b6f:	83 e0 01             	and    eax,0x1
 1003b72:	85 c0                	test   eax,eax
 1003b74:	74 09                	je     1003b7f <load_elf+0xf8>
 1003b76:	81 45 e8 00 10 00 00 	add    DWORD PTR [ebp-0x18],0x1000
 1003b7d:	eb 0c                	jmp    1003b8b <load_elf+0x104>
 1003b7f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1003b83:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003b86:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 1003b89:	7c 90                	jl     1003b1b <load_elf+0x94>
 1003b8b:	90                   	nop
 1003b8c:	0f b7 45 c4          	movzx  eax,WORD PTR [ebp-0x3c]
 1003b90:	0f b7 c0             	movzx  eax,ax
 1003b93:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1003b96:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1003b99:	8d 50 ff             	lea    edx,[eax-0x1]
 1003b9c:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1003b9f:	c1 e0 05             	shl    eax,0x5
 1003ba2:	89 c2                	mov    edx,eax
 1003ba4:	b8 10 00 00 00       	mov    eax,0x10
 1003ba9:	83 e8 01             	sub    eax,0x1
 1003bac:	01 d0                	add    eax,edx
 1003bae:	bb 10 00 00 00       	mov    ebx,0x10
 1003bb3:	ba 00 00 00 00       	mov    edx,0x0
 1003bb8:	f7 f3                	div    ebx
 1003bba:	6b c0 10             	imul   eax,eax,0x10
 1003bbd:	89 c1                	mov    ecx,eax
 1003bbf:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1003bc5:	89 e2                	mov    edx,esp
 1003bc7:	29 ca                	sub    edx,ecx
 1003bc9:	39 d4                	cmp    esp,edx
 1003bcb:	74 10                	je     1003bdd <load_elf+0x156>
 1003bcd:	81 ec 00 10 00 00    	sub    esp,0x1000
 1003bd3:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1003bda:	00 
 1003bdb:	eb ec                	jmp    1003bc9 <load_elf+0x142>
 1003bdd:	89 c2                	mov    edx,eax
 1003bdf:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003be5:	29 d4                	sub    esp,edx
 1003be7:	89 c2                	mov    edx,eax
 1003be9:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1003bef:	85 d2                	test   edx,edx
 1003bf1:	74 0d                	je     1003c00 <load_elf+0x179>
 1003bf3:	25 ff 0f 00 00       	and    eax,0xfff
 1003bf8:	83 e8 04             	sub    eax,0x4
 1003bfb:	01 e0                	add    eax,esp
 1003bfd:	83 08 00             	or     DWORD PTR [eax],0x0
 1003c00:	89 e0                	mov    eax,esp
 1003c02:	83 c0 00             	add    eax,0x0
 1003c05:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1003c08:	0f b7 45 c2          	movzx  eax,WORD PTR [ebp-0x3e]
 1003c0c:	0f b7 c0             	movzx  eax,ax
 1003c0f:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
 1003c12:	50                   	push   eax
 1003c13:	52                   	push   edx
 1003c14:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 1003c17:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003c1a:	e8 41 de ff ff       	call   1001a60 <sys_read>
 1003c1f:	83 c4 10             	add    esp,0x10
 1003c22:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1003c29:	eb 59                	jmp    1003c84 <load_elf+0x1fd>
 1003c2b:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003c2e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003c31:	c1 e0 05             	shl    eax,0x5
 1003c34:	01 d0                	add    eax,edx
 1003c36:	8b 00                	mov    eax,DWORD PTR [eax]
 1003c38:	83 e0 01             	and    eax,0x1
 1003c3b:	85 c0                	test   eax,eax
 1003c3d:	74 40                	je     1003c7f <load_elf+0x1f8>
 1003c3f:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003c42:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003c45:	c1 e0 05             	shl    eax,0x5
 1003c48:	01 d0                	add    eax,edx
 1003c4a:	83 c0 10             	add    eax,0x10
 1003c4d:	8b 00                	mov    eax,DWORD PTR [eax]
 1003c4f:	89 c1                	mov    ecx,eax
 1003c51:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 1003c54:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003c57:	c1 e0 05             	shl    eax,0x5
 1003c5a:	01 d0                	add    eax,edx
 1003c5c:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003c5f:	89 c2                	mov    edx,eax
 1003c61:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
 1003c64:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003c67:	c1 e0 05             	shl    eax,0x5
 1003c6a:	01 d8                	add    eax,ebx
 1003c6c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1003c6f:	51                   	push   ecx
 1003c70:	52                   	push   edx
 1003c71:	50                   	push   eax
 1003c72:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1003c75:	e8 e6 dd ff ff       	call   1001a60 <sys_read>
 1003c7a:	83 c4 10             	add    esp,0x10
 1003c7d:	eb 01                	jmp    1003c80 <load_elf+0x1f9>
 1003c7f:	90                   	nop
 1003c80:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1003c84:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003c87:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 1003c8a:	7c 9f                	jl     1003c2b <load_elf+0x1a4>
 1003c8c:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 1003c8f:	89 c2                	mov    edx,eax
 1003c91:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003c94:	89 90 30 01 00 00    	mov    DWORD PTR [eax+0x130],edx
 1003c9a:	b8 00 00 00 00       	mov    eax,0x0
 1003c9f:	89 f4                	mov    esp,esi
 1003ca1:	8d 65 f8             	lea    esp,[ebp-0x8]
 1003ca4:	5b                   	pop    ebx
 1003ca5:	5e                   	pop    esi
 1003ca6:	5d                   	pop    ebp
 1003ca7:	c3                   	ret    

01003ca8 <sys_insmod>:
 1003ca8:	55                   	push   ebp
 1003ca9:	89 e5                	mov    ebp,esp
 1003cab:	90                   	nop
 1003cac:	5d                   	pop    ebp
 1003cad:	c3                   	ret    

01003cae <sys_rmmod>:
 1003cae:	55                   	push   ebp
 1003caf:	89 e5                	mov    ebp,esp
 1003cb1:	90                   	nop
 1003cb2:	5d                   	pop    ebp
 1003cb3:	c3                   	ret    
 1003cb4:	66 90                	xchg   ax,ax
 1003cb6:	66 90                	xchg   ax,ax
 1003cb8:	66 90                	xchg   ax,ax
 1003cba:	66 90                	xchg   ax,ax
 1003cbc:	66 90                	xchg   ax,ax
 1003cbe:	66 90                	xchg   ax,ax

01003cc0 <_syscall>:
 1003cc0:	57                   	push   edi
 1003cc1:	56                   	push   esi
 1003cc2:	52                   	push   edx
 1003cc3:	51                   	push   ecx
 1003cc4:	53                   	push   ebx
 1003cc5:	50                   	push   eax
 1003cc6:	e8 59 c7 ff ff       	call   1000424 <syscall>
 1003ccb:	83 c4 18             	add    esp,0x18
 1003cce:	cf                   	iret   

01003ccf <shift>:
 1003ccf:	55                   	push   ebp
 1003cd0:	89 e5                	mov    ebp,esp
 1003cd2:	0f b6 05 ed c5 41 00 	movzx  eax,BYTE PTR ds:0x41c5ed
 1003cd9:	84 c0                	test   al,al
 1003cdb:	0f 94 c0             	sete   al
 1003cde:	a2 ed c5 41 00       	mov    ds:0x41c5ed,al
 1003ce3:	90                   	nop
 1003ce4:	5d                   	pop    ebp
 1003ce5:	c3                   	ret    

01003ce6 <ctrl>:
 1003ce6:	55                   	push   ebp
 1003ce7:	89 e5                	mov    ebp,esp
 1003ce9:	0f b6 05 ee c5 41 00 	movzx  eax,BYTE PTR ds:0x41c5ee
 1003cf0:	84 c0                	test   al,al
 1003cf2:	0f 94 c0             	sete   al
 1003cf5:	a2 ee c5 41 00       	mov    ds:0x41c5ee,al
 1003cfa:	90                   	nop
 1003cfb:	5d                   	pop    ebp
 1003cfc:	c3                   	ret    

01003cfd <capslock>:
 1003cfd:	55                   	push   ebp
 1003cfe:	89 e5                	mov    ebp,esp
 1003d00:	0f b6 05 ef c5 41 00 	movzx  eax,BYTE PTR ds:0x41c5ef
 1003d07:	84 c0                	test   al,al
 1003d09:	0f 94 c0             	sete   al
 1003d0c:	a2 ef c5 41 00       	mov    ds:0x41c5ef,al
 1003d11:	90                   	nop
 1003d12:	5d                   	pop    ebp
 1003d13:	c3                   	ret    

01003d14 <to_ascii>:
 1003d14:	55                   	push   ebp
 1003d15:	89 e5                	mov    ebp,esp
 1003d17:	83 ec 14             	sub    esp,0x14
 1003d1a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1003d1d:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1003d20:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1003d27:	e9 99 00 00 00       	jmp    1003dc5 <to_ascii+0xb1>
 1003d2c:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003d2f:	89 d0                	mov    eax,edx
 1003d31:	c1 e0 02             	shl    eax,0x2
 1003d34:	01 d0                	add    eax,edx
 1003d36:	05 02 73 00 01       	add    eax,0x1007302
 1003d3b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003d3e:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 1003d41:	75 7e                	jne    1003dc1 <to_ascii+0xad>
 1003d43:	0f b6 05 ef c5 41 00 	movzx  eax,BYTE PTR ds:0x41c5ef
 1003d4a:	84 c0                	test   al,al
 1003d4c:	74 40                	je     1003d8e <to_ascii+0x7a>
 1003d4e:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003d51:	89 d0                	mov    eax,edx
 1003d53:	c1 e0 02             	shl    eax,0x2
 1003d56:	01 d0                	add    eax,edx
 1003d58:	05 00 73 00 01       	add    eax,0x1007300
 1003d5d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003d60:	3c 60                	cmp    al,0x60
 1003d62:	7e 2a                	jle    1003d8e <to_ascii+0x7a>
 1003d64:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003d67:	89 d0                	mov    eax,edx
 1003d69:	c1 e0 02             	shl    eax,0x2
 1003d6c:	01 d0                	add    eax,edx
 1003d6e:	05 00 73 00 01       	add    eax,0x1007300
 1003d73:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003d76:	3c 7a                	cmp    al,0x7a
 1003d78:	7f 14                	jg     1003d8e <to_ascii+0x7a>
 1003d7a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003d7d:	89 d0                	mov    eax,edx
 1003d7f:	c1 e0 02             	shl    eax,0x2
 1003d82:	01 d0                	add    eax,edx
 1003d84:	05 01 73 00 01       	add    eax,0x1007301
 1003d89:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003d8c:	eb 46                	jmp    1003dd4 <to_ascii+0xc0>
 1003d8e:	0f b6 05 ed c5 41 00 	movzx  eax,BYTE PTR ds:0x41c5ed
 1003d95:	84 c0                	test   al,al
 1003d97:	74 14                	je     1003dad <to_ascii+0x99>
 1003d99:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003d9c:	89 d0                	mov    eax,edx
 1003d9e:	c1 e0 02             	shl    eax,0x2
 1003da1:	01 d0                	add    eax,edx
 1003da3:	05 01 73 00 01       	add    eax,0x1007301
 1003da8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003dab:	eb 27                	jmp    1003dd4 <to_ascii+0xc0>
 1003dad:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1003db0:	89 d0                	mov    eax,edx
 1003db2:	c1 e0 02             	shl    eax,0x2
 1003db5:	01 d0                	add    eax,edx
 1003db7:	05 00 73 00 01       	add    eax,0x1007300
 1003dbc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1003dbf:	eb 13                	jmp    1003dd4 <to_ascii+0xc0>
 1003dc1:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1003dc5:	83 7d fc 5d          	cmp    DWORD PTR [ebp-0x4],0x5d
 1003dc9:	0f 8e 5d ff ff ff    	jle    1003d2c <to_ascii+0x18>
 1003dcf:	b8 00 00 00 00       	mov    eax,0x0
 1003dd4:	c9                   	leave  
 1003dd5:	c3                   	ret    

01003dd6 <init_kb>:
 1003dd6:	55                   	push   ebp
 1003dd7:	89 e5                	mov    ebp,esp
 1003dd9:	83 ec 08             	sub    esp,0x8
 1003ddc:	83 ec 0c             	sub    esp,0xc
 1003ddf:	68 c0 72 00 01       	push   0x10072c0
 1003de4:	e8 da dd ff ff       	call   1001bc3 <reg_device>
 1003de9:	83 c4 10             	add    esp,0x10
 1003dec:	83 ec 0c             	sub    esp,0xc
 1003def:	68 60 72 00 01       	push   0x1007260
 1003df4:	e8 7f de ff ff       	call   1001c78 <reg_driver>
 1003df9:	83 c4 10             	add    esp,0x10
 1003dfc:	90                   	nop
 1003dfd:	c9                   	leave  
 1003dfe:	c3                   	ret    

01003dff <key_proc>:
 1003dff:	55                   	push   ebp
 1003e00:	89 e5                	mov    ebp,esp
 1003e02:	83 ec 18             	sub    esp,0x18
 1003e05:	c6 45 f5 00          	mov    BYTE PTR [ebp-0xb],0x0
 1003e09:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
 1003e0d:	c6 45 f6 00          	mov    BYTE PTR [ebp-0xa],0x0
 1003e11:	83 ec 0c             	sub    esp,0xc
 1003e14:	6a 60                	push   0x60
 1003e16:	e8 f5 f1 ff ff       	call   1003010 <inb>
 1003e1b:	83 c4 10             	add    esp,0x10
 1003e1e:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
 1003e21:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 1003e25:	0f be c0             	movsx  eax,al
 1003e28:	83 ec 0c             	sub    esp,0xc
 1003e2b:	50                   	push   eax
 1003e2c:	e8 e3 fe ff ff       	call   1003d14 <to_ascii>
 1003e31:	83 c4 10             	add    esp,0x10
 1003e34:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 1003e37:	80 7d f5 e0          	cmp    BYTE PTR [ebp-0xb],0xe0
 1003e3b:	74 06                	je     1003e43 <key_proc+0x44>
 1003e3d:	80 7d f5 e1          	cmp    BYTE PTR [ebp-0xb],0xe1
 1003e41:	75 26                	jne    1003e69 <key_proc+0x6a>
 1003e43:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1003e47:	0f be c0             	movsx  eax,al
 1003e4a:	83 ec 0c             	sub    esp,0xc
 1003e4d:	50                   	push   eax
 1003e4e:	e8 c1 fe ff ff       	call   1003d14 <to_ascii>
 1003e53:	83 c4 10             	add    esp,0x10
 1003e56:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
 1003e59:	83 ec 0c             	sub    esp,0xc
 1003e5c:	6a 60                	push   0x60
 1003e5e:	e8 ad f1 ff ff       	call   1003010 <inb>
 1003e63:	83 c4 10             	add    esp,0x10
 1003e66:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 1003e69:	0f b6 45 f5          	movzx  eax,BYTE PTR [ebp-0xb]
 1003e6d:	88 45 f2             	mov    BYTE PTR [ebp-0xe],al
 1003e70:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 1003e74:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
 1003e77:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
 1003e7b:	88 45 f0             	mov    BYTE PTR [ebp-0x10],al
 1003e7e:	8b 15 7c 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d7c
 1003e84:	a1 78 6d 00 01       	mov    eax,ds:0x1006d78
 1003e89:	39 c2                	cmp    edx,eax
 1003e8b:	74 3a                	je     1003ec7 <key_proc+0xc8>
 1003e8d:	8b 15 74 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d74
 1003e93:	a1 7c 6d 00 01       	mov    eax,ds:0x1006d7c
 1003e98:	89 c1                	mov    ecx,eax
 1003e9a:	89 c8                	mov    eax,ecx
 1003e9c:	c1 e0 02             	shl    eax,0x2
 1003e9f:	01 c8                	add    eax,ecx
 1003ea1:	01 d0                	add    eax,edx
 1003ea3:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1003ea6:	89 10                	mov    DWORD PTR [eax],edx
 1003ea8:	0f b6 55 f4          	movzx  edx,BYTE PTR [ebp-0xc]
 1003eac:	88 50 04             	mov    BYTE PTR [eax+0x4],dl
 1003eaf:	a1 7c 6d 00 01       	mov    eax,ds:0x1006d7c
 1003eb4:	83 c0 01             	add    eax,0x1
 1003eb7:	8b 0d 80 6d 00 01    	mov    ecx,DWORD PTR ds:0x1006d80
 1003ebd:	99                   	cdq    
 1003ebe:	f7 f9                	idiv   ecx
 1003ec0:	89 d0                	mov    eax,edx
 1003ec2:	a3 7c 6d 00 01       	mov    ds:0x1006d7c,eax
 1003ec7:	e8 5d f1 ff ff       	call   1003029 <eoi>
 1003ecc:	c9                   	leave  
 1003ecd:	cf                   	iret   
 1003ece:	90                   	nop
 1003ecf:	c9                   	leave  
 1003ed0:	c3                   	ret    

01003ed1 <sys_getkbc>:
 1003ed1:	55                   	push   ebp
 1003ed2:	89 e5                	mov    ebp,esp
 1003ed4:	83 ec 10             	sub    esp,0x10
 1003ed7:	8b 15 7c 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d7c
 1003edd:	a1 78 6d 00 01       	mov    eax,ds:0x1006d78
 1003ee2:	39 c2                	cmp    edx,eax
 1003ee4:	75 07                	jne    1003eed <sys_getkbc+0x1c>
 1003ee6:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1003eeb:	eb 3a                	jmp    1003f27 <sys_getkbc+0x56>
 1003eed:	8b 15 7c 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d7c
 1003ef3:	89 d0                	mov    eax,edx
 1003ef5:	c1 e0 02             	shl    eax,0x2
 1003ef8:	01 d0                	add    eax,edx
 1003efa:	05 e0 bb 41 00       	add    eax,0x41bbe0
 1003eff:	8b 10                	mov    edx,DWORD PTR [eax]
 1003f01:	89 55 fb             	mov    DWORD PTR [ebp-0x5],edx
 1003f04:	0f b6 40 04          	movzx  eax,BYTE PTR [eax+0x4]
 1003f08:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
 1003f0b:	a1 7c 6d 00 01       	mov    eax,ds:0x1006d7c
 1003f10:	83 c0 01             	add    eax,0x1
 1003f13:	8b 0d 80 6d 00 01    	mov    ecx,DWORD PTR ds:0x1006d80
 1003f19:	99                   	cdq    
 1003f1a:	f7 f9                	idiv   ecx
 1003f1c:	89 d0                	mov    eax,edx
 1003f1e:	a3 7c 6d 00 01       	mov    ds:0x1006d7c,eax
 1003f23:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
 1003f27:	c9                   	leave  
 1003f28:	c3                   	ret    

01003f29 <init_disk>:
 1003f29:	55                   	push   ebp
 1003f2a:	89 e5                	mov    ebp,esp
 1003f2c:	83 ec 08             	sub    esp,0x8
 1003f2f:	83 ec 0c             	sub    esp,0xc
 1003f32:	68 a0 6d 00 01       	push   0x1006da0
 1003f37:	e8 87 dc ff ff       	call   1001bc3 <reg_device>
 1003f3c:	83 c4 10             	add    esp,0x10
 1003f3f:	a3 48 e0 41 00       	mov    ds:0x41e048,eax
 1003f44:	83 ec 0c             	sub    esp,0xc
 1003f47:	68 e0 6d 00 01       	push   0x1006de0
 1003f4c:	e8 27 dd ff ff       	call   1001c78 <reg_driver>
 1003f51:	83 c4 10             	add    esp,0x10
 1003f54:	a3 44 e0 41 00       	mov    ds:0x41e044,eax
 1003f59:	c7 05 cc 6d 00 01 e0 	mov    DWORD PTR ds:0x1006dcc,0x1006de0
 1003f60:	6d 00 01 
 1003f63:	b8 00 00 00 00       	mov    eax,0x0
 1003f68:	c9                   	leave  
 1003f69:	c3                   	ret    

01003f6a <disk_int_handler_c>:
 1003f6a:	55                   	push   ebp
 1003f6b:	89 e5                	mov    ebp,esp
 1003f6d:	83 ec 18             	sub    esp,0x18
 1003f70:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003f75:	85 c0                	test   eax,eax
 1003f77:	75 0a                	jne    1003f83 <disk_int_handler_c+0x19>
 1003f79:	b8 01 00 00 00       	mov    eax,0x1
 1003f7e:	e9 e3 00 00 00       	jmp    1004066 <disk_int_handler_c+0xfc>
 1003f83:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003f88:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1003f8b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1003f8e:	c7 45 f0 f0 01 00 00 	mov    DWORD PTR [ebp-0x10],0x1f0
 1003f95:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003f9a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003f9d:	83 f8 02             	cmp    eax,0x2
 1003fa0:	74 0d                	je     1003faf <disk_int_handler_c+0x45>
 1003fa2:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003fa7:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1003faa:	83 f8 03             	cmp    eax,0x3
 1003fad:	75 07                	jne    1003fb6 <disk_int_handler_c+0x4c>
 1003faf:	c7 45 f0 70 01 00 00 	mov    DWORD PTR [ebp-0x10],0x170
 1003fb6:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003fbb:	8b 00                	mov    eax,DWORD PTR [eax]
 1003fbd:	85 c0                	test   eax,eax
 1003fbf:	75 3f                	jne    1004000 <disk_int_handler_c+0x96>
 1003fc1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1003fc8:	eb 24                	jmp    1003fee <disk_int_handler_c+0x84>
 1003fca:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1003fcd:	0f b7 c0             	movzx  eax,ax
 1003fd0:	83 ec 0c             	sub    esp,0xc
 1003fd3:	50                   	push   eax
 1003fd4:	e8 43 f0 ff ff       	call   100301c <inw>
 1003fd9:	83 c4 10             	add    esp,0x10
 1003fdc:	89 c2                	mov    edx,eax
 1003fde:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1003fe1:	8d 48 02             	lea    ecx,[eax+0x2]
 1003fe4:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 1003fe7:	66 89 10             	mov    WORD PTR [eax],dx
 1003fea:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1003fee:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1003ff3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1003ff6:	c1 e0 08             	shl    eax,0x8
 1003ff9:	39 45 ec             	cmp    DWORD PTR [ebp-0x14],eax
 1003ffc:	7c cc                	jl     1003fca <disk_int_handler_c+0x60>
 1003ffe:	eb 4b                	jmp    100404b <disk_int_handler_c+0xe1>
 1004000:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004005:	8b 00                	mov    eax,DWORD PTR [eax]
 1004007:	83 f8 01             	cmp    eax,0x1
 100400a:	75 3f                	jne    100404b <disk_int_handler_c+0xe1>
 100400c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 1004013:	eb 26                	jmp    100403b <disk_int_handler_c+0xd1>
 1004015:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004018:	8d 50 02             	lea    edx,[eax+0x2]
 100401b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 100401e:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1004021:	0f b7 d0             	movzx  edx,ax
 1004024:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004027:	0f b7 c0             	movzx  eax,ax
 100402a:	83 ec 08             	sub    esp,0x8
 100402d:	52                   	push   edx
 100402e:	50                   	push   eax
 100402f:	e8 cc ef ff ff       	call   1003000 <outw>
 1004034:	83 c4 10             	add    esp,0x10
 1004037:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 100403b:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004040:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
 1004043:	c1 e0 08             	shl    eax,0x8
 1004046:	39 45 e8             	cmp    DWORD PTR [ebp-0x18],eax
 1004049:	7c ca                	jl     1004015 <disk_int_handler_c+0xab>
 100404b:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004050:	c7 40 18 02 00 00 00 	mov    DWORD PTR [eax+0x18],0x2
 1004057:	c7 05 40 e0 41 00 00 	mov    DWORD PTR ds:0x41e040,0x0
 100405e:	00 00 00 
 1004061:	b8 00 00 00 00       	mov    eax,0x0
 1004066:	c9                   	leave  
 1004067:	c3                   	ret    

01004068 <check_dreq_stat>:
 1004068:	55                   	push   ebp
 1004069:	89 e5                	mov    ebp,esp
 100406b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100406e:	6b c0 1c             	imul   eax,eax,0x1c
 1004071:	05 18 c6 41 00       	add    eax,0x41c618
 1004076:	8b 00                	mov    eax,DWORD PTR [eax]
 1004078:	5d                   	pop    ebp
 1004079:	c3                   	ret    

0100407a <request>:
 100407a:	55                   	push   ebp
 100407b:	89 e5                	mov    ebp,esp
 100407d:	83 ec 10             	sub    esp,0x10
 1004080:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 1004085:	8d 48 01             	lea    ecx,[eax+0x1]
 1004088:	ba 89 88 88 88       	mov    edx,0x88888889
 100408d:	89 c8                	mov    eax,ecx
 100408f:	f7 ea                	imul   edx
 1004091:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1004094:	c1 f8 07             	sar    eax,0x7
 1004097:	89 ca                	mov    edx,ecx
 1004099:	c1 fa 1f             	sar    edx,0x1f
 100409c:	29 d0                	sub    eax,edx
 100409e:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 10040a4:	89 c8                	mov    eax,ecx
 10040a6:	29 d0                	sub    eax,edx
 10040a8:	8b 15 4c e0 41 00    	mov    edx,DWORD PTR ds:0x41e04c
 10040ae:	39 d0                	cmp    eax,edx
 10040b0:	75 0a                	jne    10040bc <request+0x42>
 10040b2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10040b7:	e9 aa 00 00 00       	jmp    1004166 <request+0xec>
 10040bc:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 10040c1:	6b c0 1c             	imul   eax,eax,0x1c
 10040c4:	8d 90 04 c6 41 00    	lea    edx,[eax+0x41c604]
 10040ca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10040cd:	89 02                	mov    DWORD PTR [edx],eax
 10040cf:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 10040d4:	6b c0 1c             	imul   eax,eax,0x1c
 10040d7:	8d 90 00 c6 41 00    	lea    edx,[eax+0x41c600]
 10040dd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10040e0:	89 02                	mov    DWORD PTR [edx],eax
 10040e2:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 10040e7:	6b c0 1c             	imul   eax,eax,0x1c
 10040ea:	8d 90 08 c6 41 00    	lea    edx,[eax+0x41c608]
 10040f0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10040f3:	89 02                	mov    DWORD PTR [edx],eax
 10040f5:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 10040fa:	6b c0 1c             	imul   eax,eax,0x1c
 10040fd:	8d 90 0c c6 41 00    	lea    edx,[eax+0x41c60c]
 1004103:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1004106:	89 02                	mov    DWORD PTR [edx],eax
 1004108:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 100410d:	6b c0 1c             	imul   eax,eax,0x1c
 1004110:	05 18 c6 41 00       	add    eax,0x41c618
 1004115:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100411b:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 1004120:	6b c0 1c             	imul   eax,eax,0x1c
 1004123:	8d 90 10 c6 41 00    	lea    edx,[eax+0x41c610]
 1004129:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
 100412c:	89 02                	mov    DWORD PTR [edx],eax
 100412e:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 1004133:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004136:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 100413b:	8d 48 01             	lea    ecx,[eax+0x1]
 100413e:	ba 89 88 88 88       	mov    edx,0x88888889
 1004143:	89 c8                	mov    eax,ecx
 1004145:	f7 ea                	imul   edx
 1004147:	8d 04 0a             	lea    eax,[edx+ecx*1]
 100414a:	c1 f8 07             	sar    eax,0x7
 100414d:	89 ca                	mov    edx,ecx
 100414f:	c1 fa 1f             	sar    edx,0x1f
 1004152:	29 d0                	sub    eax,edx
 1004154:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 100415a:	89 c8                	mov    eax,ecx
 100415c:	29 d0                	sub    eax,edx
 100415e:	a3 50 e0 41 00       	mov    ds:0x41e050,eax
 1004163:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004166:	c9                   	leave  
 1004167:	c3                   	ret    

01004168 <execute_request>:
 1004168:	55                   	push   ebp
 1004169:	89 e5                	mov    ebp,esp
 100416b:	53                   	push   ebx
 100416c:	83 ec 14             	sub    esp,0x14
 100416f:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004174:	85 c0                	test   eax,eax
 1004176:	74 0a                	je     1004182 <execute_request+0x1a>
 1004178:	b8 02 00 00 00       	mov    eax,0x2
 100417d:	e9 03 01 00 00       	jmp    1004285 <execute_request+0x11d>
 1004182:	8b 15 4c e0 41 00    	mov    edx,DWORD PTR ds:0x41e04c
 1004188:	a1 50 e0 41 00       	mov    eax,ds:0x41e050
 100418d:	39 c2                	cmp    edx,eax
 100418f:	75 0a                	jne    100419b <execute_request+0x33>
 1004191:	b8 01 00 00 00       	mov    eax,0x1
 1004196:	e9 ea 00 00 00       	jmp    1004285 <execute_request+0x11d>
 100419b:	a1 4c e0 41 00       	mov    eax,ds:0x41e04c
 10041a0:	6b c0 1c             	imul   eax,eax,0x1c
 10041a3:	05 00 c6 41 00       	add    eax,0x41c600
 10041a8:	a3 40 e0 41 00       	mov    ds:0x41e040,eax
 10041ad:	a1 4c e0 41 00       	mov    eax,ds:0x41e04c
 10041b2:	8d 48 01             	lea    ecx,[eax+0x1]
 10041b5:	ba 89 88 88 88       	mov    edx,0x88888889
 10041ba:	89 c8                	mov    eax,ecx
 10041bc:	f7 ea                	imul   edx
 10041be:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10041c1:	c1 f8 07             	sar    eax,0x7
 10041c4:	89 ca                	mov    edx,ecx
 10041c6:	c1 fa 1f             	sar    edx,0x1f
 10041c9:	29 d0                	sub    eax,edx
 10041cb:	69 d0 f0 00 00 00    	imul   edx,eax,0xf0
 10041d1:	89 c8                	mov    eax,ecx
 10041d3:	29 d0                	sub    eax,edx
 10041d5:	a3 4c e0 41 00       	mov    ds:0x41e04c,eax
 10041da:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 10041df:	c7 40 18 01 00 00 00 	mov    DWORD PTR [eax+0x18],0x1
 10041e6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10041ed:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 10041f2:	8b 00                	mov    eax,DWORD PTR [eax]
 10041f4:	83 f8 02             	cmp    eax,0x2
 10041f7:	74 76                	je     100426f <execute_request+0x107>
 10041f9:	83 f8 02             	cmp    eax,0x2
 10041fc:	7f 74                	jg     1004272 <execute_request+0x10a>
 10041fe:	85 c0                	test   eax,eax
 1004200:	74 07                	je     1004209 <execute_request+0xa1>
 1004202:	83 f8 01             	cmp    eax,0x1
 1004205:	74 35                	je     100423c <execute_request+0xd4>
 1004207:	eb 69                	jmp    1004272 <execute_request+0x10a>
 1004209:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 100420e:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1004211:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004216:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1004219:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 100421e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004221:	89 c3                	mov    ebx,eax
 1004223:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004228:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100422b:	51                   	push   ecx
 100422c:	52                   	push   edx
 100422d:	53                   	push   ebx
 100422e:	50                   	push   eax
 100422f:	e8 56 00 00 00       	call   100428a <async_read_disk>
 1004234:	83 c4 10             	add    esp,0x10
 1004237:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100423a:	eb 37                	jmp    1004273 <execute_request+0x10b>
 100423c:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004241:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1004244:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004249:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100424c:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 1004251:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004254:	89 c3                	mov    ebx,eax
 1004256:	a1 40 e0 41 00       	mov    eax,ds:0x41e040
 100425b:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100425e:	51                   	push   ecx
 100425f:	52                   	push   edx
 1004260:	53                   	push   ebx
 1004261:	50                   	push   eax
 1004262:	e8 3e 01 00 00       	call   10043a5 <async_write_disk>
 1004267:	83 c4 10             	add    esp,0x10
 100426a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100426d:	eb 04                	jmp    1004273 <execute_request+0x10b>
 100426f:	90                   	nop
 1004270:	eb 01                	jmp    1004273 <execute_request+0x10b>
 1004272:	90                   	nop
 1004273:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1004277:	75 07                	jne    1004280 <execute_request+0x118>
 1004279:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100427e:	eb 05                	jmp    1004285 <execute_request+0x11d>
 1004280:	b8 00 00 00 00       	mov    eax,0x0
 1004285:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1004288:	c9                   	leave  
 1004289:	c3                   	ret    

0100428a <async_read_disk>:
 100428a:	55                   	push   ebp
 100428b:	89 e5                	mov    ebp,esp
 100428d:	83 ec 18             	sub    esp,0x18
 1004290:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 1004296:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100429d:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 10042a1:	74 06                	je     10042a9 <async_read_disk+0x1f>
 10042a3:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 10042a7:	75 06                	jne    10042af <async_read_disk+0x25>
 10042a9:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 10042af:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 10042b3:	74 06                	je     10042bb <async_read_disk+0x31>
 10042b5:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 10042b9:	75 07                	jne    10042c2 <async_read_disk+0x38>
 10042bb:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 10042c2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10042c5:	0f b6 d0             	movzx  edx,al
 10042c8:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10042cc:	83 c0 02             	add    eax,0x2
 10042cf:	0f b7 c0             	movzx  eax,ax
 10042d2:	83 ec 08             	sub    esp,0x8
 10042d5:	52                   	push   edx
 10042d6:	50                   	push   eax
 10042d7:	e8 14 ed ff ff       	call   1002ff0 <outb>
 10042dc:	83 c4 10             	add    esp,0x10
 10042df:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10042e2:	0f b6 d0             	movzx  edx,al
 10042e5:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10042e9:	83 c0 03             	add    eax,0x3
 10042ec:	0f b7 c0             	movzx  eax,ax
 10042ef:	83 ec 08             	sub    esp,0x8
 10042f2:	52                   	push   edx
 10042f3:	50                   	push   eax
 10042f4:	e8 f7 ec ff ff       	call   1002ff0 <outb>
 10042f9:	83 c4 10             	add    esp,0x10
 10042fc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10042ff:	c1 e8 08             	shr    eax,0x8
 1004302:	0f b6 d0             	movzx  edx,al
 1004305:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004309:	83 c0 04             	add    eax,0x4
 100430c:	0f b7 c0             	movzx  eax,ax
 100430f:	83 ec 08             	sub    esp,0x8
 1004312:	52                   	push   edx
 1004313:	50                   	push   eax
 1004314:	e8 d7 ec ff ff       	call   1002ff0 <outb>
 1004319:	83 c4 10             	add    esp,0x10
 100431c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100431f:	c1 e8 10             	shr    eax,0x10
 1004322:	0f b6 d0             	movzx  edx,al
 1004325:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004329:	83 c0 05             	add    eax,0x5
 100432c:	0f b7 c0             	movzx  eax,ax
 100432f:	83 ec 08             	sub    esp,0x8
 1004332:	52                   	push   edx
 1004333:	50                   	push   eax
 1004334:	e8 b7 ec ff ff       	call   1002ff0 <outb>
 1004339:	83 c4 10             	add    esp,0x10
 100433c:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004340:	74 07                	je     1004349 <async_read_disk+0xbf>
 1004342:	b8 10 00 00 00       	mov    eax,0x10
 1004347:	eb 05                	jmp    100434e <async_read_disk+0xc4>
 1004349:	b8 00 00 00 00       	mov    eax,0x0
 100434e:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 1004351:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004354:	c1 e8 18             	shr    eax,0x18
 1004357:	83 e0 0f             	and    eax,0xf
 100435a:	89 c2                	mov    edx,eax
 100435c:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 1004360:	09 d0                	or     eax,edx
 1004362:	83 c8 e0             	or     eax,0xffffffe0
 1004365:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 1004368:	0f b6 45 ee          	movzx  eax,BYTE PTR [ebp-0x12]
 100436c:	0f b6 d0             	movzx  edx,al
 100436f:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004373:	83 c0 06             	add    eax,0x6
 1004376:	0f b7 c0             	movzx  eax,ax
 1004379:	83 ec 08             	sub    esp,0x8
 100437c:	52                   	push   edx
 100437d:	50                   	push   eax
 100437e:	e8 6d ec ff ff       	call   1002ff0 <outb>
 1004383:	83 c4 10             	add    esp,0x10
 1004386:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100438a:	83 c0 07             	add    eax,0x7
 100438d:	0f b7 c0             	movzx  eax,ax
 1004390:	83 ec 08             	sub    esp,0x8
 1004393:	6a 20                	push   0x20
 1004395:	50                   	push   eax
 1004396:	e8 55 ec ff ff       	call   1002ff0 <outb>
 100439b:	83 c4 10             	add    esp,0x10
 100439e:	b8 00 00 00 00       	mov    eax,0x0
 10043a3:	c9                   	leave  
 10043a4:	c3                   	ret    

010043a5 <async_write_disk>:
 10043a5:	55                   	push   ebp
 10043a6:	89 e5                	mov    ebp,esp
 10043a8:	83 ec 18             	sub    esp,0x18
 10043ab:	66 c7 45 f6 f0 01    	mov    WORD PTR [ebp-0xa],0x1f0
 10043b1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10043b8:	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
 10043bc:	74 06                	je     10043c4 <async_write_disk+0x1f>
 10043be:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 10043c2:	75 06                	jne    10043ca <async_write_disk+0x25>
 10043c4:	66 c7 45 f6 70 01    	mov    WORD PTR [ebp-0xa],0x170
 10043ca:	83 7d 08 03          	cmp    DWORD PTR [ebp+0x8],0x3
 10043ce:	74 06                	je     10043d6 <async_write_disk+0x31>
 10043d0:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 10043d4:	75 07                	jne    10043dd <async_write_disk+0x38>
 10043d6:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
 10043dd:	83 ec 0c             	sub    esp,0xc
 10043e0:	68 f7 00 00 00       	push   0xf7
 10043e5:	e8 26 ec ff ff       	call   1003010 <inb>
 10043ea:	83 c4 10             	add    esp,0x10
 10043ed:	88 45 ef             	mov    BYTE PTR [ebp-0x11],al
 10043f0:	0f b6 45 ef          	movzx  eax,BYTE PTR [ebp-0x11]
 10043f4:	83 e0 01             	and    eax,0x1
 10043f7:	88 45 ee             	mov    BYTE PTR [ebp-0x12],al
 10043fa:	80 7d ee 00          	cmp    BYTE PTR [ebp-0x12],0x0
 10043fe:	74 0a                	je     100440a <async_write_disk+0x65>
 1004400:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004405:	e9 22 01 00 00       	jmp    100452c <async_write_disk+0x187>
 100440a:	80 65 ef 88          	and    BYTE PTR [ebp-0x11],0x88
 100440e:	80 7d ef 08          	cmp    BYTE PTR [ebp-0x11],0x8
 1004412:	74 02                	je     1004416 <async_write_disk+0x71>
 1004414:	eb c7                	jmp    10043dd <async_write_disk+0x38>
 1004416:	90                   	nop
 1004417:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 100441a:	0f b6 d0             	movzx  edx,al
 100441d:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004421:	83 c0 02             	add    eax,0x2
 1004424:	0f b7 c0             	movzx  eax,ax
 1004427:	83 ec 08             	sub    esp,0x8
 100442a:	52                   	push   edx
 100442b:	50                   	push   eax
 100442c:	e8 bf eb ff ff       	call   1002ff0 <outb>
 1004431:	83 c4 10             	add    esp,0x10
 1004434:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004437:	0f b6 d0             	movzx  edx,al
 100443a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100443e:	83 c0 03             	add    eax,0x3
 1004441:	0f b7 c0             	movzx  eax,ax
 1004444:	83 ec 08             	sub    esp,0x8
 1004447:	52                   	push   edx
 1004448:	50                   	push   eax
 1004449:	e8 a2 eb ff ff       	call   1002ff0 <outb>
 100444e:	83 c4 10             	add    esp,0x10
 1004451:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004454:	c1 e8 08             	shr    eax,0x8
 1004457:	0f b6 d0             	movzx  edx,al
 100445a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100445e:	83 c0 04             	add    eax,0x4
 1004461:	0f b7 c0             	movzx  eax,ax
 1004464:	83 ec 08             	sub    esp,0x8
 1004467:	52                   	push   edx
 1004468:	50                   	push   eax
 1004469:	e8 82 eb ff ff       	call   1002ff0 <outb>
 100446e:	83 c4 10             	add    esp,0x10
 1004471:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004474:	c1 e8 10             	shr    eax,0x10
 1004477:	0f b6 d0             	movzx  edx,al
 100447a:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 100447e:	83 c0 05             	add    eax,0x5
 1004481:	0f b7 c0             	movzx  eax,ax
 1004484:	83 ec 08             	sub    esp,0x8
 1004487:	52                   	push   edx
 1004488:	50                   	push   eax
 1004489:	e8 62 eb ff ff       	call   1002ff0 <outb>
 100448e:	83 c4 10             	add    esp,0x10
 1004491:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1004495:	74 07                	je     100449e <async_write_disk+0xf9>
 1004497:	b8 10 00 00 00       	mov    eax,0x10
 100449c:	eb 05                	jmp    10044a3 <async_write_disk+0xfe>
 100449e:	b8 00 00 00 00       	mov    eax,0x0
 10044a3:	88 45 ed             	mov    BYTE PTR [ebp-0x13],al
 10044a6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10044a9:	c1 e8 18             	shr    eax,0x18
 10044ac:	83 e0 0f             	and    eax,0xf
 10044af:	89 c2                	mov    edx,eax
 10044b1:	0f b6 45 ed          	movzx  eax,BYTE PTR [ebp-0x13]
 10044b5:	09 d0                	or     eax,edx
 10044b7:	83 c8 e0             	or     eax,0xffffffe0
 10044ba:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 10044bd:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 10044c1:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10044c5:	83 c0 06             	add    eax,0x6
 10044c8:	0f b7 c0             	movzx  eax,ax
 10044cb:	83 ec 08             	sub    esp,0x8
 10044ce:	52                   	push   edx
 10044cf:	50                   	push   eax
 10044d0:	e8 1b eb ff ff       	call   1002ff0 <outb>
 10044d5:	83 c4 10             	add    esp,0x10
 10044d8:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10044dc:	83 c0 07             	add    eax,0x7
 10044df:	0f b7 c0             	movzx  eax,ax
 10044e2:	83 ec 08             	sub    esp,0x8
 10044e5:	6a 30                	push   0x30
 10044e7:	50                   	push   eax
 10044e8:	e8 03 eb ff ff       	call   1002ff0 <outb>
 10044ed:	83 c4 10             	add    esp,0x10
 10044f0:	83 ec 0c             	sub    esp,0xc
 10044f3:	68 f7 00 00 00       	push   0xf7
 10044f8:	e8 13 eb ff ff       	call   1003010 <inb>
 10044fd:	83 c4 10             	add    esp,0x10
 1004500:	88 45 eb             	mov    BYTE PTR [ebp-0x15],al
 1004503:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 1004507:	83 e0 01             	and    eax,0x1
 100450a:	88 45 ea             	mov    BYTE PTR [ebp-0x16],al
 100450d:	80 7d ea 00          	cmp    BYTE PTR [ebp-0x16],0x0
 1004511:	74 07                	je     100451a <async_write_disk+0x175>
 1004513:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004518:	eb 12                	jmp    100452c <async_write_disk+0x187>
 100451a:	80 65 eb 88          	and    BYTE PTR [ebp-0x15],0x88
 100451e:	80 7d eb 08          	cmp    BYTE PTR [ebp-0x15],0x8
 1004522:	74 02                	je     1004526 <async_write_disk+0x181>
 1004524:	eb ca                	jmp    10044f0 <async_write_disk+0x14b>
 1004526:	90                   	nop
 1004527:	b8 00 00 00 00       	mov    eax,0x0
 100452c:	c9                   	leave  
 100452d:	c3                   	ret    

0100452e <read_disk>:
 100452e:	55                   	push   ebp
 100452f:	89 e5                	mov    ebp,esp
 1004531:	83 ec 08             	sub    esp,0x8
 1004534:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004537:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100453a:	89 c1                	mov    ecx,eax
 100453c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100453f:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1004542:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004545:	8b 00                	mov    eax,DWORD PTR [eax]
 1004547:	83 ec 04             	sub    esp,0x4
 100454a:	51                   	push   ecx
 100454b:	52                   	push   edx
 100454c:	50                   	push   eax
 100454d:	e8 2f 00 00 00       	call   1004581 <read_disk_asm>
 1004552:	83 c4 10             	add    esp,0x10
 1004555:	c9                   	leave  
 1004556:	c3                   	ret    

01004557 <write_disk>:
 1004557:	55                   	push   ebp
 1004558:	89 e5                	mov    ebp,esp
 100455a:	83 ec 08             	sub    esp,0x8
 100455d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004560:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1004563:	89 c1                	mov    ecx,eax
 1004565:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004568:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 100456b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100456e:	8b 00                	mov    eax,DWORD PTR [eax]
 1004570:	83 ec 04             	sub    esp,0x4
 1004573:	51                   	push   ecx
 1004574:	52                   	push   edx
 1004575:	50                   	push   eax
 1004576:	e8 7e 00 00 00       	call   10045f9 <write_disk_asm>
 100457b:	83 c4 10             	add    esp,0x10
 100457e:	c9                   	leave  
 100457f:	c3                   	ret    

01004580 <disk_int_handler>:
 1004580:	cf                   	iret   

01004581 <read_disk_asm>:
 1004581:	55                   	push   ebp
 1004582:	89 e5                	mov    ebp,esp
 1004584:	66 ba f7 01          	mov    dx,0x1f7
 1004588:	31 c9                	xor    ecx,ecx
 100458a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100458e:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1004592:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1004596:	89 c6                	mov    esi,eax
 1004598:	66 ba f2 01          	mov    dx,0x1f2
 100459c:	88 c8                	mov    al,cl
 100459e:	ee                   	out    dx,al
 100459f:	66 ba f3 01          	mov    dx,0x1f3
 10045a3:	89 f0                	mov    eax,esi
 10045a5:	ee                   	out    dx,al
 10045a6:	66 42                	inc    dx
 10045a8:	c1 e8 08             	shr    eax,0x8
 10045ab:	ee                   	out    dx,al
 10045ac:	66 42                	inc    dx
 10045ae:	c1 e8 08             	shr    eax,0x8
 10045b1:	ee                   	out    dx,al
 10045b2:	66 42                	inc    dx
 10045b4:	66 c1 e8 08          	shr    ax,0x8
 10045b8:	24 0f                	and    al,0xf
 10045ba:	0c e0                	or     al,0xe0
 10045bc:	ee                   	out    dx,al
 10045bd:	66 42                	inc    dx
 10045bf:	b0 20                	mov    al,0x20
 10045c1:	ee                   	out    dx,al

010045c2 <read_disk_asm.wait>:
 10045c2:	90                   	nop
 10045c3:	ec                   	in     al,dx
 10045c4:	24 88                	and    al,0x88
 10045c6:	3c 08                	cmp    al,0x8
 10045c8:	75 f8                	jne    10045c2 <read_disk_asm.wait>
 10045ca:	66 89 d7             	mov    di,dx
 10045cd:	89 c8                	mov    eax,ecx
 10045cf:	66 b9 00 01          	mov    cx,0x100
 10045d3:	66 f7 e1             	mul    cx
 10045d6:	89 c1                	mov    ecx,eax
 10045d8:	66 ba f0 01          	mov    dx,0x1f0

010045dc <read_disk_asm.read>:
 10045dc:	66 ed                	in     ax,dx
 10045de:	66 89 03             	mov    WORD PTR [ebx],ax
 10045e1:	83 c3 02             	add    ebx,0x2
 10045e4:	e2 f6                	loop   10045dc <read_disk_asm.read>
 10045e6:	c9                   	leave  
 10045e7:	b8 00 00 00 00       	mov    eax,0x0
 10045ec:	c3                   	ret    

010045ed <read_disk_asm.err_disk_reading>:
 10045ed:	66 ba f1 01          	mov    dx,0x1f1
 10045f1:	31 c0                	xor    eax,eax
 10045f3:	66 ed                	in     ax,dx
 10045f5:	89 ec                	mov    esp,ebp
 10045f7:	5d                   	pop    ebp
 10045f8:	c3                   	ret    

010045f9 <write_disk_asm>:
 10045f9:	55                   	push   ebp
 10045fa:	89 e5                	mov    ebp,esp
 10045fc:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1004600:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1004604:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1004608:	50                   	push   eax
 1004609:	66 ba f2 01          	mov    dx,0x1f2
 100460d:	88 c8                	mov    al,cl
 100460f:	ee                   	out    dx,al
 1004610:	58                   	pop    eax
 1004611:	66 ba f3 01          	mov    dx,0x1f3
 1004615:	ee                   	out    dx,al
 1004616:	c1 e8 08             	shr    eax,0x8
 1004619:	66 ba f4 01          	mov    dx,0x1f4
 100461d:	ee                   	out    dx,al
 100461e:	c1 e8 08             	shr    eax,0x8
 1004621:	66 ba f5 01          	mov    dx,0x1f5
 1004625:	ee                   	out    dx,al
 1004626:	c1 e8 08             	shr    eax,0x8
 1004629:	24 0f                	and    al,0xf
 100462b:	0c e0                	or     al,0xe0
 100462d:	66 ba f6 01          	mov    dx,0x1f6
 1004631:	ee                   	out    dx,al
 1004632:	66 ba f7 01          	mov    dx,0x1f7
 1004636:	b0 30                	mov    al,0x30
 1004638:	ee                   	out    dx,al

01004639 <write_disk_asm.not_ready2>:
 1004639:	90                   	nop
 100463a:	ec                   	in     al,dx
 100463b:	24 88                	and    al,0x88
 100463d:	3c 08                	cmp    al,0x8
 100463f:	75 f8                	jne    1004639 <write_disk_asm.not_ready2>
 1004641:	89 c8                	mov    eax,ecx
 1004643:	66 b9 00 01          	mov    cx,0x100
 1004647:	66 f7 e1             	mul    cx
 100464a:	89 c1                	mov    ecx,eax
 100464c:	66 ba f0 01          	mov    dx,0x1f0

01004650 <write_disk_asm.go_on_write>:
 1004650:	66 8b 03             	mov    ax,WORD PTR [ebx]
 1004653:	66 ef                	out    dx,ax
 1004655:	83 c3 02             	add    ebx,0x2
 1004658:	e2 f6                	loop   1004650 <write_disk_asm.go_on_write>
 100465a:	89 ec                	mov    esp,ebp
 100465c:	5d                   	pop    ebp
 100465d:	c3                   	ret    

0100465e <init_fat16>:
 100465e:	55                   	push   ebp
 100465f:	89 e5                	mov    ebp,esp
 1004661:	81 ec 88 00 00 00    	sub    esp,0x88
 1004667:	83 ec 0c             	sub    esp,0xc
 100466a:	68 40 75 00 01       	push   0x1007540
 100466f:	e8 4f d5 ff ff       	call   1001bc3 <reg_device>
 1004674:	83 c4 10             	add    esp,0x10
 1004677:	83 ec 0c             	sub    esp,0xc
 100467a:	68 e0 74 00 01       	push   0x10074e0
 100467f:	e8 f4 d5 ff ff       	call   1001c78 <reg_driver>
 1004684:	83 c4 10             	add    esp,0x10
 1004687:	a3 c4 62 42 00       	mov    ds:0x4262c4,eax
 100468c:	83 ec 0c             	sub    esp,0xc
 100468f:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
 1004695:	50                   	push   eax
 1004696:	e8 27 00 00 00       	call   10046c2 <load>
 100469b:	83 c4 10             	add    esp,0x10
 100469e:	8b 15 c4 62 42 00    	mov    edx,DWORD PTR ds:0x4262c4
 10046a4:	a1 44 e0 41 00       	mov    eax,ds:0x41e044
 10046a9:	83 ec 04             	sub    esp,0x4
 10046ac:	68 70 75 00 01       	push   0x1007570
 10046b1:	52                   	push   edx
 10046b2:	50                   	push   eax
 10046b3:	e8 07 cf ff ff       	call   10015bf <reg_vol>
 10046b8:	83 c4 10             	add    esp,0x10
 10046bb:	b8 00 00 00 00       	mov    eax,0x0
 10046c0:	c9                   	leave  
 10046c1:	c3                   	ret    

010046c2 <load>:
 10046c2:	55                   	push   ebp
 10046c3:	89 e5                	mov    ebp,esp
 10046c5:	83 ec 18             	sub    esp,0x18
 10046c8:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [ebp-0xc],0xffffffff
 10046cf:	83 ec 04             	sub    esp,0x4
 10046d2:	6a 01                	push   0x1
 10046d4:	6a 00                	push   0x0
 10046d6:	68 60 e0 41 00       	push   0x41e060
 10046db:	e8 1e 0a 00 00       	call   10050fe <read_sec>
 10046e0:	83 c4 10             	add    esp,0x10
 10046e3:	0f b7 05 76 e0 41 00 	movzx  eax,WORD PTR ds:0x41e076
 10046ea:	0f b7 d0             	movzx  edx,ax
 10046ed:	0f b7 05 6e e0 41 00 	movzx  eax,WORD PTR ds:0x41e06e
 10046f4:	0f b7 c0             	movzx  eax,ax
 10046f7:	83 ec 04             	sub    esp,0x4
 10046fa:	52                   	push   edx
 10046fb:	50                   	push   eax
 10046fc:	68 c0 22 42 00       	push   0x4222c0
 1004701:	e8 f8 09 00 00       	call   10050fe <read_sec>
 1004706:	83 c4 10             	add    esp,0x10
 1004709:	0f b7 05 6e e0 41 00 	movzx  eax,WORD PTR ds:0x41e06e
 1004710:	0f b7 c8             	movzx  ecx,ax
 1004713:	0f b7 05 76 e0 41 00 	movzx  eax,WORD PTR ds:0x41e076
 100471a:	0f b7 d0             	movzx  edx,ax
 100471d:	0f b6 05 70 e0 41 00 	movzx  eax,BYTE PTR ds:0x41e070
 1004724:	0f b6 c0             	movzx  eax,al
 1004727:	0f af c2             	imul   eax,edx
 100472a:	01 c8                	add    eax,ecx
 100472c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100472f:	0f b7 05 71 e0 41 00 	movzx  eax,WORD PTR ds:0x41e071
 1004736:	0f b7 c0             	movzx  eax,ax
 1004739:	c1 e0 05             	shl    eax,0x5
 100473c:	0f b7 15 6b e0 41 00 	movzx  edx,WORD PTR ds:0x41e06b
 1004743:	0f b7 ca             	movzx  ecx,dx
 1004746:	ba 00 00 00 00       	mov    edx,0x0
 100474b:	f7 f1                	div    ecx
 100474d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004750:	83 ec 04             	sub    esp,0x4
 1004753:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004756:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004759:	68 a0 e0 41 00       	push   0x41e0a0
 100475e:	e8 9b 09 00 00       	call   10050fe <read_sec>
 1004763:	83 c4 10             	add    esp,0x10
 1004766:	66 c7 05 ba 20 42 00 	mov    WORD PTR ds:0x4220ba,0x0
 100476d:	00 00 
 100476f:	0f b7 05 6e e0 41 00 	movzx  eax,WORD PTR ds:0x41e06e
 1004776:	0f b7 c0             	movzx  eax,ax
 1004779:	83 c0 3e             	add    eax,0x3e
 100477c:	a3 30 6e 00 01       	mov    ds:0x1006e30,eax
 1004781:	c7 05 c0 62 42 00 00 	mov    DWORD PTR ds:0x4262c0,0x0
 1004788:	00 00 00 
 100478b:	b8 00 00 00 00       	mov    eax,0x0
 1004790:	c9                   	leave  
 1004791:	c3                   	ret    

01004792 <verify_name>:
 1004792:	55                   	push   ebp
 1004793:	89 e5                	mov    ebp,esp
 1004795:	57                   	push   edi
 1004796:	56                   	push   esi
 1004797:	53                   	push   ebx
 1004798:	83 ec 6c             	sub    esp,0x6c
 100479b:	8d 55 8a             	lea    edx,[ebp-0x76]
 100479e:	b8 74 75 00 01       	mov    eax,0x1007574
 10047a3:	b9 46 00 00 00       	mov    ecx,0x46
 10047a8:	8b 18                	mov    ebx,DWORD PTR [eax]
 10047aa:	89 1a                	mov    DWORD PTR [edx],ebx
 10047ac:	8b 5c 08 fc          	mov    ebx,DWORD PTR [eax+ecx*1-0x4]
 10047b0:	89 5c 0a fc          	mov    DWORD PTR [edx+ecx*1-0x4],ebx
 10047b4:	8d 5a 04             	lea    ebx,[edx+0x4]
 10047b7:	83 e3 fc             	and    ebx,0xfffffffc
 10047ba:	29 da                	sub    edx,ebx
 10047bc:	29 d0                	sub    eax,edx
 10047be:	01 d1                	add    ecx,edx
 10047c0:	83 e1 fc             	and    ecx,0xfffffffc
 10047c3:	c1 e9 02             	shr    ecx,0x2
 10047c6:	89 ca                	mov    edx,ecx
 10047c8:	89 df                	mov    edi,ebx
 10047ca:	89 c6                	mov    esi,eax
 10047cc:	89 d1                	mov    ecx,edx
 10047ce:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 10047d0:	83 ec 0c             	sub    esp,0xc
 10047d3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10047d6:	e8 32 21 00 00       	call   100690d <strlen>
 10047db:	83 c4 10             	add    esp,0x10
 10047de:	83 f8 0b             	cmp    eax,0xb
 10047e1:	7f 0a                	jg     10047ed <verify_name+0x5b>
 10047e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10047e6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10047e9:	84 c0                	test   al,al
 10047eb:	75 0a                	jne    10047f7 <verify_name+0x65>
 10047ed:	b8 00 00 00 00       	mov    eax,0x0
 10047f2:	e9 81 01 00 00       	jmp    1004978 <verify_name+0x1e6>
 10047f7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10047fe:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 1004805:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 100480c:	c7 45 d0 01 00 00 00 	mov    DWORD PTR [ebp-0x30],0x1
 1004813:	eb 62                	jmp    1004877 <verify_name+0xe5>
 1004815:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 100481c:	eb 1e                	jmp    100483c <verify_name+0xaa>
 100481e:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004821:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004824:	01 d0                	add    eax,edx
 1004826:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 1004829:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 100482c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100482f:	01 c8                	add    eax,ecx
 1004831:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004834:	38 c2                	cmp    dl,al
 1004836:	74 0e                	je     1004846 <verify_name+0xb4>
 1004838:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 100483c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100483f:	83 f8 45             	cmp    eax,0x45
 1004842:	76 da                	jbe    100481e <verify_name+0x8c>
 1004844:	eb 01                	jmp    1004847 <verify_name+0xb5>
 1004846:	90                   	nop
 1004847:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 100484a:	83 f8 45             	cmp    eax,0x45
 100484d:	76 0a                	jbe    1004859 <verify_name+0xc7>
 100484f:	b8 00 00 00 00       	mov    eax,0x0
 1004854:	e9 1f 01 00 00       	jmp    1004978 <verify_name+0x1e6>
 1004859:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100485c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100485f:	01 d0                	add    eax,edx
 1004861:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004864:	3c 20                	cmp    al,0x20
 1004866:	74 07                	je     100486f <verify_name+0xdd>
 1004868:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 100486f:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004873:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 1004877:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100487a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100487d:	01 d0                	add    eax,edx
 100487f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004882:	3c 2e                	cmp    al,0x2e
 1004884:	74 0f                	je     1004895 <verify_name+0x103>
 1004886:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004889:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100488c:	01 d0                	add    eax,edx
 100488e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004891:	84 c0                	test   al,al
 1004893:	75 80                	jne    1004815 <verify_name+0x83>
 1004895:	83 7d e4 08          	cmp    DWORD PTR [ebp-0x1c],0x8
 1004899:	7f 06                	jg     10048a1 <verify_name+0x10f>
 100489b:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 100489f:	75 0a                	jne    10048ab <verify_name+0x119>
 10048a1:	b8 00 00 00 00       	mov    eax,0x0
 10048a6:	e9 cd 00 00 00       	jmp    1004978 <verify_name+0x1e6>
 10048ab:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10048ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10048b1:	01 d0                	add    eax,edx
 10048b3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10048b6:	84 c0                	test   al,al
 10048b8:	75 0a                	jne    10048c4 <verify_name+0x132>
 10048ba:	b8 01 00 00 00       	mov    eax,0x1
 10048bf:	e9 b4 00 00 00       	jmp    1004978 <verify_name+0x1e6>
 10048c4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10048cb:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 10048d2:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 10048d6:	eb 75                	jmp    100494d <verify_name+0x1bb>
 10048d8:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
 10048df:	eb 1e                	jmp    10048ff <verify_name+0x16d>
 10048e1:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 10048e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10048e7:	01 d0                	add    eax,edx
 10048e9:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10048ec:	8d 4d 8a             	lea    ecx,[ebp-0x76]
 10048ef:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10048f2:	01 c8                	add    eax,ecx
 10048f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10048f7:	38 c2                	cmp    dl,al
 10048f9:	74 0e                	je     1004909 <verify_name+0x177>
 10048fb:	83 45 d4 01          	add    DWORD PTR [ebp-0x2c],0x1
 10048ff:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1004902:	83 f8 45             	cmp    eax,0x45
 1004905:	76 da                	jbe    10048e1 <verify_name+0x14f>
 1004907:	eb 01                	jmp    100490a <verify_name+0x178>
 1004909:	90                   	nop
 100490a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 100490d:	83 f8 45             	cmp    eax,0x45
 1004910:	76 07                	jbe    1004919 <verify_name+0x187>
 1004912:	b8 00 00 00 00       	mov    eax,0x0
 1004917:	eb 5f                	jmp    1004978 <verify_name+0x1e6>
 1004919:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 100491c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100491f:	01 d0                	add    eax,edx
 1004921:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004924:	3c 20                	cmp    al,0x20
 1004926:	74 07                	je     100492f <verify_name+0x19d>
 1004928:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
 100492f:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004932:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004935:	01 d0                	add    eax,edx
 1004937:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100493a:	3c 2e                	cmp    al,0x2e
 100493c:	75 07                	jne    1004945 <verify_name+0x1b3>
 100493e:	b8 00 00 00 00       	mov    eax,0x0
 1004943:	eb 33                	jmp    1004978 <verify_name+0x1e6>
 1004945:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 1004949:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
 100494d:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004950:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004953:	01 d0                	add    eax,edx
 1004955:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004958:	84 c0                	test   al,al
 100495a:	0f 85 78 ff ff ff    	jne    10048d8 <verify_name+0x146>
 1004960:	83 7d e4 03          	cmp    DWORD PTR [ebp-0x1c],0x3
 1004964:	7f 06                	jg     100496c <verify_name+0x1da>
 1004966:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 100496a:	75 07                	jne    1004973 <verify_name+0x1e1>
 100496c:	b8 00 00 00 00       	mov    eax,0x0
 1004971:	eb 05                	jmp    1004978 <verify_name+0x1e6>
 1004973:	b8 01 00 00 00       	mov    eax,0x1
 1004978:	8d 65 f4             	lea    esp,[ebp-0xc]
 100497b:	5b                   	pop    ebx
 100497c:	5e                   	pop    esi
 100497d:	5f                   	pop    edi
 100497e:	5d                   	pop    ebp
 100497f:	c3                   	ret    

01004980 <format_name>:
 1004980:	55                   	push   ebp
 1004981:	89 e5                	mov    ebp,esp
 1004983:	83 ec 28             	sub    esp,0x28
 1004986:	c7 45 e0 20 20 20 20 	mov    DWORD PTR [ebp-0x20],0x20202020
 100498d:	c7 45 e4 20 20 20 20 	mov    DWORD PTR [ebp-0x1c],0x20202020
 1004994:	c7 45 e8 20 20 20 00 	mov    DWORD PTR [ebp-0x18],0x202020
 100499b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 10049a2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10049a9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10049b0:	eb 7e                	jmp    1004a30 <format_name+0xb0>
 10049b2:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10049b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049b8:	01 d0                	add    eax,edx
 10049ba:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10049bd:	3c 60                	cmp    al,0x60
 10049bf:	7e 32                	jle    10049f3 <format_name+0x73>
 10049c1:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10049c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049c7:	01 d0                	add    eax,edx
 10049c9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10049cc:	3c 7a                	cmp    al,0x7a
 10049ce:	7f 23                	jg     10049f3 <format_name+0x73>
 10049d0:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10049d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049d6:	01 d0                	add    eax,edx
 10049d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10049db:	8d 48 e0             	lea    ecx,[eax-0x20]
 10049de:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10049e1:	8d 50 01             	lea    edx,[eax+0x1]
 10049e4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10049e7:	89 ca                	mov    edx,ecx
 10049e9:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 10049ed:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10049f1:	eb 39                	jmp    1004a2c <format_name+0xac>
 10049f3:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 10049f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10049f9:	01 d0                	add    eax,edx
 10049fb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10049fe:	3c 2e                	cmp    al,0x2e
 1004a00:	75 0d                	jne    1004a0f <format_name+0x8f>
 1004a02:	b8 08 00 00 00       	mov    eax,0x8
 1004a07:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1004a0a:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
 1004a0d:	eb 1d                	jmp    1004a2c <format_name+0xac>
 1004a0f:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004a12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004a15:	8d 0c 02             	lea    ecx,[edx+eax*1]
 1004a18:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004a1b:	8d 50 01             	lea    edx,[eax+0x1]
 1004a1e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1004a21:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 1004a24:	88 54 05 e0          	mov    BYTE PTR [ebp+eax*1-0x20],dl
 1004a28:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004a2c:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1004a30:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 1004a33:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004a36:	01 d0                	add    eax,edx
 1004a38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004a3b:	84 c0                	test   al,al
 1004a3d:	0f 85 6f ff ff ff    	jne    10049b2 <format_name+0x32>
 1004a43:	c6 45 ec 00          	mov    BYTE PTR [ebp-0x14],0x0
 1004a47:	83 ec 08             	sub    esp,0x8
 1004a4a:	8d 45 e0             	lea    eax,[ebp-0x20]
 1004a4d:	50                   	push   eax
 1004a4e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1004a51:	e8 f1 1c 00 00       	call   1006747 <strcpy>
 1004a56:	83 c4 10             	add    esp,0x10
 1004a59:	90                   	nop
 1004a5a:	c9                   	leave  
 1004a5b:	c3                   	ret    

01004a5c <req_cluster>:
 1004a5c:	55                   	push   ebp
 1004a5d:	89 e5                	mov    ebp,esp
 1004a5f:	83 ec 10             	sub    esp,0x10
 1004a62:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3
 1004a69:	eb 26                	jmp    1004a91 <req_cluster+0x35>
 1004a6b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004a6e:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1004a75:	00 
 1004a76:	66 85 c0             	test   ax,ax
 1004a79:	75 12                	jne    1004a8d <req_cluster+0x31>
 1004a7b:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004a7e:	66 c7 84 00 c0 22 42 	mov    WORD PTR [eax+eax*1+0x4222c0],0xffff
 1004a85:	00 ff ff 
 1004a88:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004a8b:	eb 13                	jmp    1004aa0 <req_cluster+0x44>
 1004a8d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1004a91:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1004a94:	3d ff 1f 00 00       	cmp    eax,0x1fff
 1004a99:	76 d0                	jbe    1004a6b <req_cluster+0xf>
 1004a9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004aa0:	c9                   	leave  
 1004aa1:	c3                   	ret    

01004aa2 <write_sec>:
 1004aa2:	55                   	push   ebp
 1004aa3:	89 e5                	mov    ebp,esp
 1004aa5:	57                   	push   edi
 1004aa6:	81 ec 84 00 00 00    	sub    esp,0x84
 1004aac:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
 1004ab2:	b8 00 00 00 00       	mov    eax,0x0
 1004ab7:	b9 1f 00 00 00       	mov    ecx,0x1f
 1004abc:	89 d7                	mov    edi,edx
 1004abe:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 1004ac0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004ac3:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
 1004ac6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004ac9:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
 1004acc:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1004acf:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
 1004ad2:	a1 ec 6d 00 01       	mov    eax,ds:0x1006dec
 1004ad7:	83 ec 0c             	sub    esp,0xc
 1004ada:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
 1004ae0:	52                   	push   edx
 1004ae1:	ff d0                	call   eax
 1004ae3:	83 c4 10             	add    esp,0x10
 1004ae6:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1004ae9:	c9                   	leave  
 1004aea:	c3                   	ret    

01004aeb <set_attr>:
 1004aeb:	55                   	push   ebp
 1004aec:	89 e5                	mov    ebp,esp
 1004aee:	83 ec 04             	sub    esp,0x4
 1004af1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004af4:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1004af7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004afa:	0f b6 40 0b          	movzx  eax,BYTE PTR [eax+0xb]
 1004afe:	0a 45 fc             	or     al,BYTE PTR [ebp-0x4]
 1004b01:	89 c2                	mov    edx,eax
 1004b03:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004b06:	88 50 0b             	mov    BYTE PTR [eax+0xb],dl
 1004b09:	90                   	nop
 1004b0a:	c9                   	leave  
 1004b0b:	c3                   	ret    

01004b0c <update_fat_and_root>:
 1004b0c:	55                   	push   ebp
 1004b0d:	89 e5                	mov    ebp,esp
 1004b0f:	83 ec 18             	sub    esp,0x18
 1004b12:	0f b7 05 6e e0 41 00 	movzx  eax,WORD PTR ds:0x41e06e
 1004b19:	0f b7 c8             	movzx  ecx,ax
 1004b1c:	0f b7 05 76 e0 41 00 	movzx  eax,WORD PTR ds:0x41e076
 1004b23:	0f b7 d0             	movzx  edx,ax
 1004b26:	0f b6 05 70 e0 41 00 	movzx  eax,BYTE PTR ds:0x41e070
 1004b2d:	0f b6 c0             	movzx  eax,al
 1004b30:	0f af c2             	imul   eax,edx
 1004b33:	01 c8                	add    eax,ecx
 1004b35:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004b38:	83 ec 04             	sub    esp,0x4
 1004b3b:	68 00 40 00 00       	push   0x4000
 1004b40:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1004b43:	68 a0 e0 41 00       	push   0x41e0a0
 1004b48:	e8 55 ff ff ff       	call   1004aa2 <write_sec>
 1004b4d:	83 c4 10             	add    esp,0x10
 1004b50:	0f b7 05 6e e0 41 00 	movzx  eax,WORD PTR ds:0x41e06e
 1004b57:	0f b7 c0             	movzx  eax,ax
 1004b5a:	83 ec 04             	sub    esp,0x4
 1004b5d:	68 00 40 00 00       	push   0x4000
 1004b62:	50                   	push   eax
 1004b63:	68 c0 22 42 00       	push   0x4222c0
 1004b68:	e8 35 ff ff ff       	call   1004aa2 <write_sec>
 1004b6d:	83 c4 10             	add    esp,0x10
 1004b70:	90                   	nop
 1004b71:	c9                   	leave  
 1004b72:	c3                   	ret    

01004b73 <add_dot_and_ddot_dir>:
 1004b73:	55                   	push   ebp
 1004b74:	89 e5                	mov    ebp,esp
 1004b76:	83 ec 18             	sub    esp,0x18
 1004b79:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004b7d:	0f b7 c0             	movzx  eax,ax
 1004b80:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1004b83:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004b8a:	0f b6 c0             	movzx  eax,al
 1004b8d:	8b 0d 30 6e 00 01    	mov    ecx,DWORD PTR ds:0x1006e30
 1004b93:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1004b96:	01 ca                	add    edx,ecx
 1004b98:	83 ec 04             	sub    esp,0x4
 1004b9b:	50                   	push   eax
 1004b9c:	52                   	push   edx
 1004b9d:	68 c0 20 42 00       	push   0x4220c0
 1004ba2:	e8 57 05 00 00       	call   10050fe <read_sec>
 1004ba7:	83 c4 10             	add    esp,0x10
 1004baa:	83 ec 08             	sub    esp,0x8
 1004bad:	68 ba 75 00 01       	push   0x10075ba
 1004bb2:	68 c0 20 42 00       	push   0x4220c0
 1004bb7:	e8 8b 1b 00 00       	call   1006747 <strcpy>
 1004bbc:	83 c4 10             	add    esp,0x10
 1004bbf:	83 ec 08             	sub    esp,0x8
 1004bc2:	68 c3 75 00 01       	push   0x10075c3
 1004bc7:	68 c8 20 42 00       	push   0x4220c8
 1004bcc:	e8 76 1b 00 00       	call   1006747 <strcpy>
 1004bd1:	83 c4 10             	add    esp,0x10
 1004bd4:	0f b7 45 22          	movzx  eax,WORD PTR [ebp+0x22]
 1004bd8:	66 a3 da 20 42 00    	mov    ds:0x4220da,ax
 1004bde:	c7 05 dc 20 42 00 00 	mov    DWORD PTR ds:0x4220dc,0x0
 1004be5:	00 00 00 
 1004be8:	83 ec 08             	sub    esp,0x8
 1004beb:	6a 10                	push   0x10
 1004bed:	68 c0 20 42 00       	push   0x4220c0
 1004bf2:	e8 f4 fe ff ff       	call   1004aeb <set_attr>
 1004bf7:	83 c4 10             	add    esp,0x10
 1004bfa:	83 ec 08             	sub    esp,0x8
 1004bfd:	68 c7 75 00 01       	push   0x10075c7
 1004c02:	68 e0 20 42 00       	push   0x4220e0
 1004c07:	e8 3b 1b 00 00       	call   1006747 <strcpy>
 1004c0c:	83 c4 10             	add    esp,0x10
 1004c0f:	83 ec 08             	sub    esp,0x8
 1004c12:	68 c3 75 00 01       	push   0x10075c3
 1004c17:	68 e8 20 42 00       	push   0x4220e8
 1004c1c:	e8 26 1b 00 00       	call   1006747 <strcpy>
 1004c21:	83 c4 10             	add    esp,0x10
 1004c24:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1004c2b:	66 a3 fa 20 42 00    	mov    ds:0x4220fa,ax
 1004c31:	c7 05 fc 20 42 00 00 	mov    DWORD PTR ds:0x4220fc,0x0
 1004c38:	00 00 00 
 1004c3b:	83 ec 08             	sub    esp,0x8
 1004c3e:	6a 10                	push   0x10
 1004c40:	68 e0 20 42 00       	push   0x4220e0
 1004c45:	e8 a1 fe ff ff       	call   1004aeb <set_attr>
 1004c4a:	83 c4 10             	add    esp,0x10
 1004c4d:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1004c53:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1004c56:	01 d0                	add    eax,edx
 1004c58:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1004c5b:	83 ec 04             	sub    esp,0x4
 1004c5e:	68 00 02 00 00       	push   0x200
 1004c63:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1004c66:	68 c0 20 42 00       	push   0x4220c0
 1004c6b:	e8 32 fe ff ff       	call   1004aa2 <write_sec>
 1004c70:	83 c4 10             	add    esp,0x10
 1004c73:	90                   	nop
 1004c74:	c9                   	leave  
 1004c75:	c3                   	ret    

01004c76 <translate_attr>:
 1004c76:	55                   	push   ebp
 1004c77:	89 e5                	mov    ebp,esp
 1004c79:	83 ec 14             	sub    esp,0x14
 1004c7c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004c7f:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1004c82:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004c86:	83 e0 01             	and    eax,0x1
 1004c89:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004c8c:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004c90:	74 09                	je     1004c9b <translate_attr+0x25>
 1004c92:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004c95:	83 c0 01             	add    eax,0x1
 1004c98:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 1004c9b:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004c9f:	83 e0 02             	and    eax,0x2
 1004ca2:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004ca5:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004ca9:	74 09                	je     1004cb4 <translate_attr+0x3e>
 1004cab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004cae:	83 c0 02             	add    eax,0x2
 1004cb1:	c6 00 68             	mov    BYTE PTR [eax],0x68
 1004cb4:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004cb8:	83 e0 04             	and    eax,0x4
 1004cbb:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004cbe:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004cc2:	74 09                	je     1004ccd <translate_attr+0x57>
 1004cc4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004cc7:	83 c0 04             	add    eax,0x4
 1004cca:	c6 00 73             	mov    BYTE PTR [eax],0x73
 1004ccd:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004cd1:	83 e0 08             	and    eax,0x8
 1004cd4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004cd7:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004cdb:	74 09                	je     1004ce6 <translate_attr+0x70>
 1004cdd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004ce0:	83 c0 03             	add    eax,0x3
 1004ce3:	c6 00 76             	mov    BYTE PTR [eax],0x76
 1004ce6:	0f be 45 ec          	movsx  eax,BYTE PTR [ebp-0x14]
 1004cea:	83 e0 10             	and    eax,0x10
 1004ced:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004cf0:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1004cf4:	74 09                	je     1004cff <translate_attr+0x89>
 1004cf6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004cf9:	83 c0 03             	add    eax,0x3
 1004cfc:	c6 00 64             	mov    BYTE PTR [eax],0x64
 1004cff:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1004d02:	83 c0 05             	add    eax,0x5
 1004d05:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1004d08:	90                   	nop
 1004d09:	c9                   	leave  
 1004d0a:	c3                   	ret    

01004d0b <extend_cluster>:
 1004d0b:	55                   	push   ebp
 1004d0c:	89 e5                	mov    ebp,esp
 1004d0e:	83 ec 14             	sub    esp,0x14
 1004d11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004d14:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 1004d18:	e8 3f fd ff ff       	call   1004a5c <req_cluster>
 1004d1d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1004d20:	83 7d fc ff          	cmp    DWORD PTR [ebp-0x4],0xffffffff
 1004d24:	75 07                	jne    1004d2d <extend_cluster+0x22>
 1004d26:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004d2b:	eb 14                	jmp    1004d41 <extend_cluster+0x36>
 1004d2d:	0f bf 45 ec          	movsx  eax,WORD PTR [ebp-0x14]
 1004d31:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
 1004d34:	66 89 94 00 c0 22 42 	mov    WORD PTR [eax+eax*1+0x4222c0],dx
 1004d3b:	00 
 1004d3c:	b8 00 00 00 00       	mov    eax,0x0
 1004d41:	c9                   	leave  
 1004d42:	c3                   	ret    

01004d43 <touch>:
 1004d43:	55                   	push   ebp
 1004d44:	89 e5                	mov    ebp,esp
 1004d46:	83 ec 48             	sub    esp,0x48
 1004d49:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004d4c:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1004d4f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004d52:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004d55:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1004d58:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 1004d5c:	c7 45 e8 10 00 00 00 	mov    DWORD PTR [ebp-0x18],0x10
 1004d63:	c7 45 e4 c0 20 42 00 	mov    DWORD PTR [ebp-0x1c],0x4220c0
 1004d6a:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004d71:	0f b6 c0             	movzx  eax,al
 1004d74:	0f b7 55 da          	movzx  edx,WORD PTR [ebp-0x26]
 1004d78:	0f b7 ca             	movzx  ecx,dx
 1004d7b:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1004d81:	01 ca                	add    edx,ecx
 1004d83:	83 ec 04             	sub    esp,0x4
 1004d86:	50                   	push   eax
 1004d87:	52                   	push   edx
 1004d88:	68 c0 20 42 00       	push   0x4220c0
 1004d8d:	e8 6c 03 00 00       	call   10050fe <read_sec>
 1004d92:	83 c4 10             	add    esp,0x10
 1004d95:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 1004d99:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004d9d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004da4:	e9 04 01 00 00       	jmp    1004ead <touch+0x16a>
 1004da9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004dac:	c1 e0 05             	shl    eax,0x5
 1004daf:	89 c2                	mov    edx,eax
 1004db1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004db4:	01 d0                	add    eax,edx
 1004db6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004db9:	3c e5                	cmp    al,0xe5
 1004dbb:	74 18                	je     1004dd5 <touch+0x92>
 1004dbd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004dc0:	c1 e0 05             	shl    eax,0x5
 1004dc3:	89 c2                	mov    edx,eax
 1004dc5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004dc8:	01 d0                	add    eax,edx
 1004dca:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004dcd:	84 c0                	test   al,al
 1004dcf:	0f 85 d4 00 00 00    	jne    1004ea9 <touch+0x166>
 1004dd5:	83 ec 0c             	sub    esp,0xc
 1004dd8:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004ddb:	e8 a0 fb ff ff       	call   1004980 <format_name>
 1004de0:	83 c4 10             	add    esp,0x10
 1004de3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004de6:	c1 e0 05             	shl    eax,0x5
 1004de9:	89 c2                	mov    edx,eax
 1004deb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004dee:	01 d0                	add    eax,edx
 1004df0:	83 ec 04             	sub    esp,0x4
 1004df3:	6a 0b                	push   0xb
 1004df5:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004df8:	50                   	push   eax
 1004df9:	e8 81 18 00 00       	call   100667f <memcpy>
 1004dfe:	83 c4 10             	add    esp,0x10
 1004e01:	e8 56 fc ff ff       	call   1004a5c <req_cluster>
 1004e06:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1004e09:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
 1004e0d:	75 0a                	jne    1004e19 <touch+0xd6>
 1004e0f:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004e14:	e9 ed 00 00 00       	jmp    1004f06 <touch+0x1c3>
 1004e19:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e1c:	c1 e0 05             	shl    eax,0x5
 1004e1f:	89 c2                	mov    edx,eax
 1004e21:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004e24:	01 d0                	add    eax,edx
 1004e26:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1004e29:	66 89 50 1a          	mov    WORD PTR [eax+0x1a],dx
 1004e2d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e30:	c1 e0 05             	shl    eax,0x5
 1004e33:	89 c2                	mov    edx,eax
 1004e35:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004e38:	01 d0                	add    eax,edx
 1004e3a:	83 ec 08             	sub    esp,0x8
 1004e3d:	6a 20                	push   0x20
 1004e3f:	50                   	push   eax
 1004e40:	e8 a6 fc ff ff       	call   1004aeb <set_attr>
 1004e45:	83 c4 10             	add    esp,0x10
 1004e48:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1004e4f:	0f b7 d0             	movzx  edx,ax
 1004e52:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004e59:	0f b6 c0             	movzx  eax,al
 1004e5c:	0f af d0             	imul   edx,eax
 1004e5f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004e62:	c1 e0 05             	shl    eax,0x5
 1004e65:	89 c1                	mov    ecx,eax
 1004e67:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1004e6a:	01 c8                	add    eax,ecx
 1004e6c:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
 1004e6f:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1004e76:	0f b7 d0             	movzx  edx,ax
 1004e79:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004e80:	0f b6 c0             	movzx  eax,al
 1004e83:	0f af c2             	imul   eax,edx
 1004e86:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004e8a:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1004e90:	01 ca                	add    edx,ecx
 1004e92:	83 ec 04             	sub    esp,0x4
 1004e95:	50                   	push   eax
 1004e96:	52                   	push   edx
 1004e97:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1004e9a:	e8 03 fc ff ff       	call   1004aa2 <write_sec>
 1004e9f:	83 c4 10             	add    esp,0x10
 1004ea2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1004ea7:	eb 5d                	jmp    1004f06 <touch+0x1c3>
 1004ea9:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1004ead:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004eb0:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 1004eb3:	0f 8c f0 fe ff ff    	jl     1004da9 <touch+0x66>
 1004eb9:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004ebe:	77 36                	ja     1004ef6 <touch+0x1b3>
 1004ec0:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 1004ec4:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1004ecb:	00 
 1004ecc:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004ed0:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004ed7:	0f b6 c0             	movzx  eax,al
 1004eda:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004ede:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1004ee4:	01 ca                	add    edx,ecx
 1004ee6:	83 ec 04             	sub    esp,0x4
 1004ee9:	50                   	push   eax
 1004eea:	52                   	push   edx
 1004eeb:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1004eee:	e8 0b 02 00 00       	call   10050fe <read_sec>
 1004ef3:	83 c4 10             	add    esp,0x10
 1004ef6:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 1004efb:	0f 86 9c fe ff ff    	jbe    1004d9d <touch+0x5a>
 1004f01:	b8 00 00 00 00       	mov    eax,0x0
 1004f06:	c9                   	leave  
 1004f07:	c3                   	ret    

01004f08 <mkdir>:
 1004f08:	55                   	push   ebp
 1004f09:	89 e5                	mov    ebp,esp
 1004f0b:	83 ec 48             	sub    esp,0x48
 1004f0e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004f11:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1004f14:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1004f17:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1004f1a:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1004f1d:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 1004f21:	83 ec 0c             	sub    esp,0xc
 1004f24:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004f27:	e8 54 fa ff ff       	call   1004980 <format_name>
 1004f2c:	83 c4 10             	add    esp,0x10
 1004f2f:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 1004f33:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 1004f37:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1004f3e:	0f b6 c0             	movzx  eax,al
 1004f41:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1004f45:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1004f4b:	01 ca                	add    edx,ecx
 1004f4d:	83 ec 04             	sub    esp,0x4
 1004f50:	50                   	push   eax
 1004f51:	52                   	push   edx
 1004f52:	68 c0 20 42 00       	push   0x4220c0
 1004f57:	e8 a2 01 00 00       	call   10050fe <read_sec>
 1004f5c:	83 c4 10             	add    esp,0x10
 1004f5f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1004f66:	e9 60 01 00 00       	jmp    10050cb <mkdir+0x1c3>
 1004f6b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f6e:	c1 e0 05             	shl    eax,0x5
 1004f71:	05 da 20 42 00       	add    eax,0x4220da
 1004f76:	0f b7 00             	movzx  eax,WORD PTR [eax]
 1004f79:	66 85 c0             	test   ax,ax
 1004f7c:	74 28                	je     1004fa6 <mkdir+0x9e>
 1004f7e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f81:	c1 e0 05             	shl    eax,0x5
 1004f84:	05 a0 e0 41 00       	add    eax,0x41e0a0
 1004f89:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004f8c:	3c e5                	cmp    al,0xe5
 1004f8e:	74 16                	je     1004fa6 <mkdir+0x9e>
 1004f90:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004f93:	c1 e0 05             	shl    eax,0x5
 1004f96:	05 a0 e0 41 00       	add    eax,0x41e0a0
 1004f9b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1004f9e:	84 c0                	test   al,al
 1004fa0:	0f 85 21 01 00 00    	jne    10050c7 <mkdir+0x1bf>
 1004fa6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004fa9:	c1 e0 05             	shl    eax,0x5
 1004fac:	05 c0 20 42 00       	add    eax,0x4220c0
 1004fb1:	83 ec 04             	sub    esp,0x4
 1004fb4:	6a 20                	push   0x20
 1004fb6:	6a 00                	push   0x0
 1004fb8:	50                   	push   eax
 1004fb9:	e8 4b 17 00 00       	call   1006709 <memset>
 1004fbe:	83 c4 10             	add    esp,0x10
 1004fc1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004fc4:	c1 e0 05             	shl    eax,0x5
 1004fc7:	05 c0 20 42 00       	add    eax,0x4220c0
 1004fcc:	83 ec 04             	sub    esp,0x4
 1004fcf:	6a 0b                	push   0xb
 1004fd1:	6a 20                	push   0x20
 1004fd3:	50                   	push   eax
 1004fd4:	e8 30 17 00 00       	call   1006709 <memset>
 1004fd9:	83 c4 10             	add    esp,0x10
 1004fdc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1004fdf:	c1 e0 05             	shl    eax,0x5
 1004fe2:	05 c0 20 42 00       	add    eax,0x4220c0
 1004fe7:	83 ec 08             	sub    esp,0x8
 1004fea:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004fed:	50                   	push   eax
 1004fee:	e8 54 17 00 00       	call   1006747 <strcpy>
 1004ff3:	83 c4 10             	add    esp,0x10
 1004ff6:	83 ec 0c             	sub    esp,0xc
 1004ff9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1004ffc:	e8 0c 19 00 00       	call   100690d <strlen>
 1005001:	83 c4 10             	add    esp,0x10
 1005004:	89 c2                	mov    edx,eax
 1005006:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005009:	c1 e0 05             	shl    eax,0x5
 100500c:	01 d0                	add    eax,edx
 100500e:	05 c0 20 42 00       	add    eax,0x4220c0
 1005013:	c6 00 20             	mov    BYTE PTR [eax],0x20
 1005016:	e8 41 fa ff ff       	call   1004a5c <req_cluster>
 100501b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 100501e:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 1005022:	75 0a                	jne    100502e <mkdir+0x126>
 1005024:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005029:	e9 ce 00 00 00       	jmp    10050fc <mkdir+0x1f4>
 100502e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1005031:	89 c2                	mov    edx,eax
 1005033:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005036:	c1 e0 05             	shl    eax,0x5
 1005039:	05 da 20 42 00       	add    eax,0x4220da
 100503e:	66 89 10             	mov    WORD PTR [eax],dx
 1005041:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005044:	c1 e0 05             	shl    eax,0x5
 1005047:	05 c0 20 42 00       	add    eax,0x4220c0
 100504c:	83 ec 08             	sub    esp,0x8
 100504f:	6a 10                	push   0x10
 1005051:	50                   	push   eax
 1005052:	e8 94 fa ff ff       	call   1004aeb <set_attr>
 1005057:	83 c4 10             	add    esp,0x10
 100505a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100505d:	c1 e0 05             	shl    eax,0x5
 1005060:	05 dc 20 42 00       	add    eax,0x4220dc
 1005065:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 100506b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100506e:	c1 e0 05             	shl    eax,0x5
 1005071:	05 c0 20 42 00       	add    eax,0x4220c0
 1005076:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1005079:	ff 70 18             	push   DWORD PTR [eax+0x18]
 100507c:	ff 70 14             	push   DWORD PTR [eax+0x14]
 100507f:	ff 70 10             	push   DWORD PTR [eax+0x10]
 1005082:	ff 70 0c             	push   DWORD PTR [eax+0xc]
 1005085:	ff 70 08             	push   DWORD PTR [eax+0x8]
 1005088:	ff 70 04             	push   DWORD PTR [eax+0x4]
 100508b:	ff 30                	push   DWORD PTR [eax]
 100508d:	e8 e1 fa ff ff       	call   1004b73 <add_dot_and_ddot_dir>
 1005092:	83 c4 20             	add    esp,0x20
 1005095:	0f b7 55 f6          	movzx  edx,WORD PTR [ebp-0xa]
 1005099:	a1 30 6e 00 01       	mov    eax,ds:0x1006e30
 100509e:	01 d0                	add    eax,edx
 10050a0:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10050a3:	83 ec 04             	sub    esp,0x4
 10050a6:	68 00 02 00 00       	push   0x200
 10050ab:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 10050ae:	68 c0 20 42 00       	push   0x4220c0
 10050b3:	e8 ea f9 ff ff       	call   1004aa2 <write_sec>
 10050b8:	83 c4 10             	add    esp,0x10
 10050bb:	e8 4c fa ff ff       	call   1004b0c <update_fat_and_root>
 10050c0:	b8 00 00 00 00       	mov    eax,0x0
 10050c5:	eb 35                	jmp    10050fc <mkdir+0x1f4>
 10050c7:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10050cb:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 10050cf:	0f 8e 96 fe ff ff    	jle    1004f6b <mkdir+0x63>
 10050d5:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 10050da:	77 10                	ja     10050ec <mkdir+0x1e4>
 10050dc:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10050e0:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10050e7:	00 
 10050e8:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10050ec:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 10050f1:	0f 86 40 fe ff ff    	jbe    1004f37 <mkdir+0x2f>
 10050f7:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10050fc:	c9                   	leave  
 10050fd:	c3                   	ret    

010050fe <read_sec>:
 10050fe:	55                   	push   ebp
 10050ff:	89 e5                	mov    ebp,esp
 1005101:	57                   	push   edi
 1005102:	81 ec 84 00 00 00    	sub    esp,0x84
 1005108:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 100510e:	b8 00 00 00 00       	mov    eax,0x0
 1005113:	b9 1f 00 00 00       	mov    ecx,0x1f
 1005118:	89 d7                	mov    edi,edx
 100511a:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 100511c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100511f:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1005125:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005128:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100512e:	c7 45 90 01 00 00 00 	mov    DWORD PTR [ebp-0x70],0x1
 1005135:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 100513c:	eb 3f                	jmp    100517d <read_sec+0x7f>
 100513e:	a1 ec 6d 00 01       	mov    eax,ds:0x1006dec
 1005143:	83 ec 0c             	sub    esp,0xc
 1005146:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
 100514c:	52                   	push   edx
 100514d:	ff d0                	call   eax
 100514f:	83 c4 10             	add    esp,0x10
 1005152:	8b 95 7c ff ff ff    	mov    edx,DWORD PTR [ebp-0x84]
 1005158:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 100515f:	0f b7 c0             	movzx  eax,ax
 1005162:	01 d0                	add    eax,edx
 1005164:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
 100516a:	8b 85 78 ff ff ff    	mov    eax,DWORD PTR [ebp-0x88]
 1005170:	83 c0 01             	add    eax,0x1
 1005173:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1005179:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 100517d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005180:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1005183:	7c b9                	jl     100513e <read_sec+0x40>
 1005185:	b8 00 00 00 00       	mov    eax,0x0
 100518a:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 100518d:	c9                   	leave  
 100518e:	c3                   	ret    

0100518f <rm>:
 100518f:	55                   	push   ebp
 1005190:	89 e5                	mov    ebp,esp
 1005192:	57                   	push   edi
 1005193:	81 ec b4 00 00 00    	sub    esp,0xb4
 1005199:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100519c:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 100519f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 10051a2:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
 10051a8:	b8 00 00 00 00       	mov    eax,0x0
 10051ad:	b9 1f 00 00 00       	mov    ecx,0x1f
 10051b2:	89 d7                	mov    edi,edx
 10051b4:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10051b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10051b9:	8b 40 78             	mov    eax,DWORD PTR [eax+0x78]
 10051bc:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
 10051c2:	83 ec 0c             	sub    esp,0xc
 10051c5:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
 10051cb:	50                   	push   eax
 10051cc:	e8 83 08 00 00       	call   1005a54 <get_entry>
 10051d1:	83 c4 10             	add    esp,0x10
 10051d4:	83 f8 ff             	cmp    eax,0xffffffff
 10051d7:	75 0a                	jne    10051e3 <rm+0x54>
 10051d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10051de:	e9 7f 01 00 00       	jmp    1005362 <rm+0x1d3>
 10051e3:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
 10051e6:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
 10051ea:	c7 45 e4 c0 20 42 00 	mov    DWORD PTR [ebp-0x1c],0x4220c0
 10051f1:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 10051f8:	0f b6 c0             	movzx  eax,al
 10051fb:	0f b7 55 de          	movzx  edx,WORD PTR [ebp-0x22]
 10051ff:	0f b7 ca             	movzx  ecx,dx
 1005202:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005208:	01 ca                	add    edx,ecx
 100520a:	83 ec 04             	sub    esp,0x4
 100520d:	50                   	push   eax
 100520e:	52                   	push   edx
 100520f:	68 c0 20 42 00       	push   0x4220c0
 1005214:	e8 e5 fe ff ff       	call   10050fe <read_sec>
 1005219:	83 c4 10             	add    esp,0x10
 100521c:	c7 45 e4 c0 20 42 00 	mov    DWORD PTR [ebp-0x1c],0x4220c0
 1005223:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
 1005227:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 100522b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1005232:	eb 79                	jmp    10052ad <rm+0x11e>
 1005234:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100523b:	0f b6 c0             	movzx  eax,al
 100523e:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005242:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005248:	01 ca                	add    edx,ecx
 100524a:	83 ec 04             	sub    esp,0x4
 100524d:	50                   	push   eax
 100524e:	52                   	push   edx
 100524f:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005252:	e8 a7 fe ff ff       	call   10050fe <read_sec>
 1005257:	83 c4 10             	add    esp,0x10
 100525a:	eb 34                	jmp    1005290 <rm+0x101>
 100525c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100525f:	c1 e0 05             	shl    eax,0x5
 1005262:	89 c2                	mov    edx,eax
 1005264:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005267:	01 d0                	add    eax,edx
 1005269:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 100526d:	0f b7 d0             	movzx  edx,ax
 1005270:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005273:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005276:	39 c2                	cmp    edx,eax
 1005278:	75 12                	jne    100528c <rm+0xfd>
 100527a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100527d:	c1 e0 05             	shl    eax,0x5
 1005280:	89 c2                	mov    edx,eax
 1005282:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005285:	01 d0                	add    eax,edx
 1005287:	c6 00 e5             	mov    BYTE PTR [eax],0xe5
 100528a:	eb 29                	jmp    10052b5 <rm+0x126>
 100528c:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 1005290:	83 7d f0 0f          	cmp    DWORD PTR [ebp-0x10],0xf
 1005294:	7e c6                	jle    100525c <rm+0xcd>
 1005296:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 100529b:	77 10                	ja     10052ad <rm+0x11e>
 100529d:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
 10052a1:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10052a8:	00 
 10052a9:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
 10052ad:	66 83 7d f6 f6       	cmp    WORD PTR [ebp-0xa],0xfff6
 10052b2:	76 80                	jbe    1005234 <rm+0xa5>
 10052b4:	90                   	nop
 10052b5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10052b8:	c1 e0 05             	shl    eax,0x5
 10052bb:	89 c2                	mov    edx,eax
 10052bd:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10052c0:	01 d0                	add    eax,edx
 10052c2:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
 10052c6:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 10052ca:	66 83 7d ee f6       	cmp    WORD PTR [ebp-0x12],0xfff6
 10052cf:	77 0e                	ja     10052df <rm+0x150>
 10052d1:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10052d5:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10052dc:	00 
 10052dd:	eb 05                	jmp    10052e4 <rm+0x155>
 10052df:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10052e4:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 10052e8:	eb 26                	jmp    1005310 <rm+0x181>
 10052ea:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 10052ee:	66 c7 84 00 c0 22 42 	mov    WORD PTR [eax+eax*1+0x4222c0],0x0
 10052f5:	00 00 00 
 10052f8:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 10052fc:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
 1005300:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
 1005304:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 100530b:	00 
 100530c:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
 1005310:	66 83 7d ec f6       	cmp    WORD PTR [ebp-0x14],0xfff6
 1005315:	76 d3                	jbe    10052ea <rm+0x15b>
 1005317:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
 100531b:	66 c7 84 00 c0 22 42 	mov    WORD PTR [eax+eax*1+0x4222c0],0x0
 1005322:	00 00 00 
 1005325:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100532c:	0f b6 d0             	movzx  edx,al
 100532f:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005336:	0f b7 c0             	movzx  eax,ax
 1005339:	0f af c2             	imul   eax,edx
 100533c:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
 1005340:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005346:	01 ca                	add    edx,ecx
 1005348:	83 ec 04             	sub    esp,0x4
 100534b:	50                   	push   eax
 100534c:	52                   	push   edx
 100534d:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 1005350:	e8 4d f7 ff ff       	call   1004aa2 <write_sec>
 1005355:	83 c4 10             	add    esp,0x10
 1005358:	e8 af f7 ff ff       	call   1004b0c <update_fat_and_root>
 100535d:	b8 00 00 00 00       	mov    eax,0x0
 1005362:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 1005365:	c9                   	leave  
 1005366:	c3                   	ret    

01005367 <find>:
 1005367:	55                   	push   ebp
 1005368:	89 e5                	mov    ebp,esp
 100536a:	83 ec 28             	sub    esp,0x28
 100536d:	c7 45 f4 00 02 00 00 	mov    DWORD PTR [ebp-0xc],0x200
 1005374:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 100537b:	c7 45 ec c0 20 42 00 	mov    DWORD PTR [ebp-0x14],0x4220c0
 1005382:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005389:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100538d:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005394:	66 85 c0             	test   ax,ax
 1005397:	75 09                	jne    10053a2 <find+0x3b>
 1005399:	c7 45 ec a0 e0 41 00 	mov    DWORD PTR [ebp-0x14],0x41e0a0
 10053a0:	eb 2d                	jmp    10053cf <find+0x68>
 10053a2:	c7 45 f4 10 00 00 00 	mov    DWORD PTR [ebp-0xc],0x10
 10053a9:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 10053b0:	0f b6 c0             	movzx  eax,al
 10053b3:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 10053b7:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 10053bd:	01 ca                	add    edx,ecx
 10053bf:	83 ec 04             	sub    esp,0x4
 10053c2:	50                   	push   eax
 10053c3:	52                   	push   edx
 10053c4:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 10053c7:	e8 32 fd ff ff       	call   10050fe <read_sec>
 10053cc:	83 c4 10             	add    esp,0x10
 10053cf:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 10053d6:	eb 45                	jmp    100541d <find+0xb6>
 10053d8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10053db:	c1 e0 05             	shl    eax,0x5
 10053de:	89 c2                	mov    edx,eax
 10053e0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10053e3:	01 d0                	add    eax,edx
 10053e5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10053e8:	84 c0                	test   al,al
 10053ea:	74 2c                	je     1005418 <find+0xb1>
 10053ec:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10053ef:	c1 e0 05             	shl    eax,0x5
 10053f2:	89 c2                	mov    edx,eax
 10053f4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 10053f7:	01 d0                	add    eax,edx
 10053f9:	83 ec 04             	sub    esp,0x4
 10053fc:	6a 0b                	push   0xb
 10053fe:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1005401:	50                   	push   eax
 1005402:	e8 b0 12 00 00       	call   10066b7 <memcmp>
 1005407:	83 c4 10             	add    esp,0x10
 100540a:	85 c0                	test   eax,eax
 100540c:	75 0b                	jne    1005419 <find+0xb2>
 100540e:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 1005411:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005414:	01 d0                	add    eax,edx
 1005416:	eb 71                	jmp    1005489 <find+0x122>
 1005418:	90                   	nop
 1005419:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
 100541d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005420:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 1005423:	7c b3                	jl     10053d8 <find+0x71>
 1005425:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 100542c:	66 85 c0             	test   ax,ax
 100542f:	75 07                	jne    1005438 <find+0xd1>
 1005431:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005436:	eb 51                	jmp    1005489 <find+0x122>
 1005438:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100543d:	77 3a                	ja     1005479 <find+0x112>
 100543f:	83 45 f0 10          	add    DWORD PTR [ebp-0x10],0x10
 1005443:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005447:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 100544e:	00 
 100544f:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005453:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100545a:	0f b6 c0             	movzx  eax,al
 100545d:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005461:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005467:	01 ca                	add    edx,ecx
 1005469:	83 ec 04             	sub    esp,0x4
 100546c:	50                   	push   eax
 100546d:	52                   	push   edx
 100546e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 1005471:	e8 88 fc ff ff       	call   10050fe <read_sec>
 1005476:	83 c4 10             	add    esp,0x10
 1005479:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100547e:	0f 86 4b ff ff ff    	jbe    10053cf <find+0x68>
 1005484:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005489:	c9                   	leave  
 100548a:	c3                   	ret    

0100548b <read_file_byname>:
 100548b:	55                   	push   ebp
 100548c:	89 e5                	mov    ebp,esp
 100548e:	53                   	push   ebx
 100548f:	83 ec 54             	sub    esp,0x54
 1005492:	89 e0                	mov    eax,esp
 1005494:	89 c3                	mov    ebx,eax
 1005496:	83 ec 0c             	sub    esp,0xc
 1005499:	6a 00                	push   0x0
 100549b:	e8 c7 fe ff ff       	call   1005367 <find>
 10054a0:	83 c4 10             	add    esp,0x10
 10054a3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10054a6:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 10054aa:	74 06                	je     10054b2 <read_file_byname+0x27>
 10054ac:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 10054b0:	79 0a                	jns    10054bc <read_file_byname+0x31>
 10054b2:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10054b7:	e9 86 02 00 00       	jmp    1005742 <read_file_byname+0x2b7>
 10054bc:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 10054c3:	c7 45 f0 a0 e0 41 00 	mov    DWORD PTR [ebp-0x10],0x41e0a0
 10054ca:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 10054d1:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 10054d8:	66 85 c0             	test   ax,ax
 10054db:	74 43                	je     1005520 <read_file_byname+0x95>
 10054dd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10054e4:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 10054eb:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 10054f2:	0f b6 c0             	movzx  eax,al
 10054f5:	0f b7 15 ba 20 42 00 	movzx  edx,WORD PTR ds:0x4220ba
 10054fc:	0f b7 ca             	movzx  ecx,dx
 10054ff:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005505:	01 ca                	add    edx,ecx
 1005507:	83 ec 04             	sub    esp,0x4
 100550a:	50                   	push   eax
 100550b:	52                   	push   edx
 100550c:	68 c0 20 42 00       	push   0x4220c0
 1005511:	e8 e8 fb ff ff       	call   10050fe <read_sec>
 1005516:	83 c4 10             	add    esp,0x10
 1005519:	c7 45 f0 c0 20 42 00 	mov    DWORD PTR [ebp-0x10],0x4220c0
 1005520:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005527:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 100552b:	eb 41                	jmp    100556e <read_file_byname+0xe3>
 100552d:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 1005531:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005536:	77 36                	ja     100556e <read_file_byname+0xe3>
 1005538:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 100553c:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005543:	00 
 1005544:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005548:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100554f:	0f b6 c0             	movzx  eax,al
 1005552:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005556:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 100555c:	01 ca                	add    edx,ecx
 100555e:	83 ec 04             	sub    esp,0x4
 1005561:	50                   	push   eax
 1005562:	52                   	push   edx
 1005563:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005566:	e8 93 fb ff ff       	call   10050fe <read_sec>
 100556b:	83 c4 10             	add    esp,0x10
 100556e:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1005572:	75 0d                	jne    1005581 <read_file_byname+0xf6>
 1005574:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005578:	7e 07                	jle    1005581 <read_file_byname+0xf6>
 100557a:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100557f:	76 ac                	jbe    100552d <read_file_byname+0xa2>
 1005581:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005584:	c1 e0 05             	shl    eax,0x5
 1005587:	89 c2                	mov    edx,eax
 1005589:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100558c:	01 d0                	add    eax,edx
 100558e:	8b 10                	mov    edx,DWORD PTR [eax]
 1005590:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005593:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005596:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005599:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 100559c:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 100559f:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10055a2:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 10055a5:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 10055a8:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 10055ab:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 10055ae:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 10055b1:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 10055b4:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 10055b7:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 10055ba:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 10055bd:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 10055c1:	0f b7 c0             	movzx  eax,ax
 10055c4:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10055c7:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 10055ce:	0f b7 d0             	movzx  edx,ax
 10055d1:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 10055d8:	0f b6 c0             	movzx  eax,al
 10055db:	0f af c2             	imul   eax,edx
 10055de:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10055e1:	eb 1d                	jmp    1005600 <read_file_byname+0x175>
 10055e3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10055e6:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 10055e9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10055ec:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10055f3:	00 
 10055f4:	98                   	cwde   
 10055f5:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10055f8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10055fb:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10055fe:	7c 0a                	jl     100560a <read_file_byname+0x17f>
 1005600:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005603:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005606:	7d db                	jge    10055e3 <read_file_byname+0x158>
 1005608:	eb 01                	jmp    100560b <read_file_byname+0x180>
 100560a:	90                   	nop
 100560b:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 1005612:	7e 12                	jle    1005626 <read_file_byname+0x19b>
 1005614:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 1005617:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 100561a:	7c 0a                	jl     1005626 <read_file_byname+0x19b>
 100561c:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005621:	e9 1c 01 00 00       	jmp    1005742 <read_file_byname+0x2b7>
 1005626:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005629:	8d 50 ff             	lea    edx,[eax-0x1]
 100562c:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 100562f:	89 c2                	mov    edx,eax
 1005631:	b8 10 00 00 00       	mov    eax,0x10
 1005636:	83 e8 01             	sub    eax,0x1
 1005639:	01 d0                	add    eax,edx
 100563b:	b9 10 00 00 00       	mov    ecx,0x10
 1005640:	ba 00 00 00 00       	mov    edx,0x0
 1005645:	f7 f1                	div    ecx
 1005647:	6b c0 10             	imul   eax,eax,0x10
 100564a:	89 c1                	mov    ecx,eax
 100564c:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1005652:	89 e2                	mov    edx,esp
 1005654:	29 ca                	sub    edx,ecx
 1005656:	39 d4                	cmp    esp,edx
 1005658:	74 10                	je     100566a <read_file_byname+0x1df>
 100565a:	81 ec 00 10 00 00    	sub    esp,0x1000
 1005660:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1005667:	00 
 1005668:	eb ec                	jmp    1005656 <read_file_byname+0x1cb>
 100566a:	89 c2                	mov    edx,eax
 100566c:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005672:	29 d4                	sub    esp,edx
 1005674:	89 c2                	mov    edx,eax
 1005676:	81 e2 ff 0f 00 00    	and    edx,0xfff
 100567c:	85 d2                	test   edx,edx
 100567e:	74 0d                	je     100568d <read_file_byname+0x202>
 1005680:	25 ff 0f 00 00       	and    eax,0xfff
 1005685:	83 e8 04             	sub    eax,0x4
 1005688:	01 e0                	add    eax,esp
 100568a:	83 08 00             	or     DWORD PTR [eax],0x0
 100568d:	89 e0                	mov    eax,esp
 100568f:	83 c0 00             	add    eax,0x0
 1005692:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005695:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100569c:	0f b6 c0             	movzx  eax,al
 100569f:	8b 0d 30 6e 00 01    	mov    ecx,DWORD PTR ds:0x1006e30
 10056a5:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 10056a8:	01 ca                	add    edx,ecx
 10056aa:	83 ec 04             	sub    esp,0x4
 10056ad:	50                   	push   eax
 10056ae:	52                   	push   edx
 10056af:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 10056b2:	e8 47 fa ff ff       	call   10050fe <read_sec>
 10056b7:	83 c4 10             	add    esp,0x10
 10056ba:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10056bd:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10056c0:	89 c2                	mov    edx,eax
 10056c2:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 10056c5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 10056c8:	01 c8                	add    eax,ecx
 10056ca:	83 ec 04             	sub    esp,0x4
 10056cd:	52                   	push   edx
 10056ce:	50                   	push   eax
 10056cf:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10056d2:	e8 a8 0f 00 00       	call   100667f <memcpy>
 10056d7:	83 c4 10             	add    esp,0x10
 10056da:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10056dd:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10056e0:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10056e3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10056e6:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 10056e9:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10056ec:	eb 40                	jmp    100572e <read_file_byname+0x2a3>
 10056ee:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10056f1:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10056f8:	00 
 10056f9:	98                   	cwde   
 10056fa:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10056fd:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1005704:	0f b6 c0             	movzx  eax,al
 1005707:	8b 0d 30 6e 00 01    	mov    ecx,DWORD PTR ds:0x1006e30
 100570d:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 1005710:	01 ca                	add    edx,ecx
 1005712:	83 ec 04             	sub    esp,0x4
 1005715:	50                   	push   eax
 1005716:	52                   	push   edx
 1005717:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 100571a:	e8 df f9 ff ff       	call   10050fe <read_sec>
 100571f:	83 c4 10             	add    esp,0x10
 1005722:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005725:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 1005728:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 100572b:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 100572e:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 1005735:	7f 06                	jg     100573d <read_file_byname+0x2b2>
 1005737:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 100573b:	7f b1                	jg     10056ee <read_file_byname+0x263>
 100573d:	b8 00 00 00 00       	mov    eax,0x0
 1005742:	89 dc                	mov    esp,ebx
 1005744:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005747:	c9                   	leave  
 1005748:	c3                   	ret    

01005749 <write_file_byname>:
 1005749:	55                   	push   ebp
 100574a:	89 e5                	mov    ebp,esp
 100574c:	53                   	push   ebx
 100574d:	83 ec 54             	sub    esp,0x54
 1005750:	89 e0                	mov    eax,esp
 1005752:	89 c3                	mov    ebx,eax
 1005754:	83 ec 0c             	sub    esp,0xc
 1005757:	6a 00                	push   0x0
 1005759:	e8 09 fc ff ff       	call   1005367 <find>
 100575e:	83 c4 10             	add    esp,0x10
 1005761:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005764:	83 7d f4 ff          	cmp    DWORD PTR [ebp-0xc],0xffffffff
 1005768:	74 06                	je     1005770 <write_file_byname+0x27>
 100576a:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 100576e:	79 0a                	jns    100577a <write_file_byname+0x31>
 1005770:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005775:	e9 b2 02 00 00       	jmp    1005a2c <write_file_byname+0x2e3>
 100577a:	c7 45 e0 00 02 00 00 	mov    DWORD PTR [ebp-0x20],0x200
 1005781:	c7 45 f0 a0 e0 41 00 	mov    DWORD PTR [ebp-0x10],0x41e0a0
 1005788:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 100578f:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005796:	66 85 c0             	test   ax,ax
 1005799:	74 43                	je     10057de <write_file_byname+0x95>
 100579b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 10057a2:	c7 45 e0 10 00 00 00 	mov    DWORD PTR [ebp-0x20],0x10
 10057a9:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 10057b0:	0f b6 c0             	movzx  eax,al
 10057b3:	0f b7 15 ba 20 42 00 	movzx  edx,WORD PTR ds:0x4220ba
 10057ba:	0f b7 ca             	movzx  ecx,dx
 10057bd:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 10057c3:	01 ca                	add    edx,ecx
 10057c5:	83 ec 04             	sub    esp,0x4
 10057c8:	50                   	push   eax
 10057c9:	52                   	push   edx
 10057ca:	68 c0 20 42 00       	push   0x4220c0
 10057cf:	e8 2a f9 ff ff       	call   10050fe <read_sec>
 10057d4:	83 c4 10             	add    esp,0x10
 10057d7:	c7 45 f0 c0 20 42 00 	mov    DWORD PTR [ebp-0x10],0x4220c0
 10057de:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 10057e5:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 10057e9:	eb 41                	jmp    100582c <write_file_byname+0xe3>
 10057eb:	83 6d f4 10          	sub    DWORD PTR [ebp-0xc],0x10
 10057ef:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 10057f4:	77 36                	ja     100582c <write_file_byname+0xe3>
 10057f6:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 10057fa:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005801:	00 
 1005802:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005806:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 100580d:	0f b6 c0             	movzx  eax,al
 1005810:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005814:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 100581a:	01 ca                	add    edx,ecx
 100581c:	83 ec 04             	sub    esp,0x4
 100581f:	50                   	push   eax
 1005820:	52                   	push   edx
 1005821:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005824:	e8 d5 f8 ff ff       	call   10050fe <read_sec>
 1005829:	83 c4 10             	add    esp,0x10
 100582c:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 1005830:	75 0d                	jne    100583f <write_file_byname+0xf6>
 1005832:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
 1005836:	7e 07                	jle    100583f <write_file_byname+0xf6>
 1005838:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 100583d:	76 ac                	jbe    10057eb <write_file_byname+0xa2>
 100583f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005842:	c1 e0 05             	shl    eax,0x5
 1005845:	89 c2                	mov    edx,eax
 1005847:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100584a:	01 d0                	add    eax,edx
 100584c:	8b 10                	mov    edx,DWORD PTR [eax]
 100584e:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005851:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005854:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005857:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 100585a:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 100585d:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005860:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005863:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005866:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005869:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 100586c:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
 100586f:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005872:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005875:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005878:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100587b:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 100587f:	0f b7 c0             	movzx  eax,ax
 1005882:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005885:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 100588c:	0f b7 d0             	movzx  edx,ax
 100588f:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1005896:	0f b6 c0             	movzx  eax,al
 1005899:	0f af c2             	imul   eax,edx
 100589c:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 100589f:	eb 1d                	jmp    10058be <write_file_byname+0x175>
 10058a1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10058a4:	29 45 10             	sub    DWORD PTR [ebp+0x10],eax
 10058a7:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058aa:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058ad:	7c 19                	jl     10058c8 <write_file_byname+0x17f>
 10058af:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10058b2:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10058b9:	00 
 10058ba:	98                   	cwde   
 10058bb:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10058be:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058c1:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058c4:	7d db                	jge    10058a1 <write_file_byname+0x158>
 10058c6:	eb 01                	jmp    10058c9 <write_file_byname+0x180>
 10058c8:	90                   	nop
 10058c9:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10058d0:	7e 12                	jle    10058e4 <write_file_byname+0x19b>
 10058d2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10058d5:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10058d8:	7c 0a                	jl     10058e4 <write_file_byname+0x19b>
 10058da:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10058df:	e9 48 01 00 00       	jmp    1005a2c <write_file_byname+0x2e3>
 10058e4:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10058e7:	8d 50 ff             	lea    edx,[eax-0x1]
 10058ea:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 10058ed:	89 c2                	mov    edx,eax
 10058ef:	b8 10 00 00 00       	mov    eax,0x10
 10058f4:	83 e8 01             	sub    eax,0x1
 10058f7:	01 d0                	add    eax,edx
 10058f9:	b9 10 00 00 00       	mov    ecx,0x10
 10058fe:	ba 00 00 00 00       	mov    edx,0x0
 1005903:	f7 f1                	div    ecx
 1005905:	6b c0 10             	imul   eax,eax,0x10
 1005908:	89 c1                	mov    ecx,eax
 100590a:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1005910:	89 e2                	mov    edx,esp
 1005912:	29 ca                	sub    edx,ecx
 1005914:	39 d4                	cmp    esp,edx
 1005916:	74 10                	je     1005928 <write_file_byname+0x1df>
 1005918:	81 ec 00 10 00 00    	sub    esp,0x1000
 100591e:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 1005925:	00 
 1005926:	eb ec                	jmp    1005914 <write_file_byname+0x1cb>
 1005928:	89 c2                	mov    edx,eax
 100592a:	81 e2 ff 0f 00 00    	and    edx,0xfff
 1005930:	29 d4                	sub    esp,edx
 1005932:	89 c2                	mov    edx,eax
 1005934:	81 e2 ff 0f 00 00    	and    edx,0xfff
 100593a:	85 d2                	test   edx,edx
 100593c:	74 0d                	je     100594b <write_file_byname+0x202>
 100593e:	25 ff 0f 00 00       	and    eax,0xfff
 1005943:	83 e8 04             	sub    eax,0x4
 1005946:	01 e0                	add    eax,esp
 1005948:	83 08 00             	or     DWORD PTR [eax],0x0
 100594b:	89 e0                	mov    eax,esp
 100594d:	83 c0 00             	add    eax,0x0
 1005950:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005953:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 1005957:	0f 8e 81 00 00 00    	jle    10059de <write_file_byname+0x295>
 100595d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005960:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005963:	89 c2                	mov    edx,eax
 1005965:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
 1005968:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 100596b:	01 c8                	add    eax,ecx
 100596d:	83 ec 04             	sub    esp,0x4
 1005970:	52                   	push   edx
 1005971:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005974:	50                   	push   eax
 1005975:	e8 05 0d 00 00       	call   100667f <memcpy>
 100597a:	83 c4 10             	add    esp,0x10
 100597d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005980:	2b 45 10             	sub    eax,DWORD PTR [ebp+0x10]
 1005983:	83 ec 04             	sub    esp,0x4
 1005986:	50                   	push   eax
 1005987:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 100598a:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 100598d:	e8 10 f1 ff ff       	call   1004aa2 <write_sec>
 1005992:	83 c4 10             	add    esp,0x10
 1005995:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005998:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 100599f:	00 
 10059a0:	98                   	cwde   
 10059a1:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10059a4:	eb 38                	jmp    10059de <write_file_byname+0x295>
 10059a6:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 10059ac:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10059af:	01 d0                	add    eax,edx
 10059b1:	83 ec 04             	sub    esp,0x4
 10059b4:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 10059b7:	50                   	push   eax
 10059b8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10059bb:	e8 e2 f0 ff ff       	call   1004aa2 <write_sec>
 10059c0:	83 c4 10             	add    esp,0x10
 10059c3:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059c6:	01 45 0c             	add    DWORD PTR [ebp+0xc],eax
 10059c9:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10059cc:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
 10059cf:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10059d2:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 10059d9:	00 
 10059da:	98                   	cwde   
 10059db:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10059de:	81 7d e4 f6 ff 00 00 	cmp    DWORD PTR [ebp-0x1c],0xfff6
 10059e5:	7f 08                	jg     10059ef <write_file_byname+0x2a6>
 10059e7:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10059ea:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 10059ed:	7d b7                	jge    10059a6 <write_file_byname+0x25d>
 10059ef:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
 10059f3:	7e 32                	jle    1005a27 <write_file_byname+0x2de>
 10059f5:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 10059f8:	83 ec 04             	sub    esp,0x4
 10059fb:	50                   	push   eax
 10059fc:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 10059ff:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005a02:	e8 78 0c 00 00       	call   100667f <memcpy>
 1005a07:	83 c4 10             	add    esp,0x10
 1005a0a:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005a10:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005a13:	01 d0                	add    eax,edx
 1005a15:	83 ec 04             	sub    esp,0x4
 1005a18:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 1005a1b:	50                   	push   eax
 1005a1c:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 1005a1f:	e8 7e f0 ff ff       	call   1004aa2 <write_sec>
 1005a24:	83 c4 10             	add    esp,0x10
 1005a27:	b8 00 00 00 00       	mov    eax,0x0
 1005a2c:	89 dc                	mov    esp,ebx
 1005a2e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1005a31:	c9                   	leave  
 1005a32:	c3                   	ret    

01005a33 <file_exist>:
 1005a33:	55                   	push   ebp
 1005a34:	89 e5                	mov    ebp,esp
 1005a36:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 1005a3a:	3c e5                	cmp    al,0xe5
 1005a3c:	74 08                	je     1005a46 <file_exist+0x13>
 1005a3e:	0f b6 45 08          	movzx  eax,BYTE PTR [ebp+0x8]
 1005a42:	84 c0                	test   al,al
 1005a44:	75 07                	jne    1005a4d <file_exist+0x1a>
 1005a46:	b8 00 00 00 00       	mov    eax,0x0
 1005a4b:	eb 05                	jmp    1005a52 <file_exist+0x1f>
 1005a4d:	b8 01 00 00 00       	mov    eax,0x1
 1005a52:	5d                   	pop    ebp
 1005a53:	c3                   	ret    

01005a54 <get_entry>:
 1005a54:	55                   	push   ebp
 1005a55:	89 e5                	mov    ebp,esp
 1005a57:	57                   	push   edi
 1005a58:	56                   	push   esi
 1005a59:	81 ec a0 00 00 00    	sub    esp,0xa0
 1005a5f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005a62:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
 1005a65:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005a68:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005a6b:	8b 40 74             	mov    eax,DWORD PTR [eax+0x74]
 1005a6e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005a71:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
 1005a75:	c6 45 ac e5          	mov    BYTE PTR [ebp-0x54],0xe5
 1005a79:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005a7c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005a7f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
 1005a86:	e9 50 01 00 00       	jmp    1005bdb <get_entry+0x187>
 1005a8b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005a8e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005a91:	3c 2f                	cmp    al,0x2f
 1005a93:	0f 85 3e 01 00 00    	jne    1005bd7 <get_entry+0x183>
 1005a99:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005a9c:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1005a9f:	83 f8 0b             	cmp    eax,0xb
 1005aa2:	7e 0a                	jle    1005aae <get_entry+0x5a>
 1005aa4:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005aa9:	e9 20 02 00 00       	jmp    1005cce <get_entry+0x27a>
 1005aae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005ab1:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 1005ab4:	83 ec 04             	sub    esp,0x4
 1005ab7:	50                   	push   eax
 1005ab8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005abb:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 1005ac1:	50                   	push   eax
 1005ac2:	e8 b8 0b 00 00       	call   100667f <memcpy>
 1005ac7:	83 c4 10             	add    esp,0x10
 1005aca:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 1005acd:	a3 a0 20 42 00       	mov    ds:0x4220a0,eax
 1005ad2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1005ad5:	a3 a4 20 42 00       	mov    ds:0x4220a4,eax
 1005ada:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005add:	a3 a8 20 42 00       	mov    ds:0x4220a8,eax
 1005ae2:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005ae5:	a3 ac 20 42 00       	mov    ds:0x4220ac,eax
 1005aea:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1005aed:	a3 b0 20 42 00       	mov    ds:0x4220b0,eax
 1005af2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005af5:	a3 b4 20 42 00       	mov    ds:0x4220b4,eax
 1005afa:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005afd:	a3 b8 20 42 00       	mov    ds:0x4220b8,eax
 1005b02:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1005b05:	a3 bc 20 42 00       	mov    ds:0x4220bc,eax
 1005b0a:	83 ec 0c             	sub    esp,0xc
 1005b0d:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 1005b13:	50                   	push   eax
 1005b14:	e8 67 ee ff ff       	call   1004980 <format_name>
 1005b19:	83 c4 10             	add    esp,0x10
 1005b1c:	83 ec 0c             	sub    esp,0xc
 1005b1f:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
 1005b25:	50                   	push   eax
 1005b26:	e8 3c f8 ff ff       	call   1005367 <find>
 1005b2b:	83 c4 10             	add    esp,0x10
 1005b2e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005b31:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005b35:	75 0a                	jne    1005b41 <get_entry+0xed>
 1005b37:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005b3c:	e9 8d 01 00 00       	jmp    1005cce <get_entry+0x27a>
 1005b41:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005b48:	66 85 c0             	test   ax,ax
 1005b4b:	75 3c                	jne    1005b89 <get_entry+0x135>
 1005b4d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005b50:	c1 e0 05             	shl    eax,0x5
 1005b53:	05 a0 e0 41 00       	add    eax,0x41e0a0
 1005b58:	8b 10                	mov    edx,DWORD PTR [eax]
 1005b5a:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005b5d:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005b60:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005b63:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005b66:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005b69:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005b6c:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005b6f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005b72:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005b75:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005b78:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005b7b:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005b7e:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005b81:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005b84:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005b87:	eb 45                	jmp    1005bce <get_entry+0x17a>
 1005b89:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005b8c:	99                   	cdq    
 1005b8d:	c1 ea 1c             	shr    edx,0x1c
 1005b90:	01 d0                	add    eax,edx
 1005b92:	83 e0 0f             	and    eax,0xf
 1005b95:	29 d0                	sub    eax,edx
 1005b97:	c1 e0 05             	shl    eax,0x5
 1005b9a:	05 c0 20 42 00       	add    eax,0x4220c0
 1005b9f:	8b 10                	mov    edx,DWORD PTR [eax]
 1005ba1:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
 1005ba4:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005ba7:	89 55 d0             	mov    DWORD PTR [ebp-0x30],edx
 1005baa:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005bad:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
 1005bb0:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005bb3:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
 1005bb6:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005bb9:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1005bbc:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005bbf:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
 1005bc2:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005bc5:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 1005bc8:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005bcb:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1005bce:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005bd1:	83 c0 01             	add    eax,0x1
 1005bd4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005bd7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1005bdb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005bde:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1005be1:	84 c0                	test   al,al
 1005be3:	0f 85 a2 fe ff ff    	jne    1005a8b <get_entry+0x37>
 1005be9:	83 ec 0c             	sub    esp,0xc
 1005bec:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005bef:	e8 8c ed ff ff       	call   1004980 <format_name>
 1005bf4:	83 c4 10             	add    esp,0x10
 1005bf7:	83 ec 0c             	sub    esp,0xc
 1005bfa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005bfd:	e8 65 f7 ff ff       	call   1005367 <find>
 1005c02:	83 c4 10             	add    esp,0x10
 1005c05:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1005c08:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 1005c0c:	75 0a                	jne    1005c18 <get_entry+0x1c4>
 1005c0e:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005c13:	e9 b6 00 00 00       	jmp    1005cce <get_entry+0x27a>
 1005c18:	0f b7 05 ba 20 42 00 	movzx  eax,WORD PTR ds:0x4220ba
 1005c1f:	66 85 c0             	test   ax,ax
 1005c22:	75 3c                	jne    1005c60 <get_entry+0x20c>
 1005c24:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005c27:	c1 e0 05             	shl    eax,0x5
 1005c2a:	05 a0 e0 41 00       	add    eax,0x41e0a0
 1005c2f:	8b 10                	mov    edx,DWORD PTR [eax]
 1005c31:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005c34:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005c37:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005c3a:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005c3d:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005c40:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005c43:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005c46:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005c49:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005c4c:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005c4f:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005c52:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005c55:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005c58:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005c5b:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005c5e:	eb 45                	jmp    1005ca5 <get_entry+0x251>
 1005c60:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005c63:	99                   	cdq    
 1005c64:	c1 ea 1c             	shr    edx,0x1c
 1005c67:	01 d0                	add    eax,edx
 1005c69:	83 e0 0f             	and    eax,0xf
 1005c6c:	29 d0                	sub    eax,edx
 1005c6e:	c1 e0 05             	shl    eax,0x5
 1005c71:	05 c0 20 42 00       	add    eax,0x4220c0
 1005c76:	8b 10                	mov    edx,DWORD PTR [eax]
 1005c78:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
 1005c7b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1005c7e:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
 1005c81:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 1005c84:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 1005c87:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1005c8a:	89 55 b8             	mov    DWORD PTR [ebp-0x48],edx
 1005c8d:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
 1005c90:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
 1005c93:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
 1005c96:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
 1005c99:	8b 50 18             	mov    edx,DWORD PTR [eax+0x18]
 1005c9c:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
 1005c9f:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1005ca2:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 1005ca5:	0f b7 45 c6          	movzx  eax,WORD PTR [ebp-0x3a]
 1005ca9:	0f b7 c0             	movzx  eax,ax
 1005cac:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
 1005cb2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005cb5:	8d 50 24             	lea    edx,[eax+0x24]
 1005cb8:	8d 85 64 ff ff ff    	lea    eax,[ebp-0x9c]
 1005cbe:	b9 12 00 00 00       	mov    ecx,0x12
 1005cc3:	89 d7                	mov    edi,edx
 1005cc5:	89 c6                	mov    esi,eax
 1005cc7:	f3 a5                	rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
 1005cc9:	b8 00 00 00 00       	mov    eax,0x0
 1005cce:	8d 65 f8             	lea    esp,[ebp-0x8]
 1005cd1:	5e                   	pop    esi
 1005cd2:	5f                   	pop    edi
 1005cd3:	5d                   	pop    ebp
 1005cd4:	c3                   	ret    

01005cd5 <get_fname>:
 1005cd5:	55                   	push   ebp
 1005cd6:	89 e5                	mov    ebp,esp
 1005cd8:	83 ec 18             	sub    esp,0x18
 1005cdb:	83 ec 08             	sub    esp,0x8
 1005cde:	6a 2f                	push   0x2f
 1005ce0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1005ce3:	e8 8e 0a 00 00       	call   1006776 <strtok>
 1005ce8:	83 c4 10             	add    esp,0x10
 1005ceb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005cee:	eb 18                	jmp    1005d08 <get_fname+0x33>
 1005cf0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1005cf3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005cf6:	83 ec 08             	sub    esp,0x8
 1005cf9:	6a 2f                	push   0x2f
 1005cfb:	6a 00                	push   0x0
 1005cfd:	e8 74 0a 00 00       	call   1006776 <strtok>
 1005d02:	83 c4 10             	add    esp,0x10
 1005d05:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005d08:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1005d0c:	75 e2                	jne    1005cf0 <get_fname+0x1b>
 1005d0e:	83 ec 08             	sub    esp,0x8
 1005d11:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 1005d14:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 1005d17:	e8 2b 0a 00 00       	call   1006747 <strcpy>
 1005d1c:	83 c4 10             	add    esp,0x10
 1005d1f:	90                   	nop
 1005d20:	c9                   	leave  
 1005d21:	c3                   	ret    

01005d22 <read_file>:
 1005d22:	55                   	push   ebp
 1005d23:	89 e5                	mov    ebp,esp
 1005d25:	83 ec 58             	sub    esp,0x58
 1005d28:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d2b:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1005d2e:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1005d31:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d34:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005d37:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005d3a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d3d:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005d40:	66 89 45 ce          	mov    WORD PTR [ebp-0x32],ax
 1005d44:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005d47:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1005d4a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005d4d:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005d54:	0f b7 c8             	movzx  ecx,ax
 1005d57:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005d5a:	99                   	cdq    
 1005d5b:	f7 f9                	idiv   ecx
 1005d5d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1005d60:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005d67:	0f b7 c8             	movzx  ecx,ax
 1005d6a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1005d6d:	99                   	cdq    
 1005d6e:	f7 f9                	idiv   ecx
 1005d70:	89 d0                	mov    eax,edx
 1005d72:	85 c0                	test   eax,eax
 1005d74:	0f 95 c0             	setne  al
 1005d77:	0f b6 c0             	movzx  eax,al
 1005d7a:	01 45 dc             	add    DWORD PTR [ebp-0x24],eax
 1005d7d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005d84:	0f b7 45 ce          	movzx  eax,WORD PTR [ebp-0x32]
 1005d88:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005d8c:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005d93:	0f b7 c8             	movzx  ecx,ax
 1005d96:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005d99:	99                   	cdq    
 1005d9a:	f7 f9                	idiv   ecx
 1005d9c:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005d9f:	eb 14                	jmp    1005db5 <read_file+0x93>
 1005da1:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005da5:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005dac:	00 
 1005dad:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005db1:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
 1005db5:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005dba:	77 06                	ja     1005dc2 <read_file+0xa0>
 1005dbc:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1005dc0:	7f df                	jg     1005da1 <read_file+0x7f>
 1005dc2:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 1005dc6:	7e 0a                	jle    1005dd2 <read_file+0xb0>
 1005dc8:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005dcd:	e9 ca 00 00 00       	jmp    1005e9c <read_file+0x17a>
 1005dd2:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005dd9:	0f b7 c8             	movzx  ecx,ax
 1005ddc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005ddf:	99                   	cdq    
 1005de0:	f7 f9                	idiv   ecx
 1005de2:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1005de5:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1005dec:	0f b6 d0             	movzx  edx,al
 1005def:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005df6:	0f b7 c0             	movzx  eax,ax
 1005df9:	0f af c2             	imul   eax,edx
 1005dfc:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 1005dff:	e9 86 00 00 00       	jmp    1005e8a <read_file+0x168>
 1005e04:	0f b6 05 6d e0 41 00 	movzx  eax,BYTE PTR ds:0x41e06d
 1005e0b:	0f b6 c0             	movzx  eax,al
 1005e0e:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
 1005e12:	8b 15 30 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e30
 1005e18:	01 ca                	add    edx,ecx
 1005e1a:	83 ec 04             	sub    esp,0x4
 1005e1d:	50                   	push   eax
 1005e1e:	52                   	push   edx
 1005e1f:	68 e0 62 42 00       	push   0x4262e0
 1005e24:	e8 d5 f2 ff ff       	call   10050fe <read_sec>
 1005e29:	83 c4 10             	add    esp,0x10
 1005e2c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005e2f:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 1005e32:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 1005e35:	39 c2                	cmp    edx,eax
 1005e37:	0f 4e c2             	cmovle eax,edx
 1005e3a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 1005e3d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 1005e40:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 1005e43:	81 c2 e0 62 42 00    	add    edx,0x4262e0
 1005e49:	83 ec 04             	sub    esp,0x4
 1005e4c:	50                   	push   eax
 1005e4d:	52                   	push   edx
 1005e4e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005e51:	e8 29 08 00 00       	call   100667f <memcpy>
 1005e56:	83 c4 10             	add    esp,0x10
 1005e59:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1005e5d:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 1005e60:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 1005e63:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 1005e66:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005e6a:	7e 07                	jle    1005e73 <read_file+0x151>
 1005e6c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1005e73:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005e77:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005e7e:	00 
 1005e7f:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005e83:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005e88:	77 0e                	ja     1005e98 <read_file+0x176>
 1005e8a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e8d:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
 1005e90:	0f 8c 6e ff ff ff    	jl     1005e04 <read_file+0xe2>
 1005e96:	eb 01                	jmp    1005e99 <read_file+0x177>
 1005e98:	90                   	nop
 1005e99:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005e9c:	c9                   	leave  
 1005e9d:	c3                   	ret    

01005e9e <write_file>:
 1005e9e:	55                   	push   ebp
 1005e9f:	89 e5                	mov    ebp,esp
 1005ea1:	83 ec 48             	sub    esp,0x48
 1005ea4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005ea7:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 1005eaa:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1005ead:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005eb0:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1005eb3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005eb6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005eb9:	8b 40 38             	mov    eax,DWORD PTR [eax+0x38]
 1005ebc:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
 1005ec0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1005ec3:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1005ec6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1005ec9:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005ed0:	0f b7 c8             	movzx  ecx,ax
 1005ed3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1005ed6:	99                   	cdq    
 1005ed7:	f7 f9                	idiv   ecx
 1005ed9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1005edc:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005edf:	8d 90 ff 01 00 00    	lea    edx,[eax+0x1ff]
 1005ee5:	85 c0                	test   eax,eax
 1005ee7:	0f 48 c2             	cmovs  eax,edx
 1005eea:	c1 f8 09             	sar    eax,0x9
 1005eed:	89 c1                	mov    ecx,eax
 1005eef:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1005ef2:	99                   	cdq    
 1005ef3:	c1 ea 17             	shr    edx,0x17
 1005ef6:	01 d0                	add    eax,edx
 1005ef8:	25 ff 01 00 00       	and    eax,0x1ff
 1005efd:	29 d0                	sub    eax,edx
 1005eff:	01 c8                	add    eax,ecx
 1005f01:	85 c0                	test   eax,eax
 1005f03:	0f 95 c0             	setne  al
 1005f06:	0f b6 c0             	movzx  eax,al
 1005f09:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 1005f0c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 1005f13:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 1005f17:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005f1b:	eb 14                	jmp    1005f31 <write_file+0x93>
 1005f1d:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1005f21:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005f25:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005f2c:	00 
 1005f2d:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005f31:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005f36:	77 06                	ja     1005f3e <write_file+0xa0>
 1005f38:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005f3c:	7f df                	jg     1005f1d <write_file+0x7f>
 1005f3e:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1005f42:	7e 4b                	jle    1005f8f <write_file+0xf1>
 1005f44:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1005f49:	eb 52                	jmp    1005f9d <write_file+0xff>
 1005f4b:	0f b7 55 ea          	movzx  edx,WORD PTR [ebp-0x16]
 1005f4f:	a1 30 6e 00 01       	mov    eax,ds:0x1006e30
 1005f54:	01 d0                	add    eax,edx
 1005f56:	83 ec 04             	sub    esp,0x4
 1005f59:	6a 01                	push   0x1
 1005f5b:	50                   	push   eax
 1005f5c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 1005f5f:	e8 3e eb ff ff       	call   1004aa2 <write_sec>
 1005f64:	83 c4 10             	add    esp,0x10
 1005f67:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1005f6b:	0f b7 05 6b e0 41 00 	movzx  eax,WORD PTR ds:0x41e06b
 1005f72:	0f b7 c0             	movzx  eax,ax
 1005f75:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
 1005f78:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
 1005f7c:	0f b7 84 00 c0 22 42 	movzx  eax,WORD PTR [eax+eax*1+0x4222c0]
 1005f83:	00 
 1005f84:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
 1005f88:	66 83 7d ea f6       	cmp    WORD PTR [ebp-0x16],0xfff6
 1005f8d:	77 0a                	ja     1005f99 <write_file+0xfb>
 1005f8f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005f92:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 1005f95:	7c b4                	jl     1005f4b <write_file+0xad>
 1005f97:	eb 01                	jmp    1005f9a <write_file+0xfc>
 1005f99:	90                   	nop
 1005f9a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 1005f9d:	c9                   	leave  
 1005f9e:	c3                   	ret    

01005f9f <scrdown>:
 1005f9f:	55                   	push   ebp
 1005fa0:	89 e5                	mov    ebp,esp
 1005fa2:	83 ec 08             	sub    esp,0x8
 1005fa5:	a1 e8 66 42 00       	mov    eax,ds:0x4266e8
 1005faa:	05 a0 00 00 00       	add    eax,0xa0
 1005faf:	a3 e8 66 42 00       	mov    ds:0x4266e8,eax
 1005fb4:	a1 ec 66 42 00       	mov    eax,ds:0x4266ec
 1005fb9:	05 a0 00 00 00       	add    eax,0xa0
 1005fbe:	a3 ec 66 42 00       	mov    ds:0x4266ec,eax
 1005fc3:	8b 15 e8 66 42 00    	mov    edx,DWORD PTR ds:0x4266e8
 1005fc9:	a1 e4 66 42 00       	mov    eax,ds:0x4266e4
 1005fce:	39 c2                	cmp    edx,eax
 1005fd0:	72 0a                	jb     1005fdc <scrdown+0x3d>
 1005fd2:	a1 e0 66 42 00       	mov    eax,ds:0x4266e0
 1005fd7:	a3 e8 66 42 00       	mov    ds:0x4266e8,eax
 1005fdc:	e8 52 00 00 00       	call   1006033 <set_origin>
 1005fe1:	90                   	nop
 1005fe2:	c9                   	leave  
 1005fe3:	c3                   	ret    

01005fe4 <scrup>:
 1005fe4:	55                   	push   ebp
 1005fe5:	89 e5                	mov    ebp,esp
 1005fe7:	83 ec 08             	sub    esp,0x8
 1005fea:	a1 ec 66 42 00       	mov    eax,ds:0x4266ec
 1005fef:	85 c0                	test   eax,eax
 1005ff1:	75 1b                	jne    100600e <scrup+0x2a>
 1005ff3:	c7 05 ec 66 42 00 00 	mov    DWORD PTR ds:0x4266ec,0x0
 1005ffa:	00 00 00 
 1005ffd:	a1 e0 66 42 00       	mov    eax,ds:0x4266e0
 1006002:	a3 e8 66 42 00       	mov    ds:0x4266e8,eax
 1006007:	e8 27 00 00 00       	call   1006033 <set_origin>
 100600c:	eb 23                	jmp    1006031 <scrup+0x4d>
 100600e:	a1 e8 66 42 00       	mov    eax,ds:0x4266e8
 1006013:	2d a0 00 00 00       	sub    eax,0xa0
 1006018:	a3 e8 66 42 00       	mov    ds:0x4266e8,eax
 100601d:	a1 ec 66 42 00       	mov    eax,ds:0x4266ec
 1006022:	2d a0 00 00 00       	sub    eax,0xa0
 1006027:	a3 ec 66 42 00       	mov    ds:0x4266ec,eax
 100602c:	e8 02 00 00 00       	call   1006033 <set_origin>
 1006031:	c9                   	leave  
 1006032:	c3                   	ret    

01006033 <set_origin>:
 1006033:	55                   	push   ebp
 1006034:	89 e5                	mov    ebp,esp
 1006036:	83 ec 08             	sub    esp,0x8
 1006039:	fa                   	cli    
 100603a:	a1 fc 66 42 00       	mov    eax,ds:0x4266fc
 100603f:	0f b7 c0             	movzx  eax,ax
 1006042:	83 ec 08             	sub    esp,0x8
 1006045:	6a 0c                	push   0xc
 1006047:	50                   	push   eax
 1006048:	e8 a3 cf ff ff       	call   1002ff0 <outb>
 100604d:	83 c4 10             	add    esp,0x10
 1006050:	a1 ec 66 42 00       	mov    eax,ds:0x4266ec
 1006055:	c1 e8 09             	shr    eax,0x9
 1006058:	0f b6 d0             	movzx  edx,al
 100605b:	a1 00 67 42 00       	mov    eax,ds:0x426700
 1006060:	0f b7 c0             	movzx  eax,ax
 1006063:	83 ec 08             	sub    esp,0x8
 1006066:	52                   	push   edx
 1006067:	50                   	push   eax
 1006068:	e8 83 cf ff ff       	call   1002ff0 <outb>
 100606d:	83 c4 10             	add    esp,0x10
 1006070:	a1 fc 66 42 00       	mov    eax,ds:0x4266fc
 1006075:	0f b7 c0             	movzx  eax,ax
 1006078:	83 ec 08             	sub    esp,0x8
 100607b:	6a 0d                	push   0xd
 100607d:	50                   	push   eax
 100607e:	e8 6d cf ff ff       	call   1002ff0 <outb>
 1006083:	83 c4 10             	add    esp,0x10
 1006086:	a1 ec 66 42 00       	mov    eax,ds:0x4266ec
 100608b:	d1 e8                	shr    eax,1
 100608d:	0f b6 d0             	movzx  edx,al
 1006090:	a1 00 67 42 00       	mov    eax,ds:0x426700
 1006095:	0f b7 c0             	movzx  eax,ax
 1006098:	83 ec 08             	sub    esp,0x8
 100609b:	52                   	push   edx
 100609c:	50                   	push   eax
 100609d:	e8 4e cf ff ff       	call   1002ff0 <outb>
 10060a2:	83 c4 10             	add    esp,0x10
 10060a5:	fb                   	sti    
 10060a6:	90                   	nop
 10060a7:	c9                   	leave  
 10060a8:	c3                   	ret    

010060a9 <init_tty>:
 10060a9:	55                   	push   ebp
 10060aa:	89 e5                	mov    ebp,esp
 10060ac:	83 ec 18             	sub    esp,0x18
 10060af:	83 ec 08             	sub    esp,0x8
 10060b2:	68 b0 76 00 01       	push   0x10076b0
 10060b7:	68 48 76 00 01       	push   0x1007648
 10060bc:	e8 86 06 00 00       	call   1006747 <strcpy>
 10060c1:	83 c4 10             	add    esp,0x10
 10060c4:	83 ec 08             	sub    esp,0x8
 10060c7:	68 b5 76 00 01       	push   0x10076b5
 10060cc:	68 88 76 00 01       	push   0x1007688
 10060d1:	e8 71 06 00 00       	call   1006747 <strcpy>
 10060d6:	83 c4 10             	add    esp,0x10
 10060d9:	83 ec 0c             	sub    esp,0xc
 10060dc:	68 e0 75 00 01       	push   0x10075e0
 10060e1:	e8 92 bb ff ff       	call   1001c78 <reg_driver>
 10060e6:	83 c4 10             	add    esp,0x10
 10060e9:	83 ec 0c             	sub    esp,0xc
 10060ec:	68 40 76 00 01       	push   0x1007640
 10060f1:	e8 cd ba ff ff       	call   1001bc3 <reg_device>
 10060f6:	83 c4 10             	add    esp,0x10
 10060f9:	83 ec 0c             	sub    esp,0xc
 10060fc:	68 80 76 00 01       	push   0x1007680
 1006101:	e8 bd ba ff ff       	call   1001bc3 <reg_device>
 1006106:	83 c4 10             	add    esp,0x10
 1006109:	c7 45 f4 00 00 02 00 	mov    DWORD PTR [ebp-0xc],0x20000
 1006110:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006113:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006116:	3c 07                	cmp    al,0x7
 1006118:	75 34                	jne    100614e <init_tty+0xa5>
 100611a:	c7 05 f0 66 42 00 00 	mov    DWORD PTR ds:0x4266f0,0x0
 1006121:	00 00 00 
 1006124:	c7 05 e0 66 42 00 00 	mov    DWORD PTR ds:0x4266e0,0xb0000
 100612b:	00 0b 00 
 100612e:	c7 05 e4 66 42 00 ff 	mov    DWORD PTR ds:0x4266e4,0xb7fff
 1006135:	7f 0b 00 
 1006138:	c7 05 fc 66 42 00 b4 	mov    DWORD PTR ds:0x4266fc,0x3b4
 100613f:	03 00 00 
 1006142:	c7 05 00 67 42 00 b5 	mov    DWORD PTR ds:0x426700,0x3b5
 1006149:	03 00 00 
 100614c:	eb 5c                	jmp    10061aa <init_tty+0x101>
 100614e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006151:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006154:	3c 03                	cmp    al,0x3
 1006156:	77 34                	ja     100618c <init_tty+0xe3>
 1006158:	c7 05 f0 66 42 00 01 	mov    DWORD PTR ds:0x4266f0,0x1
 100615f:	00 00 00 
 1006162:	c7 05 e0 66 42 00 00 	mov    DWORD PTR ds:0x4266e0,0xb8000
 1006169:	80 0b 00 
 100616c:	c7 05 e4 66 42 00 ff 	mov    DWORD PTR ds:0x4266e4,0xbffff
 1006173:	ff 0b 00 
 1006176:	c7 05 fc 66 42 00 d4 	mov    DWORD PTR ds:0x4266fc,0x3d4
 100617d:	03 00 00 
 1006180:	c7 05 00 67 42 00 d5 	mov    DWORD PTR ds:0x426700,0x3d5
 1006187:	03 00 00 
 100618a:	eb 1e                	jmp    10061aa <init_tty+0x101>
 100618c:	c7 05 f0 66 42 00 02 	mov    DWORD PTR ds:0x4266f0,0x2
 1006193:	00 00 00 
 1006196:	c7 05 e0 66 42 00 00 	mov    DWORD PTR ds:0x4266e0,0xa0000
 100619d:	00 0a 00 
 10061a0:	c7 05 e4 66 42 00 ff 	mov    DWORD PTR ds:0x4266e4,0xaffff
 10061a7:	ff 0a 00 
 10061aa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061ad:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061b0:	3c 01                	cmp    al,0x1
 10061b2:	77 0f                	ja     10061c3 <init_tty+0x11a>
 10061b4:	c7 05 f8 66 42 00 28 	mov    DWORD PTR ds:0x4266f8,0x28
 10061bb:	00 00 00 
 10061be:	e9 88 00 00 00       	jmp    100624b <init_tty+0x1a2>
 10061c3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061c6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061c9:	3c 03                	cmp    al,0x3
 10061cb:	76 0a                	jbe    10061d7 <init_tty+0x12e>
 10061cd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061d0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061d3:	3c 07                	cmp    al,0x7
 10061d5:	75 0c                	jne    10061e3 <init_tty+0x13a>
 10061d7:	c7 05 f8 66 42 00 50 	mov    DWORD PTR ds:0x4266f8,0x50
 10061de:	00 00 00 
 10061e1:	eb 68                	jmp    100624b <init_tty+0x1a2>
 10061e3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061e6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061e9:	3c 05                	cmp    al,0x5
 10061eb:	76 14                	jbe    1006201 <init_tty+0x158>
 10061ed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061f0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061f3:	3c 09                	cmp    al,0x9
 10061f5:	74 0a                	je     1006201 <init_tty+0x158>
 10061f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10061fa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10061fd:	3c 0d                	cmp    al,0xd
 10061ff:	75 0c                	jne    100620d <init_tty+0x164>
 1006201:	c7 05 f8 66 42 00 40 	mov    DWORD PTR ds:0x4266f8,0x140
 1006208:	01 00 00 
 100620b:	eb 3e                	jmp    100624b <init_tty+0x1a2>
 100620d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006210:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006213:	3c 06                	cmp    al,0x6
 1006215:	74 14                	je     100622b <init_tty+0x182>
 1006217:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100621a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100621d:	3c 0a                	cmp    al,0xa
 100621f:	74 0a                	je     100622b <init_tty+0x182>
 1006221:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006224:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006227:	3c 0d                	cmp    al,0xd
 1006229:	76 0c                	jbe    1006237 <init_tty+0x18e>
 100622b:	c7 05 f8 66 42 00 80 	mov    DWORD PTR ds:0x4266f8,0x280
 1006232:	02 00 00 
 1006235:	eb 14                	jmp    100624b <init_tty+0x1a2>
 1006237:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100623a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100623d:	3c 08                	cmp    al,0x8
 100623f:	75 0a                	jne    100624b <init_tty+0x1a2>
 1006241:	c7 05 f8 66 42 00 a0 	mov    DWORD PTR ds:0x4266f8,0xa0
 1006248:	00 00 00 
 100624b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100624e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006251:	0f b6 c0             	movzx  eax,al
 1006254:	83 f8 14             	cmp    eax,0x14
 1006257:	77 5d                	ja     10062b6 <init_tty+0x20d>
 1006259:	8b 04 85 bc 76 00 01 	mov    eax,DWORD PTR [eax*4+0x10076bc]
 1006260:	ff e0                	jmp    eax
 1006262:	c7 05 04 67 42 00 e8 	mov    DWORD PTR ds:0x426704,0x3e8
 1006269:	03 00 00 
 100626c:	eb 49                	jmp    10062b7 <init_tty+0x20e>
 100626e:	c7 05 04 67 42 00 d0 	mov    DWORD PTR ds:0x426704,0x7d0
 1006275:	07 00 00 
 1006278:	eb 3d                	jmp    10062b7 <init_tty+0x20e>
 100627a:	c7 05 04 67 42 00 00 	mov    DWORD PTR ds:0x426704,0xfa00
 1006281:	fa 00 00 
 1006284:	eb 31                	jmp    10062b7 <init_tty+0x20e>
 1006286:	c7 05 04 67 42 00 00 	mov    DWORD PTR ds:0x426704,0x1f400
 100628d:	f4 01 00 
 1006290:	eb 25                	jmp    10062b7 <init_tty+0x20e>
 1006292:	c7 05 04 67 42 00 00 	mov    DWORD PTR ds:0x426704,0x7d00
 1006299:	7d 00 00 
 100629c:	eb 19                	jmp    10062b7 <init_tty+0x20e>
 100629e:	c7 05 04 67 42 00 00 	mov    DWORD PTR ds:0x426704,0x36b00
 10062a5:	6b 03 00 
 10062a8:	eb 0d                	jmp    10062b7 <init_tty+0x20e>
 10062aa:	c7 05 04 67 42 00 00 	mov    DWORD PTR ds:0x426704,0x4b000
 10062b1:	b0 04 00 
 10062b4:	eb 01                	jmp    10062b7 <init_tty+0x20e>
 10062b6:	90                   	nop
 10062b7:	a1 e0 66 42 00       	mov    eax,ds:0x4266e0
 10062bc:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 10062c1:	c7 05 ec 66 42 00 00 	mov    DWORD PTR ds:0x4266ec,0x0
 10062c8:	00 00 00 
 10062cb:	a1 e0 66 42 00       	mov    eax,ds:0x4266e0
 10062d0:	a3 e8 66 42 00       	mov    ds:0x4266e8,eax
 10062d5:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10062d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10062dc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10062df:	0f b6 c0             	movzx  eax,al
 10062e2:	a3 f4 66 42 00       	mov    ds:0x4266f4,eax
 10062e7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10062eb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10062ee:	8d 50 01             	lea    edx,[eax+0x1]
 10062f1:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 10062f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10062f7:	0f b6 c0             	movzx  eax,al
 10062fa:	a3 10 67 42 00       	mov    ds:0x426710,eax
 10062ff:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006302:	8d 50 01             	lea    edx,[eax+0x1]
 1006305:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 1006308:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100630b:	0f b6 c0             	movzx  eax,al
 100630e:	a3 14 67 42 00       	mov    ds:0x426714,eax
 1006313:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006316:	8d 50 01             	lea    edx,[eax+0x1]
 1006319:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 100631c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100631f:	0f b6 c0             	movzx  eax,al
 1006322:	a3 0c 67 42 00       	mov    ds:0x42670c,eax
 1006327:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100632a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100632d:	0f b6 c0             	movzx  eax,al
 1006330:	a3 08 67 42 00       	mov    ds:0x426708,eax
 1006335:	90                   	nop
 1006336:	c9                   	leave  
 1006337:	c3                   	ret    

01006338 <seek_tty>:
 1006338:	55                   	push   ebp
 1006339:	89 e5                	mov    ebp,esp
 100633b:	83 ec 10             	sub    esp,0x10
 100633e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006341:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1006344:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 1006347:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 100634a:	05 00 c0 05 00       	add    eax,0x5c000
 100634f:	01 c0                	add    eax,eax
 1006351:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 1006356:	90                   	nop
 1006357:	c9                   	leave  
 1006358:	c3                   	ret    

01006359 <tell_monitor>:
 1006359:	55                   	push   ebp
 100635a:	89 e5                	mov    ebp,esp
 100635c:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 1006361:	8b 15 e0 66 42 00    	mov    edx,DWORD PTR ds:0x4266e0
 1006367:	29 d0                	sub    eax,edx
 1006369:	89 c2                	mov    edx,eax
 100636b:	c1 ea 1f             	shr    edx,0x1f
 100636e:	01 d0                	add    eax,edx
 1006370:	d1 f8                	sar    eax,1
 1006372:	5d                   	pop    ebp
 1006373:	c3                   	ret    

01006374 <del_ch>:
 1006374:	55                   	push   ebp
 1006375:	89 e5                	mov    ebp,esp
 1006377:	57                   	push   edi
 1006378:	81 ec 94 00 00 00    	sub    esp,0x94
 100637e:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 1006383:	83 e8 02             	sub    eax,0x2
 1006386:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006389:	e8 cb ff ff ff       	call   1006359 <tell_monitor>
 100638e:	89 c1                	mov    ecx,eax
 1006390:	ba 67 66 66 66       	mov    edx,0x66666667
 1006395:	89 c8                	mov    eax,ecx
 1006397:	f7 ea                	imul   edx
 1006399:	89 d0                	mov    eax,edx
 100639b:	c1 f8 05             	sar    eax,0x5
 100639e:	89 ca                	mov    edx,ecx
 10063a0:	c1 fa 1f             	sar    edx,0x1f
 10063a3:	29 d0                	sub    eax,edx
 10063a5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10063a8:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 10063ab:	89 d0                	mov    eax,edx
 10063ad:	c1 e0 02             	shl    eax,0x2
 10063b0:	01 d0                	add    eax,edx
 10063b2:	c1 e0 04             	shl    eax,0x4
 10063b5:	29 c1                	sub    ecx,eax
 10063b7:	89 ca                	mov    edx,ecx
 10063b9:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 10063bc:	eb 14                	jmp    10063d2 <del_ch+0x5e>
 10063be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10063c1:	0f b6 50 02          	movzx  edx,BYTE PTR [eax+0x2]
 10063c5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10063c8:	88 10                	mov    BYTE PTR [eax],dl
 10063ca:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 10063ce:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10063d2:	83 7d f0 4e          	cmp    DWORD PTR [ebp-0x10],0x4e
 10063d6:	7e e6                	jle    10063be <del_ch+0x4a>
 10063d8:	8d 95 74 ff ff ff    	lea    edx,[ebp-0x8c]
 10063de:	b8 00 00 00 00       	mov    eax,0x0
 10063e3:	b9 1f 00 00 00       	mov    ecx,0x1f
 10063e8:	89 d7                	mov    edi,edx
 10063ea:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 10063ec:	e8 68 ff ff ff       	call   1006359 <tell_monitor>
 10063f1:	83 e8 01             	sub    eax,0x1
 10063f4:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
 10063f7:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
 10063fd:	50                   	push   eax
 10063fe:	e8 35 ff ff ff       	call   1006338 <seek_tty>
 1006403:	83 c4 04             	add    esp,0x4
 1006406:	e8 06 00 00 00       	call   1006411 <set_cur>
 100640b:	90                   	nop
 100640c:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 100640f:	c9                   	leave  
 1006410:	c3                   	ret    

01006411 <set_cur>:
 1006411:	55                   	push   ebp
 1006412:	89 e5                	mov    ebp,esp
 1006414:	83 ec 08             	sub    esp,0x8
 1006417:	fa                   	cli    
 1006418:	a1 fc 66 42 00       	mov    eax,ds:0x4266fc
 100641d:	0f b7 c0             	movzx  eax,ax
 1006420:	83 ec 08             	sub    esp,0x8
 1006423:	6a 0e                	push   0xe
 1006425:	50                   	push   eax
 1006426:	e8 c5 cb ff ff       	call   1002ff0 <outb>
 100642b:	83 c4 10             	add    esp,0x10
 100642e:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 1006433:	8b 15 e0 66 42 00    	mov    edx,DWORD PTR ds:0x4266e0
 1006439:	29 d0                	sub    eax,edx
 100643b:	c1 f8 09             	sar    eax,0x9
 100643e:	0f b6 d0             	movzx  edx,al
 1006441:	a1 00 67 42 00       	mov    eax,ds:0x426700
 1006446:	0f b7 c0             	movzx  eax,ax
 1006449:	83 ec 08             	sub    esp,0x8
 100644c:	52                   	push   edx
 100644d:	50                   	push   eax
 100644e:	e8 9d cb ff ff       	call   1002ff0 <outb>
 1006453:	83 c4 10             	add    esp,0x10
 1006456:	a1 fc 66 42 00       	mov    eax,ds:0x4266fc
 100645b:	0f b7 c0             	movzx  eax,ax
 100645e:	83 ec 08             	sub    esp,0x8
 1006461:	6a 0f                	push   0xf
 1006463:	50                   	push   eax
 1006464:	e8 87 cb ff ff       	call   1002ff0 <outb>
 1006469:	83 c4 10             	add    esp,0x10
 100646c:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 1006471:	8b 15 e0 66 42 00    	mov    edx,DWORD PTR ds:0x4266e0
 1006477:	29 d0                	sub    eax,edx
 1006479:	d1 f8                	sar    eax,1
 100647b:	0f b6 d0             	movzx  edx,al
 100647e:	a1 00 67 42 00       	mov    eax,ds:0x426700
 1006483:	0f b7 c0             	movzx  eax,ax
 1006486:	83 ec 08             	sub    esp,0x8
 1006489:	52                   	push   edx
 100648a:	50                   	push   eax
 100648b:	e8 60 cb ff ff       	call   1002ff0 <outb>
 1006490:	83 c4 10             	add    esp,0x10
 1006493:	fb                   	sti    
 1006494:	90                   	nop
 1006495:	c9                   	leave  
 1006496:	c3                   	ret    

01006497 <read_tty>:
 1006497:	55                   	push   ebp
 1006498:	89 e5                	mov    ebp,esp
 100649a:	83 ec 18             	sub    esp,0x18
 100649d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10064a0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 10064a3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10064a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10064a9:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 10064ac:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 10064af:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 10064b6:	eb 3e                	jmp    10064f6 <read_tty+0x5f>
 10064b8:	8b 15 34 6e 00 01    	mov    edx,DWORD PTR ds:0x1006e34
 10064be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10064c1:	8d 48 01             	lea    ecx,[eax+0x1]
 10064c4:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
 10064c7:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 10064ca:	88 10                	mov    BYTE PTR [eax],dl
 10064cc:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10064d1:	3d ff ff 0b 00       	cmp    eax,0xbffff
 10064d6:	75 0d                	jne    10064e5 <read_tty+0x4e>
 10064d8:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 10064dc:	7e 07                	jle    10064e5 <read_tty+0x4e>
 10064de:	b8 01 00 00 00       	mov    eax,0x1
 10064e3:	eb 23                	jmp    1006508 <read_tty+0x71>
 10064e5:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10064ea:	83 c0 02             	add    eax,0x2
 10064ed:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 10064f2:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 10064f6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 10064f9:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 10064fc:	7c ba                	jl     10064b8 <read_tty+0x21>
 10064fe:	e8 0e ff ff ff       	call   1006411 <set_cur>
 1006503:	b8 00 00 00 00       	mov    eax,0x0
 1006508:	c9                   	leave  
 1006509:	c3                   	ret    

0100650a <write_tty>:
 100650a:	55                   	push   ebp
 100650b:	89 e5                	mov    ebp,esp
 100650d:	83 ec 18             	sub    esp,0x18
 1006510:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006513:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1006516:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006519:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100651c:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 100651f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 1006522:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 1006529:	e9 df 00 00 00       	jmp    100660d <write_tty+0x103>
 100652e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006531:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006534:	3c 0a                	cmp    al,0xa
 1006536:	75 42                	jne    100657a <write_tty+0x70>
 1006538:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 100653d:	2d 00 80 0b 00       	sub    eax,0xb8000
 1006542:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006545:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006548:	ba cd cc cc cc       	mov    edx,0xcccccccd
 100654d:	f7 e2                	mul    edx
 100654f:	89 d0                	mov    eax,edx
 1006551:	c1 e8 07             	shr    eax,0x7
 1006554:	8d 50 01             	lea    edx,[eax+0x1]
 1006557:	89 d0                	mov    eax,edx
 1006559:	c1 e0 02             	shl    eax,0x2
 100655c:	01 d0                	add    eax,edx
 100655e:	c1 e0 05             	shl    eax,0x5
 1006561:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006564:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006567:	05 00 80 0b 00       	add    eax,0xb8000
 100656c:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 1006571:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006575:	e9 8f 00 00 00       	jmp    1006609 <write_tty+0xff>
 100657a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100657d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006580:	84 c0                	test   al,al
 1006582:	0f 84 93 00 00 00    	je     100661b <write_tty+0x111>
 1006588:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100658b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100658e:	3c 08                	cmp    al,0x8
 1006590:	75 17                	jne    10065a9 <write_tty+0x9f>
 1006592:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 1006597:	83 e8 02             	sub    eax,0x2
 100659a:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 100659f:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10065a4:	c6 00 00             	mov    BYTE PTR [eax],0x0
 10065a7:	eb 33                	jmp    10065dc <write_tty+0xd2>
 10065a9:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 10065ac:	8d 42 01             	lea    eax,[edx+0x1]
 10065af:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 10065b2:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10065b7:	8d 48 01             	lea    ecx,[eax+0x1]
 10065ba:	89 0d 34 6e 00 01    	mov    DWORD PTR ds:0x1006e34,ecx
 10065c0:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 10065c3:	88 10                	mov    BYTE PTR [eax],dl
 10065c5:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10065ca:	8d 50 01             	lea    edx,[eax+0x1]
 10065cd:	89 15 34 6e 00 01    	mov    DWORD PTR ds:0x1006e34,edx
 10065d3:	0f b6 15 38 6e 00 01 	movzx  edx,BYTE PTR ds:0x1006e38
 10065da:	88 10                	mov    BYTE PTR [eax],dl
 10065dc:	a1 34 6e 00 01       	mov    eax,ds:0x1006e34
 10065e1:	8b 0d e8 66 42 00    	mov    ecx,DWORD PTR ds:0x4266e8
 10065e7:	29 c8                	sub    eax,ecx
 10065e9:	89 c2                	mov    edx,eax
 10065eb:	a1 04 67 42 00       	mov    eax,ds:0x426704
 10065f0:	8b 0d f8 66 42 00    	mov    ecx,DWORD PTR ds:0x4266f8
 10065f6:	29 c8                	sub    eax,ecx
 10065f8:	01 c0                	add    eax,eax
 10065fa:	39 c2                	cmp    edx,eax
 10065fc:	7c 0b                	jl     1006609 <write_tty+0xff>
 10065fe:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1006602:	7e 05                	jle    1006609 <write_tty+0xff>
 1006604:	e8 96 f9 ff ff       	call   1005f9f <scrdown>
 1006609:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 100660d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1006610:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 1006613:	0f 8c 15 ff ff ff    	jl     100652e <write_tty+0x24>
 1006619:	eb 01                	jmp    100661c <write_tty+0x112>
 100661b:	90                   	nop
 100661c:	e8 f0 fd ff ff       	call   1006411 <set_cur>
 1006621:	b8 00 00 00 00       	mov    eax,0x0
 1006626:	c9                   	leave  
 1006627:	c3                   	ret    

01006628 <cls>:
 1006628:	55                   	push   ebp
 1006629:	89 e5                	mov    ebp,esp
 100662b:	83 ec 18             	sub    esp,0x18
 100662e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 1006635:	eb 12                	jmp    1006649 <cls+0x21>
 1006637:	8b 15 e8 66 42 00    	mov    edx,DWORD PTR ds:0x4266e8
 100663d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006640:	01 d0                	add    eax,edx
 1006642:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006645:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 1006649:	a1 04 67 42 00       	mov    eax,ds:0x426704
 100664e:	01 c0                	add    eax,eax
 1006650:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 1006653:	7c e2                	jl     1006637 <cls+0xf>
 1006655:	a1 e8 66 42 00       	mov    eax,ds:0x4266e8
 100665a:	a3 34 6e 00 01       	mov    ds:0x1006e34,eax
 100665f:	e8 ad fd ff ff       	call   1006411 <set_cur>
 1006664:	90                   	nop
 1006665:	c9                   	leave  
 1006666:	c3                   	ret    

01006667 <set_color>:
 1006667:	55                   	push   ebp
 1006668:	89 e5                	mov    ebp,esp
 100666a:	83 ec 04             	sub    esp,0x4
 100666d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006670:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1006673:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
 1006677:	a2 38 6e 00 01       	mov    ds:0x1006e38,al
 100667c:	90                   	nop
 100667d:	c9                   	leave  
 100667e:	c3                   	ret    

0100667f <memcpy>:
 100667f:	55                   	push   ebp
 1006680:	89 e5                	mov    ebp,esp
 1006682:	83 ec 10             	sub    esp,0x10
 1006685:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006688:	c6 00 ff             	mov    BYTE PTR [eax],0xff
 100668b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006692:	eb 17                	jmp    10066ab <memcpy+0x2c>
 1006694:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006697:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 100669a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100669d:	88 10                	mov    BYTE PTR [eax],dl
 100669f:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10066a3:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10066a7:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10066ab:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10066ae:	39 45 10             	cmp    DWORD PTR [ebp+0x10],eax
 10066b1:	77 e1                	ja     1006694 <memcpy+0x15>
 10066b3:	90                   	nop
 10066b4:	90                   	nop
 10066b5:	c9                   	leave  
 10066b6:	c3                   	ret    

010066b7 <memcmp>:
 10066b7:	55                   	push   ebp
 10066b8:	89 e5                	mov    ebp,esp
 10066ba:	83 ec 10             	sub    esp,0x10
 10066bd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 10066c4:	eb 34                	jmp    10066fa <memcmp+0x43>
 10066c6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10066c9:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10066cc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10066cf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10066d2:	38 c2                	cmp    dl,al
 10066d4:	74 18                	je     10066ee <memcmp+0x37>
 10066d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10066d9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10066dc:	0f b6 d0             	movzx  edx,al
 10066df:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10066e2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10066e5:	0f b6 c8             	movzx  ecx,al
 10066e8:	89 d0                	mov    eax,edx
 10066ea:	29 c8                	sub    eax,ecx
 10066ec:	eb 19                	jmp    1006707 <memcmp+0x50>
 10066ee:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10066f2:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10066f6:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 10066fa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10066fd:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1006700:	7c c4                	jl     10066c6 <memcmp+0xf>
 1006702:	b8 00 00 00 00       	mov    eax,0x0
 1006707:	c9                   	leave  
 1006708:	c3                   	ret    

01006709 <memset>:
 1006709:	55                   	push   ebp
 100670a:	89 e5                	mov    ebp,esp
 100670c:	83 ec 14             	sub    esp,0x14
 100670f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006712:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1006715:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100671c:	eb 13                	jmp    1006731 <memset+0x28>
 100671e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006721:	8d 50 01             	lea    edx,[eax+0x1]
 1006724:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1006727:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
 100672b:	88 10                	mov    BYTE PTR [eax],dl
 100672d:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006731:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006734:	3b 45 10             	cmp    eax,DWORD PTR [ebp+0x10]
 1006737:	72 e5                	jb     100671e <memset+0x15>
 1006739:	90                   	nop
 100673a:	90                   	nop
 100673b:	c9                   	leave  
 100673c:	c3                   	ret    

0100673d <get_mem_size>:
 100673d:	55                   	push   ebp
 100673e:	89 e5                	mov    ebp,esp
 1006740:	a1 18 67 42 00       	mov    eax,ds:0x426718
 1006745:	5d                   	pop    ebp
 1006746:	c3                   	ret    

01006747 <strcpy>:
 1006747:	55                   	push   ebp
 1006748:	89 e5                	mov    ebp,esp
 100674a:	eb 17                	jmp    1006763 <strcpy+0x1c>
 100674c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 100674f:	8d 42 01             	lea    eax,[edx+0x1]
 1006752:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006755:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006758:	8d 48 01             	lea    ecx,[eax+0x1]
 100675b:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
 100675e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 1006761:	88 10                	mov    BYTE PTR [eax],dl
 1006763:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006766:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006769:	84 c0                	test   al,al
 100676b:	75 df                	jne    100674c <strcpy+0x5>
 100676d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006770:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006773:	90                   	nop
 1006774:	5d                   	pop    ebp
 1006775:	c3                   	ret    

01006776 <strtok>:
 1006776:	55                   	push   ebp
 1006777:	89 e5                	mov    ebp,esp
 1006779:	83 ec 14             	sub    esp,0x14
 100677c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100677f:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
 1006782:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 1006786:	0f 84 8c 00 00 00    	je     1006818 <strtok+0xa2>
 100678c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 100678f:	68 20 67 42 00       	push   0x426720
 1006794:	e8 ae ff ff ff       	call   1006747 <strcpy>
 1006799:	83 c4 08             	add    esp,0x8
 100679c:	c7 45 f4 20 67 42 00 	mov    DWORD PTR [ebp-0xc],0x426720
 10067a3:	c7 05 20 69 42 00 00 	mov    DWORD PTR ds:0x426920,0x0
 10067aa:	00 00 00 
 10067ad:	eb 1a                	jmp    10067c9 <strtok+0x53>
 10067af:	a1 20 69 42 00       	mov    eax,ds:0x426920
 10067b4:	83 c0 01             	add    eax,0x1
 10067b7:	99                   	cdq    
 10067b8:	c1 ea 17             	shr    edx,0x17
 10067bb:	01 d0                	add    eax,edx
 10067bd:	25 ff 01 00 00       	and    eax,0x1ff
 10067c2:	29 d0                	sub    eax,edx
 10067c4:	a3 20 69 42 00       	mov    ds:0x426920,eax
 10067c9:	a1 20 69 42 00       	mov    eax,ds:0x426920
 10067ce:	0f b6 80 20 67 42 00 	movzx  eax,BYTE PTR [eax+0x426720]
 10067d5:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 10067d8:	74 10                	je     10067ea <strtok+0x74>
 10067da:	a1 20 69 42 00       	mov    eax,ds:0x426920
 10067df:	0f b6 80 20 67 42 00 	movzx  eax,BYTE PTR [eax+0x426720]
 10067e6:	84 c0                	test   al,al
 10067e8:	75 c5                	jne    10067af <strtok+0x39>
 10067ea:	a1 20 69 42 00       	mov    eax,ds:0x426920
 10067ef:	c6 80 20 67 42 00 00 	mov    BYTE PTR [eax+0x426720],0x0
 10067f6:	a1 20 69 42 00       	mov    eax,ds:0x426920
 10067fb:	83 c0 01             	add    eax,0x1
 10067fe:	99                   	cdq    
 10067ff:	c1 ea 17             	shr    edx,0x17
 1006802:	01 d0                	add    eax,edx
 1006804:	25 ff 01 00 00       	and    eax,0x1ff
 1006809:	29 d0                	sub    eax,edx
 100680b:	a3 20 69 42 00       	mov    ds:0x426920,eax
 1006810:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006813:	e9 8b 00 00 00       	jmp    10068a3 <strtok+0x12d>
 1006818:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100681f:	a1 20 69 42 00       	mov    eax,ds:0x426920
 1006824:	05 20 67 42 00       	add    eax,0x426720
 1006829:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 100682c:	eb 1e                	jmp    100684c <strtok+0xd6>
 100682e:	a1 20 69 42 00       	mov    eax,ds:0x426920
 1006833:	83 c0 01             	add    eax,0x1
 1006836:	99                   	cdq    
 1006837:	c1 ea 17             	shr    edx,0x17
 100683a:	01 d0                	add    eax,edx
 100683c:	25 ff 01 00 00       	and    eax,0x1ff
 1006841:	29 d0                	sub    eax,edx
 1006843:	a3 20 69 42 00       	mov    ds:0x426920,eax
 1006848:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 100684c:	a1 20 69 42 00       	mov    eax,ds:0x426920
 1006851:	0f b6 80 20 67 42 00 	movzx  eax,BYTE PTR [eax+0x426720]
 1006858:	38 45 ec             	cmp    BYTE PTR [ebp-0x14],al
 100685b:	74 10                	je     100686d <strtok+0xf7>
 100685d:	a1 20 69 42 00       	mov    eax,ds:0x426920
 1006862:	0f b6 80 20 67 42 00 	movzx  eax,BYTE PTR [eax+0x426720]
 1006869:	84 c0                	test   al,al
 100686b:	75 c1                	jne    100682e <strtok+0xb8>
 100686d:	a1 20 69 42 00       	mov    eax,ds:0x426920
 1006872:	c6 80 20 67 42 00 00 	mov    BYTE PTR [eax+0x426720],0x0
 1006879:	a1 20 69 42 00       	mov    eax,ds:0x426920
 100687e:	83 c0 01             	add    eax,0x1
 1006881:	99                   	cdq    
 1006882:	c1 ea 17             	shr    edx,0x17
 1006885:	01 d0                	add    eax,edx
 1006887:	25 ff 01 00 00       	and    eax,0x1ff
 100688c:	29 d0                	sub    eax,edx
 100688e:	a3 20 69 42 00       	mov    ds:0x426920,eax
 1006893:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006897:	74 05                	je     100689e <strtok+0x128>
 1006899:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100689c:	eb 05                	jmp    10068a3 <strtok+0x12d>
 100689e:	b8 00 00 00 00       	mov    eax,0x0
 10068a3:	c9                   	leave  
 10068a4:	c3                   	ret    

010068a5 <strcmp>:
 10068a5:	55                   	push   ebp
 10068a6:	89 e5                	mov    ebp,esp
 10068a8:	eb 36                	jmp    10068e0 <strcmp+0x3b>
 10068aa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10068ad:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10068b0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10068b3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068b6:	38 c2                	cmp    dl,al
 10068b8:	7e 07                	jle    10068c1 <strcmp+0x1c>
 10068ba:	b8 01 00 00 00       	mov    eax,0x1
 10068bf:	eb 4a                	jmp    100690b <strcmp+0x66>
 10068c1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10068c4:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10068c7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10068ca:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068cd:	38 c2                	cmp    dl,al
 10068cf:	7d 07                	jge    10068d8 <strcmp+0x33>
 10068d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
 10068d6:	eb 33                	jmp    100690b <strcmp+0x66>
 10068d8:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10068dc:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
 10068e0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10068e3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068e6:	84 c0                	test   al,al
 10068e8:	74 0a                	je     10068f4 <strcmp+0x4f>
 10068ea:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10068ed:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10068f0:	84 c0                	test   al,al
 10068f2:	75 b6                	jne    10068aa <strcmp+0x5>
 10068f4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10068f7:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 10068fa:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 10068fd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006900:	38 c2                	cmp    dl,al
 1006902:	75 07                	jne    100690b <strcmp+0x66>
 1006904:	b8 00 00 00 00       	mov    eax,0x0
 1006909:	eb 00                	jmp    100690b <strcmp+0x66>
 100690b:	5d                   	pop    ebp
 100690c:	c3                   	ret    

0100690d <strlen>:
 100690d:	55                   	push   ebp
 100690e:	89 e5                	mov    ebp,esp
 1006910:	83 ec 10             	sub    esp,0x10
 1006913:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 100691a:	eb 08                	jmp    1006924 <strlen+0x17>
 100691c:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006920:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
 1006924:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006927:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100692a:	84 c0                	test   al,al
 100692c:	75 ee                	jne    100691c <strlen+0xf>
 100692e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006931:	c9                   	leave  
 1006932:	c3                   	ret    

01006933 <sprintf>:
 1006933:	55                   	push   ebp
 1006934:	89 e5                	mov    ebp,esp
 1006936:	83 ec 28             	sub    esp,0x28
 1006939:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 100693c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100693f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006942:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1006945:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 100694c:	eb 22                	jmp    1006970 <sprintf+0x3d>
 100694e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006951:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006954:	3c 25                	cmp    al,0x25
 1006956:	75 0e                	jne    1006966 <sprintf+0x33>
 1006958:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 100695b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100695e:	3c 25                	cmp    al,0x25
 1006960:	74 04                	je     1006966 <sprintf+0x33>
 1006962:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
 1006966:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006969:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 100696c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006970:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006973:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006976:	3c 0a                	cmp    al,0xa
 1006978:	75 d4                	jne    100694e <sprintf+0x1b>
 100697a:	8d 45 10             	lea    eax,[ebp+0x10]
 100697d:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1006980:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006983:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1006986:	e9 eb 00 00 00       	jmp    1006a76 <sprintf+0x143>
 100698b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100698e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006991:	3c 25                	cmp    al,0x25
 1006993:	0f 85 c1 00 00 00    	jne    1006a5a <sprintf+0x127>
 1006999:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 100699c:	83 c0 01             	add    eax,0x1
 100699f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10069a2:	84 c0                	test   al,al
 10069a4:	0f 84 b0 00 00 00    	je     1006a5a <sprintf+0x127>
 10069aa:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 10069ae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10069b1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10069b4:	3c 78                	cmp    al,0x78
 10069b6:	75 25                	jne    10069dd <sprintf+0xaa>
 10069b8:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10069bb:	8d 50 04             	lea    edx,[eax+0x4]
 10069be:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 10069c1:	8b 00                	mov    eax,DWORD PTR [eax]
 10069c3:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10069c6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10069c9:	83 ec 08             	sub    esp,0x8
 10069cc:	50                   	push   eax
 10069cd:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10069d0:	e8 87 01 00 00       	call   1006b5c <sprint_hex>
 10069d5:	83 c4 10             	add    esp,0x10
 10069d8:	e9 95 00 00 00       	jmp    1006a72 <sprintf+0x13f>
 10069dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 10069e0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10069e3:	3c 73                	cmp    al,0x73
 10069e5:	75 21                	jne    1006a08 <sprintf+0xd5>
 10069e7:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10069ea:	8d 50 04             	lea    edx,[eax+0x4]
 10069ed:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 10069f0:	8b 00                	mov    eax,DWORD PTR [eax]
 10069f2:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 10069f5:	83 ec 08             	sub    esp,0x8
 10069f8:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 10069fb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 10069fe:	e8 cb 01 00 00       	call   1006bce <sprintn>
 1006a03:	83 c4 10             	add    esp,0x10
 1006a06:	eb 6a                	jmp    1006a72 <sprintf+0x13f>
 1006a08:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006a0b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a0e:	3c 64                	cmp    al,0x64
 1006a10:	75 22                	jne    1006a34 <sprintf+0x101>
 1006a12:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 1006a15:	8d 50 04             	lea    edx,[eax+0x4]
 1006a18:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
 1006a1b:	8b 00                	mov    eax,DWORD PTR [eax]
 1006a1d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 1006a20:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1006a23:	83 ec 08             	sub    esp,0x8
 1006a26:	50                   	push   eax
 1006a27:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a2a:	e8 8d 00 00 00       	call   1006abc <sprint_decimal>
 1006a2f:	83 c4 10             	add    esp,0x10
 1006a32:	eb 3e                	jmp    1006a72 <sprintf+0x13f>
 1006a34:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006a37:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a3a:	3c 63                	cmp    al,0x63
 1006a3c:	75 02                	jne    1006a40 <sprintf+0x10d>
 1006a3e:	0f 0b                	ud2    
 1006a40:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006a43:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a46:	0f be c0             	movsx  eax,al
 1006a49:	83 ec 08             	sub    esp,0x8
 1006a4c:	50                   	push   eax
 1006a4d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a50:	e8 33 00 00 00       	call   1006a88 <sprintchar>
 1006a55:	83 c4 10             	add    esp,0x10
 1006a58:	eb 18                	jmp    1006a72 <sprintf+0x13f>
 1006a5a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006a5d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a60:	0f be c0             	movsx  eax,al
 1006a63:	83 ec 08             	sub    esp,0x8
 1006a66:	50                   	push   eax
 1006a67:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006a6a:	e8 19 00 00 00       	call   1006a88 <sprintchar>
 1006a6f:	83 c4 10             	add    esp,0x10
 1006a72:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
 1006a76:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1006a79:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006a7c:	84 c0                	test   al,al
 1006a7e:	0f 85 07 ff ff ff    	jne    100698b <sprintf+0x58>
 1006a84:	90                   	nop
 1006a85:	90                   	nop
 1006a86:	c9                   	leave  
 1006a87:	c3                   	ret    

01006a88 <sprintchar>:
 1006a88:	55                   	push   ebp
 1006a89:	89 e5                	mov    ebp,esp
 1006a8b:	83 ec 04             	sub    esp,0x4
 1006a8e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006a91:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
 1006a94:	eb 04                	jmp    1006a9a <sprintchar+0x12>
 1006a96:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 1006a9a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006a9d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006aa0:	84 c0                	test   al,al
 1006aa2:	75 f2                	jne    1006a96 <sprintchar+0xe>
 1006aa4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006aa7:	8d 50 01             	lea    edx,[eax+0x1]
 1006aaa:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1006aad:	0f b6 55 fc          	movzx  edx,BYTE PTR [ebp-0x4]
 1006ab1:	88 10                	mov    BYTE PTR [eax],dl
 1006ab3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1006ab6:	c6 00 00             	mov    BYTE PTR [eax],0x0
 1006ab9:	90                   	nop
 1006aba:	c9                   	leave  
 1006abb:	c3                   	ret    

01006abc <sprint_decimal>:
 1006abc:	55                   	push   ebp
 1006abd:	89 e5                	mov    ebp,esp
 1006abf:	53                   	push   ebx
 1006ac0:	83 ec 20             	sub    esp,0x20
 1006ac3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
 1006aca:	eb 5b                	jmp    1006b27 <sprint_decimal+0x6b>
 1006acc:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006acf:	ba 67 66 66 66       	mov    edx,0x66666667
 1006ad4:	89 c8                	mov    eax,ecx
 1006ad6:	f7 ea                	imul   edx
 1006ad8:	89 d0                	mov    eax,edx
 1006ada:	c1 f8 02             	sar    eax,0x2
 1006add:	89 cb                	mov    ebx,ecx
 1006adf:	c1 fb 1f             	sar    ebx,0x1f
 1006ae2:	29 d8                	sub    eax,ebx
 1006ae4:	89 c2                	mov    edx,eax
 1006ae6:	89 d0                	mov    eax,edx
 1006ae8:	c1 e0 02             	shl    eax,0x2
 1006aeb:	01 d0                	add    eax,edx
 1006aed:	01 c0                	add    eax,eax
 1006aef:	29 c1                	sub    ecx,eax
 1006af1:	89 ca                	mov    edx,ecx
 1006af3:	89 d0                	mov    eax,edx
 1006af5:	83 c0 30             	add    eax,0x30
 1006af8:	88 45 f7             	mov    BYTE PTR [ebp-0x9],al
 1006afb:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006afe:	8d 50 01             	lea    edx,[eax+0x1]
 1006b01:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 1006b04:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
 1006b08:	88 54 05 e1          	mov    BYTE PTR [ebp+eax*1-0x1f],dl
 1006b0c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006b0f:	ba 67 66 66 66       	mov    edx,0x66666667
 1006b14:	89 c8                	mov    eax,ecx
 1006b16:	f7 ea                	imul   edx
 1006b18:	89 d0                	mov    eax,edx
 1006b1a:	c1 f8 02             	sar    eax,0x2
 1006b1d:	c1 f9 1f             	sar    ecx,0x1f
 1006b20:	89 ca                	mov    edx,ecx
 1006b22:	29 d0                	sub    eax,edx
 1006b24:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006b27:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006b2a:	83 f8 07             	cmp    eax,0x7
 1006b2d:	76 9d                	jbe    1006acc <sprint_decimal+0x10>
 1006b2f:	eb 1e                	jmp    1006b4f <sprint_decimal+0x93>
 1006b31:	83 6d f8 01          	sub    DWORD PTR [ebp-0x8],0x1
 1006b35:	8d 55 e1             	lea    edx,[ebp-0x1f]
 1006b38:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1006b3b:	01 d0                	add    eax,edx
 1006b3d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006b40:	0f be c0             	movsx  eax,al
 1006b43:	50                   	push   eax
 1006b44:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006b47:	e8 3c ff ff ff       	call   1006a88 <sprintchar>
 1006b4c:	83 c4 08             	add    esp,0x8
 1006b4f:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 1006b53:	7f dc                	jg     1006b31 <sprint_decimal+0x75>
 1006b55:	90                   	nop
 1006b56:	90                   	nop
 1006b57:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 1006b5a:	c9                   	leave  
 1006b5b:	c3                   	ret    

01006b5c <sprint_hex>:
 1006b5c:	55                   	push   ebp
 1006b5d:	89 e5                	mov    ebp,esp
 1006b5f:	83 ec 10             	sub    esp,0x10
 1006b62:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
 1006b69:	eb 33                	jmp    1006b9e <sprint_hex+0x42>
 1006b6b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006b6e:	83 e0 0f             	and    eax,0xf
 1006b71:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
 1006b74:	80 7d fb 09          	cmp    BYTE PTR [ebp-0x5],0x9
 1006b78:	76 06                	jbe    1006b80 <sprint_hex+0x24>
 1006b7a:	80 45 fb 57          	add    BYTE PTR [ebp-0x5],0x57
 1006b7e:	eb 04                	jmp    1006b84 <sprint_hex+0x28>
 1006b80:	80 45 fb 30          	add    BYTE PTR [ebp-0x5],0x30
 1006b84:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006b87:	8d 50 01             	lea    edx,[eax+0x1]
 1006b8a:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1006b8d:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
 1006b91:	88 54 05 f1          	mov    BYTE PTR [ebp+eax*1-0xf],dl
 1006b95:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006b98:	c1 e8 04             	shr    eax,0x4
 1006b9b:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
 1006b9e:	83 7d fc 09          	cmp    DWORD PTR [ebp-0x4],0x9
 1006ba2:	7e c7                	jle    1006b6b <sprint_hex+0xf>
 1006ba4:	eb 1e                	jmp    1006bc4 <sprint_hex+0x68>
 1006ba6:	83 6d fc 01          	sub    DWORD PTR [ebp-0x4],0x1
 1006baa:	8d 55 f1             	lea    edx,[ebp-0xf]
 1006bad:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1006bb0:	01 d0                	add    eax,edx
 1006bb2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bb5:	0f be c0             	movsx  eax,al
 1006bb8:	50                   	push   eax
 1006bb9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006bbc:	e8 c7 fe ff ff       	call   1006a88 <sprintchar>
 1006bc1:	83 c4 08             	add    esp,0x8
 1006bc4:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
 1006bc8:	7f dc                	jg     1006ba6 <sprint_hex+0x4a>
 1006bca:	90                   	nop
 1006bcb:	90                   	nop
 1006bcc:	c9                   	leave  
 1006bcd:	c3                   	ret    

01006bce <sprintn>:
 1006bce:	55                   	push   ebp
 1006bcf:	89 e5                	mov    ebp,esp
 1006bd1:	eb 1b                	jmp    1006bee <sprintn+0x20>
 1006bd3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006bd6:	8d 50 01             	lea    edx,[eax+0x1]
 1006bd9:	89 55 0c             	mov    DWORD PTR [ebp+0xc],edx
 1006bdc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bdf:	0f be c0             	movsx  eax,al
 1006be2:	50                   	push   eax
 1006be3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 1006be6:	e8 9d fe ff ff       	call   1006a88 <sprintchar>
 1006beb:	83 c4 08             	add    esp,0x8
 1006bee:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 1006bf1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1006bf4:	84 c0                	test   al,al
 1006bf6:	75 db                	jne    1006bd3 <sprintn+0x5>
 1006bf8:	90                   	nop
 1006bf9:	90                   	nop
 1006bfa:	c9                   	leave  
 1006bfb:	c3                   	ret    
 1006bfc:	66 90                	xchg   ax,ax
 1006bfe:	66 90                	xchg   ax,ax

01006c00 <create_zero>:
 1006c00:	e8 d8 b6 ff ff       	call   10022dd <req_proc>
 1006c05:	83 f8 ff             	cmp    eax,0xffffffff
 1006c08:	74 1d                	je     1006c27 <create_zero.retu>
 1006c0a:	50                   	push   eax
 1006c0b:	53                   	push   ebx
 1006c0c:	51                   	push   ecx
 1006c0d:	52                   	push   edx
 1006c0e:	06                   	push   es
 1006c0f:	0e                   	push   cs
 1006c10:	16                   	push   ss
 1006c11:	1e                   	push   ds
 1006c12:	0f a0                	push   fs
 1006c14:	0f a8                	push   gs
 1006c16:	54                   	push   esp
 1006c17:	55                   	push   ebp
 1006c18:	56                   	push   esi
 1006c19:	57                   	push   edi
 1006c1a:	9c                   	pushf  
 1006c1b:	50                   	push   eax
 1006c1c:	e8 6d b7 ff ff       	call   100238e <set_proc>
 1006c21:	8b 04 24             	mov    eax,DWORD PTR [esp]
 1006c24:	83 c4 40             	add    esp,0x40

01006c27 <create_zero.retu>:
 1006c27:	c3                   	ret    

01006c28 <fill_desc>:
 1006c28:	55                   	push   ebp
 1006c29:	89 e5                	mov    ebp,esp
 1006c2b:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 1006c2e:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
 1006c31:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
 1006c34:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 1006c37:	be 56 6d 00 01       	mov    esi,0x1006d56
 1006c3c:	c7 05 56 6d 00 01 00 	mov    DWORD PTR ds:0x1006d56,0x0
 1006c43:	00 00 00 
 1006c46:	c7 05 5a 6d 00 01 00 	mov    DWORD PTR ds:0x1006d5a,0x0
 1006c4d:	00 00 00 
 1006c50:	66 89 0e             	mov    WORD PTR [esi],cx
 1006c53:	c1 e9 10             	shr    ecx,0x10
 1006c56:	66 89 56 02          	mov    WORD PTR [esi+0x2],dx
 1006c5a:	c1 ea 10             	shr    edx,0x10
 1006c5d:	88 56 04             	mov    BYTE PTR [esi+0x4],dl
 1006c60:	66 c1 ea 08          	shr    dx,0x8
 1006c64:	88 56 07             	mov    BYTE PTR [esi+0x7],dl
 1006c67:	66 89 5e 05          	mov    WORD PTR [esi+0x5],bx
 1006c6b:	8b 7e 04             	mov    edi,DWORD PTR [esi+0x4]
 1006c6e:	c1 e1 08             	shl    ecx,0x8
 1006c71:	09 cf                	or     edi,ecx
 1006c73:	89 7e 04             	mov    DWORD PTR [esi+0x4],edi
 1006c76:	8b 15 56 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d56
 1006c7c:	89 10                	mov    DWORD PTR [eax],edx
 1006c7e:	8b 15 5a 6d 00 01    	mov    edx,DWORD PTR ds:0x1006d5a
 1006c84:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
 1006c87:	89 ec                	mov    esp,ebp
 1006c89:	5d                   	pop    ebp
 1006c8a:	c3                   	ret    

01006c8b <switch_proc_asm>:
 1006c8b:	66 8b 44 24 04       	mov    ax,WORD PTR [esp+0x4]
 1006c90:	66 a3 a5 6c 00 01    	mov    ds:0x1006ca5,ax
 1006c96:	c7 05 a1 6c 00 01 00 	mov    DWORD PTR ds:0x1006ca1,0x0
 1006c9d:	00 00 00 

01006ca0 <switch_proc_asm.ljmp>:
 1006ca0:	ea 00 00 00 00 00 00 	jmp    0x0:0x0
 1006ca7:	c3                   	ret    

01006ca8 <switch_to>:
 1006ca8:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
 1006cac:	8b 5e 20             	mov    ebx,DWORD PTR [esi+0x20]
 1006caf:	bf 0c 6d 00 01       	mov    edi,0x1006d0c
 1006cb4:	89 5f 01             	mov    DWORD PTR [edi+0x1],ebx
 1006cb7:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 1006cba:	89 c1                	mov    ecx,eax
 1006cbc:	83 e9 04             	sub    ecx,0x4
 1006cbf:	89 19                	mov    DWORD PTR [ecx],ebx
 1006cc1:	50                   	push   eax
 1006cc2:	89 f5                	mov    ebp,esi
 1006cc4:	83 c5 28             	add    ebp,0x28
 1006cc7:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cca:	50                   	push   eax
 1006ccb:	83 c5 04             	add    ebp,0x4
 1006cce:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cd1:	50                   	push   eax
 1006cd2:	83 c5 04             	add    ebp,0x4
 1006cd5:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cd8:	50                   	push   eax
 1006cd9:	83 c5 04             	add    ebp,0x4
 1006cdc:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cdf:	50                   	push   eax
 1006ce0:	83 c5 04             	add    ebp,0x4
 1006ce3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006ce6:	50                   	push   eax
 1006ce7:	83 c5 04             	add    ebp,0x4
 1006cea:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006ced:	50                   	push   eax
 1006cee:	83 c5 04             	add    ebp,0x4
 1006cf1:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cf4:	50                   	push   eax
 1006cf5:	83 c5 04             	add    ebp,0x4
 1006cf8:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
 1006cfb:	50                   	push   eax
 1006cfc:	83 c5 04             	add    ebp,0x4
 1006cff:	8b 46 1c             	mov    eax,DWORD PTR [esi+0x1c]
 1006d02:	0f 22 d8             	mov    cr3,eax
 1006d05:	8b 46 24             	mov    eax,DWORD PTR [esi+0x24]
 1006d08:	50                   	push   eax
 1006d09:	9d                   	popf   
 1006d0a:	61                   	popa   
 1006d0b:	5c                   	pop    esp

01006d0c <switch_to.leap>:
 1006d0c:	ea 00 00 00 00 08 00 	jmp    0x8:0x0

01006d13 <save_context>:
 1006d13:	60                   	pusha  
 1006d14:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
 1006d18:	83 c0 44             	add    eax,0x44
 1006d1b:	b9 08 00 00 00       	mov    ecx,0x8
 1006d20:	89 e7                	mov    edi,esp

01006d22 <save_context.loops>:
 1006d22:	8b 17                	mov    edx,DWORD PTR [edi]
 1006d24:	89 10                	mov    DWORD PTR [eax],edx
 1006d26:	83 c7 04             	add    edi,0x4
 1006d29:	83 e8 04             	sub    eax,0x4
 1006d2c:	e2 f4                	loop   1006d22 <save_context.loops>
 1006d2e:	61                   	popa   
 1006d2f:	9c                   	pushf  
 1006d30:	5b                   	pop    ebx
 1006d31:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1006d35:	89 58 24             	mov    DWORD PTR [eax+0x24],ebx
 1006d38:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1006d3b:	89 58 20             	mov    DWORD PTR [eax+0x20],ebx
 1006d3e:	c3                   	ret    

01006d3f <move_to_user_mode>:
 1006d3f:	66 b8 20 00          	mov    ax,0x20
 1006d43:	8e d8                	mov    ds,eax
 1006d45:	8e c0                	mov    es,eax
 1006d47:	8e e8                	mov    gs,eax
 1006d49:	6a 20                	push   0x20
 1006d4b:	54                   	push   esp
 1006d4c:	9c                   	pushf  
 1006d4d:	6a 18                	push   0x18
 1006d4f:	68 55 6d 00 01       	push   0x1006d55
 1006d54:	cf                   	iret   

01006d55 <move_to_user_mode.done>:
 1006d55:	c3                   	ret    

01006d56 <desc>:
	...
