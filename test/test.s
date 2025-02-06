
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000400030 <__main>:


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int __main() {}
  400030:	f3 0f 1e fa          	endbr64 
  400034:	55                   	push   rbp
  400035:	48 89 e5             	mov    rbp,rsp
  400038:	90                   	nop
  400039:	5d                   	pop    rbp
  40003a:	c3                   	ret    

000000000040003b <main>:
// int   __stack_chk_fail() {}
int main(int argc, char** argv, char** environ)
{
  40003b:	f3 0f 1e fa          	endbr64 
  40003f:	55                   	push   rbp
  400040:	48 89 e5             	mov    rbp,rsp
  400043:	48 81 ec d0 01 00 00 	sub    rsp,0x1d0
  40004a:	89 bd 4c fe ff ff    	mov    DWORD PTR [rbp-0x1b4],edi
  400050:	48 89 b5 40 fe ff ff 	mov    QWORD PTR [rbp-0x1c0],rsi
  400057:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  40005e:	48 8d 05 ab 49 00 00 	lea    rax,[rip+0x49ab]        # 404a10 <b+0x4>
  400065:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    puts("Gamessis OS shell\n");
  400069:	48 8d 05 a7 49 00 00 	lea    rax,[rip+0x49a7]        # 404a17 <b+0xb>
  400070:	48 89 c7             	mov    rdi,rax
  400073:	e8 d8 09 00 00       	call   400a50 <puts>
    char cmd[128]  = {0};
  400078:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  40007f:	00 00 00 00 
  400083:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  40008a:	00 00 00 00 
  40008e:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  400095:	00 00 00 00 
  400099:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  4000a0:	00 00 00 00 
  4000a4:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  4000ab:	00 
  4000ac:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  4000b3:	00 
  4000b4:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  4000bb:	00 
  4000bc:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  4000c3:	00 
  4000c4:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  4000cb:	00 
  4000cc:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  4000d3:	00 
  4000d4:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  4000db:	00 
  4000dc:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4000e3:	00 
  4000e4:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4000eb:	00 
  4000ec:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4000f3:	00 
  4000f4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4000fb:	00 
  4000fc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  400103:	00 
    char path[128] = "/";
  400104:	48 c7 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],0x2f
  40010b:	2f 00 00 00 
  40010f:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
  400116:	00 00 00 00 
  40011a:	48 c7 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],0x0
  400121:	00 00 00 00 
  400125:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x0
  40012c:	00 00 00 00 
  400130:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  400137:	00 00 00 00 
  40013b:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  400142:	00 00 00 00 
  400146:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  40014d:	00 00 00 00 
  400151:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  400158:	00 00 00 00 
  40015c:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  400163:	00 00 00 00 
  400167:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  40016e:	00 00 00 00 
  400172:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  400179:	00 00 00 00 
  40017d:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  400184:	00 00 00 00 
  400188:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  40018f:	00 00 00 00 
  400193:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  40019a:	00 00 00 00 
  40019e:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  4001a5:	00 00 00 00 
  4001a9:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  4001b0:	00 00 00 00 
    while (1) {
        memset(cmd, 0, 128);
  4001b4:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  4001bb:	ba 80 00 00 00       	mov    edx,0x80
  4001c0:	be 00 00 00 00       	mov    esi,0x0
  4001c5:	48 89 c7             	mov    rdi,rax
  4001c8:	e8 33 09 00 00       	call   400b00 <memset>
        int p = 0;
  4001cd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
        printf("%s:>", path);
  4001d4:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
  4001db:	48 89 c6             	mov    rsi,rax
  4001de:	48 8d 05 45 48 00 00 	lea    rax,[rip+0x4845]        # 404a2a <b+0x1e>
  4001e5:	48 89 c7             	mov    rdi,rax
  4001e8:	b8 00 00 00 00       	mov    eax,0x0
  4001ed:	e8 0e 2c 00 00       	call   402e00 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  4001f2:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  4001f9:	48 89 c7             	mov    rdi,rax
  4001fc:	e8 af 08 00 00       	call   400ab0 <gets>
        puts(cmd);
  400201:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  400208:	48 89 c7             	mov    rdi,rax
  40020b:	e8 40 08 00 00       	call   400a50 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400210:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  400217:	48 8d 15 11 48 00 00 	lea    rdx,[rip+0x4811]        # 404a2f <b+0x23>
  40021e:	48 89 d6             	mov    rsi,rdx
  400221:	48 89 c7             	mov    rdi,rax
  400224:	e8 a7 09 00 00       	call   400bd0 <strcmp>
  400229:	85 c0                	test   eax,eax
  40022b:	75 14                	jne    400241 <main+0x206>
            puts("Gamessis OS 1.0.\n");
  40022d:	48 8d 05 03 48 00 00 	lea    rax,[rip+0x4803]        # 404a37 <b+0x2b>
  400234:	48 89 c7             	mov    rdi,rax
  400237:	e8 14 08 00 00       	call   400a50 <puts>
  40023c:	e9 73 ff ff ff       	jmp    4001b4 <main+0x179>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400241:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  400248:	48 8d 15 fa 47 00 00 	lea    rdx,[rip+0x47fa]        # 404a49 <b+0x3d>
  40024f:	48 89 d6             	mov    rsi,rdx
  400252:	48 89 c7             	mov    rdi,rax
  400255:	e8 76 09 00 00       	call   400bd0 <strcmp>
  40025a:	85 c0                	test   eax,eax
  40025c:	0f 84 e4 02 00 00    	je     400546 <main+0x50b>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400262:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  400269:	48 8d 15 de 47 00 00 	lea    rdx,[rip+0x47de]        # 404a4e <b+0x42>
  400270:	48 89 d6             	mov    rsi,rdx
  400273:	48 89 c7             	mov    rdi,rax
  400276:	e8 55 09 00 00       	call   400bd0 <strcmp>
  40027b:	85 c0                	test   eax,eax
  40027d:	75 79                	jne    4002f8 <main+0x2bd>
            // ls
            DIR*           dp = opendir(".");
  40027f:	48 8d 05 cb 47 00 00 	lea    rax,[rip+0x47cb]        # 404a51 <b+0x45>
  400286:	48 89 c7             	mov    rdi,rax
  400289:	e8 22 05 00 00       	call   4007b0 <opendir>
  40028e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            struct dirent* dirp;
            if (!dp) {
  400292:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  400297:	75 38                	jne    4002d1 <main+0x296>
                printf("error opening directory\n");
  400299:	48 8d 05 b3 47 00 00 	lea    rax,[rip+0x47b3]        # 404a53 <b+0x47>
  4002a0:	48 89 c7             	mov    rdi,rax
  4002a3:	b8 00 00 00 00       	mov    eax,0x0
  4002a8:	e8 53 2b 00 00       	call   402e00 <printf>
                continue;
  4002ad:	e9 8f 02 00 00       	jmp    400541 <main+0x506>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  4002b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  4002b6:	48 83 c0 18          	add    rax,0x18
  4002ba:	48 89 c6             	mov    rsi,rax
  4002bd:	48 8d 05 a8 47 00 00 	lea    rax,[rip+0x47a8]        # 404a6c <b+0x60>
  4002c4:	48 89 c7             	mov    rdi,rax
  4002c7:	b8 00 00 00 00       	mov    eax,0x0
  4002cc:	e8 2f 2b 00 00       	call   402e00 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  4002d1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4002d5:	48 89 c7             	mov    rdi,rax
  4002d8:	e8 55 06 00 00       	call   400932 <readdir>
  4002dd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4002e1:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  4002e6:	75 ca                	jne    4002b2 <main+0x277>
            }
            close(dp);
  4002e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4002ec:	89 c7                	mov    edi,eax
  4002ee:	e8 1d 03 00 00       	call   400610 <close>
  4002f3:	e9 bc fe ff ff       	jmp    4001b4 <main+0x179>
        }
        else if (strcmp(cmd, "cd") == 0) {
  4002f8:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  4002ff:	48 8d 15 6a 47 00 00 	lea    rdx,[rip+0x476a]        # 404a70 <b+0x64>
  400306:	48 89 d6             	mov    rsi,rdx
  400309:	48 89 c7             	mov    rdi,rax
  40030c:	e8 bf 08 00 00       	call   400bd0 <strcmp>
  400311:	85 c0                	test   eax,eax
  400313:	0f 85 67 01 00 00    	jne    400480 <main+0x445>
            // cd
            char tmppath[128] = {0};
  400319:	48 c7 85 50 fe ff ff 	mov    QWORD PTR [rbp-0x1b0],0x0
  400320:	00 00 00 00 
  400324:	48 c7 85 58 fe ff ff 	mov    QWORD PTR [rbp-0x1a8],0x0
  40032b:	00 00 00 00 
  40032f:	48 c7 85 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],0x0
  400336:	00 00 00 00 
  40033a:	48 c7 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],0x0
  400341:	00 00 00 00 
  400345:	48 c7 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],0x0
  40034c:	00 00 00 00 
  400350:	48 c7 85 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],0x0
  400357:	00 00 00 00 
  40035b:	48 c7 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],0x0
  400362:	00 00 00 00 
  400366:	48 c7 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],0x0
  40036d:	00 00 00 00 
  400371:	48 c7 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],0x0
  400378:	00 00 00 00 
  40037c:	48 c7 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],0x0
  400383:	00 00 00 00 
  400387:	48 c7 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],0x0
  40038e:	00 00 00 00 
  400392:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x0
  400399:	00 00 00 00 
  40039d:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x0
  4003a4:	00 00 00 00 
  4003a8:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
  4003af:	00 00 00 00 
  4003b3:	48 c7 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],0x0
  4003ba:	00 00 00 00 
  4003be:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
  4003c5:	00 00 00 00 
            printf("enter path:");
  4003c9:	48 8d 05 a3 46 00 00 	lea    rax,[rip+0x46a3]        # 404a73 <b+0x67>
  4003d0:	48 89 c7             	mov    rdi,rax
  4003d3:	b8 00 00 00 00       	mov    eax,0x0
  4003d8:	e8 23 2a 00 00       	call   402e00 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  4003dd:	48 8d 85 50 fe ff ff 	lea    rax,[rbp-0x1b0]
  4003e4:	48 89 c7             	mov    rdi,rax
  4003e7:	e8 c4 06 00 00       	call   400ab0 <gets>
            // TODO chdir待完成
            if (chdir(tmppath) == -1) {
  4003ec:	48 8d 85 50 fe ff ff 	lea    rax,[rbp-0x1b0]
  4003f3:	48 89 c7             	mov    rdi,rax
  4003f6:	e8 d5 05 00 00       	call   4009d0 <chdir>
  4003fb:	83 f8 ff             	cmp    eax,0xffffffff
  4003fe:	75 23                	jne    400423 <main+0x3e8>
                printf("cannot find directory:%s\n", tmppath);
  400400:	48 8d 85 50 fe ff ff 	lea    rax,[rbp-0x1b0]
  400407:	48 89 c6             	mov    rsi,rax
  40040a:	48 8d 05 6e 46 00 00 	lea    rax,[rip+0x466e]        # 404a7f <b+0x73>
  400411:	48 89 c7             	mov    rdi,rax
  400414:	b8 00 00 00 00       	mov    eax,0x0
  400419:	e8 e2 29 00 00       	call   402e00 <printf>
  40041e:	e9 91 fd ff ff       	jmp    4001b4 <main+0x179>
                continue;
            }
            printf("current directory:%s\n", tmppath);
  400423:	48 8d 85 50 fe ff ff 	lea    rax,[rbp-0x1b0]
  40042a:	48 89 c6             	mov    rsi,rax
  40042d:	48 8d 05 65 46 00 00 	lea    rax,[rip+0x4665]        # 404a99 <b+0x8d>
  400434:	48 89 c7             	mov    rdi,rax
  400437:	b8 00 00 00 00       	mov    eax,0x0
  40043c:	e8 bf 29 00 00       	call   402e00 <printf>
            strcat(path, tmppath);
  400441:	48 8d 95 50 fe ff ff 	lea    rdx,[rbp-0x1b0]
  400448:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
  40044f:	48 89 d6             	mov    rsi,rdx
  400452:	48 89 c7             	mov    rdi,rax
  400455:	e8 36 07 00 00       	call   400b90 <strcat>
            strcat(path, "/");
  40045a:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
  400461:	48 89 c7             	mov    rdi,rax
  400464:	e8 b7 07 00 00       	call   400c20 <strlen>
  400469:	48 89 c2             	mov    rdx,rax
  40046c:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
  400473:	48 01 d0             	add    rax,rdx
  400476:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
  40047b:	e9 34 fd ff ff       	jmp    4001b4 <main+0x179>
        }
        else {
            printf("trying to execute...\n");
  400480:	48 8d 05 28 46 00 00 	lea    rax,[rip+0x4628]        # 404aaf <b+0xa3>
  400487:	48 89 c7             	mov    rdi,rax
  40048a:	b8 00 00 00 00       	mov    eax,0x0
  40048f:	e8 6c 29 00 00       	call   402e00 <printf>
            int pid = 0;
  400494:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
            if ((pid = fork()) == 0) {
  40049b:	e8 60 02 00 00       	call   400700 <fork>
  4004a0:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  4004a3:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  4004a7:	75 5c                	jne    400505 <main+0x4ca>
                printf("forked, ready to execve\n");
  4004a9:	48 8d 05 15 46 00 00 	lea    rax,[rip+0x4615]        # 404ac5 <b+0xb9>
  4004b0:	48 89 c7             	mov    rdi,rax
  4004b3:	b8 00 00 00 00       	mov    eax,0x0
  4004b8:	e8 43 29 00 00       	call   402e00 <printf>
                if (execve(cmd, argv, environ) == -1) {
  4004bd:	48 8b 95 38 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1c8]
  4004c4:	48 8b 8d 40 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1c0]
  4004cb:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  4004d2:	48 89 ce             	mov    rsi,rcx
  4004d5:	48 89 c7             	mov    rdi,rax
  4004d8:	e8 33 02 00 00       	call   400710 <execve>
  4004dd:	83 f8 ff             	cmp    eax,0xffffffff
  4004e0:	75 23                	jne    400505 <main+0x4ca>
                    printf("cannot find file:%s\n", cmd);
  4004e2:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  4004e9:	48 89 c6             	mov    rsi,rax
  4004ec:	48 8d 05 eb 45 00 00 	lea    rax,[rip+0x45eb]        # 404ade <b+0xd2>
  4004f3:	48 89 c7             	mov    rdi,rax
  4004f6:	b8 00 00 00 00       	mov    eax,0x0
  4004fb:	e8 00 29 00 00       	call   402e00 <printf>
  400500:	e9 af fc ff ff       	jmp    4001b4 <main+0x179>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  400505:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  400508:	89 c6                	mov    esi,eax
  40050a:	48 8d 05 e2 45 00 00 	lea    rax,[rip+0x45e2]        # 404af3 <b+0xe7>
  400511:	48 89 c7             	mov    rdi,rax
  400514:	b8 00 00 00 00       	mov    eax,0x0
  400519:	e8 e2 28 00 00       	call   402e00 <printf>
            int loc = 0;
  40051e:	c7 85 dc fe ff ff 00 	mov    DWORD PTR [rbp-0x124],0x0
  400525:	00 00 00 

            waitpid(pid, &loc, 0);
  400528:	48 8d 8d dc fe ff ff 	lea    rcx,[rbp-0x124]
  40052f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  400532:	ba 00 00 00 00       	mov    edx,0x0
  400537:	48 89 ce             	mov    rsi,rcx
  40053a:	89 c7                	mov    edi,eax
  40053c:	e8 df 01 00 00       	call   400720 <waitpid>
    while (1) {
  400541:	e9 6e fc ff ff       	jmp    4001b4 <main+0x179>
            break;
  400546:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400547:	b8 00 00 00 00       	mov    eax,0x0
  40054c:	c9                   	leave  
  40054d:	c3                   	ret    
  40054e:	66 90                	xchg   ax,ax

0000000000400550 <reg_dev>:
  400550:	55                   	push   rbp
  400551:	48 89 e5             	mov    rbp,rsp
  400554:	b8 00 00 00 00       	mov    eax,0x0
  400559:	55                   	push   rbp
  40055a:	48 0f 05             	rex.W syscall 
  40055d:	5d                   	pop    rbp
  40055e:	c9                   	leave  
  40055f:	c3                   	ret    

0000000000400560 <dispose_dev>:
  400560:	55                   	push   rbp
  400561:	48 89 e5             	mov    rbp,rsp
  400564:	b8 01 00 00 00       	mov    eax,0x1
  400569:	55                   	push   rbp
  40056a:	48 0f 05             	rex.W syscall 
  40056d:	5d                   	pop    rbp
  40056e:	c9                   	leave  
  40056f:	c3                   	ret    

0000000000400570 <reg_drv>:
  400570:	55                   	push   rbp
  400571:	48 89 e5             	mov    rbp,rsp
  400574:	b8 02 00 00 00       	mov    eax,0x2
  400579:	55                   	push   rbp
  40057a:	48 0f 05             	rex.W syscall 
  40057d:	5d                   	pop    rbp
  40057e:	c9                   	leave  
  40057f:	c3                   	ret    

0000000000400580 <dispose_drv>:
  400580:	55                   	push   rbp
  400581:	48 89 e5             	mov    rbp,rsp
  400584:	b8 03 00 00 00       	mov    eax,0x3
  400589:	55                   	push   rbp
  40058a:	48 0f 05             	rex.W syscall 
  40058d:	5d                   	pop    rbp
  40058e:	c9                   	leave  
  40058f:	c3                   	ret    

0000000000400590 <call_drvfunc>:
  400590:	55                   	push   rbp
  400591:	48 89 e5             	mov    rbp,rsp
  400594:	b8 04 00 00 00       	mov    eax,0x4
  400599:	55                   	push   rbp
  40059a:	48 0f 05             	rex.W syscall 
  40059d:	5d                   	pop    rbp
  40059e:	c9                   	leave  
  40059f:	c3                   	ret    

00000000004005a0 <req_mem>:
  4005a0:	55                   	push   rbp
  4005a1:	48 89 e5             	mov    rbp,rsp
  4005a4:	b8 05 00 00 00       	mov    eax,0x5
  4005a9:	55                   	push   rbp
  4005aa:	48 0f 05             	rex.W syscall 
  4005ad:	5d                   	pop    rbp
  4005ae:	c9                   	leave  
  4005af:	c3                   	ret    

00000000004005b0 <free_mem>:
  4005b0:	55                   	push   rbp
  4005b1:	48 89 e5             	mov    rbp,rsp
  4005b4:	b8 06 00 00 00       	mov    eax,0x6
  4005b9:	55                   	push   rbp
  4005ba:	48 0f 05             	rex.W syscall 
  4005bd:	5d                   	pop    rbp
  4005be:	c9                   	leave  
  4005bf:	c3                   	ret    

00000000004005c0 <reg_proc>:
  4005c0:	55                   	push   rbp
  4005c1:	48 89 e5             	mov    rbp,rsp
  4005c4:	b8 07 00 00 00       	mov    eax,0x7
  4005c9:	55                   	push   rbp
  4005ca:	48 0f 05             	rex.W syscall 
  4005cd:	5d                   	pop    rbp
  4005ce:	c9                   	leave  
  4005cf:	c3                   	ret    

00000000004005d0 <del_proc>:
  4005d0:	55                   	push   rbp
  4005d1:	48 89 e5             	mov    rbp,rsp
  4005d4:	b8 08 00 00 00       	mov    eax,0x8
  4005d9:	55                   	push   rbp
  4005da:	48 0f 05             	rex.W syscall 
  4005dd:	5d                   	pop    rbp
  4005de:	c9                   	leave  
  4005df:	c3                   	ret    

00000000004005e0 <get_proc_addr>:
  4005e0:	55                   	push   rbp
  4005e1:	48 89 e5             	mov    rbp,rsp
  4005e4:	b8 09 00 00 00       	mov    eax,0x9
  4005e9:	55                   	push   rbp
  4005ea:	48 0f 05             	rex.W syscall 
  4005ed:	5d                   	pop    rbp
  4005ee:	c9                   	leave  
  4005ef:	c3                   	ret    

00000000004005f0 <chk_vm>:
  4005f0:	55                   	push   rbp
  4005f1:	48 89 e5             	mov    rbp,rsp
  4005f4:	b8 0a 00 00 00       	mov    eax,0xa
  4005f9:	55                   	push   rbp
  4005fa:	48 0f 05             	rex.W syscall 
  4005fd:	5d                   	pop    rbp
  4005fe:	c9                   	leave  
  4005ff:	c3                   	ret    

0000000000400600 <open>:
  400600:	55                   	push   rbp
  400601:	48 89 e5             	mov    rbp,rsp
  400604:	b8 0b 00 00 00       	mov    eax,0xb
  400609:	55                   	push   rbp
  40060a:	48 0f 05             	rex.W syscall 
  40060d:	5d                   	pop    rbp
  40060e:	c9                   	leave  
  40060f:	c3                   	ret    

0000000000400610 <close>:
  400610:	55                   	push   rbp
  400611:	48 89 e5             	mov    rbp,rsp
  400614:	b8 0c 00 00 00       	mov    eax,0xc
  400619:	55                   	push   rbp
  40061a:	48 0f 05             	rex.W syscall 
  40061d:	5d                   	pop    rbp
  40061e:	c9                   	leave  
  40061f:	c3                   	ret    

0000000000400620 <read>:
  400620:	55                   	push   rbp
  400621:	48 89 e5             	mov    rbp,rsp
  400624:	b8 0d 00 00 00       	mov    eax,0xd
  400629:	55                   	push   rbp
  40062a:	48 0f 05             	rex.W syscall 
  40062d:	5d                   	pop    rbp
  40062e:	c9                   	leave  
  40062f:	c3                   	ret    

0000000000400630 <write>:
  400630:	55                   	push   rbp
  400631:	48 89 e5             	mov    rbp,rsp
  400634:	b8 0e 00 00 00       	mov    eax,0xe
  400639:	55                   	push   rbp
  40063a:	48 0f 05             	rex.W syscall 
  40063d:	5d                   	pop    rbp
  40063e:	c9                   	leave  
  40063f:	c3                   	ret    

0000000000400640 <seek>:
  400640:	55                   	push   rbp
  400641:	48 89 e5             	mov    rbp,rsp
  400644:	b8 0f 00 00 00       	mov    eax,0xf
  400649:	55                   	push   rbp
  40064a:	48 0f 05             	rex.W syscall 
  40064d:	5d                   	pop    rbp
  40064e:	c9                   	leave  
  40064f:	c3                   	ret    

0000000000400650 <tell>:
  400650:	55                   	push   rbp
  400651:	48 89 e5             	mov    rbp,rsp
  400654:	b8 10 00 00 00       	mov    eax,0x10
  400659:	55                   	push   rbp
  40065a:	48 0f 05             	rex.W syscall 
  40065d:	5d                   	pop    rbp
  40065e:	c9                   	leave  
  40065f:	c3                   	ret    

0000000000400660 <reg_vol>:
  400660:	55                   	push   rbp
  400661:	48 89 e5             	mov    rbp,rsp
  400664:	b8 11 00 00 00       	mov    eax,0x11
  400669:	55                   	push   rbp
  40066a:	48 0f 05             	rex.W syscall 
  40066d:	5d                   	pop    rbp
  40066e:	c9                   	leave  
  40066f:	c3                   	ret    

0000000000400670 <free_vol>:
  400670:	55                   	push   rbp
  400671:	48 89 e5             	mov    rbp,rsp
  400674:	b8 12 00 00 00       	mov    eax,0x12
  400679:	55                   	push   rbp
  40067a:	48 0f 05             	rex.W syscall 
  40067d:	5d                   	pop    rbp
  40067e:	c9                   	leave  
  40067f:	c3                   	ret    

0000000000400680 <exec>:
  400680:	55                   	push   rbp
  400681:	48 89 e5             	mov    rbp,rsp
  400684:	b8 13 00 00 00       	mov    eax,0x13
  400689:	55                   	push   rbp
  40068a:	48 0f 05             	rex.W syscall 
  40068d:	5d                   	pop    rbp
  40068e:	c9                   	leave  
  40068f:	c3                   	ret    

0000000000400690 <exit>:
  400690:	55                   	push   rbp
  400691:	48 89 e5             	mov    rbp,rsp
  400694:	b8 14 00 00 00       	mov    eax,0x14
  400699:	55                   	push   rbp
  40069a:	48 0f 05             	rex.W syscall 
  40069d:	5d                   	pop    rbp
  40069e:	c9                   	leave  
  40069f:	c3                   	ret    

00000000004006a0 <abort>:
  4006a0:	55                   	push   rbp
  4006a1:	48 89 e5             	mov    rbp,rsp
  4006a4:	b8 14 00 00 00       	mov    eax,0x14
  4006a9:	55                   	push   rbp
  4006aa:	48 0f 05             	rex.W syscall 
  4006ad:	5d                   	pop    rbp
  4006ae:	c9                   	leave  
  4006af:	c3                   	ret    

00000000004006b0 <call>:
  4006b0:	55                   	push   rbp
  4006b1:	48 89 e5             	mov    rbp,rsp
  4006b4:	b8 15 00 00 00       	mov    eax,0x15
  4006b9:	55                   	push   rbp
  4006ba:	48 0f 05             	rex.W syscall 
  4006bd:	5d                   	pop    rbp
  4006be:	c9                   	leave  
  4006bf:	c3                   	ret    

00000000004006c0 <mkfifo>:
  4006c0:	55                   	push   rbp
  4006c1:	48 89 e5             	mov    rbp,rsp
  4006c4:	b8 16 00 00 00       	mov    eax,0x16
  4006c9:	55                   	push   rbp
  4006ca:	48 0f 05             	rex.W syscall 
  4006cd:	5d                   	pop    rbp
  4006ce:	c9                   	leave  
  4006cf:	c3                   	ret    

00000000004006d0 <brk>:
  4006d0:	55                   	push   rbp
  4006d1:	48 89 e5             	mov    rbp,rsp
  4006d4:	b8 17 00 00 00       	mov    eax,0x17
  4006d9:	55                   	push   rbp
  4006da:	48 0f 05             	rex.W syscall 
  4006dd:	5d                   	pop    rbp
  4006de:	c9                   	leave  
  4006df:	c3                   	ret    

00000000004006e0 <find_dev>:
  4006e0:	55                   	push   rbp
  4006e1:	48 89 e5             	mov    rbp,rsp
  4006e4:	b8 19 00 00 00       	mov    eax,0x19
  4006e9:	55                   	push   rbp
  4006ea:	48 0f 05             	rex.W syscall 
  4006ed:	5d                   	pop    rbp
  4006ee:	c9                   	leave  
  4006ef:	c3                   	ret    

00000000004006f0 <operate_dev>:
  4006f0:	55                   	push   rbp
  4006f1:	48 89 e5             	mov    rbp,rsp
  4006f4:	b8 1a 00 00 00       	mov    eax,0x1a
  4006f9:	55                   	push   rbp
  4006fa:	48 0f 05             	rex.W syscall 
  4006fd:	5d                   	pop    rbp
  4006fe:	c9                   	leave  
  4006ff:	c3                   	ret    

0000000000400700 <fork>:
  400700:	55                   	push   rbp
  400701:	48 89 e5             	mov    rbp,rsp
  400704:	b8 1b 00 00 00       	mov    eax,0x1b
  400709:	55                   	push   rbp
  40070a:	48 0f 05             	rex.W syscall 
  40070d:	5d                   	pop    rbp
  40070e:	c9                   	leave  
  40070f:	c3                   	ret    

0000000000400710 <execve>:
  400710:	55                   	push   rbp
  400711:	48 89 e5             	mov    rbp,rsp
  400714:	b8 1c 00 00 00       	mov    eax,0x1c
  400719:	55                   	push   rbp
  40071a:	48 0f 05             	rex.W syscall 
  40071d:	5d                   	pop    rbp
  40071e:	c9                   	leave  
  40071f:	c3                   	ret    

0000000000400720 <waitpid>:
  400720:	55                   	push   rbp
  400721:	48 89 e5             	mov    rbp,rsp
  400724:	b8 1d 00 00 00       	mov    eax,0x1d
  400729:	55                   	push   rbp
  40072a:	48 0f 05             	rex.W syscall 
  40072d:	5d                   	pop    rbp
  40072e:	c9                   	leave  
  40072f:	c3                   	ret    

0000000000400730 <mmap>:
  400730:	55                   	push   rbp
  400731:	48 89 e5             	mov    rbp,rsp
  400734:	b8 1e 00 00 00       	mov    eax,0x1e
  400739:	55                   	push   rbp
  40073a:	48 0f 05             	rex.W syscall 
  40073d:	5d                   	pop    rbp
  40073e:	c9                   	leave  
  40073f:	c3                   	ret    

0000000000400740 <munmap>:
  400740:	55                   	push   rbp
  400741:	48 89 e5             	mov    rbp,rsp
  400744:	b8 1f 00 00 00       	mov    eax,0x1f
  400749:	55                   	push   rbp
  40074a:	48 0f 05             	rex.W syscall 
  40074d:	5d                   	pop    rbp
  40074e:	c9                   	leave  
  40074f:	c3                   	ret    

0000000000400750 <mknod>:
  400750:	55                   	push   rbp
  400751:	48 89 e5             	mov    rbp,rsp
  400754:	b8 21 00 00 00       	mov    eax,0x21
  400759:	55                   	push   rbp
  40075a:	48 0f 05             	rex.W syscall 
  40075d:	5d                   	pop    rbp
  40075e:	c9                   	leave  
  40075f:	c3                   	ret    

0000000000400760 <kb_readc>:
  400760:	55                   	push   rbp
  400761:	48 89 e5             	mov    rbp,rsp
  400764:	b8 64 00 00 00       	mov    eax,0x64
  400769:	55                   	push   rbp
  40076a:	48 0f 05             	rex.W syscall 
  40076d:	5d                   	pop    rbp
  40076e:	c9                   	leave  
  40076f:	c3                   	ret    

0000000000400770 <remove>:
  400770:	55                   	push   rbp
  400771:	48 89 e5             	mov    rbp,rsp
  400774:	b8 22 00 00 00       	mov    eax,0x22
  400779:	55                   	push   rbp
  40077a:	48 0f 05             	rex.W syscall 
  40077d:	5d                   	pop    rbp
  40077e:	c9                   	leave  
  40077f:	c3                   	ret    

0000000000400780 <sbrk>:
  400780:	55                   	push   rbp
  400781:	48 89 e5             	mov    rbp,rsp
  400784:	b8 23 00 00 00       	mov    eax,0x23
  400789:	55                   	push   rbp
  40078a:	48 0f 05             	rex.W syscall 
  40078d:	5d                   	pop    rbp
  40078e:	c9                   	leave  
  40078f:	c3                   	ret    

0000000000400790 <chkmmap>:
  400790:	55                   	push   rbp
  400791:	48 89 e5             	mov    rbp,rsp
  400794:	b8 24 00 00 00       	mov    eax,0x24
  400799:	55                   	push   rbp
  40079a:	48 0f 05             	rex.W syscall 
  40079d:	5d                   	pop    rbp
  40079e:	c9                   	leave  
  40079f:	c3                   	ret    

00000000004007a0 <_readdir>:
  4007a0:	55                   	push   rbp
  4007a1:	48 89 e5             	mov    rbp,rsp
  4007a4:	b8 25 00 00 00       	mov    eax,0x25
  4007a9:	55                   	push   rbp
  4007aa:	48 0f 05             	rex.W syscall 
  4007ad:	5d                   	pop    rbp
  4007ae:	c9                   	leave  
  4007af:	c3                   	ret    

00000000004007b0 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  4007b0:	f3 0f 1e fa          	endbr64 
  4007b4:	55                   	push   rbp
  4007b5:	48 89 e5             	mov    rbp,rsp
  4007b8:	48 83 ec 20          	sub    rsp,0x20
  4007bc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  4007c0:	bf 20 00 00 00       	mov    edi,0x20
  4007c5:	e8 76 31 00 00       	call   403940 <malloc>
  4007ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  4007ce:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  4007d3:	75 0a                	jne    4007df <opendir+0x2f>
	{
		return NULL;
  4007d5:	b8 00 00 00 00       	mov    eax,0x0
  4007da:	e9 a6 00 00 00       	jmp    400885 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  4007df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4007e3:	be 00 40 00 00       	mov    esi,0x4000
  4007e8:	48 89 c7             	mov    rdi,rax
  4007eb:	e8 10 fe ff ff       	call   400600 <open>
  4007f0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4007f4:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  4007f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4007fa:	8b 00                	mov    eax,DWORD PTR [rax]
  4007fc:	85 c0                	test   eax,eax
  4007fe:	79 13                	jns    400813 <opendir+0x63>
	{
		free(dirp);
  400800:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400804:	48 89 c7             	mov    rdi,rax
  400807:	e8 34 2b 00 00       	call   403340 <free>
		return NULL;
  40080c:	b8 00 00 00 00       	mov    eax,0x0
  400811:	eb 72                	jmp    400885 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  400813:	bf 00 04 00 00       	mov    edi,0x400
  400818:	e8 23 31 00 00       	call   403940 <malloc>
  40081d:	48 89 c2             	mov    rdx,rax
  400820:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400824:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  400828:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40082c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  400830:	48 85 c0             	test   rax,rax
  400833:	75 20                	jne    400855 <opendir+0xa5>
	{
		close(dirp->fd);
  400835:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400839:	8b 00                	mov    eax,DWORD PTR [rax]
  40083b:	89 c7                	mov    edi,eax
  40083d:	e8 ce fd ff ff       	call   400610 <close>
		free(dirp);
  400842:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400846:	48 89 c7             	mov    rdi,rax
  400849:	e8 f2 2a 00 00       	call   403340 <free>
		return NULL;
  40084e:	b8 00 00 00 00       	mov    eax,0x0
  400853:	eb 30                	jmp    400885 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  400855:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400859:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  400860:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400864:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  40086b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40086f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  400876:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40087a:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  400881:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  400885:	c9                   	leave  
  400886:	c3                   	ret    

0000000000400887 <closedir>:

int closedir(DIR* dirp)
{
  400887:	f3 0f 1e fa          	endbr64 
  40088b:	55                   	push   rbp
  40088c:	48 89 e5             	mov    rbp,rsp
  40088f:	48 83 ec 50          	sub    rsp,0x50
  400893:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  400897:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40089c:	75 0a                	jne    4008a8 <closedir+0x21>
	{
		return -1;
  40089e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4008a3:	e9 88 00 00 00       	jmp    400930 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  4008a8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4008ac:	8b 00                	mov    eax,DWORD PTR [rax]
  4008ae:	48 98                	cdqe   
  4008b0:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  4008b7:	00 
  4008b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4008bc:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4008c3:	00 
  4008c4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4008cb:	00 
  4008cc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4008d3:	00 
  4008d4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4008db:	00 
  4008dc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4008e3:	00 
#define SYSCALL_CHKMMAP 36
#define SYSCALL_READDIR 37
#define SYSCALL_CHDIR 38
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  4008e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4008e8:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4008ec:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4008f0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4008f4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4008f8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4008fc:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  400900:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  400903:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40090a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40090b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  40090f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  400913:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  400917:	48 89 c7             	mov    rdi,rax
  40091a:	e8 21 2a 00 00       	call   403340 <free>
	free(dirp);
  40091f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  400923:	48 89 c7             	mov    rdi,rax
  400926:	e8 15 2a 00 00       	call   403340 <free>
	return 0;
  40092b:	b8 00 00 00 00       	mov    eax,0x0
}
  400930:	c9                   	leave  
  400931:	c3                   	ret    

0000000000400932 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  400932:	f3 0f 1e fa          	endbr64 
  400936:	55                   	push   rbp
  400937:	48 89 e5             	mov    rbp,rsp
  40093a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  40093e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  400942:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  400946:	48 89 c2             	mov    rdx,rax
  400949:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40094d:	8b 00                	mov    eax,DWORD PTR [rax]
  40094f:	48 98                	cdqe   
  400951:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  400958:	00 
  400959:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40095d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  400961:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  400968:	00 
  400969:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  400970:	00 
  400971:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  400978:	00 
  400979:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  400980:	00 
        __asm__ volatile(".byte 0x48\n"
  400981:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400985:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  400989:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40098d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  400991:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  400995:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  400999:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40099d:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4009a0:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4009a7:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4009a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4009ac:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4009b0:	85 c0                	test   eax,eax
  4009b2:	79 12                	jns    4009c6 <readdir+0x94>
	{
		dirp->eof = 1;
  4009b4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4009b8:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  4009bf:	b8 00 00 00 00       	mov    eax,0x0
  4009c4:	eb 08                	jmp    4009ce <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  4009c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4009ca:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  4009ce:	5d                   	pop    rbp
  4009cf:	c3                   	ret    

00000000004009d0 <chdir>:
int chdir(const char* name)
{
  4009d0:	f3 0f 1e fa          	endbr64 
  4009d4:	55                   	push   rbp
  4009d5:	48 89 e5             	mov    rbp,rsp
  4009d8:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  4009dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4009e0:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  4009e7:	00 
  4009e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4009ec:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4009f3:	00 
  4009f4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4009fb:	00 
  4009fc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  400a03:	00 
  400a04:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  400a0b:	00 
  400a0c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  400a13:	00 
        __asm__ volatile(".byte 0x48\n"
  400a14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400a18:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  400a1c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  400a20:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  400a24:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  400a28:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  400a2c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  400a30:	48 0f 05             	rex.W syscall 
        long long ret=0;
  400a33:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  400a3a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  400a3b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  400a3f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  400a43:	5d                   	pop    rbp
  400a44:	c3                   	ret    

Disassembly of section .text.puts:

0000000000400a50 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  400a50:	f3 0f 1e fa          	endbr64 
  400a54:	41 54                	push   r12
  400a56:	55                   	push   rbp
  400a57:	48 89 fd             	mov    rbp,rdi
  400a5a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  400a5b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  400a5e:	40 84 ff             	test   dil,dil
  400a61:	74 35                	je     400a98 <puts+0x48>
  400a63:	31 db                	xor    ebx,ebx
  400a65:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  400a68:	e8 f3 25 00 00       	call   403060 <putchar>
  400a6d:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  400a70:	48 83 c3 01          	add    rbx,0x1
  400a74:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  400a79:	40 84 ff             	test   dil,dil
  400a7c:	75 ea                	jne    400a68 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  400a7e:	bf 0a 00 00 00       	mov    edi,0xa
  400a83:	e8 d8 25 00 00       	call   403060 <putchar>
		r++;
  400a88:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  400a8d:	5b                   	pop    rbx
  400a8e:	5d                   	pop    rbp
  400a8f:	41 5c                	pop    r12
  400a91:	c3                   	ret    
  400a92:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400a98:	5b                   	pop    rbx
	return r ? r : EOF;
  400a99:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  400a9e:	5d                   	pop    rbp
  400a9f:	41 5c                	pop    r12
  400aa1:	c3                   	ret    

Disassembly of section .text.gets:

0000000000400ab0 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  400ab0:	f3 0f 1e fa          	endbr64 
  400ab4:	41 54                	push   r12
  400ab6:	49 89 fc             	mov    r12,rdi
  400ab9:	eb 14                	jmp    400acf <gets+0x1f>
  400abb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  400ac0:	3c 08                	cmp    al,0x8
  400ac2:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  400ac7:	4c 0f 44 e2          	cmove  r12,rdx
		}
		str++;
  400acb:	49 83 c4 01          	add    r12,0x1
		read(1, str, 1);
  400acf:	ba 01 00 00 00       	mov    edx,0x1
  400ad4:	4c 89 e6             	mov    rsi,r12
  400ad7:	bf 01 00 00 00       	mov    edi,0x1
  400adc:	31 c0                	xor    eax,eax
  400ade:	e8 3d fb ff ff       	call   400620 <read>
		if(*str == '\n')
  400ae3:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  400ae8:	3c 0a                	cmp    al,0xa
  400aea:	75 d4                	jne    400ac0 <gets+0x10>
	}
	return str;
  400aec:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  400aef:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  400af4:	41 5c                	pop    r12
  400af6:	c3                   	ret    

Disassembly of section .text.memset:

0000000000400b00 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  400b00:	f3 0f 1e fa          	endbr64 
  400b04:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  400b07:	48 85 d2             	test   rdx,rdx
  400b0a:	74 77                	je     400b83 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  400b0c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  400b11:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  400b14:	48 83 fa 02          	cmp    rdx,0x2
  400b18:	76 69                	jbe    400b83 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  400b1a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  400b1f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  400b23:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  400b28:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  400b2c:	48 83 fa 06          	cmp    rdx,0x6
  400b30:	76 51                	jbe    400b83 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  400b32:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  400b37:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  400b3b:	48 83 fa 08          	cmp    rdx,0x8
  400b3f:	76 42                	jbe    400b83 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  400b41:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  400b44:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  400b48:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  400b4b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  400b4e:	45 89 c1             	mov    r9d,r8d
	s += k;
  400b51:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  400b55:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  400b58:	44 89 c7             	mov    edi,r8d
  400b5b:	41 c1 e1 10          	shl    r9d,0x10
  400b5f:	c1 e7 08             	shl    edi,0x8
  400b62:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  400b66:	44 09 cf             	or     edi,r9d
  400b69:	48 01 ca             	add    rdx,rcx
  400b6c:	44 09 c7             	or     edi,r8d
  400b6f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  400b71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  400b78:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  400b7a:	48 83 c1 04          	add    rcx,0x4
  400b7e:	48 39 ca             	cmp    rdx,rcx
  400b81:	75 f5                	jne    400b78 <memset+0x78>
	}

	return dest;
}
  400b83:	c3                   	ret    

Disassembly of section .text.strcat:

0000000000400b90 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  400b90:	f3 0f 1e fa          	endbr64 
  400b94:	41 54                	push   r12
  400b96:	49 89 fc             	mov    r12,rdi
  400b99:	55                   	push   rbp
  400b9a:	48 89 f5             	mov    rbp,rsi
  400b9d:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  400b9e:	e8 7d 00 00 00       	call   400c20 <strlen>
	const size_t srclen = strlen(src);
  400ba3:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  400ba6:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  400ba9:	e8 72 00 00 00       	call   400c20 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  400bae:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  400bb2:	48 89 ee             	mov    rsi,rbp
  400bb5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  400bb9:	e8 c2 2d 00 00       	call   403980 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  400bbe:	4c 89 e0             	mov    rax,r12
  400bc1:	5b                   	pop    rbx
  400bc2:	5d                   	pop    rbp
  400bc3:	41 5c                	pop    r12
  400bc5:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000400bd0 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  400bd0:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  400bd4:	48 39 f7             	cmp    rdi,rsi
  400bd7:	74 34                	je     400c0d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  400bd9:	48 85 ff             	test   rdi,rdi
  400bdc:	74 38                	je     400c16 <strcmp+0x46>
  400bde:	48 85 f6             	test   rsi,rsi
  400be1:	74 33                	je     400c16 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  400be3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  400be6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  400be9:	38 ca                	cmp    dl,cl
  400beb:	75 23                	jne    400c10 <strcmp+0x40>
  400bed:	b8 01 00 00 00       	mov    eax,0x1
  400bf2:	eb 15                	jmp    400c09 <strcmp+0x39>
  400bf4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400bf8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  400bfc:	48 83 c0 01          	add    rax,0x1
  400c00:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  400c05:	38 ca                	cmp    dl,cl
  400c07:	75 07                	jne    400c10 <strcmp+0x40>
		{
			if(*s1 == 0)
  400c09:	84 d2                	test   dl,dl
  400c0b:	75 eb                	jne    400bf8 <strcmp+0x28>
		return 0;
  400c0d:	31 c0                	xor    eax,eax
  400c0f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  400c10:	0f be c2             	movsx  eax,dl
  400c13:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  400c15:	c3                   	ret    
	int r = -1;
  400c16:	b8 ff ff ff ff       	mov    eax,0xffffffff
  400c1b:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000400c20 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  400c20:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  400c24:	48 89 fe             	mov    rsi,rdi
  400c27:	40 f6 c7 07          	test   dil,0x7
  400c2b:	75 0d                	jne    400c3a <strlen+0x1a>
  400c2d:	eb 21                	jmp    400c50 <strlen+0x30>
  400c2f:	90                   	nop
  400c30:	48 83 c7 01          	add    rdi,0x1
  400c34:	40 f6 c7 07          	test   dil,0x7
  400c38:	74 16                	je     400c50 <strlen+0x30>
	{
		if(*p == '\0')
  400c3a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  400c3d:	75 f1                	jne    400c30 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  400c3f:	48 89 f8             	mov    rax,rdi
  400c42:	48 29 f0             	sub    rax,rsi
  400c45:	c3                   	ret    
  400c46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400c4d:	00 00 00 
		if((*lp - mask01) & mask80)
  400c50:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  400c57:	fe fe fe 
  400c5a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  400c61:	80 80 80 
  400c64:	eb 38                	jmp    400c9e <strlen+0x7e>
  400c66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400c6d:	00 00 00 
			testbyte(1);
  400c70:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  400c74:	74 3a                	je     400cb0 <strlen+0x90>
			testbyte(2);
  400c76:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  400c7a:	74 3c                	je     400cb8 <strlen+0x98>
			testbyte(3);
  400c7c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  400c80:	74 3e                	je     400cc0 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  400c82:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  400c86:	74 40                	je     400cc8 <strlen+0xa8>
			testbyte(5);
  400c88:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  400c8c:	74 42                	je     400cd0 <strlen+0xb0>
			testbyte(6);
  400c8e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  400c92:	74 44                	je     400cd8 <strlen+0xb8>
			testbyte(7);
  400c94:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  400c98:	74 46                	je     400ce0 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  400c9a:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  400c9e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  400ca1:	48 01 c8             	add    rax,rcx
  400ca4:	48 85 d0             	test   rax,rdx
  400ca7:	74 f1                	je     400c9a <strlen+0x7a>
			testbyte(0);
  400ca9:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  400cac:	75 c2                	jne    400c70 <strlen+0x50>
  400cae:	eb 8f                	jmp    400c3f <strlen+0x1f>
			testbyte(1);
  400cb0:	48 29 f7             	sub    rdi,rsi
  400cb3:	48 8d 47 01          	lea    rax,[rdi+0x1]
  400cb7:	c3                   	ret    
			testbyte(2);
  400cb8:	48 29 f7             	sub    rdi,rsi
  400cbb:	48 8d 47 02          	lea    rax,[rdi+0x2]
  400cbf:	c3                   	ret    
			testbyte(3);
  400cc0:	48 29 f7             	sub    rdi,rsi
  400cc3:	48 8d 47 03          	lea    rax,[rdi+0x3]
  400cc7:	c3                   	ret    
			testbyte(4);
  400cc8:	48 29 f7             	sub    rdi,rsi
  400ccb:	48 8d 47 04          	lea    rax,[rdi+0x4]
  400ccf:	c3                   	ret    
			testbyte(5);
  400cd0:	48 29 f7             	sub    rdi,rsi
  400cd3:	48 8d 47 05          	lea    rax,[rdi+0x5]
  400cd7:	c3                   	ret    
			testbyte(6);
  400cd8:	48 29 f7             	sub    rdi,rsi
  400cdb:	48 8d 47 06          	lea    rax,[rdi+0x6]
  400cdf:	c3                   	ret    
			testbyte(7);
  400ce0:	48 29 f7             	sub    rdi,rsi
  400ce3:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  400ce7:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000400cf0 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  400cf0:	f3 0f 1e fa          	endbr64 
  400cf4:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  400cf6:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  400cfd:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  400cfe:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  400d05:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  400d06:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  400d09:	48 c1 fd 03          	sar    rbp,0x3
  400d0d:	74 16                	je     400d25 <__libc_init_array+0x35>
  400d0f:	31 db                	xor    ebx,ebx
  400d11:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  400d18:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  400d1c:	48 83 c3 01          	add    rbx,0x1
  400d20:	48 39 dd             	cmp    rbp,rbx
  400d23:	75 f3                	jne    400d18 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  400d25:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  400d2c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400d33:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  400d36:	48 c1 fd 03          	sar    rbp,0x3
  400d3a:	74 11                	je     400d4d <__libc_init_array+0x5d>
  400d3c:	31 db                	xor    ebx,ebx
  400d3e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  400d40:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  400d44:	48 83 c3 01          	add    rbx,0x1
  400d48:	48 39 dd             	cmp    rbp,rbx
  400d4b:	75 f3                	jne    400d40 <__libc_init_array+0x50>
	}
}
  400d4d:	5b                   	pop    rbx
  400d4e:	5d                   	pop    rbp
  400d4f:	41 5c                	pop    r12
  400d51:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000400d60 <__libc_fini_array>:

void __libc_fini_array(void)
{
  400d60:	f3 0f 1e fa          	endbr64 
  400d64:	55                   	push   rbp
  400d65:	53                   	push   rbx
  400d66:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  400d6a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400d71:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  400d78:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  400d7b:	48 c1 fb 03          	sar    rbx,0x3
  400d7f:	74 14                	je     400d95 <__libc_fini_array+0x35>
  400d81:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  400d88:	48 83 eb 01          	sub    rbx,0x1
  400d8c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  400d90:	48 85 db             	test   rbx,rbx
  400d93:	75 f3                	jne    400d88 <__libc_fini_array+0x28>
	}
}
  400d95:	48 83 c4 08          	add    rsp,0x8
  400d99:	5b                   	pop    rbx
  400d9a:	5d                   	pop    rbp
  400d9b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000400da0 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  400da0:	f3 0f 1e fa          	endbr64 
  400da4:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  400da8:	48 c7 c7 03 4b 40 00 	mov    rdi,0x404b03
  400daf:	48 c7 c2 08 4b 40 00 	mov    rdx,0x404b08
  400db6:	31 f6                	xor    esi,esi
  400db8:	48 29 fa             	sub    rdx,rdi
  400dbb:	e8 40 fd ff ff       	call   400b00 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  400dc0:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  400dc4:	e9 27 ff ff ff       	jmp    400cf0 <__libc_init_array>

Disassembly of section .text.entry:

0000000000400dd0 <entry>:
{
  400dd0:	f3 0f 1e fa          	endbr64 
  400dd4:	41 54                	push   r12
  400dd6:	49 89 f4             	mov    r12,rsi
  400dd9:	55                   	push   rbp
  400dda:	89 fd                	mov    ebp,edi
  400ddc:	53                   	push   rbx
  400ddd:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  400de0:	e8 bb ff ff ff       	call   400da0 <CRTStartup>
	environ = _environ;
  400de5:	48 c7 c0 08 4b 40 00 	mov    rax,0x404b08
	__heap_base = sbrk(0);
  400dec:	31 ff                	xor    edi,edi
	environ = _environ;
  400dee:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  400df1:	31 c0                	xor    eax,eax
  400df3:	e8 88 f9 ff ff       	call   400780 <sbrk>
  400df8:	48 c7 c2 90 4b 40 00 	mov    rdx,0x404b90
	return main(argc, argv);
  400dff:	4c 89 e6             	mov    rsi,r12
  400e02:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  400e04:	89 02                	mov    DWORD PTR [rdx],eax
}
  400e06:	5b                   	pop    rbx
  400e07:	5d                   	pop    rbp
  400e08:	41 5c                	pop    r12
	return main(argc, argv);
  400e0a:	e9 2c f2 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

0000000000400e10 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  400e10:	66 48 0f 7e c0       	movq   rax,xmm0
}
  400e15:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000400e20 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  400e20:	e8 eb ff ff ff       	call   400e10 <get_bit_access>
  400e25:	48 c1 e8 3f          	shr    rax,0x3f
}
  400e29:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000400e30 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  400e30:	48 89 f8             	mov    rax,rdi
  400e33:	48 c1 e8 34          	shr    rax,0x34
  400e37:	25 ff 07 00 00       	and    eax,0x7ff
  400e3c:	2d ff 03 00 00       	sub    eax,0x3ff
}
  400e41:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000400e50 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  400e50:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  400e53:	8d 50 01             	lea    edx,[rax+0x1]
  400e56:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  400e59:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  400e5c:	73 22                	jae    400e80 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  400e5e:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  400e61:	48 85 d2             	test   rdx,rdx
  400e64:	74 12                	je     400e78 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  400e66:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  400e6a:	40 0f be fe          	movsx  edi,sil
  400e6e:	4c 89 c6             	mov    rsi,r8
  400e71:	ff e2                	jmp    rdx
  400e73:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  400e78:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  400e7c:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  400e80:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000400e90 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  400e90:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  400e94:	74 0a                	je     400ea0 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  400e96:	c3                   	ret    
  400e97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400e9e:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  400ea0:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  400ea3:	85 d2                	test   edx,edx
  400ea5:	74 ef                	je     400e96 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  400ea7:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  400eab:	48 85 c9             	test   rcx,rcx
  400eae:	74 e6                	je     400e96 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  400eb0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  400eb3:	8d 72 ff             	lea    esi,[rdx-0x1]
  400eb6:	39 c2                	cmp    edx,eax
  400eb8:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  400ebc:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  400ec0:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000400ed0 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  400ed0:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  400ed7:	48 89 f8             	mov    rax,rdi
  return gadget;
  400eda:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  400ee1:	00 
  400ee2:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  400ee9:	00 
  400eea:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  400ef1:	00 
}
  400ef2:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000400f00 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  400f00:	48 83 ec 28          	sub    rsp,0x28
  400f04:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  400f07:	48 89 e7             	mov    rdi,rsp
  400f0a:	e8 c1 ff ff ff       	call   400ed0 <discarding_gadget>
  400f0f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  400f14:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  400f18:	48 85 f6             	test   rsi,rsi
  400f1b:	74 33                	je     400f50 <buffer_gadget+0x50>
  400f1d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  400f22:	48 39 c2             	cmp    rdx,rax
  400f25:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  400f29:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  400f2d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  400f32:	4c 89 c0             	mov    rax,r8
  return result;
  400f35:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  400f3a:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  400f40:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  400f44:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  400f49:	48 83 c4 28          	add    rsp,0x28
  400f4d:	c3                   	ret    
  400f4e:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  400f50:	48 89 ce             	mov    rsi,rcx
  400f53:	eb d4                	jmp    400f29 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000400f60 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  400f60:	48 83 ec 28          	sub    rsp,0x28
  400f64:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  400f67:	48 89 e7             	mov    rdi,rsp
  400f6a:	e8 61 ff ff ff       	call   400ed0 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  400f6f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  400f73:	4c 89 c0             	mov    rax,r8
  return result;
  400f76:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  400f7b:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  400f80:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  400f87:	7f 
  400f88:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  400f8e:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  400f92:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  400f97:	48 83 c4 28          	add    rsp,0x28
  400f9b:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000400fa0 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  400fa0:	48 83 ec 08          	sub    rsp,0x8
  400fa4:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  400fa7:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 401790 <putchar_wrapper>
  400fae:	31 d2                	xor    edx,edx
  400fb0:	e8 ab ff ff ff       	call   400f60 <function_gadget>
}
  400fb5:	4c 89 c8             	mov    rax,r9
  400fb8:	48 83 c4 08          	add    rsp,0x8
  400fbc:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000400fc0 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  400fc0:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  400fc3:	74 33                	je     400ff8 <strnlen_s_+0x38>
  400fc5:	85 f6                	test   esi,esi
  400fc7:	74 2f                	je     400ff8 <strnlen_s_+0x38>
  400fc9:	89 f6                	mov    esi,esi
  400fcb:	48 89 f8             	mov    rax,rdi
  400fce:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  400fd2:	eb 09                	jmp    400fdd <strnlen_s_+0x1d>
  400fd4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400fd8:	48 39 c2             	cmp    rdx,rax
  400fdb:	74 13                	je     400ff0 <strnlen_s_+0x30>
  400fdd:	48 83 c0 01          	add    rax,0x1
  400fe1:	80 38 00             	cmp    BYTE PTR [rax],0x0
  400fe4:	75 f2                	jne    400fd8 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  400fe6:	29 f8                	sub    eax,edi
  400fe8:	c3                   	ret    
  400fe9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400ff0:	89 d0                	mov    eax,edx
  400ff2:	29 f8                	sub    eax,edi
  400ff4:	c3                   	ret    
  400ff5:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  400ff8:	31 c0                	xor    eax,eax
}
  400ffa:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401000 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401000:	83 ef 30             	sub    edi,0x30
  401003:	40 80 ff 09          	cmp    dil,0x9
  401007:	0f 96 c0             	setbe  al
}
  40100a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401010 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401010:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401013:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401016:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401019:	eb 19                	jmp    401034 <atou_+0x24>
  40101b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401020:	48 83 c2 01          	add    rdx,0x1
  401024:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401028:	48 89 16             	mov    QWORD PTR [rsi],rdx
  40102b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  40102f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401034:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401037:	e8 c4 ff ff ff       	call   401000 <is_digit_>
  40103c:	84 c0                	test   al,al
  40103e:	75 e0                	jne    401020 <atou_+0x10>
  }
  return i;
}
  401040:	44 89 c0             	mov    eax,r8d
  401043:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401050 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401050:	41 57                	push   r15
  401052:	44 89 c0             	mov    eax,r8d
  401055:	49 89 ff             	mov    r15,rdi
  401058:	41 56                	push   r14
  40105a:	41 55                	push   r13
  40105c:	41 89 d5             	mov    r13d,edx
  40105f:	41 54                	push   r12
  401061:	49 89 f4             	mov    r12,rsi
  401064:	55                   	push   rbp
  401065:	89 cd                	mov    ebp,ecx
  401067:	53                   	push   rbx
  401068:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  40106c:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401070:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401075:	a8 03                	test   al,0x3
  401077:	75 1b                	jne    401094 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401079:	39 ca                	cmp    edx,ecx
  40107b:	73 17                	jae    401094 <out_rev_+0x44>
  40107d:	89 d3                	mov    ebx,edx
  40107f:	90                   	nop
      putchar_via_gadget(output, ' ');
  401080:	be 20 00 00 00       	mov    esi,0x20
  401085:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401088:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  40108b:	e8 c0 fd ff ff       	call   400e50 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401090:	39 dd                	cmp    ebp,ebx
  401092:	75 ec                	jne    401080 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401094:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401098:	4c 01 e3             	add    rbx,r12
  40109b:	45 85 ed             	test   r13d,r13d
  40109e:	74 17                	je     4010b7 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  4010a0:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  4010a3:	4c 89 ff             	mov    rdi,r15
  4010a6:	e8 a5 fd ff ff       	call   400e50 <putchar_via_gadget>
  while (len) {
  4010ab:	48 89 da             	mov    rdx,rbx
  4010ae:	48 83 eb 01          	sub    rbx,0x1
  4010b2:	49 39 d4             	cmp    r12,rdx
  4010b5:	75 e9                	jne    4010a0 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  4010b7:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  4010bc:	74 2a                	je     4010e8 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  4010be:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  4010c2:	44 29 f2             	sub    edx,r14d
  4010c5:	39 d5                	cmp    ebp,edx
  4010c7:	76 1f                	jbe    4010e8 <out_rev_+0x98>
  4010c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  4010d0:	be 20 00 00 00       	mov    esi,0x20
  4010d5:	4c 89 ff             	mov    rdi,r15
  4010d8:	e8 73 fd ff ff       	call   400e50 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  4010dd:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  4010e1:	44 29 f2             	sub    edx,r14d
  4010e4:	39 ea                	cmp    edx,ebp
  4010e6:	72 e8                	jb     4010d0 <out_rev_+0x80>
    }
  }
}
  4010e8:	48 83 c4 18          	add    rsp,0x18
  4010ec:	5b                   	pop    rbx
  4010ed:	5d                   	pop    rbp
  4010ee:	41 5c                	pop    r12
  4010f0:	41 5d                	pop    r13
  4010f2:	41 5e                	pop    r14
  4010f4:	41 5f                	pop    r15
  4010f6:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401100 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401100:	55                   	push   rbp
  401101:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401104:	83 fa 1f             	cmp    edx,0x1f
{
  401107:	49 89 f3             	mov    r11,rsi
  40110a:	53                   	push   rbx
  40110b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401110:	89 d6                	mov    esi,edx
  401112:	89 cb                	mov    ebx,ecx
  401114:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401119:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  40111c:	41 f6 c0 02          	test   r8b,0x2
  401120:	0f 85 fa 00 00 00    	jne    401220 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401126:	44 89 c2             	mov    edx,r8d
  401129:	83 e2 01             	and    edx,0x1
  40112c:	45 85 d2             	test   r10d,r10d
  40112f:	0f 84 eb 00 00 00    	je     401220 <print_integer_finalization+0x120>
  401135:	85 d2                	test   edx,edx
  401137:	0f 84 e3 00 00 00    	je     401220 <print_integer_finalization+0x120>
  40113d:	84 c9                	test   cl,cl
  40113f:	0f 85 cb 01 00 00    	jne    401310 <print_integer_finalization+0x210>
  401145:	41 f6 c0 0c          	test   r8b,0xc
  401149:	0f 85 c1 01 00 00    	jne    401310 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40114f:	44 39 d6             	cmp    esi,r10d
  401152:	0f 83 c8 00 00 00    	jae    401220 <print_integer_finalization+0x120>
  401158:	84 c0                	test   al,al
  40115a:	0f 84 c0 00 00 00    	je     401220 <print_integer_finalization+0x120>
  401160:	89 f0                	mov    eax,esi
  401162:	89 f2                	mov    edx,esi
  401164:	4c 01 d8             	add    rax,r11
  401167:	eb 0b                	jmp    401174 <print_integer_finalization+0x74>
  401169:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401170:	84 c9                	test   cl,cl
  401172:	74 15                	je     401189 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401174:	83 c2 01             	add    edx,0x1
  401177:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40117a:	83 fa 1f             	cmp    edx,0x1f
  40117d:	0f 96 c1             	setbe  cl
  401180:	48 83 c0 01          	add    rax,0x1
  401184:	44 39 d2             	cmp    edx,r10d
  401187:	72 e7                	jb     401170 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401189:	44 39 ca             	cmp    edx,r9d
  40118c:	73 26                	jae    4011b4 <print_integer_finalization+0xb4>
  40118e:	84 c9                	test   cl,cl
  401190:	74 22                	je     4011b4 <print_integer_finalization+0xb4>
  401192:	89 d0                	mov    eax,edx
  401194:	4c 01 d8             	add    rax,r11
  401197:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40119e:	00 00 
      buf[len++] = '0';
  4011a0:	83 c2 01             	add    edx,0x1
  4011a3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4011a6:	48 83 c0 01          	add    rax,0x1
  4011aa:	41 39 d1             	cmp    r9d,edx
  4011ad:	76 05                	jbe    4011b4 <print_integer_finalization+0xb4>
  4011af:	83 fa 1f             	cmp    edx,0x1f
  4011b2:	76 ec                	jbe    4011a0 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  4011b4:	39 d6                	cmp    esi,edx
  4011b6:	0f 92 c0             	setb   al
  4011b9:	40 80 fd 08          	cmp    bpl,0x8
  4011bd:	0f 94 c1             	sete   cl
  4011c0:	20 c1                	and    cl,al
  4011c2:	74 06                	je     4011ca <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  4011c4:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  4011c8:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  4011ca:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  4011d1:	0f 84 8c 00 00 00    	je     401263 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  4011d7:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  4011de:	74 58                	je     401238 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4011e0:	83 fa 1f             	cmp    edx,0x1f
  4011e3:	0f 96 c0             	setbe  al
  4011e6:	40 80 fd 10          	cmp    bpl,0x10
  4011ea:	0f 84 30 01 00 00    	je     401320 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4011f0:	40 80 fd 02          	cmp    bpl,0x2
  4011f4:	75 0e                	jne    401204 <print_integer_finalization+0x104>
  4011f6:	84 c0                	test   al,al
  4011f8:	74 0a                	je     401204 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  4011fa:	89 d0                	mov    eax,edx
  4011fc:	83 c2 01             	add    edx,0x1
  4011ff:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401204:	83 fa 20             	cmp    edx,0x20
  401207:	75 50                	jne    401259 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401209:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  40120a:	44 89 d1             	mov    ecx,r10d
  40120d:	4c 89 de             	mov    rsi,r11
}
  401210:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401211:	e9 3a fe ff ff       	jmp    401050 <out_rev_>
  401216:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40121d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401220:	44 39 ce             	cmp    esi,r9d
  401223:	89 f2                	mov    edx,esi
  401225:	0f 92 c1             	setb   cl
  401228:	20 c8                	and    al,cl
  40122a:	0f 85 62 ff ff ff    	jne    401192 <print_integer_finalization+0x92>
  401230:	eb 98                	jmp    4011ca <print_integer_finalization+0xca>
  401232:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401238:	85 d2                	test   edx,edx
  40123a:	75 74                	jne    4012b0 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40123c:	40 80 fd 10          	cmp    bpl,0x10
  401240:	0f 84 05 01 00 00    	je     40134b <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401246:	40 80 fd 02          	cmp    bpl,0x2
  40124a:	0f 85 2e 01 00 00    	jne    40137e <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401250:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401254:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401259:	89 d0                	mov    eax,edx
  40125b:	83 c2 01             	add    edx,0x1
  40125e:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401263:	83 fa 20             	cmp    edx,0x20
  401266:	74 a1                	je     401209 <print_integer_finalization+0x109>
    if (negative) {
  401268:	84 db                	test   bl,bl
  40126a:	74 1c                	je     401288 <print_integer_finalization+0x188>
      buf[len++] = '-';
  40126c:	89 d0                	mov    eax,edx
}
  40126e:	5b                   	pop    rbx
      buf[len++] = '-';
  40126f:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401272:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401275:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  40127a:	4c 89 de             	mov    rsi,r11
}
  40127d:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40127e:	e9 cd fd ff ff       	jmp    401050 <out_rev_>
  401283:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401288:	41 f6 c0 04          	test   r8b,0x4
  40128c:	75 62                	jne    4012f0 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  40128e:	41 f6 c0 08          	test   r8b,0x8
  401292:	0f 84 71 ff ff ff    	je     401209 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401298:	89 d0                	mov    eax,edx
  40129a:	83 c2 01             	add    edx,0x1
  40129d:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  4012a2:	e9 62 ff ff ff       	jmp    401209 <print_integer_finalization+0x109>
  4012a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4012ae:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  4012b0:	41 39 d1             	cmp    r9d,edx
  4012b3:	74 09                	je     4012be <print_integer_finalization+0x1be>
  4012b5:	44 39 d2             	cmp    edx,r10d
  4012b8:	0f 85 22 ff ff ff    	jne    4011e0 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  4012be:	84 c0                	test   al,al
  4012c0:	0f 85 99 00 00 00    	jne    40135f <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  4012c6:	40 80 fd 10          	cmp    bpl,0x10
  4012ca:	0f 94 c0             	sete   al
  4012cd:	40 80 fd 02          	cmp    bpl,0x2
  4012d1:	0f 94 c1             	sete   cl
  4012d4:	08 c8                	or     al,cl
  4012d6:	0f 84 04 ff ff ff    	je     4011e0 <print_integer_finalization+0xe0>
  4012dc:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  4012de:	83 da 00             	sbb    edx,0x0
  4012e1:	e9 fa fe ff ff       	jmp    4011e0 <print_integer_finalization+0xe0>
  4012e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4012ed:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  4012f0:	89 d0                	mov    eax,edx
}
  4012f2:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  4012f3:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  4012f6:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  4012f9:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  4012fe:	4c 89 de             	mov    rsi,r11
}
  401301:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401302:	e9 49 fd ff ff       	jmp    401050 <out_rev_>
  401307:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40130e:	00 00 
        width--;
  401310:	41 83 ea 01          	sub    r10d,0x1
  401314:	e9 36 fe ff ff       	jmp    40114f <print_integer_finalization+0x4f>
  401319:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401320:	44 89 c1             	mov    ecx,r8d
  401323:	83 e1 20             	and    ecx,0x20
  401326:	75 0c                	jne    401334 <print_integer_finalization+0x234>
  401328:	84 c0                	test   al,al
  40132a:	75 60                	jne    40138c <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40132c:	85 c9                	test   ecx,ecx
  40132e:	0f 84 d0 fe ff ff    	je     401204 <print_integer_finalization+0x104>
  401334:	84 c0                	test   al,al
  401336:	0f 84 c8 fe ff ff    	je     401204 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  40133c:	89 d0                	mov    eax,edx
  40133e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  401341:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  401346:	e9 b9 fe ff ff       	jmp    401204 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40134b:	41 f6 c0 20          	test   r8b,0x20
  40134f:	75 1f                	jne    401370 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  401351:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  401355:	ba 01 00 00 00       	mov    edx,0x1
  40135a:	e9 fa fe ff ff       	jmp    401259 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  40135f:	83 ea 01             	sub    edx,0x1
  401362:	0f 84 d4 fe ff ff    	je     40123c <print_integer_finalization+0x13c>
  401368:	e9 59 ff ff ff       	jmp    4012c6 <print_integer_finalization+0x1c6>
  40136d:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  401370:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  401374:	ba 01 00 00 00       	mov    edx,0x1
  401379:	e9 db fe ff ff       	jmp    401259 <print_integer_finalization+0x159>
      buf[len++] = '0';
  40137e:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  401382:	ba 01 00 00 00       	mov    edx,0x1
  401387:	e9 dc fe ff ff       	jmp    401268 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  40138c:	89 d0                	mov    eax,edx
  40138e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  401391:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  401396:	e9 69 fe ff ff       	jmp    401204 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

00000000004013a0 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  4013a0:	41 57                	push   r15
  4013a2:	41 56                	push   r14
  4013a4:	41 55                	push   r13
  4013a6:	41 89 cd             	mov    r13d,ecx
  4013a9:	41 54                	push   r12
  4013ab:	49 89 fc             	mov    r12,rdi
  4013ae:	55                   	push   rbp
  4013af:	53                   	push   rbx
  4013b0:	89 d3                	mov    ebx,edx
  4013b2:	48 83 ec 28          	sub    rsp,0x28
  4013b6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  4013bb:	48 85 f6             	test   rsi,rsi
  4013be:	75 48                	jne    401408 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  4013c0:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  4013c7:	0f 85 a3 00 00 00    	jne    401470 <print_integer+0xd0>
      buf[len++] = '0';
  4013cd:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  4013d1:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  4013d5:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  4013da:	48 89 e6             	mov    rsi,rsp
  4013dd:	41 56                	push   r14
  4013df:	0f b6 cb             	movzx  ecx,bl
  4013e2:	4c 89 e7             	mov    rdi,r12
  4013e5:	41 51                	push   r9
  4013e7:	45 89 c1             	mov    r9d,r8d
  4013ea:	45 0f b6 c5          	movzx  r8d,r13b
  4013ee:	e8 0d fd ff ff       	call   401100 <print_integer_finalization>
}
  4013f3:	48 83 c4 38          	add    rsp,0x38
  4013f7:	5b                   	pop    rbx
  4013f8:	5d                   	pop    rbp
  4013f9:	41 5c                	pop    r12
  4013fb:	41 5d                	pop    r13
  4013fd:	41 5e                	pop    r14
  4013ff:	41 5f                	pop    r15
  401401:	c3                   	ret    
  401402:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401408:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  40140b:	44 0f b6 d1          	movzx  r10d,cl
  40140f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  401414:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401419:	83 e0 20             	and    eax,0x20
  40141c:	83 f8 01             	cmp    eax,0x1
  40141f:	45 19 db             	sbb    r11d,r11d
  401422:	41 83 e3 20          	and    r11d,0x20
  401426:	41 83 c3 37          	add    r11d,0x37
  40142a:	eb 07                	jmp    401433 <print_integer+0x93>
  40142c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  401430:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  401433:	31 d2                	xor    edx,edx
  401435:	48 89 f0             	mov    rax,rsi
  401438:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  40143b:	48 83 fa 09          	cmp    rdx,0x9
  40143f:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  401443:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  401447:	89 ca                	mov    edx,ecx
  401449:	41 0f 46 ff          	cmovbe edi,r15d
  40144d:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  401452:	48 83 c1 01          	add    rcx,0x1
  401456:	4c 39 d6             	cmp    rsi,r10
  401459:	0f 82 7b ff ff ff    	jb     4013da <print_integer+0x3a>
  40145f:	83 fa 1f             	cmp    edx,0x1f
  401462:	76 cc                	jbe    401430 <print_integer+0x90>
  401464:	e9 71 ff ff ff       	jmp    4013da <print_integer+0x3a>
  401469:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  401470:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  401473:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  401475:	41 83 e6 ef          	and    r14d,0xffffffef
  401479:	80 f9 10             	cmp    cl,0x10
  40147c:	44 0f 45 f0          	cmovne r14d,eax
  401480:	e9 55 ff ff ff       	jmp    4013da <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000401490 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  401490:	e8 8b f9 ff ff       	call   400e20 <get_sign_bit>
{
  401495:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  401498:	85 c0                	test   eax,eax
  40149a:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  40149d:	74 08                	je     4014a7 <get_components+0x17>
  40149f:	66 0f 57 05 89 34 00 	xorpd  xmm0,XMMWORD PTR [rip+0x3489]        # 404930 <powers_of_10+0x90>
  4014a6:	00 
  number_.integral = (int_fast64_t)abs_number;
  4014a7:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  4014ac:	66 0f ef d2          	pxor   xmm2,xmm2
  4014b0:	66 0f 28 c8          	movapd xmm1,xmm0
  4014b4:	89 f0                	mov    eax,esi
  4014b6:	48 8d 3d e3 33 00 00 	lea    rdi,[rip+0x33e3]        # 4048a0 <powers_of_10>
  4014bd:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  4014c2:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  4014c7:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  4014cb:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  4014cf:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  4014d3:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  4014d8:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  4014dd:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  4014e1:	f2 0f 10 15 57 34 00 	movsd  xmm2,QWORD PTR [rip+0x3457]        # 404940 <powers_of_10+0xa0>
  4014e8:	00 
  4014e9:	66 0f 2f ca          	comisd xmm1,xmm2
  4014ed:	76 51                	jbe    401540 <get_components+0xb0>
    ++number_.fractional;
  4014ef:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  4014f3:	66 0f ef c9          	pxor   xmm1,xmm1
  4014f7:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  4014fc:	66 0f 2f cb          	comisd xmm1,xmm3
  401500:	73 56                	jae    401558 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  401502:	85 f6                	test   esi,esi
  401504:	75 27                	jne    40152d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  401506:	66 0f ef c9          	pxor   xmm1,xmm1
  40150a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40150f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  401513:	66 0f 2f d0          	comisd xmm2,xmm0
  401517:	76 06                	jbe    40151f <get_components+0x8f>
  401519:	66 0f 2f c2          	comisd xmm0,xmm2
  40151d:	76 0e                	jbe    40152d <get_components+0x9d>
  40151f:	48 89 d6             	mov    rsi,rdx
  401522:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  401525:	48 83 fe 01          	cmp    rsi,0x1
  401529:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40152d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  401531:	4c 89 c0             	mov    rax,r8
  return number_;
  401534:	49 89 10             	mov    QWORD PTR [r8],rdx
  401537:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  40153b:	c3                   	ret    
  40153c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  401540:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401544:	7a bc                	jp     401502 <get_components+0x72>
  401546:	75 ba                	jne    401502 <get_components+0x72>
  401548:	48 85 c0             	test   rax,rax
  40154b:	75 13                	jne    401560 <get_components+0xd0>
    ++number_.fractional;
  40154d:	48 83 c0 01          	add    rax,0x1
  401551:	eb af                	jmp    401502 <get_components+0x72>
  401553:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  401558:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  40155c:	31 c0                	xor    eax,eax
  40155e:	eb a2                	jmp    401502 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  401560:	a8 01                	test   al,0x1
  401562:	74 9e                	je     401502 <get_components+0x72>
  401564:	eb e7                	jmp    40154d <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

0000000000401570 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  401570:	66 0f 2f 05 c0 33 00 	comisd xmm0,QWORD PTR [rip+0x33c0]        # 404938 <powers_of_10+0x98>
  401577:	00 
  401578:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  40157c:	73 10                	jae    40158e <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  40157e:	66 0f ef c9          	pxor   xmm1,xmm1
  401582:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  401586:	66 0f 2e c8          	ucomisd xmm1,xmm0
  40158a:	7a 04                	jp     401590 <bastardized_floor+0x20>
  40158c:	75 02                	jne    401590 <bastardized_floor+0x20>
}
  40158e:	c3                   	ret    
  40158f:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  401590:	83 e8 01             	sub    eax,0x1
}
  401593:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

00000000004015a0 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  4015a0:	e8 6b f8 ff ff       	call   400e10 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4015a5:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  4015ac:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  4015af:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  4015b2:	48 89 c7             	mov    rdi,rax
  4015b5:	e8 76 f8 ff ff       	call   400e30 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4015ba:	48 21 ca             	and    rdx,rcx
  4015bd:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  4015c4:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4015c7:	f2 0f 10 1d 91 33 00 	movsd  xmm3,QWORD PTR [rip+0x3391]        # 404960 <powers_of_10+0xc0>
  4015ce:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4015cf:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4015d2:	f2 0f 10 05 76 33 00 	movsd  xmm0,QWORD PTR [rip+0x3376]        # 404950 <powers_of_10+0xb0>
  4015d9:	00 
  double z = (dwba.F - 1.5);
  4015da:	66 48 0f 6e ca       	movq   xmm1,rdx
  4015df:	f2 0f 5c 0d 61 33 00 	subsd  xmm1,QWORD PTR [rip+0x3361]        # 404948 <powers_of_10+0xa8>
  4015e6:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4015e7:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4015eb:	66 0f 28 d1          	movapd xmm2,xmm1
  4015ef:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4015f3:	f2 0f 58 05 5d 33 00 	addsd  xmm0,QWORD PTR [rip+0x335d]        # 404958 <powers_of_10+0xb8>
  4015fa:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4015fb:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4015ff:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  401603:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  401607:	f2 0f 59 15 59 33 00 	mulsd  xmm2,QWORD PTR [rip+0x3359]        # 404968 <powers_of_10+0xc8>
  40160e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40160f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  401613:	f2 0f 59 0d 55 33 00 	mulsd  xmm1,QWORD PTR [rip+0x3355]        # 404970 <powers_of_10+0xd0>
  40161a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40161b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40161f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  401623:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  401627:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

0000000000401630 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  401630:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  401636:	0f 84 b4 00 00 00    	je     4016f0 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  40163c:	66 0f ef d2          	pxor   xmm2,xmm2
  401640:	f2 0f 10 05 38 33 00 	movsd  xmm0,QWORD PTR [rip+0x3338]        # 404980 <powers_of_10+0xe0>
  401647:	00 
  401648:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  40164c:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  401650:	f2 0f 58 05 e8 32 00 	addsd  xmm0,QWORD PTR [rip+0x32e8]        # 404940 <powers_of_10+0xa0>
  401657:	00 
  401658:	e8 13 ff ff ff       	call   401570 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40165d:	f2 0f 10 0d 23 33 00 	movsd  xmm1,QWORD PTR [rip+0x3323]        # 404988 <powers_of_10+0xe8>
  401664:	00 
  401665:	66 0f ef c0          	pxor   xmm0,xmm0
  401669:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  40166d:	f2 0f 59 05 1b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x331b]        # 404990 <powers_of_10+0xf0>
  401674:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  401675:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  401677:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  40167b:	48 05 ff 03 00 00    	add    rax,0x3ff
  401681:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  401685:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40168a:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  40168e:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  401692:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  401696:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  40169a:	f2 0f 58 c1          	addsd  xmm0,xmm1
  40169e:	66 0f 28 e2          	movapd xmm4,xmm2
  4016a2:	f2 0f 5e 25 ee 32 00 	divsd  xmm4,QWORD PTR [rip+0x32ee]        # 404998 <powers_of_10+0xf8>
  4016a9:	00 
  4016aa:	66 0f 28 da          	movapd xmm3,xmm2
  4016ae:	f2 0f 58 25 ea 32 00 	addsd  xmm4,QWORD PTR [rip+0x32ea]        # 4049a0 <powers_of_10+0x100>
  4016b5:	00 
  4016b6:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4016ba:	f2 0f 58 1d e6 32 00 	addsd  xmm3,QWORD PTR [rip+0x32e6]        # 4049a8 <powers_of_10+0x108>
  4016c1:	00 
  4016c2:	f2 0f 5e d3          	divsd  xmm2,xmm3
  4016c6:	f2 0f 10 1d e2 32 00 	movsd  xmm3,QWORD PTR [rip+0x32e2]        # 4049b0 <powers_of_10+0x110>
  4016cd:	00 
  4016ce:	f2 0f 5c d9          	subsd  xmm3,xmm1
  4016d2:	f2 0f 58 d3          	addsd  xmm2,xmm3
  4016d6:	f2 0f 5e c2          	divsd  xmm0,xmm2
  4016da:	f2 0f 58 05 d6 32 00 	addsd  xmm0,QWORD PTR [rip+0x32d6]        # 4049b8 <powers_of_10+0x118>
  4016e1:	00 
  4016e2:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  4016e6:	c3                   	ret    
  4016e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016ee:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  4016f0:	f2 0f 10 05 80 32 00 	movsd  xmm0,QWORD PTR [rip+0x3280]        # 404978 <powers_of_10+0xd8>
  4016f7:	00 
}
  4016f8:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000401700 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  401700:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  401703:	48 8d 0d 7e 2f 00 00 	lea    rcx,[rip+0x2f7e]        # 404688 <memcpy+0xd08>
  40170a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401710:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401713:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  401716:	83 e8 20             	sub    eax,0x20
  401719:	3c 10                	cmp    al,0x10
  40171b:	77 13                	ja     401730 <parse_flags+0x30>
  40171d:	0f b6 c0             	movzx  eax,al
  401720:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  401724:	48 01 c8             	add    rax,rcx
  401727:	3e ff e0             	notrack jmp rax
  40172a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  401730:	44 89 c0             	mov    eax,r8d
  401733:	c3                   	ret    
  401734:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  401738:	41 83 c8 01          	or     r8d,0x1
  40173c:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  401740:	48 89 17             	mov    QWORD PTR [rdi],rdx
  401743:	eb cb                	jmp    401710 <parse_flags+0x10>
  401745:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  401748:	41 83 c8 02          	or     r8d,0x2
  40174c:	48 83 c2 01          	add    rdx,0x1
  401750:	eb ee                	jmp    401740 <parse_flags+0x40>
  401752:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  401758:	41 83 c8 04          	or     r8d,0x4
  40175c:	48 83 c2 01          	add    rdx,0x1
  401760:	eb de                	jmp    401740 <parse_flags+0x40>
  401762:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  401768:	41 83 c8 10          	or     r8d,0x10
  40176c:	48 83 c2 01          	add    rdx,0x1
  401770:	eb ce                	jmp    401740 <parse_flags+0x40>
  401772:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  401778:	41 83 c8 08          	or     r8d,0x8
  40177c:	48 83 c2 01          	add    rdx,0x1
  401780:	eb be                	jmp    401740 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

0000000000401790 <putchar_wrapper>:
{
  401790:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  401794:	40 0f be ff          	movsx  edi,dil
  401798:	e9 e3 18 00 00       	jmp    403080 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

00000000004017a0 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  4017a0:	41 56                	push   r14
  4017a2:	49 89 ca             	mov    r10,rcx
  4017a5:	41 89 d3             	mov    r11d,edx
  4017a8:	41 55                	push   r13
  4017aa:	45 89 c5             	mov    r13d,r8d
  4017ad:	41 54                	push   r12
  4017af:	55                   	push   rbp
  4017b0:	53                   	push   rbx
  4017b1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  4017b6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  4017bb:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  4017bf:	45 85 ed             	test   r13d,r13d
  4017c2:	0f 84 90 00 00 00    	je     401858 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4017c8:	44 89 c0             	mov    eax,r8d
  4017cb:	25 10 10 00 00       	and    eax,0x1010
  4017d0:	3d 00 10 00 00       	cmp    eax,0x1000
  4017d5:	0f 84 05 02 00 00    	je     4019e0 <print_broken_up_decimal.isra.0+0x240>
  4017db:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  4017de:	89 cb                	mov    ebx,ecx
  4017e0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  4017e5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  4017ec:	66 66 66 
  4017ef:	49 01 ec             	add    r12,rbp
  4017f2:	eb 43                	jmp    401837 <print_broken_up_decimal.isra.0+0x97>
  4017f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4017f8:	48 89 f0             	mov    rax,rsi
  4017fb:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  4017fe:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  401802:	49 f7 ed             	imul   r13
  401805:	48 89 f0             	mov    rax,rsi
  401808:	41 29 de             	sub    r14d,ebx
  40180b:	83 c3 01             	add    ebx,0x1
  40180e:	48 c1 f8 3f          	sar    rax,0x3f
  401812:	48 c1 fa 02          	sar    rdx,0x2
  401816:	48 29 c2             	sub    rdx,rax
  401819:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40181d:	48 01 c0             	add    rax,rax
  401820:	48 29 c6             	sub    rsi,rax
  401823:	83 c6 30             	add    esi,0x30
  401826:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40182b:	48 89 d6             	mov    rsi,rdx
  40182e:	48 85 d2             	test   rdx,rdx
  401831:	0f 84 f9 00 00 00    	je     401930 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  401837:	83 fb 20             	cmp    ebx,0x20
  40183a:	75 bc                	jne    4017f8 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  40183c:	44 89 c0             	mov    eax,r8d
  40183f:	83 e0 03             	and    eax,0x3
  401842:	83 f8 01             	cmp    eax,0x1
  401845:	0f 84 35 01 00 00    	je     401980 <print_broken_up_decimal.isra.0+0x1e0>
  40184b:	ba 20 00 00 00       	mov    edx,0x20
  401850:	e9 7d 00 00 00       	jmp    4018d2 <print_broken_up_decimal.isra.0+0x132>
  401855:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  401858:	41 f6 c0 10          	test   r8b,0x10
  40185c:	0f 85 8e 00 00 00    	jne    4018f0 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  401862:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  401869:	66 66 66 
  40186c:	89 ce                	mov    esi,ecx
  40186e:	48 01 ee             	add    rsi,rbp
  401871:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  401878:	83 f9 20             	cmp    ecx,0x20
  40187b:	74 bf                	je     40183c <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  40187d:	48 89 f8             	mov    rax,rdi
  401880:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  401883:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  401887:	48 f7 eb             	imul   rbx
  40188a:	48 89 f8             	mov    rax,rdi
  40188d:	48 c1 f8 3f          	sar    rax,0x3f
  401891:	48 c1 fa 02          	sar    rdx,0x2
  401895:	48 29 c2             	sub    rdx,rax
  401898:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40189c:	48 01 c0             	add    rax,rax
  40189f:	48 29 c7             	sub    rdi,rax
  4018a2:	83 c7 30             	add    edi,0x30
  4018a5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  4018a9:	48 89 d7             	mov    rdi,rdx
  4018ac:	48 85 d2             	test   rdx,rdx
  4018af:	75 c7                	jne    401878 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4018b1:	44 89 c0             	mov    eax,r8d
  4018b4:	83 e0 03             	and    eax,0x3
  4018b7:	83 f8 01             	cmp    eax,0x1
  4018ba:	0f 84 b8 01 00 00    	je     401a78 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4018c0:	83 f9 20             	cmp    ecx,0x20
  4018c3:	74 86                	je     40184b <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  4018c5:	45 84 db             	test   r11b,r11b
  4018c8:	74 46                	je     401910 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  4018ca:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  4018cf:	8d 51 01             	lea    edx,[rcx+0x1]
}
  4018d2:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  4018d3:	48 89 ee             	mov    rsi,rbp
  4018d6:	44 89 c9             	mov    ecx,r9d
}
  4018d9:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  4018da:	4c 89 d7             	mov    rdi,r10
}
  4018dd:	41 5c                	pop    r12
  4018df:	41 5d                	pop    r13
  4018e1:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  4018e3:	e9 68 f7 ff ff       	jmp    401050 <out_rev_>
  4018e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4018ef:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4018f0:	83 f9 20             	cmp    ecx,0x20
  4018f3:	0f 84 43 ff ff ff    	je     40183c <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  4018f9:	89 c8                	mov    eax,ecx
  4018fb:	83 c1 01             	add    ecx,0x1
  4018fe:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  401903:	e9 5a ff ff ff       	jmp    401862 <print_broken_up_decimal.isra.0+0xc2>
  401908:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40190f:	00 
    else if (flags & FLAGS_PLUS) {
  401910:	41 f6 c0 04          	test   r8b,0x4
  401914:	0f 85 3e 01 00 00    	jne    401a58 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40191a:	89 ca                	mov    edx,ecx
  40191c:	41 f6 c0 08          	test   r8b,0x8
  401920:	74 b0                	je     4018d2 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  401922:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  401927:	83 c2 01             	add    edx,0x1
  40192a:	eb a6                	jmp    4018d2 <print_broken_up_decimal.isra.0+0x132>
  40192c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  401930:	83 fb 1f             	cmp    ebx,0x1f
  401933:	77 13                	ja     401948 <print_broken_up_decimal.isra.0+0x1a8>
  401935:	45 85 f6             	test   r14d,r14d
  401938:	89 d8                	mov    eax,ebx
  40193a:	0f 95 c2             	setne  dl
  40193d:	48 01 e8             	add    rax,rbp
  401940:	84 d2                	test   dl,dl
  401942:	75 20                	jne    401964 <print_broken_up_decimal.isra.0+0x1c4>
  401944:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  401948:	83 fb 20             	cmp    ebx,0x20
  40194b:	0f 84 eb fe ff ff    	je     40183c <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  401951:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  401956:	8d 4b 01             	lea    ecx,[rbx+0x1]
  401959:	e9 04 ff ff ff       	jmp    401862 <print_broken_up_decimal.isra.0+0xc2>
  40195e:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  401960:	39 ca                	cmp    edx,ecx
  401962:	74 e4                	je     401948 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  401964:	89 da                	mov    edx,ebx
  401966:	83 c3 01             	add    ebx,0x1
  401969:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  40196c:	48 83 c0 01          	add    rax,0x1
  401970:	83 fb 1f             	cmp    ebx,0x1f
  401973:	76 eb                	jbe    401960 <print_broken_up_decimal.isra.0+0x1c0>
  401975:	eb d1                	jmp    401948 <print_broken_up_decimal.isra.0+0x1a8>
  401977:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40197e:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401980:	45 85 c9             	test   r9d,r9d
  401983:	0f 84 c2 fe ff ff    	je     40184b <print_broken_up_decimal.isra.0+0xab>
  401989:	31 d2                	xor    edx,edx
  40198b:	b9 20 00 00 00       	mov    ecx,0x20
  401990:	45 84 db             	test   r11b,r11b
  401993:	0f 85 cf 00 00 00    	jne    401a68 <print_broken_up_decimal.isra.0+0x2c8>
  401999:	41 f6 c0 0c          	test   r8b,0xc
  40199d:	0f 85 c5 00 00 00    	jne    401a68 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4019a3:	44 39 c9             	cmp    ecx,r9d
  4019a6:	0f 83 14 ff ff ff    	jae    4018c0 <print_broken_up_decimal.isra.0+0x120>
  4019ac:	89 c8                	mov    eax,ecx
  4019ae:	48 01 e8             	add    rax,rbp
  4019b1:	84 d2                	test   dl,dl
  4019b3:	0f 84 07 ff ff ff    	je     4018c0 <print_broken_up_decimal.isra.0+0x120>
  4019b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  4019c0:	83 c1 01             	add    ecx,0x1
  4019c3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4019c6:	48 83 c0 01          	add    rax,0x1
  4019ca:	44 39 c9             	cmp    ecx,r9d
  4019cd:	0f 83 ed fe ff ff    	jae    4018c0 <print_broken_up_decimal.isra.0+0x120>
  4019d3:	83 f9 1f             	cmp    ecx,0x1f
  4019d6:	76 e8                	jbe    4019c0 <print_broken_up_decimal.isra.0+0x220>
  4019d8:	e9 e3 fe ff ff       	jmp    4018c0 <print_broken_up_decimal.isra.0+0x120>
  4019dd:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4019e0:	48 85 f6             	test   rsi,rsi
  4019e3:	0f 8e 79 fe ff ff    	jle    401862 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  4019e9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  4019f0:	cc cc cc 
  4019f3:	48 89 f0             	mov    rax,rsi
  4019f6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  4019fd:	99 99 19 
  401a00:	48 0f af c3          	imul   rax,rbx
  401a04:	48 01 d0             	add    rax,rdx
  401a07:	48 d1 c8             	ror    rax,1
  401a0a:	48 39 d0             	cmp    rax,rdx
  401a0d:	0f 87 c8 fd ff ff    	ja     4017db <print_broken_up_decimal.isra.0+0x3b>
  401a13:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  401a1a:	99 99 19 
  401a1d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  401a20:	48 89 f0             	mov    rax,rsi
  401a23:	49 89 f4             	mov    r12,rsi
        --count;
  401a26:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  401a2a:	48 f7 e3             	mul    rbx
  401a2d:	48 89 d6             	mov    rsi,rdx
  401a30:	48 c1 ee 03          	shr    rsi,0x3
  401a34:	48 89 f0             	mov    rax,rsi
  401a37:	48 0f af c3          	imul   rax,rbx
  401a3b:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  401a3e:	4c 39 f0             	cmp    rax,r14
  401a41:	76 dd                	jbe    401a20 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  401a43:	49 83 fc 09          	cmp    r12,0x9
  401a47:	0f 8f 8e fd ff ff    	jg     4017db <print_broken_up_decimal.isra.0+0x3b>
  401a4d:	e9 10 fe ff ff       	jmp    401862 <print_broken_up_decimal.isra.0+0xc2>
  401a52:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  401a58:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  401a5d:	8d 51 01             	lea    edx,[rcx+0x1]
  401a60:	e9 6d fe ff ff       	jmp    4018d2 <print_broken_up_decimal.isra.0+0x132>
  401a65:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  401a68:	41 83 e9 01          	sub    r9d,0x1
  401a6c:	e9 32 ff ff ff       	jmp    4019a3 <print_broken_up_decimal.isra.0+0x203>
  401a71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401a78:	45 85 c9             	test   r9d,r9d
  401a7b:	0f 84 3f fe ff ff    	je     4018c0 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  401a81:	83 f9 1f             	cmp    ecx,0x1f
  401a84:	0f 96 c2             	setbe  dl
  401a87:	e9 04 ff ff ff       	jmp    401990 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

0000000000401a90 <print_decimal_number>:
{
  401a90:	41 54                	push   r12
  401a92:	49 89 fb             	mov    r11,rdi
  401a95:	41 89 f2             	mov    r10d,esi
  401a98:	4d 89 c4             	mov    r12,r8
  401a9b:	55                   	push   rbp
  401a9c:	89 cd                	mov    ebp,ecx
  401a9e:	53                   	push   rbx
  401a9f:	89 d3                	mov    ebx,edx
  401aa1:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  401aa5:	48 89 e7             	mov    rdi,rsp
  401aa8:	e8 e3 f9 ff ff       	call   401490 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  401aad:	48 83 ec 08          	sub    rsp,0x8
  401ab1:	45 89 d0             	mov    r8d,r10d
  401ab4:	4c 89 d9             	mov    rcx,r11
  401ab7:	41 51                	push   r9
  401ab9:	41 89 d9             	mov    r9d,ebx
  401abc:	41 54                	push   r12
  401abe:	55                   	push   rbp
  401abf:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  401ac4:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  401ac9:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  401ace:	e8 cd fc ff ff       	call   4017a0 <print_broken_up_decimal.isra.0>
}
  401ad3:	48 83 c4 40          	add    rsp,0x40
  401ad7:	5b                   	pop    rbx
  401ad8:	5d                   	pop    rbp
  401ad9:	41 5c                	pop    r12
  401adb:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000401ae0 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  401ae0:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  401ae4:	40 84 ff             	test   dil,dil
  401ae7:	74 17                	je     401b00 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  401ae9:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  401aed:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  401af2:	31 c0                	xor    eax,eax
  401af4:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  401af6:	66 0f 28 c1          	movapd xmm0,xmm1
}
  401afa:	c3                   	ret    
  401afb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  401b00:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  401b04:	e8 07 f3 ff ff       	call   400e10 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  401b09:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  401b0d:	48 89 c7             	mov    rdi,rax
  401b10:	e8 1b f3 ff ff       	call   400e30 <get_exp2>
  401b15:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  401b17:	e8 f4 f2 ff ff       	call   400e10 <get_bit_access>
  401b1c:	48 89 c7             	mov    rdi,rax
  401b1f:	e8 0c f3 ff ff       	call   400e30 <get_exp2>
  401b24:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  401b27:	89 d0                	mov    eax,edx
  401b29:	f7 d8                	neg    eax
  401b2b:	0f 49 d0             	cmovns edx,eax
  401b2e:	44 89 c0             	mov    eax,r8d
  401b31:	f7 d8                	neg    eax
  401b33:	41 0f 48 c0          	cmovs  eax,r8d
  401b37:	39 c2                	cmp    edx,eax
  401b39:	7f 1d                	jg     401b58 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  401b3b:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  401b3f:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  401b44:	31 c0                	xor    eax,eax
}
  401b46:	48 83 c4 08          	add    rsp,0x8
  return result;
  401b4a:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  401b4c:	66 0f 28 c1          	movapd xmm0,xmm1
}
  401b50:	c3                   	ret    
  401b51:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  401b58:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  401b5c:	31 d2                	xor    edx,edx
  return result;
  401b5e:	31 c0                	xor    eax,eax
}
  401b60:	48 83 c4 08          	add    rsp,0x8
  return result;
  401b64:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  401b66:	66 0f 28 c2          	movapd xmm0,xmm2
}
  401b6a:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

0000000000401b70 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  401b70:	40 84 ff             	test   dil,dil
  401b73:	74 0b                	je     401b80 <unapply_scaling.isra.0+0x10>
  401b75:	f2 0f 5e c1          	divsd  xmm0,xmm1
  401b79:	c3                   	ret    
  401b7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401b80:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  401b84:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

0000000000401b90 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  401b90:	40 84 ff             	test   dil,dil
  401b93:	74 0b                	je     401ba0 <apply_scaling.isra.0+0x10>
  401b95:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  401b99:	c3                   	ret    
  401b9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401ba0:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  401ba4:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000401bb0 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  401bb0:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  401bb2:	48 83 ec 08          	sub    rsp,0x8
  401bb6:	49 89 f9             	mov    r9,rdi
  401bb9:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  401bbb:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  401bbe:	66 0f 28 d0          	movapd xmm2,xmm0
  401bc2:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  401bc5:	e8 c6 ff ff ff       	call   401b90 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  401bca:	3d 32 01 00 00       	cmp    eax,0x132
  401bcf:	0f 8f ab 00 00 00    	jg     401c80 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  401bd5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  401bda:	66 0f ef c0          	pxor   xmm0,xmm0
  401bde:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  401be2:	89 d6                	mov    esi,edx
  401be4:	48 8d 05 b5 2c 00 00 	lea    rax,[rip+0x2cb5]        # 4048a0 <powers_of_10>
  401beb:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  401bef:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  401bf4:	e8 77 ff ff ff       	call   401b70 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  401bf9:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  401bfe:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  401c02:	66 0f 28 c3          	movapd xmm0,xmm3
  401c06:	66 0f 28 cc          	movapd xmm1,xmm4
  401c0a:	e8 d1 fe ff ff       	call   401ae0 <update_normalization.isra.0>
  401c0f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  401c13:	89 c7                	mov    edi,eax
  401c15:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  401c19:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  401c1b:	e8 70 ff ff ff       	call   401b90 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  401c20:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  401c24:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  401c29:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  401c2e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  401c32:	66 0f 2f 05 06 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d06]        # 404940 <powers_of_10+0xa0>
  401c39:	00 
  401c3a:	0f 93 c0             	setae  al
  401c3d:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  401c40:	66 0f 2e 05 f8 2c 00 	ucomisd xmm0,QWORD PTR [rip+0x2cf8]        # 404940 <powers_of_10+0xa0>
  401c47:	00 
  401c48:	7a 06                	jp     401c50 <get_normalized_components.isra.0+0xa0>
  401c4a:	75 04                	jne    401c50 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  401c4c:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  401c50:	66 0f ef c0          	pxor   xmm0,xmm0
  401c54:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  401c59:	66 0f 2f c4          	comisd xmm0,xmm4
  401c5d:	73 19                	jae    401c78 <get_normalized_components.isra.0+0xc8>
  return components;
  401c5f:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  401c63:	4c 89 c8             	mov    rax,r9
  return components;
  401c66:	49 89 09             	mov    QWORD PTR [r9],rcx
  401c69:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  401c6d:	48 83 c4 08          	add    rsp,0x8
  401c71:	c3                   	ret    
  401c72:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  401c78:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  401c7c:	31 c0                	xor    eax,eax
  401c7e:	eb df                	jmp    401c5f <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  401c80:	40 84 f6             	test   sil,sil
  401c83:	74 08                	je     401c8d <get_normalized_components.isra.0+0xdd>
  401c85:	66 0f 57 05 a3 2c 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2ca3]        # 404930 <powers_of_10+0x90>
  401c8c:	00 
  401c8d:	89 d6                	mov    esi,edx
  401c8f:	4c 89 cf             	mov    rdi,r9
  401c92:	e8 f9 f7 ff ff       	call   401490 <get_components>
}
  401c97:	4c 89 c8             	mov    rax,r9
  401c9a:	48 83 c4 08          	add    rsp,0x8
  401c9e:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000401ca0 <print_exponential_number>:
{
  401ca0:	41 57                	push   r15
  401ca2:	41 89 f3             	mov    r11d,esi
  401ca5:	66 0f 28 f0          	movapd xmm6,xmm0
  401ca9:	41 56                	push   r14
  401cab:	41 55                	push   r13
  401cad:	49 89 fd             	mov    r13,rdi
  401cb0:	41 54                	push   r12
  401cb2:	41 89 d4             	mov    r12d,edx
  401cb5:	55                   	push   rbp
  401cb6:	89 cd                	mov    ebp,ecx
  401cb8:	53                   	push   rbx
  401cb9:	48 83 ec 38          	sub    rsp,0x38
  401cbd:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  401cc1:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  401cc6:	e8 55 f1 ff ff       	call   400e20 <get_sign_bit>
  401ccb:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  401ccd:	85 c0                	test   eax,eax
  401ccf:	74 08                	je     401cd9 <print_exponential_number+0x39>
  401cd1:	66 0f 57 35 57 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c57]        # 404930 <powers_of_10+0x90>
  401cd8:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  401cd9:	41 89 e8             	mov    r8d,ebp
  401cdc:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  401ce3:	66 0f 2e 35 4d 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2c4d]        # 404938 <powers_of_10+0x98>
  401cea:	00 
  401ceb:	0f 8a 9f 00 00 00    	jp     401d90 <print_exponential_number+0xf0>
  401cf1:	0f 85 99 00 00 00    	jne    401d90 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  401cf7:	45 85 c0             	test   r8d,r8d
  401cfa:	0f 85 18 01 00 00    	jne    401e18 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  401d00:	85 f6                	test   esi,esi
  401d02:	0f 84 63 03 00 00    	je     40206b <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  401d08:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  401d0a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  401d0d:	66 0f 57 35 1b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c1b]        # 404930 <powers_of_10+0x90>
  401d14:	00 
  401d15:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401d1a:	44 89 de             	mov    esi,r11d
  401d1d:	66 0f 28 c6          	movapd xmm0,xmm6
  401d21:	e8 6a f7 ff ff       	call   401490 <get_components>
  401d26:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401d2b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401d30:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  401d35:	45 84 ff             	test   r15b,r15b
  401d38:	0f 84 49 01 00 00    	je     401e87 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  401d3e:	f7 c5 00 10 00 00    	test   ebp,0x1000
  401d44:	74 09                	je     401d4f <print_exponential_number+0xaf>
  401d46:	83 fb ff             	cmp    ebx,0xffffffff
  401d49:	0f 8d d1 02 00 00    	jge    402020 <print_exponential_number+0x380>
        width - exp10_part_width :
  401d4f:	45 85 e4             	test   r12d,r12d
  401d52:	0f 84 98 02 00 00    	je     401ff0 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401d58:	48 83 ec 08          	sub    rsp,0x8
  401d5c:	45 89 e1             	mov    r9d,r12d
  401d5f:	45 89 d8             	mov    r8d,r11d
  401d62:	4c 89 e9             	mov    rcx,r13
  401d65:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401d69:	50                   	push   rax
  401d6a:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  401d6e:	55                   	push   rbp
  401d6f:	e8 2c fa ff ff       	call   4017a0 <print_broken_up_decimal.isra.0>
  401d74:	48 83 c4 20          	add    rsp,0x20
}
  401d78:	48 83 c4 38          	add    rsp,0x38
  401d7c:	5b                   	pop    rbx
  401d7d:	5d                   	pop    rbp
  401d7e:	41 5c                	pop    r12
  401d80:	41 5d                	pop    r13
  401d82:	41 5e                	pop    r14
  401d84:	41 5f                	pop    r15
  401d86:	c3                   	ret    
  401d87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401d8e:	00 00 
    double exp10 = log10_of_positive(abs_number);
  401d90:	66 0f 28 c6          	movapd xmm0,xmm6
  401d94:	e8 07 f8 ff ff       	call   4015a0 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  401d99:	e8 d2 f7 ff ff       	call   401570 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  401d9e:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  401da0:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  401da2:	e8 89 f8 ff ff       	call   401630 <pow10_of_int>
    if (abs_number < p10) {
  401da7:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  401dab:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  401daf:	76 0b                	jbe    401dbc <print_exponential_number+0x11c>
      floored_exp10--;
  401db1:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  401db4:	f2 0f 5e 0d e4 2b 00 	divsd  xmm1,QWORD PTR [rip+0x2be4]        # 4049a0 <powers_of_10+0x100>
  401dbb:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  401dbc:	8d 43 11             	lea    eax,[rbx+0x11]
  401dbf:	83 f8 22             	cmp    eax,0x22
  401dc2:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  401dc5:	77 15                	ja     401ddc <print_exponential_number+0x13c>
  401dc7:	89 d8                	mov    eax,ebx
  401dc9:	48 8d 15 d0 2a 00 00 	lea    rdx,[rip+0x2ad0]        # 4048a0 <powers_of_10>
  401dd0:	f7 d8                	neg    eax
  401dd2:	0f 48 c3             	cmovs  eax,ebx
  401dd5:	48 98                	cdqe   
  401dd7:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  401ddc:	89 d8                	mov    eax,ebx
  401dde:	c1 e8 1f             	shr    eax,0x1f
  401de1:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  401de3:	85 db                	test   ebx,ebx
  401de5:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  401de8:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  401deb:	45 85 c0             	test   r8d,r8d
  401dee:	74 62                	je     401e52 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  401df0:	45 85 db             	test   r11d,r11d
  401df3:	b8 01 00 00 00       	mov    eax,0x1
  401df8:	41 0f 45 c3          	cmovne eax,r11d
  401dfc:	39 c3                	cmp    ebx,eax
  401dfe:	0f 9c c0             	setl   al
  401e01:	83 fb fc             	cmp    ebx,0xfffffffc
  401e04:	40 0f 9d c7          	setge  dil
  401e08:	21 f8                	and    eax,edi
  401e0a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  401e0d:	44 09 fa             	or     edx,r15d
  401e10:	eb 21                	jmp    401e33 <print_exponential_number+0x193>
  401e12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  401e18:	45 85 db             	test   r11d,r11d
  401e1b:	b8 01 00 00 00       	mov    eax,0x1
  401e20:	ba 01 00 00 00       	mov    edx,0x1
  401e25:	41 0f 45 c3          	cmovne eax,r11d
  401e29:	85 c0                	test   eax,eax
  401e2b:	41 0f 9f c7          	setg   r15b
  401e2f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  401e31:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  401e33:	41 83 eb 01          	sub    r11d,0x1
  401e37:	44 89 df             	mov    edi,r11d
  401e3a:	29 df                	sub    edi,ebx
  401e3c:	45 84 ff             	test   r15b,r15b
  401e3f:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  401e43:	31 ff                	xor    edi,edi
  401e45:	45 85 db             	test   r11d,r11d
  401e48:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  401e4c:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  401e52:	84 d2                	test   dl,dl
  401e54:	0f 85 86 01 00 00    	jne    401fe0 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  401e5a:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  401e5c:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401e61:	44 89 da             	mov    edx,r11d
  401e64:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  401e67:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  401e6b:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  401e6f:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  401e73:	e8 38 fd ff ff       	call   401bb0 <get_normalized_components.isra.0>
  401e78:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401e7d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401e82:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  401e87:	48 83 ff 09          	cmp    rdi,0x9
  401e8b:	7e 0a                	jle    401e97 <print_exponential_number+0x1f7>
      floored_exp10++;
  401e8d:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  401e90:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  401e92:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  401e97:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  401e9a:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  401e9d:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  401ea1:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  401ea7:	77 47                	ja     401ef0 <print_exponential_number+0x250>
      0U :
  401ea9:	45 85 d2             	test   r10d,r10d
  401eac:	0f 84 9e 01 00 00    	je     402050 <print_exponential_number+0x3b0>
  401eb2:	41 bf 03 00 00 00    	mov    r15d,0x3
  401eb8:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401ebd:	48 83 ec 08          	sub    rsp,0x8
  401ec1:	45 31 c9             	xor    r9d,r9d
  401ec4:	45 89 d8             	mov    r8d,r11d
  401ec7:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401ecb:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  401ece:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401ed2:	50                   	push   rax
  401ed3:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  401ed7:	55                   	push   rbp
  401ed8:	e8 c3 f8 ff ff       	call   4017a0 <print_broken_up_decimal.isra.0>
  401edd:	48 83 c4 20          	add    rsp,0x20
  401ee1:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  401ee6:	eb 61                	jmp    401f49 <print_exponential_number+0x2a9>
  401ee8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401eef:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  401ef0:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  401ef5:	45 85 d2             	test   r10d,r10d
  401ef8:	0f 85 62 01 00 00    	jne    402060 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  401efe:	45 89 e1             	mov    r9d,r12d
  401f01:	b9 00 00 00 00       	mov    ecx,0x0
  401f06:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401f0a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  401f0d:	41 29 c1             	sub    r9d,eax
  401f10:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  401f13:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  401f17:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401f1b:	48 83 ec 08          	sub    rsp,0x8
  401f1f:	4c 89 e9             	mov    rcx,r13
  401f22:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401f26:	50                   	push   rax
  401f27:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  401f2b:	55                   	push   rbp
  401f2c:	e8 6f f8 ff ff       	call   4017a0 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  401f31:	48 83 c4 20          	add    rsp,0x20
  401f35:	45 84 ff             	test   r15b,r15b
  401f38:	0f 85 3a fe ff ff    	jne    401d78 <print_exponential_number+0xd8>
    print_integer(output,
  401f3e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  401f42:	45 31 d2             	xor    r10d,r10d
  401f45:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  401f49:	83 e5 20             	and    ebp,0x20
  401f4c:	4c 89 ef             	mov    rdi,r13
  401f4f:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  401f53:	83 fd 01             	cmp    ebp,0x1
  401f56:	19 f6                	sbb    esi,esi
  401f58:	83 e6 20             	and    esi,0x20
  401f5b:	83 c6 45             	add    esi,0x45
  401f5e:	e8 ed ee ff ff       	call   400e50 <putchar_via_gadget>
    print_integer(output,
  401f63:	48 63 c3             	movsxd rax,ebx
  401f66:	89 da                	mov    edx,ebx
  401f68:	45 89 f9             	mov    r9d,r15d
  401f6b:	48 89 c6             	mov    rsi,rax
  401f6e:	c1 ea 1f             	shr    edx,0x1f
  401f71:	b9 0a 00 00 00       	mov    ecx,0xa
  401f76:	4c 89 ef             	mov    rdi,r13
  401f79:	48 f7 de             	neg    rsi
  401f7c:	85 db                	test   ebx,ebx
  401f7e:	48 0f 4f f0          	cmovg  rsi,rax
  401f82:	48 83 ec 08          	sub    rsp,0x8
  401f86:	45 31 c0             	xor    r8d,r8d
  401f89:	6a 05                	push   0x5
  401f8b:	e8 10 f4 ff ff       	call   4013a0 <print_integer>
    if (flags & FLAGS_LEFT) {
  401f90:	58                   	pop    rax
  401f91:	5a                   	pop    rdx
  401f92:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  401f96:	45 85 d2             	test   r10d,r10d
  401f99:	0f 84 d9 fd ff ff    	je     401d78 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  401f9f:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  401fa3:	44 29 f0             	sub    eax,r14d
  401fa6:	44 39 e0             	cmp    eax,r12d
  401fa9:	0f 83 c9 fd ff ff    	jae    401d78 <print_exponential_number+0xd8>
  401faf:	90                   	nop
        putchar_via_gadget(output, ' ');
  401fb0:	be 20 00 00 00       	mov    esi,0x20
  401fb5:	4c 89 ef             	mov    rdi,r13
  401fb8:	e8 93 ee ff ff       	call   400e50 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  401fbd:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  401fc1:	44 29 f0             	sub    eax,r14d
  401fc4:	44 39 e0             	cmp    eax,r12d
  401fc7:	72 e7                	jb     401fb0 <print_exponential_number+0x310>
}
  401fc9:	48 83 c4 38          	add    rsp,0x38
  401fcd:	5b                   	pop    rbx
  401fce:	5d                   	pop    rbp
  401fcf:	41 5c                	pop    r12
  401fd1:	41 5d                	pop    r13
  401fd3:	41 5e                	pop    r14
  401fd5:	41 5f                	pop    r15
  401fd7:	c3                   	ret    
  401fd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401fdf:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  401fe0:	85 f6                	test   esi,esi
  401fe2:	0f 84 2d fd ff ff    	je     401d15 <print_exponential_number+0x75>
  401fe8:	e9 20 fd ff ff       	jmp    401d0d <print_exponential_number+0x6d>
  401fed:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  401ff0:	48 83 ec 08          	sub    rsp,0x8
  401ff4:	4c 89 e9             	mov    rcx,r13
  401ff7:	45 31 c9             	xor    r9d,r9d
  401ffa:	45 89 d8             	mov    r8d,r11d
  401ffd:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402001:	50                   	push   rax
  402002:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402006:	55                   	push   rbp
  402007:	e8 94 f7 ff ff       	call   4017a0 <print_broken_up_decimal.isra.0>
  40200c:	48 83 c4 20          	add    rsp,0x20
}
  402010:	48 83 c4 38          	add    rsp,0x38
  402014:	5b                   	pop    rbx
  402015:	5d                   	pop    rbp
  402016:	41 5c                	pop    r12
  402018:	41 5d                	pop    r13
  40201a:	41 5e                	pop    r14
  40201c:	41 5f                	pop    r15
  40201e:	c3                   	ret    
  40201f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402020:	83 c3 01             	add    ebx,0x1
  402023:	66 0f ef c0          	pxor   xmm0,xmm0
  402027:	48 8d 05 72 28 00 00 	lea    rax,[rip+0x2872]        # 4048a0 <powers_of_10>
  40202e:	48 63 db             	movsxd rbx,ebx
  402031:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402036:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  40203b:	0f 8a 0e fd ff ff    	jp     401d4f <print_exponential_number+0xaf>
  402041:	0f 85 08 fd ff ff    	jne    401d4f <print_exponential_number+0xaf>
      precision--;
  402047:	41 83 eb 01          	sub    r11d,0x1
  40204b:	e9 ff fc ff ff       	jmp    401d4f <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402050:	b8 04 00 00 00       	mov    eax,0x4
  402055:	e9 a4 fe ff ff       	jmp    401efe <print_exponential_number+0x25e>
  40205a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402060:	41 bf 04 00 00 00    	mov    r15d,0x4
  402066:	e9 4d fe ff ff       	jmp    401eb8 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  40206b:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402070:	44 89 de             	mov    esi,r11d
  402073:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402077:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402079:	e8 12 f4 ff ff       	call   401490 <get_components>
  40207e:	45 31 ff             	xor    r15d,r15d
  402081:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402086:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40208b:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402090:	e9 f2 fd ff ff       	jmp    401e87 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

00000000004020a0 <print_floating_point>:
  if (value != value) {
  4020a0:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  4020a4:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  4020a7:	0f 8a eb 00 00 00    	jp     402198 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  4020ad:	f2 0f 10 0d 0b 29 00 	movsd  xmm1,QWORD PTR [rip+0x290b]        # 4049c0 <powers_of_10+0x120>
  4020b4:	00 
  4020b5:	66 0f 2f c8          	comisd xmm1,xmm0
  4020b9:	0f 87 21 01 00 00    	ja     4021e0 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  4020bf:	66 0f 2f 05 01 29 00 	comisd xmm0,QWORD PTR [rip+0x2901]        # 4049c8 <powers_of_10+0x128>
  4020c6:	00 
  4020c7:	77 57                	ja     402120 <print_floating_point+0x80>
{
  4020c9:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  4020cd:	45 84 c0             	test   r8b,r8b
  4020d0:	75 7e                	jne    402150 <print_floating_point+0xb0>
  4020d2:	66 0f 2f 05 f6 28 00 	comisd xmm0,QWORD PTR [rip+0x28f6]        # 4049d0 <powers_of_10+0x130>
  4020d9:	00 
  4020da:	0f 87 e8 00 00 00    	ja     4021c8 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  4020e0:	f2 0f 10 0d f0 28 00 	movsd  xmm1,QWORD PTR [rip+0x28f0]        # 4049d8 <powers_of_10+0x138>
  4020e7:	00 
  4020e8:	66 0f 2f c8          	comisd xmm1,xmm0
  4020ec:	0f 87 d6 00 00 00    	ja     4021c8 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  4020f2:	41 89 c9             	mov    r9d,ecx
  4020f5:	41 81 e1 00 08 00 00 	and    r9d,0x800
  4020fc:	0f 85 fe 00 00 00    	jne    402200 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402102:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402107:	49 89 e0             	mov    r8,rsp
  40210a:	44 89 d2             	mov    edx,r10d
  40210d:	e8 7e f9 ff ff       	call   401a90 <print_decimal_number>
}
  402112:	48 83 c4 28          	add    rsp,0x28
  402116:	c3                   	ret    
  402117:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40211e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402120:	89 c8                	mov    eax,ecx
  402122:	48 8d 35 a8 25 00 00 	lea    rsi,[rip+0x25a8]        # 4046d1 <memcpy+0xd51>
  402129:	41 89 c8             	mov    r8d,ecx
  40212c:	44 89 d1             	mov    ecx,r10d
  40212f:	83 e0 04             	and    eax,0x4
  402132:	83 f8 01             	cmp    eax,0x1
  402135:	19 d2                	sbb    edx,edx
  402137:	83 c2 04             	add    edx,0x4
  40213a:	85 c0                	test   eax,eax
  40213c:	48 8d 05 89 25 00 00 	lea    rax,[rip+0x2589]        # 4046cc <memcpy+0xd4c>
  402143:	48 0f 45 f0          	cmovne rsi,rax
  402147:	e9 04 ef ff ff       	jmp    401050 <out_rev_>
  40214c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402150:	41 89 c9             	mov    r9d,ecx
  402153:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40215a:	74 54                	je     4021b0 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  40215c:	b8 01 00 00 00       	mov    eax,0x1
  402161:	45 31 c9             	xor    r9d,r9d
  402164:	83 fe 11             	cmp    esi,0x11
  402167:	76 4c                	jbe    4021b5 <print_floating_point+0x115>
  402169:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  40216e:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402170:	41 89 c1             	mov    r9d,eax
  402173:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402177:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  40217a:	48 83 c0 01          	add    rax,0x1
  40217e:	41 83 f9 1f          	cmp    r9d,0x1f
  402182:	77 05                	ja     402189 <print_floating_point+0xe9>
  402184:	83 fe 11             	cmp    esi,0x11
  402187:	77 e7                	ja     402170 <print_floating_point+0xd0>
  if (prefer_exponential)
  402189:	45 84 c0             	test   r8b,r8b
  40218c:	0f 84 75 ff ff ff    	je     402107 <print_floating_point+0x67>
  402192:	eb 21                	jmp    4021b5 <print_floating_point+0x115>
  402194:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402198:	41 89 c8             	mov    r8d,ecx
  40219b:	48 8d 35 33 25 00 00 	lea    rsi,[rip+0x2533]        # 4046d5 <memcpy+0xd55>
  4021a2:	89 d1                	mov    ecx,edx
  4021a4:	ba 03 00 00 00       	mov    edx,0x3
  4021a9:	e9 a2 ee ff ff       	jmp    401050 <out_rev_>
  4021ae:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  4021b0:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  4021b5:	49 89 e0             	mov    r8,rsp
  4021b8:	44 89 d2             	mov    edx,r10d
  4021bb:	e8 e0 fa ff ff       	call   401ca0 <print_exponential_number>
}
  4021c0:	48 83 c4 28          	add    rsp,0x28
  4021c4:	c3                   	ret    
  4021c5:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  4021c8:	45 31 c9             	xor    r9d,r9d
  4021cb:	49 89 e0             	mov    r8,rsp
  4021ce:	44 89 d2             	mov    edx,r10d
  4021d1:	e8 ca fa ff ff       	call   401ca0 <print_exponential_number>
    return;
  4021d6:	e9 37 ff ff ff       	jmp    402112 <print_floating_point+0x72>
  4021db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  4021e0:	41 89 c8             	mov    r8d,ecx
  4021e3:	48 8d 35 ef 24 00 00 	lea    rsi,[rip+0x24ef]        # 4046d9 <memcpy+0xd59>
  4021ea:	89 d1                	mov    ecx,edx
  4021ec:	ba 04 00 00 00       	mov    edx,0x4
  4021f1:	e9 5a ee ff ff       	jmp    401050 <out_rev_>
  4021f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4021fd:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402200:	b8 01 00 00 00       	mov    eax,0x1
  402205:	45 31 c9             	xor    r9d,r9d
  402208:	83 fe 11             	cmp    esi,0x11
  40220b:	0f 87 58 ff ff ff    	ja     402169 <print_floating_point+0xc9>
  402211:	e9 f1 fe ff ff       	jmp    402107 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402220 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402220:	41 57                	push   r15
  402222:	41 56                	push   r14
  402224:	41 55                	push   r13
  402226:	41 54                	push   r12
  402228:	55                   	push   rbp
  402229:	53                   	push   rbx
  40222a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  40222d:	48 89 f2             	mov    rdx,rsi
{
  402230:	48 83 ec 28          	sub    rsp,0x28
  402234:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402239:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  40223c:	40 84 f6             	test   sil,sil
  40223f:	0f 84 e5 00 00 00    	je     40232a <format_string_loop+0x10a>
  402245:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402248:	4c 8d 2d 9d 24 00 00 	lea    r13,[rip+0x249d]        # 4046ec <memcpy+0xd6c>
  40224f:	90                   	nop
    if (*format != '%') {
  402250:	40 80 fe 25          	cmp    sil,0x25
  402254:	0f 85 ae 00 00 00    	jne    402308 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  40225a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  40225e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402263:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402267:	0f 84 bd 00 00 00    	je     40232a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  40226d:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402272:	4c 89 cf             	mov    rdi,r9
  402275:	e8 86 f4 ff ff       	call   401700 <parse_flags>
    if (is_digit_(*format)) {
  40227a:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  40227f:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402282:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402285:	89 fe                	mov    esi,edi
  402287:	e8 74 ed ff ff       	call   401000 <is_digit_>
  40228c:	84 c0                	test   al,al
  40228e:	0f 85 ac 04 00 00    	jne    402740 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402294:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402297:	40 80 fe 2a          	cmp    sil,0x2a
  40229b:	0f 84 bf 04 00 00    	je     402760 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  4022a1:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  4022a4:	40 80 fe 2e          	cmp    sil,0x2e
  4022a8:	0f 84 52 04 00 00    	je     402700 <format_string_loop+0x4e0>
    switch (*format) {
  4022ae:	8d 46 98             	lea    eax,[rsi-0x68]
  4022b1:	3c 12                	cmp    al,0x12
  4022b3:	77 2f                	ja     4022e4 <format_string_loop+0xc4>
  4022b5:	0f b6 c0             	movzx  eax,al
  4022b8:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  4022bd:	4c 01 e8             	add    rax,r13
  4022c0:	3e ff e0             	notrack jmp rax
  4022c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  4022c8:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  4022cc:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  4022d3:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4022d8:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4022dc:	40 84 f6             	test   sil,sil
  4022df:	74 49                	je     40232a <format_string_loop+0x10a>
  4022e1:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  4022e4:	8d 46 db             	lea    eax,[rsi-0x25]
  4022e7:	3c 53                	cmp    al,0x53
  4022e9:	77 1d                	ja     402308 <format_string_loop+0xe8>
  4022eb:	48 8d 0d 46 24 00 00 	lea    rcx,[rip+0x2446]        # 404738 <memcpy+0xdb8>
  4022f2:	0f b6 c0             	movzx  eax,al
  4022f5:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  4022f9:	48 01 c8             	add    rax,rcx
  4022fc:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  4022ff:	be 25 00 00 00       	mov    esi,0x25
  402304:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402308:	48 89 ef             	mov    rdi,rbp
  40230b:	e8 40 eb ff ff       	call   400e50 <putchar_via_gadget>
        format++;
  402310:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402315:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402319:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  40231e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402321:	40 84 f6             	test   sil,sil
  402324:	0f 85 26 ff ff ff    	jne    402250 <format_string_loop+0x30>
        break;
    }
  }
}
  40232a:	48 83 c4 28          	add    rsp,0x28
  40232e:	5b                   	pop    rbx
  40232f:	5d                   	pop    rbp
  402330:	41 5c                	pop    r12
  402332:	41 5d                	pop    r13
  402334:	41 5e                	pop    r14
  402336:	41 5f                	pop    r15
  402338:	c3                   	ret    
  402339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  402340:	40 80 fe 64          	cmp    sil,0x64
  402344:	0f 84 6e 06 00 00    	je     4029b8 <format_string_loop+0x798>
  40234a:	40 80 fe 69          	cmp    sil,0x69
  40234e:	0f 84 64 06 00 00    	je     4029b8 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  402354:	89 f0                	mov    eax,esi
  402356:	83 e0 df             	and    eax,0xffffffdf
  402359:	3c 58                	cmp    al,0x58
  40235b:	0f 84 37 06 00 00    	je     402998 <format_string_loop+0x778>
        else if (*format == 'o') {
  402361:	b9 08 00 00 00       	mov    ecx,0x8
  402366:	40 80 fe 6f          	cmp    sil,0x6f
  40236a:	74 14                	je     402380 <format_string_loop+0x160>
        else if (*format == 'b') {
  40236c:	b9 02 00 00 00       	mov    ecx,0x2
  402371:	40 80 fe 62          	cmp    sil,0x62
  402375:	74 09                	je     402380 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  402377:	41 83 e3 ef          	and    r11d,0xffffffef
  40237b:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  402380:	44 89 d8             	mov    eax,r11d
        format++;
  402383:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  402387:	83 e0 fe             	and    eax,0xfffffffe
  40238a:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  402391:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  402396:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  40239a:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  40239c:	44 89 da             	mov    edx,r11d
  40239f:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  4023a5:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  4023ac:	0f 84 b6 04 00 00    	je     402868 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  4023b2:	85 d2                	test   edx,edx
  4023b4:	0f 85 be 06 00 00    	jne    402a78 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  4023ba:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4023c1:	0f 85 b1 06 00 00    	jne    402a78 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  4023c7:	41 f6 c3 40          	test   r11b,0x40
  4023cb:	0f 84 51 08 00 00    	je     402c22 <format_string_loop+0xa02>
  4023d1:	83 f8 2f             	cmp    eax,0x2f
  4023d4:	0f 87 bc 08 00 00    	ja     402c96 <format_string_loop+0xa76>
  4023da:	89 c2                	mov    edx,eax
  4023dc:	83 c0 08             	add    eax,0x8
  4023df:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4023e3:	89 03                	mov    DWORD PTR [rbx],eax
  4023e5:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4023e8:	48 63 f8             	movsxd rdi,eax
  4023eb:	89 c2                	mov    edx,eax
  4023ed:	45 89 e1             	mov    r9d,r12d
  4023f0:	45 89 f8             	mov    r8d,r15d
  4023f3:	48 89 fe             	mov    rsi,rdi
  4023f6:	c1 ea 1f             	shr    edx,0x1f
  4023f9:	48 f7 de             	neg    rsi
  4023fc:	85 c0                	test   eax,eax
  4023fe:	48 0f 4f f7          	cmovg  rsi,rdi
  402402:	48 83 ec 08          	sub    rsp,0x8
  402406:	48 89 ef             	mov    rdi,rbp
  402409:	41 53                	push   r11
  40240b:	e8 90 ef ff ff       	call   4013a0 <print_integer>
  while (*format)
  402410:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402415:	41 5a                	pop    r10
  402417:	41 5b                	pop    r11
  402419:	e9 00 ff ff ff       	jmp    40231e <format_string_loop+0xfe>
  40241e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  402420:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402424:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402429:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40242d:	40 84 f6             	test   sil,sil
  402430:	0f 84 f4 fe ff ff    	je     40232a <format_string_loop+0x10a>
        if (*format == 'h') {
  402436:	40 80 fe 68          	cmp    sil,0x68
  40243a:	0f 84 d8 03 00 00    	je     402818 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  402440:	41 80 cb 80          	or     r11b,0x80
  402444:	48 89 c2             	mov    rdx,rax
  402447:	e9 98 fe ff ff       	jmp    4022e4 <format_string_loop+0xc4>
  40244c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  402450:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402454:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402459:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40245d:	40 84 f6             	test   sil,sil
  402460:	0f 84 c4 fe ff ff    	je     40232a <format_string_loop+0x10a>
        if (*format == 'l') {
  402466:	40 80 fe 6c          	cmp    sil,0x6c
  40246a:	0f 84 d0 03 00 00    	je     402840 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  402470:	41 81 cb 00 02 00 00 	or     r11d,0x200
  402477:	48 89 c2             	mov    rdx,rax
  40247a:	e9 65 fe ff ff       	jmp    4022e4 <format_string_loop+0xc4>
  40247f:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  402480:	89 f2                	mov    edx,esi
  402482:	44 89 d8             	mov    eax,r11d
  402485:	83 e2 df             	and    edx,0xffffffdf
  402488:	80 cc 10             	or     ah,0x10
  40248b:	80 fa 47             	cmp    dl,0x47
  40248e:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  402492:	83 e6 fd             	and    esi,0xfffffffd
  402495:	44 89 d8             	mov    eax,r11d
  402498:	83 c8 20             	or     eax,0x20
  40249b:	40 80 fe 45          	cmp    sil,0x45
  40249f:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  4024a3:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  4024a6:	3d af 00 00 00       	cmp    eax,0xaf
  4024ab:	0f 87 9f 03 00 00    	ja     402850 <format_string_loop+0x630>
  4024b1:	89 c7                	mov    edi,eax
  4024b3:	83 c0 10             	add    eax,0x10
  4024b6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4024ba:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  4024bd:	41 b8 01 00 00 00    	mov    r8d,0x1
  4024c3:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  4024c7:	44 89 e2             	mov    edx,r12d
  4024ca:	44 89 d9             	mov    ecx,r11d
  4024cd:	44 89 fe             	mov    esi,r15d
  4024d0:	48 89 ef             	mov    rdi,rbp
  4024d3:	e8 c8 fb ff ff       	call   4020a0 <print_floating_point>
        format++;
  4024d8:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  4024dd:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4024e1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  4024e6:	e9 33 fe ff ff       	jmp    40231e <format_string_loop+0xfe>
  4024eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  4024f0:	44 89 d8             	mov    eax,r11d
  4024f3:	83 c8 20             	or     eax,0x20
  4024f6:	40 80 fe 46          	cmp    sil,0x46
  4024fa:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4024fe:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  402501:	3d af 00 00 00       	cmp    eax,0xaf
  402506:	0f 87 74 04 00 00    	ja     402980 <format_string_loop+0x760>
  40250c:	89 c7                	mov    edi,eax
  40250e:	83 c0 10             	add    eax,0x10
  402511:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402515:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  402518:	45 31 c0             	xor    r8d,r8d
  40251b:	eb a6                	jmp    4024c3 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  40251d:	41 83 e3 02          	and    r11d,0x2
  402521:	0f 84 b9 05 00 00    	je     402ae0 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  402527:	8b 03                	mov    eax,DWORD PTR [rbx]
  402529:	83 f8 2f             	cmp    eax,0x2f
  40252c:	0f 86 a9 06 00 00    	jbe    402bdb <format_string_loop+0x9bb>
  402532:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402536:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40253a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40253e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402541:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  402544:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40254a:	e8 01 e9 ff ff       	call   400e50 <putchar_via_gadget>
          while (l++ < width) {
  40254f:	41 83 fc 01          	cmp    r12d,0x1
  402553:	0f 86 b7 fd ff ff    	jbe    402310 <format_string_loop+0xf0>
  402559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  402560:	be 20 00 00 00       	mov    esi,0x20
  402565:	48 89 ef             	mov    rdi,rbp
  402568:	e8 e3 e8 ff ff       	call   400e50 <putchar_via_gadget>
          while (l++ < width) {
  40256d:	44 89 f8             	mov    eax,r15d
  402570:	41 83 c7 01          	add    r15d,0x1
  402574:	41 39 c4             	cmp    r12d,eax
  402577:	75 e7                	jne    402560 <format_string_loop+0x340>
  402579:	e9 92 fd ff ff       	jmp    402310 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  40257e:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  402580:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  402587:	83 f8 2f             	cmp    eax,0x2f
  40258a:	0f 87 b0 03 00 00    	ja     402940 <format_string_loop+0x720>
  402590:	89 c2                	mov    edx,eax
  402592:	83 c0 08             	add    eax,0x8
  402595:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402599:	89 03                	mov    DWORD PTR [rbx],eax
  40259b:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40259e:	48 85 f6             	test   rsi,rsi
  4025a1:	0f 84 b1 03 00 00    	je     402958 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  4025a7:	48 83 ec 08          	sub    rsp,0x8
  4025ab:	31 d2                	xor    edx,edx
  4025ad:	41 b9 12 00 00 00    	mov    r9d,0x12
  4025b3:	45 89 f8             	mov    r8d,r15d
  4025b6:	41 53                	push   r11
  4025b8:	b9 10 00 00 00       	mov    ecx,0x10
  4025bd:	48 89 ef             	mov    rdi,rbp
  4025c0:	e8 db ed ff ff       	call   4013a0 <print_integer>
  4025c5:	58                   	pop    rax
  4025c6:	5a                   	pop    rdx
        format++;
  4025c7:	e9 44 fd ff ff       	jmp    402310 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4025cc:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  4025cf:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4025d1:	41 f6 c3 40          	test   r11b,0x40
  4025d5:	0f 84 f5 02 00 00    	je     4028d0 <format_string_loop+0x6b0>
  4025db:	83 f8 2f             	cmp    eax,0x2f
  4025de:	0f 87 3c 04 00 00    	ja     402a20 <format_string_loop+0x800>
  4025e4:	89 c2                	mov    edx,eax
  4025e6:	83 c0 08             	add    eax,0x8
  4025e9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4025ed:	89 03                	mov    DWORD PTR [rbx],eax
  4025ef:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4025f2:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  4025f4:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  4025f9:	48 83 c2 01          	add    rdx,0x1
  4025fd:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  402602:	e9 17 fd ff ff       	jmp    40231e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  402607:	8b 03                	mov    eax,DWORD PTR [rbx]
  402609:	83 f8 2f             	cmp    eax,0x2f
  40260c:	0f 87 ee 02 00 00    	ja     402900 <format_string_loop+0x6e0>
  402612:	89 c2                	mov    edx,eax
  402614:	83 c0 08             	add    eax,0x8
  402617:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40261b:	89 03                	mov    DWORD PTR [rbx],eax
  40261d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  402620:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  402624:	48 85 c0             	test   rax,rax
  402627:	0f 84 ef 02 00 00    	je     40291c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40262d:	45 85 ff             	test   r15d,r15d
  402630:	be ff ff ff 7f       	mov    esi,0x7fffffff
  402635:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  402639:	41 0f 45 f7          	cmovne esi,r15d
  40263d:	e8 7e e9 ff ff       	call   400fc0 <strnlen_s_>
            l = (l < precision ? l : precision);
  402642:	44 89 df             	mov    edi,r11d
  402645:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  402648:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  40264a:	41 0f 47 c7          	cmova  eax,r15d
  40264e:	81 e7 00 08 00 00    	and    edi,0x800
  402654:	41 89 fe             	mov    r14d,edi
  402657:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  40265a:	41 83 e3 02          	and    r11d,0x2
  40265e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  402663:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  402667:	0f 84 c3 04 00 00    	je     402b30 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40266d:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  402671:	0f be 30             	movsx  esi,BYTE PTR [rax]
  402674:	40 84 f6             	test   sil,sil
  402677:	74 52                	je     4026cb <format_string_loop+0x4ab>
  402679:	85 ff                	test   edi,edi
  40267b:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  402680:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  402685:	45 85 ff             	test   r15d,r15d
  402688:	75 04                	jne    40268e <format_string_loop+0x46e>
  40268a:	84 c0                	test   al,al
  40268c:	74 3d                	je     4026cb <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40268e:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  402692:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  402698:	49 83 c6 01          	add    r14,0x1
  40269c:	48 89 ef             	mov    rdi,rbp
  40269f:	e8 ac e7 ff ff       	call   400e50 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4026a4:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  4026a8:	40 84 f6             	test   sil,sil
  4026ab:	74 12                	je     4026bf <format_string_loop+0x49f>
  4026ad:	44 89 fa             	mov    edx,r15d
  4026b0:	44 29 f2             	sub    edx,r14d
  4026b3:	03 14 24             	add    edx,DWORD PTR [rsp]
  4026b6:	75 e0                	jne    402698 <format_string_loop+0x478>
  4026b8:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  4026bd:	75 d9                	jne    402698 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  4026bf:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  4026c3:	85 c9                	test   ecx,ecx
  4026c5:	0f 84 45 fc ff ff    	je     402310 <format_string_loop+0xf0>
            while (l++ < width) {
  4026cb:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  4026cf:	44 8d 78 01          	lea    r15d,[rax+0x1]
  4026d3:	41 39 c4             	cmp    r12d,eax
  4026d6:	0f 86 34 fc ff ff    	jbe    402310 <format_string_loop+0xf0>
  4026dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  4026e0:	be 20 00 00 00       	mov    esi,0x20
  4026e5:	48 89 ef             	mov    rdi,rbp
  4026e8:	e8 63 e7 ff ff       	call   400e50 <putchar_via_gadget>
            while (l++ < width) {
  4026ed:	44 89 f8             	mov    eax,r15d
  4026f0:	41 83 c7 01          	add    r15d,0x1
  4026f4:	41 39 c4             	cmp    r12d,eax
  4026f7:	75 e7                	jne    4026e0 <format_string_loop+0x4c0>
  4026f9:	e9 12 fc ff ff       	jmp    402310 <format_string_loop+0xf0>
  4026fe:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  402700:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  402704:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40270b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  402710:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402714:	40 84 f6             	test   sil,sil
  402717:	0f 84 0d fc ff ff    	je     40232a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40271d:	40 0f be fe          	movsx  edi,sil
  402721:	e8 da e8 ff ff       	call   401000 <is_digit_>
  402726:	84 c0                	test   al,al
  402728:	0f 85 82 00 00 00    	jne    4027b0 <format_string_loop+0x590>
      else if (*format == '*') {
  40272e:	40 80 fe 2a          	cmp    sil,0x2a
  402732:	0f 84 98 00 00 00    	je     4027d0 <format_string_loop+0x5b0>
  402738:	48 89 ca             	mov    rdx,rcx
  40273b:	e9 6e fb ff ff       	jmp    4022ae <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  402740:	4c 89 cf             	mov    rdi,r9
  402743:	e8 c8 e8 ff ff       	call   401010 <atou_>
    if (*format == '.') {
  402748:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  40274d:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  402750:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402753:	e9 49 fb ff ff       	jmp    4022a1 <format_string_loop+0x81>
  402758:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40275f:	00 
      const int w = va_arg(args, int);
  402760:	8b 03                	mov    eax,DWORD PTR [rbx]
  402762:	83 f8 2f             	cmp    eax,0x2f
  402765:	77 39                	ja     4027a0 <format_string_loop+0x580>
  402767:	89 c1                	mov    ecx,eax
  402769:	83 c0 08             	add    eax,0x8
  40276c:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  402770:	89 03                	mov    DWORD PTR [rbx],eax
  402772:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  402775:	45 85 e4             	test   r12d,r12d
  402778:	79 07                	jns    402781 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  40277a:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  40277e:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  402781:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402785:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40278a:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40278e:	40 84 f6             	test   sil,sil
  402791:	0f 84 93 fb ff ff    	je     40232a <format_string_loop+0x10a>
  402797:	48 89 c2             	mov    rdx,rax
  40279a:	e9 02 fb ff ff       	jmp    4022a1 <format_string_loop+0x81>
  40279f:	90                   	nop
      const int w = va_arg(args, int);
  4027a0:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4027a4:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4027a8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4027ac:	eb c4                	jmp    402772 <format_string_loop+0x552>
  4027ae:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  4027b0:	4c 89 cf             	mov    rdi,r9
  4027b3:	e8 58 e8 ff ff       	call   401010 <atou_>
    switch (*format) {
  4027b8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  4027bd:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  4027c0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4027c3:	e9 e6 fa ff ff       	jmp    4022ae <format_string_loop+0x8e>
  4027c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4027cf:	00 
        const int precision_ = va_arg(args, int);
  4027d0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4027d2:	83 f8 2f             	cmp    eax,0x2f
  4027d5:	0f 87 ed 01 00 00    	ja     4029c8 <format_string_loop+0x7a8>
  4027db:	89 c1                	mov    ecx,eax
  4027dd:	83 c0 08             	add    eax,0x8
  4027e0:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4027e4:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  4027e6:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  4027e9:	31 c0                	xor    eax,eax
  4027eb:	45 85 d2             	test   r10d,r10d
  4027ee:	41 0f 49 c2          	cmovns eax,r10d
  4027f2:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  4027f5:	48 8d 42 02          	lea    rax,[rdx+0x2]
  4027f9:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4027fe:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  402802:	40 84 f6             	test   sil,sil
  402805:	0f 84 1f fb ff ff    	je     40232a <format_string_loop+0x10a>
  40280b:	48 89 c2             	mov    rdx,rax
  40280e:	e9 9b fa ff ff       	jmp    4022ae <format_string_loop+0x8e>
  402813:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  402818:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40281c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  402820:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402825:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  402829:	40 84 f6             	test   sil,sil
  40282c:	0f 85 af fa ff ff    	jne    4022e1 <format_string_loop+0xc1>
  402832:	e9 f3 fa ff ff       	jmp    40232a <format_string_loop+0x10a>
  402837:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40283e:	00 00 
          flags |= FLAGS_LONG_LONG;
  402840:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  402847:	eb d3                	jmp    40281c <format_string_loop+0x5fc>
  402849:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  402850:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  402854:	48 8d 47 08          	lea    rax,[rdi+0x8]
  402858:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40285c:	e9 5c fc ff ff       	jmp    4024bd <format_string_loop+0x29d>
  402861:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  402868:	44 89 de             	mov    esi,r11d
  40286b:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  40286e:	85 d2                	test   edx,edx
  402870:	0f 85 c2 01 00 00    	jne    402a38 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  402876:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  40287d:	0f 85 b5 01 00 00    	jne    402a38 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  402883:	41 f6 c3 40          	test   r11b,0x40
  402887:	0f 84 6f 03 00 00    	je     402bfc <format_string_loop+0x9dc>
  40288d:	83 f8 2f             	cmp    eax,0x2f
  402890:	0f 87 d7 03 00 00    	ja     402c6d <format_string_loop+0xa4d>
  402896:	89 c2                	mov    edx,eax
  402898:	83 c0 08             	add    eax,0x8
  40289b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40289f:	89 03                	mov    DWORD PTR [rbx],eax
  4028a1:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  4028a5:	48 83 ec 08          	sub    rsp,0x8
  4028a9:	31 d2                	xor    edx,edx
  4028ab:	48 89 ef             	mov    rdi,rbp
  4028ae:	45 89 e1             	mov    r9d,r12d
  4028b1:	56                   	push   rsi
  4028b2:	45 89 f8             	mov    r8d,r15d
  4028b5:	4c 89 de             	mov    rsi,r11
  4028b8:	e8 e3 ea ff ff       	call   4013a0 <print_integer>
  while (*format)
  4028bd:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4028c2:	5e                   	pop    rsi
  4028c3:	5f                   	pop    rdi
  4028c4:	e9 55 fa ff ff       	jmp    40231e <format_string_loop+0xfe>
  4028c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  4028d0:	41 f6 c3 80          	test   r11b,0x80
  4028d4:	0f 84 06 01 00 00    	je     4029e0 <format_string_loop+0x7c0>
  4028da:	83 f8 2f             	cmp    eax,0x2f
  4028dd:	0f 87 08 03 00 00    	ja     402beb <format_string_loop+0x9cb>
  4028e3:	89 c6                	mov    esi,eax
  4028e5:	83 c0 08             	add    eax,0x8
  4028e8:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4028ec:	89 03                	mov    DWORD PTR [rbx],eax
  4028ee:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4028f1:	66 89 08             	mov    WORD PTR [rax],cx
  4028f4:	e9 00 fd ff ff       	jmp    4025f9 <format_string_loop+0x3d9>
  4028f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  402900:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402904:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402908:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40290c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40290f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  402913:	48 85 c0             	test   rax,rax
  402916:	0f 85 11 fd ff ff    	jne    40262d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40291c:	45 89 d8             	mov    r8d,r11d
  40291f:	44 89 e1             	mov    ecx,r12d
  402922:	ba 06 00 00 00       	mov    edx,0x6
  402927:	48 89 ef             	mov    rdi,rbp
  40292a:	48 8d 35 ad 1d 00 00 	lea    rsi,[rip+0x1dad]        # 4046de <memcpy+0xd5e>
  402931:	e8 1a e7 ff ff       	call   401050 <out_rev_>
  402936:	e9 d5 f9 ff ff       	jmp    402310 <format_string_loop+0xf0>
  40293b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  402940:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402944:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402948:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40294c:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40294f:	48 85 f6             	test   rsi,rsi
  402952:	0f 85 4f fc ff ff    	jne    4025a7 <format_string_loop+0x387>
  402958:	45 89 d8             	mov    r8d,r11d
  40295b:	b9 12 00 00 00       	mov    ecx,0x12
  402960:	ba 05 00 00 00       	mov    edx,0x5
  402965:	48 89 ef             	mov    rdi,rbp
  402968:	48 8d 35 76 1d 00 00 	lea    rsi,[rip+0x1d76]        # 4046e5 <memcpy+0xd65>
  40296f:	e8 dc e6 ff ff       	call   401050 <out_rev_>
  402974:	e9 97 f9 ff ff       	jmp    402310 <format_string_loop+0xf0>
  402979:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  402980:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  402984:	48 8d 47 08          	lea    rax,[rdi+0x8]
  402988:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40298c:	e9 87 fb ff ff       	jmp    402518 <format_string_loop+0x2f8>
  402991:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  402998:	44 89 d8             	mov    eax,r11d
  40299b:	41 83 cb 20          	or     r11d,0x20
  40299f:	40 80 fe 58          	cmp    sil,0x58
  4029a3:	b9 10 00 00 00       	mov    ecx,0x10
  4029a8:	44 0f 45 d8          	cmovne r11d,eax
  4029ac:	e9 cf f9 ff ff       	jmp    402380 <format_string_loop+0x160>
  4029b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  4029b8:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  4029bf:	e9 90 f9 ff ff       	jmp    402354 <format_string_loop+0x134>
  4029c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  4029c8:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4029cc:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4029d0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4029d4:	e9 0d fe ff ff       	jmp    4027e6 <format_string_loop+0x5c6>
  4029d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  4029e0:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4029e7:	0f 85 d3 00 00 00    	jne    402ac0 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4029ed:	41 81 e3 00 04 00 00 	and    r11d,0x400
  4029f4:	0f 85 c6 00 00 00    	jne    402ac0 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  4029fa:	83 f8 2f             	cmp    eax,0x2f
  4029fd:	0f 87 a4 02 00 00    	ja     402ca7 <format_string_loop+0xa87>
  402a03:	89 c6                	mov    esi,eax
  402a05:	83 c0 08             	add    eax,0x8
  402a08:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  402a0c:	89 03                	mov    DWORD PTR [rbx],eax
  402a0e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  402a11:	89 08                	mov    DWORD PTR [rax],ecx
  402a13:	e9 e1 fb ff ff       	jmp    4025f9 <format_string_loop+0x3d9>
  402a18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402a1f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  402a20:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402a24:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402a28:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402a2c:	e9 be fb ff ff       	jmp    4025ef <format_string_loop+0x3cf>
  402a31:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  402a38:	83 f8 2f             	cmp    eax,0x2f
  402a3b:	0f 87 78 01 00 00    	ja     402bb9 <format_string_loop+0x999>
  402a41:	89 c7                	mov    edi,eax
  402a43:	83 c0 08             	add    eax,0x8
  402a46:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402a4a:	89 03                	mov    DWORD PTR [rbx],eax
  402a4c:	48 83 ec 08          	sub    rsp,0x8
  402a50:	45 89 e1             	mov    r9d,r12d
  402a53:	45 89 f8             	mov    r8d,r15d
  402a56:	31 d2                	xor    edx,edx
  402a58:	56                   	push   rsi
  402a59:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402a5c:	48 89 ef             	mov    rdi,rbp
  402a5f:	e8 3c e9 ff ff       	call   4013a0 <print_integer>
  while (*format)
  402a64:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402a69:	41 58                	pop    r8
  402a6b:	41 59                	pop    r9
  402a6d:	e9 ac f8 ff ff       	jmp    40231e <format_string_loop+0xfe>
  402a72:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  402a78:	83 f8 2f             	cmp    eax,0x2f
  402a7b:	0f 87 27 01 00 00    	ja     402ba8 <format_string_loop+0x988>
  402a81:	89 c2                	mov    edx,eax
  402a83:	83 c0 08             	add    eax,0x8
  402a86:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402a8a:	89 03                	mov    DWORD PTR [rbx],eax
  402a8c:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  402a8f:	45 89 e1             	mov    r9d,r12d
  402a92:	45 89 f8             	mov    r8d,r15d
  402a95:	48 89 ef             	mov    rdi,rbp
  402a98:	48 89 d6             	mov    rsi,rdx
  402a9b:	48 f7 de             	neg    rsi
  402a9e:	48 0f 48 f2          	cmovs  rsi,rdx
  402aa2:	48 83 ec 08          	sub    rsp,0x8
  402aa6:	48 c1 ea 3f          	shr    rdx,0x3f
  402aaa:	41 53                	push   r11
  402aac:	e8 ef e8 ff ff       	call   4013a0 <print_integer>
  while (*format)
  402ab1:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402ab6:	41 5c                	pop    r12
  402ab8:	41 5e                	pop    r14
  402aba:	e9 5f f8 ff ff       	jmp    40231e <format_string_loop+0xfe>
  402abf:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  402ac0:	83 f8 2f             	cmp    eax,0x2f
  402ac3:	0f 87 7b 01 00 00    	ja     402c44 <format_string_loop+0xa24>
  402ac9:	89 c6                	mov    esi,eax
  402acb:	83 c0 08             	add    eax,0x8
  402ace:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  402ad2:	89 03                	mov    DWORD PTR [rbx],eax
  402ad4:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  402ad7:	48 89 08             	mov    QWORD PTR [rax],rcx
  402ada:	e9 1a fb ff ff       	jmp    4025f9 <format_string_loop+0x3d9>
  402adf:	90                   	nop
          while (l++ < width) {
  402ae0:	41 83 fc 01          	cmp    r12d,0x1
  402ae4:	76 23                	jbe    402b09 <format_string_loop+0x8e9>
  402ae6:	41 bf 02 00 00 00    	mov    r15d,0x2
  402aec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  402af0:	be 20 00 00 00       	mov    esi,0x20
  402af5:	48 89 ef             	mov    rdi,rbp
  402af8:	e8 53 e3 ff ff       	call   400e50 <putchar_via_gadget>
          while (l++ < width) {
  402afd:	44 89 f8             	mov    eax,r15d
  402b00:	41 83 c7 01          	add    r15d,0x1
  402b04:	41 39 c4             	cmp    r12d,eax
  402b07:	75 e7                	jne    402af0 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  402b09:	8b 03                	mov    eax,DWORD PTR [rbx]
  402b0b:	83 f8 2f             	cmp    eax,0x2f
  402b0e:	0f 87 b6 00 00 00    	ja     402bca <format_string_loop+0x9aa>
  402b14:	89 c2                	mov    edx,eax
  402b16:	83 c0 08             	add    eax,0x8
  402b19:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402b1d:	89 03                	mov    DWORD PTR [rbx],eax
  402b1f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402b22:	48 89 ef             	mov    rdi,rbp
  402b25:	e8 26 e3 ff ff       	call   400e50 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  402b2a:	e9 e1 f7 ff ff       	jmp    402310 <format_string_loop+0xf0>
  402b2f:	90                   	nop
            while (l++ < width) {
  402b30:	89 c1                	mov    ecx,eax
  402b32:	8d 40 01             	lea    eax,[rax+0x1]
  402b35:	41 39 cc             	cmp    r12d,ecx
  402b38:	0f 86 bc 01 00 00    	jbe    402cfa <format_string_loop+0xada>
  402b3e:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  402b43:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  402b47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402b4e:	00 00 
              putchar_via_gadget(output, ' ');
  402b50:	be 20 00 00 00       	mov    esi,0x20
  402b55:	48 89 ef             	mov    rdi,rbp
  402b58:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  402b5c:	e8 ef e2 ff ff       	call   400e50 <putchar_via_gadget>
            while (l++ < width) {
  402b61:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402b65:	89 c2                	mov    edx,eax
  402b67:	83 c0 01             	add    eax,0x1
  402b6a:	41 39 d4             	cmp    r12d,edx
  402b6d:	75 e1                	jne    402b50 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  402b6f:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  402b73:	0f be 30             	movsx  esi,BYTE PTR [rax]
  402b76:	40 84 f6             	test   sil,sil
  402b79:	0f 84 91 f7 ff ff    	je     402310 <format_string_loop+0xf0>
  402b7f:	45 85 f6             	test   r14d,r14d
  402b82:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  402b87:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  402b8c:	45 85 ff             	test   r15d,r15d
  402b8f:	0f 85 f9 fa ff ff    	jne    40268e <format_string_loop+0x46e>
  402b95:	84 c0                	test   al,al
  402b97:	0f 85 f1 fa ff ff    	jne    40268e <format_string_loop+0x46e>
  402b9d:	e9 6e f7 ff ff       	jmp    402310 <format_string_loop+0xf0>
  402ba2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  402ba8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402bac:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402bb0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402bb4:	e9 d3 fe ff ff       	jmp    402a8c <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  402bb9:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  402bbd:	48 8d 47 08          	lea    rax,[rdi+0x8]
  402bc1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402bc5:	e9 82 fe ff ff       	jmp    402a4c <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  402bca:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402bce:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402bd2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402bd6:	e9 44 ff ff ff       	jmp    402b1f <format_string_loop+0x8ff>
  402bdb:	89 c2                	mov    edx,eax
  402bdd:	83 c0 08             	add    eax,0x8
  402be0:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402be4:	89 03                	mov    DWORD PTR [rbx],eax
  402be6:	e9 53 f9 ff ff       	jmp    40253e <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  402beb:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  402bef:	48 8d 46 08          	lea    rax,[rsi+0x8]
  402bf3:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402bf7:	e9 f2 fc ff ff       	jmp    4028ee <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  402bfc:	41 81 e3 80 00 00 00 	and    r11d,0x80
  402c03:	74 79                	je     402c7e <format_string_loop+0xa5e>
  402c05:	83 f8 2f             	cmp    eax,0x2f
  402c08:	0f 87 db 00 00 00    	ja     402ce9 <format_string_loop+0xac9>
  402c0e:	89 c2                	mov    edx,eax
  402c10:	83 c0 08             	add    eax,0x8
  402c13:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402c17:	89 03                	mov    DWORD PTR [rbx],eax
  402c19:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  402c1d:	e9 83 fc ff ff       	jmp    4028a5 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  402c22:	41 f6 c3 80          	test   r11b,0x80
  402c26:	74 2d                	je     402c55 <format_string_loop+0xa35>
  402c28:	83 f8 2f             	cmp    eax,0x2f
  402c2b:	0f 87 a7 00 00 00    	ja     402cd8 <format_string_loop+0xab8>
  402c31:	89 c2                	mov    edx,eax
  402c33:	83 c0 08             	add    eax,0x8
  402c36:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402c3a:	89 03                	mov    DWORD PTR [rbx],eax
  402c3c:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  402c3f:	e9 a4 f7 ff ff       	jmp    4023e8 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  402c44:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  402c48:	48 8d 46 08          	lea    rax,[rsi+0x8]
  402c4c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402c50:	e9 7f fe ff ff       	jmp    402ad4 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  402c55:	83 f8 2f             	cmp    eax,0x2f
  402c58:	76 6c                	jbe    402cc6 <format_string_loop+0xaa6>
  402c5a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402c5e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402c62:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402c66:	8b 02                	mov    eax,DWORD PTR [rdx]
  402c68:	e9 7b f7 ff ff       	jmp    4023e8 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  402c6d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402c71:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402c75:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402c79:	e9 23 fc ff ff       	jmp    4028a1 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  402c7e:	83 f8 2f             	cmp    eax,0x2f
  402c81:	77 35                	ja     402cb8 <format_string_loop+0xa98>
  402c83:	89 c2                	mov    edx,eax
  402c85:	83 c0 08             	add    eax,0x8
  402c88:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402c8c:	89 03                	mov    DWORD PTR [rbx],eax
  402c8e:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  402c91:	e9 0f fc ff ff       	jmp    4028a5 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  402c96:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402c9a:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402c9e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402ca2:	e9 3e f7 ff ff       	jmp    4023e5 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  402ca7:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  402cab:	48 8d 46 08          	lea    rax,[rsi+0x8]
  402caf:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402cb3:	e9 56 fd ff ff       	jmp    402a0e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  402cb8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402cbc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402cc0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402cc4:	eb c8                	jmp    402c8e <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  402cc6:	89 c2                	mov    edx,eax
  402cc8:	83 c0 08             	add    eax,0x8
  402ccb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402ccf:	89 03                	mov    DWORD PTR [rbx],eax
  402cd1:	8b 02                	mov    eax,DWORD PTR [rdx]
  402cd3:	e9 10 f7 ff ff       	jmp    4023e8 <format_string_loop+0x1c8>
  402cd8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402cdc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402ce0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402ce4:	e9 53 ff ff ff       	jmp    402c3c <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  402ce9:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402ced:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402cf1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402cf5:	e9 1f ff ff ff       	jmp    402c19 <format_string_loop+0x9f9>
            while (l++ < width) {
  402cfa:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  402cfe:	e9 6c fe ff ff       	jmp    402b6f <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000402d10 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  402d10:	53                   	push   rbx
  402d11:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  402d14:	e8 07 f5 ff ff       	call   402220 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  402d19:	48 89 df             	mov    rdi,rbx
  402d1c:	e8 6f e1 ff ff       	call   400e90 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  402d21:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  402d24:	5b                   	pop    rbx
  402d25:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000402d30 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  402d30:	f3 0f 1e fa          	endbr64 
  402d34:	55                   	push   rbp
  402d35:	49 89 f3             	mov    r11,rsi
  402d38:	49 89 fa             	mov    r10,rdi
  402d3b:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  402d3f:	48 89 e5             	mov    rbp,rsp
  402d42:	48 89 ef             	mov    rdi,rbp
  402d45:	e8 56 e2 ff ff       	call   400fa0 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  402d4a:	48 89 ef             	mov    rdi,rbp
  402d4d:	4c 89 da             	mov    rdx,r11
  402d50:	4c 89 d6             	mov    rsi,r10
  402d53:	e8 b8 ff ff ff       	call   402d10 <vsnprintf_impl>
}
  402d58:	48 83 c4 20          	add    rsp,0x20
  402d5c:	5d                   	pop    rbp
  402d5d:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000402d60 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  402d60:	f3 0f 1e fa          	endbr64 
  402d64:	55                   	push   rbp
  402d65:	49 89 d1             	mov    r9,rdx
  402d68:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  402d6b:	48 89 f2             	mov    rdx,rsi
  402d6e:	48 89 fe             	mov    rsi,rdi
{
  402d71:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  402d75:	48 89 e5             	mov    rbp,rsp
  402d78:	48 89 ef             	mov    rdi,rbp
  402d7b:	e8 80 e1 ff ff       	call   400f00 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  402d80:	48 89 ef             	mov    rdi,rbp
  402d83:	4c 89 d2             	mov    rdx,r10
  402d86:	4c 89 ce             	mov    rsi,r9
  402d89:	e8 82 ff ff ff       	call   402d10 <vsnprintf_impl>
}
  402d8e:	48 83 c4 20          	add    rsp,0x20
  402d92:	5d                   	pop    rbp
  402d93:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000402da0 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  402da0:	f3 0f 1e fa          	endbr64 
  402da4:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  402da7:	48 89 f2             	mov    rdx,rsi
  402daa:	be ff ff ff 7f       	mov    esi,0x7fffffff
  402daf:	e9 ac ff ff ff       	jmp    402d60 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000402dc0 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  402dc0:	f3 0f 1e fa          	endbr64 
  402dc4:	55                   	push   rbp
  402dc5:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  402dc8:	48 89 f2             	mov    rdx,rsi
  402dcb:	48 89 fe             	mov    rsi,rdi
{
  402dce:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  402dd2:	48 89 e5             	mov    rbp,rsp
  402dd5:	48 89 ef             	mov    rdi,rbp
  402dd8:	e8 83 e1 ff ff       	call   400f60 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  402ddd:	48 89 ef             	mov    rdi,rbp
  402de0:	48 89 ca             	mov    rdx,rcx
  402de3:	4c 89 ce             	mov    rsi,r9
  402de6:	e8 25 ff ff ff       	call   402d10 <vsnprintf_impl>
}
  402deb:	48 83 c4 20          	add    rsp,0x20
  402def:	5d                   	pop    rbp
  402df0:	c3                   	ret    

Disassembly of section .text.printf:

0000000000402e00 <printf>:

int printf_(const char* format, ...)
{
  402e00:	f3 0f 1e fa          	endbr64 
  402e04:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402e0b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  402e10:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402e15:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402e1a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402e1f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402e24:	84 c0                	test   al,al
  402e26:	74 37                	je     402e5f <printf+0x5f>
  402e28:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402e2d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402e32:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402e37:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402e3e:	00 
  402e3f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402e46:	00 
  402e47:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402e4e:	00 
  402e4f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402e56:	00 
  402e57:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402e5e:	00 
  va_list args;
  va_start(args, format);
  402e5f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402e66:	00 
  const int ret = vprintf_(format, args);
  402e67:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  402e6c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  402e73:	00 
  402e74:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402e79:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402e7e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402e85:	00 
  402e86:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  402e8b:	e8 a0 fe ff ff       	call   402d30 <vprintf>
  va_end(args);
  return ret;
}
  402e90:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402e97:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000402ea0 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  402ea0:	f3 0f 1e fa          	endbr64 
  402ea4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402eab:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402eb0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402eb5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402eba:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402ebf:	84 c0                	test   al,al
  402ec1:	74 37                	je     402efa <sprintf+0x5a>
  402ec3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402ec8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402ecd:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402ed2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402ed9:	00 
  402eda:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402ee1:	00 
  402ee2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402ee9:	00 
  402eea:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402ef1:	00 
  402ef2:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402ef9:	00 
  va_list args;
  va_start(args, format);
  402efa:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402f01:	00 
  const int ret = vsprintf_(s, format, args);
  402f02:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  402f07:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  402f0e:	00 
  402f0f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402f14:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402f19:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402f20:	00 
  402f21:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  402f26:	e8 75 fe ff ff       	call   402da0 <vsprintf>
  va_end(args);
  return ret;
}
  402f2b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402f32:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000402f40 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  402f40:	f3 0f 1e fa          	endbr64 
  402f44:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402f4b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402f50:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402f55:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402f5a:	84 c0                	test   al,al
  402f5c:	74 37                	je     402f95 <snprintf+0x55>
  402f5e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402f63:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402f68:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402f6d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402f74:	00 
  402f75:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402f7c:	00 
  402f7d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402f84:	00 
  402f85:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402f8c:	00 
  402f8d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402f94:	00 
  va_list args;
  va_start(args, format);
  402f95:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402f9c:	00 
  const int ret = vsnprintf_(s, n, format, args);
  402f9d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  402fa2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  402fa9:	00 
  402faa:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402faf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402fb4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402fbb:	00 
  402fbc:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  402fc1:	e8 9a fd ff ff       	call   402d60 <vsnprintf>
  va_end(args);
  return ret;
}
  402fc6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402fcd:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000402fd0 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  402fd0:	f3 0f 1e fa          	endbr64 
  402fd4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402fdb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402fe0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402fe5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402fea:	84 c0                	test   al,al
  402fec:	74 37                	je     403025 <fctprintf+0x55>
  402fee:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402ff3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402ff8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402ffd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403004:	00 
  403005:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  40300c:	00 
  40300d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403014:	00 
  403015:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  40301c:	00 
  40301d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403024:	00 
  va_list args;
  va_start(args, format);
  403025:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  40302c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  40302d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403032:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403039:	00 
  40303a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  40303f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403044:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  40304b:	00 
  40304c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403051:	e8 6a fd ff ff       	call   402dc0 <vfctprintf>
  va_end(args);
  return ret;
}
  403056:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40305d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403060 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403060:	f3 0f 1e fa          	endbr64 
  403064:	41 54                	push   r12
  403066:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403069:	40 0f be ff          	movsx  edi,dil
  40306d:	e8 0e 00 00 00       	call   403080 <putchar_>
	return c;
}
  403072:	44 89 e0             	mov    eax,r12d
  403075:	41 5c                	pop    r12
  403077:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403080 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403080:	f3 0f 1e fa          	endbr64 
  403084:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403088:	ba 01 00 00 00       	mov    edx,0x1
  40308d:	31 c0                	xor    eax,eax
void putchar_(char c){
  40308f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403094:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403099:	bf 01 00 00 00       	mov    edi,0x1
  40309e:	e8 8d d5 ff ff       	call   400630 <write>
  4030a3:	48 83 c4 18          	add    rsp,0x18
  4030a7:	c3                   	ret    

Disassembly of section .text.max:

00000000004030b0 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  4030b0:	48 39 f7             	cmp    rdi,rsi
  4030b3:	48 89 f0             	mov    rax,rsi
  4030b6:	48 0f 43 c7          	cmovae rax,rdi
}
  4030ba:	c3                   	ret    

Disassembly of section .text.align:

00000000004030c0 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  4030c0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  4030c5:	48 f7 de             	neg    rsi
  4030c8:	48 21 f0             	and    rax,rsi
}
  4030cb:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

00000000004030d0 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  4030d0:	31 c0                	xor    eax,eax
  4030d2:	83 ff 01             	cmp    edi,0x1
  4030d5:	76 4e                	jbe    403125 <granules_to_chunk_kind+0x55>
  4030d7:	b8 01 00 00 00       	mov    eax,0x1
  4030dc:	83 ff 02             	cmp    edi,0x2
  4030df:	74 44                	je     403125 <granules_to_chunk_kind+0x55>
  4030e1:	83 ff 03             	cmp    edi,0x3
  4030e4:	74 5a                	je     403140 <granules_to_chunk_kind+0x70>
  4030e6:	83 ff 04             	cmp    edi,0x4
  4030e9:	74 45                	je     403130 <granules_to_chunk_kind+0x60>
  4030eb:	83 ff 05             	cmp    edi,0x5
  4030ee:	74 60                	je     403150 <granules_to_chunk_kind+0x80>
  4030f0:	83 ff 06             	cmp    edi,0x6
  4030f3:	74 2b                	je     403120 <granules_to_chunk_kind+0x50>
  4030f5:	b8 06 00 00 00       	mov    eax,0x6
  4030fa:	83 ff 08             	cmp    edi,0x8
  4030fd:	76 26                	jbe    403125 <granules_to_chunk_kind+0x55>
  4030ff:	b8 07 00 00 00       	mov    eax,0x7
  403104:	83 ff 0a             	cmp    edi,0xa
  403107:	76 1c                	jbe    403125 <granules_to_chunk_kind+0x55>
  403109:	b8 08 00 00 00       	mov    eax,0x8
  40310e:	83 ff 10             	cmp    edi,0x10
  403111:	76 12                	jbe    403125 <granules_to_chunk_kind+0x55>
  403113:	83 ff 21             	cmp    edi,0x21
  403116:	19 c0                	sbb    eax,eax
  403118:	24 0a                	and    al,0xa
  40311a:	05 ff 00 00 00       	add    eax,0xff
  40311f:	c3                   	ret    
  403120:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403125:	c3                   	ret    
  403126:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40312d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403130:	b8 03 00 00 00       	mov    eax,0x3
  403135:	c3                   	ret    
  403136:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40313d:	00 00 00 
  403140:	b8 02 00 00 00       	mov    eax,0x2
  403145:	c3                   	ret    
  403146:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40314d:	00 00 00 
  403150:	b8 04 00 00 00       	mov    eax,0x4
  403155:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403160 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403160:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403165:	83 ff 09             	cmp    edi,0x9
  403168:	77 0c                	ja     403176 <chunk_kind_to_granules+0x16>
  40316a:	89 ff                	mov    edi,edi
  40316c:	48 8d 05 6d 18 00 00 	lea    rax,[rip+0x186d]        # 4049e0 <CSWTCH.34>
  403173:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403176:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403180 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403180:	48 89 f8             	mov    rax,rdi
  403183:	66 31 c0             	xor    ax,ax
}
  403186:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403190 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403190:	89 f8                	mov    eax,edi
  403192:	0f b6 c4             	movzx  eax,ah
}
  403195:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

00000000004031a0 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  4031a0:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  4031a4:	c3                   	ret    

Disassembly of section .text.get_large_object:

00000000004031b0 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  4031b0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  4031b4:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

00000000004031c0 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  4031c0:	89 f6                	mov    esi,esi
  4031c2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  4031c5:	48 c1 e6 08          	shl    rsi,0x8
  4031c9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  4031cd:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

00000000004031d0 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  4031d0:	48 8b 0d 49 19 00 00 	mov    rcx,QWORD PTR [rip+0x1949]        # 404b20 <large_objects>
  4031d7:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  4031de:	00 
  4031df:	76 07                	jbe    4031e8 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  4031e1:	c3                   	ret    
  4031e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  4031e8:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  4031eb:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  4031f0:	e8 9b ff ff ff       	call   403190 <get_chunk_index>
  4031f5:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  4031f7:	e8 84 ff ff ff       	call   403180 <get_page>
  4031fc:	48 89 c7             	mov    rdi,rax
  4031ff:	e8 bc ff ff ff       	call   4031c0 <allocate_chunk>
		large_objects = large_objects->next;
  403204:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403207:	48 89 15 12 19 00 00 	mov    QWORD PTR [rip+0x1912],rdx        # 404b20 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  40320e:	48 8b 15 73 19 00 00 	mov    rdx,QWORD PTR [rip+0x1973]        # 404b88 <small_object_freelists+0x48>
  403215:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403218:	48 89 05 69 19 00 00 	mov    QWORD PTR [rip+0x1969],rax        # 404b88 <small_object_freelists+0x48>
}
  40321f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403220 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403220:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403224:	48 c1 e8 03          	shr    rax,0x3
}
  403228:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403229 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403229:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403230 <maybe_merge_free_large_object>:
{
  403230:	53                   	push   rbx
	struct large_object* obj = *prev;
  403231:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403234:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403237:	48 8d 1d e2 18 00 00 	lea    rbx,[rip+0x18e2]        # 404b20 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  40323e:	4c 89 df             	mov    rdi,r11
  403241:	e8 5a ff ff ff       	call   4031a0 <get_large_object_payload>
  403246:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  40324a:	49 89 c2             	mov    r10,rax
  40324d:	0f 1f 00             	nop    DWORD PTR [rax]
  403250:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403254:	be 00 01 00 00       	mov    esi,0x100
  403259:	48 89 d7             	mov    rdi,rdx
  40325c:	e8 5f fe ff ff       	call   4030c0 <align>
  403261:	48 39 c2             	cmp    rdx,rax
  403264:	0f 85 bf ff ff ff    	jne    403229 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  40326a:	e8 21 ff ff ff       	call   403190 <get_chunk_index>
  40326f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403271:	85 c9                	test   ecx,ecx
  403273:	74 53                	je     4032c8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403275:	e8 06 ff ff ff       	call   403180 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  40327a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  40327e:	75 48                	jne    4032c8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403280:	48 8b 05 99 18 00 00 	mov    rax,QWORD PTR [rip+0x1899]        # 404b20 <large_objects>
			ASSERT(walk);
  403287:	48 85 c0             	test   rax,rax
  40328a:	0f 84 99 ff ff ff    	je     403229 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403290:	48 39 c2             	cmp    rdx,rax
  403293:	74 3b                	je     4032d0 <maybe_merge_free_large_object+0xa0>
  403295:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403298:	48 89 c1             	mov    rcx,rax
  40329b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  40329e:	48 85 c0             	test   rax,rax
  4032a1:	74 32                	je     4032d5 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  4032a3:	48 39 c2             	cmp    rdx,rax
  4032a6:	75 f0                	jne    403298 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  4032a8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  4032ac:	4c 39 c8             	cmp    rax,r9
  4032af:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  4032b3:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  4032b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  4032bb:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  4032bf:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  4032c2:	eb 8c                	jmp    403250 <maybe_merge_free_large_object+0x20>
  4032c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  4032c8:	4c 89 c8             	mov    rax,r9
  4032cb:	5b                   	pop    rbx
  4032cc:	c3                   	ret    
  4032cd:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  4032d0:	48 89 d9             	mov    rcx,rbx
  4032d3:	eb d3                	jmp    4032a8 <maybe_merge_free_large_object+0x78>
  4032d5:	e9 4f ff ff ff       	jmp    403229 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

00000000004032e0 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  4032e0:	8b 05 2e 18 00 00    	mov    eax,DWORD PTR [rip+0x182e]        # 404b14 <pending_large_object_compact>
  4032e6:	85 c0                	test   eax,eax
  4032e8:	74 2c                	je     403316 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  4032ea:	48 83 3d 2e 18 00 00 	cmp    QWORD PTR [rip+0x182e],0x0        # 404b20 <large_objects>
  4032f1:	00 
		pending_large_object_compact = 0;
  4032f2:	c7 05 18 18 00 00 00 	mov    DWORD PTR [rip+0x1818],0x0        # 404b14 <pending_large_object_compact>
  4032f9:	00 00 00 
		while(*prev)
  4032fc:	74 18                	je     403316 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  4032fe:	48 8d 3d 1b 18 00 00 	lea    rdi,[rip+0x181b]        # 404b20 <large_objects>
  403305:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403308:	e8 23 ff ff ff       	call   403230 <maybe_merge_free_large_object>
  40330d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403310:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403314:	75 f2                	jne    403308 <maybe_compact_free_large_objects+0x28>
}
  403316:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403317 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403317:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403320 <get_small_object_freelist>:
  403320:	83 ff 09             	cmp    edi,0x9
  403323:	0f 87 ee ff ff ff    	ja     403317 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403329:	89 ff                	mov    edi,edi
  40332b:	48 8d 05 0e 18 00 00 	lea    rax,[rip+0x180e]        # 404b40 <small_object_freelists>
  403332:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403336:	c3                   	ret    

Disassembly of section .text.free:

0000000000403340 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  403340:	f3 0f 1e fa          	endbr64 
  403344:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  403347:	48 85 ff             	test   rdi,rdi
  40334a:	74 2a                	je     403376 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  40334c:	e8 2f fe ff ff       	call   403180 <get_page>
  403351:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  403354:	e8 37 fe ff ff       	call   403190 <get_chunk_index>
  403359:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  40335b:	89 c0                	mov    eax,eax
  40335d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  403362:	40 80 ff ff          	cmp    dil,0xff
  403366:	74 18                	je     403380 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  403368:	e8 b3 ff ff ff       	call   403320 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  40336d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403370:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  403373:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  403376:	c3                   	ret    
  403377:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40337e:	00 00 
		struct large_object* obj = get_large_object(ptr);
  403380:	4c 89 c7             	mov    rdi,r8
  403383:	e8 28 fe ff ff       	call   4031b0 <get_large_object>
		obj->next = large_objects;
  403388:	48 8b 15 91 17 00 00 	mov    rdx,QWORD PTR [rip+0x1791]        # 404b20 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  40338f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  403392:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403395:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  40339a:	48 89 05 7f 17 00 00 	mov    QWORD PTR [rip+0x177f],rax        # 404b20 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  4033a1:	e8 1a fe ff ff       	call   4031c0 <allocate_chunk>
		pending_large_object_compact = 1;
  4033a6:	c7 05 64 17 00 00 01 	mov    DWORD PTR [rip+0x1764],0x1        # 404b14 <pending_large_object_compact>
  4033ad:	00 00 00 
  4033b0:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

00000000004033c0 <heap_size_in_pages>:
int heap_size_in_pages()
{
  4033c0:	f3 0f 1e fa          	endbr64 
  4033c4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  4033c8:	31 ff                	xor    edi,edi
  4033ca:	e8 b1 d3 ff ff       	call   400780 <sbrk>
  4033cf:	48 c7 c2 90 4b 40 00 	mov    rdx,0x404b90
  4033d6:	2b 02                	sub    eax,DWORD PTR [rdx]
  4033d8:	48 83 c4 08          	add    rsp,0x8
  4033dc:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

00000000004033dd <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  4033dd:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

00000000004033e0 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4033e0:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  4033e2:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4033e4:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  4033e6:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4033ed:	55                   	push   rbp
  4033ee:	48 89 f5             	mov    rbp,rsi
  4033f1:	53                   	push   rbx
  4033f2:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  4033f6:	e8 c5 ff ff ff       	call   4033c0 <heap_size_in_pages>
	if(!walloc_heap_size)
  4033fb:	48 8b 3d 16 17 00 00 	mov    rdi,QWORD PTR [rip+0x1716]        # 404b18 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403402:	c1 e0 10             	shl    eax,0x10
  403405:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  403408:	48 85 ff             	test   rdi,rdi
  40340b:	75 63                	jne    403470 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  40340d:	48 c7 c7 90 4b 40 00 	mov    rdi,0x404b90
  403414:	be 00 00 01 00       	mov    esi,0x10000
  403419:	e8 a2 fc ff ff       	call   4030c0 <align>
		walloc_heap_size = preallocated;
  40341e:	48 89 1d f3 16 00 00 	mov    QWORD PTR [rip+0x16f3],rbx        # 404b18 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403425:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  403428:	49 39 dc             	cmp    r12,rbx
  40342b:	0f 87 94 00 00 00    	ja     4034c5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  403431:	48 85 db             	test   rbx,rbx
  403434:	0f 84 a3 ff ff ff    	je     4033dd <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  40343a:	be 00 00 01 00       	mov    esi,0x10000
  40343f:	48 89 df             	mov    rdi,rbx
  403442:	e8 79 fc ff ff       	call   4030c0 <align>
  403447:	48 39 c3             	cmp    rbx,rax
  40344a:	0f 85 8d ff ff ff    	jne    4033dd <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  403450:	48 c1 eb 10          	shr    rbx,0x10
  403454:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  403458:	48 83 c4 08          	add    rsp,0x8
  40345c:	4c 89 c0             	mov    rax,r8
  40345f:	5b                   	pop    rbx
  403460:	5d                   	pop    rbp
  403461:	41 5c                	pop    r12
  403463:	41 5d                	pop    r13
  403465:	c3                   	ret    
  403466:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40346d:	00 00 00 
	if(preallocated < needed)
  403470:	4d 85 e4             	test   r12,r12
  403473:	74 5e                	je     4034d3 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  403475:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403478:	4c 89 e6             	mov    rsi,r12
  40347b:	48 d1 ef             	shr    rdi,1
  40347e:	e8 2d fc ff ff       	call   4030b0 <max>
  403483:	be 00 00 01 00       	mov    esi,0x10000
  403488:	48 89 c7             	mov    rdi,rax
  40348b:	e8 30 fc ff ff       	call   4030c0 <align>
  403490:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  403493:	48 85 c0             	test   rax,rax
  403496:	0f 84 41 ff ff ff    	je     4033dd <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  40349c:	48 89 c7             	mov    rdi,rax
  40349f:	e8 dc d2 ff ff       	call   400780 <sbrk>
  4034a4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  4034a8:	74 16                	je     4034c0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  4034aa:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  4034ad:	4c 01 25 64 16 00 00 	add    QWORD PTR [rip+0x1664],r12        # 404b18 <walloc_heap_size>
	size_t size = grow + preallocated;
  4034b4:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  4034b8:	e9 74 ff ff ff       	jmp    403431 <allocate_pages.constprop.0+0x51>
  4034bd:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  4034c0:	45 31 c0             	xor    r8d,r8d
  4034c3:	eb 93                	jmp    403458 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  4034c5:	49 29 dc             	sub    r12,rbx
  4034c8:	48 89 df             	mov    rdi,rbx
  4034cb:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  4034ce:	48 89 c3             	mov    rbx,rax
  4034d1:	eb a5                	jmp    403478 <allocate_pages.constprop.0+0x98>
  4034d3:	e9 05 ff ff ff       	jmp    4033dd <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

00000000004034d8 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  4034d8:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

00000000004034e0 <allocate_large_object>:
{
  4034e0:	41 54                	push   r12
  4034e2:	55                   	push   rbp
  4034e3:	53                   	push   rbx
  4034e4:	48 89 fb             	mov    rbx,rdi
  4034e7:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  4034eb:	e8 f0 fd ff ff       	call   4032e0 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4034f0:	48 8b 15 29 16 00 00 	mov    rdx,QWORD PTR [rip+0x1629]        # 404b20 <large_objects>
  4034f7:	48 85 d2             	test   rdx,rdx
  4034fa:	0f 84 da 01 00 00    	je     4036da <allocate_large_object+0x1fa>
  403500:	4c 8d 0d 19 16 00 00 	lea    r9,[rip+0x1619]        # 404b20 <large_objects>
	size_t best_size = -1;
  403507:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  40350e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  403512:	45 31 d2             	xor    r10d,r10d
  403515:	4c 89 cd             	mov    rbp,r9
  403518:	eb 11                	jmp    40352b <allocate_large_object+0x4b>
  40351a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  403520:	49 89 d1             	mov    r9,rdx
  403523:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  403526:	48 85 d2             	test   rdx,rdx
  403529:	74 39                	je     403564 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40352b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40352f:	4c 39 c1             	cmp    rcx,r8
  403532:	73 ec                	jae    403520 <allocate_large_object+0x40>
  403534:	48 39 d9             	cmp    rcx,rbx
  403537:	72 e7                	jb     403520 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  403539:	be 00 01 00 00       	mov    esi,0x100
  40353e:	e8 7d fb ff ff       	call   4030c0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  403543:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  403547:	48 39 c6             	cmp    rsi,rax
  40354a:	0f 84 88 02 00 00    	je     4037d8 <allocate_large_object+0x2f8>
  403550:	4c 89 cd             	mov    rbp,r9
  403553:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  403556:	49 89 d1             	mov    r9,rdx
  403559:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40355c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  40355f:	48 85 d2             	test   rdx,rdx
  403562:	75 c7                	jne    40352b <allocate_large_object+0x4b>
	if(!best)
  403564:	4d 85 d2             	test   r10,r10
  403567:	0f 84 7b 01 00 00    	je     4036e8 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  40356d:	4c 89 d7             	mov    rdi,r10
  403570:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  403575:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  403578:	e8 13 fc ff ff       	call   403190 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  40357d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  403580:	89 c6                	mov    esi,eax
  403582:	e8 f9 fb ff ff       	call   403180 <get_page>
  403587:	48 89 c7             	mov    rdi,rax
  40358a:	49 89 c1             	mov    r9,rax
  40358d:	e8 2e fc ff ff       	call   4031c0 <allocate_chunk>
	struct large_object* next = best->next;
  403592:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  403595:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  403599:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  4035a0:	75 36                	jne    4035d8 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  4035a2:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  4035a6:	4c 89 d7             	mov    rdi,r10
  4035a9:	be 00 01 00 00       	mov    esi,0x100
  4035ae:	e8 ed fb ff ff       	call   4031a0 <get_large_object_payload>
  4035b3:	48 01 c2             	add    rdx,rax
  4035b6:	48 89 d7             	mov    rdi,rdx
  4035b9:	e8 02 fb ff ff       	call   4030c0 <align>
  4035be:	48 39 c2             	cmp    rdx,rax
  4035c1:	0f 85 11 ff ff ff    	jne    4034d8 <allocate_large_object.cold>
}
  4035c7:	48 83 c4 10          	add    rsp,0x10
  4035cb:	4c 89 d0             	mov    rax,r10
  4035ce:	5b                   	pop    rbx
  4035cf:	5d                   	pop    rbp
  4035d0:	41 5c                	pop    r12
  4035d2:	c3                   	ret    
  4035d3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  4035d8:	4c 89 d7             	mov    rdi,r10
  4035db:	e8 c0 fb ff ff       	call   4031a0 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  4035e0:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  4035e3:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  4035e7:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  4035ea:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  4035ed:	4c 01 df             	add    rdi,r11
  4035f0:	e8 8b fb ff ff       	call   403180 <get_page>
  4035f5:	49 39 c1             	cmp    r9,rax
  4035f8:	0f 84 e8 01 00 00    	je     4037e6 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4035fe:	be 00 00 01 00       	mov    esi,0x10000
  403603:	4c 89 df             	mov    rdi,r11
  403606:	e8 b5 fa ff ff       	call   4030c0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40360b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  403612:	0f 86 38 01 00 00    	jbe    403750 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  403618:	4c 39 d8             	cmp    rax,r11
  40361b:	0f 85 b7 fe ff ff    	jne    4034d8 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  403621:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  403624:	be 00 00 01 00       	mov    esi,0x10000
  403629:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  403630:	ff 
			tail_size = best_size - size;
  403631:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  403638:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  403639:	e8 82 fa ff ff       	call   4030c0 <align>
		best->size -= tail_size;
  40363e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  403642:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  403645:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  403648:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  40364b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40364f:	48 29 cf             	sub    rdi,rcx
  403652:	e8 39 fb ff ff       	call   403190 <get_chunk_index>
  403657:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  403659:	48 85 c9             	test   rcx,rcx
  40365c:	0f 84 44 ff ff ff    	je     4035a6 <allocate_large_object+0xc6>
  403662:	85 c0                	test   eax,eax
  403664:	75 0c                	jne    403672 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  403666:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  40366d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  403672:	48 85 c9             	test   rcx,rcx
  403675:	0f 84 2b ff ff ff    	je     4035a6 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  40367b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40367e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  403683:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  403686:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  40368a:	e8 f1 fa ff ff       	call   403180 <get_page>
  40368f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  403692:	e8 29 fb ff ff       	call   4031c0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  403697:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40369c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  40369f:	48 8b 05 7a 14 00 00 	mov    rax,QWORD PTR [rip+0x147a]        # 404b20 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4036a6:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4036aa:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  4036ad:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4036b0:	e8 eb fa ff ff       	call   4031a0 <get_large_object_payload>
  4036b5:	48 01 c1             	add    rcx,rax
  4036b8:	48 89 cf             	mov    rdi,rcx
  4036bb:	e8 00 fa ff ff       	call   4030c0 <align>
  4036c0:	48 39 c1             	cmp    rcx,rax
  4036c3:	0f 85 0f fe ff ff    	jne    4034d8 <allocate_large_object.cold>
			large_objects = tail;
  4036c9:	48 89 15 50 14 00 00 	mov    QWORD PTR [rip+0x1450],rdx        # 404b20 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4036d0:	e8 fb fa ff ff       	call   4031d0 <maybe_repurpose_single_chunk_large_objects_head>
  4036d5:	e9 c8 fe ff ff       	jmp    4035a2 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  4036da:	48 8d 2d 3f 14 00 00 	lea    rbp,[rip+0x143f]        # 404b20 <large_objects>
  4036e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  4036e8:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4036ec:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  4036f1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4036f8:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4036fa:	4c 89 e7             	mov    rdi,r12
  4036fd:	e8 de fc ff ff       	call   4033e0 <allocate_pages.constprop.0>
  403702:	48 89 c1             	mov    rcx,rax
		if(!page)
  403705:	48 85 c0             	test   rax,rax
  403708:	0f 84 10 01 00 00    	je     40381e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40370e:	ba ff 00 00 00       	mov    edx,0xff
  403713:	be 01 00 00 00       	mov    esi,0x1
  403718:	48 89 c7             	mov    rdi,rax
  40371b:	e8 a0 fa ff ff       	call   4031c0 <allocate_chunk>
  403720:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  403723:	48 8b 05 f6 13 00 00 	mov    rax,QWORD PTR [rip+0x13f6]        # 404b20 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40372a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40372d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  403730:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  403735:	48 c1 e0 10          	shl    rax,0x10
  403739:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  40373e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  403742:	4d 39 c4             	cmp    r12,r8
  403745:	0f 86 22 fe ff ff    	jbe    40356d <allocate_large_object+0x8d>
  40374b:	e9 88 fd ff ff       	jmp    4034d8 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  403750:	4c 39 d8             	cmp    rax,r11
  403753:	0f 85 7f fd ff ff    	jne    4034d8 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  403759:	48 89 ef             	mov    rdi,rbp
  40375c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  403761:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  403765:	e8 26 fa ff ff       	call   403190 <get_chunk_index>
  40376a:	4c 89 cf             	mov    rdi,r9
  40376d:	89 c6                	mov    esi,eax
  40376f:	e8 4c fa ff ff       	call   4031c0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  403774:	b8 00 00 01 00       	mov    eax,0x10000
  403779:	4c 29 e0             	sub    rax,r12
  40377c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  403780:	48 8b 05 99 13 00 00 	mov    rax,QWORD PTR [rip+0x1399]        # 404b20 <large_objects>
  403787:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  40378a:	4c 89 15 8f 13 00 00 	mov    QWORD PTR [rip+0x138f],r10        # 404b20 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  403791:	e8 3a fa ff ff       	call   4031d0 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  403796:	ba ff 00 00 00       	mov    edx,0xff
  40379b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  4037a0:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4037a7:	e8 14 fa ff ff       	call   4031c0 <allocate_chunk>
			best->size = best_size =
  4037ac:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  4037b3:	ff 
  4037b4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4037b8:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  4037bb:	48 39 d3             	cmp    rbx,rdx
  4037be:	0f 87 14 fd ff ff    	ja     4034d8 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  4037c4:	48 89 d1             	mov    rcx,rdx
  4037c7:	48 29 d9             	sub    rcx,rbx
  4037ca:	30 c9                	xor    cl,cl
  4037cc:	e9 74 fe ff ff       	jmp    403645 <allocate_large_object+0x165>
  4037d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4037d8:	4c 89 cd             	mov    rbp,r9
  4037db:	49 89 c8             	mov    r8,rcx
  4037de:	49 89 d2             	mov    r10,rdx
  4037e1:	e9 87 fd ff ff       	jmp    40356d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  4037e6:	be 00 01 00 00       	mov    esi,0x100
  4037eb:	4c 89 df             	mov    rdi,r11
  4037ee:	e8 cd f8 ff ff       	call   4030c0 <align>
  4037f3:	49 39 c3             	cmp    r11,rax
  4037f6:	0f 85 dc fc ff ff    	jne    4034d8 <allocate_large_object.cold>
		best->size -= tail_size;
  4037fc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  403800:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  403803:	48 29 ca             	sub    rdx,rcx
  403806:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40380a:	e8 81 f9 ff ff       	call   403190 <get_chunk_index>
  40380f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  403811:	85 c0                	test   eax,eax
  403813:	0f 84 4d fe ff ff    	je     403666 <allocate_large_object+0x186>
  403819:	e9 5d fe ff ff       	jmp    40367b <allocate_large_object+0x19b>
			return NULL;
  40381e:	45 31 d2             	xor    r10d,r10d
  403821:	e9 a1 fd ff ff       	jmp    4035c7 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

0000000000403830 <allocate_large>:
{
  403830:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  403834:	e8 a7 fc ff ff       	call   4034e0 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  403839:	48 85 c0             	test   rax,rax
  40383c:	74 12                	je     403850 <allocate_large+0x20>
  40383e:	48 89 c7             	mov    rdi,rax
}
  403841:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  403845:	e9 56 f9 ff ff       	jmp    4031a0 <get_large_object_payload>
  40384a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  403850:	31 c0                	xor    eax,eax
  403852:	48 83 c4 08          	add    rsp,0x8
  403856:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

0000000000403860 <obtain_small_objects>:
{
  403860:	55                   	push   rbp
  403861:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  403863:	48 8b 3d 1e 13 00 00 	mov    rdi,QWORD PTR [rip+0x131e]        # 404b88 <small_object_freelists+0x48>
  40386a:	48 85 ff             	test   rdi,rdi
  40386d:	74 71                	je     4038e0 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  40386f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  403872:	48 89 05 0f 13 00 00 	mov    QWORD PTR [rip+0x130f],rax        # 404b88 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  403879:	e8 12 f9 ff ff       	call   403190 <get_chunk_index>
  40387e:	89 ea                	mov    edx,ebp
  403880:	89 c6                	mov    esi,eax
  403882:	e8 f9 f8 ff ff       	call   403180 <get_page>
  403887:	48 89 c7             	mov    rdi,rax
  40388a:	e8 31 f9 ff ff       	call   4031c0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  40388f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  403891:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  403894:	e8 c7 f8 ff ff       	call   403160 <chunk_kind_to_granules>
  403899:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4038a0:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  4038a7:	77 46                	ja     4038ef <obtain_small_objects+0x8f>
  4038a9:	48 89 d0             	mov    rax,rdx
  4038ac:	48 89 f1             	mov    rcx,rsi
  4038af:	48 29 f0             	sub    rax,rsi
  4038b2:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  4038b9:	31 c0                	xor    eax,eax
  4038bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  4038c0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4038c3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  4038c6:	48 89 d0             	mov    rax,rdx
		head->next = next;
  4038c9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4038cc:	48 29 f2             	sub    rdx,rsi
  4038cf:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  4038d6:	76 e8                	jbe    4038c0 <obtain_small_objects+0x60>
}
  4038d8:	5d                   	pop    rbp
  4038d9:	c3                   	ret    
  4038da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  4038e0:	31 ff                	xor    edi,edi
  4038e2:	e8 f9 fb ff ff       	call   4034e0 <allocate_large_object>
  4038e7:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  4038ea:	48 85 c0             	test   rax,rax
  4038ed:	75 8a                	jne    403879 <obtain_small_objects+0x19>
			return NULL;
  4038ef:	31 c0                	xor    eax,eax
}
  4038f1:	5d                   	pop    rbp
  4038f2:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000403900 <allocate_small>:
{
  403900:	53                   	push   rbx
  403901:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  403904:	e8 17 fa ff ff       	call   403320 <get_small_object_freelist>
  403909:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40390c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40390f:	48 85 c0             	test   rax,rax
  403912:	74 0c                	je     403920 <allocate_small+0x20>
	*loc = ret->next;
  403914:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403917:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40391a:	5b                   	pop    rbx
  40391b:	c3                   	ret    
  40391c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  403920:	44 89 c7             	mov    edi,r8d
  403923:	e8 38 ff ff ff       	call   403860 <obtain_small_objects>
		if(!freelist)
  403928:	48 85 c0             	test   rax,rax
  40392b:	74 ed                	je     40391a <allocate_small+0x1a>
		*loc = freelist;
  40392d:	48 89 03             	mov    QWORD PTR [rbx],rax
  403930:	eb e2                	jmp    403914 <allocate_small+0x14>

Disassembly of section .text.malloc:

0000000000403940 <malloc>:
{
  403940:	f3 0f 1e fa          	endbr64 
  403944:	48 83 ec 08          	sub    rsp,0x8
  403948:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  40394b:	e8 d0 f8 ff ff       	call   403220 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  403950:	89 c7                	mov    edi,eax
  403952:	e8 79 f7 ff ff       	call   4030d0 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  403957:	3d ff 00 00 00       	cmp    eax,0xff
  40395c:	74 12                	je     403970 <malloc+0x30>
  40395e:	89 c7                	mov    edi,eax
}
  403960:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  403964:	e9 97 ff ff ff       	jmp    403900 <allocate_small>
  403969:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  403970:	4c 89 c7             	mov    rdi,r8
}
  403973:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  403977:	e9 b4 fe ff ff       	jmp    403830 <allocate_large>

Disassembly of section .text.memcpy:

0000000000403980 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  403980:	f3 0f 1e fa          	endbr64 
  403984:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  403987:	48 85 d2             	test   rdx,rdx
  40398a:	74 6c                	je     4039f8 <memcpy+0x78>
  40398c:	48 89 f0             	mov    rax,rsi
  40398f:	48 39 f7             	cmp    rdi,rsi
  403992:	74 64                	je     4039f8 <memcpy+0x78>
  403994:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  403997:	73 67                	jae    403a00 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  403999:	48 89 fa             	mov    rdx,rdi
  40399c:	48 09 f2             	or     rdx,rsi
  40399f:	83 e2 03             	and    edx,0x3
  4039a2:	0f 85 e8 00 00 00    	jne    403a90 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  4039a8:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  4039ab:	49 89 c9             	mov    r9,rcx
  4039ae:	4c 89 c6             	mov    rsi,r8
  4039b1:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  4039b4:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4039b8:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  4039bc:	49 83 fa 03          	cmp    r10,0x3
  4039c0:	76 1f                	jbe    4039e1 <memcpy+0x61>
  4039c2:	31 d2                	xor    edx,edx
  4039c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4039c8:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  4039cb:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  4039ce:	48 83 c2 01          	add    rdx,0x1
  4039d2:	48 39 d7             	cmp    rdi,rdx
  4039d5:	75 f1                	jne    4039c8 <memcpy+0x48>
  4039d7:	48 c1 e7 02          	shl    rdi,0x2
  4039db:	48 01 f8             	add    rax,rdi
  4039de:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  4039e1:	4d 85 c9             	test   r9,r9
  4039e4:	74 12                	je     4039f8 <memcpy+0x78>
  4039e6:	31 d2                	xor    edx,edx
  4039e8:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  4039ec:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  4039ef:	48 83 c2 01          	add    rdx,0x1
  4039f3:	49 39 d1             	cmp    r9,rdx
  4039f6:	75 f0                	jne    4039e8 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  4039f8:	4c 89 c0             	mov    rax,r8
  4039fb:	c3                   	ret    
  4039fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  403a00:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  403a04:	48 01 d0             	add    rax,rdx
{
  403a07:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  403a08:	4c 89 ca             	mov    rdx,r9
{
  403a0b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  403a0c:	48 09 c2             	or     rdx,rax
  403a0f:	83 e2 03             	and    edx,0x3
  403a12:	0f 84 b8 00 00 00    	je     403ad0 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  403a18:	4c 89 ca             	mov    rdx,r9
  403a1b:	48 31 c2             	xor    rdx,rax
  403a1e:	83 e2 03             	and    edx,0x3
  403a21:	75 0a                	jne    403a2d <memcpy+0xad>
  403a23:	48 83 f9 04          	cmp    rcx,0x4
  403a27:	0f 87 13 01 00 00    	ja     403b40 <memcpy+0x1c0>
  403a2d:	31 db                	xor    ebx,ebx
  403a2f:	31 d2                	xor    edx,edx
  403a31:	31 ed                	xor    ebp,ebp
			length -= t;
  403a33:	48 89 ce             	mov    rsi,rcx
  403a36:	48 f7 de             	neg    rsi
  403a39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  403a40:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  403a44:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  403a48:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  403a4e:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  403a53:	48 83 e9 01          	sub    rcx,0x1
  403a57:	75 e7                	jne    403a40 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  403a59:	48 83 fd 03          	cmp    rbp,0x3
  403a5d:	0f 87 8d 00 00 00    	ja     403af0 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  403a63:	48 85 db             	test   rbx,rbx
  403a66:	74 1c                	je     403a84 <memcpy+0x104>
  403a68:	48 f7 d3             	not    rbx
  403a6b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  403a72:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  403a77:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  403a7b:	48 83 e8 01          	sub    rax,0x1
  403a7f:	48 39 d8             	cmp    rax,rbx
  403a82:	75 ee                	jne    403a72 <memcpy+0xf2>
}
  403a84:	4c 89 c0             	mov    rax,r8
  403a87:	5b                   	pop    rbx
  403a88:	5d                   	pop    rbp
  403a89:	c3                   	ret    
  403a8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  403a90:	48 89 fa             	mov    rdx,rdi
  403a93:	48 31 f2             	xor    rdx,rsi
  403a96:	83 e2 03             	and    edx,0x3
  403a99:	75 06                	jne    403aa1 <memcpy+0x121>
  403a9b:	48 83 f9 03          	cmp    rcx,0x3
  403a9f:	77 77                	ja     403b18 <memcpy+0x198>
  403aa1:	45 31 c9             	xor    r9d,r9d
  403aa4:	31 ff                	xor    edi,edi
  403aa6:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  403aa9:	31 d2                	xor    edx,edx
  403aab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  403ab0:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  403ab4:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  403ab8:	48 83 c2 01          	add    rdx,0x1
  403abc:	48 39 d1             	cmp    rcx,rdx
  403abf:	75 ef                	jne    403ab0 <memcpy+0x130>
  403ac1:	48 01 c8             	add    rax,rcx
  403ac4:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  403ac8:	e9 ef fe ff ff       	jmp    4039bc <memcpy+0x3c>
  403acd:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  403ad0:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  403ad3:	48 89 cb             	mov    rbx,rcx
  403ad6:	48 89 cd             	mov    rbp,rcx
		src += length;
  403ad9:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  403adc:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  403ae0:	83 e3 03             	and    ebx,0x3
		dst += length;
  403ae3:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  403ae6:	48 83 fd 03          	cmp    rbp,0x3
  403aea:	0f 86 73 ff ff ff    	jbe    403a63 <memcpy+0xe3>
  403af0:	48 89 d0             	mov    rax,rdx
  403af3:	48 f7 d8             	neg    rax
  403af6:	48 c1 e0 02          	shl    rax,0x2
  403afa:	49 01 c3             	add    r11,rax
  403afd:	49 01 c2             	add    r10,rax
  403b00:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  403b05:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  403b0a:	48 83 ea 01          	sub    rdx,0x1
  403b0e:	75 f0                	jne    403b00 <memcpy+0x180>
  403b10:	e9 4e ff ff ff       	jmp    403a63 <memcpy+0xe3>
  403b15:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  403b18:	48 89 f2             	mov    rdx,rsi
  403b1b:	83 e2 03             	and    edx,0x3
			length -= t;
  403b1e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  403b23:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  403b28:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  403b2b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  403b2e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  403b31:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  403b35:	41 83 e1 03          	and    r9d,0x3
  403b39:	e9 6b ff ff ff       	jmp    403aa9 <memcpy+0x129>
  403b3e:	66 90                	xchg   ax,ax
				t &= wmask;
  403b40:	48 89 c6             	mov    rsi,rax
  403b43:	83 e6 03             	and    esi,0x3
			length -= t;
  403b46:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  403b49:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  403b4c:	48 89 cb             	mov    rbx,rcx
			length -= t;
  403b4f:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  403b52:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  403b55:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  403b59:	83 e3 03             	and    ebx,0x3
  403b5c:	e9 d2 fe ff ff       	jmp    403a33 <memcpy+0xb3>
