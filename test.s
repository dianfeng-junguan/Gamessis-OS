
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <__main>:
#include <stdio.h>
#include <string.h>

int a=1,b=2,c=0;
char *as="Gamessis OS shell";
int __main(){}
  401000:	f3 0f 1e fa          	endbr64 
  401004:	55                   	push   rbp
  401005:	48 89 e5             	mov    rbp,rsp
  401008:	90                   	nop
  401009:	5d                   	pop    rbp
  40100a:	c3                   	ret    

000000000040100b <main>:
int main(int argc,char** argv){
  40100b:	f3 0f 1e fa          	endbr64 
  40100f:	55                   	push   rbp
  401010:	48 89 e5             	mov    rbp,rsp
  401013:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  40101a:	89 bd 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],edi
  401020:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
    write(2,as,strlen(as));
  401027:	48 8b 05 da 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fda]        # 404008 <as>
  40102e:	48 89 c7             	mov    rdi,rax
  401031:	e8 da 05 00 00       	call   401610 <strlen>
  401036:	48 89 c2             	mov    rdx,rax
  401039:	48 8b 05 c8 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fc8]        # 404008 <as>
  401040:	48 89 c6             	mov    rsi,rax
  401043:	bf 02 00 00 00       	mov    edi,0x2
  401048:	e8 06 02 00 00       	call   401253 <write>
    char cmd[128]={0};
  40104d:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  401054:	00 00 00 00 
  401058:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  40105f:	00 00 00 00 
  401063:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  40106a:	00 
  40106b:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  401072:	00 
  401073:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  40107a:	00 
  40107b:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  401082:	00 
  401083:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  40108a:	00 
  40108b:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  401092:	00 
  401093:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  40109a:	00 
  40109b:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4010a2:	00 
  4010a3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4010aa:	00 
  4010ab:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4010b2:	00 
  4010b3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4010ba:	00 
  4010bb:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4010c2:	00 
  4010c3:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4010ca:	00 
  4010cb:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4010d2:	00 
    while (1)
    {
        memset(cmd,0,128);
  4010d3:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4010da:	ba 80 00 00 00       	mov    edx,0x80
  4010df:	be 00 00 00 00       	mov    esi,0x0
  4010e4:	48 89 c7             	mov    rdi,rax
  4010e7:	e8 44 04 00 00       	call   401530 <memset>
        int p=0;
  4010ec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while (cmd[p]!='\n')
  4010f3:	eb 35                	jmp    40112a <main+0x11f>
        {
            read(1,cmd+p,1);
  4010f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4010f8:	48 98                	cdqe   
  4010fa:	48 8d 95 70 ff ff ff 	lea    rdx,[rbp-0x90]
  401101:	48 01 d0             	add    rax,rdx
  401104:	ba 01 00 00 00       	mov    edx,0x1
  401109:	48 89 c6             	mov    rsi,rax
  40110c:	bf 01 00 00 00       	mov    edi,0x1
  401111:	e8 bd 00 00 00       	call   4011d3 <read>
            p++;
  401116:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(p==128)p=0;
  40111a:	81 7d fc 80 00 00 00 	cmp    DWORD PTR [rbp-0x4],0x80
  401121:	75 07                	jne    40112a <main+0x11f>
  401123:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while (cmd[p]!='\n')
  40112a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  40112d:	48 98                	cdqe   
  40112f:	0f b6 84 05 70 ff ff 	movzx  eax,BYTE PTR [rbp+rax*1-0x90]
  401136:	ff 
  401137:	3c 0a                	cmp    al,0xa
  401139:	75 ba                	jne    4010f5 <main+0xea>
        }
        cmd[p]=0;
  40113b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  40113e:	48 98                	cdqe   
  401140:	c6 84 05 70 ff ff ff 	mov    BYTE PTR [rbp+rax*1-0x90],0x0
  401147:	00 
        write(2,cmd,strlen(cmd));
  401148:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40114f:	48 89 c7             	mov    rdi,rax
  401152:	e8 b9 04 00 00       	call   401610 <strlen>
  401157:	48 89 c2             	mov    rdx,rax
  40115a:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401161:	48 89 c6             	mov    rsi,rax
  401164:	bf 02 00 00 00       	mov    edi,0x2
  401169:	e8 e5 00 00 00       	call   401253 <write>
        if (strcmp(cmd,"version")==0)
  40116e:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401175:	48 8d 15 96 0e 00 00 	lea    rdx,[rip+0xe96]        # 402012 <strlen+0xa02>
  40117c:	48 89 d6             	mov    rsi,rdx
  40117f:	48 89 c7             	mov    rdi,rax
  401182:	e8 39 04 00 00       	call   4015c0 <strcmp>
  401187:	85 c0                	test   eax,eax
  401189:	75 1e                	jne    4011a9 <main+0x19e>
        {
            write(1,"Gamessis OS 1.0.\n",19);
  40118b:	ba 13 00 00 00       	mov    edx,0x13
  401190:	48 8d 05 83 0e 00 00 	lea    rax,[rip+0xe83]        # 40201a <strlen+0xa0a>
  401197:	48 89 c6             	mov    rsi,rax
  40119a:	bf 01 00 00 00       	mov    edi,0x1
  40119f:	e8 af 00 00 00       	call   401253 <write>
  4011a4:	e9 2a ff ff ff       	jmp    4010d3 <main+0xc8>
        }else if(strcmp(cmd,"exit")==0)break;
  4011a9:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011b0:	48 8d 15 75 0e 00 00 	lea    rdx,[rip+0xe75]        # 40202c <strlen+0xa1c>
  4011b7:	48 89 d6             	mov    rsi,rdx
  4011ba:	48 89 c7             	mov    rdi,rax
  4011bd:	e8 fe 03 00 00       	call   4015c0 <strcmp>
  4011c2:	85 c0                	test   eax,eax
  4011c4:	74 05                	je     4011cb <main+0x1c0>
    {
  4011c6:	e9 08 ff ff ff       	jmp    4010d3 <main+0xc8>
        }else if(strcmp(cmd,"exit")==0)break;
  4011cb:	90                   	nop
    }
    
    
    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);
    
    return 0;
  4011cc:	b8 00 00 00 00       	mov    eax,0x0
  4011d1:	c9                   	leave  
  4011d2:	c3                   	ret    

00000000004011d3 <read>:
  4011d3:	f3 0f 1e fa          	endbr64 
  4011d7:	55                   	push   rbp
  4011d8:	48 89 e5             	mov    rbp,rsp
  4011db:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  4011de:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  4011e2:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  4011e6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4011ea:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  4011ee:	8b 4d bc             	mov    ecx,DWORD PTR [rbp-0x44]
  4011f1:	48 63 c9             	movsxd rcx,ecx
  4011f4:	48 c7 45 f8 0d 00 00 	mov    QWORD PTR [rbp-0x8],0xd
  4011fb:	00 
  4011fc:	48 89 4d f0          	mov    QWORD PTR [rbp-0x10],rcx
  401200:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401204:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  401208:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40120f:	00 
  401210:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401217:	00 
  401218:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40121f:	00 
  401220:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401224:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401228:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40122c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401230:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401234:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401238:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40123c:	48 0f 05             	rex.W syscall 
  40123f:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401246:	00 
  401247:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  40124b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  40124f:	48 98                	cdqe   
  401251:	5d                   	pop    rbp
  401252:	c3                   	ret    

0000000000401253 <write>:
  401253:	f3 0f 1e fa          	endbr64 
  401257:	55                   	push   rbp
  401258:	48 89 e5             	mov    rbp,rsp
  40125b:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  40125e:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  401262:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  401266:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40126a:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  40126e:	8b 4d bc             	mov    ecx,DWORD PTR [rbp-0x44]
  401271:	48 63 c9             	movsxd rcx,ecx
  401274:	48 c7 45 f8 0e 00 00 	mov    QWORD PTR [rbp-0x8],0xe
  40127b:	00 
  40127c:	48 89 4d f0          	mov    QWORD PTR [rbp-0x10],rcx
  401280:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401284:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  401288:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40128f:	00 
  401290:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401297:	00 
  401298:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40129f:	00 
  4012a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4012a4:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4012a8:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4012ac:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4012b0:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4012b4:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4012b8:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4012bc:	48 0f 05             	rex.W syscall 
  4012bf:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4012c6:	00 
  4012c7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  4012cb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4012cf:	48 98                	cdqe   
  4012d1:	5d                   	pop    rbp
  4012d2:	c3                   	ret    

00000000004012d3 <pwrite>:
  4012d3:	f3 0f 1e fa          	endbr64 
  4012d7:	55                   	push   rbp
  4012d8:	48 89 e5             	mov    rbp,rsp
  4012db:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  4012de:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  4012e2:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  4012e6:	89 4d b8             	mov    DWORD PTR [rbp-0x48],ecx
  4012e9:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  4012ec:	48 98                	cdqe   
  4012ee:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  4012f2:	48 8b 4d b0          	mov    rcx,QWORD PTR [rbp-0x50]
  4012f6:	8b 75 bc             	mov    esi,DWORD PTR [rbp-0x44]
  4012f9:	48 63 f6             	movsxd rsi,esi
  4012fc:	48 c7 45 f8 0e 00 00 	mov    QWORD PTR [rbp-0x8],0xe
  401303:	00 
  401304:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  401308:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  40130c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  401310:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  401314:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40131b:	00 
  40131c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401323:	00 
  401324:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401328:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40132c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401330:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401334:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401338:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40133c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401340:	48 0f 05             	rex.W syscall 
  401343:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40134a:	00 
  40134b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  40134f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401353:	48 98                	cdqe   
  401355:	5d                   	pop    rbp
  401356:	c3                   	ret    

0000000000401357 <execve>:
  401357:	f3 0f 1e fa          	endbr64 
  40135b:	55                   	push   rbp
  40135c:	48 89 e5             	mov    rbp,rsp
  40135f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401363:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  401367:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  40136b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40136f:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  401373:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
  401377:	48 c7 45 f8 1c 00 00 	mov    QWORD PTR [rbp-0x8],0x1c
  40137e:	00 
  40137f:	48 89 4d f0          	mov    QWORD PTR [rbp-0x10],rcx
  401383:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401387:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  40138b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401392:	00 
  401393:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40139a:	00 
  40139b:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4013a2:	00 
  4013a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013a7:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4013ab:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4013af:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4013b3:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4013b7:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4013bb:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4013bf:	48 0f 05             	rex.W syscall 
  4013c2:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4013c9:	00 
  4013ca:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  4013ce:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4013d2:	5d                   	pop    rbp
  4013d3:	c3                   	ret    

00000000004013d4 <fork>:
  4013d4:	f3 0f 1e fa          	endbr64 
  4013d8:	55                   	push   rbp
  4013d9:	48 89 e5             	mov    rbp,rsp
  4013dc:	48 c7 45 f8 1b 00 00 	mov    QWORD PTR [rbp-0x8],0x1b
  4013e3:	00 
  4013e4:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  4013eb:	00 
  4013ec:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4013f3:	00 
  4013f4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4013fb:	00 
  4013fc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401403:	00 
  401404:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40140b:	00 
  40140c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401413:	00 
  401414:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401418:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40141c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401420:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401424:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401428:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40142c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401430:	48 0f 05             	rex.W syscall 
  401433:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40143a:	00 
  40143b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  40143f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401443:	5d                   	pop    rbp
  401444:	c3                   	ret    

0000000000401445 <vfork>:
  401445:	f3 0f 1e fa          	endbr64 
  401449:	55                   	push   rbp
  40144a:	48 89 e5             	mov    rbp,rsp
  40144d:	48 c7 45 f8 1b 00 00 	mov    QWORD PTR [rbp-0x8],0x1b
  401454:	00 
  401455:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  40145c:	00 
  40145d:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401464:	00 
  401465:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40146c:	00 
  40146d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401474:	00 
  401475:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40147c:	00 
  40147d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401484:	00 
  401485:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401489:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40148d:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401491:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401495:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401499:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40149d:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4014a1:	48 0f 05             	rex.W syscall 
  4014a4:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014ab:	00 
  4014ac:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  4014b0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4014b4:	5d                   	pop    rbp
  4014b5:	c3                   	ret    

00000000004014b6 <close>:
  4014b6:	f3 0f 1e fa          	endbr64 
  4014ba:	55                   	push   rbp
  4014bb:	48 89 e5             	mov    rbp,rsp
  4014be:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  4014c1:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  4014c4:	48 98                	cdqe   
  4014c6:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  4014cd:	00 
  4014ce:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4014d2:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4014d9:	00 
  4014da:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4014e1:	00 
  4014e2:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4014e9:	00 
  4014ea:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4014f1:	00 
  4014f2:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4014f9:	00 
  4014fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4014fe:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401502:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401506:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  40150a:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  40150e:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401512:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401516:	48 0f 05             	rex.W syscall 
  401519:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401520:	00 
  401521:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  401525:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401529:	5d                   	pop    rbp
  40152a:	c3                   	ret    
  40152b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401530 <memset>:
  401530:	f3 0f 1e fa          	endbr64 
  401534:	48 89 f8             	mov    rax,rdi
  401537:	48 85 d2             	test   rdx,rdx
  40153a:	74 77                	je     4015b3 <memset+0x83>
  40153c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401541:	40 88 37             	mov    BYTE PTR [rdi],sil
  401544:	48 83 fa 02          	cmp    rdx,0x2
  401548:	76 69                	jbe    4015b3 <memset+0x83>
  40154a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40154f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  401553:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401558:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  40155c:	48 83 fa 06          	cmp    rdx,0x6
  401560:	76 51                	jbe    4015b3 <memset+0x83>
  401562:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401567:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  40156b:	48 83 fa 08          	cmp    rdx,0x8
  40156f:	76 42                	jbe    4015b3 <memset+0x83>
  401571:	48 f7 df             	neg    rdi
  401574:	44 0f b6 c6          	movzx  r8d,sil
  401578:	c1 e6 18             	shl    esi,0x18
  40157b:	83 e7 03             	and    edi,0x3
  40157e:	45 89 c1             	mov    r9d,r8d
  401581:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  401585:	48 29 fa             	sub    rdx,rdi
  401588:	44 89 c7             	mov    edi,r8d
  40158b:	41 c1 e1 10          	shl    r9d,0x10
  40158f:	c1 e7 08             	shl    edi,0x8
  401592:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401596:	44 09 cf             	or     edi,r9d
  401599:	48 01 ca             	add    rdx,rcx
  40159c:	44 09 c7             	or     edi,r8d
  40159f:	09 fe                	or     esi,edi
  4015a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4015a8:	89 31                	mov    DWORD PTR [rcx],esi
  4015aa:	48 83 c1 04          	add    rcx,0x4
  4015ae:	48 39 ca             	cmp    rdx,rcx
  4015b1:	75 f5                	jne    4015a8 <memset+0x78>
  4015b3:	c3                   	ret    
  4015b4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4015bb:	00 00 00 
  4015be:	66 90                	xchg   ax,ax

00000000004015c0 <strcmp>:
  4015c0:	f3 0f 1e fa          	endbr64 
  4015c4:	48 39 f7             	cmp    rdi,rsi
  4015c7:	74 34                	je     4015fd <strcmp+0x3d>
  4015c9:	48 85 ff             	test   rdi,rdi
  4015cc:	74 38                	je     401606 <strcmp+0x46>
  4015ce:	48 85 f6             	test   rsi,rsi
  4015d1:	74 33                	je     401606 <strcmp+0x46>
  4015d3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4015d6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4015d9:	38 ca                	cmp    dl,cl
  4015db:	75 23                	jne    401600 <strcmp+0x40>
  4015dd:	b8 01 00 00 00       	mov    eax,0x1
  4015e2:	eb 15                	jmp    4015f9 <strcmp+0x39>
  4015e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4015e8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4015ec:	48 83 c0 01          	add    rax,0x1
  4015f0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4015f5:	38 ca                	cmp    dl,cl
  4015f7:	75 07                	jne    401600 <strcmp+0x40>
  4015f9:	84 d2                	test   dl,dl
  4015fb:	75 eb                	jne    4015e8 <strcmp+0x28>
  4015fd:	31 c0                	xor    eax,eax
  4015ff:	c3                   	ret    
  401600:	0f be c2             	movsx  eax,dl
  401603:	29 c8                	sub    eax,ecx
  401605:	c3                   	ret    
  401606:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40160b:	c3                   	ret    
  40160c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401610 <strlen>:
  401610:	f3 0f 1e fa          	endbr64 
  401614:	48 89 fe             	mov    rsi,rdi
  401617:	40 f6 c7 07          	test   dil,0x7
  40161b:	75 0d                	jne    40162a <strlen+0x1a>
  40161d:	eb 21                	jmp    401640 <strlen+0x30>
  40161f:	90                   	nop
  401620:	48 83 c7 01          	add    rdi,0x1
  401624:	40 f6 c7 07          	test   dil,0x7
  401628:	74 16                	je     401640 <strlen+0x30>
  40162a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40162d:	75 f1                	jne    401620 <strlen+0x10>
  40162f:	48 89 f8             	mov    rax,rdi
  401632:	48 29 f0             	sub    rax,rsi
  401635:	c3                   	ret    
  401636:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40163d:	00 00 00 
  401640:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401647:	fe fe fe 
  40164a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401651:	80 80 80 
  401654:	eb 38                	jmp    40168e <strlen+0x7e>
  401656:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40165d:	00 00 00 
  401660:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  401664:	74 3a                	je     4016a0 <strlen+0x90>
  401666:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  40166a:	74 3c                	je     4016a8 <strlen+0x98>
  40166c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  401670:	74 3e                	je     4016b0 <strlen+0xa0>
  401672:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  401676:	74 40                	je     4016b8 <strlen+0xa8>
  401678:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  40167c:	74 42                	je     4016c0 <strlen+0xb0>
  40167e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  401682:	74 44                	je     4016c8 <strlen+0xb8>
  401684:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  401688:	74 46                	je     4016d0 <strlen+0xc0>
  40168a:	48 83 c7 08          	add    rdi,0x8
  40168e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401691:	48 01 c8             	add    rax,rcx
  401694:	48 85 d0             	test   rax,rdx
  401697:	74 f1                	je     40168a <strlen+0x7a>
  401699:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40169c:	75 c2                	jne    401660 <strlen+0x50>
  40169e:	eb 8f                	jmp    40162f <strlen+0x1f>
  4016a0:	48 29 f7             	sub    rdi,rsi
  4016a3:	48 8d 47 01          	lea    rax,[rdi+0x1]
  4016a7:	c3                   	ret    
  4016a8:	48 29 f7             	sub    rdi,rsi
  4016ab:	48 8d 47 02          	lea    rax,[rdi+0x2]
  4016af:	c3                   	ret    
  4016b0:	48 29 f7             	sub    rdi,rsi
  4016b3:	48 8d 47 03          	lea    rax,[rdi+0x3]
  4016b7:	c3                   	ret    
  4016b8:	48 29 f7             	sub    rdi,rsi
  4016bb:	48 8d 47 04          	lea    rax,[rdi+0x4]
  4016bf:	c3                   	ret    
  4016c0:	48 29 f7             	sub    rdi,rsi
  4016c3:	48 8d 47 05          	lea    rax,[rdi+0x5]
  4016c7:	c3                   	ret    
  4016c8:	48 29 f7             	sub    rdi,rsi
  4016cb:	48 8d 47 06          	lea    rax,[rdi+0x6]
  4016cf:	c3                   	ret    
  4016d0:	48 29 f7             	sub    rdi,rsi
  4016d3:	48 8d 47 07          	lea    rax,[rdi+0x7]
  4016d7:	c3                   	ret    
