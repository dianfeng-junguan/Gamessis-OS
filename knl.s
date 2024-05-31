
bin/gmsknl.elf:     file format elf32-i386


Disassembly of section .text:

01000000 <main>:
 1000000:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1000004:	83 e4 f0             	and    esp,0xfffffff0
 1000007:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 100000a:	55                   	push   ebp
 100000b:	89 e5                	mov    ebp,esp
 100000d:	57                   	push   edi
 100000e:	56                   	push   esi
 100000f:	53                   	push   ebx
 1000010:	51                   	push   ecx
 1000011:	83 ec 58             	sub    esp,0x58
 1000014:	89 cb                	mov    ebx,ecx
 1000016:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 1000019:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 100001c:	e8 6a 04 00 00       	call   100048b <init_logging>
 1000021:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 1000024:	8b 00                	mov    eax,DWORD PTR [eax]
 1000026:	3d d6 50 52 e8       	cmp    eax,0xe85250d6
 100002b:	74 10                	je     100003d <main+0x3d>
 100002d:	83 ec 0c             	sub    esp,0xc
 1000030:	68 44 07 00 01       	push   0x1000744
 1000035:	e8 05 06 00 00       	call   100063f <printf>
 100003a:	83 c4 10             	add    esp,0x10
 100003d:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 1000040:	8b 00                	mov    eax,DWORD PTR [eax]
 1000042:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
 1000045:	83 ec 08             	sub    esp,0x8
 1000048:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 100004b:	68 6e 07 00 01       	push   0x100076e
 1000050:	e8 ea 05 00 00       	call   100063f <printf>
 1000055:	83 c4 10             	add    esp,0x10
 1000058:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 100005b:	83 c0 08             	add    eax,0x8
 100005e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
 1000061:	e9 f0 03 00 00       	jmp    1000456 <main+0x456>
 1000066:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000069:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 100006c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100006f:	8b 00                	mov    eax,DWORD PTR [eax]
 1000071:	83 ec 04             	sub    esp,0x4
 1000074:	52                   	push   edx
 1000075:	50                   	push   eax
 1000076:	68 87 07 00 01       	push   0x1000787
 100007b:	e8 bf 05 00 00       	call   100063f <printf>
 1000080:	83 c4 10             	add    esp,0x10
 1000083:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000086:	8b 00                	mov    eax,DWORD PTR [eax]
 1000088:	83 f8 08             	cmp    eax,0x8
 100008b:	0f 87 b6 03 00 00    	ja     1000447 <main+0x447>
 1000091:	8b 04 85 7c 08 00 01 	mov    eax,DWORD PTR [eax*4+0x100087c]
 1000098:	ff e0                	jmp    eax
 100009a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100009d:	83 c0 08             	add    eax,0x8
 10000a0:	83 ec 08             	sub    esp,0x8
 10000a3:	50                   	push   eax
 10000a4:	68 9c 07 00 01       	push   0x100079c
 10000a9:	e8 91 05 00 00       	call   100063f <printf>
 10000ae:	83 c4 10             	add    esp,0x10
 10000b1:	e9 91 03 00 00       	jmp    1000447 <main+0x447>
 10000b6:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10000b9:	83 c0 08             	add    eax,0x8
 10000bc:	83 ec 08             	sub    esp,0x8
 10000bf:	50                   	push   eax
 10000c0:	68 af 07 00 01       	push   0x10007af
 10000c5:	e8 75 05 00 00       	call   100063f <printf>
 10000ca:	83 c4 10             	add    esp,0x10
 10000cd:	e9 75 03 00 00       	jmp    1000447 <main+0x447>
 10000d2:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10000d5:	8d 48 10             	lea    ecx,[eax+0x10]
 10000d8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10000db:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10000de:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10000e1:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10000e4:	51                   	push   ecx
 10000e5:	52                   	push   edx
 10000e6:	50                   	push   eax
 10000e7:	68 c8 07 00 01       	push   0x10007c8
 10000ec:	e8 4e 05 00 00       	call   100063f <printf>
 10000f1:	83 c4 10             	add    esp,0x10
 10000f4:	e9 4e 03 00 00       	jmp    1000447 <main+0x447>
 10000f9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10000fc:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10000ff:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000102:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000105:	83 ec 04             	sub    esp,0x4
 1000108:	52                   	push   edx
 1000109:	50                   	push   eax
 100010a:	68 f0 07 00 01       	push   0x10007f0
 100010f:	e8 2b 05 00 00       	call   100063f <printf>
 1000114:	83 c4 10             	add    esp,0x10
 1000117:	e9 2b 03 00 00       	jmp    1000447 <main+0x447>
 100011c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100011f:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1000122:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000125:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000128:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100012b:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100012e:	51                   	push   ecx
 100012f:	52                   	push   edx
 1000130:	50                   	push   eax
 1000131:	68 14 08 00 01       	push   0x1000814
 1000136:	e8 04 05 00 00       	call   100063f <printf>
 100013b:	83 c4 10             	add    esp,0x10
 100013e:	e9 04 03 00 00       	jmp    1000447 <main+0x447>
 1000143:	83 ec 0c             	sub    esp,0xc
 1000146:	68 2c 08 00 01       	push   0x100082c
 100014b:	e8 ef 04 00 00       	call   100063f <printf>
 1000150:	83 c4 10             	add    esp,0x10
 1000153:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000156:	83 c0 10             	add    eax,0x10
 1000159:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 100015c:	eb 5c                	jmp    10001ba <main+0x1ba>
 100015e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000161:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
 1000164:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000167:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 100016a:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 100016d:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
 1000170:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000173:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 1000176:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 1000179:	89 d0                	mov    eax,edx
 100017b:	31 d2                	xor    edx,edx
 100017d:	89 c7                	mov    edi,eax
 100017f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 1000182:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 1000185:	8b 00                	mov    eax,DWORD PTR [eax]
 1000187:	89 c6                	mov    esi,eax
 1000189:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 100018c:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 100018f:	8b 00                	mov    eax,DWORD PTR [eax]
 1000191:	89 d0                	mov    eax,edx
 1000193:	31 d2                	xor    edx,edx
 1000195:	83 ec 08             	sub    esp,0x8
 1000198:	51                   	push   ecx
 1000199:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 100019c:	57                   	push   edi
 100019d:	56                   	push   esi
 100019e:	50                   	push   eax
 100019f:	68 34 08 00 01       	push   0x1000834
 10001a4:	e8 96 04 00 00       	call   100063f <printf>
 10001a9:	83 c4 20             	add    esp,0x20
 10001ac:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10001af:	8b 50 08             	mov    edx,DWORD PTR [eax+0x8]
 10001b2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 10001b5:	01 d0                	add    eax,edx
 10001b7:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
 10001ba:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10001bd:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
 10001c0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10001c3:	01 d0                	add    eax,edx
 10001c5:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 10001c8:	72 94                	jb     100015e <main+0x15e>
 10001ca:	e9 78 02 00 00       	jmp    1000447 <main+0x447>
 10001cf:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 10001d2:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
 10001d5:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10001d8:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
 10001db:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
 10001de:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 10001e1:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10001e4:	0f b6 40 1d          	movzx  eax,BYTE PTR [eax+0x1d]
 10001e8:	0f b6 c0             	movzx  eax,al
 10001eb:	83 f8 02             	cmp    eax,0x2
 10001ee:	0f 84 36 01 00 00    	je     100032a <main+0x32a>
 10001f4:	83 f8 02             	cmp    eax,0x2
 10001f7:	0f 8f 36 01 00 00    	jg     1000333 <main+0x333>
 10001fd:	85 c0                	test   eax,eax
 10001ff:	74 0e                	je     100020f <main+0x20f>
 1000201:	83 f8 01             	cmp    eax,0x1
 1000204:	0f 84 f3 00 00 00    	je     10002fd <main+0x2fd>
 100020a:	e9 24 01 00 00       	jmp    1000333 <main+0x333>
 100020f:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000212:	83 c0 22             	add    eax,0x22
 1000215:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
 1000218:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
 100021f:	c7 45 d4 00 00 04 00 	mov    DWORD PTR [ebp-0x2c],0x40000
 1000226:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 100022d:	e9 b6 00 00 00       	jmp    10002e8 <main+0x2e8>
 1000232:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000235:	89 d0                	mov    eax,edx
 1000237:	01 c0                	add    eax,eax
 1000239:	01 c2                	add    edx,eax
 100023b:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100023e:	01 d0                	add    eax,edx
 1000240:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000244:	0f b6 c0             	movzx  eax,al
 1000247:	ba ff 00 00 00       	mov    edx,0xff
 100024c:	89 d1                	mov    ecx,edx
 100024e:	29 c1                	sub    ecx,eax
 1000250:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000253:	89 d0                	mov    eax,edx
 1000255:	01 c0                	add    eax,eax
 1000257:	01 c2                	add    edx,eax
 1000259:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100025c:	01 d0                	add    eax,edx
 100025e:	0f b6 40 02          	movzx  eax,BYTE PTR [eax+0x2]
 1000262:	0f b6 d0             	movzx  edx,al
 1000265:	b8 ff 00 00 00       	mov    eax,0xff
 100026a:	29 d0                	sub    eax,edx
 100026c:	89 ce                	mov    esi,ecx
 100026e:	0f af f0             	imul   esi,eax
 1000271:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000274:	89 d0                	mov    eax,edx
 1000276:	01 c0                	add    eax,eax
 1000278:	01 c2                	add    edx,eax
 100027a:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 100027d:	01 d0                	add    eax,edx
 100027f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000282:	0f b6 c8             	movzx  ecx,al
 1000285:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 1000288:	89 d0                	mov    eax,edx
 100028a:	01 c0                	add    eax,eax
 100028c:	01 c2                	add    edx,eax
 100028e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 1000291:	01 d0                	add    eax,edx
 1000293:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000296:	0f b6 c0             	movzx  eax,al
 1000299:	0f af c1             	imul   eax,ecx
 100029c:	01 c6                	add    esi,eax
 100029e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10002a1:	89 d0                	mov    eax,edx
 10002a3:	01 c0                	add    eax,eax
 10002a5:	01 c2                	add    edx,eax
 10002a7:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10002aa:	01 d0                	add    eax,edx
 10002ac:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10002b0:	0f b6 c8             	movzx  ecx,al
 10002b3:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
 10002b6:	89 d0                	mov    eax,edx
 10002b8:	01 c0                	add    eax,eax
 10002ba:	01 c2                	add    edx,eax
 10002bc:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 10002bf:	01 d0                	add    eax,edx
 10002c1:	0f b6 40 01          	movzx  eax,BYTE PTR [eax+0x1]
 10002c5:	0f b6 c0             	movzx  eax,al
 10002c8:	0f af c1             	imul   eax,ecx
 10002cb:	01 f0                	add    eax,esi
 10002cd:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
 10002d0:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10002d3:	3b 45 d4             	cmp    eax,DWORD PTR [ebp-0x2c]
 10002d6:	73 0c                	jae    10002e4 <main+0x2e4>
 10002d8:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 10002db:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 10002de:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
 10002e1:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
 10002e4:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 10002e8:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10002eb:	0f b7 40 20          	movzx  eax,WORD PTR [eax+0x20]
 10002ef:	0f b7 c0             	movzx  eax,ax
 10002f2:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 10002f5:	0f 82 37 ff ff ff    	jb     1000232 <main+0x232>
 10002fb:	eb 3e                	jmp    100033b <main+0x33b>
 10002fd:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000300:	0f b6 40 25          	movzx  eax,BYTE PTR [eax+0x25]
 1000304:	0f b6 c0             	movzx  eax,al
 1000307:	ba 01 00 00 00       	mov    edx,0x1
 100030c:	89 c1                	mov    ecx,eax
 100030e:	d3 e2                	shl    edx,cl
 1000310:	89 d0                	mov    eax,edx
 1000312:	8d 50 ff             	lea    edx,[eax-0x1]
 1000315:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000318:	0f b6 40 24          	movzx  eax,BYTE PTR [eax+0x24]
 100031c:	0f b6 c0             	movzx  eax,al
 100031f:	89 c1                	mov    ecx,eax
 1000321:	d3 e2                	shl    edx,cl
 1000323:	89 d0                	mov    eax,edx
 1000325:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
 1000328:	eb 11                	jmp    100033b <main+0x33b>
 100032a:	c7 45 dc 5c 01 00 00 	mov    DWORD PTR [ebp-0x24],0x15c
 1000331:	eb 08                	jmp    100033b <main+0x33b>
 1000333:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
 100033a:	90                   	nop
 100033b:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
 1000342:	e9 e5 00 00 00       	jmp    100042c <main+0x42c>
 1000347:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100034a:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
 100034e:	0f b6 c0             	movzx  eax,al
 1000351:	83 f8 20             	cmp    eax,0x20
 1000354:	0f 84 ae 00 00 00    	je     1000408 <main+0x408>
 100035a:	83 f8 20             	cmp    eax,0x20
 100035d:	0f 8f c5 00 00 00    	jg     1000428 <main+0x428>
 1000363:	83 f8 18             	cmp    eax,0x18
 1000366:	74 6c                	je     10003d4 <main+0x3d4>
 1000368:	83 f8 18             	cmp    eax,0x18
 100036b:	0f 8f b7 00 00 00    	jg     1000428 <main+0x428>
 1000371:	83 f8 08             	cmp    eax,0x8
 1000374:	74 17                	je     100038d <main+0x38d>
 1000376:	83 f8 08             	cmp    eax,0x8
 1000379:	0f 8c a9 00 00 00    	jl     1000428 <main+0x428>
 100037f:	83 e8 0f             	sub    eax,0xf
 1000382:	83 f8 01             	cmp    eax,0x1
 1000385:	0f 87 9d 00 00 00    	ja     1000428 <main+0x428>
 100038b:	eb 23                	jmp    10003b0 <main+0x3b0>
 100038d:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 1000390:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 1000393:	83 c0 01             	add    eax,0x1
 1000396:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 100039a:	89 c2                	mov    edx,eax
 100039c:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 100039f:	01 d0                	add    eax,edx
 10003a1:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 10003a4:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10003a7:	89 c2                	mov    edx,eax
 10003a9:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 10003ac:	88 10                	mov    BYTE PTR [eax],dl
 10003ae:	eb 78                	jmp    1000428 <main+0x428>
 10003b0:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10003b3:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 10003b6:	83 c0 02             	add    eax,0x2
 10003b9:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 10003bd:	89 c2                	mov    edx,eax
 10003bf:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 10003c2:	01 d0                	add    eax,edx
 10003c4:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 10003c7:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10003ca:	89 c2                	mov    edx,eax
 10003cc:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 10003cf:	66 89 10             	mov    WORD PTR [eax],dx
 10003d2:	eb 54                	jmp    1000428 <main+0x428>
 10003d4:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 10003d7:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 10003da:	83 c0 03             	add    eax,0x3
 10003dd:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 10003e1:	89 c2                	mov    edx,eax
 10003e3:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 10003e6:	01 d0                	add    eax,edx
 10003e8:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
 10003eb:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 10003ee:	25 ff ff ff 00       	and    eax,0xffffff
 10003f3:	89 c2                	mov    edx,eax
 10003f5:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 10003f8:	8b 00                	mov    eax,DWORD PTR [eax]
 10003fa:	25 00 00 00 ff       	and    eax,0xff000000
 10003ff:	09 c2                	or     edx,eax
 1000401:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 1000404:	89 10                	mov    DWORD PTR [eax],edx
 1000406:	eb 20                	jmp    1000428 <main+0x428>
 1000408:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100040b:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
 100040e:	83 c0 04             	add    eax,0x4
 1000411:	0f af 45 d8          	imul   eax,DWORD PTR [ebp-0x28]
 1000415:	89 c2                	mov    edx,eax
 1000417:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 100041a:	01 d0                	add    eax,edx
 100041c:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
 100041f:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 1000422:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
 1000425:	89 10                	mov    DWORD PTR [eax],edx
 1000427:	90                   	nop
 1000428:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
 100042c:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100042f:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
 1000432:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000435:	73 0f                	jae    1000446 <main+0x446>
 1000437:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 100043a:	8b 40 18             	mov    eax,DWORD PTR [eax+0x18]
 100043d:	39 45 d8             	cmp    DWORD PTR [ebp-0x28],eax
 1000440:	0f 82 01 ff ff ff    	jb     1000347 <main+0x347>
 1000446:	90                   	nop
 1000447:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 100044a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 100044d:	83 c0 07             	add    eax,0x7
 1000450:	83 e0 f8             	and    eax,0xfffffff8
 1000453:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000456:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000459:	8b 00                	mov    eax,DWORD PTR [eax]
 100045b:	85 c0                	test   eax,eax
 100045d:	0f 85 03 fc ff ff    	jne    1000066 <main+0x66>
 1000463:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000466:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 1000469:	83 c0 07             	add    eax,0x7
 100046c:	83 e0 f8             	and    eax,0xfffffff8
 100046f:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
 1000472:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 1000475:	2b 43 04             	sub    eax,DWORD PTR [ebx+0x4]
 1000478:	83 ec 08             	sub    esp,0x8
 100047b:	50                   	push   eax
 100047c:	68 67 08 00 01       	push   0x1000867
 1000481:	e8 b9 01 00 00       	call   100063f <printf>
 1000486:	83 c4 10             	add    esp,0x10
 1000489:	eb fe                	jmp    1000489 <main+0x489>

0100048b <init_logging>:
 100048b:	55                   	push   ebp
 100048c:	89 e5                	mov    ebp,esp
 100048e:	c7 05 00 00 40 00 00 	mov    DWORD PTR ds:0x400000,0xb8000
 1000495:	80 0b 00 
 1000498:	c7 05 04 00 40 00 00 	mov    DWORD PTR ds:0x400004,0x0
 100049f:	00 00 00 
 10004a2:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 10004a9:	00 00 00 
 10004ac:	90                   	nop
 10004ad:	5d                   	pop    ebp
 10004ae:	c3                   	ret    

010004af <itoa>:
 10004af:	55                   	push   ebp
 10004b0:	89 e5                	mov    ebp,esp
 10004b2:	83 ec 20             	sub    esp,0x20
 10004b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 10004b8:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 10004bb:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10004be:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10004c1:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
 10004c8:	83 7d 0c 64          	cmp    DWORD PTR [ebp+0xc],0x64
 10004cc:	75 20                	jne    10004ee <itoa+0x3f>
 10004ce:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
 10004d2:	79 1a                	jns    10004ee <itoa+0x3f>
 10004d4:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10004d7:	8d 50 01             	lea    edx,[eax+0x1]
 10004da:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 10004dd:	c6 00 2d             	mov    BYTE PTR [eax],0x2d
 10004e0:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
 10004e4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 10004e7:	f7 d8                	neg    eax
 10004e9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 10004ec:	eb 0d                	jmp    10004fb <itoa+0x4c>
 10004ee:	83 7d 0c 78          	cmp    DWORD PTR [ebp+0xc],0x78
 10004f2:	75 07                	jne    10004fb <itoa+0x4c>
 10004f4:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [ebp-0x14],0x10
 10004fb:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 10004fe:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000501:	ba 00 00 00 00       	mov    edx,0x0
 1000506:	f7 f1                	div    ecx
 1000508:	89 d0                	mov    eax,edx
 100050a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 100050d:	83 7d e8 09          	cmp    DWORD PTR [ebp-0x18],0x9
 1000511:	7f 0a                	jg     100051d <itoa+0x6e>
 1000513:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000516:	83 c0 30             	add    eax,0x30
 1000519:	89 c1                	mov    ecx,eax
 100051b:	eb 08                	jmp    1000525 <itoa+0x76>
 100051d:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 1000520:	83 c0 57             	add    eax,0x57
 1000523:	89 c1                	mov    ecx,eax
 1000525:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000528:	8d 50 01             	lea    edx,[eax+0x1]
 100052b:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 100052e:	88 08                	mov    BYTE PTR [eax],cl
 1000530:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
 1000533:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 1000536:	ba 00 00 00 00       	mov    edx,0x0
 100053b:	f7 f1                	div    ecx
 100053d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 1000540:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 1000544:	75 b5                	jne    10004fb <itoa+0x4c>
 1000546:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000549:	c6 00 00             	mov    BYTE PTR [eax],0x0
 100054c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100054f:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 1000552:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000555:	83 e8 01             	sub    eax,0x1
 1000558:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100055b:	eb 25                	jmp    1000582 <itoa+0xd3>
 100055d:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000560:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000563:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
 1000566:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000569:	0f b6 10             	movzx  edx,BYTE PTR [eax]
 100056c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 100056f:	88 10                	mov    BYTE PTR [eax],dl
 1000571:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 1000574:	0f b6 55 e7          	movzx  edx,BYTE PTR [ebp-0x19]
 1000578:	88 10                	mov    BYTE PTR [eax],dl
 100057a:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
 100057e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
 1000582:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000585:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
 1000588:	72 d3                	jb     100055d <itoa+0xae>
 100058a:	90                   	nop
 100058b:	90                   	nop
 100058c:	c9                   	leave  
 100058d:	c3                   	ret    

0100058e <putchar>:
 100058e:	55                   	push   ebp
 100058f:	89 e5                	mov    ebp,esp
 1000591:	83 7d 08 0a          	cmp    DWORD PTR [ebp+0x8],0xa
 1000595:	74 06                	je     100059d <putchar+0xf>
 1000597:	83 7d 08 0d          	cmp    DWORD PTR [ebp+0x8],0xd
 100059b:	75 31                	jne    10005ce <putchar+0x40>
 100059d:	90                   	nop
 100059e:	eb 01                	jmp    10005a1 <putchar+0x13>
 10005a0:	90                   	nop
 10005a1:	c7 05 04 00 40 00 00 	mov    DWORD PTR ds:0x400004,0x0
 10005a8:	00 00 00 
 10005ab:	a1 08 00 40 00       	mov    eax,ds:0x400008
 10005b0:	83 c0 01             	add    eax,0x1
 10005b3:	a3 08 00 40 00       	mov    ds:0x400008,eax
 10005b8:	a1 08 00 40 00       	mov    eax,ds:0x400008
 10005bd:	83 f8 17             	cmp    eax,0x17
 10005c0:	7e 7a                	jle    100063c <putchar+0xae>
 10005c2:	c7 05 08 00 40 00 00 	mov    DWORD PTR ds:0x400008,0x0
 10005c9:	00 00 00 
 10005cc:	eb 6e                	jmp    100063c <putchar+0xae>
 10005ce:	8b 0d 00 00 40 00    	mov    ecx,DWORD PTR ds:0x400000
 10005d4:	8b 15 08 00 40 00    	mov    edx,DWORD PTR ds:0x400008
 10005da:	89 d0                	mov    eax,edx
 10005dc:	c1 e0 02             	shl    eax,0x2
 10005df:	01 d0                	add    eax,edx
 10005e1:	c1 e0 04             	shl    eax,0x4
 10005e4:	89 c2                	mov    edx,eax
 10005e6:	a1 04 00 40 00       	mov    eax,ds:0x400004
 10005eb:	01 d0                	add    eax,edx
 10005ed:	01 c0                	add    eax,eax
 10005ef:	01 c8                	add    eax,ecx
 10005f1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 10005f4:	88 10                	mov    BYTE PTR [eax],dl
 10005f6:	8b 0d 00 00 40 00    	mov    ecx,DWORD PTR ds:0x400000
 10005fc:	8b 15 08 00 40 00    	mov    edx,DWORD PTR ds:0x400008
 1000602:	89 d0                	mov    eax,edx
 1000604:	c1 e0 02             	shl    eax,0x2
 1000607:	01 d0                	add    eax,edx
 1000609:	c1 e0 04             	shl    eax,0x4
 100060c:	89 c2                	mov    edx,eax
 100060e:	a1 04 00 40 00       	mov    eax,ds:0x400004
 1000613:	01 d0                	add    eax,edx
 1000615:	01 c0                	add    eax,eax
 1000617:	83 c0 01             	add    eax,0x1
 100061a:	01 c8                	add    eax,ecx
 100061c:	c6 00 07             	mov    BYTE PTR [eax],0x7
 100061f:	a1 04 00 40 00       	mov    eax,ds:0x400004
 1000624:	83 c0 01             	add    eax,0x1
 1000627:	a3 04 00 40 00       	mov    ds:0x400004,eax
 100062c:	a1 04 00 40 00       	mov    eax,ds:0x400004
 1000631:	83 f8 4f             	cmp    eax,0x4f
 1000634:	0f 8f 66 ff ff ff    	jg     10005a0 <putchar+0x12>
 100063a:	eb 01                	jmp    100063d <putchar+0xaf>
 100063c:	90                   	nop
 100063d:	5d                   	pop    ebp
 100063e:	c3                   	ret    

0100063f <printf>:
 100063f:	55                   	push   ebp
 1000640:	89 e5                	mov    ebp,esp
 1000642:	83 ec 20             	sub    esp,0x20
 1000645:	8d 45 08             	lea    eax,[ebp+0x8]
 1000648:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
 100064b:	83 45 fc 04          	add    DWORD PTR [ebp-0x4],0x4
 100064f:	e9 ce 00 00 00       	jmp    1000722 <printf+0xe3>
 1000654:	83 7d f4 25          	cmp    DWORD PTR [ebp-0xc],0x25
 1000658:	74 10                	je     100066a <printf+0x2b>
 100065a:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 100065d:	e8 2c ff ff ff       	call   100058e <putchar>
 1000662:	83 c4 04             	add    esp,0x4
 1000665:	e9 b8 00 00 00       	jmp    1000722 <printf+0xe3>
 100066a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 100066d:	8d 50 01             	lea    edx,[eax+0x1]
 1000670:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 1000673:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000676:	0f be c0             	movsx  eax,al
 1000679:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 100067c:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000680:	74 24                	je     10006a6 <printf+0x67>
 1000682:	83 7d f4 78          	cmp    DWORD PTR [ebp-0xc],0x78
 1000686:	0f 8f 81 00 00 00    	jg     100070d <printf+0xce>
 100068c:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000690:	74 14                	je     10006a6 <printf+0x67>
 1000692:	83 7d f4 75          	cmp    DWORD PTR [ebp-0xc],0x75
 1000696:	7f 75                	jg     100070d <printf+0xce>
 1000698:	83 7d f4 64          	cmp    DWORD PTR [ebp-0xc],0x64
 100069c:	74 08                	je     10006a6 <printf+0x67>
 100069e:	83 7d f4 73          	cmp    DWORD PTR [ebp-0xc],0x73
 10006a2:	74 25                	je     10006c9 <printf+0x8a>
 10006a4:	eb 67                	jmp    100070d <printf+0xce>
 10006a6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10006a9:	8d 50 04             	lea    edx,[eax+0x4]
 10006ac:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 10006af:	8b 00                	mov    eax,DWORD PTR [eax]
 10006b1:	50                   	push   eax
 10006b2:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 10006b5:	8d 45 e0             	lea    eax,[ebp-0x20]
 10006b8:	50                   	push   eax
 10006b9:	e8 f1 fd ff ff       	call   10004af <itoa>
 10006be:	83 c4 0c             	add    esp,0xc
 10006c1:	8d 45 e0             	lea    eax,[ebp-0x20]
 10006c4:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10006c7:	eb 1e                	jmp    10006e7 <printf+0xa8>
 10006c9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 10006cc:	8d 50 04             	lea    edx,[eax+0x4]
 10006cf:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 10006d2:	8b 00                	mov    eax,DWORD PTR [eax]
 10006d4:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 10006d7:	83 7d f8 00          	cmp    DWORD PTR [ebp-0x8],0x0
 10006db:	75 09                	jne    10006e6 <printf+0xa7>
 10006dd:	c7 45 f8 a0 08 00 01 	mov    DWORD PTR [ebp-0x8],0x10008a0
 10006e4:	eb 1b                	jmp    1000701 <printf+0xc2>
 10006e6:	90                   	nop
 10006e7:	eb 18                	jmp    1000701 <printf+0xc2>
 10006e9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 10006ec:	8d 50 01             	lea    edx,[eax+0x1]
 10006ef:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
 10006f2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 10006f5:	0f be c0             	movsx  eax,al
 10006f8:	50                   	push   eax
 10006f9:	e8 90 fe ff ff       	call   100058e <putchar>
 10006fe:	83 c4 04             	add    esp,0x4
 1000701:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
 1000704:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 1000707:	84 c0                	test   al,al
 1000709:	75 de                	jne    10006e9 <printf+0xaa>
 100070b:	eb 15                	jmp    1000722 <printf+0xe3>
 100070d:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
 1000710:	8d 50 04             	lea    edx,[eax+0x4]
 1000713:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
 1000716:	8b 00                	mov    eax,DWORD PTR [eax]
 1000718:	50                   	push   eax
 1000719:	e8 70 fe ff ff       	call   100058e <putchar>
 100071e:	83 c4 04             	add    esp,0x4
 1000721:	90                   	nop
 1000722:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 1000725:	8d 50 01             	lea    edx,[eax+0x1]
 1000728:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
 100072b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 100072e:	0f be c0             	movsx  eax,al
 1000731:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 1000734:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 1000738:	0f 85 16 ff ff ff    	jne    1000654 <printf+0x15>
 100073e:	90                   	nop
 100073f:	90                   	nop
 1000740:	c9                   	leave  
 1000741:	c3                   	ret    
