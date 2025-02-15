
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
  400043:	48 81 ec 50 02 00 00 	sub    rsp,0x250
  40004a:	89 bd cc fd ff ff    	mov    DWORD PTR [rbp-0x234],edi
  400050:	48 89 b5 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],rsi
  400057:	48 89 95 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  40005e:	48 8d 05 8b 54 00 00 	lea    rax,[rip+0x548b]        # 4054f0 <b+0x4>
  400065:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    puts("Gamessis OS shell\n");
  400069:	48 8d 05 87 54 00 00 	lea    rax,[rip+0x5487]        # 4054f7 <b+0xb>
  400070:	48 89 c7             	mov    rdi,rax
  400073:	e8 58 14 00 00       	call   4014d0 <puts>
    char cmd[128]  = {0};
  400078:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  40007f:	00 00 00 00 
  400083:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  40008a:	00 00 00 00 
  40008e:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  400095:	00 00 00 00 
  400099:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  4000a0:	00 00 00 00 
  4000a4:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  4000ab:	00 00 00 00 
  4000af:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  4000b6:	00 00 00 00 
  4000ba:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  4000c1:	00 00 00 00 
  4000c5:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  4000cc:	00 00 00 00 
  4000d0:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  4000d7:	00 00 00 00 
  4000db:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  4000e2:	00 
  4000e3:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  4000ea:	00 
  4000eb:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  4000f2:	00 
  4000f3:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  4000fa:	00 
  4000fb:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  400102:	00 
  400103:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  40010a:	00 
  40010b:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  400112:	00 
    char path[128] = "/";
  400113:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x2f
  40011a:	2f 00 00 00 
  40011e:	48 c7 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],0x0
  400125:	00 00 00 00 
  400129:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
  400130:	00 00 00 00 
  400134:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0x0
  40013b:	00 00 00 00 
  40013f:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
  400146:	00 00 00 00 
  40014a:	48 c7 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],0x0
  400151:	00 00 00 00 
  400155:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
  40015c:	00 00 00 00 
  400160:	48 c7 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],0x0
  400167:	00 00 00 00 
  40016b:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x0
  400172:	00 00 00 00 
  400176:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  40017d:	00 00 00 00 
  400181:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  400188:	00 00 00 00 
  40018c:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  400193:	00 00 00 00 
  400197:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  40019e:	00 00 00 00 
  4001a2:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  4001a9:	00 00 00 00 
  4001ad:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  4001b4:	00 00 00 00 
  4001b8:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  4001bf:	00 00 00 00 
    while (1) {
        memset(cmd, 0, 128);
  4001c3:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  4001ca:	ba 80 00 00 00       	mov    edx,0x80
  4001cf:	be 00 00 00 00       	mov    esi,0x0
  4001d4:	48 89 c7             	mov    rdi,rax
  4001d7:	e8 a4 13 00 00       	call   401580 <memset>
        int p = 0;
  4001dc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        printf("%s:>", path);
  4001e3:	48 8d 85 b8 fe ff ff 	lea    rax,[rbp-0x148]
  4001ea:	48 89 c6             	mov    rsi,rax
  4001ed:	48 8d 05 16 53 00 00 	lea    rax,[rip+0x5316]        # 40550a <b+0x1e>
  4001f4:	48 89 c7             	mov    rdi,rax
  4001f7:	b8 00 00 00 00       	mov    eax,0x0
  4001fc:	e8 7f 36 00 00       	call   403880 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400201:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400208:	48 89 c7             	mov    rdi,rax
  40020b:	e8 20 13 00 00       	call   401530 <gets>
        puts(cmd);
  400210:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400217:	48 89 c7             	mov    rdi,rax
  40021a:	e8 b1 12 00 00       	call   4014d0 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  40021f:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400226:	48 8d 15 e2 52 00 00 	lea    rdx,[rip+0x52e2]        # 40550f <b+0x23>
  40022d:	48 89 d6             	mov    rsi,rdx
  400230:	48 89 c7             	mov    rdi,rax
  400233:	e8 18 14 00 00       	call   401650 <strcmp>
  400238:	85 c0                	test   eax,eax
  40023a:	75 14                	jne    400250 <main+0x215>
            puts("Gamessis OS 1.0.\n");
  40023c:	48 8d 05 d4 52 00 00 	lea    rax,[rip+0x52d4]        # 405517 <b+0x2b>
  400243:	48 89 c7             	mov    rdi,rax
  400246:	e8 85 12 00 00       	call   4014d0 <puts>
  40024b:	e9 73 ff ff ff       	jmp    4001c3 <main+0x188>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400250:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400257:	48 8d 15 cb 52 00 00 	lea    rdx,[rip+0x52cb]        # 405529 <b+0x3d>
  40025e:	48 89 d6             	mov    rsi,rdx
  400261:	48 89 c7             	mov    rdi,rax
  400264:	e8 e7 13 00 00       	call   401650 <strcmp>
  400269:	85 c0                	test   eax,eax
  40026b:	0f 84 2a 0c 00 00    	je     400e9b <main+0xe60>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400271:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400278:	48 8d 15 af 52 00 00 	lea    rdx,[rip+0x52af]        # 40552e <b+0x42>
  40027f:	48 89 d6             	mov    rsi,rdx
  400282:	48 89 c7             	mov    rdi,rax
  400285:	e8 c6 13 00 00       	call   401650 <strcmp>
  40028a:	85 c0                	test   eax,eax
  40028c:	75 79                	jne    400307 <main+0x2cc>
            // ls
            DIR*           dp = opendir(".");
  40028e:	48 8d 05 9c 52 00 00 	lea    rax,[rip+0x529c]        # 405531 <b+0x45>
  400295:	48 89 c7             	mov    rdi,rax
  400298:	e8 73 0e 00 00       	call   401110 <opendir>
  40029d:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
            struct dirent* dirp;
            if (!dp) {
  4002a1:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
  4002a6:	75 38                	jne    4002e0 <main+0x2a5>
                printf("error opening directory\n");
  4002a8:	48 8d 05 84 52 00 00 	lea    rax,[rip+0x5284]        # 405533 <b+0x47>
  4002af:	48 89 c7             	mov    rdi,rax
  4002b2:	b8 00 00 00 00       	mov    eax,0x0
  4002b7:	e8 c4 35 00 00       	call   403880 <printf>
                continue;
  4002bc:	e9 d5 0b 00 00       	jmp    400e96 <main+0xe5b>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  4002c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4002c5:	48 83 c0 18          	add    rax,0x18
  4002c9:	48 89 c6             	mov    rsi,rax
  4002cc:	48 8d 05 79 52 00 00 	lea    rax,[rip+0x5279]        # 40554c <b+0x60>
  4002d3:	48 89 c7             	mov    rdi,rax
  4002d6:	b8 00 00 00 00       	mov    eax,0x0
  4002db:	e8 a0 35 00 00       	call   403880 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  4002e0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4002e4:	48 89 c7             	mov    rdi,rax
  4002e7:	e8 a6 0f 00 00       	call   401292 <readdir>
  4002ec:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4002f0:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  4002f5:	75 ca                	jne    4002c1 <main+0x286>
            }
            close(dp);
  4002f7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4002fb:	89 c7                	mov    edi,eax
  4002fd:	e8 6e 0c 00 00       	call   400f70 <close>
  400302:	e9 bc fe ff ff       	jmp    4001c3 <main+0x188>
        }
        else if (strcmp(cmd, "cd") == 0) {
  400307:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  40030e:	48 8d 15 3b 52 00 00 	lea    rdx,[rip+0x523b]        # 405550 <b+0x64>
  400315:	48 89 d6             	mov    rsi,rdx
  400318:	48 89 c7             	mov    rdi,rax
  40031b:	e8 30 13 00 00       	call   401650 <strcmp>
  400320:	85 c0                	test   eax,eax
  400322:	0f 85 1a 02 00 00    	jne    400542 <main+0x507>
            // cd
            char tmppath[128] = {0};
  400328:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40032f:	00 00 00 00 
  400333:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  40033a:	00 00 00 00 
  40033e:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400345:	00 00 00 00 
  400349:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400350:	00 00 00 00 
  400354:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  40035b:	00 00 00 00 
  40035f:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  400366:	00 00 00 00 
  40036a:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  400371:	00 00 00 00 
  400375:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  40037c:	00 00 00 00 
  400380:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  400387:	00 00 00 00 
  40038b:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  400392:	00 00 00 00 
  400396:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  40039d:	00 00 00 00 
  4003a1:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  4003a8:	00 00 00 00 
  4003ac:	48 c7 85 94 fe ff ff 	mov    QWORD PTR [rbp-0x16c],0x0
  4003b3:	00 00 00 00 
  4003b7:	48 c7 85 9c fe ff ff 	mov    QWORD PTR [rbp-0x164],0x0
  4003be:	00 00 00 00 
  4003c2:	48 c7 85 a4 fe ff ff 	mov    QWORD PTR [rbp-0x15c],0x0
  4003c9:	00 00 00 00 
  4003cd:	48 c7 85 ac fe ff ff 	mov    QWORD PTR [rbp-0x154],0x0
  4003d4:	00 00 00 00 
            printf("enter path:");
  4003d8:	48 8d 05 74 51 00 00 	lea    rax,[rip+0x5174]        # 405553 <b+0x67>
  4003df:	48 89 c7             	mov    rdi,rax
  4003e2:	b8 00 00 00 00       	mov    eax,0x0
  4003e7:	e8 94 34 00 00       	call   403880 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  4003ec:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  4003f3:	48 89 c7             	mov    rdi,rax
  4003f6:	e8 35 11 00 00       	call   401530 <gets>
            if (chdir(tmppath) == -1) {
  4003fb:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400402:	48 89 c7             	mov    rdi,rax
  400405:	e8 26 0f 00 00       	call   401330 <chdir>
  40040a:	83 f8 ff             	cmp    eax,0xffffffff
  40040d:	75 23                	jne    400432 <main+0x3f7>
                printf("cannot find directory:%s\n", tmppath);
  40040f:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400416:	48 89 c6             	mov    rsi,rax
  400419:	48 8d 05 3f 51 00 00 	lea    rax,[rip+0x513f]        # 40555f <b+0x73>
  400420:	48 89 c7             	mov    rdi,rax
  400423:	b8 00 00 00 00       	mov    eax,0x0
  400428:	e8 53 34 00 00       	call   403880 <printf>
                continue;
  40042d:	e9 64 0a 00 00       	jmp    400e96 <main+0xe5b>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(path, "..") == 0) {
  400432:	48 8d 85 b8 fe ff ff 	lea    rax,[rbp-0x148]
  400439:	48 8d 15 39 51 00 00 	lea    rdx,[rip+0x5139]        # 405579 <b+0x8d>
  400440:	48 89 d6             	mov    rsi,rdx
  400443:	48 89 c7             	mov    rdi,rax
  400446:	e8 05 12 00 00       	call   401650 <strcmp>
  40044b:	85 c0                	test   eax,eax
  40044d:	75 75                	jne    4004c4 <main+0x489>
                char* p = tmppath + strlen(tmppath) - 1;
  40044f:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400456:	48 89 c7             	mov    rdi,rax
  400459:	e8 42 12 00 00       	call   4016a0 <strlen>
  40045e:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400462:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400469:	48 01 d0             	add    rax,rdx
  40046c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                while (p > tmppath && *p == '/') {
  400470:	eb 0f                	jmp    400481 <main+0x446>
                    *p-- = 0;
  400472:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400476:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  40047a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  40047e:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  400481:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400488:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
  40048c:	76 1c                	jbe    4004aa <main+0x46f>
  40048e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400492:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  400495:	3c 2f                	cmp    al,0x2f
  400497:	74 d9                	je     400472 <main+0x437>
                }
                while (p > tmppath && *(p) != '/') {
  400499:	eb 0f                	jmp    4004aa <main+0x46f>
                    *p-- = 0;
  40049b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40049f:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004a3:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  4004a7:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  4004aa:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  4004b1:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
  4004b5:	76 68                	jbe    40051f <main+0x4e4>
  4004b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4004bb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004be:	3c 2f                	cmp    al,0x2f
  4004c0:	75 d9                	jne    40049b <main+0x460>
  4004c2:	eb 5b                	jmp    40051f <main+0x4e4>
                }
            }
            else if (strcmp(path, ".") == 0) {
  4004c4:	48 8d 85 b8 fe ff ff 	lea    rax,[rbp-0x148]
  4004cb:	48 8d 15 5f 50 00 00 	lea    rdx,[rip+0x505f]        # 405531 <b+0x45>
  4004d2:	48 89 d6             	mov    rsi,rdx
  4004d5:	48 89 c7             	mov    rdi,rax
  4004d8:	e8 73 11 00 00       	call   401650 <strcmp>
  4004dd:	85 c0                	test   eax,eax
  4004df:	0f 84 b0 09 00 00    	je     400e95 <main+0xe5a>
                continue;
            }
            else {
                strcat(tmppath, path);
  4004e5:	48 8d 95 b8 fe ff ff 	lea    rdx,[rbp-0x148]
  4004ec:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  4004f3:	48 89 d6             	mov    rsi,rdx
  4004f6:	48 89 c7             	mov    rdi,rax
  4004f9:	e8 12 11 00 00       	call   401610 <strcat>
                strcat(tmppath, "/");
  4004fe:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400505:	48 89 c7             	mov    rdi,rax
  400508:	e8 93 11 00 00       	call   4016a0 <strlen>
  40050d:	48 89 c2             	mov    rdx,rax
  400510:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400517:	48 01 d0             	add    rax,rdx
  40051a:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  40051f:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400526:	48 89 c6             	mov    rsi,rax
  400529:	48 8d 05 4c 50 00 00 	lea    rax,[rip+0x504c]        # 40557c <b+0x90>
  400530:	48 89 c7             	mov    rdi,rax
  400533:	b8 00 00 00 00       	mov    eax,0x0
  400538:	e8 43 33 00 00       	call   403880 <printf>
  40053d:	e9 81 fc ff ff       	jmp    4001c3 <main+0x188>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400542:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400549:	48 8d 15 42 50 00 00 	lea    rdx,[rip+0x5042]        # 405592 <b+0xa6>
  400550:	48 89 d6             	mov    rsi,rdx
  400553:	48 89 c7             	mov    rdi,rax
  400556:	e8 f5 10 00 00       	call   401650 <strcmp>
  40055b:	85 c0                	test   eax,eax
  40055d:	0f 85 1e 01 00 00    	jne    400681 <main+0x646>
            char path[100] = {0};
  400563:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40056a:	00 00 00 00 
  40056e:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400575:	00 00 00 00 
  400579:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400580:	00 00 00 00 
  400584:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  40058b:	00 00 00 00 
  40058f:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  400596:	00 00 00 00 
  40059a:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  4005a1:	00 00 00 00 
  4005a5:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  4005ac:	00 00 00 00 
  4005b0:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  4005b7:	00 00 00 00 
  4005bb:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  4005c2:	00 00 00 00 
  4005c6:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  4005cd:	00 00 00 00 
  4005d1:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  4005d8:	00 00 00 00 
  4005dc:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  4005e3:	00 00 00 00 
  4005e7:	c7 85 94 fe ff ff 00 	mov    DWORD PTR [rbp-0x16c],0x0
  4005ee:	00 00 00 
            printf("input path:");
  4005f1:	48 8d 05 a0 4f 00 00 	lea    rax,[rip+0x4fa0]        # 405598 <b+0xac>
  4005f8:	48 89 c7             	mov    rdi,rax
  4005fb:	b8 00 00 00 00       	mov    eax,0x0
  400600:	e8 7b 32 00 00       	call   403880 <printf>
            gets(path);
  400605:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40060c:	48 89 c7             	mov    rdi,rax
  40060f:	e8 1c 0f 00 00       	call   401530 <gets>
            int fd = creat(path, O_CREAT);
  400614:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40061b:	be 40 00 00 00       	mov    esi,0x40
  400620:	48 89 c7             	mov    rdi,rax
  400623:	e8 7d 0d 00 00       	call   4013a5 <creat>
  400628:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if (fd < 0) {
  40062b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  40062f:	79 23                	jns    400654 <main+0x619>
                printf("create file %s failed\n", path);
  400631:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400638:	48 89 c6             	mov    rsi,rax
  40063b:	48 8d 05 62 4f 00 00 	lea    rax,[rip+0x4f62]        # 4055a4 <b+0xb8>
  400642:	48 89 c7             	mov    rdi,rax
  400645:	b8 00 00 00 00       	mov    eax,0x0
  40064a:	e8 31 32 00 00       	call   403880 <printf>
  40064f:	e9 6f fb ff ff       	jmp    4001c3 <main+0x188>
            }
            else {
                printf("create file %s success\n", path);
  400654:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40065b:	48 89 c6             	mov    rsi,rax
  40065e:	48 8d 05 56 4f 00 00 	lea    rax,[rip+0x4f56]        # 4055bb <b+0xcf>
  400665:	48 89 c7             	mov    rdi,rax
  400668:	b8 00 00 00 00       	mov    eax,0x0
  40066d:	e8 0e 32 00 00       	call   403880 <printf>
                close(fd);
  400672:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400675:	89 c7                	mov    edi,eax
  400677:	e8 f4 08 00 00       	call   400f70 <close>
  40067c:	e9 42 fb ff ff       	jmp    4001c3 <main+0x188>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  400681:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400688:	48 8d 15 44 4f 00 00 	lea    rdx,[rip+0x4f44]        # 4055d3 <b+0xe7>
  40068f:	48 89 d6             	mov    rsi,rdx
  400692:	48 89 c7             	mov    rdi,rax
  400695:	e8 b6 0f 00 00       	call   401650 <strcmp>
  40069a:	85 c0                	test   eax,eax
  40069c:	0f 85 0f 01 00 00    	jne    4007b1 <main+0x776>
            char path[100] = {0};
  4006a2:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4006a9:	00 00 00 00 
  4006ad:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4006b4:	00 00 00 00 
  4006b8:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4006bf:	00 00 00 00 
  4006c3:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  4006ca:	00 00 00 00 
  4006ce:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  4006d5:	00 00 00 00 
  4006d9:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  4006e0:	00 00 00 00 
  4006e4:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  4006eb:	00 00 00 00 
  4006ef:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  4006f6:	00 00 00 00 
  4006fa:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  400701:	00 00 00 00 
  400705:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  40070c:	00 00 00 00 
  400710:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  400717:	00 00 00 00 
  40071b:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  400722:	00 00 00 00 
  400726:	c7 85 94 fe ff ff 00 	mov    DWORD PTR [rbp-0x16c],0x0
  40072d:	00 00 00 
            printf("input path:");
  400730:	48 8d 05 61 4e 00 00 	lea    rax,[rip+0x4e61]        # 405598 <b+0xac>
  400737:	48 89 c7             	mov    rdi,rax
  40073a:	b8 00 00 00 00       	mov    eax,0x0
  40073f:	e8 3c 31 00 00       	call   403880 <printf>
            gets(path);
  400744:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40074b:	48 89 c7             	mov    rdi,rax
  40074e:	e8 dd 0d 00 00       	call   401530 <gets>
            int stat = remove(path);
  400753:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40075a:	48 89 c7             	mov    rdi,rax
  40075d:	e8 6e 09 00 00       	call   4010d0 <remove>
  400762:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if (stat < 0) {
  400765:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  400769:	79 23                	jns    40078e <main+0x753>
                printf("remove file/dir %s failed\n", path);
  40076b:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400772:	48 89 c6             	mov    rsi,rax
  400775:	48 8d 05 5a 4e 00 00 	lea    rax,[rip+0x4e5a]        # 4055d6 <b+0xea>
  40077c:	48 89 c7             	mov    rdi,rax
  40077f:	b8 00 00 00 00       	mov    eax,0x0
  400784:	e8 f7 30 00 00       	call   403880 <printf>
  400789:	e9 35 fa ff ff       	jmp    4001c3 <main+0x188>
            }
            else {
                printf("remove file/dir %s success\n", path);
  40078e:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400795:	48 89 c6             	mov    rsi,rax
  400798:	48 8d 05 52 4e 00 00 	lea    rax,[rip+0x4e52]        # 4055f1 <b+0x105>
  40079f:	48 89 c7             	mov    rdi,rax
  4007a2:	b8 00 00 00 00       	mov    eax,0x0
  4007a7:	e8 d4 30 00 00       	call   403880 <printf>
  4007ac:	e9 12 fa ff ff       	jmp    4001c3 <main+0x188>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  4007b1:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  4007b8:	48 8d 15 4e 4e 00 00 	lea    rdx,[rip+0x4e4e]        # 40560d <b+0x121>
  4007bf:	48 89 d6             	mov    rsi,rdx
  4007c2:	48 89 c7             	mov    rdi,rax
  4007c5:	e8 86 0e 00 00       	call   401650 <strcmp>
  4007ca:	85 c0                	test   eax,eax
  4007cc:	0f 85 d8 01 00 00    	jne    4009aa <main+0x96f>
            char src[100] = {0};
  4007d2:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  4007d9:	00 00 00 00 
  4007dd:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  4007e4:	00 00 00 00 
  4007e8:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  4007ef:	00 00 00 00 
  4007f3:	48 c7 85 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],0x0
  4007fa:	00 00 00 00 
  4007fe:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
  400805:	00 00 00 00 
  400809:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x0
  400810:	00 00 00 00 
  400814:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
  40081b:	00 00 00 00 
  40081f:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x0
  400826:	00 00 00 00 
  40082a:	48 c7 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],0x0
  400831:	00 00 00 00 
  400835:	48 c7 85 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],0x0
  40083c:	00 00 00 00 
  400840:	48 c7 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],0x0
  400847:	00 00 00 00 
  40084b:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x0
  400852:	00 00 00 00 
  400856:	c7 85 30 fe ff ff 00 	mov    DWORD PTR [rbp-0x1d0],0x0
  40085d:	00 00 00 
            char dst[100] = {0};
  400860:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400867:	00 00 00 00 
  40086b:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400872:	00 00 00 00 
  400876:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  40087d:	00 00 00 00 
  400881:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400888:	00 00 00 00 
  40088c:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  400893:	00 00 00 00 
  400897:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  40089e:	00 00 00 00 
  4008a2:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  4008a9:	00 00 00 00 
  4008ad:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  4008b4:	00 00 00 00 
  4008b8:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  4008bf:	00 00 00 00 
  4008c3:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  4008ca:	00 00 00 00 
  4008ce:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  4008d5:	00 00 00 00 
  4008d9:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  4008e0:	00 00 00 00 
  4008e4:	c7 85 94 fe ff ff 00 	mov    DWORD PTR [rbp-0x16c],0x0
  4008eb:	00 00 00 
            printf("input src path:");
  4008ee:	48 8d 05 1b 4d 00 00 	lea    rax,[rip+0x4d1b]        # 405610 <b+0x124>
  4008f5:	48 89 c7             	mov    rdi,rax
  4008f8:	b8 00 00 00 00       	mov    eax,0x0
  4008fd:	e8 7e 2f 00 00       	call   403880 <printf>
            gets(src);
  400902:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400909:	48 89 c7             	mov    rdi,rax
  40090c:	e8 1f 0c 00 00       	call   401530 <gets>
            printf("input dst path:");
  400911:	48 8d 05 08 4d 00 00 	lea    rax,[rip+0x4d08]        # 405620 <b+0x134>
  400918:	48 89 c7             	mov    rdi,rax
  40091b:	b8 00 00 00 00       	mov    eax,0x0
  400920:	e8 5b 2f 00 00       	call   403880 <printf>
            gets(dst);
  400925:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  40092c:	48 89 c7             	mov    rdi,rax
  40092f:	e8 fc 0b 00 00       	call   401530 <gets>
            int stat = rename(src, dst);
  400934:	48 8d 95 34 fe ff ff 	lea    rdx,[rbp-0x1cc]
  40093b:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400942:	48 89 d6             	mov    rsi,rdx
  400945:	48 89 c7             	mov    rdi,rax
  400948:	e8 ff 0a 00 00       	call   40144c <rename>
  40094d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
            if (stat < 0) {
  400950:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  400954:	79 2a                	jns    400980 <main+0x945>
                printf("move file/dir %s to %s failed\n", src, dst);
  400956:	48 8d 95 34 fe ff ff 	lea    rdx,[rbp-0x1cc]
  40095d:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400964:	48 89 c6             	mov    rsi,rax
  400967:	48 8d 05 c2 4c 00 00 	lea    rax,[rip+0x4cc2]        # 405630 <b+0x144>
  40096e:	48 89 c7             	mov    rdi,rax
  400971:	b8 00 00 00 00       	mov    eax,0x0
  400976:	e8 05 2f 00 00       	call   403880 <printf>
  40097b:	e9 43 f8 ff ff       	jmp    4001c3 <main+0x188>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  400980:	48 8d 95 34 fe ff ff 	lea    rdx,[rbp-0x1cc]
  400987:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  40098e:	48 89 c6             	mov    rsi,rax
  400991:	48 8d 05 b8 4c 00 00 	lea    rax,[rip+0x4cb8]        # 405650 <b+0x164>
  400998:	48 89 c7             	mov    rdi,rax
  40099b:	b8 00 00 00 00       	mov    eax,0x0
  4009a0:	e8 db 2e 00 00       	call   403880 <printf>
  4009a5:	e9 19 f8 ff ff       	jmp    4001c3 <main+0x188>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  4009aa:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  4009b1:	48 8d 15 b8 4c 00 00 	lea    rdx,[rip+0x4cb8]        # 405670 <b+0x184>
  4009b8:	48 89 d6             	mov    rsi,rdx
  4009bb:	48 89 c7             	mov    rdi,rax
  4009be:	e8 8d 0c 00 00       	call   401650 <strcmp>
  4009c3:	85 c0                	test   eax,eax
  4009c5:	0f 85 e6 01 00 00    	jne    400bb1 <main+0xb76>
            char path[100] = {0};
  4009cb:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  4009d2:	00 00 00 00 
  4009d6:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  4009dd:	00 00 00 00 
  4009e1:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  4009e8:	00 00 00 00 
  4009ec:	48 c7 85 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],0x0
  4009f3:	00 00 00 00 
  4009f7:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
  4009fe:	00 00 00 00 
  400a02:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x0
  400a09:	00 00 00 00 
  400a0d:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
  400a14:	00 00 00 00 
  400a18:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x0
  400a1f:	00 00 00 00 
  400a23:	48 c7 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],0x0
  400a2a:	00 00 00 00 
  400a2e:	48 c7 85 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],0x0
  400a35:	00 00 00 00 
  400a39:	48 c7 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],0x0
  400a40:	00 00 00 00 
  400a44:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x0
  400a4b:	00 00 00 00 
  400a4f:	c7 85 30 fe ff ff 00 	mov    DWORD PTR [rbp-0x1d0],0x0
  400a56:	00 00 00 
            printf("input path:");
  400a59:	48 8d 05 38 4b 00 00 	lea    rax,[rip+0x4b38]        # 405598 <b+0xac>
  400a60:	48 89 c7             	mov    rdi,rax
  400a63:	b8 00 00 00 00       	mov    eax,0x0
  400a68:	e8 13 2e 00 00       	call   403880 <printf>
            gets(path);
  400a6d:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400a74:	48 89 c7             	mov    rdi,rax
  400a77:	e8 b4 0a 00 00       	call   401530 <gets>
            int fd = open(path, O_RDONLY);
  400a7c:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400a83:	be 00 00 00 00       	mov    esi,0x0
  400a88:	48 89 c7             	mov    rdi,rax
  400a8b:	e8 d0 04 00 00       	call   400f60 <open>
  400a90:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if (fd < 0) {
  400a93:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  400a97:	79 23                	jns    400abc <main+0xa81>
                printf("open file %s failed\n", path);
  400a99:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400aa0:	48 89 c6             	mov    rsi,rax
  400aa3:	48 8d 05 ca 4b 00 00 	lea    rax,[rip+0x4bca]        # 405674 <b+0x188>
  400aaa:	48 89 c7             	mov    rdi,rax
  400aad:	b8 00 00 00 00       	mov    eax,0x0
  400ab2:	e8 c9 2d 00 00       	call   403880 <printf>
  400ab7:	e9 07 f7 ff ff       	jmp    4001c3 <main+0x188>
            }
            else {
                char buffer[100] = {0};
  400abc:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400ac3:	00 00 00 00 
  400ac7:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400ace:	00 00 00 00 
  400ad2:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400ad9:	00 00 00 00 
  400add:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400ae4:	00 00 00 00 
  400ae8:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  400aef:	00 00 00 00 
  400af3:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  400afa:	00 00 00 00 
  400afe:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  400b05:	00 00 00 00 
  400b09:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  400b10:	00 00 00 00 
  400b14:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  400b1b:	00 00 00 00 
  400b1f:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  400b26:	00 00 00 00 
  400b2a:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  400b31:	00 00 00 00 
  400b35:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  400b3c:	00 00 00 00 
  400b40:	c7 85 94 fe ff ff 00 	mov    DWORD PTR [rbp-0x16c],0x0
  400b47:	00 00 00 
                int  len         = 0;
  400b4a:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400b51:	eb 1e                	jmp    400b71 <main+0xb36>
                    printf("%s", buffer);
  400b53:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400b5a:	48 89 c6             	mov    rsi,rax
  400b5d:	48 8d 05 25 4b 00 00 	lea    rax,[rip+0x4b25]        # 405689 <b+0x19d>
  400b64:	48 89 c7             	mov    rdi,rax
  400b67:	b8 00 00 00 00       	mov    eax,0x0
  400b6c:	e8 0f 2d 00 00       	call   403880 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400b71:	48 8d 8d 34 fe ff ff 	lea    rcx,[rbp-0x1cc]
  400b78:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  400b7b:	ba 64 00 00 00       	mov    edx,0x64
  400b80:	48 89 ce             	mov    rsi,rcx
  400b83:	89 c7                	mov    edi,eax
  400b85:	e8 f6 03 00 00       	call   400f80 <read>
  400b8a:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  400b8d:	83 7d d8 00          	cmp    DWORD PTR [rbp-0x28],0x0
  400b91:	7f c0                	jg     400b53 <main+0xb18>
                }
                puts("");
  400b93:	48 8d 05 f2 4a 00 00 	lea    rax,[rip+0x4af2]        # 40568c <b+0x1a0>
  400b9a:	48 89 c7             	mov    rdi,rax
  400b9d:	e8 2e 09 00 00       	call   4014d0 <puts>
                close(fd);
  400ba2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  400ba5:	89 c7                	mov    edi,eax
  400ba7:	e8 c4 03 00 00       	call   400f70 <close>
  400bac:	e9 12 f6 ff ff       	jmp    4001c3 <main+0x188>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400bb1:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400bb8:	48 8d 15 ce 4a 00 00 	lea    rdx,[rip+0x4ace]        # 40568d <b+0x1a1>
  400bbf:	48 89 d6             	mov    rsi,rdx
  400bc2:	48 89 c7             	mov    rdi,rax
  400bc5:	e8 86 0a 00 00       	call   401650 <strcmp>
  400bca:	85 c0                	test   eax,eax
  400bcc:	0f 85 fd 01 00 00    	jne    400dcf <main+0xd94>
            char path[100] = {0};
  400bd2:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400bd9:	00 00 00 00 
  400bdd:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400be4:	00 00 00 00 
  400be8:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400bef:	00 00 00 00 
  400bf3:	48 c7 85 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],0x0
  400bfa:	00 00 00 00 
  400bfe:	48 c7 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],0x0
  400c05:	00 00 00 00 
  400c09:	48 c7 85 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],0x0
  400c10:	00 00 00 00 
  400c14:	48 c7 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],0x0
  400c1b:	00 00 00 00 
  400c1f:	48 c7 85 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],0x0
  400c26:	00 00 00 00 
  400c2a:	48 c7 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],0x0
  400c31:	00 00 00 00 
  400c35:	48 c7 85 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],0x0
  400c3c:	00 00 00 00 
  400c40:	48 c7 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],0x0
  400c47:	00 00 00 00 
  400c4b:	48 c7 85 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],0x0
  400c52:	00 00 00 00 
  400c56:	c7 85 30 fe ff ff 00 	mov    DWORD PTR [rbp-0x1d0],0x0
  400c5d:	00 00 00 
            printf("input path:");
  400c60:	48 8d 05 31 49 00 00 	lea    rax,[rip+0x4931]        # 405598 <b+0xac>
  400c67:	48 89 c7             	mov    rdi,rax
  400c6a:	b8 00 00 00 00       	mov    eax,0x0
  400c6f:	e8 0c 2c 00 00       	call   403880 <printf>
            gets(path);
  400c74:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400c7b:	48 89 c7             	mov    rdi,rax
  400c7e:	e8 ad 08 00 00       	call   401530 <gets>
            int fd = open(path, O_WRONLY);
  400c83:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400c8a:	be 01 00 00 00       	mov    esi,0x1
  400c8f:	48 89 c7             	mov    rdi,rax
  400c92:	e8 c9 02 00 00       	call   400f60 <open>
  400c97:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            if (fd < 0) {
  400c9a:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  400c9e:	79 23                	jns    400cc3 <main+0xc88>
                printf("open file %s failed\n", path);
  400ca0:	48 8d 85 d0 fd ff ff 	lea    rax,[rbp-0x230]
  400ca7:	48 89 c6             	mov    rsi,rax
  400caa:	48 8d 05 c3 49 00 00 	lea    rax,[rip+0x49c3]        # 405674 <b+0x188>
  400cb1:	48 89 c7             	mov    rdi,rax
  400cb4:	b8 00 00 00 00       	mov    eax,0x0
  400cb9:	e8 c2 2b 00 00       	call   403880 <printf>
  400cbe:	e9 00 f5 ff ff       	jmp    4001c3 <main+0x188>
            }
            else {
                char buffer[100] = {0};
  400cc3:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400cca:	00 00 00 00 
  400cce:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400cd5:	00 00 00 00 
  400cd9:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400ce0:	00 00 00 00 
  400ce4:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400ceb:	00 00 00 00 
  400cef:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  400cf6:	00 00 00 00 
  400cfa:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  400d01:	00 00 00 00 
  400d05:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  400d0c:	00 00 00 00 
  400d10:	48 c7 85 6c fe ff ff 	mov    QWORD PTR [rbp-0x194],0x0
  400d17:	00 00 00 00 
  400d1b:	48 c7 85 74 fe ff ff 	mov    QWORD PTR [rbp-0x18c],0x0
  400d22:	00 00 00 00 
  400d26:	48 c7 85 7c fe ff ff 	mov    QWORD PTR [rbp-0x184],0x0
  400d2d:	00 00 00 00 
  400d31:	48 c7 85 84 fe ff ff 	mov    QWORD PTR [rbp-0x17c],0x0
  400d38:	00 00 00 00 
  400d3c:	48 c7 85 8c fe ff ff 	mov    QWORD PTR [rbp-0x174],0x0
  400d43:	00 00 00 00 
  400d47:	c7 85 94 fe ff ff 00 	mov    DWORD PTR [rbp-0x16c],0x0
  400d4e:	00 00 00 
                printf("input content:");
  400d51:	48 8d 05 3b 49 00 00 	lea    rax,[rip+0x493b]        # 405693 <b+0x1a7>
  400d58:	48 89 c7             	mov    rdi,rax
  400d5b:	b8 00 00 00 00       	mov    eax,0x0
  400d60:	e8 1b 2b 00 00       	call   403880 <printf>
                gets(buffer);
  400d65:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400d6c:	48 89 c7             	mov    rdi,rax
  400d6f:	e8 bc 07 00 00       	call   401530 <gets>
                int len = strlen(buffer);
  400d74:	48 8d 85 34 fe ff ff 	lea    rax,[rbp-0x1cc]
  400d7b:	48 89 c7             	mov    rdi,rax
  400d7e:	e8 1d 09 00 00       	call   4016a0 <strlen>
  400d83:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
                write(fd, buffer, len);
  400d86:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  400d89:	48 63 d0             	movsxd rdx,eax
  400d8c:	48 8d 8d 34 fe ff ff 	lea    rcx,[rbp-0x1cc]
  400d93:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  400d96:	48 89 ce             	mov    rsi,rcx
  400d99:	89 c7                	mov    edi,eax
  400d9b:	e8 f0 01 00 00       	call   400f90 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400da0:	48 8d 95 d0 fd ff ff 	lea    rdx,[rbp-0x230]
  400da7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  400daa:	89 c6                	mov    esi,eax
  400dac:	48 8d 05 f5 48 00 00 	lea    rax,[rip+0x48f5]        # 4056a8 <b+0x1bc>
  400db3:	48 89 c7             	mov    rdi,rax
  400db6:	b8 00 00 00 00       	mov    eax,0x0
  400dbb:	e8 c0 2a 00 00       	call   403880 <printf>
                close(fd);
  400dc0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  400dc3:	89 c7                	mov    edi,eax
  400dc5:	e8 a6 01 00 00       	call   400f70 <close>
  400dca:	e9 f4 f3 ff ff       	jmp    4001c3 <main+0x188>
            }
        }
        else {
            printf("trying to execute...\n");
  400dcf:	48 8d 05 f5 48 00 00 	lea    rax,[rip+0x48f5]        # 4056cb <b+0x1df>
  400dd6:	48 89 c7             	mov    rdi,rax
  400dd9:	b8 00 00 00 00       	mov    eax,0x0
  400dde:	e8 9d 2a 00 00       	call   403880 <printf>
            int pid = 0;
  400de3:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
            if ((pid = fork()) == 0) {
  400dea:	e8 71 02 00 00       	call   401060 <fork>
  400def:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  400df2:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  400df6:	75 5c                	jne    400e54 <main+0xe19>
                printf("forked, ready to execve\n");
  400df8:	48 8d 05 e2 48 00 00 	lea    rax,[rip+0x48e2]        # 4056e1 <b+0x1f5>
  400dff:	48 89 c7             	mov    rdi,rax
  400e02:	b8 00 00 00 00       	mov    eax,0x0
  400e07:	e8 74 2a 00 00       	call   403880 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400e0c:	48 8b 95 b8 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x248]
  400e13:	48 8b 8d c0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x240]
  400e1a:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400e21:	48 89 ce             	mov    rsi,rcx
  400e24:	48 89 c7             	mov    rdi,rax
  400e27:	e8 44 02 00 00       	call   401070 <execve>
  400e2c:	83 f8 ff             	cmp    eax,0xffffffff
  400e2f:	75 23                	jne    400e54 <main+0xe19>
                    printf("cannot find file:%s\n", cmd);
  400e31:	48 8d 85 38 ff ff ff 	lea    rax,[rbp-0xc8]
  400e38:	48 89 c6             	mov    rsi,rax
  400e3b:	48 8d 05 b8 48 00 00 	lea    rax,[rip+0x48b8]        # 4056fa <b+0x20e>
  400e42:	48 89 c7             	mov    rdi,rax
  400e45:	b8 00 00 00 00       	mov    eax,0x0
  400e4a:	e8 31 2a 00 00       	call   403880 <printf>
  400e4f:	e9 6f f3 ff ff       	jmp    4001c3 <main+0x188>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  400e54:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  400e57:	89 c6                	mov    esi,eax
  400e59:	48 8d 05 af 48 00 00 	lea    rax,[rip+0x48af]        # 40570f <b+0x223>
  400e60:	48 89 c7             	mov    rdi,rax
  400e63:	b8 00 00 00 00       	mov    eax,0x0
  400e68:	e8 13 2a 00 00       	call   403880 <printf>
            int loc = 0;
  400e6d:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
  400e74:	00 00 00 

            waitpid(pid, &loc, 0);
  400e77:	48 8d 8d b4 fe ff ff 	lea    rcx,[rbp-0x14c]
  400e7e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  400e81:	ba 00 00 00 00       	mov    edx,0x0
  400e86:	48 89 ce             	mov    rsi,rcx
  400e89:	89 c7                	mov    edi,eax
  400e8b:	e8 f0 01 00 00       	call   401080 <waitpid>
  400e90:	e9 2e f3 ff ff       	jmp    4001c3 <main+0x188>
                continue;
  400e95:	90                   	nop
    while (1) {
  400e96:	e9 28 f3 ff ff       	jmp    4001c3 <main+0x188>
            break;
  400e9b:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400e9c:	b8 00 00 00 00       	mov    eax,0x0
  400ea1:	c9                   	leave  
  400ea2:	c3                   	ret    
  400ea3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400eaa:	00 00 00 
  400ead:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000400eb0 <reg_dev>:
  400eb0:	55                   	push   rbp
  400eb1:	48 89 e5             	mov    rbp,rsp
  400eb4:	b8 00 00 00 00       	mov    eax,0x0
  400eb9:	55                   	push   rbp
  400eba:	48 0f 05             	rex.W syscall 
  400ebd:	5d                   	pop    rbp
  400ebe:	c9                   	leave  
  400ebf:	c3                   	ret    

0000000000400ec0 <dispose_dev>:
  400ec0:	55                   	push   rbp
  400ec1:	48 89 e5             	mov    rbp,rsp
  400ec4:	b8 01 00 00 00       	mov    eax,0x1
  400ec9:	55                   	push   rbp
  400eca:	48 0f 05             	rex.W syscall 
  400ecd:	5d                   	pop    rbp
  400ece:	c9                   	leave  
  400ecf:	c3                   	ret    

0000000000400ed0 <reg_drv>:
  400ed0:	55                   	push   rbp
  400ed1:	48 89 e5             	mov    rbp,rsp
  400ed4:	b8 02 00 00 00       	mov    eax,0x2
  400ed9:	55                   	push   rbp
  400eda:	48 0f 05             	rex.W syscall 
  400edd:	5d                   	pop    rbp
  400ede:	c9                   	leave  
  400edf:	c3                   	ret    

0000000000400ee0 <dispose_drv>:
  400ee0:	55                   	push   rbp
  400ee1:	48 89 e5             	mov    rbp,rsp
  400ee4:	b8 03 00 00 00       	mov    eax,0x3
  400ee9:	55                   	push   rbp
  400eea:	48 0f 05             	rex.W syscall 
  400eed:	5d                   	pop    rbp
  400eee:	c9                   	leave  
  400eef:	c3                   	ret    

0000000000400ef0 <call_drvfunc>:
  400ef0:	55                   	push   rbp
  400ef1:	48 89 e5             	mov    rbp,rsp
  400ef4:	b8 04 00 00 00       	mov    eax,0x4
  400ef9:	55                   	push   rbp
  400efa:	48 0f 05             	rex.W syscall 
  400efd:	5d                   	pop    rbp
  400efe:	c9                   	leave  
  400eff:	c3                   	ret    

0000000000400f00 <req_mem>:
  400f00:	55                   	push   rbp
  400f01:	48 89 e5             	mov    rbp,rsp
  400f04:	b8 05 00 00 00       	mov    eax,0x5
  400f09:	55                   	push   rbp
  400f0a:	48 0f 05             	rex.W syscall 
  400f0d:	5d                   	pop    rbp
  400f0e:	c9                   	leave  
  400f0f:	c3                   	ret    

0000000000400f10 <free_mem>:
  400f10:	55                   	push   rbp
  400f11:	48 89 e5             	mov    rbp,rsp
  400f14:	b8 06 00 00 00       	mov    eax,0x6
  400f19:	55                   	push   rbp
  400f1a:	48 0f 05             	rex.W syscall 
  400f1d:	5d                   	pop    rbp
  400f1e:	c9                   	leave  
  400f1f:	c3                   	ret    

0000000000400f20 <reg_proc>:
  400f20:	55                   	push   rbp
  400f21:	48 89 e5             	mov    rbp,rsp
  400f24:	b8 07 00 00 00       	mov    eax,0x7
  400f29:	55                   	push   rbp
  400f2a:	48 0f 05             	rex.W syscall 
  400f2d:	5d                   	pop    rbp
  400f2e:	c9                   	leave  
  400f2f:	c3                   	ret    

0000000000400f30 <del_proc>:
  400f30:	55                   	push   rbp
  400f31:	48 89 e5             	mov    rbp,rsp
  400f34:	b8 08 00 00 00       	mov    eax,0x8
  400f39:	55                   	push   rbp
  400f3a:	48 0f 05             	rex.W syscall 
  400f3d:	5d                   	pop    rbp
  400f3e:	c9                   	leave  
  400f3f:	c3                   	ret    

0000000000400f40 <get_proc_addr>:
  400f40:	55                   	push   rbp
  400f41:	48 89 e5             	mov    rbp,rsp
  400f44:	b8 09 00 00 00       	mov    eax,0x9
  400f49:	55                   	push   rbp
  400f4a:	48 0f 05             	rex.W syscall 
  400f4d:	5d                   	pop    rbp
  400f4e:	c9                   	leave  
  400f4f:	c3                   	ret    

0000000000400f50 <chk_vm>:
  400f50:	55                   	push   rbp
  400f51:	48 89 e5             	mov    rbp,rsp
  400f54:	b8 0a 00 00 00       	mov    eax,0xa
  400f59:	55                   	push   rbp
  400f5a:	48 0f 05             	rex.W syscall 
  400f5d:	5d                   	pop    rbp
  400f5e:	c9                   	leave  
  400f5f:	c3                   	ret    

0000000000400f60 <open>:
  400f60:	55                   	push   rbp
  400f61:	48 89 e5             	mov    rbp,rsp
  400f64:	b8 0b 00 00 00       	mov    eax,0xb
  400f69:	55                   	push   rbp
  400f6a:	48 0f 05             	rex.W syscall 
  400f6d:	5d                   	pop    rbp
  400f6e:	c9                   	leave  
  400f6f:	c3                   	ret    

0000000000400f70 <close>:
  400f70:	55                   	push   rbp
  400f71:	48 89 e5             	mov    rbp,rsp
  400f74:	b8 0c 00 00 00       	mov    eax,0xc
  400f79:	55                   	push   rbp
  400f7a:	48 0f 05             	rex.W syscall 
  400f7d:	5d                   	pop    rbp
  400f7e:	c9                   	leave  
  400f7f:	c3                   	ret    

0000000000400f80 <read>:
  400f80:	55                   	push   rbp
  400f81:	48 89 e5             	mov    rbp,rsp
  400f84:	b8 0d 00 00 00       	mov    eax,0xd
  400f89:	55                   	push   rbp
  400f8a:	48 0f 05             	rex.W syscall 
  400f8d:	5d                   	pop    rbp
  400f8e:	c9                   	leave  
  400f8f:	c3                   	ret    

0000000000400f90 <write>:
  400f90:	55                   	push   rbp
  400f91:	48 89 e5             	mov    rbp,rsp
  400f94:	b8 0e 00 00 00       	mov    eax,0xe
  400f99:	55                   	push   rbp
  400f9a:	48 0f 05             	rex.W syscall 
  400f9d:	5d                   	pop    rbp
  400f9e:	c9                   	leave  
  400f9f:	c3                   	ret    

0000000000400fa0 <seek>:
  400fa0:	55                   	push   rbp
  400fa1:	48 89 e5             	mov    rbp,rsp
  400fa4:	b8 0f 00 00 00       	mov    eax,0xf
  400fa9:	55                   	push   rbp
  400faa:	48 0f 05             	rex.W syscall 
  400fad:	5d                   	pop    rbp
  400fae:	c9                   	leave  
  400faf:	c3                   	ret    

0000000000400fb0 <tell>:
  400fb0:	55                   	push   rbp
  400fb1:	48 89 e5             	mov    rbp,rsp
  400fb4:	b8 10 00 00 00       	mov    eax,0x10
  400fb9:	55                   	push   rbp
  400fba:	48 0f 05             	rex.W syscall 
  400fbd:	5d                   	pop    rbp
  400fbe:	c9                   	leave  
  400fbf:	c3                   	ret    

0000000000400fc0 <reg_vol>:
  400fc0:	55                   	push   rbp
  400fc1:	48 89 e5             	mov    rbp,rsp
  400fc4:	b8 11 00 00 00       	mov    eax,0x11
  400fc9:	55                   	push   rbp
  400fca:	48 0f 05             	rex.W syscall 
  400fcd:	5d                   	pop    rbp
  400fce:	c9                   	leave  
  400fcf:	c3                   	ret    

0000000000400fd0 <free_vol>:
  400fd0:	55                   	push   rbp
  400fd1:	48 89 e5             	mov    rbp,rsp
  400fd4:	b8 12 00 00 00       	mov    eax,0x12
  400fd9:	55                   	push   rbp
  400fda:	48 0f 05             	rex.W syscall 
  400fdd:	5d                   	pop    rbp
  400fde:	c9                   	leave  
  400fdf:	c3                   	ret    

0000000000400fe0 <exec>:
  400fe0:	55                   	push   rbp
  400fe1:	48 89 e5             	mov    rbp,rsp
  400fe4:	b8 13 00 00 00       	mov    eax,0x13
  400fe9:	55                   	push   rbp
  400fea:	48 0f 05             	rex.W syscall 
  400fed:	5d                   	pop    rbp
  400fee:	c9                   	leave  
  400fef:	c3                   	ret    

0000000000400ff0 <exit>:
  400ff0:	55                   	push   rbp
  400ff1:	48 89 e5             	mov    rbp,rsp
  400ff4:	b8 14 00 00 00       	mov    eax,0x14
  400ff9:	55                   	push   rbp
  400ffa:	48 0f 05             	rex.W syscall 
  400ffd:	5d                   	pop    rbp
  400ffe:	c9                   	leave  
  400fff:	c3                   	ret    

0000000000401000 <abort>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	b8 14 00 00 00       	mov    eax,0x14
  401009:	55                   	push   rbp
  40100a:	48 0f 05             	rex.W syscall 
  40100d:	5d                   	pop    rbp
  40100e:	c9                   	leave  
  40100f:	c3                   	ret    

0000000000401010 <call>:
  401010:	55                   	push   rbp
  401011:	48 89 e5             	mov    rbp,rsp
  401014:	b8 15 00 00 00       	mov    eax,0x15
  401019:	55                   	push   rbp
  40101a:	48 0f 05             	rex.W syscall 
  40101d:	5d                   	pop    rbp
  40101e:	c9                   	leave  
  40101f:	c3                   	ret    

0000000000401020 <mkfifo>:
  401020:	55                   	push   rbp
  401021:	48 89 e5             	mov    rbp,rsp
  401024:	b8 16 00 00 00       	mov    eax,0x16
  401029:	55                   	push   rbp
  40102a:	48 0f 05             	rex.W syscall 
  40102d:	5d                   	pop    rbp
  40102e:	c9                   	leave  
  40102f:	c3                   	ret    

0000000000401030 <brk>:
  401030:	55                   	push   rbp
  401031:	48 89 e5             	mov    rbp,rsp
  401034:	b8 17 00 00 00       	mov    eax,0x17
  401039:	55                   	push   rbp
  40103a:	48 0f 05             	rex.W syscall 
  40103d:	5d                   	pop    rbp
  40103e:	c9                   	leave  
  40103f:	c3                   	ret    

0000000000401040 <find_dev>:
  401040:	55                   	push   rbp
  401041:	48 89 e5             	mov    rbp,rsp
  401044:	b8 19 00 00 00       	mov    eax,0x19
  401049:	55                   	push   rbp
  40104a:	48 0f 05             	rex.W syscall 
  40104d:	5d                   	pop    rbp
  40104e:	c9                   	leave  
  40104f:	c3                   	ret    

0000000000401050 <operate_dev>:
  401050:	55                   	push   rbp
  401051:	48 89 e5             	mov    rbp,rsp
  401054:	b8 1a 00 00 00       	mov    eax,0x1a
  401059:	55                   	push   rbp
  40105a:	48 0f 05             	rex.W syscall 
  40105d:	5d                   	pop    rbp
  40105e:	c9                   	leave  
  40105f:	c3                   	ret    

0000000000401060 <fork>:
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	b8 1b 00 00 00       	mov    eax,0x1b
  401069:	55                   	push   rbp
  40106a:	48 0f 05             	rex.W syscall 
  40106d:	5d                   	pop    rbp
  40106e:	c9                   	leave  
  40106f:	c3                   	ret    

0000000000401070 <execve>:
  401070:	55                   	push   rbp
  401071:	48 89 e5             	mov    rbp,rsp
  401074:	b8 1c 00 00 00       	mov    eax,0x1c
  401079:	55                   	push   rbp
  40107a:	48 0f 05             	rex.W syscall 
  40107d:	5d                   	pop    rbp
  40107e:	c9                   	leave  
  40107f:	c3                   	ret    

0000000000401080 <waitpid>:
  401080:	55                   	push   rbp
  401081:	48 89 e5             	mov    rbp,rsp
  401084:	b8 1d 00 00 00       	mov    eax,0x1d
  401089:	55                   	push   rbp
  40108a:	48 0f 05             	rex.W syscall 
  40108d:	5d                   	pop    rbp
  40108e:	c9                   	leave  
  40108f:	c3                   	ret    

0000000000401090 <mmap>:
  401090:	55                   	push   rbp
  401091:	48 89 e5             	mov    rbp,rsp
  401094:	b8 1e 00 00 00       	mov    eax,0x1e
  401099:	55                   	push   rbp
  40109a:	48 0f 05             	rex.W syscall 
  40109d:	5d                   	pop    rbp
  40109e:	c9                   	leave  
  40109f:	c3                   	ret    

00000000004010a0 <munmap>:
  4010a0:	55                   	push   rbp
  4010a1:	48 89 e5             	mov    rbp,rsp
  4010a4:	b8 1f 00 00 00       	mov    eax,0x1f
  4010a9:	55                   	push   rbp
  4010aa:	48 0f 05             	rex.W syscall 
  4010ad:	5d                   	pop    rbp
  4010ae:	c9                   	leave  
  4010af:	c3                   	ret    

00000000004010b0 <mknod>:
  4010b0:	55                   	push   rbp
  4010b1:	48 89 e5             	mov    rbp,rsp
  4010b4:	b8 21 00 00 00       	mov    eax,0x21
  4010b9:	55                   	push   rbp
  4010ba:	48 0f 05             	rex.W syscall 
  4010bd:	5d                   	pop    rbp
  4010be:	c9                   	leave  
  4010bf:	c3                   	ret    

00000000004010c0 <kb_readc>:
  4010c0:	55                   	push   rbp
  4010c1:	48 89 e5             	mov    rbp,rsp
  4010c4:	b8 64 00 00 00       	mov    eax,0x64
  4010c9:	55                   	push   rbp
  4010ca:	48 0f 05             	rex.W syscall 
  4010cd:	5d                   	pop    rbp
  4010ce:	c9                   	leave  
  4010cf:	c3                   	ret    

00000000004010d0 <remove>:
  4010d0:	55                   	push   rbp
  4010d1:	48 89 e5             	mov    rbp,rsp
  4010d4:	b8 22 00 00 00       	mov    eax,0x22
  4010d9:	55                   	push   rbp
  4010da:	48 0f 05             	rex.W syscall 
  4010dd:	5d                   	pop    rbp
  4010de:	c9                   	leave  
  4010df:	c3                   	ret    

00000000004010e0 <sbrk>:
  4010e0:	55                   	push   rbp
  4010e1:	48 89 e5             	mov    rbp,rsp
  4010e4:	b8 23 00 00 00       	mov    eax,0x23
  4010e9:	55                   	push   rbp
  4010ea:	48 0f 05             	rex.W syscall 
  4010ed:	5d                   	pop    rbp
  4010ee:	c9                   	leave  
  4010ef:	c3                   	ret    

00000000004010f0 <chkmmap>:
  4010f0:	55                   	push   rbp
  4010f1:	48 89 e5             	mov    rbp,rsp
  4010f4:	b8 24 00 00 00       	mov    eax,0x24
  4010f9:	55                   	push   rbp
  4010fa:	48 0f 05             	rex.W syscall 
  4010fd:	5d                   	pop    rbp
  4010fe:	c9                   	leave  
  4010ff:	c3                   	ret    

0000000000401100 <_readdir>:
  401100:	55                   	push   rbp
  401101:	48 89 e5             	mov    rbp,rsp
  401104:	b8 25 00 00 00       	mov    eax,0x25
  401109:	55                   	push   rbp
  40110a:	48 0f 05             	rex.W syscall 
  40110d:	5d                   	pop    rbp
  40110e:	c9                   	leave  
  40110f:	c3                   	ret    

0000000000401110 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  401110:	f3 0f 1e fa          	endbr64 
  401114:	55                   	push   rbp
  401115:	48 89 e5             	mov    rbp,rsp
  401118:	48 83 ec 20          	sub    rsp,0x20
  40111c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  401120:	bf 20 00 00 00       	mov    edi,0x20
  401125:	e8 96 32 00 00       	call   4043c0 <malloc>
  40112a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  40112e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  401133:	75 0a                	jne    40113f <opendir+0x2f>
	{
		return NULL;
  401135:	b8 00 00 00 00       	mov    eax,0x0
  40113a:	e9 a6 00 00 00       	jmp    4011e5 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  40113f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401143:	be 00 40 00 00       	mov    esi,0x4000
  401148:	48 89 c7             	mov    rdi,rax
  40114b:	e8 10 fe ff ff       	call   400f60 <open>
  401150:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  401154:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  401156:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40115a:	8b 00                	mov    eax,DWORD PTR [rax]
  40115c:	85 c0                	test   eax,eax
  40115e:	79 13                	jns    401173 <opendir+0x63>
	{
		free(dirp);
  401160:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401164:	48 89 c7             	mov    rdi,rax
  401167:	e8 54 2c 00 00       	call   403dc0 <free>
		return NULL;
  40116c:	b8 00 00 00 00       	mov    eax,0x0
  401171:	eb 72                	jmp    4011e5 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  401173:	bf 00 04 00 00       	mov    edi,0x400
  401178:	e8 43 32 00 00       	call   4043c0 <malloc>
  40117d:	48 89 c2             	mov    rdx,rax
  401180:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401184:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  401188:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40118c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401190:	48 85 c0             	test   rax,rax
  401193:	75 20                	jne    4011b5 <opendir+0xa5>
	{
		close(dirp->fd);
  401195:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401199:	8b 00                	mov    eax,DWORD PTR [rax]
  40119b:	89 c7                	mov    edi,eax
  40119d:	e8 ce fd ff ff       	call   400f70 <close>
		free(dirp);
  4011a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011a6:	48 89 c7             	mov    rdi,rax
  4011a9:	e8 12 2c 00 00       	call   403dc0 <free>
		return NULL;
  4011ae:	b8 00 00 00 00       	mov    eax,0x0
  4011b3:	eb 30                	jmp    4011e5 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  4011b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011b9:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  4011c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011c4:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  4011cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011cf:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  4011d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011da:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  4011e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  4011e5:	c9                   	leave  
  4011e6:	c3                   	ret    

00000000004011e7 <closedir>:

int closedir(DIR* dirp)
{
  4011e7:	f3 0f 1e fa          	endbr64 
  4011eb:	55                   	push   rbp
  4011ec:	48 89 e5             	mov    rbp,rsp
  4011ef:	48 83 ec 50          	sub    rsp,0x50
  4011f3:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  4011f7:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  4011fc:	75 0a                	jne    401208 <closedir+0x21>
	{
		return -1;
  4011fe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401203:	e9 88 00 00 00       	jmp    401290 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  401208:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40120c:	8b 00                	mov    eax,DWORD PTR [rax]
  40120e:	48 98                	cdqe   
  401210:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  401217:	00 
  401218:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40121c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401223:	00 
  401224:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40122b:	00 
  40122c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401233:	00 
  401234:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40123b:	00 
  40123c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401243:	00 
#define SYSCALL_READDIR 37
#define SYSCALL_CHDIR 38
#define SYSCALL_RENAME 39
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  401244:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401248:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40124c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401250:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401254:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401258:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40125c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401260:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  401263:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40126a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40126b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  40126f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401273:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401277:	48 89 c7             	mov    rdi,rax
  40127a:	e8 41 2b 00 00       	call   403dc0 <free>
	free(dirp);
  40127f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401283:	48 89 c7             	mov    rdi,rax
  401286:	e8 35 2b 00 00       	call   403dc0 <free>
	return 0;
  40128b:	b8 00 00 00 00       	mov    eax,0x0
}
  401290:	c9                   	leave  
  401291:	c3                   	ret    

0000000000401292 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  401292:	f3 0f 1e fa          	endbr64 
  401296:	55                   	push   rbp
  401297:	48 89 e5             	mov    rbp,rsp
  40129a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  40129e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4012a2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  4012a6:	48 89 c2             	mov    rdx,rax
  4012a9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4012ad:	8b 00                	mov    eax,DWORD PTR [rax]
  4012af:	48 98                	cdqe   
  4012b1:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  4012b8:	00 
  4012b9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4012bd:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4012c1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4012c8:	00 
  4012c9:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4012d0:	00 
  4012d1:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4012d8:	00 
  4012d9:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4012e0:	00 
        __asm__ volatile(".byte 0x48\n"
  4012e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4012e5:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4012e9:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4012ed:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4012f1:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4012f5:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4012f9:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4012fd:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401300:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401307:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  401308:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40130c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401310:	85 c0                	test   eax,eax
  401312:	79 12                	jns    401326 <readdir+0x94>
	{
		dirp->eof = 1;
  401314:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401318:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  40131f:	b8 00 00 00 00       	mov    eax,0x0
  401324:	eb 08                	jmp    40132e <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  401326:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40132a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  40132e:	5d                   	pop    rbp
  40132f:	c3                   	ret    

0000000000401330 <chdir>:
int chdir(const char* name)
{
  401330:	f3 0f 1e fa          	endbr64 
  401334:	55                   	push   rbp
  401335:	48 89 e5             	mov    rbp,rsp
  401338:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  40133c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401340:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  401347:	00 
  401348:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40134c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401353:	00 
  401354:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40135b:	00 
  40135c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401363:	00 
  401364:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40136b:	00 
  40136c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401373:	00 
        __asm__ volatile(".byte 0x48\n"
  401374:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401378:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40137c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401380:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401384:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401388:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40138c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401390:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401393:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40139a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40139b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40139f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  4013a3:	5d                   	pop    rbp
  4013a4:	c3                   	ret    

00000000004013a5 <creat>:
int creat(const char* name, mode_t mode)
{
  4013a5:	f3 0f 1e fa          	endbr64 
  4013a9:	55                   	push   rbp
  4013aa:	48 89 e5             	mov    rbp,rsp
  4013ad:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  4013b1:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
	return do_syscall(SYSCALL_OPEN, (long long)name,
  4013b4:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  4013b7:	83 c8 41             	or     eax,0x41
  4013ba:	48 98                	cdqe   
  4013bc:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  4013c0:	48 c7 45 f8 0b 00 00 	mov    QWORD PTR [rbp-0x8],0xb
  4013c7:	00 
  4013c8:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  4013cc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4013d0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4013d7:	00 
  4013d8:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4013df:	00 
  4013e0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4013e7:	00 
  4013e8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4013ef:	00 
        __asm__ volatile(".byte 0x48\n"
  4013f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013f4:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4013f8:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4013fc:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401400:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401404:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401408:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40140c:	48 0f 05             	rex.W syscall 
        long long ret=0;
  40140f:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401416:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  401417:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40141b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
					  (long long)O_CREAT | (long long)O_WRONLY | (long long)mode, 0, 0, 0, 0);
}
  40141f:	5d                   	pop    rbp
  401420:	c3                   	ret    

0000000000401421 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  401421:	f3 0f 1e fa          	endbr64 
  401425:	55                   	push   rbp
  401426:	48 89 e5             	mov    rbp,rsp
  401429:	48 83 ec 10          	sub    rsp,0x10
  40142d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  401431:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
	return creat(path, mode | O_DIRECTORY);
  401434:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401437:	80 cc 40             	or     ah,0x40
  40143a:	89 c2                	mov    edx,eax
  40143c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401440:	89 d6                	mov    esi,edx
  401442:	48 89 c7             	mov    rdi,rax
  401445:	e8 5b ff ff ff       	call   4013a5 <creat>
}
  40144a:	c9                   	leave  
  40144b:	c3                   	ret    

000000000040144c <rename>:
int rename(const char* oldpath, const char* newpath)
{
  40144c:	f3 0f 1e fa          	endbr64 
  401450:	55                   	push   rbp
  401451:	48 89 e5             	mov    rbp,rsp
  401454:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401458:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  40145c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401460:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401464:	48 c7 45 f8 27 00 00 	mov    QWORD PTR [rbp-0x8],0x27
  40146b:	00 
  40146c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  401470:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401474:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40147b:	00 
  40147c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401483:	00 
  401484:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40148b:	00 
  40148c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401493:	00 
        __asm__ volatile(".byte 0x48\n"
  401494:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401498:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40149c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4014a0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4014a4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4014a8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4014ac:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4014b0:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4014b3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014ba:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4014bb:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4014bf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4014c3:	5d                   	pop    rbp
  4014c4:	c3                   	ret    

Disassembly of section .text.puts:

00000000004014d0 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  4014d0:	f3 0f 1e fa          	endbr64 
  4014d4:	41 54                	push   r12
  4014d6:	55                   	push   rbp
  4014d7:	48 89 fd             	mov    rbp,rdi
  4014da:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  4014db:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  4014de:	40 84 ff             	test   dil,dil
  4014e1:	74 35                	je     401518 <puts+0x48>
  4014e3:	31 db                	xor    ebx,ebx
  4014e5:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  4014e8:	e8 f3 25 00 00       	call   403ae0 <putchar>
  4014ed:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  4014f0:	48 83 c3 01          	add    rbx,0x1
  4014f4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4014f9:	40 84 ff             	test   dil,dil
  4014fc:	75 ea                	jne    4014e8 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  4014fe:	bf 0a 00 00 00       	mov    edi,0xa
  401503:	e8 d8 25 00 00       	call   403ae0 <putchar>
		r++;
  401508:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  40150d:	5b                   	pop    rbx
  40150e:	5d                   	pop    rbp
  40150f:	41 5c                	pop    r12
  401511:	c3                   	ret    
  401512:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401518:	5b                   	pop    rbx
	return r ? r : EOF;
  401519:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  40151e:	5d                   	pop    rbp
  40151f:	41 5c                	pop    r12
  401521:	c3                   	ret    

Disassembly of section .text.gets:

0000000000401530 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  401530:	f3 0f 1e fa          	endbr64 
  401534:	41 54                	push   r12
  401536:	49 89 fc             	mov    r12,rdi
  401539:	eb 14                	jmp    40154f <gets+0x1f>
  40153b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  401540:	3c 08                	cmp    al,0x8
  401542:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  401547:	4c 0f 44 e2          	cmove  r12,rdx
		}
		str++;
  40154b:	49 83 c4 01          	add    r12,0x1
		read(1, str, 1);
  40154f:	ba 01 00 00 00       	mov    edx,0x1
  401554:	4c 89 e6             	mov    rsi,r12
  401557:	bf 01 00 00 00       	mov    edi,0x1
  40155c:	31 c0                	xor    eax,eax
  40155e:	e8 1d fa ff ff       	call   400f80 <read>
		if(*str == '\n')
  401563:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  401568:	3c 0a                	cmp    al,0xa
  40156a:	75 d4                	jne    401540 <gets+0x10>
	}
	return str;
  40156c:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  40156f:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401574:	41 5c                	pop    r12
  401576:	c3                   	ret    

Disassembly of section .text.memset:

0000000000401580 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401580:	f3 0f 1e fa          	endbr64 
  401584:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401587:	48 85 d2             	test   rdx,rdx
  40158a:	74 77                	je     401603 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40158c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401591:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401594:	48 83 fa 02          	cmp    rdx,0x2
  401598:	76 69                	jbe    401603 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40159a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40159f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  4015a3:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  4015a8:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  4015ac:	48 83 fa 06          	cmp    rdx,0x6
  4015b0:	76 51                	jbe    401603 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  4015b2:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  4015b7:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  4015bb:	48 83 fa 08          	cmp    rdx,0x8
  4015bf:	76 42                	jbe    401603 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  4015c1:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  4015c4:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4015c8:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  4015cb:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4015ce:	45 89 c1             	mov    r9d,r8d
	s += k;
  4015d1:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  4015d5:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4015d8:	44 89 c7             	mov    edi,r8d
  4015db:	41 c1 e1 10          	shl    r9d,0x10
  4015df:	c1 e7 08             	shl    edi,0x8
  4015e2:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  4015e6:	44 09 cf             	or     edi,r9d
  4015e9:	48 01 ca             	add    rdx,rcx
  4015ec:	44 09 c7             	or     edi,r8d
  4015ef:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  4015f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  4015f8:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  4015fa:	48 83 c1 04          	add    rcx,0x4
  4015fe:	48 39 ca             	cmp    rdx,rcx
  401601:	75 f5                	jne    4015f8 <memset+0x78>
	}

	return dest;
}
  401603:	c3                   	ret    

Disassembly of section .text.strcat:

0000000000401610 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  401610:	f3 0f 1e fa          	endbr64 
  401614:	41 54                	push   r12
  401616:	49 89 fc             	mov    r12,rdi
  401619:	55                   	push   rbp
  40161a:	48 89 f5             	mov    rbp,rsi
  40161d:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  40161e:	e8 7d 00 00 00       	call   4016a0 <strlen>
	const size_t srclen = strlen(src);
  401623:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  401626:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  401629:	e8 72 00 00 00       	call   4016a0 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  40162e:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  401632:	48 89 ee             	mov    rsi,rbp
  401635:	48 8d 50 01          	lea    rdx,[rax+0x1]
  401639:	e8 c2 2d 00 00       	call   404400 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  40163e:	4c 89 e0             	mov    rax,r12
  401641:	5b                   	pop    rbx
  401642:	5d                   	pop    rbp
  401643:	41 5c                	pop    r12
  401645:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000401650 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  401650:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  401654:	48 39 f7             	cmp    rdi,rsi
  401657:	74 34                	je     40168d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  401659:	48 85 ff             	test   rdi,rdi
  40165c:	74 38                	je     401696 <strcmp+0x46>
  40165e:	48 85 f6             	test   rsi,rsi
  401661:	74 33                	je     401696 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  401663:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401666:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401669:	38 ca                	cmp    dl,cl
  40166b:	75 23                	jne    401690 <strcmp+0x40>
  40166d:	b8 01 00 00 00       	mov    eax,0x1
  401672:	eb 15                	jmp    401689 <strcmp+0x39>
  401674:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401678:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40167c:	48 83 c0 01          	add    rax,0x1
  401680:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401685:	38 ca                	cmp    dl,cl
  401687:	75 07                	jne    401690 <strcmp+0x40>
		{
			if(*s1 == 0)
  401689:	84 d2                	test   dl,dl
  40168b:	75 eb                	jne    401678 <strcmp+0x28>
		return 0;
  40168d:	31 c0                	xor    eax,eax
  40168f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  401690:	0f be c2             	movsx  eax,dl
  401693:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  401695:	c3                   	ret    
	int r = -1;
  401696:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40169b:	c3                   	ret    

Disassembly of section .text.strlen:

00000000004016a0 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  4016a0:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  4016a4:	48 89 fe             	mov    rsi,rdi
  4016a7:	40 f6 c7 07          	test   dil,0x7
  4016ab:	75 0d                	jne    4016ba <strlen+0x1a>
  4016ad:	eb 21                	jmp    4016d0 <strlen+0x30>
  4016af:	90                   	nop
  4016b0:	48 83 c7 01          	add    rdi,0x1
  4016b4:	40 f6 c7 07          	test   dil,0x7
  4016b8:	74 16                	je     4016d0 <strlen+0x30>
	{
		if(*p == '\0')
  4016ba:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4016bd:	75 f1                	jne    4016b0 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  4016bf:	48 89 f8             	mov    rax,rdi
  4016c2:	48 29 f0             	sub    rax,rsi
  4016c5:	c3                   	ret    
  4016c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4016cd:	00 00 00 
		if((*lp - mask01) & mask80)
  4016d0:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  4016d7:	fe fe fe 
  4016da:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  4016e1:	80 80 80 
  4016e4:	eb 38                	jmp    40171e <strlen+0x7e>
  4016e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4016ed:	00 00 00 
			testbyte(1);
  4016f0:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  4016f4:	74 3a                	je     401730 <strlen+0x90>
			testbyte(2);
  4016f6:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  4016fa:	74 3c                	je     401738 <strlen+0x98>
			testbyte(3);
  4016fc:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  401700:	74 3e                	je     401740 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  401702:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  401706:	74 40                	je     401748 <strlen+0xa8>
			testbyte(5);
  401708:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  40170c:	74 42                	je     401750 <strlen+0xb0>
			testbyte(6);
  40170e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  401712:	74 44                	je     401758 <strlen+0xb8>
			testbyte(7);
  401714:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  401718:	74 46                	je     401760 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  40171a:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  40171e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401721:	48 01 c8             	add    rax,rcx
  401724:	48 85 d0             	test   rax,rdx
  401727:	74 f1                	je     40171a <strlen+0x7a>
			testbyte(0);
  401729:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40172c:	75 c2                	jne    4016f0 <strlen+0x50>
  40172e:	eb 8f                	jmp    4016bf <strlen+0x1f>
			testbyte(1);
  401730:	48 29 f7             	sub    rdi,rsi
  401733:	48 8d 47 01          	lea    rax,[rdi+0x1]
  401737:	c3                   	ret    
			testbyte(2);
  401738:	48 29 f7             	sub    rdi,rsi
  40173b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  40173f:	c3                   	ret    
			testbyte(3);
  401740:	48 29 f7             	sub    rdi,rsi
  401743:	48 8d 47 03          	lea    rax,[rdi+0x3]
  401747:	c3                   	ret    
			testbyte(4);
  401748:	48 29 f7             	sub    rdi,rsi
  40174b:	48 8d 47 04          	lea    rax,[rdi+0x4]
  40174f:	c3                   	ret    
			testbyte(5);
  401750:	48 29 f7             	sub    rdi,rsi
  401753:	48 8d 47 05          	lea    rax,[rdi+0x5]
  401757:	c3                   	ret    
			testbyte(6);
  401758:	48 29 f7             	sub    rdi,rsi
  40175b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  40175f:	c3                   	ret    
			testbyte(7);
  401760:	48 29 f7             	sub    rdi,rsi
  401763:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  401767:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000401770 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  401770:	f3 0f 1e fa          	endbr64 
  401774:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401776:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  40177d:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  40177e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  401785:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401786:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401789:	48 c1 fd 03          	sar    rbp,0x3
  40178d:	74 16                	je     4017a5 <__libc_init_array+0x35>
  40178f:	31 db                	xor    ebx,ebx
  401791:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  401798:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  40179c:	48 83 c3 01          	add    rbx,0x1
  4017a0:	48 39 dd             	cmp    rbp,rbx
  4017a3:	75 f3                	jne    401798 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  4017a5:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  4017ac:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  4017b3:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4017b6:	48 c1 fd 03          	sar    rbp,0x3
  4017ba:	74 11                	je     4017cd <__libc_init_array+0x5d>
  4017bc:	31 db                	xor    ebx,ebx
  4017be:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  4017c0:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  4017c4:	48 83 c3 01          	add    rbx,0x1
  4017c8:	48 39 dd             	cmp    rbp,rbx
  4017cb:	75 f3                	jne    4017c0 <__libc_init_array+0x50>
	}
}
  4017cd:	5b                   	pop    rbx
  4017ce:	5d                   	pop    rbp
  4017cf:	41 5c                	pop    r12
  4017d1:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

00000000004017e0 <__libc_fini_array>:

void __libc_fini_array(void)
{
  4017e0:	f3 0f 1e fa          	endbr64 
  4017e4:	55                   	push   rbp
  4017e5:	53                   	push   rbx
  4017e6:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  4017ea:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  4017f1:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  4017f8:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  4017fb:	48 c1 fb 03          	sar    rbx,0x3
  4017ff:	74 14                	je     401815 <__libc_fini_array+0x35>
  401801:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  401808:	48 83 eb 01          	sub    rbx,0x1
  40180c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  401810:	48 85 db             	test   rbx,rbx
  401813:	75 f3                	jne    401808 <__libc_fini_array+0x28>
	}
}
  401815:	48 83 c4 08          	add    rsp,0x8
  401819:	5b                   	pop    rbx
  40181a:	5d                   	pop    rbp
  40181b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000401820 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  401820:	f3 0f 1e fa          	endbr64 
  401824:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  401828:	48 c7 c7 1f 57 40 00 	mov    rdi,0x40571f
  40182f:	48 c7 c2 24 57 40 00 	mov    rdx,0x405724
  401836:	31 f6                	xor    esi,esi
  401838:	48 29 fa             	sub    rdx,rdi
  40183b:	e8 40 fd ff ff       	call   401580 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  401840:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  401844:	e9 27 ff ff ff       	jmp    401770 <__libc_init_array>

Disassembly of section .text.entry:

0000000000401850 <entry>:
{
  401850:	f3 0f 1e fa          	endbr64 
  401854:	41 54                	push   r12
  401856:	49 89 f4             	mov    r12,rsi
  401859:	55                   	push   rbp
  40185a:	89 fd                	mov    ebp,edi
  40185c:	53                   	push   rbx
  40185d:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  401860:	e8 bb ff ff ff       	call   401820 <CRTStartup>
	environ = _environ;
  401865:	48 c7 c0 28 57 40 00 	mov    rax,0x405728
	__heap_base = sbrk(0);
  40186c:	31 ff                	xor    edi,edi
	environ = _environ;
  40186e:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  401871:	31 c0                	xor    eax,eax
  401873:	e8 68 f8 ff ff       	call   4010e0 <sbrk>
  401878:	48 c7 c2 b0 57 40 00 	mov    rdx,0x4057b0
	return main(argc, argv);
  40187f:	4c 89 e6             	mov    rsi,r12
  401882:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401884:	89 02                	mov    DWORD PTR [rdx],eax
}
  401886:	5b                   	pop    rbx
  401887:	5d                   	pop    rbp
  401888:	41 5c                	pop    r12
	return main(argc, argv);
  40188a:	e9 ac e7 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

0000000000401890 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401890:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401895:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

00000000004018a0 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  4018a0:	e8 eb ff ff ff       	call   401890 <get_bit_access>
  4018a5:	48 c1 e8 3f          	shr    rax,0x3f
}
  4018a9:	c3                   	ret    

Disassembly of section .text.get_exp2:

00000000004018b0 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  4018b0:	48 89 f8             	mov    rax,rdi
  4018b3:	48 c1 e8 34          	shr    rax,0x34
  4018b7:	25 ff 07 00 00       	and    eax,0x7ff
  4018bc:	2d ff 03 00 00       	sub    eax,0x3ff
}
  4018c1:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

00000000004018d0 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  4018d0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  4018d3:	8d 50 01             	lea    edx,[rax+0x1]
  4018d6:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  4018d9:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  4018dc:	73 22                	jae    401900 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  4018de:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  4018e1:	48 85 d2             	test   rdx,rdx
  4018e4:	74 12                	je     4018f8 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  4018e6:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  4018ea:	40 0f be fe          	movsx  edi,sil
  4018ee:	4c 89 c6             	mov    rsi,r8
  4018f1:	ff e2                	jmp    rdx
  4018f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  4018f8:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  4018fc:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  401900:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000401910 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401910:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  401914:	74 0a                	je     401920 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  401916:	c3                   	ret    
  401917:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40191e:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401920:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  401923:	85 d2                	test   edx,edx
  401925:	74 ef                	je     401916 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  401927:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  40192b:	48 85 c9             	test   rcx,rcx
  40192e:	74 e6                	je     401916 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  401930:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401933:	8d 72 ff             	lea    esi,[rdx-0x1]
  401936:	39 c2                	cmp    edx,eax
  401938:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  40193c:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  401940:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401950 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401950:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401957:	48 89 f8             	mov    rax,rdi
  return gadget;
  40195a:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401961:	00 
  401962:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401969:	00 
  40196a:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401971:	00 
}
  401972:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401980 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401980:	48 83 ec 28          	sub    rsp,0x28
  401984:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401987:	48 89 e7             	mov    rdi,rsp
  40198a:	e8 c1 ff ff ff       	call   401950 <discarding_gadget>
  40198f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401994:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401998:	48 85 f6             	test   rsi,rsi
  40199b:	74 33                	je     4019d0 <buffer_gadget+0x50>
  40199d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4019a2:	48 39 c2             	cmp    rdx,rax
  4019a5:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  4019a9:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  4019ad:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  4019b2:	4c 89 c0             	mov    rax,r8
  return result;
  4019b5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  4019ba:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  4019c0:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  4019c4:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  4019c9:	48 83 c4 28          	add    rsp,0x28
  4019cd:	c3                   	ret    
  4019ce:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  4019d0:	48 89 ce             	mov    rsi,rcx
  4019d3:	eb d4                	jmp    4019a9 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

00000000004019e0 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  4019e0:	48 83 ec 28          	sub    rsp,0x28
  4019e4:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  4019e7:	48 89 e7             	mov    rdi,rsp
  4019ea:	e8 61 ff ff ff       	call   401950 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  4019ef:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  4019f3:	4c 89 c0             	mov    rax,r8
  return result;
  4019f6:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  4019fb:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401a00:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401a07:	7f 
  401a08:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401a0e:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401a12:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401a17:	48 83 c4 28          	add    rsp,0x28
  401a1b:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401a20 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401a20:	48 83 ec 08          	sub    rsp,0x8
  401a24:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401a27:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 402210 <putchar_wrapper>
  401a2e:	31 d2                	xor    edx,edx
  401a30:	e8 ab ff ff ff       	call   4019e0 <function_gadget>
}
  401a35:	4c 89 c8             	mov    rax,r9
  401a38:	48 83 c4 08          	add    rsp,0x8
  401a3c:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401a40 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401a40:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401a43:	74 33                	je     401a78 <strnlen_s_+0x38>
  401a45:	85 f6                	test   esi,esi
  401a47:	74 2f                	je     401a78 <strnlen_s_+0x38>
  401a49:	89 f6                	mov    esi,esi
  401a4b:	48 89 f8             	mov    rax,rdi
  401a4e:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401a52:	eb 09                	jmp    401a5d <strnlen_s_+0x1d>
  401a54:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401a58:	48 39 c2             	cmp    rdx,rax
  401a5b:	74 13                	je     401a70 <strnlen_s_+0x30>
  401a5d:	48 83 c0 01          	add    rax,0x1
  401a61:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401a64:	75 f2                	jne    401a58 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401a66:	29 f8                	sub    eax,edi
  401a68:	c3                   	ret    
  401a69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401a70:	89 d0                	mov    eax,edx
  401a72:	29 f8                	sub    eax,edi
  401a74:	c3                   	ret    
  401a75:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401a78:	31 c0                	xor    eax,eax
}
  401a7a:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401a80 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401a80:	83 ef 30             	sub    edi,0x30
  401a83:	40 80 ff 09          	cmp    dil,0x9
  401a87:	0f 96 c0             	setbe  al
}
  401a8a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401a90 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401a90:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401a93:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401a96:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401a99:	eb 19                	jmp    401ab4 <atou_+0x24>
  401a9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401aa0:	48 83 c2 01          	add    rdx,0x1
  401aa4:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401aa8:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401aab:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401aaf:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401ab4:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401ab7:	e8 c4 ff ff ff       	call   401a80 <is_digit_>
  401abc:	84 c0                	test   al,al
  401abe:	75 e0                	jne    401aa0 <atou_+0x10>
  }
  return i;
}
  401ac0:	44 89 c0             	mov    eax,r8d
  401ac3:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401ad0 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401ad0:	41 57                	push   r15
  401ad2:	44 89 c0             	mov    eax,r8d
  401ad5:	49 89 ff             	mov    r15,rdi
  401ad8:	41 56                	push   r14
  401ada:	41 55                	push   r13
  401adc:	41 89 d5             	mov    r13d,edx
  401adf:	41 54                	push   r12
  401ae1:	49 89 f4             	mov    r12,rsi
  401ae4:	55                   	push   rbp
  401ae5:	89 cd                	mov    ebp,ecx
  401ae7:	53                   	push   rbx
  401ae8:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401aec:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401af0:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401af5:	a8 03                	test   al,0x3
  401af7:	75 1b                	jne    401b14 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401af9:	39 ca                	cmp    edx,ecx
  401afb:	73 17                	jae    401b14 <out_rev_+0x44>
  401afd:	89 d3                	mov    ebx,edx
  401aff:	90                   	nop
      putchar_via_gadget(output, ' ');
  401b00:	be 20 00 00 00       	mov    esi,0x20
  401b05:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401b08:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401b0b:	e8 c0 fd ff ff       	call   4018d0 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401b10:	39 dd                	cmp    ebp,ebx
  401b12:	75 ec                	jne    401b00 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401b14:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401b18:	4c 01 e3             	add    rbx,r12
  401b1b:	45 85 ed             	test   r13d,r13d
  401b1e:	74 17                	je     401b37 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401b20:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401b23:	4c 89 ff             	mov    rdi,r15
  401b26:	e8 a5 fd ff ff       	call   4018d0 <putchar_via_gadget>
  while (len) {
  401b2b:	48 89 da             	mov    rdx,rbx
  401b2e:	48 83 eb 01          	sub    rbx,0x1
  401b32:	49 39 d4             	cmp    r12,rdx
  401b35:	75 e9                	jne    401b20 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401b37:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401b3c:	74 2a                	je     401b68 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401b3e:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401b42:	44 29 f2             	sub    edx,r14d
  401b45:	39 d5                	cmp    ebp,edx
  401b47:	76 1f                	jbe    401b68 <out_rev_+0x98>
  401b49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401b50:	be 20 00 00 00       	mov    esi,0x20
  401b55:	4c 89 ff             	mov    rdi,r15
  401b58:	e8 73 fd ff ff       	call   4018d0 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401b5d:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401b61:	44 29 f2             	sub    edx,r14d
  401b64:	39 ea                	cmp    edx,ebp
  401b66:	72 e8                	jb     401b50 <out_rev_+0x80>
    }
  }
}
  401b68:	48 83 c4 18          	add    rsp,0x18
  401b6c:	5b                   	pop    rbx
  401b6d:	5d                   	pop    rbp
  401b6e:	41 5c                	pop    r12
  401b70:	41 5d                	pop    r13
  401b72:	41 5e                	pop    r14
  401b74:	41 5f                	pop    r15
  401b76:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401b80 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401b80:	55                   	push   rbp
  401b81:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401b84:	83 fa 1f             	cmp    edx,0x1f
{
  401b87:	49 89 f3             	mov    r11,rsi
  401b8a:	53                   	push   rbx
  401b8b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401b90:	89 d6                	mov    esi,edx
  401b92:	89 cb                	mov    ebx,ecx
  401b94:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401b99:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401b9c:	41 f6 c0 02          	test   r8b,0x2
  401ba0:	0f 85 fa 00 00 00    	jne    401ca0 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401ba6:	44 89 c2             	mov    edx,r8d
  401ba9:	83 e2 01             	and    edx,0x1
  401bac:	45 85 d2             	test   r10d,r10d
  401baf:	0f 84 eb 00 00 00    	je     401ca0 <print_integer_finalization+0x120>
  401bb5:	85 d2                	test   edx,edx
  401bb7:	0f 84 e3 00 00 00    	je     401ca0 <print_integer_finalization+0x120>
  401bbd:	84 c9                	test   cl,cl
  401bbf:	0f 85 cb 01 00 00    	jne    401d90 <print_integer_finalization+0x210>
  401bc5:	41 f6 c0 0c          	test   r8b,0xc
  401bc9:	0f 85 c1 01 00 00    	jne    401d90 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401bcf:	44 39 d6             	cmp    esi,r10d
  401bd2:	0f 83 c8 00 00 00    	jae    401ca0 <print_integer_finalization+0x120>
  401bd8:	84 c0                	test   al,al
  401bda:	0f 84 c0 00 00 00    	je     401ca0 <print_integer_finalization+0x120>
  401be0:	89 f0                	mov    eax,esi
  401be2:	89 f2                	mov    edx,esi
  401be4:	4c 01 d8             	add    rax,r11
  401be7:	eb 0b                	jmp    401bf4 <print_integer_finalization+0x74>
  401be9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401bf0:	84 c9                	test   cl,cl
  401bf2:	74 15                	je     401c09 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401bf4:	83 c2 01             	add    edx,0x1
  401bf7:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401bfa:	83 fa 1f             	cmp    edx,0x1f
  401bfd:	0f 96 c1             	setbe  cl
  401c00:	48 83 c0 01          	add    rax,0x1
  401c04:	44 39 d2             	cmp    edx,r10d
  401c07:	72 e7                	jb     401bf0 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c09:	44 39 ca             	cmp    edx,r9d
  401c0c:	73 26                	jae    401c34 <print_integer_finalization+0xb4>
  401c0e:	84 c9                	test   cl,cl
  401c10:	74 22                	je     401c34 <print_integer_finalization+0xb4>
  401c12:	89 d0                	mov    eax,edx
  401c14:	4c 01 d8             	add    rax,r11
  401c17:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401c1e:	00 00 
      buf[len++] = '0';
  401c20:	83 c2 01             	add    edx,0x1
  401c23:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c26:	48 83 c0 01          	add    rax,0x1
  401c2a:	41 39 d1             	cmp    r9d,edx
  401c2d:	76 05                	jbe    401c34 <print_integer_finalization+0xb4>
  401c2f:	83 fa 1f             	cmp    edx,0x1f
  401c32:	76 ec                	jbe    401c20 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401c34:	39 d6                	cmp    esi,edx
  401c36:	0f 92 c0             	setb   al
  401c39:	40 80 fd 08          	cmp    bpl,0x8
  401c3d:	0f 94 c1             	sete   cl
  401c40:	20 c1                	and    cl,al
  401c42:	74 06                	je     401c4a <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401c44:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401c48:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401c4a:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401c51:	0f 84 8c 00 00 00    	je     401ce3 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401c57:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401c5e:	74 58                	je     401cb8 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c60:	83 fa 1f             	cmp    edx,0x1f
  401c63:	0f 96 c0             	setbe  al
  401c66:	40 80 fd 10          	cmp    bpl,0x10
  401c6a:	0f 84 30 01 00 00    	je     401da0 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c70:	40 80 fd 02          	cmp    bpl,0x2
  401c74:	75 0e                	jne    401c84 <print_integer_finalization+0x104>
  401c76:	84 c0                	test   al,al
  401c78:	74 0a                	je     401c84 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401c7a:	89 d0                	mov    eax,edx
  401c7c:	83 c2 01             	add    edx,0x1
  401c7f:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401c84:	83 fa 20             	cmp    edx,0x20
  401c87:	75 50                	jne    401cd9 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401c89:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401c8a:	44 89 d1             	mov    ecx,r10d
  401c8d:	4c 89 de             	mov    rsi,r11
}
  401c90:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401c91:	e9 3a fe ff ff       	jmp    401ad0 <out_rev_>
  401c96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401c9d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ca0:	44 39 ce             	cmp    esi,r9d
  401ca3:	89 f2                	mov    edx,esi
  401ca5:	0f 92 c1             	setb   cl
  401ca8:	20 c8                	and    al,cl
  401caa:	0f 85 62 ff ff ff    	jne    401c12 <print_integer_finalization+0x92>
  401cb0:	eb 98                	jmp    401c4a <print_integer_finalization+0xca>
  401cb2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401cb8:	85 d2                	test   edx,edx
  401cba:	75 74                	jne    401d30 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cbc:	40 80 fd 10          	cmp    bpl,0x10
  401cc0:	0f 84 05 01 00 00    	je     401dcb <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cc6:	40 80 fd 02          	cmp    bpl,0x2
  401cca:	0f 85 2e 01 00 00    	jne    401dfe <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401cd0:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401cd4:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401cd9:	89 d0                	mov    eax,edx
  401cdb:	83 c2 01             	add    edx,0x1
  401cde:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401ce3:	83 fa 20             	cmp    edx,0x20
  401ce6:	74 a1                	je     401c89 <print_integer_finalization+0x109>
    if (negative) {
  401ce8:	84 db                	test   bl,bl
  401cea:	74 1c                	je     401d08 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401cec:	89 d0                	mov    eax,edx
}
  401cee:	5b                   	pop    rbx
      buf[len++] = '-';
  401cef:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401cf2:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401cf5:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401cfa:	4c 89 de             	mov    rsi,r11
}
  401cfd:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401cfe:	e9 cd fd ff ff       	jmp    401ad0 <out_rev_>
  401d03:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401d08:	41 f6 c0 04          	test   r8b,0x4
  401d0c:	75 62                	jne    401d70 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401d0e:	41 f6 c0 08          	test   r8b,0x8
  401d12:	0f 84 71 ff ff ff    	je     401c89 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401d18:	89 d0                	mov    eax,edx
  401d1a:	83 c2 01             	add    edx,0x1
  401d1d:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  401d22:	e9 62 ff ff ff       	jmp    401c89 <print_integer_finalization+0x109>
  401d27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401d2e:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401d30:	41 39 d1             	cmp    r9d,edx
  401d33:	74 09                	je     401d3e <print_integer_finalization+0x1be>
  401d35:	44 39 d2             	cmp    edx,r10d
  401d38:	0f 85 22 ff ff ff    	jne    401c60 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  401d3e:	84 c0                	test   al,al
  401d40:	0f 85 99 00 00 00    	jne    401ddf <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401d46:	40 80 fd 10          	cmp    bpl,0x10
  401d4a:	0f 94 c0             	sete   al
  401d4d:	40 80 fd 02          	cmp    bpl,0x2
  401d51:	0f 94 c1             	sete   cl
  401d54:	08 c8                	or     al,cl
  401d56:	0f 84 04 ff ff ff    	je     401c60 <print_integer_finalization+0xe0>
  401d5c:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  401d5e:	83 da 00             	sbb    edx,0x0
  401d61:	e9 fa fe ff ff       	jmp    401c60 <print_integer_finalization+0xe0>
  401d66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401d6d:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  401d70:	89 d0                	mov    eax,edx
}
  401d72:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  401d73:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401d76:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  401d79:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  401d7e:	4c 89 de             	mov    rsi,r11
}
  401d81:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401d82:	e9 49 fd ff ff       	jmp    401ad0 <out_rev_>
  401d87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401d8e:	00 00 
        width--;
  401d90:	41 83 ea 01          	sub    r10d,0x1
  401d94:	e9 36 fe ff ff       	jmp    401bcf <print_integer_finalization+0x4f>
  401d99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401da0:	44 89 c1             	mov    ecx,r8d
  401da3:	83 e1 20             	and    ecx,0x20
  401da6:	75 0c                	jne    401db4 <print_integer_finalization+0x234>
  401da8:	84 c0                	test   al,al
  401daa:	75 60                	jne    401e0c <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dac:	85 c9                	test   ecx,ecx
  401dae:	0f 84 d0 fe ff ff    	je     401c84 <print_integer_finalization+0x104>
  401db4:	84 c0                	test   al,al
  401db6:	0f 84 c8 fe ff ff    	je     401c84 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401dbc:	89 d0                	mov    eax,edx
  401dbe:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  401dc1:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  401dc6:	e9 b9 fe ff ff       	jmp    401c84 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dcb:	41 f6 c0 20          	test   r8b,0x20
  401dcf:	75 1f                	jne    401df0 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  401dd1:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  401dd5:	ba 01 00 00 00       	mov    edx,0x1
  401dda:	e9 fa fe ff ff       	jmp    401cd9 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401ddf:	83 ea 01             	sub    edx,0x1
  401de2:	0f 84 d4 fe ff ff    	je     401cbc <print_integer_finalization+0x13c>
  401de8:	e9 59 ff ff ff       	jmp    401d46 <print_integer_finalization+0x1c6>
  401ded:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  401df0:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  401df4:	ba 01 00 00 00       	mov    edx,0x1
  401df9:	e9 db fe ff ff       	jmp    401cd9 <print_integer_finalization+0x159>
      buf[len++] = '0';
  401dfe:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  401e02:	ba 01 00 00 00       	mov    edx,0x1
  401e07:	e9 dc fe ff ff       	jmp    401ce8 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  401e0c:	89 d0                	mov    eax,edx
  401e0e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  401e11:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  401e16:	e9 69 fe ff ff       	jmp    401c84 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000401e20 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401e20:	41 57                	push   r15
  401e22:	41 56                	push   r14
  401e24:	41 55                	push   r13
  401e26:	41 89 cd             	mov    r13d,ecx
  401e29:	41 54                	push   r12
  401e2b:	49 89 fc             	mov    r12,rdi
  401e2e:	55                   	push   rbp
  401e2f:	53                   	push   rbx
  401e30:	89 d3                	mov    ebx,edx
  401e32:	48 83 ec 28          	sub    rsp,0x28
  401e36:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  401e3b:	48 85 f6             	test   rsi,rsi
  401e3e:	75 48                	jne    401e88 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  401e40:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  401e47:	0f 85 a3 00 00 00    	jne    401ef0 <print_integer+0xd0>
      buf[len++] = '0';
  401e4d:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  401e51:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  401e55:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  401e5a:	48 89 e6             	mov    rsi,rsp
  401e5d:	41 56                	push   r14
  401e5f:	0f b6 cb             	movzx  ecx,bl
  401e62:	4c 89 e7             	mov    rdi,r12
  401e65:	41 51                	push   r9
  401e67:	45 89 c1             	mov    r9d,r8d
  401e6a:	45 0f b6 c5          	movzx  r8d,r13b
  401e6e:	e8 0d fd ff ff       	call   401b80 <print_integer_finalization>
}
  401e73:	48 83 c4 38          	add    rsp,0x38
  401e77:	5b                   	pop    rbx
  401e78:	5d                   	pop    rbp
  401e79:	41 5c                	pop    r12
  401e7b:	41 5d                	pop    r13
  401e7d:	41 5e                	pop    r14
  401e7f:	41 5f                	pop    r15
  401e81:	c3                   	ret    
  401e82:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401e88:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  401e8b:	44 0f b6 d1          	movzx  r10d,cl
  401e8f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  401e94:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401e99:	83 e0 20             	and    eax,0x20
  401e9c:	83 f8 01             	cmp    eax,0x1
  401e9f:	45 19 db             	sbb    r11d,r11d
  401ea2:	41 83 e3 20          	and    r11d,0x20
  401ea6:	41 83 c3 37          	add    r11d,0x37
  401eaa:	eb 07                	jmp    401eb3 <print_integer+0x93>
  401eac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  401eb0:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  401eb3:	31 d2                	xor    edx,edx
  401eb5:	48 89 f0             	mov    rax,rsi
  401eb8:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401ebb:	48 83 fa 09          	cmp    rdx,0x9
  401ebf:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  401ec3:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  401ec7:	89 ca                	mov    edx,ecx
  401ec9:	41 0f 46 ff          	cmovbe edi,r15d
  401ecd:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  401ed2:	48 83 c1 01          	add    rcx,0x1
  401ed6:	4c 39 d6             	cmp    rsi,r10
  401ed9:	0f 82 7b ff ff ff    	jb     401e5a <print_integer+0x3a>
  401edf:	83 fa 1f             	cmp    edx,0x1f
  401ee2:	76 cc                	jbe    401eb0 <print_integer+0x90>
  401ee4:	e9 71 ff ff ff       	jmp    401e5a <print_integer+0x3a>
  401ee9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  401ef0:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  401ef3:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  401ef5:	41 83 e6 ef          	and    r14d,0xffffffef
  401ef9:	80 f9 10             	cmp    cl,0x10
  401efc:	44 0f 45 f0          	cmovne r14d,eax
  401f00:	e9 55 ff ff ff       	jmp    401e5a <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000401f10 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  401f10:	e8 8b f9 ff ff       	call   4018a0 <get_sign_bit>
{
  401f15:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  401f18:	85 c0                	test   eax,eax
  401f1a:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  401f1d:	74 08                	je     401f27 <get_components+0x17>
  401f1f:	66 0f 57 05 e9 34 00 	xorpd  xmm0,XMMWORD PTR [rip+0x34e9]        # 405410 <powers_of_10+0x90>
  401f26:	00 
  number_.integral = (int_fast64_t)abs_number;
  401f27:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401f2c:	66 0f ef d2          	pxor   xmm2,xmm2
  401f30:	66 0f 28 c8          	movapd xmm1,xmm0
  401f34:	89 f0                	mov    eax,esi
  401f36:	48 8d 3d 43 34 00 00 	lea    rdi,[rip+0x3443]        # 405380 <powers_of_10>
  401f3d:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  401f42:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  401f47:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  401f4b:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401f4f:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  401f53:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  401f58:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  401f5d:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  401f61:	f2 0f 10 15 b7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34b7]        # 405420 <powers_of_10+0xa0>
  401f68:	00 
  401f69:	66 0f 2f ca          	comisd xmm1,xmm2
  401f6d:	76 51                	jbe    401fc0 <get_components+0xb0>
    ++number_.fractional;
  401f6f:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  401f73:	66 0f ef c9          	pxor   xmm1,xmm1
  401f77:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  401f7c:	66 0f 2f cb          	comisd xmm1,xmm3
  401f80:	73 56                	jae    401fd8 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  401f82:	85 f6                	test   esi,esi
  401f84:	75 27                	jne    401fad <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  401f86:	66 0f ef c9          	pxor   xmm1,xmm1
  401f8a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  401f8f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  401f93:	66 0f 2f d0          	comisd xmm2,xmm0
  401f97:	76 06                	jbe    401f9f <get_components+0x8f>
  401f99:	66 0f 2f c2          	comisd xmm0,xmm2
  401f9d:	76 0e                	jbe    401fad <get_components+0x9d>
  401f9f:	48 89 d6             	mov    rsi,rdx
  401fa2:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  401fa5:	48 83 fe 01          	cmp    rsi,0x1
  401fa9:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  401fad:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  401fb1:	4c 89 c0             	mov    rax,r8
  return number_;
  401fb4:	49 89 10             	mov    QWORD PTR [r8],rdx
  401fb7:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  401fbb:	c3                   	ret    
  401fbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  401fc0:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401fc4:	7a bc                	jp     401f82 <get_components+0x72>
  401fc6:	75 ba                	jne    401f82 <get_components+0x72>
  401fc8:	48 85 c0             	test   rax,rax
  401fcb:	75 13                	jne    401fe0 <get_components+0xd0>
    ++number_.fractional;
  401fcd:	48 83 c0 01          	add    rax,0x1
  401fd1:	eb af                	jmp    401f82 <get_components+0x72>
  401fd3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  401fd8:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  401fdc:	31 c0                	xor    eax,eax
  401fde:	eb a2                	jmp    401f82 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  401fe0:	a8 01                	test   al,0x1
  401fe2:	74 9e                	je     401f82 <get_components+0x72>
  401fe4:	eb e7                	jmp    401fcd <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

0000000000401ff0 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  401ff0:	66 0f 2f 05 20 34 00 	comisd xmm0,QWORD PTR [rip+0x3420]        # 405418 <powers_of_10+0x98>
  401ff7:	00 
  401ff8:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  401ffc:	73 10                	jae    40200e <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  401ffe:	66 0f ef c9          	pxor   xmm1,xmm1
  402002:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402006:	66 0f 2e c8          	ucomisd xmm1,xmm0
  40200a:	7a 04                	jp     402010 <bastardized_floor+0x20>
  40200c:	75 02                	jne    402010 <bastardized_floor+0x20>
}
  40200e:	c3                   	ret    
  40200f:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  402010:	83 e8 01             	sub    eax,0x1
}
  402013:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

0000000000402020 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  402020:	e8 6b f8 ff ff       	call   401890 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  402025:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  40202c:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  40202f:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  402032:	48 89 c7             	mov    rdi,rax
  402035:	e8 76 f8 ff ff       	call   4018b0 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40203a:	48 21 ca             	and    rdx,rcx
  40203d:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  402044:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  402047:	f2 0f 10 1d f1 33 00 	movsd  xmm3,QWORD PTR [rip+0x33f1]        # 405440 <powers_of_10+0xc0>
  40204e:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40204f:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402052:	f2 0f 10 05 d6 33 00 	movsd  xmm0,QWORD PTR [rip+0x33d6]        # 405430 <powers_of_10+0xb0>
  402059:	00 
  double z = (dwba.F - 1.5);
  40205a:	66 48 0f 6e ca       	movq   xmm1,rdx
  40205f:	f2 0f 5c 0d c1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33c1]        # 405428 <powers_of_10+0xa8>
  402066:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402067:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40206b:	66 0f 28 d1          	movapd xmm2,xmm1
  40206f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402073:	f2 0f 58 05 bd 33 00 	addsd  xmm0,QWORD PTR [rip+0x33bd]        # 405438 <powers_of_10+0xb8>
  40207a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40207b:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40207f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402083:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  402087:	f2 0f 59 15 b9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33b9]        # 405448 <powers_of_10+0xc8>
  40208e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40208f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402093:	f2 0f 59 0d b5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33b5]        # 405450 <powers_of_10+0xd0>
  40209a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40209b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40209f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4020a3:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  4020a7:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

00000000004020b0 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  4020b0:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  4020b6:	0f 84 b4 00 00 00    	je     402170 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  4020bc:	66 0f ef d2          	pxor   xmm2,xmm2
  4020c0:	f2 0f 10 05 98 33 00 	movsd  xmm0,QWORD PTR [rip+0x3398]        # 405460 <powers_of_10+0xe0>
  4020c7:	00 
  4020c8:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  4020cc:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  4020d0:	f2 0f 58 05 48 33 00 	addsd  xmm0,QWORD PTR [rip+0x3348]        # 405420 <powers_of_10+0xa0>
  4020d7:	00 
  4020d8:	e8 13 ff ff ff       	call   401ff0 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4020dd:	f2 0f 10 0d 83 33 00 	movsd  xmm1,QWORD PTR [rip+0x3383]        # 405468 <powers_of_10+0xe8>
  4020e4:	00 
  4020e5:	66 0f ef c0          	pxor   xmm0,xmm0
  4020e9:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  4020ed:	f2 0f 59 05 7b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x337b]        # 405470 <powers_of_10+0xf0>
  4020f4:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4020f5:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4020f7:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4020fb:	48 05 ff 03 00 00    	add    rax,0x3ff
  402101:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402105:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40210a:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  40210e:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402112:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  402116:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  40211a:	f2 0f 58 c1          	addsd  xmm0,xmm1
  40211e:	66 0f 28 e2          	movapd xmm4,xmm2
  402122:	f2 0f 5e 25 4e 33 00 	divsd  xmm4,QWORD PTR [rip+0x334e]        # 405478 <powers_of_10+0xf8>
  402129:	00 
  40212a:	66 0f 28 da          	movapd xmm3,xmm2
  40212e:	f2 0f 58 25 4a 33 00 	addsd  xmm4,QWORD PTR [rip+0x334a]        # 405480 <powers_of_10+0x100>
  402135:	00 
  402136:	f2 0f 5e dc          	divsd  xmm3,xmm4
  40213a:	f2 0f 58 1d 46 33 00 	addsd  xmm3,QWORD PTR [rip+0x3346]        # 405488 <powers_of_10+0x108>
  402141:	00 
  402142:	f2 0f 5e d3          	divsd  xmm2,xmm3
  402146:	f2 0f 10 1d 42 33 00 	movsd  xmm3,QWORD PTR [rip+0x3342]        # 405490 <powers_of_10+0x110>
  40214d:	00 
  40214e:	f2 0f 5c d9          	subsd  xmm3,xmm1
  402152:	f2 0f 58 d3          	addsd  xmm2,xmm3
  402156:	f2 0f 5e c2          	divsd  xmm0,xmm2
  40215a:	f2 0f 58 05 36 33 00 	addsd  xmm0,QWORD PTR [rip+0x3336]        # 405498 <powers_of_10+0x118>
  402161:	00 
  402162:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  402166:	c3                   	ret    
  402167:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40216e:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  402170:	f2 0f 10 05 e0 32 00 	movsd  xmm0,QWORD PTR [rip+0x32e0]        # 405458 <powers_of_10+0xd8>
  402177:	00 
}
  402178:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000402180 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  402180:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  402183:	48 8d 0d de 2f 00 00 	lea    rcx,[rip+0x2fde]        # 405168 <memcpy+0xd68>
  40218a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402190:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  402193:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  402196:	83 e8 20             	sub    eax,0x20
  402199:	3c 10                	cmp    al,0x10
  40219b:	77 13                	ja     4021b0 <parse_flags+0x30>
  40219d:	0f b6 c0             	movzx  eax,al
  4021a0:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  4021a4:	48 01 c8             	add    rax,rcx
  4021a7:	3e ff e0             	notrack jmp rax
  4021aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  4021b0:	44 89 c0             	mov    eax,r8d
  4021b3:	c3                   	ret    
  4021b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  4021b8:	41 83 c8 01          	or     r8d,0x1
  4021bc:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4021c0:	48 89 17             	mov    QWORD PTR [rdi],rdx
  4021c3:	eb cb                	jmp    402190 <parse_flags+0x10>
  4021c5:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  4021c8:	41 83 c8 02          	or     r8d,0x2
  4021cc:	48 83 c2 01          	add    rdx,0x1
  4021d0:	eb ee                	jmp    4021c0 <parse_flags+0x40>
  4021d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4021d8:	41 83 c8 04          	or     r8d,0x4
  4021dc:	48 83 c2 01          	add    rdx,0x1
  4021e0:	eb de                	jmp    4021c0 <parse_flags+0x40>
  4021e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  4021e8:	41 83 c8 10          	or     r8d,0x10
  4021ec:	48 83 c2 01          	add    rdx,0x1
  4021f0:	eb ce                	jmp    4021c0 <parse_flags+0x40>
  4021f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  4021f8:	41 83 c8 08          	or     r8d,0x8
  4021fc:	48 83 c2 01          	add    rdx,0x1
  402200:	eb be                	jmp    4021c0 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

0000000000402210 <putchar_wrapper>:
{
  402210:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  402214:	40 0f be ff          	movsx  edi,dil
  402218:	e9 e3 18 00 00       	jmp    403b00 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000402220 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  402220:	41 56                	push   r14
  402222:	49 89 ca             	mov    r10,rcx
  402225:	41 89 d3             	mov    r11d,edx
  402228:	41 55                	push   r13
  40222a:	45 89 c5             	mov    r13d,r8d
  40222d:	41 54                	push   r12
  40222f:	55                   	push   rbp
  402230:	53                   	push   rbx
  402231:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  402236:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40223b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  40223f:	45 85 ed             	test   r13d,r13d
  402242:	0f 84 90 00 00 00    	je     4022d8 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402248:	44 89 c0             	mov    eax,r8d
  40224b:	25 10 10 00 00       	and    eax,0x1010
  402250:	3d 00 10 00 00       	cmp    eax,0x1000
  402255:	0f 84 05 02 00 00    	je     402460 <print_broken_up_decimal.isra.0+0x240>
  40225b:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  40225e:	89 cb                	mov    ebx,ecx
  402260:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402265:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40226c:	66 66 66 
  40226f:	49 01 ec             	add    r12,rbp
  402272:	eb 43                	jmp    4022b7 <print_broken_up_decimal.isra.0+0x97>
  402274:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402278:	48 89 f0             	mov    rax,rsi
  40227b:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  40227e:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402282:	49 f7 ed             	imul   r13
  402285:	48 89 f0             	mov    rax,rsi
  402288:	41 29 de             	sub    r14d,ebx
  40228b:	83 c3 01             	add    ebx,0x1
  40228e:	48 c1 f8 3f          	sar    rax,0x3f
  402292:	48 c1 fa 02          	sar    rdx,0x2
  402296:	48 29 c2             	sub    rdx,rax
  402299:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40229d:	48 01 c0             	add    rax,rax
  4022a0:	48 29 c6             	sub    rsi,rax
  4022a3:	83 c6 30             	add    esi,0x30
  4022a6:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  4022ab:	48 89 d6             	mov    rsi,rdx
  4022ae:	48 85 d2             	test   rdx,rdx
  4022b1:	0f 84 f9 00 00 00    	je     4023b0 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4022b7:	83 fb 20             	cmp    ebx,0x20
  4022ba:	75 bc                	jne    402278 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4022bc:	44 89 c0             	mov    eax,r8d
  4022bf:	83 e0 03             	and    eax,0x3
  4022c2:	83 f8 01             	cmp    eax,0x1
  4022c5:	0f 84 35 01 00 00    	je     402400 <print_broken_up_decimal.isra.0+0x1e0>
  4022cb:	ba 20 00 00 00       	mov    edx,0x20
  4022d0:	e9 7d 00 00 00       	jmp    402352 <print_broken_up_decimal.isra.0+0x132>
  4022d5:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4022d8:	41 f6 c0 10          	test   r8b,0x10
  4022dc:	0f 85 8e 00 00 00    	jne    402370 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4022e2:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  4022e9:	66 66 66 
  4022ec:	89 ce                	mov    esi,ecx
  4022ee:	48 01 ee             	add    rsi,rbp
  4022f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4022f8:	83 f9 20             	cmp    ecx,0x20
  4022fb:	74 bf                	je     4022bc <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4022fd:	48 89 f8             	mov    rax,rdi
  402300:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  402303:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  402307:	48 f7 eb             	imul   rbx
  40230a:	48 89 f8             	mov    rax,rdi
  40230d:	48 c1 f8 3f          	sar    rax,0x3f
  402311:	48 c1 fa 02          	sar    rdx,0x2
  402315:	48 29 c2             	sub    rdx,rax
  402318:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40231c:	48 01 c0             	add    rax,rax
  40231f:	48 29 c7             	sub    rdi,rax
  402322:	83 c7 30             	add    edi,0x30
  402325:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  402329:	48 89 d7             	mov    rdi,rdx
  40232c:	48 85 d2             	test   rdx,rdx
  40232f:	75 c7                	jne    4022f8 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  402331:	44 89 c0             	mov    eax,r8d
  402334:	83 e0 03             	and    eax,0x3
  402337:	83 f8 01             	cmp    eax,0x1
  40233a:	0f 84 b8 01 00 00    	je     4024f8 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402340:	83 f9 20             	cmp    ecx,0x20
  402343:	74 86                	je     4022cb <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  402345:	45 84 db             	test   r11b,r11b
  402348:	74 46                	je     402390 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  40234a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  40234f:	8d 51 01             	lea    edx,[rcx+0x1]
}
  402352:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  402353:	48 89 ee             	mov    rsi,rbp
  402356:	44 89 c9             	mov    ecx,r9d
}
  402359:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40235a:	4c 89 d7             	mov    rdi,r10
}
  40235d:	41 5c                	pop    r12
  40235f:	41 5d                	pop    r13
  402361:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  402363:	e9 68 f7 ff ff       	jmp    401ad0 <out_rev_>
  402368:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40236f:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402370:	83 f9 20             	cmp    ecx,0x20
  402373:	0f 84 43 ff ff ff    	je     4022bc <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  402379:	89 c8                	mov    eax,ecx
  40237b:	83 c1 01             	add    ecx,0x1
  40237e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  402383:	e9 5a ff ff ff       	jmp    4022e2 <print_broken_up_decimal.isra.0+0xc2>
  402388:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40238f:	00 
    else if (flags & FLAGS_PLUS) {
  402390:	41 f6 c0 04          	test   r8b,0x4
  402394:	0f 85 3e 01 00 00    	jne    4024d8 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40239a:	89 ca                	mov    edx,ecx
  40239c:	41 f6 c0 08          	test   r8b,0x8
  4023a0:	74 b0                	je     402352 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  4023a2:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  4023a7:	83 c2 01             	add    edx,0x1
  4023aa:	eb a6                	jmp    402352 <print_broken_up_decimal.isra.0+0x132>
  4023ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4023b0:	83 fb 1f             	cmp    ebx,0x1f
  4023b3:	77 13                	ja     4023c8 <print_broken_up_decimal.isra.0+0x1a8>
  4023b5:	45 85 f6             	test   r14d,r14d
  4023b8:	89 d8                	mov    eax,ebx
  4023ba:	0f 95 c2             	setne  dl
  4023bd:	48 01 e8             	add    rax,rbp
  4023c0:	84 d2                	test   dl,dl
  4023c2:	75 20                	jne    4023e4 <print_broken_up_decimal.isra.0+0x1c4>
  4023c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4023c8:	83 fb 20             	cmp    ebx,0x20
  4023cb:	0f 84 eb fe ff ff    	je     4022bc <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  4023d1:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  4023d6:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4023d9:	e9 04 ff ff ff       	jmp    4022e2 <print_broken_up_decimal.isra.0+0xc2>
  4023de:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4023e0:	39 ca                	cmp    edx,ecx
  4023e2:	74 e4                	je     4023c8 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  4023e4:	89 da                	mov    edx,ebx
  4023e6:	83 c3 01             	add    ebx,0x1
  4023e9:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4023ec:	48 83 c0 01          	add    rax,0x1
  4023f0:	83 fb 1f             	cmp    ebx,0x1f
  4023f3:	76 eb                	jbe    4023e0 <print_broken_up_decimal.isra.0+0x1c0>
  4023f5:	eb d1                	jmp    4023c8 <print_broken_up_decimal.isra.0+0x1a8>
  4023f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4023fe:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402400:	45 85 c9             	test   r9d,r9d
  402403:	0f 84 c2 fe ff ff    	je     4022cb <print_broken_up_decimal.isra.0+0xab>
  402409:	31 d2                	xor    edx,edx
  40240b:	b9 20 00 00 00       	mov    ecx,0x20
  402410:	45 84 db             	test   r11b,r11b
  402413:	0f 85 cf 00 00 00    	jne    4024e8 <print_broken_up_decimal.isra.0+0x2c8>
  402419:	41 f6 c0 0c          	test   r8b,0xc
  40241d:	0f 85 c5 00 00 00    	jne    4024e8 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402423:	44 39 c9             	cmp    ecx,r9d
  402426:	0f 83 14 ff ff ff    	jae    402340 <print_broken_up_decimal.isra.0+0x120>
  40242c:	89 c8                	mov    eax,ecx
  40242e:	48 01 e8             	add    rax,rbp
  402431:	84 d2                	test   dl,dl
  402433:	0f 84 07 ff ff ff    	je     402340 <print_broken_up_decimal.isra.0+0x120>
  402439:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  402440:	83 c1 01             	add    ecx,0x1
  402443:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402446:	48 83 c0 01          	add    rax,0x1
  40244a:	44 39 c9             	cmp    ecx,r9d
  40244d:	0f 83 ed fe ff ff    	jae    402340 <print_broken_up_decimal.isra.0+0x120>
  402453:	83 f9 1f             	cmp    ecx,0x1f
  402456:	76 e8                	jbe    402440 <print_broken_up_decimal.isra.0+0x220>
  402458:	e9 e3 fe ff ff       	jmp    402340 <print_broken_up_decimal.isra.0+0x120>
  40245d:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402460:	48 85 f6             	test   rsi,rsi
  402463:	0f 8e 79 fe ff ff    	jle    4022e2 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  402469:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  402470:	cc cc cc 
  402473:	48 89 f0             	mov    rax,rsi
  402476:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  40247d:	99 99 19 
  402480:	48 0f af c3          	imul   rax,rbx
  402484:	48 01 d0             	add    rax,rdx
  402487:	48 d1 c8             	ror    rax,1
  40248a:	48 39 d0             	cmp    rax,rdx
  40248d:	0f 87 c8 fd ff ff    	ja     40225b <print_broken_up_decimal.isra.0+0x3b>
  402493:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  40249a:	99 99 19 
  40249d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  4024a0:	48 89 f0             	mov    rax,rsi
  4024a3:	49 89 f4             	mov    r12,rsi
        --count;
  4024a6:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  4024aa:	48 f7 e3             	mul    rbx
  4024ad:	48 89 d6             	mov    rsi,rdx
  4024b0:	48 c1 ee 03          	shr    rsi,0x3
  4024b4:	48 89 f0             	mov    rax,rsi
  4024b7:	48 0f af c3          	imul   rax,rbx
  4024bb:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  4024be:	4c 39 f0             	cmp    rax,r14
  4024c1:	76 dd                	jbe    4024a0 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  4024c3:	49 83 fc 09          	cmp    r12,0x9
  4024c7:	0f 8f 8e fd ff ff    	jg     40225b <print_broken_up_decimal.isra.0+0x3b>
  4024cd:	e9 10 fe ff ff       	jmp    4022e2 <print_broken_up_decimal.isra.0+0xc2>
  4024d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  4024d8:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  4024dd:	8d 51 01             	lea    edx,[rcx+0x1]
  4024e0:	e9 6d fe ff ff       	jmp    402352 <print_broken_up_decimal.isra.0+0x132>
  4024e5:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  4024e8:	41 83 e9 01          	sub    r9d,0x1
  4024ec:	e9 32 ff ff ff       	jmp    402423 <print_broken_up_decimal.isra.0+0x203>
  4024f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4024f8:	45 85 c9             	test   r9d,r9d
  4024fb:	0f 84 3f fe ff ff    	je     402340 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402501:	83 f9 1f             	cmp    ecx,0x1f
  402504:	0f 96 c2             	setbe  dl
  402507:	e9 04 ff ff ff       	jmp    402410 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

0000000000402510 <print_decimal_number>:
{
  402510:	41 54                	push   r12
  402512:	49 89 fb             	mov    r11,rdi
  402515:	41 89 f2             	mov    r10d,esi
  402518:	4d 89 c4             	mov    r12,r8
  40251b:	55                   	push   rbp
  40251c:	89 cd                	mov    ebp,ecx
  40251e:	53                   	push   rbx
  40251f:	89 d3                	mov    ebx,edx
  402521:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  402525:	48 89 e7             	mov    rdi,rsp
  402528:	e8 e3 f9 ff ff       	call   401f10 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  40252d:	48 83 ec 08          	sub    rsp,0x8
  402531:	45 89 d0             	mov    r8d,r10d
  402534:	4c 89 d9             	mov    rcx,r11
  402537:	41 51                	push   r9
  402539:	41 89 d9             	mov    r9d,ebx
  40253c:	41 54                	push   r12
  40253e:	55                   	push   rbp
  40253f:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  402544:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  402549:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  40254e:	e8 cd fc ff ff       	call   402220 <print_broken_up_decimal.isra.0>
}
  402553:	48 83 c4 40          	add    rsp,0x40
  402557:	5b                   	pop    rbx
  402558:	5d                   	pop    rbp
  402559:	41 5c                	pop    r12
  40255b:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000402560 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402560:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  402564:	40 84 ff             	test   dil,dil
  402567:	74 17                	je     402580 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402569:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  40256d:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402572:	31 c0                	xor    eax,eax
  402574:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402576:	66 0f 28 c1          	movapd xmm0,xmm1
}
  40257a:	c3                   	ret    
  40257b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402580:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  402584:	e8 07 f3 ff ff       	call   401890 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402589:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  40258d:	48 89 c7             	mov    rdi,rax
  402590:	e8 1b f3 ff ff       	call   4018b0 <get_exp2>
  402595:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402597:	e8 f4 f2 ff ff       	call   401890 <get_bit_access>
  40259c:	48 89 c7             	mov    rdi,rax
  40259f:	e8 0c f3 ff ff       	call   4018b0 <get_exp2>
  4025a4:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  4025a7:	89 d0                	mov    eax,edx
  4025a9:	f7 d8                	neg    eax
  4025ab:	0f 49 d0             	cmovns edx,eax
  4025ae:	44 89 c0             	mov    eax,r8d
  4025b1:	f7 d8                	neg    eax
  4025b3:	41 0f 48 c0          	cmovs  eax,r8d
  4025b7:	39 c2                	cmp    edx,eax
  4025b9:	7f 1d                	jg     4025d8 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4025bb:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  4025bf:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  4025c4:	31 c0                	xor    eax,eax
}
  4025c6:	48 83 c4 08          	add    rsp,0x8
  return result;
  4025ca:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4025cc:	66 0f 28 c1          	movapd xmm0,xmm1
}
  4025d0:	c3                   	ret    
  4025d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4025d8:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  4025dc:	31 d2                	xor    edx,edx
  return result;
  4025de:	31 c0                	xor    eax,eax
}
  4025e0:	48 83 c4 08          	add    rsp,0x8
  return result;
  4025e4:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4025e6:	66 0f 28 c2          	movapd xmm0,xmm2
}
  4025ea:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

00000000004025f0 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  4025f0:	40 84 ff             	test   dil,dil
  4025f3:	74 0b                	je     402600 <unapply_scaling.isra.0+0x10>
  4025f5:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4025f9:	c3                   	ret    
  4025fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402600:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  402604:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

0000000000402610 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  402610:	40 84 ff             	test   dil,dil
  402613:	74 0b                	je     402620 <apply_scaling.isra.0+0x10>
  402615:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  402619:	c3                   	ret    
  40261a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402620:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  402624:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000402630 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402630:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402632:	48 83 ec 08          	sub    rsp,0x8
  402636:	49 89 f9             	mov    r9,rdi
  402639:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  40263b:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  40263e:	66 0f 28 d0          	movapd xmm2,xmm0
  402642:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  402645:	e8 c6 ff ff ff       	call   402610 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  40264a:	3d 32 01 00 00       	cmp    eax,0x132
  40264f:	0f 8f ab 00 00 00    	jg     402700 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  402655:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40265a:	66 0f ef c0          	pxor   xmm0,xmm0
  40265e:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  402662:	89 d6                	mov    esi,edx
  402664:	48 8d 05 15 2d 00 00 	lea    rax,[rip+0x2d15]        # 405380 <powers_of_10>
  40266b:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40266f:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  402674:	e8 77 ff ff ff       	call   4025f0 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  402679:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40267e:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  402682:	66 0f 28 c3          	movapd xmm0,xmm3
  402686:	66 0f 28 cc          	movapd xmm1,xmm4
  40268a:	e8 d1 fe ff ff       	call   402560 <update_normalization.isra.0>
  40268f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402693:	89 c7                	mov    edi,eax
  402695:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  402699:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  40269b:	e8 70 ff ff ff       	call   402610 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  4026a0:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  4026a4:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  4026a9:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  4026ae:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  4026b2:	66 0f 2f 05 66 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d66]        # 405420 <powers_of_10+0xa0>
  4026b9:	00 
  4026ba:	0f 93 c0             	setae  al
  4026bd:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  4026c0:	66 0f 2e 05 58 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d58]        # 405420 <powers_of_10+0xa0>
  4026c7:	00 
  4026c8:	7a 06                	jp     4026d0 <get_normalized_components.isra.0+0xa0>
  4026ca:	75 04                	jne    4026d0 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  4026cc:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  4026d0:	66 0f ef c0          	pxor   xmm0,xmm0
  4026d4:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  4026d9:	66 0f 2f c4          	comisd xmm0,xmm4
  4026dd:	73 19                	jae    4026f8 <get_normalized_components.isra.0+0xc8>
  return components;
  4026df:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  4026e3:	4c 89 c8             	mov    rax,r9
  return components;
  4026e6:	49 89 09             	mov    QWORD PTR [r9],rcx
  4026e9:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  4026ed:	48 83 c4 08          	add    rsp,0x8
  4026f1:	c3                   	ret    
  4026f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  4026f8:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  4026fc:	31 c0                	xor    eax,eax
  4026fe:	eb df                	jmp    4026df <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  402700:	40 84 f6             	test   sil,sil
  402703:	74 08                	je     40270d <get_normalized_components.isra.0+0xdd>
  402705:	66 0f 57 05 03 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d03]        # 405410 <powers_of_10+0x90>
  40270c:	00 
  40270d:	89 d6                	mov    esi,edx
  40270f:	4c 89 cf             	mov    rdi,r9
  402712:	e8 f9 f7 ff ff       	call   401f10 <get_components>
}
  402717:	4c 89 c8             	mov    rax,r9
  40271a:	48 83 c4 08          	add    rsp,0x8
  40271e:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000402720 <print_exponential_number>:
{
  402720:	41 57                	push   r15
  402722:	41 89 f3             	mov    r11d,esi
  402725:	66 0f 28 f0          	movapd xmm6,xmm0
  402729:	41 56                	push   r14
  40272b:	41 55                	push   r13
  40272d:	49 89 fd             	mov    r13,rdi
  402730:	41 54                	push   r12
  402732:	41 89 d4             	mov    r12d,edx
  402735:	55                   	push   rbp
  402736:	89 cd                	mov    ebp,ecx
  402738:	53                   	push   rbx
  402739:	48 83 ec 38          	sub    rsp,0x38
  40273d:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  402741:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  402746:	e8 55 f1 ff ff       	call   4018a0 <get_sign_bit>
  40274b:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  40274d:	85 c0                	test   eax,eax
  40274f:	74 08                	je     402759 <print_exponential_number+0x39>
  402751:	66 0f 57 35 b7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cb7]        # 405410 <powers_of_10+0x90>
  402758:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  402759:	41 89 e8             	mov    r8d,ebp
  40275c:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  402763:	66 0f 2e 35 ad 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2cad]        # 405418 <powers_of_10+0x98>
  40276a:	00 
  40276b:	0f 8a 9f 00 00 00    	jp     402810 <print_exponential_number+0xf0>
  402771:	0f 85 99 00 00 00    	jne    402810 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  402777:	45 85 c0             	test   r8d,r8d
  40277a:	0f 85 18 01 00 00    	jne    402898 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  402780:	85 f6                	test   esi,esi
  402782:	0f 84 63 03 00 00    	je     402aeb <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402788:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  40278a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  40278d:	66 0f 57 35 7b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c7b]        # 405410 <powers_of_10+0x90>
  402794:	00 
  402795:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40279a:	44 89 de             	mov    esi,r11d
  40279d:	66 0f 28 c6          	movapd xmm0,xmm6
  4027a1:	e8 6a f7 ff ff       	call   401f10 <get_components>
  4027a6:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4027ab:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4027b0:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  4027b5:	45 84 ff             	test   r15b,r15b
  4027b8:	0f 84 49 01 00 00    	je     402907 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  4027be:	f7 c5 00 10 00 00    	test   ebp,0x1000
  4027c4:	74 09                	je     4027cf <print_exponential_number+0xaf>
  4027c6:	83 fb ff             	cmp    ebx,0xffffffff
  4027c9:	0f 8d d1 02 00 00    	jge    402aa0 <print_exponential_number+0x380>
        width - exp10_part_width :
  4027cf:	45 85 e4             	test   r12d,r12d
  4027d2:	0f 84 98 02 00 00    	je     402a70 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  4027d8:	48 83 ec 08          	sub    rsp,0x8
  4027dc:	45 89 e1             	mov    r9d,r12d
  4027df:	45 89 d8             	mov    r8d,r11d
  4027e2:	4c 89 e9             	mov    rcx,r13
  4027e5:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  4027e9:	50                   	push   rax
  4027ea:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  4027ee:	55                   	push   rbp
  4027ef:	e8 2c fa ff ff       	call   402220 <print_broken_up_decimal.isra.0>
  4027f4:	48 83 c4 20          	add    rsp,0x20
}
  4027f8:	48 83 c4 38          	add    rsp,0x38
  4027fc:	5b                   	pop    rbx
  4027fd:	5d                   	pop    rbp
  4027fe:	41 5c                	pop    r12
  402800:	41 5d                	pop    r13
  402802:	41 5e                	pop    r14
  402804:	41 5f                	pop    r15
  402806:	c3                   	ret    
  402807:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40280e:	00 00 
    double exp10 = log10_of_positive(abs_number);
  402810:	66 0f 28 c6          	movapd xmm0,xmm6
  402814:	e8 07 f8 ff ff       	call   402020 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  402819:	e8 d2 f7 ff ff       	call   401ff0 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  40281e:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  402820:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  402822:	e8 89 f8 ff ff       	call   4020b0 <pow10_of_int>
    if (abs_number < p10) {
  402827:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  40282b:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  40282f:	76 0b                	jbe    40283c <print_exponential_number+0x11c>
      floored_exp10--;
  402831:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  402834:	f2 0f 5e 0d 44 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c44]        # 405480 <powers_of_10+0x100>
  40283b:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  40283c:	8d 43 11             	lea    eax,[rbx+0x11]
  40283f:	83 f8 22             	cmp    eax,0x22
  402842:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  402845:	77 15                	ja     40285c <print_exponential_number+0x13c>
  402847:	89 d8                	mov    eax,ebx
  402849:	48 8d 15 30 2b 00 00 	lea    rdx,[rip+0x2b30]        # 405380 <powers_of_10>
  402850:	f7 d8                	neg    eax
  402852:	0f 48 c3             	cmovs  eax,ebx
  402855:	48 98                	cdqe   
  402857:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  40285c:	89 d8                	mov    eax,ebx
  40285e:	c1 e8 1f             	shr    eax,0x1f
  402861:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402863:	85 db                	test   ebx,ebx
  402865:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402868:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  40286b:	45 85 c0             	test   r8d,r8d
  40286e:	74 62                	je     4028d2 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402870:	45 85 db             	test   r11d,r11d
  402873:	b8 01 00 00 00       	mov    eax,0x1
  402878:	41 0f 45 c3          	cmovne eax,r11d
  40287c:	39 c3                	cmp    ebx,eax
  40287e:	0f 9c c0             	setl   al
  402881:	83 fb fc             	cmp    ebx,0xfffffffc
  402884:	40 0f 9d c7          	setge  dil
  402888:	21 f8                	and    eax,edi
  40288a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  40288d:	44 09 fa             	or     edx,r15d
  402890:	eb 21                	jmp    4028b3 <print_exponential_number+0x193>
  402892:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402898:	45 85 db             	test   r11d,r11d
  40289b:	b8 01 00 00 00       	mov    eax,0x1
  4028a0:	ba 01 00 00 00       	mov    edx,0x1
  4028a5:	41 0f 45 c3          	cmovne eax,r11d
  4028a9:	85 c0                	test   eax,eax
  4028ab:	41 0f 9f c7          	setg   r15b
  4028af:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  4028b1:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  4028b3:	41 83 eb 01          	sub    r11d,0x1
  4028b7:	44 89 df             	mov    edi,r11d
  4028ba:	29 df                	sub    edi,ebx
  4028bc:	45 84 ff             	test   r15b,r15b
  4028bf:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  4028c3:	31 ff                	xor    edi,edi
  4028c5:	45 85 db             	test   r11d,r11d
  4028c8:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  4028cc:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  4028d2:	84 d2                	test   dl,dl
  4028d4:	0f 85 86 01 00 00    	jne    402a60 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  4028da:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  4028dc:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4028e1:	44 89 da             	mov    edx,r11d
  4028e4:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  4028e7:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  4028eb:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  4028ef:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  4028f3:	e8 38 fd ff ff       	call   402630 <get_normalized_components.isra.0>
  4028f8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4028fd:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402902:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  402907:	48 83 ff 09          	cmp    rdi,0x9
  40290b:	7e 0a                	jle    402917 <print_exponential_number+0x1f7>
      floored_exp10++;
  40290d:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  402910:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  402912:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402917:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  40291a:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  40291d:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402921:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402927:	77 47                	ja     402970 <print_exponential_number+0x250>
      0U :
  402929:	45 85 d2             	test   r10d,r10d
  40292c:	0f 84 9e 01 00 00    	je     402ad0 <print_exponential_number+0x3b0>
  402932:	41 bf 03 00 00 00    	mov    r15d,0x3
  402938:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  40293d:	48 83 ec 08          	sub    rsp,0x8
  402941:	45 31 c9             	xor    r9d,r9d
  402944:	45 89 d8             	mov    r8d,r11d
  402947:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  40294b:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  40294e:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402952:	50                   	push   rax
  402953:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402957:	55                   	push   rbp
  402958:	e8 c3 f8 ff ff       	call   402220 <print_broken_up_decimal.isra.0>
  40295d:	48 83 c4 20          	add    rsp,0x20
  402961:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402966:	eb 61                	jmp    4029c9 <print_exponential_number+0x2a9>
  402968:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40296f:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402970:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402975:	45 85 d2             	test   r10d,r10d
  402978:	0f 85 62 01 00 00    	jne    402ae0 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  40297e:	45 89 e1             	mov    r9d,r12d
  402981:	b9 00 00 00 00       	mov    ecx,0x0
  402986:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  40298a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  40298d:	41 29 c1             	sub    r9d,eax
  402990:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402993:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402997:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  40299b:	48 83 ec 08          	sub    rsp,0x8
  40299f:	4c 89 e9             	mov    rcx,r13
  4029a2:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  4029a6:	50                   	push   rax
  4029a7:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  4029ab:	55                   	push   rbp
  4029ac:	e8 6f f8 ff ff       	call   402220 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  4029b1:	48 83 c4 20          	add    rsp,0x20
  4029b5:	45 84 ff             	test   r15b,r15b
  4029b8:	0f 85 3a fe ff ff    	jne    4027f8 <print_exponential_number+0xd8>
    print_integer(output,
  4029be:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4029c2:	45 31 d2             	xor    r10d,r10d
  4029c5:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  4029c9:	83 e5 20             	and    ebp,0x20
  4029cc:	4c 89 ef             	mov    rdi,r13
  4029cf:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  4029d3:	83 fd 01             	cmp    ebp,0x1
  4029d6:	19 f6                	sbb    esi,esi
  4029d8:	83 e6 20             	and    esi,0x20
  4029db:	83 c6 45             	add    esi,0x45
  4029de:	e8 ed ee ff ff       	call   4018d0 <putchar_via_gadget>
    print_integer(output,
  4029e3:	48 63 c3             	movsxd rax,ebx
  4029e6:	89 da                	mov    edx,ebx
  4029e8:	45 89 f9             	mov    r9d,r15d
  4029eb:	48 89 c6             	mov    rsi,rax
  4029ee:	c1 ea 1f             	shr    edx,0x1f
  4029f1:	b9 0a 00 00 00       	mov    ecx,0xa
  4029f6:	4c 89 ef             	mov    rdi,r13
  4029f9:	48 f7 de             	neg    rsi
  4029fc:	85 db                	test   ebx,ebx
  4029fe:	48 0f 4f f0          	cmovg  rsi,rax
  402a02:	48 83 ec 08          	sub    rsp,0x8
  402a06:	45 31 c0             	xor    r8d,r8d
  402a09:	6a 05                	push   0x5
  402a0b:	e8 10 f4 ff ff       	call   401e20 <print_integer>
    if (flags & FLAGS_LEFT) {
  402a10:	58                   	pop    rax
  402a11:	5a                   	pop    rdx
  402a12:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402a16:	45 85 d2             	test   r10d,r10d
  402a19:	0f 84 d9 fd ff ff    	je     4027f8 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402a1f:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402a23:	44 29 f0             	sub    eax,r14d
  402a26:	44 39 e0             	cmp    eax,r12d
  402a29:	0f 83 c9 fd ff ff    	jae    4027f8 <print_exponential_number+0xd8>
  402a2f:	90                   	nop
        putchar_via_gadget(output, ' ');
  402a30:	be 20 00 00 00       	mov    esi,0x20
  402a35:	4c 89 ef             	mov    rdi,r13
  402a38:	e8 93 ee ff ff       	call   4018d0 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402a3d:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402a41:	44 29 f0             	sub    eax,r14d
  402a44:	44 39 e0             	cmp    eax,r12d
  402a47:	72 e7                	jb     402a30 <print_exponential_number+0x310>
}
  402a49:	48 83 c4 38          	add    rsp,0x38
  402a4d:	5b                   	pop    rbx
  402a4e:	5d                   	pop    rbp
  402a4f:	41 5c                	pop    r12
  402a51:	41 5d                	pop    r13
  402a53:	41 5e                	pop    r14
  402a55:	41 5f                	pop    r15
  402a57:	c3                   	ret    
  402a58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402a5f:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402a60:	85 f6                	test   esi,esi
  402a62:	0f 84 2d fd ff ff    	je     402795 <print_exponential_number+0x75>
  402a68:	e9 20 fd ff ff       	jmp    40278d <print_exponential_number+0x6d>
  402a6d:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a70:	48 83 ec 08          	sub    rsp,0x8
  402a74:	4c 89 e9             	mov    rcx,r13
  402a77:	45 31 c9             	xor    r9d,r9d
  402a7a:	45 89 d8             	mov    r8d,r11d
  402a7d:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a81:	50                   	push   rax
  402a82:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402a86:	55                   	push   rbp
  402a87:	e8 94 f7 ff ff       	call   402220 <print_broken_up_decimal.isra.0>
  402a8c:	48 83 c4 20          	add    rsp,0x20
}
  402a90:	48 83 c4 38          	add    rsp,0x38
  402a94:	5b                   	pop    rbx
  402a95:	5d                   	pop    rbp
  402a96:	41 5c                	pop    r12
  402a98:	41 5d                	pop    r13
  402a9a:	41 5e                	pop    r14
  402a9c:	41 5f                	pop    r15
  402a9e:	c3                   	ret    
  402a9f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402aa0:	83 c3 01             	add    ebx,0x1
  402aa3:	66 0f ef c0          	pxor   xmm0,xmm0
  402aa7:	48 8d 05 d2 28 00 00 	lea    rax,[rip+0x28d2]        # 405380 <powers_of_10>
  402aae:	48 63 db             	movsxd rbx,ebx
  402ab1:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402ab6:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402abb:	0f 8a 0e fd ff ff    	jp     4027cf <print_exponential_number+0xaf>
  402ac1:	0f 85 08 fd ff ff    	jne    4027cf <print_exponential_number+0xaf>
      precision--;
  402ac7:	41 83 eb 01          	sub    r11d,0x1
  402acb:	e9 ff fc ff ff       	jmp    4027cf <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402ad0:	b8 04 00 00 00       	mov    eax,0x4
  402ad5:	e9 a4 fe ff ff       	jmp    40297e <print_exponential_number+0x25e>
  402ada:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402ae0:	41 bf 04 00 00 00    	mov    r15d,0x4
  402ae6:	e9 4d fe ff ff       	jmp    402938 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402aeb:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402af0:	44 89 de             	mov    esi,r11d
  402af3:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402af7:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402af9:	e8 12 f4 ff ff       	call   401f10 <get_components>
  402afe:	45 31 ff             	xor    r15d,r15d
  402b01:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402b06:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402b0b:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402b10:	e9 f2 fd ff ff       	jmp    402907 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402b20 <print_floating_point>:
  if (value != value) {
  402b20:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402b24:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402b27:	0f 8a eb 00 00 00    	jp     402c18 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402b2d:	f2 0f 10 0d 6b 29 00 	movsd  xmm1,QWORD PTR [rip+0x296b]        # 4054a0 <powers_of_10+0x120>
  402b34:	00 
  402b35:	66 0f 2f c8          	comisd xmm1,xmm0
  402b39:	0f 87 21 01 00 00    	ja     402c60 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402b3f:	66 0f 2f 05 61 29 00 	comisd xmm0,QWORD PTR [rip+0x2961]        # 4054a8 <powers_of_10+0x128>
  402b46:	00 
  402b47:	77 57                	ja     402ba0 <print_floating_point+0x80>
{
  402b49:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402b4d:	45 84 c0             	test   r8b,r8b
  402b50:	75 7e                	jne    402bd0 <print_floating_point+0xb0>
  402b52:	66 0f 2f 05 56 29 00 	comisd xmm0,QWORD PTR [rip+0x2956]        # 4054b0 <powers_of_10+0x130>
  402b59:	00 
  402b5a:	0f 87 e8 00 00 00    	ja     402c48 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402b60:	f2 0f 10 0d 50 29 00 	movsd  xmm1,QWORD PTR [rip+0x2950]        # 4054b8 <powers_of_10+0x138>
  402b67:	00 
  402b68:	66 0f 2f c8          	comisd xmm1,xmm0
  402b6c:	0f 87 d6 00 00 00    	ja     402c48 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402b72:	41 89 c9             	mov    r9d,ecx
  402b75:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402b7c:	0f 85 fe 00 00 00    	jne    402c80 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402b82:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402b87:	49 89 e0             	mov    r8,rsp
  402b8a:	44 89 d2             	mov    edx,r10d
  402b8d:	e8 7e f9 ff ff       	call   402510 <print_decimal_number>
}
  402b92:	48 83 c4 28          	add    rsp,0x28
  402b96:	c3                   	ret    
  402b97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402b9e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402ba0:	89 c8                	mov    eax,ecx
  402ba2:	48 8d 35 08 26 00 00 	lea    rsi,[rip+0x2608]        # 4051b1 <memcpy+0xdb1>
  402ba9:	41 89 c8             	mov    r8d,ecx
  402bac:	44 89 d1             	mov    ecx,r10d
  402baf:	83 e0 04             	and    eax,0x4
  402bb2:	83 f8 01             	cmp    eax,0x1
  402bb5:	19 d2                	sbb    edx,edx
  402bb7:	83 c2 04             	add    edx,0x4
  402bba:	85 c0                	test   eax,eax
  402bbc:	48 8d 05 e9 25 00 00 	lea    rax,[rip+0x25e9]        # 4051ac <memcpy+0xdac>
  402bc3:	48 0f 45 f0          	cmovne rsi,rax
  402bc7:	e9 04 ef ff ff       	jmp    401ad0 <out_rev_>
  402bcc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402bd0:	41 89 c9             	mov    r9d,ecx
  402bd3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402bda:	74 54                	je     402c30 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402bdc:	b8 01 00 00 00       	mov    eax,0x1
  402be1:	45 31 c9             	xor    r9d,r9d
  402be4:	83 fe 11             	cmp    esi,0x11
  402be7:	76 4c                	jbe    402c35 <print_floating_point+0x115>
  402be9:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402bee:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402bf0:	41 89 c1             	mov    r9d,eax
  402bf3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402bf7:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402bfa:	48 83 c0 01          	add    rax,0x1
  402bfe:	41 83 f9 1f          	cmp    r9d,0x1f
  402c02:	77 05                	ja     402c09 <print_floating_point+0xe9>
  402c04:	83 fe 11             	cmp    esi,0x11
  402c07:	77 e7                	ja     402bf0 <print_floating_point+0xd0>
  if (prefer_exponential)
  402c09:	45 84 c0             	test   r8b,r8b
  402c0c:	0f 84 75 ff ff ff    	je     402b87 <print_floating_point+0x67>
  402c12:	eb 21                	jmp    402c35 <print_floating_point+0x115>
  402c14:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402c18:	41 89 c8             	mov    r8d,ecx
  402c1b:	48 8d 35 93 25 00 00 	lea    rsi,[rip+0x2593]        # 4051b5 <memcpy+0xdb5>
  402c22:	89 d1                	mov    ecx,edx
  402c24:	ba 03 00 00 00       	mov    edx,0x3
  402c29:	e9 a2 ee ff ff       	jmp    401ad0 <out_rev_>
  402c2e:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402c30:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402c35:	49 89 e0             	mov    r8,rsp
  402c38:	44 89 d2             	mov    edx,r10d
  402c3b:	e8 e0 fa ff ff       	call   402720 <print_exponential_number>
}
  402c40:	48 83 c4 28          	add    rsp,0x28
  402c44:	c3                   	ret    
  402c45:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402c48:	45 31 c9             	xor    r9d,r9d
  402c4b:	49 89 e0             	mov    r8,rsp
  402c4e:	44 89 d2             	mov    edx,r10d
  402c51:	e8 ca fa ff ff       	call   402720 <print_exponential_number>
    return;
  402c56:	e9 37 ff ff ff       	jmp    402b92 <print_floating_point+0x72>
  402c5b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402c60:	41 89 c8             	mov    r8d,ecx
  402c63:	48 8d 35 4f 25 00 00 	lea    rsi,[rip+0x254f]        # 4051b9 <memcpy+0xdb9>
  402c6a:	89 d1                	mov    ecx,edx
  402c6c:	ba 04 00 00 00       	mov    edx,0x4
  402c71:	e9 5a ee ff ff       	jmp    401ad0 <out_rev_>
  402c76:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402c7d:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402c80:	b8 01 00 00 00       	mov    eax,0x1
  402c85:	45 31 c9             	xor    r9d,r9d
  402c88:	83 fe 11             	cmp    esi,0x11
  402c8b:	0f 87 58 ff ff ff    	ja     402be9 <print_floating_point+0xc9>
  402c91:	e9 f1 fe ff ff       	jmp    402b87 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402ca0 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402ca0:	41 57                	push   r15
  402ca2:	41 56                	push   r14
  402ca4:	41 55                	push   r13
  402ca6:	41 54                	push   r12
  402ca8:	55                   	push   rbp
  402ca9:	53                   	push   rbx
  402caa:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402cad:	48 89 f2             	mov    rdx,rsi
{
  402cb0:	48 83 ec 28          	sub    rsp,0x28
  402cb4:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402cb9:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402cbc:	40 84 f6             	test   sil,sil
  402cbf:	0f 84 e5 00 00 00    	je     402daa <format_string_loop+0x10a>
  402cc5:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402cc8:	4c 8d 2d fd 24 00 00 	lea    r13,[rip+0x24fd]        # 4051cc <memcpy+0xdcc>
  402ccf:	90                   	nop
    if (*format != '%') {
  402cd0:	40 80 fe 25          	cmp    sil,0x25
  402cd4:	0f 85 ae 00 00 00    	jne    402d88 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402cda:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402cde:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402ce3:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402ce7:	0f 84 bd 00 00 00    	je     402daa <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402ced:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402cf2:	4c 89 cf             	mov    rdi,r9
  402cf5:	e8 86 f4 ff ff       	call   402180 <parse_flags>
    if (is_digit_(*format)) {
  402cfa:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402cff:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402d02:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402d05:	89 fe                	mov    esi,edi
  402d07:	e8 74 ed ff ff       	call   401a80 <is_digit_>
  402d0c:	84 c0                	test   al,al
  402d0e:	0f 85 ac 04 00 00    	jne    4031c0 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402d14:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402d17:	40 80 fe 2a          	cmp    sil,0x2a
  402d1b:	0f 84 bf 04 00 00    	je     4031e0 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  402d21:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  402d24:	40 80 fe 2e          	cmp    sil,0x2e
  402d28:	0f 84 52 04 00 00    	je     403180 <format_string_loop+0x4e0>
    switch (*format) {
  402d2e:	8d 46 98             	lea    eax,[rsi-0x68]
  402d31:	3c 12                	cmp    al,0x12
  402d33:	77 2f                	ja     402d64 <format_string_loop+0xc4>
  402d35:	0f b6 c0             	movzx  eax,al
  402d38:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402d3d:	4c 01 e8             	add    rax,r13
  402d40:	3e ff e0             	notrack jmp rax
  402d43:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  402d48:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  402d4c:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  402d53:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402d58:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402d5c:	40 84 f6             	test   sil,sil
  402d5f:	74 49                	je     402daa <format_string_loop+0x10a>
  402d61:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  402d64:	8d 46 db             	lea    eax,[rsi-0x25]
  402d67:	3c 53                	cmp    al,0x53
  402d69:	77 1d                	ja     402d88 <format_string_loop+0xe8>
  402d6b:	48 8d 0d a6 24 00 00 	lea    rcx,[rip+0x24a6]        # 405218 <memcpy+0xe18>
  402d72:	0f b6 c0             	movzx  eax,al
  402d75:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402d79:	48 01 c8             	add    rax,rcx
  402d7c:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  402d7f:	be 25 00 00 00       	mov    esi,0x25
  402d84:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402d88:	48 89 ef             	mov    rdi,rbp
  402d8b:	e8 40 eb ff ff       	call   4018d0 <putchar_via_gadget>
        format++;
  402d90:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402d95:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402d99:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  402d9e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402da1:	40 84 f6             	test   sil,sil
  402da4:	0f 85 26 ff ff ff    	jne    402cd0 <format_string_loop+0x30>
        break;
    }
  }
}
  402daa:	48 83 c4 28          	add    rsp,0x28
  402dae:	5b                   	pop    rbx
  402daf:	5d                   	pop    rbp
  402db0:	41 5c                	pop    r12
  402db2:	41 5d                	pop    r13
  402db4:	41 5e                	pop    r14
  402db6:	41 5f                	pop    r15
  402db8:	c3                   	ret    
  402db9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  402dc0:	40 80 fe 64          	cmp    sil,0x64
  402dc4:	0f 84 6e 06 00 00    	je     403438 <format_string_loop+0x798>
  402dca:	40 80 fe 69          	cmp    sil,0x69
  402dce:	0f 84 64 06 00 00    	je     403438 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  402dd4:	89 f0                	mov    eax,esi
  402dd6:	83 e0 df             	and    eax,0xffffffdf
  402dd9:	3c 58                	cmp    al,0x58
  402ddb:	0f 84 37 06 00 00    	je     403418 <format_string_loop+0x778>
        else if (*format == 'o') {
  402de1:	b9 08 00 00 00       	mov    ecx,0x8
  402de6:	40 80 fe 6f          	cmp    sil,0x6f
  402dea:	74 14                	je     402e00 <format_string_loop+0x160>
        else if (*format == 'b') {
  402dec:	b9 02 00 00 00       	mov    ecx,0x2
  402df1:	40 80 fe 62          	cmp    sil,0x62
  402df5:	74 09                	je     402e00 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  402df7:	41 83 e3 ef          	and    r11d,0xffffffef
  402dfb:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  402e00:	44 89 d8             	mov    eax,r11d
        format++;
  402e03:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  402e07:	83 e0 fe             	and    eax,0xfffffffe
  402e0a:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  402e11:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  402e16:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  402e1a:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  402e1c:	44 89 da             	mov    edx,r11d
  402e1f:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  402e25:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  402e2c:	0f 84 b6 04 00 00    	je     4032e8 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  402e32:	85 d2                	test   edx,edx
  402e34:	0f 85 be 06 00 00    	jne    4034f8 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  402e3a:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  402e41:	0f 85 b1 06 00 00    	jne    4034f8 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  402e47:	41 f6 c3 40          	test   r11b,0x40
  402e4b:	0f 84 51 08 00 00    	je     4036a2 <format_string_loop+0xa02>
  402e51:	83 f8 2f             	cmp    eax,0x2f
  402e54:	0f 87 bc 08 00 00    	ja     403716 <format_string_loop+0xa76>
  402e5a:	89 c2                	mov    edx,eax
  402e5c:	83 c0 08             	add    eax,0x8
  402e5f:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402e63:	89 03                	mov    DWORD PTR [rbx],eax
  402e65:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  402e68:	48 63 f8             	movsxd rdi,eax
  402e6b:	89 c2                	mov    edx,eax
  402e6d:	45 89 e1             	mov    r9d,r12d
  402e70:	45 89 f8             	mov    r8d,r15d
  402e73:	48 89 fe             	mov    rsi,rdi
  402e76:	c1 ea 1f             	shr    edx,0x1f
  402e79:	48 f7 de             	neg    rsi
  402e7c:	85 c0                	test   eax,eax
  402e7e:	48 0f 4f f7          	cmovg  rsi,rdi
  402e82:	48 83 ec 08          	sub    rsp,0x8
  402e86:	48 89 ef             	mov    rdi,rbp
  402e89:	41 53                	push   r11
  402e8b:	e8 90 ef ff ff       	call   401e20 <print_integer>
  while (*format)
  402e90:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402e95:	41 5a                	pop    r10
  402e97:	41 5b                	pop    r11
  402e99:	e9 00 ff ff ff       	jmp    402d9e <format_string_loop+0xfe>
  402e9e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  402ea0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402ea4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402ea9:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402ead:	40 84 f6             	test   sil,sil
  402eb0:	0f 84 f4 fe ff ff    	je     402daa <format_string_loop+0x10a>
        if (*format == 'h') {
  402eb6:	40 80 fe 68          	cmp    sil,0x68
  402eba:	0f 84 d8 03 00 00    	je     403298 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  402ec0:	41 80 cb 80          	or     r11b,0x80
  402ec4:	48 89 c2             	mov    rdx,rax
  402ec7:	e9 98 fe ff ff       	jmp    402d64 <format_string_loop+0xc4>
  402ecc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  402ed0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402ed4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402ed9:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402edd:	40 84 f6             	test   sil,sil
  402ee0:	0f 84 c4 fe ff ff    	je     402daa <format_string_loop+0x10a>
        if (*format == 'l') {
  402ee6:	40 80 fe 6c          	cmp    sil,0x6c
  402eea:	0f 84 d0 03 00 00    	je     4032c0 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  402ef0:	41 81 cb 00 02 00 00 	or     r11d,0x200
  402ef7:	48 89 c2             	mov    rdx,rax
  402efa:	e9 65 fe ff ff       	jmp    402d64 <format_string_loop+0xc4>
  402eff:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  402f00:	89 f2                	mov    edx,esi
  402f02:	44 89 d8             	mov    eax,r11d
  402f05:	83 e2 df             	and    edx,0xffffffdf
  402f08:	80 cc 10             	or     ah,0x10
  402f0b:	80 fa 47             	cmp    dl,0x47
  402f0e:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  402f12:	83 e6 fd             	and    esi,0xfffffffd
  402f15:	44 89 d8             	mov    eax,r11d
  402f18:	83 c8 20             	or     eax,0x20
  402f1b:	40 80 fe 45          	cmp    sil,0x45
  402f1f:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  402f23:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  402f26:	3d af 00 00 00       	cmp    eax,0xaf
  402f2b:	0f 87 9f 03 00 00    	ja     4032d0 <format_string_loop+0x630>
  402f31:	89 c7                	mov    edi,eax
  402f33:	83 c0 10             	add    eax,0x10
  402f36:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402f3a:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  402f3d:	41 b8 01 00 00 00    	mov    r8d,0x1
  402f43:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  402f47:	44 89 e2             	mov    edx,r12d
  402f4a:	44 89 d9             	mov    ecx,r11d
  402f4d:	44 89 fe             	mov    esi,r15d
  402f50:	48 89 ef             	mov    rdi,rbp
  402f53:	e8 c8 fb ff ff       	call   402b20 <print_floating_point>
        format++;
  402f58:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402f5d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402f61:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  402f66:	e9 33 fe ff ff       	jmp    402d9e <format_string_loop+0xfe>
  402f6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  402f70:	44 89 d8             	mov    eax,r11d
  402f73:	83 c8 20             	or     eax,0x20
  402f76:	40 80 fe 46          	cmp    sil,0x46
  402f7a:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  402f7e:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  402f81:	3d af 00 00 00       	cmp    eax,0xaf
  402f86:	0f 87 74 04 00 00    	ja     403400 <format_string_loop+0x760>
  402f8c:	89 c7                	mov    edi,eax
  402f8e:	83 c0 10             	add    eax,0x10
  402f91:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402f95:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  402f98:	45 31 c0             	xor    r8d,r8d
  402f9b:	eb a6                	jmp    402f43 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  402f9d:	41 83 e3 02          	and    r11d,0x2
  402fa1:	0f 84 b9 05 00 00    	je     403560 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  402fa7:	8b 03                	mov    eax,DWORD PTR [rbx]
  402fa9:	83 f8 2f             	cmp    eax,0x2f
  402fac:	0f 86 a9 06 00 00    	jbe    40365b <format_string_loop+0x9bb>
  402fb2:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  402fb6:	48 8d 42 08          	lea    rax,[rdx+0x8]
  402fba:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  402fbe:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402fc1:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  402fc4:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  402fca:	e8 01 e9 ff ff       	call   4018d0 <putchar_via_gadget>
          while (l++ < width) {
  402fcf:	41 83 fc 01          	cmp    r12d,0x1
  402fd3:	0f 86 b7 fd ff ff    	jbe    402d90 <format_string_loop+0xf0>
  402fd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  402fe0:	be 20 00 00 00       	mov    esi,0x20
  402fe5:	48 89 ef             	mov    rdi,rbp
  402fe8:	e8 e3 e8 ff ff       	call   4018d0 <putchar_via_gadget>
          while (l++ < width) {
  402fed:	44 89 f8             	mov    eax,r15d
  402ff0:	41 83 c7 01          	add    r15d,0x1
  402ff4:	41 39 c4             	cmp    r12d,eax
  402ff7:	75 e7                	jne    402fe0 <format_string_loop+0x340>
  402ff9:	e9 92 fd ff ff       	jmp    402d90 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  402ffe:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  403000:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403007:	83 f8 2f             	cmp    eax,0x2f
  40300a:	0f 87 b0 03 00 00    	ja     4033c0 <format_string_loop+0x720>
  403010:	89 c2                	mov    edx,eax
  403012:	83 c0 08             	add    eax,0x8
  403015:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403019:	89 03                	mov    DWORD PTR [rbx],eax
  40301b:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40301e:	48 85 f6             	test   rsi,rsi
  403021:	0f 84 b1 03 00 00    	je     4033d8 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  403027:	48 83 ec 08          	sub    rsp,0x8
  40302b:	31 d2                	xor    edx,edx
  40302d:	41 b9 12 00 00 00    	mov    r9d,0x12
  403033:	45 89 f8             	mov    r8d,r15d
  403036:	41 53                	push   r11
  403038:	b9 10 00 00 00       	mov    ecx,0x10
  40303d:	48 89 ef             	mov    rdi,rbp
  403040:	e8 db ed ff ff       	call   401e20 <print_integer>
  403045:	58                   	pop    rax
  403046:	5a                   	pop    rdx
        format++;
  403047:	e9 44 fd ff ff       	jmp    402d90 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  40304c:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  40304f:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403051:	41 f6 c3 40          	test   r11b,0x40
  403055:	0f 84 f5 02 00 00    	je     403350 <format_string_loop+0x6b0>
  40305b:	83 f8 2f             	cmp    eax,0x2f
  40305e:	0f 87 3c 04 00 00    	ja     4034a0 <format_string_loop+0x800>
  403064:	89 c2                	mov    edx,eax
  403066:	83 c0 08             	add    eax,0x8
  403069:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40306d:	89 03                	mov    DWORD PTR [rbx],eax
  40306f:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403072:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  403074:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403079:	48 83 c2 01          	add    rdx,0x1
  40307d:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403082:	e9 17 fd ff ff       	jmp    402d9e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  403087:	8b 03                	mov    eax,DWORD PTR [rbx]
  403089:	83 f8 2f             	cmp    eax,0x2f
  40308c:	0f 87 ee 02 00 00    	ja     403380 <format_string_loop+0x6e0>
  403092:	89 c2                	mov    edx,eax
  403094:	83 c0 08             	add    eax,0x8
  403097:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40309b:	89 03                	mov    DWORD PTR [rbx],eax
  40309d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4030a0:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  4030a4:	48 85 c0             	test   rax,rax
  4030a7:	0f 84 ef 02 00 00    	je     40339c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4030ad:	45 85 ff             	test   r15d,r15d
  4030b0:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4030b5:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  4030b9:	41 0f 45 f7          	cmovne esi,r15d
  4030bd:	e8 7e e9 ff ff       	call   401a40 <strnlen_s_>
            l = (l < precision ? l : precision);
  4030c2:	44 89 df             	mov    edi,r11d
  4030c5:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4030c8:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  4030ca:	41 0f 47 c7          	cmova  eax,r15d
  4030ce:	81 e7 00 08 00 00    	and    edi,0x800
  4030d4:	41 89 fe             	mov    r14d,edi
  4030d7:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  4030da:	41 83 e3 02          	and    r11d,0x2
  4030de:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  4030e3:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  4030e7:	0f 84 c3 04 00 00    	je     4035b0 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4030ed:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4030f1:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4030f4:	40 84 f6             	test   sil,sil
  4030f7:	74 52                	je     40314b <format_string_loop+0x4ab>
  4030f9:	85 ff                	test   edi,edi
  4030fb:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403100:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  403105:	45 85 ff             	test   r15d,r15d
  403108:	75 04                	jne    40310e <format_string_loop+0x46e>
  40310a:	84 c0                	test   al,al
  40310c:	74 3d                	je     40314b <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40310e:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  403112:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  403118:	49 83 c6 01          	add    r14,0x1
  40311c:	48 89 ef             	mov    rdi,rbp
  40311f:	e8 ac e7 ff ff       	call   4018d0 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  403124:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  403128:	40 84 f6             	test   sil,sil
  40312b:	74 12                	je     40313f <format_string_loop+0x49f>
  40312d:	44 89 fa             	mov    edx,r15d
  403130:	44 29 f2             	sub    edx,r14d
  403133:	03 14 24             	add    edx,DWORD PTR [rsp]
  403136:	75 e0                	jne    403118 <format_string_loop+0x478>
  403138:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  40313d:	75 d9                	jne    403118 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  40313f:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  403143:	85 c9                	test   ecx,ecx
  403145:	0f 84 45 fc ff ff    	je     402d90 <format_string_loop+0xf0>
            while (l++ < width) {
  40314b:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  40314f:	44 8d 78 01          	lea    r15d,[rax+0x1]
  403153:	41 39 c4             	cmp    r12d,eax
  403156:	0f 86 34 fc ff ff    	jbe    402d90 <format_string_loop+0xf0>
  40315c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  403160:	be 20 00 00 00       	mov    esi,0x20
  403165:	48 89 ef             	mov    rdi,rbp
  403168:	e8 63 e7 ff ff       	call   4018d0 <putchar_via_gadget>
            while (l++ < width) {
  40316d:	44 89 f8             	mov    eax,r15d
  403170:	41 83 c7 01          	add    r15d,0x1
  403174:	41 39 c4             	cmp    r12d,eax
  403177:	75 e7                	jne    403160 <format_string_loop+0x4c0>
  403179:	e9 12 fc ff ff       	jmp    402d90 <format_string_loop+0xf0>
  40317e:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  403180:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  403184:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40318b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  403190:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  403194:	40 84 f6             	test   sil,sil
  403197:	0f 84 0d fc ff ff    	je     402daa <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40319d:	40 0f be fe          	movsx  edi,sil
  4031a1:	e8 da e8 ff ff       	call   401a80 <is_digit_>
  4031a6:	84 c0                	test   al,al
  4031a8:	0f 85 82 00 00 00    	jne    403230 <format_string_loop+0x590>
      else if (*format == '*') {
  4031ae:	40 80 fe 2a          	cmp    sil,0x2a
  4031b2:	0f 84 98 00 00 00    	je     403250 <format_string_loop+0x5b0>
  4031b8:	48 89 ca             	mov    rdx,rcx
  4031bb:	e9 6e fb ff ff       	jmp    402d2e <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  4031c0:	4c 89 cf             	mov    rdi,r9
  4031c3:	e8 c8 e8 ff ff       	call   401a90 <atou_>
    if (*format == '.') {
  4031c8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  4031cd:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  4031d0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4031d3:	e9 49 fb ff ff       	jmp    402d21 <format_string_loop+0x81>
  4031d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4031df:	00 
      const int w = va_arg(args, int);
  4031e0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4031e2:	83 f8 2f             	cmp    eax,0x2f
  4031e5:	77 39                	ja     403220 <format_string_loop+0x580>
  4031e7:	89 c1                	mov    ecx,eax
  4031e9:	83 c0 08             	add    eax,0x8
  4031ec:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4031f0:	89 03                	mov    DWORD PTR [rbx],eax
  4031f2:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  4031f5:	45 85 e4             	test   r12d,r12d
  4031f8:	79 07                	jns    403201 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  4031fa:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  4031fe:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  403201:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403205:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40320a:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40320e:	40 84 f6             	test   sil,sil
  403211:	0f 84 93 fb ff ff    	je     402daa <format_string_loop+0x10a>
  403217:	48 89 c2             	mov    rdx,rax
  40321a:	e9 02 fb ff ff       	jmp    402d21 <format_string_loop+0x81>
  40321f:	90                   	nop
      const int w = va_arg(args, int);
  403220:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  403224:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403228:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40322c:	eb c4                	jmp    4031f2 <format_string_loop+0x552>
  40322e:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  403230:	4c 89 cf             	mov    rdi,r9
  403233:	e8 58 e8 ff ff       	call   401a90 <atou_>
    switch (*format) {
  403238:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  40323d:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  403240:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403243:	e9 e6 fa ff ff       	jmp    402d2e <format_string_loop+0x8e>
  403248:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40324f:	00 
        const int precision_ = va_arg(args, int);
  403250:	8b 03                	mov    eax,DWORD PTR [rbx]
  403252:	83 f8 2f             	cmp    eax,0x2f
  403255:	0f 87 ed 01 00 00    	ja     403448 <format_string_loop+0x7a8>
  40325b:	89 c1                	mov    ecx,eax
  40325d:	83 c0 08             	add    eax,0x8
  403260:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403264:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  403266:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  403269:	31 c0                	xor    eax,eax
  40326b:	45 85 d2             	test   r10d,r10d
  40326e:	41 0f 49 c2          	cmovns eax,r10d
  403272:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  403275:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403279:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40327e:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403282:	40 84 f6             	test   sil,sil
  403285:	0f 84 1f fb ff ff    	je     402daa <format_string_loop+0x10a>
  40328b:	48 89 c2             	mov    rdx,rax
  40328e:	e9 9b fa ff ff       	jmp    402d2e <format_string_loop+0x8e>
  403293:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  403298:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40329c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  4032a0:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4032a5:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  4032a9:	40 84 f6             	test   sil,sil
  4032ac:	0f 85 af fa ff ff    	jne    402d61 <format_string_loop+0xc1>
  4032b2:	e9 f3 fa ff ff       	jmp    402daa <format_string_loop+0x10a>
  4032b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4032be:	00 00 
          flags |= FLAGS_LONG_LONG;
  4032c0:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  4032c7:	eb d3                	jmp    40329c <format_string_loop+0x5fc>
  4032c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  4032d0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4032d4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4032d8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4032dc:	e9 5c fc ff ff       	jmp    402f3d <format_string_loop+0x29d>
  4032e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  4032e8:	44 89 de             	mov    esi,r11d
  4032eb:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  4032ee:	85 d2                	test   edx,edx
  4032f0:	0f 85 c2 01 00 00    	jne    4034b8 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  4032f6:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4032fd:	0f 85 b5 01 00 00    	jne    4034b8 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  403303:	41 f6 c3 40          	test   r11b,0x40
  403307:	0f 84 6f 03 00 00    	je     40367c <format_string_loop+0x9dc>
  40330d:	83 f8 2f             	cmp    eax,0x2f
  403310:	0f 87 d7 03 00 00    	ja     4036ed <format_string_loop+0xa4d>
  403316:	89 c2                	mov    edx,eax
  403318:	83 c0 08             	add    eax,0x8
  40331b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40331f:	89 03                	mov    DWORD PTR [rbx],eax
  403321:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  403325:	48 83 ec 08          	sub    rsp,0x8
  403329:	31 d2                	xor    edx,edx
  40332b:	48 89 ef             	mov    rdi,rbp
  40332e:	45 89 e1             	mov    r9d,r12d
  403331:	56                   	push   rsi
  403332:	45 89 f8             	mov    r8d,r15d
  403335:	4c 89 de             	mov    rsi,r11
  403338:	e8 e3 ea ff ff       	call   401e20 <print_integer>
  while (*format)
  40333d:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403342:	5e                   	pop    rsi
  403343:	5f                   	pop    rdi
  403344:	e9 55 fa ff ff       	jmp    402d9e <format_string_loop+0xfe>
  403349:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403350:	41 f6 c3 80          	test   r11b,0x80
  403354:	0f 84 06 01 00 00    	je     403460 <format_string_loop+0x7c0>
  40335a:	83 f8 2f             	cmp    eax,0x2f
  40335d:	0f 87 08 03 00 00    	ja     40366b <format_string_loop+0x9cb>
  403363:	89 c6                	mov    esi,eax
  403365:	83 c0 08             	add    eax,0x8
  403368:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40336c:	89 03                	mov    DWORD PTR [rbx],eax
  40336e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403371:	66 89 08             	mov    WORD PTR [rax],cx
  403374:	e9 00 fd ff ff       	jmp    403079 <format_string_loop+0x3d9>
  403379:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  403380:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403384:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403388:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40338c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40338f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403393:	48 85 c0             	test   rax,rax
  403396:	0f 85 11 fd ff ff    	jne    4030ad <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40339c:	45 89 d8             	mov    r8d,r11d
  40339f:	44 89 e1             	mov    ecx,r12d
  4033a2:	ba 06 00 00 00       	mov    edx,0x6
  4033a7:	48 89 ef             	mov    rdi,rbp
  4033aa:	48 8d 35 0d 1e 00 00 	lea    rsi,[rip+0x1e0d]        # 4051be <memcpy+0xdbe>
  4033b1:	e8 1a e7 ff ff       	call   401ad0 <out_rev_>
  4033b6:	e9 d5 f9 ff ff       	jmp    402d90 <format_string_loop+0xf0>
  4033bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4033c0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4033c4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4033c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4033cc:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4033cf:	48 85 f6             	test   rsi,rsi
  4033d2:	0f 85 4f fc ff ff    	jne    403027 <format_string_loop+0x387>
  4033d8:	45 89 d8             	mov    r8d,r11d
  4033db:	b9 12 00 00 00       	mov    ecx,0x12
  4033e0:	ba 05 00 00 00       	mov    edx,0x5
  4033e5:	48 89 ef             	mov    rdi,rbp
  4033e8:	48 8d 35 d6 1d 00 00 	lea    rsi,[rip+0x1dd6]        # 4051c5 <memcpy+0xdc5>
  4033ef:	e8 dc e6 ff ff       	call   401ad0 <out_rev_>
  4033f4:	e9 97 f9 ff ff       	jmp    402d90 <format_string_loop+0xf0>
  4033f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  403400:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403404:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403408:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40340c:	e9 87 fb ff ff       	jmp    402f98 <format_string_loop+0x2f8>
  403411:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  403418:	44 89 d8             	mov    eax,r11d
  40341b:	41 83 cb 20          	or     r11d,0x20
  40341f:	40 80 fe 58          	cmp    sil,0x58
  403423:	b9 10 00 00 00       	mov    ecx,0x10
  403428:	44 0f 45 d8          	cmovne r11d,eax
  40342c:	e9 cf f9 ff ff       	jmp    402e00 <format_string_loop+0x160>
  403431:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  403438:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  40343f:	e9 90 f9 ff ff       	jmp    402dd4 <format_string_loop+0x134>
  403444:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  403448:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  40344c:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403450:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403454:	e9 0d fe ff ff       	jmp    403266 <format_string_loop+0x5c6>
  403459:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  403460:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403467:	0f 85 d3 00 00 00    	jne    403540 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  40346d:	41 81 e3 00 04 00 00 	and    r11d,0x400
  403474:	0f 85 c6 00 00 00    	jne    403540 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  40347a:	83 f8 2f             	cmp    eax,0x2f
  40347d:	0f 87 a4 02 00 00    	ja     403727 <format_string_loop+0xa87>
  403483:	89 c6                	mov    esi,eax
  403485:	83 c0 08             	add    eax,0x8
  403488:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40348c:	89 03                	mov    DWORD PTR [rbx],eax
  40348e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403491:	89 08                	mov    DWORD PTR [rax],ecx
  403493:	e9 e1 fb ff ff       	jmp    403079 <format_string_loop+0x3d9>
  403498:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40349f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4034a0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4034a4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4034a8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4034ac:	e9 be fb ff ff       	jmp    40306f <format_string_loop+0x3cf>
  4034b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  4034b8:	83 f8 2f             	cmp    eax,0x2f
  4034bb:	0f 87 78 01 00 00    	ja     403639 <format_string_loop+0x999>
  4034c1:	89 c7                	mov    edi,eax
  4034c3:	83 c0 08             	add    eax,0x8
  4034c6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4034ca:	89 03                	mov    DWORD PTR [rbx],eax
  4034cc:	48 83 ec 08          	sub    rsp,0x8
  4034d0:	45 89 e1             	mov    r9d,r12d
  4034d3:	45 89 f8             	mov    r8d,r15d
  4034d6:	31 d2                	xor    edx,edx
  4034d8:	56                   	push   rsi
  4034d9:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4034dc:	48 89 ef             	mov    rdi,rbp
  4034df:	e8 3c e9 ff ff       	call   401e20 <print_integer>
  while (*format)
  4034e4:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4034e9:	41 58                	pop    r8
  4034eb:	41 59                	pop    r9
  4034ed:	e9 ac f8 ff ff       	jmp    402d9e <format_string_loop+0xfe>
  4034f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4034f8:	83 f8 2f             	cmp    eax,0x2f
  4034fb:	0f 87 27 01 00 00    	ja     403628 <format_string_loop+0x988>
  403501:	89 c2                	mov    edx,eax
  403503:	83 c0 08             	add    eax,0x8
  403506:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40350a:	89 03                	mov    DWORD PTR [rbx],eax
  40350c:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  40350f:	45 89 e1             	mov    r9d,r12d
  403512:	45 89 f8             	mov    r8d,r15d
  403515:	48 89 ef             	mov    rdi,rbp
  403518:	48 89 d6             	mov    rsi,rdx
  40351b:	48 f7 de             	neg    rsi
  40351e:	48 0f 48 f2          	cmovs  rsi,rdx
  403522:	48 83 ec 08          	sub    rsp,0x8
  403526:	48 c1 ea 3f          	shr    rdx,0x3f
  40352a:	41 53                	push   r11
  40352c:	e8 ef e8 ff ff       	call   401e20 <print_integer>
  while (*format)
  403531:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403536:	41 5c                	pop    r12
  403538:	41 5e                	pop    r14
  40353a:	e9 5f f8 ff ff       	jmp    402d9e <format_string_loop+0xfe>
  40353f:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403540:	83 f8 2f             	cmp    eax,0x2f
  403543:	0f 87 7b 01 00 00    	ja     4036c4 <format_string_loop+0xa24>
  403549:	89 c6                	mov    esi,eax
  40354b:	83 c0 08             	add    eax,0x8
  40354e:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  403552:	89 03                	mov    DWORD PTR [rbx],eax
  403554:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403557:	48 89 08             	mov    QWORD PTR [rax],rcx
  40355a:	e9 1a fb ff ff       	jmp    403079 <format_string_loop+0x3d9>
  40355f:	90                   	nop
          while (l++ < width) {
  403560:	41 83 fc 01          	cmp    r12d,0x1
  403564:	76 23                	jbe    403589 <format_string_loop+0x8e9>
  403566:	41 bf 02 00 00 00    	mov    r15d,0x2
  40356c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403570:	be 20 00 00 00       	mov    esi,0x20
  403575:	48 89 ef             	mov    rdi,rbp
  403578:	e8 53 e3 ff ff       	call   4018d0 <putchar_via_gadget>
          while (l++ < width) {
  40357d:	44 89 f8             	mov    eax,r15d
  403580:	41 83 c7 01          	add    r15d,0x1
  403584:	41 39 c4             	cmp    r12d,eax
  403587:	75 e7                	jne    403570 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403589:	8b 03                	mov    eax,DWORD PTR [rbx]
  40358b:	83 f8 2f             	cmp    eax,0x2f
  40358e:	0f 87 b6 00 00 00    	ja     40364a <format_string_loop+0x9aa>
  403594:	89 c2                	mov    edx,eax
  403596:	83 c0 08             	add    eax,0x8
  403599:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40359d:	89 03                	mov    DWORD PTR [rbx],eax
  40359f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4035a2:	48 89 ef             	mov    rdi,rbp
  4035a5:	e8 26 e3 ff ff       	call   4018d0 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  4035aa:	e9 e1 f7 ff ff       	jmp    402d90 <format_string_loop+0xf0>
  4035af:	90                   	nop
            while (l++ < width) {
  4035b0:	89 c1                	mov    ecx,eax
  4035b2:	8d 40 01             	lea    eax,[rax+0x1]
  4035b5:	41 39 cc             	cmp    r12d,ecx
  4035b8:	0f 86 bc 01 00 00    	jbe    40377a <format_string_loop+0xada>
  4035be:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  4035c3:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  4035c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4035ce:	00 00 
              putchar_via_gadget(output, ' ');
  4035d0:	be 20 00 00 00       	mov    esi,0x20
  4035d5:	48 89 ef             	mov    rdi,rbp
  4035d8:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4035dc:	e8 ef e2 ff ff       	call   4018d0 <putchar_via_gadget>
            while (l++ < width) {
  4035e1:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4035e5:	89 c2                	mov    edx,eax
  4035e7:	83 c0 01             	add    eax,0x1
  4035ea:	41 39 d4             	cmp    r12d,edx
  4035ed:	75 e1                	jne    4035d0 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4035ef:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4035f3:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4035f6:	40 84 f6             	test   sil,sil
  4035f9:	0f 84 91 f7 ff ff    	je     402d90 <format_string_loop+0xf0>
  4035ff:	45 85 f6             	test   r14d,r14d
  403602:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403607:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  40360c:	45 85 ff             	test   r15d,r15d
  40360f:	0f 85 f9 fa ff ff    	jne    40310e <format_string_loop+0x46e>
  403615:	84 c0                	test   al,al
  403617:	0f 85 f1 fa ff ff    	jne    40310e <format_string_loop+0x46e>
  40361d:	e9 6e f7 ff ff       	jmp    402d90 <format_string_loop+0xf0>
  403622:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403628:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40362c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403630:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403634:	e9 d3 fe ff ff       	jmp    40350c <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403639:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  40363d:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403641:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403645:	e9 82 fe ff ff       	jmp    4034cc <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40364a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40364e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403652:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403656:	e9 44 ff ff ff       	jmp    40359f <format_string_loop+0x8ff>
  40365b:	89 c2                	mov    edx,eax
  40365d:	83 c0 08             	add    eax,0x8
  403660:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403664:	89 03                	mov    DWORD PTR [rbx],eax
  403666:	e9 53 f9 ff ff       	jmp    402fbe <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  40366b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40366f:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403673:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403677:	e9 f2 fc ff ff       	jmp    40336e <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40367c:	41 81 e3 80 00 00 00 	and    r11d,0x80
  403683:	74 79                	je     4036fe <format_string_loop+0xa5e>
  403685:	83 f8 2f             	cmp    eax,0x2f
  403688:	0f 87 db 00 00 00    	ja     403769 <format_string_loop+0xac9>
  40368e:	89 c2                	mov    edx,eax
  403690:	83 c0 08             	add    eax,0x8
  403693:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403697:	89 03                	mov    DWORD PTR [rbx],eax
  403699:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  40369d:	e9 83 fc ff ff       	jmp    403325 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4036a2:	41 f6 c3 80          	test   r11b,0x80
  4036a6:	74 2d                	je     4036d5 <format_string_loop+0xa35>
  4036a8:	83 f8 2f             	cmp    eax,0x2f
  4036ab:	0f 87 a7 00 00 00    	ja     403758 <format_string_loop+0xab8>
  4036b1:	89 c2                	mov    edx,eax
  4036b3:	83 c0 08             	add    eax,0x8
  4036b6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4036ba:	89 03                	mov    DWORD PTR [rbx],eax
  4036bc:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  4036bf:	e9 a4 f7 ff ff       	jmp    402e68 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4036c4:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4036c8:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4036cc:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036d0:	e9 7f fe ff ff       	jmp    403554 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4036d5:	83 f8 2f             	cmp    eax,0x2f
  4036d8:	76 6c                	jbe    403746 <format_string_loop+0xaa6>
  4036da:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036de:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036e2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036e6:	8b 02                	mov    eax,DWORD PTR [rdx]
  4036e8:	e9 7b f7 ff ff       	jmp    402e68 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4036ed:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036f1:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036f5:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036f9:	e9 23 fc ff ff       	jmp    403321 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4036fe:	83 f8 2f             	cmp    eax,0x2f
  403701:	77 35                	ja     403738 <format_string_loop+0xa98>
  403703:	89 c2                	mov    edx,eax
  403705:	83 c0 08             	add    eax,0x8
  403708:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40370c:	89 03                	mov    DWORD PTR [rbx],eax
  40370e:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  403711:	e9 0f fc ff ff       	jmp    403325 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403716:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40371a:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40371e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403722:	e9 3e f7 ff ff       	jmp    402e65 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  403727:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40372b:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40372f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403733:	e9 56 fd ff ff       	jmp    40348e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403738:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40373c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403740:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403744:	eb c8                	jmp    40370e <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403746:	89 c2                	mov    edx,eax
  403748:	83 c0 08             	add    eax,0x8
  40374b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40374f:	89 03                	mov    DWORD PTR [rbx],eax
  403751:	8b 02                	mov    eax,DWORD PTR [rdx]
  403753:	e9 10 f7 ff ff       	jmp    402e68 <format_string_loop+0x1c8>
  403758:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40375c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403760:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403764:	e9 53 ff ff ff       	jmp    4036bc <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403769:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40376d:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403771:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403775:	e9 1f ff ff ff       	jmp    403699 <format_string_loop+0x9f9>
            while (l++ < width) {
  40377a:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  40377e:	e9 6c fe ff ff       	jmp    4035ef <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000403790 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  403790:	53                   	push   rbx
  403791:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  403794:	e8 07 f5 ff ff       	call   402ca0 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  403799:	48 89 df             	mov    rdi,rbx
  40379c:	e8 6f e1 ff ff       	call   401910 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  4037a1:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  4037a4:	5b                   	pop    rbx
  4037a5:	c3                   	ret    

Disassembly of section .text.vprintf:

00000000004037b0 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  4037b0:	f3 0f 1e fa          	endbr64 
  4037b4:	55                   	push   rbp
  4037b5:	49 89 f3             	mov    r11,rsi
  4037b8:	49 89 fa             	mov    r10,rdi
  4037bb:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  4037bf:	48 89 e5             	mov    rbp,rsp
  4037c2:	48 89 ef             	mov    rdi,rbp
  4037c5:	e8 56 e2 ff ff       	call   401a20 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  4037ca:	48 89 ef             	mov    rdi,rbp
  4037cd:	4c 89 da             	mov    rdx,r11
  4037d0:	4c 89 d6             	mov    rsi,r10
  4037d3:	e8 b8 ff ff ff       	call   403790 <vsnprintf_impl>
}
  4037d8:	48 83 c4 20          	add    rsp,0x20
  4037dc:	5d                   	pop    rbp
  4037dd:	c3                   	ret    

Disassembly of section .text.vsnprintf:

00000000004037e0 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  4037e0:	f3 0f 1e fa          	endbr64 
  4037e4:	55                   	push   rbp
  4037e5:	49 89 d1             	mov    r9,rdx
  4037e8:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  4037eb:	48 89 f2             	mov    rdx,rsi
  4037ee:	48 89 fe             	mov    rsi,rdi
{
  4037f1:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  4037f5:	48 89 e5             	mov    rbp,rsp
  4037f8:	48 89 ef             	mov    rdi,rbp
  4037fb:	e8 80 e1 ff ff       	call   401980 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403800:	48 89 ef             	mov    rdi,rbp
  403803:	4c 89 d2             	mov    rdx,r10
  403806:	4c 89 ce             	mov    rsi,r9
  403809:	e8 82 ff ff ff       	call   403790 <vsnprintf_impl>
}
  40380e:	48 83 c4 20          	add    rsp,0x20
  403812:	5d                   	pop    rbp
  403813:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000403820 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  403820:	f3 0f 1e fa          	endbr64 
  403824:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  403827:	48 89 f2             	mov    rdx,rsi
  40382a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40382f:	e9 ac ff ff ff       	jmp    4037e0 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000403840 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  403840:	f3 0f 1e fa          	endbr64 
  403844:	55                   	push   rbp
  403845:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403848:	48 89 f2             	mov    rdx,rsi
  40384b:	48 89 fe             	mov    rsi,rdi
{
  40384e:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403852:	48 89 e5             	mov    rbp,rsp
  403855:	48 89 ef             	mov    rdi,rbp
  403858:	e8 83 e1 ff ff       	call   4019e0 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  40385d:	48 89 ef             	mov    rdi,rbp
  403860:	48 89 ca             	mov    rdx,rcx
  403863:	4c 89 ce             	mov    rsi,r9
  403866:	e8 25 ff ff ff       	call   403790 <vsnprintf_impl>
}
  40386b:	48 83 c4 20          	add    rsp,0x20
  40386f:	5d                   	pop    rbp
  403870:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403880 <printf>:

int printf_(const char* format, ...)
{
  403880:	f3 0f 1e fa          	endbr64 
  403884:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40388b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403890:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403895:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40389a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40389f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4038a4:	84 c0                	test   al,al
  4038a6:	74 37                	je     4038df <printf+0x5f>
  4038a8:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4038ad:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4038b2:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4038b7:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4038be:	00 
  4038bf:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4038c6:	00 
  4038c7:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4038ce:	00 
  4038cf:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4038d6:	00 
  4038d7:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4038de:	00 
  va_list args;
  va_start(args, format);
  4038df:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4038e6:	00 
  const int ret = vprintf_(format, args);
  4038e7:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  4038ec:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  4038f3:	00 
  4038f4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4038f9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4038fe:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403905:	00 
  403906:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  40390b:	e8 a0 fe ff ff       	call   4037b0 <vprintf>
  va_end(args);
  return ret;
}
  403910:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403917:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000403920 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  403920:	f3 0f 1e fa          	endbr64 
  403924:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40392b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403930:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403935:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40393a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40393f:	84 c0                	test   al,al
  403941:	74 37                	je     40397a <sprintf+0x5a>
  403943:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403948:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  40394d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403952:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403959:	00 
  40395a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403961:	00 
  403962:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403969:	00 
  40396a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403971:	00 
  403972:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403979:	00 
  va_list args;
  va_start(args, format);
  40397a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403981:	00 
  const int ret = vsprintf_(s, format, args);
  403982:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403987:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  40398e:	00 
  40398f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403994:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403999:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4039a0:	00 
  4039a1:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  4039a6:	e8 75 fe ff ff       	call   403820 <vsprintf>
  va_end(args);
  return ret;
}
  4039ab:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4039b2:	c3                   	ret    

Disassembly of section .text.snprintf:

00000000004039c0 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  4039c0:	f3 0f 1e fa          	endbr64 
  4039c4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4039cb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4039d0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4039d5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4039da:	84 c0                	test   al,al
  4039dc:	74 37                	je     403a15 <snprintf+0x55>
  4039de:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4039e3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4039e8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4039ed:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4039f4:	00 
  4039f5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4039fc:	00 
  4039fd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403a04:	00 
  403a05:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403a0c:	00 
  403a0d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403a14:	00 
  va_list args;
  va_start(args, format);
  403a15:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403a1c:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403a1d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403a22:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403a29:	00 
  403a2a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403a2f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403a34:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403a3b:	00 
  403a3c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403a41:	e8 9a fd ff ff       	call   4037e0 <vsnprintf>
  va_end(args);
  return ret;
}
  403a46:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403a4d:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403a50 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403a50:	f3 0f 1e fa          	endbr64 
  403a54:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403a5b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403a60:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403a65:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403a6a:	84 c0                	test   al,al
  403a6c:	74 37                	je     403aa5 <fctprintf+0x55>
  403a6e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403a73:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403a78:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403a7d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403a84:	00 
  403a85:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403a8c:	00 
  403a8d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403a94:	00 
  403a95:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403a9c:	00 
  403a9d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403aa4:	00 
  va_list args;
  va_start(args, format);
  403aa5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403aac:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403aad:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403ab2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403ab9:	00 
  403aba:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403abf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403ac4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403acb:	00 
  403acc:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403ad1:	e8 6a fd ff ff       	call   403840 <vfctprintf>
  va_end(args);
  return ret;
}
  403ad6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403add:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403ae0 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403ae0:	f3 0f 1e fa          	endbr64 
  403ae4:	41 54                	push   r12
  403ae6:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403ae9:	40 0f be ff          	movsx  edi,dil
  403aed:	e8 0e 00 00 00       	call   403b00 <putchar_>
	return c;
}
  403af2:	44 89 e0             	mov    eax,r12d
  403af5:	41 5c                	pop    r12
  403af7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403b00 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403b00:	f3 0f 1e fa          	endbr64 
  403b04:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403b08:	ba 01 00 00 00       	mov    edx,0x1
  403b0d:	31 c0                	xor    eax,eax
void putchar_(char c){
  403b0f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403b14:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403b19:	bf 01 00 00 00       	mov    edi,0x1
  403b1e:	e8 6d d4 ff ff       	call   400f90 <write>
  403b23:	48 83 c4 18          	add    rsp,0x18
  403b27:	c3                   	ret    

Disassembly of section .text.max:

0000000000403b30 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403b30:	48 39 f7             	cmp    rdi,rsi
  403b33:	48 89 f0             	mov    rax,rsi
  403b36:	48 0f 43 c7          	cmovae rax,rdi
}
  403b3a:	c3                   	ret    

Disassembly of section .text.align:

0000000000403b40 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403b40:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403b45:	48 f7 de             	neg    rsi
  403b48:	48 21 f0             	and    rax,rsi
}
  403b4b:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403b50 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403b50:	31 c0                	xor    eax,eax
  403b52:	83 ff 01             	cmp    edi,0x1
  403b55:	76 4e                	jbe    403ba5 <granules_to_chunk_kind+0x55>
  403b57:	b8 01 00 00 00       	mov    eax,0x1
  403b5c:	83 ff 02             	cmp    edi,0x2
  403b5f:	74 44                	je     403ba5 <granules_to_chunk_kind+0x55>
  403b61:	83 ff 03             	cmp    edi,0x3
  403b64:	74 5a                	je     403bc0 <granules_to_chunk_kind+0x70>
  403b66:	83 ff 04             	cmp    edi,0x4
  403b69:	74 45                	je     403bb0 <granules_to_chunk_kind+0x60>
  403b6b:	83 ff 05             	cmp    edi,0x5
  403b6e:	74 60                	je     403bd0 <granules_to_chunk_kind+0x80>
  403b70:	83 ff 06             	cmp    edi,0x6
  403b73:	74 2b                	je     403ba0 <granules_to_chunk_kind+0x50>
  403b75:	b8 06 00 00 00       	mov    eax,0x6
  403b7a:	83 ff 08             	cmp    edi,0x8
  403b7d:	76 26                	jbe    403ba5 <granules_to_chunk_kind+0x55>
  403b7f:	b8 07 00 00 00       	mov    eax,0x7
  403b84:	83 ff 0a             	cmp    edi,0xa
  403b87:	76 1c                	jbe    403ba5 <granules_to_chunk_kind+0x55>
  403b89:	b8 08 00 00 00       	mov    eax,0x8
  403b8e:	83 ff 10             	cmp    edi,0x10
  403b91:	76 12                	jbe    403ba5 <granules_to_chunk_kind+0x55>
  403b93:	83 ff 21             	cmp    edi,0x21
  403b96:	19 c0                	sbb    eax,eax
  403b98:	24 0a                	and    al,0xa
  403b9a:	05 ff 00 00 00       	add    eax,0xff
  403b9f:	c3                   	ret    
  403ba0:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403ba5:	c3                   	ret    
  403ba6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403bad:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403bb0:	b8 03 00 00 00       	mov    eax,0x3
  403bb5:	c3                   	ret    
  403bb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403bbd:	00 00 00 
  403bc0:	b8 02 00 00 00       	mov    eax,0x2
  403bc5:	c3                   	ret    
  403bc6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403bcd:	00 00 00 
  403bd0:	b8 04 00 00 00       	mov    eax,0x4
  403bd5:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403be0 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403be0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403be5:	83 ff 09             	cmp    edi,0x9
  403be8:	77 0c                	ja     403bf6 <chunk_kind_to_granules+0x16>
  403bea:	89 ff                	mov    edi,edi
  403bec:	48 8d 05 cd 18 00 00 	lea    rax,[rip+0x18cd]        # 4054c0 <CSWTCH.34>
  403bf3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403bf6:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403c00 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403c00:	48 89 f8             	mov    rax,rdi
  403c03:	66 31 c0             	xor    ax,ax
}
  403c06:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403c10 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403c10:	89 f8                	mov    eax,edi
  403c12:	0f b6 c4             	movzx  eax,ah
}
  403c15:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403c20 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403c20:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403c24:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403c30 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403c30:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403c34:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403c40 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403c40:	89 f6                	mov    esi,esi
  403c42:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403c45:	48 c1 e6 08          	shl    rsi,0x8
  403c49:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403c4d:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403c50 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403c50:	48 8b 0d e9 1a 00 00 	mov    rcx,QWORD PTR [rip+0x1ae9]        # 405740 <large_objects>
  403c57:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403c5e:	00 
  403c5f:	76 07                	jbe    403c68 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403c61:	c3                   	ret    
  403c62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403c68:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403c6b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403c70:	e8 9b ff ff ff       	call   403c10 <get_chunk_index>
  403c75:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403c77:	e8 84 ff ff ff       	call   403c00 <get_page>
  403c7c:	48 89 c7             	mov    rdi,rax
  403c7f:	e8 bc ff ff ff       	call   403c40 <allocate_chunk>
		large_objects = large_objects->next;
  403c84:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403c87:	48 89 15 b2 1a 00 00 	mov    QWORD PTR [rip+0x1ab2],rdx        # 405740 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403c8e:	48 8b 15 13 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b13]        # 4057a8 <small_object_freelists+0x48>
  403c95:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403c98:	48 89 05 09 1b 00 00 	mov    QWORD PTR [rip+0x1b09],rax        # 4057a8 <small_object_freelists+0x48>
}
  403c9f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403ca0 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403ca0:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403ca4:	48 c1 e8 03          	shr    rax,0x3
}
  403ca8:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403ca9 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403ca9:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403cb0 <maybe_merge_free_large_object>:
{
  403cb0:	53                   	push   rbx
	struct large_object* obj = *prev;
  403cb1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403cb4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403cb7:	48 8d 1d 82 1a 00 00 	lea    rbx,[rip+0x1a82]        # 405740 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403cbe:	4c 89 df             	mov    rdi,r11
  403cc1:	e8 5a ff ff ff       	call   403c20 <get_large_object_payload>
  403cc6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403cca:	49 89 c2             	mov    r10,rax
  403ccd:	0f 1f 00             	nop    DWORD PTR [rax]
  403cd0:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403cd4:	be 00 01 00 00       	mov    esi,0x100
  403cd9:	48 89 d7             	mov    rdi,rdx
  403cdc:	e8 5f fe ff ff       	call   403b40 <align>
  403ce1:	48 39 c2             	cmp    rdx,rax
  403ce4:	0f 85 bf ff ff ff    	jne    403ca9 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403cea:	e8 21 ff ff ff       	call   403c10 <get_chunk_index>
  403cef:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403cf1:	85 c9                	test   ecx,ecx
  403cf3:	74 53                	je     403d48 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403cf5:	e8 06 ff ff ff       	call   403c00 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403cfa:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403cfe:	75 48                	jne    403d48 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403d00:	48 8b 05 39 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a39]        # 405740 <large_objects>
			ASSERT(walk);
  403d07:	48 85 c0             	test   rax,rax
  403d0a:	0f 84 99 ff ff ff    	je     403ca9 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403d10:	48 39 c2             	cmp    rdx,rax
  403d13:	74 3b                	je     403d50 <maybe_merge_free_large_object+0xa0>
  403d15:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403d18:	48 89 c1             	mov    rcx,rax
  403d1b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  403d1e:	48 85 c0             	test   rax,rax
  403d21:	74 32                	je     403d55 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  403d23:	48 39 c2             	cmp    rdx,rax
  403d26:	75 f0                	jne    403d18 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403d28:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  403d2c:	4c 39 c8             	cmp    rax,r9
  403d2f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403d33:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  403d38:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403d3b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  403d3f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  403d42:	eb 8c                	jmp    403cd0 <maybe_merge_free_large_object+0x20>
  403d44:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  403d48:	4c 89 c8             	mov    rax,r9
  403d4b:	5b                   	pop    rbx
  403d4c:	c3                   	ret    
  403d4d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403d50:	48 89 d9             	mov    rcx,rbx
  403d53:	eb d3                	jmp    403d28 <maybe_merge_free_large_object+0x78>
  403d55:	e9 4f ff ff ff       	jmp    403ca9 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000403d60 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  403d60:	8b 05 ce 19 00 00    	mov    eax,DWORD PTR [rip+0x19ce]        # 405734 <pending_large_object_compact>
  403d66:	85 c0                	test   eax,eax
  403d68:	74 2c                	je     403d96 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  403d6a:	48 83 3d ce 19 00 00 	cmp    QWORD PTR [rip+0x19ce],0x0        # 405740 <large_objects>
  403d71:	00 
		pending_large_object_compact = 0;
  403d72:	c7 05 b8 19 00 00 00 	mov    DWORD PTR [rip+0x19b8],0x0        # 405734 <pending_large_object_compact>
  403d79:	00 00 00 
		while(*prev)
  403d7c:	74 18                	je     403d96 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  403d7e:	48 8d 3d bb 19 00 00 	lea    rdi,[rip+0x19bb]        # 405740 <large_objects>
  403d85:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403d88:	e8 23 ff ff ff       	call   403cb0 <maybe_merge_free_large_object>
  403d8d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403d90:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403d94:	75 f2                	jne    403d88 <maybe_compact_free_large_objects+0x28>
}
  403d96:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403d97 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403d97:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403da0 <get_small_object_freelist>:
  403da0:	83 ff 09             	cmp    edi,0x9
  403da3:	0f 87 ee ff ff ff    	ja     403d97 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403da9:	89 ff                	mov    edi,edi
  403dab:	48 8d 05 ae 19 00 00 	lea    rax,[rip+0x19ae]        # 405760 <small_object_freelists>
  403db2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403db6:	c3                   	ret    

Disassembly of section .text.free:

0000000000403dc0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  403dc0:	f3 0f 1e fa          	endbr64 
  403dc4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  403dc7:	48 85 ff             	test   rdi,rdi
  403dca:	74 2a                	je     403df6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  403dcc:	e8 2f fe ff ff       	call   403c00 <get_page>
  403dd1:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  403dd4:	e8 37 fe ff ff       	call   403c10 <get_chunk_index>
  403dd9:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  403ddb:	89 c0                	mov    eax,eax
  403ddd:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  403de2:	40 80 ff ff          	cmp    dil,0xff
  403de6:	74 18                	je     403e00 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  403de8:	e8 b3 ff ff ff       	call   403da0 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  403ded:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403df0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  403df3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  403df6:	c3                   	ret    
  403df7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  403dfe:	00 00 
		struct large_object* obj = get_large_object(ptr);
  403e00:	4c 89 c7             	mov    rdi,r8
  403e03:	e8 28 fe ff ff       	call   403c30 <get_large_object>
		obj->next = large_objects;
  403e08:	48 8b 15 31 19 00 00 	mov    rdx,QWORD PTR [rip+0x1931]        # 405740 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403e0f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  403e12:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403e15:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  403e1a:	48 89 05 1f 19 00 00 	mov    QWORD PTR [rip+0x191f],rax        # 405740 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403e21:	e8 1a fe ff ff       	call   403c40 <allocate_chunk>
		pending_large_object_compact = 1;
  403e26:	c7 05 04 19 00 00 01 	mov    DWORD PTR [rip+0x1904],0x1        # 405734 <pending_large_object_compact>
  403e2d:	00 00 00 
  403e30:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000403e40 <heap_size_in_pages>:
int heap_size_in_pages()
{
  403e40:	f3 0f 1e fa          	endbr64 
  403e44:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  403e48:	31 ff                	xor    edi,edi
  403e4a:	e8 91 d2 ff ff       	call   4010e0 <sbrk>
  403e4f:	48 c7 c2 b0 57 40 00 	mov    rdx,0x4057b0
  403e56:	2b 02                	sub    eax,DWORD PTR [rdx]
  403e58:	48 83 c4 08          	add    rsp,0x8
  403e5c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

0000000000403e5d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  403e5d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000403e60 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403e60:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403e62:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403e64:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  403e66:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403e6d:	55                   	push   rbp
  403e6e:	48 89 f5             	mov    rbp,rsi
  403e71:	53                   	push   rbx
  403e72:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403e76:	e8 c5 ff ff ff       	call   403e40 <heap_size_in_pages>
	if(!walloc_heap_size)
  403e7b:	48 8b 3d b6 18 00 00 	mov    rdi,QWORD PTR [rip+0x18b6]        # 405738 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403e82:	c1 e0 10             	shl    eax,0x10
  403e85:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  403e88:	48 85 ff             	test   rdi,rdi
  403e8b:	75 63                	jne    403ef0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403e8d:	48 c7 c7 b0 57 40 00 	mov    rdi,0x4057b0
  403e94:	be 00 00 01 00       	mov    esi,0x10000
  403e99:	e8 a2 fc ff ff       	call   403b40 <align>
		walloc_heap_size = preallocated;
  403e9e:	48 89 1d 93 18 00 00 	mov    QWORD PTR [rip+0x1893],rbx        # 405738 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403ea5:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  403ea8:	49 39 dc             	cmp    r12,rbx
  403eab:	0f 87 94 00 00 00    	ja     403f45 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  403eb1:	48 85 db             	test   rbx,rbx
  403eb4:	0f 84 a3 ff ff ff    	je     403e5d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  403eba:	be 00 00 01 00       	mov    esi,0x10000
  403ebf:	48 89 df             	mov    rdi,rbx
  403ec2:	e8 79 fc ff ff       	call   403b40 <align>
  403ec7:	48 39 c3             	cmp    rbx,rax
  403eca:	0f 85 8d ff ff ff    	jne    403e5d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  403ed0:	48 c1 eb 10          	shr    rbx,0x10
  403ed4:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  403ed8:	48 83 c4 08          	add    rsp,0x8
  403edc:	4c 89 c0             	mov    rax,r8
  403edf:	5b                   	pop    rbx
  403ee0:	5d                   	pop    rbp
  403ee1:	41 5c                	pop    r12
  403ee3:	41 5d                	pop    r13
  403ee5:	c3                   	ret    
  403ee6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403eed:	00 00 00 
	if(preallocated < needed)
  403ef0:	4d 85 e4             	test   r12,r12
  403ef3:	74 5e                	je     403f53 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  403ef5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403ef8:	4c 89 e6             	mov    rsi,r12
  403efb:	48 d1 ef             	shr    rdi,1
  403efe:	e8 2d fc ff ff       	call   403b30 <max>
  403f03:	be 00 00 01 00       	mov    esi,0x10000
  403f08:	48 89 c7             	mov    rdi,rax
  403f0b:	e8 30 fc ff ff       	call   403b40 <align>
  403f10:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  403f13:	48 85 c0             	test   rax,rax
  403f16:	0f 84 41 ff ff ff    	je     403e5d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  403f1c:	48 89 c7             	mov    rdi,rax
  403f1f:	e8 bc d1 ff ff       	call   4010e0 <sbrk>
  403f24:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  403f28:	74 16                	je     403f40 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  403f2a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  403f2d:	4c 01 25 04 18 00 00 	add    QWORD PTR [rip+0x1804],r12        # 405738 <walloc_heap_size>
	size_t size = grow + preallocated;
  403f34:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  403f38:	e9 74 ff ff ff       	jmp    403eb1 <allocate_pages.constprop.0+0x51>
  403f3d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  403f40:	45 31 c0             	xor    r8d,r8d
  403f43:	eb 93                	jmp    403ed8 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403f45:	49 29 dc             	sub    r12,rbx
  403f48:	48 89 df             	mov    rdi,rbx
  403f4b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  403f4e:	48 89 c3             	mov    rbx,rax
  403f51:	eb a5                	jmp    403ef8 <allocate_pages.constprop.0+0x98>
  403f53:	e9 05 ff ff ff       	jmp    403e5d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000403f58 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  403f58:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000403f60 <allocate_large_object>:
{
  403f60:	41 54                	push   r12
  403f62:	55                   	push   rbp
  403f63:	53                   	push   rbx
  403f64:	48 89 fb             	mov    rbx,rdi
  403f67:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  403f6b:	e8 f0 fd ff ff       	call   403d60 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  403f70:	48 8b 15 c9 17 00 00 	mov    rdx,QWORD PTR [rip+0x17c9]        # 405740 <large_objects>
  403f77:	48 85 d2             	test   rdx,rdx
  403f7a:	0f 84 da 01 00 00    	je     40415a <allocate_large_object+0x1fa>
  403f80:	4c 8d 0d b9 17 00 00 	lea    r9,[rip+0x17b9]        # 405740 <large_objects>
	size_t best_size = -1;
  403f87:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  403f8e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  403f92:	45 31 d2             	xor    r10d,r10d
  403f95:	4c 89 cd             	mov    rbp,r9
  403f98:	eb 11                	jmp    403fab <allocate_large_object+0x4b>
  403f9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  403fa0:	49 89 d1             	mov    r9,rdx
  403fa3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  403fa6:	48 85 d2             	test   rdx,rdx
  403fa9:	74 39                	je     403fe4 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  403fab:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  403faf:	4c 39 c1             	cmp    rcx,r8
  403fb2:	73 ec                	jae    403fa0 <allocate_large_object+0x40>
  403fb4:	48 39 d9             	cmp    rcx,rbx
  403fb7:	72 e7                	jb     403fa0 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  403fb9:	be 00 01 00 00       	mov    esi,0x100
  403fbe:	e8 7d fb ff ff       	call   403b40 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  403fc3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  403fc7:	48 39 c6             	cmp    rsi,rax
  403fca:	0f 84 88 02 00 00    	je     404258 <allocate_large_object+0x2f8>
  403fd0:	4c 89 cd             	mov    rbp,r9
  403fd3:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  403fd6:	49 89 d1             	mov    r9,rdx
  403fd9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  403fdc:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  403fdf:	48 85 d2             	test   rdx,rdx
  403fe2:	75 c7                	jne    403fab <allocate_large_object+0x4b>
	if(!best)
  403fe4:	4d 85 d2             	test   r10,r10
  403fe7:	0f 84 7b 01 00 00    	je     404168 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  403fed:	4c 89 d7             	mov    rdi,r10
  403ff0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  403ff5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  403ff8:	e8 13 fc ff ff       	call   403c10 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  403ffd:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404000:	89 c6                	mov    esi,eax
  404002:	e8 f9 fb ff ff       	call   403c00 <get_page>
  404007:	48 89 c7             	mov    rdi,rax
  40400a:	49 89 c1             	mov    r9,rax
  40400d:	e8 2e fc ff ff       	call   403c40 <allocate_chunk>
	struct large_object* next = best->next;
  404012:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  404015:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  404019:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  404020:	75 36                	jne    404058 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  404022:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  404026:	4c 89 d7             	mov    rdi,r10
  404029:	be 00 01 00 00       	mov    esi,0x100
  40402e:	e8 ed fb ff ff       	call   403c20 <get_large_object_payload>
  404033:	48 01 c2             	add    rdx,rax
  404036:	48 89 d7             	mov    rdi,rdx
  404039:	e8 02 fb ff ff       	call   403b40 <align>
  40403e:	48 39 c2             	cmp    rdx,rax
  404041:	0f 85 11 ff ff ff    	jne    403f58 <allocate_large_object.cold>
}
  404047:	48 83 c4 10          	add    rsp,0x10
  40404b:	4c 89 d0             	mov    rax,r10
  40404e:	5b                   	pop    rbx
  40404f:	5d                   	pop    rbp
  404050:	41 5c                	pop    r12
  404052:	c3                   	ret    
  404053:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  404058:	4c 89 d7             	mov    rdi,r10
  40405b:	e8 c0 fb ff ff       	call   403c20 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  404060:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  404063:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  404067:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  40406a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  40406d:	4c 01 df             	add    rdi,r11
  404070:	e8 8b fb ff ff       	call   403c00 <get_page>
  404075:	49 39 c1             	cmp    r9,rax
  404078:	0f 84 e8 01 00 00    	je     404266 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  40407e:	be 00 00 01 00       	mov    esi,0x10000
  404083:	4c 89 df             	mov    rdi,r11
  404086:	e8 b5 fa ff ff       	call   403b40 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40408b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  404092:	0f 86 38 01 00 00    	jbe    4041d0 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404098:	4c 39 d8             	cmp    rax,r11
  40409b:	0f 85 b7 fe ff ff    	jne    403f58 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4040a1:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  4040a4:	be 00 00 01 00       	mov    esi,0x10000
  4040a9:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  4040b0:	ff 
			tail_size = best_size - size;
  4040b1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  4040b8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  4040b9:	e8 82 fa ff ff       	call   403b40 <align>
		best->size -= tail_size;
  4040be:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  4040c2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  4040c5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4040c8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  4040cb:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4040cf:	48 29 cf             	sub    rdi,rcx
  4040d2:	e8 39 fb ff ff       	call   403c10 <get_chunk_index>
  4040d7:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  4040d9:	48 85 c9             	test   rcx,rcx
  4040dc:	0f 84 44 ff ff ff    	je     404026 <allocate_large_object+0xc6>
  4040e2:	85 c0                	test   eax,eax
  4040e4:	75 0c                	jne    4040f2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  4040e6:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  4040ed:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  4040f2:	48 85 c9             	test   rcx,rcx
  4040f5:	0f 84 2b ff ff ff    	je     404026 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  4040fb:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4040fe:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  404103:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404106:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  40410a:	e8 f1 fa ff ff       	call   403c00 <get_page>
  40410f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  404112:	e8 29 fb ff ff       	call   403c40 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404117:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40411c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  40411f:	48 8b 05 1a 16 00 00 	mov    rax,QWORD PTR [rip+0x161a]        # 405740 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404126:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  40412a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  40412d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404130:	e8 eb fa ff ff       	call   403c20 <get_large_object_payload>
  404135:	48 01 c1             	add    rcx,rax
  404138:	48 89 cf             	mov    rdi,rcx
  40413b:	e8 00 fa ff ff       	call   403b40 <align>
  404140:	48 39 c1             	cmp    rcx,rax
  404143:	0f 85 0f fe ff ff    	jne    403f58 <allocate_large_object.cold>
			large_objects = tail;
  404149:	48 89 15 f0 15 00 00 	mov    QWORD PTR [rip+0x15f0],rdx        # 405740 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404150:	e8 fb fa ff ff       	call   403c50 <maybe_repurpose_single_chunk_large_objects_head>
  404155:	e9 c8 fe ff ff       	jmp    404022 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  40415a:	48 8d 2d df 15 00 00 	lea    rbp,[rip+0x15df]        # 405740 <large_objects>
  404161:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  404168:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40416c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  404171:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  404178:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40417a:	4c 89 e7             	mov    rdi,r12
  40417d:	e8 de fc ff ff       	call   403e60 <allocate_pages.constprop.0>
  404182:	48 89 c1             	mov    rcx,rax
		if(!page)
  404185:	48 85 c0             	test   rax,rax
  404188:	0f 84 10 01 00 00    	je     40429e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40418e:	ba ff 00 00 00       	mov    edx,0xff
  404193:	be 01 00 00 00       	mov    esi,0x1
  404198:	48 89 c7             	mov    rdi,rax
  40419b:	e8 a0 fa ff ff       	call   403c40 <allocate_chunk>
  4041a0:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  4041a3:	48 8b 05 96 15 00 00 	mov    rax,QWORD PTR [rip+0x1596]        # 405740 <large_objects>
		size_t page_header = ptr - ((char*)page);
  4041aa:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  4041ad:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  4041b0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  4041b5:	48 c1 e0 10          	shl    rax,0x10
  4041b9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  4041be:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  4041c2:	4d 39 c4             	cmp    r12,r8
  4041c5:	0f 86 22 fe ff ff    	jbe    403fed <allocate_large_object+0x8d>
  4041cb:	e9 88 fd ff ff       	jmp    403f58 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4041d0:	4c 39 d8             	cmp    rax,r11
  4041d3:	0f 85 7f fd ff ff    	jne    403f58 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4041d9:	48 89 ef             	mov    rdi,rbp
  4041dc:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4041e1:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4041e5:	e8 26 fa ff ff       	call   403c10 <get_chunk_index>
  4041ea:	4c 89 cf             	mov    rdi,r9
  4041ed:	89 c6                	mov    esi,eax
  4041ef:	e8 4c fa ff ff       	call   403c40 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4041f4:	b8 00 00 01 00       	mov    eax,0x10000
  4041f9:	4c 29 e0             	sub    rax,r12
  4041fc:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  404200:	48 8b 05 39 15 00 00 	mov    rax,QWORD PTR [rip+0x1539]        # 405740 <large_objects>
  404207:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  40420a:	4c 89 15 2f 15 00 00 	mov    QWORD PTR [rip+0x152f],r10        # 405740 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404211:	e8 3a fa ff ff       	call   403c50 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404216:	ba ff 00 00 00       	mov    edx,0xff
  40421b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  404220:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404227:	e8 14 fa ff ff       	call   403c40 <allocate_chunk>
			best->size = best_size =
  40422c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  404233:	ff 
  404234:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404238:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40423b:	48 39 d3             	cmp    rbx,rdx
  40423e:	0f 87 14 fd ff ff    	ja     403f58 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  404244:	48 89 d1             	mov    rcx,rdx
  404247:	48 29 d9             	sub    rcx,rbx
  40424a:	30 c9                	xor    cl,cl
  40424c:	e9 74 fe ff ff       	jmp    4040c5 <allocate_large_object+0x165>
  404251:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404258:	4c 89 cd             	mov    rbp,r9
  40425b:	49 89 c8             	mov    r8,rcx
  40425e:	49 89 d2             	mov    r10,rdx
  404261:	e9 87 fd ff ff       	jmp    403fed <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404266:	be 00 01 00 00       	mov    esi,0x100
  40426b:	4c 89 df             	mov    rdi,r11
  40426e:	e8 cd f8 ff ff       	call   403b40 <align>
  404273:	49 39 c3             	cmp    r11,rax
  404276:	0f 85 dc fc ff ff    	jne    403f58 <allocate_large_object.cold>
		best->size -= tail_size;
  40427c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404280:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  404283:	48 29 ca             	sub    rdx,rcx
  404286:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40428a:	e8 81 f9 ff ff       	call   403c10 <get_chunk_index>
  40428f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404291:	85 c0                	test   eax,eax
  404293:	0f 84 4d fe ff ff    	je     4040e6 <allocate_large_object+0x186>
  404299:	e9 5d fe ff ff       	jmp    4040fb <allocate_large_object+0x19b>
			return NULL;
  40429e:	45 31 d2             	xor    r10d,r10d
  4042a1:	e9 a1 fd ff ff       	jmp    404047 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

00000000004042b0 <allocate_large>:
{
  4042b0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  4042b4:	e8 a7 fc ff ff       	call   403f60 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  4042b9:	48 85 c0             	test   rax,rax
  4042bc:	74 12                	je     4042d0 <allocate_large+0x20>
  4042be:	48 89 c7             	mov    rdi,rax
}
  4042c1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  4042c5:	e9 56 f9 ff ff       	jmp    403c20 <get_large_object_payload>
  4042ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  4042d0:	31 c0                	xor    eax,eax
  4042d2:	48 83 c4 08          	add    rsp,0x8
  4042d6:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

00000000004042e0 <obtain_small_objects>:
{
  4042e0:	55                   	push   rbp
  4042e1:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  4042e3:	48 8b 3d be 14 00 00 	mov    rdi,QWORD PTR [rip+0x14be]        # 4057a8 <small_object_freelists+0x48>
  4042ea:	48 85 ff             	test   rdi,rdi
  4042ed:	74 71                	je     404360 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  4042ef:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4042f2:	48 89 05 af 14 00 00 	mov    QWORD PTR [rip+0x14af],rax        # 4057a8 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4042f9:	e8 12 f9 ff ff       	call   403c10 <get_chunk_index>
  4042fe:	89 ea                	mov    edx,ebp
  404300:	89 c6                	mov    esi,eax
  404302:	e8 f9 f8 ff ff       	call   403c00 <get_page>
  404307:	48 89 c7             	mov    rdi,rax
  40430a:	e8 31 f9 ff ff       	call   403c40 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  40430f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404311:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  404314:	e8 c7 f8 ff ff       	call   403be0 <chunk_kind_to_granules>
  404319:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404320:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  404327:	77 46                	ja     40436f <obtain_small_objects+0x8f>
  404329:	48 89 d0             	mov    rax,rdx
  40432c:	48 89 f1             	mov    rcx,rsi
  40432f:	48 29 f0             	sub    rax,rsi
  404332:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  404339:	31 c0                	xor    eax,eax
  40433b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  404340:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404343:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  404346:	48 89 d0             	mov    rax,rdx
		head->next = next;
  404349:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  40434c:	48 29 f2             	sub    rdx,rsi
  40434f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  404356:	76 e8                	jbe    404340 <obtain_small_objects+0x60>
}
  404358:	5d                   	pop    rbp
  404359:	c3                   	ret    
  40435a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  404360:	31 ff                	xor    edi,edi
  404362:	e8 f9 fb ff ff       	call   403f60 <allocate_large_object>
  404367:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40436a:	48 85 c0             	test   rax,rax
  40436d:	75 8a                	jne    4042f9 <obtain_small_objects+0x19>
			return NULL;
  40436f:	31 c0                	xor    eax,eax
}
  404371:	5d                   	pop    rbp
  404372:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000404380 <allocate_small>:
{
  404380:	53                   	push   rbx
  404381:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  404384:	e8 17 fa ff ff       	call   403da0 <get_small_object_freelist>
  404389:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40438c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40438f:	48 85 c0             	test   rax,rax
  404392:	74 0c                	je     4043a0 <allocate_small+0x20>
	*loc = ret->next;
  404394:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404397:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40439a:	5b                   	pop    rbx
  40439b:	c3                   	ret    
  40439c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  4043a0:	44 89 c7             	mov    edi,r8d
  4043a3:	e8 38 ff ff ff       	call   4042e0 <obtain_small_objects>
		if(!freelist)
  4043a8:	48 85 c0             	test   rax,rax
  4043ab:	74 ed                	je     40439a <allocate_small+0x1a>
		*loc = freelist;
  4043ad:	48 89 03             	mov    QWORD PTR [rbx],rax
  4043b0:	eb e2                	jmp    404394 <allocate_small+0x14>

Disassembly of section .text.malloc:

00000000004043c0 <malloc>:
{
  4043c0:	f3 0f 1e fa          	endbr64 
  4043c4:	48 83 ec 08          	sub    rsp,0x8
  4043c8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  4043cb:	e8 d0 f8 ff ff       	call   403ca0 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  4043d0:	89 c7                	mov    edi,eax
  4043d2:	e8 79 f7 ff ff       	call   403b50 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4043d7:	3d ff 00 00 00       	cmp    eax,0xff
  4043dc:	74 12                	je     4043f0 <malloc+0x30>
  4043de:	89 c7                	mov    edi,eax
}
  4043e0:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4043e4:	e9 97 ff ff ff       	jmp    404380 <allocate_small>
  4043e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4043f0:	4c 89 c7             	mov    rdi,r8
}
  4043f3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4043f7:	e9 b4 fe ff ff       	jmp    4042b0 <allocate_large>

Disassembly of section .text.memcpy:

0000000000404400 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  404400:	f3 0f 1e fa          	endbr64 
  404404:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  404407:	48 85 d2             	test   rdx,rdx
  40440a:	74 6c                	je     404478 <memcpy+0x78>
  40440c:	48 89 f0             	mov    rax,rsi
  40440f:	48 39 f7             	cmp    rdi,rsi
  404412:	74 64                	je     404478 <memcpy+0x78>
  404414:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  404417:	73 67                	jae    404480 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  404419:	48 89 fa             	mov    rdx,rdi
  40441c:	48 09 f2             	or     rdx,rsi
  40441f:	83 e2 03             	and    edx,0x3
  404422:	0f 85 e8 00 00 00    	jne    404510 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  404428:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  40442b:	49 89 c9             	mov    r9,rcx
  40442e:	4c 89 c6             	mov    rsi,r8
  404431:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  404434:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404438:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  40443c:	49 83 fa 03          	cmp    r10,0x3
  404440:	76 1f                	jbe    404461 <memcpy+0x61>
  404442:	31 d2                	xor    edx,edx
  404444:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  404448:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  40444b:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  40444e:	48 83 c2 01          	add    rdx,0x1
  404452:	48 39 d7             	cmp    rdi,rdx
  404455:	75 f1                	jne    404448 <memcpy+0x48>
  404457:	48 c1 e7 02          	shl    rdi,0x2
  40445b:	48 01 f8             	add    rax,rdi
  40445e:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  404461:	4d 85 c9             	test   r9,r9
  404464:	74 12                	je     404478 <memcpy+0x78>
  404466:	31 d2                	xor    edx,edx
  404468:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  40446c:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  40446f:	48 83 c2 01          	add    rdx,0x1
  404473:	49 39 d1             	cmp    r9,rdx
  404476:	75 f0                	jne    404468 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  404478:	4c 89 c0             	mov    rax,r8
  40447b:	c3                   	ret    
  40447c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  404480:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  404484:	48 01 d0             	add    rax,rdx
{
  404487:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  404488:	4c 89 ca             	mov    rdx,r9
{
  40448b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  40448c:	48 09 c2             	or     rdx,rax
  40448f:	83 e2 03             	and    edx,0x3
  404492:	0f 84 b8 00 00 00    	je     404550 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  404498:	4c 89 ca             	mov    rdx,r9
  40449b:	48 31 c2             	xor    rdx,rax
  40449e:	83 e2 03             	and    edx,0x3
  4044a1:	75 0a                	jne    4044ad <memcpy+0xad>
  4044a3:	48 83 f9 04          	cmp    rcx,0x4
  4044a7:	0f 87 13 01 00 00    	ja     4045c0 <memcpy+0x1c0>
  4044ad:	31 db                	xor    ebx,ebx
  4044af:	31 d2                	xor    edx,edx
  4044b1:	31 ed                	xor    ebp,ebp
			length -= t;
  4044b3:	48 89 ce             	mov    rsi,rcx
  4044b6:	48 f7 de             	neg    rsi
  4044b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  4044c0:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  4044c4:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  4044c8:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  4044ce:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  4044d3:	48 83 e9 01          	sub    rcx,0x1
  4044d7:	75 e7                	jne    4044c0 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  4044d9:	48 83 fd 03          	cmp    rbp,0x3
  4044dd:	0f 87 8d 00 00 00    	ja     404570 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  4044e3:	48 85 db             	test   rbx,rbx
  4044e6:	74 1c                	je     404504 <memcpy+0x104>
  4044e8:	48 f7 d3             	not    rbx
  4044eb:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  4044f2:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  4044f7:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  4044fb:	48 83 e8 01          	sub    rax,0x1
  4044ff:	48 39 d8             	cmp    rax,rbx
  404502:	75 ee                	jne    4044f2 <memcpy+0xf2>
}
  404504:	4c 89 c0             	mov    rax,r8
  404507:	5b                   	pop    rbx
  404508:	5d                   	pop    rbp
  404509:	c3                   	ret    
  40450a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  404510:	48 89 fa             	mov    rdx,rdi
  404513:	48 31 f2             	xor    rdx,rsi
  404516:	83 e2 03             	and    edx,0x3
  404519:	75 06                	jne    404521 <memcpy+0x121>
  40451b:	48 83 f9 03          	cmp    rcx,0x3
  40451f:	77 77                	ja     404598 <memcpy+0x198>
  404521:	45 31 c9             	xor    r9d,r9d
  404524:	31 ff                	xor    edi,edi
  404526:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  404529:	31 d2                	xor    edx,edx
  40452b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  404530:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  404534:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  404538:	48 83 c2 01          	add    rdx,0x1
  40453c:	48 39 d1             	cmp    rcx,rdx
  40453f:	75 ef                	jne    404530 <memcpy+0x130>
  404541:	48 01 c8             	add    rax,rcx
  404544:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  404548:	e9 ef fe ff ff       	jmp    40443c <memcpy+0x3c>
  40454d:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  404550:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  404553:	48 89 cb             	mov    rbx,rcx
  404556:	48 89 cd             	mov    rbp,rcx
		src += length;
  404559:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  40455c:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404560:	83 e3 03             	and    ebx,0x3
		dst += length;
  404563:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404566:	48 83 fd 03          	cmp    rbp,0x3
  40456a:	0f 86 73 ff ff ff    	jbe    4044e3 <memcpy+0xe3>
  404570:	48 89 d0             	mov    rax,rdx
  404573:	48 f7 d8             	neg    rax
  404576:	48 c1 e0 02          	shl    rax,0x2
  40457a:	49 01 c3             	add    r11,rax
  40457d:	49 01 c2             	add    r10,rax
  404580:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  404585:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  40458a:	48 83 ea 01          	sub    rdx,0x1
  40458e:	75 f0                	jne    404580 <memcpy+0x180>
  404590:	e9 4e ff ff ff       	jmp    4044e3 <memcpy+0xe3>
  404595:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  404598:	48 89 f2             	mov    rdx,rsi
  40459b:	83 e2 03             	and    edx,0x3
			length -= t;
  40459e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  4045a3:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  4045a8:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  4045ab:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  4045ae:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  4045b1:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4045b5:	41 83 e1 03          	and    r9d,0x3
  4045b9:	e9 6b ff ff ff       	jmp    404529 <memcpy+0x129>
  4045be:	66 90                	xchg   ax,ax
				t &= wmask;
  4045c0:	48 89 c6             	mov    rsi,rax
  4045c3:	83 e6 03             	and    esi,0x3
			length -= t;
  4045c6:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  4045c9:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  4045cc:	48 89 cb             	mov    rbx,rcx
			length -= t;
  4045cf:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  4045d2:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  4045d5:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  4045d9:	83 e3 03             	and    ebx,0x3
  4045dc:	e9 d2 fe ff ff       	jmp    4044b3 <memcpy+0xb3>
