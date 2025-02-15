
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
  400043:	53                   	push   rbx
  400044:	48 81 ec 98 02 00 00 	sub    rsp,0x298
  40004b:	89 bd 7c fd ff ff    	mov    DWORD PTR [rbp-0x284],edi
  400051:	48 89 b5 70 fd ff ff 	mov    QWORD PTR [rbp-0x290],rsi
  400058:	48 89 95 68 fd ff ff 	mov    QWORD PTR [rbp-0x298],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  40005f:	48 8d 05 2a 55 00 00 	lea    rax,[rip+0x552a]        # 405590 <b+0x4>
  400066:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    puts("Gamessis OS shell\n");
  40006a:	48 8d 05 26 55 00 00 	lea    rax,[rip+0x5526]        # 405597 <b+0xb>
  400071:	48 89 c7             	mov    rdi,rax
  400074:	e8 f7 14 00 00       	call   401570 <puts>
    char cmd[128]  = {0};
  400079:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x0
  400080:	00 00 00 00 
  400084:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  40008b:	00 00 00 00 
  40008f:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  400096:	00 00 00 00 
  40009a:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  4000a1:	00 00 00 00 
  4000a5:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  4000ac:	00 00 00 00 
  4000b0:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  4000b7:	00 00 00 00 
  4000bb:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  4000c2:	00 00 00 00 
  4000c6:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  4000cd:	00 00 00 00 
  4000d1:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  4000d8:	00 00 00 00 
  4000dc:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  4000e3:	00 00 00 00 
  4000e7:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  4000ee:	00 00 00 00 
  4000f2:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  4000f9:	00 00 00 00 
  4000fd:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  400104:	00 00 00 00 
  400108:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  40010f:	00 00 00 00 
  400113:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  40011a:	00 00 00 00 
  40011e:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  400125:	00 00 00 00 
    char path[128] = "/";
  400129:	48 c7 85 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],0x2f
  400130:	2f 00 00 00 
  400134:	48 c7 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],0x0
  40013b:	00 00 00 00 
  40013f:	48 c7 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],0x0
  400146:	00 00 00 00 
  40014a:	48 c7 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],0x0
  400151:	00 00 00 00 
  400155:	48 c7 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],0x0
  40015c:	00 00 00 00 
  400160:	48 c7 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],0x0
  400167:	00 00 00 00 
  40016b:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x0
  400172:	00 00 00 00 
  400176:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x0
  40017d:	00 00 00 00 
  400181:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
  400188:	00 00 00 00 
  40018c:	48 c7 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],0x0
  400193:	00 00 00 00 
  400197:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
  40019e:	00 00 00 00 
  4001a2:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0x0
  4001a9:	00 00 00 00 
  4001ad:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
  4001b4:	00 00 00 00 
  4001b8:	48 c7 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],0x0
  4001bf:	00 00 00 00 
  4001c3:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
  4001ca:	00 00 00 00 
  4001ce:	48 c7 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],0x0
  4001d5:	00 00 00 00 
    while (1) {
        memset(cmd, 0, 128);
  4001d9:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4001e0:	ba 80 00 00 00       	mov    edx,0x80
  4001e5:	be 00 00 00 00       	mov    esi,0x0
  4001ea:	48 89 c7             	mov    rdi,rax
  4001ed:	e8 2e 14 00 00       	call   401620 <memset>
        int p = 0;
  4001f2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
        printf("%s:>", path);
  4001f9:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400200:	48 89 c6             	mov    rsi,rax
  400203:	48 8d 05 a0 53 00 00 	lea    rax,[rip+0x53a0]        # 4055aa <b+0x1e>
  40020a:	48 89 c7             	mov    rdi,rax
  40020d:	b8 00 00 00 00       	mov    eax,0x0
  400212:	e8 09 37 00 00       	call   403920 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400217:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40021e:	48 89 c7             	mov    rdi,rax
  400221:	e8 aa 13 00 00       	call   4015d0 <gets>
        puts(cmd);
  400226:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40022d:	48 89 c7             	mov    rdi,rax
  400230:	e8 3b 13 00 00       	call   401570 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400235:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40023c:	48 8d 15 6c 53 00 00 	lea    rdx,[rip+0x536c]        # 4055af <b+0x23>
  400243:	48 89 d6             	mov    rsi,rdx
  400246:	48 89 c7             	mov    rdi,rax
  400249:	e8 a2 14 00 00       	call   4016f0 <strcmp>
  40024e:	85 c0                	test   eax,eax
  400250:	75 14                	jne    400266 <main+0x22b>
            puts("Gamessis OS 1.0.\n");
  400252:	48 8d 05 5e 53 00 00 	lea    rax,[rip+0x535e]        # 4055b7 <b+0x2b>
  400259:	48 89 c7             	mov    rdi,rax
  40025c:	e8 0f 13 00 00       	call   401570 <puts>
  400261:	e9 73 ff ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400266:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40026d:	48 8d 15 55 53 00 00 	lea    rdx,[rip+0x5355]        # 4055c9 <b+0x3d>
  400274:	48 89 d6             	mov    rsi,rdx
  400277:	48 89 c7             	mov    rdi,rax
  40027a:	e8 71 14 00 00       	call   4016f0 <strcmp>
  40027f:	85 c0                	test   eax,eax
  400281:	0f 84 ba 0c 00 00    	je     400f41 <main+0xf06>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400287:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40028e:	48 8d 15 39 53 00 00 	lea    rdx,[rip+0x5339]        # 4055ce <b+0x42>
  400295:	48 89 d6             	mov    rsi,rdx
  400298:	48 89 c7             	mov    rdi,rax
  40029b:	e8 50 14 00 00       	call   4016f0 <strcmp>
  4002a0:	85 c0                	test   eax,eax
  4002a2:	75 79                	jne    40031d <main+0x2e2>
            // ls
            DIR*           dp = opendir(".");
  4002a4:	48 8d 05 26 53 00 00 	lea    rax,[rip+0x5326]        # 4055d1 <b+0x45>
  4002ab:	48 89 c7             	mov    rdi,rax
  4002ae:	e8 fd 0e 00 00       	call   4011b0 <opendir>
  4002b3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            struct dirent* dirp;
            if (!dp) {
  4002b7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  4002bc:	75 38                	jne    4002f6 <main+0x2bb>
                printf("error opening directory\n");
  4002be:	48 8d 05 0e 53 00 00 	lea    rax,[rip+0x530e]        # 4055d3 <b+0x47>
  4002c5:	48 89 c7             	mov    rdi,rax
  4002c8:	b8 00 00 00 00       	mov    eax,0x0
  4002cd:	e8 4e 36 00 00       	call   403920 <printf>
                continue;
  4002d2:	e9 65 0c 00 00       	jmp    400f3c <main+0xf01>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  4002d7:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4002db:	48 83 c0 18          	add    rax,0x18
  4002df:	48 89 c6             	mov    rsi,rax
  4002e2:	48 8d 05 03 53 00 00 	lea    rax,[rip+0x5303]        # 4055ec <b+0x60>
  4002e9:	48 89 c7             	mov    rdi,rax
  4002ec:	b8 00 00 00 00       	mov    eax,0x0
  4002f1:	e8 2a 36 00 00       	call   403920 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  4002f6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4002fa:	48 89 c7             	mov    rdi,rax
  4002fd:	e8 30 10 00 00       	call   401332 <readdir>
  400302:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  400306:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  40030b:	75 ca                	jne    4002d7 <main+0x29c>
            }
            close(dp);
  40030d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  400311:	89 c7                	mov    edi,eax
  400313:	e8 f8 0c 00 00       	call   401010 <close>
  400318:	e9 bc fe ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "cd") == 0) {
  40031d:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400324:	48 8d 15 c5 52 00 00 	lea    rdx,[rip+0x52c5]        # 4055f0 <b+0x64>
  40032b:	48 89 d6             	mov    rsi,rdx
  40032e:	48 89 c7             	mov    rdi,rax
  400331:	e8 ba 13 00 00       	call   4016f0 <strcmp>
  400336:	85 c0                	test   eax,eax
  400338:	0f 85 1a 02 00 00    	jne    400558 <main+0x51d>
            // cd
            char tmppath[128] = {0};
  40033e:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400345:	00 00 00 00 
  400349:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400350:	00 00 00 00 
  400354:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  40035b:	00 00 00 00 
  40035f:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400366:	00 00 00 00 
  40036a:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400371:	00 00 00 00 
  400375:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  40037c:	00 00 00 00 
  400380:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400387:	00 00 00 00 
  40038b:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400392:	00 00 00 00 
  400396:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40039d:	00 00 00 00 
  4003a1:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4003a8:	00 00 00 00 
  4003ac:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4003b3:	00 00 00 00 
  4003b7:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4003be:	00 00 00 00 
  4003c2:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  4003c9:	00 00 00 00 
  4003cd:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  4003d4:	00 00 00 00 
  4003d8:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  4003df:	00 00 00 00 
  4003e3:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  4003ea:	00 00 00 00 
            printf("enter path:");
  4003ee:	48 8d 05 fe 51 00 00 	lea    rax,[rip+0x51fe]        # 4055f3 <b+0x67>
  4003f5:	48 89 c7             	mov    rdi,rax
  4003f8:	b8 00 00 00 00       	mov    eax,0x0
  4003fd:	e8 1e 35 00 00       	call   403920 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  400402:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400409:	48 89 c7             	mov    rdi,rax
  40040c:	e8 bf 11 00 00       	call   4015d0 <gets>
            if (chdir(tmppath) == -1) {
  400411:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400418:	48 89 c7             	mov    rdi,rax
  40041b:	e8 b0 0f 00 00       	call   4013d0 <chdir>
  400420:	83 f8 ff             	cmp    eax,0xffffffff
  400423:	75 23                	jne    400448 <main+0x40d>
                printf("cannot find directory:%s\n", tmppath);
  400425:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40042c:	48 89 c6             	mov    rsi,rax
  40042f:	48 8d 05 c9 51 00 00 	lea    rax,[rip+0x51c9]        # 4055ff <b+0x73>
  400436:	48 89 c7             	mov    rdi,rax
  400439:	b8 00 00 00 00       	mov    eax,0x0
  40043e:	e8 dd 34 00 00       	call   403920 <printf>
                continue;
  400443:	e9 f4 0a 00 00       	jmp    400f3c <main+0xf01>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(path, "..") == 0) {
  400448:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  40044f:	48 8d 15 c3 51 00 00 	lea    rdx,[rip+0x51c3]        # 405619 <b+0x8d>
  400456:	48 89 d6             	mov    rsi,rdx
  400459:	48 89 c7             	mov    rdi,rax
  40045c:	e8 8f 12 00 00       	call   4016f0 <strcmp>
  400461:	85 c0                	test   eax,eax
  400463:	75 75                	jne    4004da <main+0x49f>
                char* p = tmppath + strlen(tmppath) - 1;
  400465:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40046c:	48 89 c7             	mov    rdi,rax
  40046f:	e8 cc 12 00 00       	call   401740 <strlen>
  400474:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400478:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40047f:	48 01 d0             	add    rax,rdx
  400482:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
                while (p > tmppath && *p == '/') {
  400486:	eb 0f                	jmp    400497 <main+0x45c>
                    *p-- = 0;
  400488:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  40048c:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400490:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  400494:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  400497:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40049e:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4004a2:	76 1c                	jbe    4004c0 <main+0x485>
  4004a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004ab:	3c 2f                	cmp    al,0x2f
  4004ad:	74 d9                	je     400488 <main+0x44d>
                }
                while (p > tmppath && *(p) != '/') {
  4004af:	eb 0f                	jmp    4004c0 <main+0x485>
                    *p-- = 0;
  4004b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004b5:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004b9:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4004bd:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  4004c0:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004c7:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4004cb:	76 68                	jbe    400535 <main+0x4fa>
  4004cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004d4:	3c 2f                	cmp    al,0x2f
  4004d6:	75 d9                	jne    4004b1 <main+0x476>
  4004d8:	eb 5b                	jmp    400535 <main+0x4fa>
                }
            }
            else if (strcmp(path, ".") == 0) {
  4004da:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4004e1:	48 8d 15 e9 50 00 00 	lea    rdx,[rip+0x50e9]        # 4055d1 <b+0x45>
  4004e8:	48 89 d6             	mov    rsi,rdx
  4004eb:	48 89 c7             	mov    rdi,rax
  4004ee:	e8 fd 11 00 00       	call   4016f0 <strcmp>
  4004f3:	85 c0                	test   eax,eax
  4004f5:	0f 84 40 0a 00 00    	je     400f3b <main+0xf00>
                continue;
            }
            else {
                strcat(tmppath, path);
  4004fb:	48 8d 95 78 fe ff ff 	lea    rdx,[rbp-0x188]
  400502:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400509:	48 89 d6             	mov    rsi,rdx
  40050c:	48 89 c7             	mov    rdi,rax
  40050f:	e8 9c 11 00 00       	call   4016b0 <strcat>
                strcat(tmppath, "/");
  400514:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40051b:	48 89 c7             	mov    rdi,rax
  40051e:	e8 1d 12 00 00       	call   401740 <strlen>
  400523:	48 89 c2             	mov    rdx,rax
  400526:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40052d:	48 01 d0             	add    rax,rdx
  400530:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  400535:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40053c:	48 89 c6             	mov    rsi,rax
  40053f:	48 8d 05 d6 50 00 00 	lea    rax,[rip+0x50d6]        # 40561c <b+0x90>
  400546:	48 89 c7             	mov    rdi,rax
  400549:	b8 00 00 00 00       	mov    eax,0x0
  40054e:	e8 cd 33 00 00       	call   403920 <printf>
  400553:	e9 81 fc ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400558:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40055f:	48 8d 15 cc 50 00 00 	lea    rdx,[rip+0x50cc]        # 405632 <b+0xa6>
  400566:	48 89 d6             	mov    rsi,rdx
  400569:	48 89 c7             	mov    rdi,rax
  40056c:	e8 7f 11 00 00       	call   4016f0 <strcmp>
  400571:	85 c0                	test   eax,eax
  400573:	0f 85 1e 01 00 00    	jne    400697 <main+0x65c>
            char path[100] = {0};
  400579:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400580:	00 00 00 00 
  400584:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  40058b:	00 00 00 00 
  40058f:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400596:	00 00 00 00 
  40059a:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4005a1:	00 00 00 00 
  4005a5:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4005ac:	00 00 00 00 
  4005b0:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4005b7:	00 00 00 00 
  4005bb:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4005c2:	00 00 00 00 
  4005c6:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4005cd:	00 00 00 00 
  4005d1:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4005d8:	00 00 00 00 
  4005dc:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4005e3:	00 00 00 00 
  4005e7:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4005ee:	00 00 00 00 
  4005f2:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4005f9:	00 00 00 00 
  4005fd:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400604:	00 00 00 
            printf("input path:");
  400607:	48 8d 05 2a 50 00 00 	lea    rax,[rip+0x502a]        # 405638 <b+0xac>
  40060e:	48 89 c7             	mov    rdi,rax
  400611:	b8 00 00 00 00       	mov    eax,0x0
  400616:	e8 05 33 00 00       	call   403920 <printf>
            gets(path);
  40061b:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400622:	48 89 c7             	mov    rdi,rax
  400625:	e8 a6 0f 00 00       	call   4015d0 <gets>
            int fd = creat(path, O_CREAT);
  40062a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400631:	be 40 00 00 00       	mov    esi,0x40
  400636:	48 89 c7             	mov    rdi,rax
  400639:	e8 07 0e 00 00       	call   401445 <creat>
  40063e:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
            if (fd < 0) {
  400641:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  400645:	79 23                	jns    40066a <main+0x62f>
                printf("create file %s failed\n", path);
  400647:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40064e:	48 89 c6             	mov    rsi,rax
  400651:	48 8d 05 ec 4f 00 00 	lea    rax,[rip+0x4fec]        # 405644 <b+0xb8>
  400658:	48 89 c7             	mov    rdi,rax
  40065b:	b8 00 00 00 00       	mov    eax,0x0
  400660:	e8 bb 32 00 00       	call   403920 <printf>
  400665:	e9 6f fb ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("create file %s success\n", path);
  40066a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400671:	48 89 c6             	mov    rsi,rax
  400674:	48 8d 05 e0 4f 00 00 	lea    rax,[rip+0x4fe0]        # 40565b <b+0xcf>
  40067b:	48 89 c7             	mov    rdi,rax
  40067e:	b8 00 00 00 00       	mov    eax,0x0
  400683:	e8 98 32 00 00       	call   403920 <printf>
                close(fd);
  400688:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  40068b:	89 c7                	mov    edi,eax
  40068d:	e8 7e 09 00 00       	call   401010 <close>
  400692:	e9 42 fb ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  400697:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40069e:	48 8d 15 ce 4f 00 00 	lea    rdx,[rip+0x4fce]        # 405673 <b+0xe7>
  4006a5:	48 89 d6             	mov    rsi,rdx
  4006a8:	48 89 c7             	mov    rdi,rax
  4006ab:	e8 40 10 00 00       	call   4016f0 <strcmp>
  4006b0:	85 c0                	test   eax,eax
  4006b2:	0f 85 0f 01 00 00    	jne    4007c7 <main+0x78c>
            char path[100] = {0};
  4006b8:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4006bf:	00 00 00 00 
  4006c3:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4006ca:	00 00 00 00 
  4006ce:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4006d5:	00 00 00 00 
  4006d9:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4006e0:	00 00 00 00 
  4006e4:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4006eb:	00 00 00 00 
  4006ef:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4006f6:	00 00 00 00 
  4006fa:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400701:	00 00 00 00 
  400705:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  40070c:	00 00 00 00 
  400710:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400717:	00 00 00 00 
  40071b:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400722:	00 00 00 00 
  400726:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  40072d:	00 00 00 00 
  400731:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400738:	00 00 00 00 
  40073c:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400743:	00 00 00 
            printf("input path:");
  400746:	48 8d 05 eb 4e 00 00 	lea    rax,[rip+0x4eeb]        # 405638 <b+0xac>
  40074d:	48 89 c7             	mov    rdi,rax
  400750:	b8 00 00 00 00       	mov    eax,0x0
  400755:	e8 c6 31 00 00       	call   403920 <printf>
            gets(path);
  40075a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400761:	48 89 c7             	mov    rdi,rax
  400764:	e8 67 0e 00 00       	call   4015d0 <gets>
            int stat = remove(path);
  400769:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400770:	48 89 c7             	mov    rdi,rax
  400773:	e8 f8 09 00 00       	call   401170 <remove>
  400778:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
            if (stat < 0) {
  40077b:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  40077f:	79 23                	jns    4007a4 <main+0x769>
                printf("remove file/dir %s failed\n", path);
  400781:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400788:	48 89 c6             	mov    rsi,rax
  40078b:	48 8d 05 e4 4e 00 00 	lea    rax,[rip+0x4ee4]        # 405676 <b+0xea>
  400792:	48 89 c7             	mov    rdi,rax
  400795:	b8 00 00 00 00       	mov    eax,0x0
  40079a:	e8 81 31 00 00       	call   403920 <printf>
  40079f:	e9 35 fa ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("remove file/dir %s success\n", path);
  4007a4:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4007ab:	48 89 c6             	mov    rsi,rax
  4007ae:	48 8d 05 dc 4e 00 00 	lea    rax,[rip+0x4edc]        # 405691 <b+0x105>
  4007b5:	48 89 c7             	mov    rdi,rax
  4007b8:	b8 00 00 00 00       	mov    eax,0x0
  4007bd:	e8 5e 31 00 00       	call   403920 <printf>
  4007c2:	e9 12 fa ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  4007c7:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4007ce:	48 8d 15 d8 4e 00 00 	lea    rdx,[rip+0x4ed8]        # 4056ad <b+0x121>
  4007d5:	48 89 d6             	mov    rsi,rdx
  4007d8:	48 89 c7             	mov    rdi,rax
  4007db:	e8 10 0f 00 00       	call   4016f0 <strcmp>
  4007e0:	85 c0                	test   eax,eax
  4007e2:	0f 85 d8 01 00 00    	jne    4009c0 <main+0x985>
            char src[100] = {0};
  4007e8:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  4007ef:	00 00 00 00 
  4007f3:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  4007fa:	00 00 00 00 
  4007fe:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400805:	00 00 00 00 
  400809:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400810:	00 00 00 00 
  400814:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  40081b:	00 00 00 00 
  40081f:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400826:	00 00 00 00 
  40082a:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400831:	00 00 00 00 
  400835:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  40083c:	00 00 00 00 
  400840:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400847:	00 00 00 00 
  40084b:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400852:	00 00 00 00 
  400856:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  40085d:	00 00 00 00 
  400861:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400868:	00 00 00 00 
  40086c:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400873:	00 00 00 
            char dst[100] = {0};
  400876:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40087d:	00 00 00 00 
  400881:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400888:	00 00 00 00 
  40088c:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400893:	00 00 00 00 
  400897:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40089e:	00 00 00 00 
  4008a2:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4008a9:	00 00 00 00 
  4008ad:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4008b4:	00 00 00 00 
  4008b8:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4008bf:	00 00 00 00 
  4008c3:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4008ca:	00 00 00 00 
  4008ce:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4008d5:	00 00 00 00 
  4008d9:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4008e0:	00 00 00 00 
  4008e4:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4008eb:	00 00 00 00 
  4008ef:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4008f6:	00 00 00 00 
  4008fa:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400901:	00 00 00 
            printf("input src path:");
  400904:	48 8d 05 a5 4d 00 00 	lea    rax,[rip+0x4da5]        # 4056b0 <b+0x124>
  40090b:	48 89 c7             	mov    rdi,rax
  40090e:	b8 00 00 00 00       	mov    eax,0x0
  400913:	e8 08 30 00 00       	call   403920 <printf>
            gets(src);
  400918:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  40091f:	48 89 c7             	mov    rdi,rax
  400922:	e8 a9 0c 00 00       	call   4015d0 <gets>
            printf("input dst path:");
  400927:	48 8d 05 92 4d 00 00 	lea    rax,[rip+0x4d92]        # 4056c0 <b+0x134>
  40092e:	48 89 c7             	mov    rdi,rax
  400931:	b8 00 00 00 00       	mov    eax,0x0
  400936:	e8 e5 2f 00 00       	call   403920 <printf>
            gets(dst);
  40093b:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400942:	48 89 c7             	mov    rdi,rax
  400945:	e8 86 0c 00 00       	call   4015d0 <gets>
            int stat = rename(src, dst);
  40094a:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  400951:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400958:	48 89 d6             	mov    rsi,rdx
  40095b:	48 89 c7             	mov    rdi,rax
  40095e:	e8 89 0b 00 00       	call   4014ec <rename>
  400963:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
            if (stat < 0) {
  400966:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  40096a:	79 2a                	jns    400996 <main+0x95b>
                printf("move file/dir %s to %s failed\n", src, dst);
  40096c:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  400973:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  40097a:	48 89 c6             	mov    rsi,rax
  40097d:	48 8d 05 4c 4d 00 00 	lea    rax,[rip+0x4d4c]        # 4056d0 <b+0x144>
  400984:	48 89 c7             	mov    rdi,rax
  400987:	b8 00 00 00 00       	mov    eax,0x0
  40098c:	e8 8f 2f 00 00       	call   403920 <printf>
  400991:	e9 43 f8 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  400996:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  40099d:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  4009a4:	48 89 c6             	mov    rsi,rax
  4009a7:	48 8d 05 42 4d 00 00 	lea    rax,[rip+0x4d42]        # 4056f0 <b+0x164>
  4009ae:	48 89 c7             	mov    rdi,rax
  4009b1:	b8 00 00 00 00       	mov    eax,0x0
  4009b6:	e8 65 2f 00 00       	call   403920 <printf>
  4009bb:	e9 19 f8 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  4009c0:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4009c7:	48 8d 15 42 4d 00 00 	lea    rdx,[rip+0x4d42]        # 405710 <b+0x184>
  4009ce:	48 89 d6             	mov    rsi,rdx
  4009d1:	48 89 c7             	mov    rdi,rax
  4009d4:	e8 17 0d 00 00       	call   4016f0 <strcmp>
  4009d9:	85 c0                	test   eax,eax
  4009db:	0f 85 e6 01 00 00    	jne    400bc7 <main+0xb8c>
            char path[100] = {0};
  4009e1:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  4009e8:	00 00 00 00 
  4009ec:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  4009f3:	00 00 00 00 
  4009f7:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  4009fe:	00 00 00 00 
  400a02:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400a09:	00 00 00 00 
  400a0d:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400a14:	00 00 00 00 
  400a18:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400a1f:	00 00 00 00 
  400a23:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400a2a:	00 00 00 00 
  400a2e:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400a35:	00 00 00 00 
  400a39:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400a40:	00 00 00 00 
  400a44:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400a4b:	00 00 00 00 
  400a4f:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400a56:	00 00 00 00 
  400a5a:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400a61:	00 00 00 00 
  400a65:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400a6c:	00 00 00 
            printf("input path:");
  400a6f:	48 8d 05 c2 4b 00 00 	lea    rax,[rip+0x4bc2]        # 405638 <b+0xac>
  400a76:	48 89 c7             	mov    rdi,rax
  400a79:	b8 00 00 00 00       	mov    eax,0x0
  400a7e:	e8 9d 2e 00 00       	call   403920 <printf>
            gets(path);
  400a83:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400a8a:	48 89 c7             	mov    rdi,rax
  400a8d:	e8 3e 0b 00 00       	call   4015d0 <gets>
            int fd = open(path, O_RDONLY);
  400a92:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400a99:	be 00 00 00 00       	mov    esi,0x0
  400a9e:	48 89 c7             	mov    rdi,rax
  400aa1:	e8 5a 05 00 00       	call   401000 <open>
  400aa6:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if (fd < 0) {
  400aa9:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  400aad:	79 23                	jns    400ad2 <main+0xa97>
                printf("open file %s failed\n", path);
  400aaf:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400ab6:	48 89 c6             	mov    rsi,rax
  400ab9:	48 8d 05 54 4c 00 00 	lea    rax,[rip+0x4c54]        # 405714 <b+0x188>
  400ac0:	48 89 c7             	mov    rdi,rax
  400ac3:	b8 00 00 00 00       	mov    eax,0x0
  400ac8:	e8 53 2e 00 00       	call   403920 <printf>
  400acd:	e9 07 f7 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400ad2:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400ad9:	00 00 00 00 
  400add:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400ae4:	00 00 00 00 
  400ae8:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400aef:	00 00 00 00 
  400af3:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400afa:	00 00 00 00 
  400afe:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400b05:	00 00 00 00 
  400b09:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400b10:	00 00 00 00 
  400b14:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400b1b:	00 00 00 00 
  400b1f:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400b26:	00 00 00 00 
  400b2a:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400b31:	00 00 00 00 
  400b35:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400b3c:	00 00 00 00 
  400b40:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400b47:	00 00 00 00 
  400b4b:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400b52:	00 00 00 00 
  400b56:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400b5d:	00 00 00 
                int  len         = 0;
  400b60:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [rbp-0x38],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400b67:	eb 1e                	jmp    400b87 <main+0xb4c>
                    printf("%s", buffer);
  400b69:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400b70:	48 89 c6             	mov    rsi,rax
  400b73:	48 8d 05 af 4b 00 00 	lea    rax,[rip+0x4baf]        # 405729 <b+0x19d>
  400b7a:	48 89 c7             	mov    rdi,rax
  400b7d:	b8 00 00 00 00       	mov    eax,0x0
  400b82:	e8 99 2d 00 00       	call   403920 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400b87:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400b8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400b91:	ba 64 00 00 00       	mov    edx,0x64
  400b96:	48 89 ce             	mov    rsi,rcx
  400b99:	89 c7                	mov    edi,eax
  400b9b:	e8 80 04 00 00       	call   401020 <read>
  400ba0:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
  400ba3:	83 7d c8 00          	cmp    DWORD PTR [rbp-0x38],0x0
  400ba7:	7f c0                	jg     400b69 <main+0xb2e>
                }
                puts("");
  400ba9:	48 8d 05 7c 4b 00 00 	lea    rax,[rip+0x4b7c]        # 40572c <b+0x1a0>
  400bb0:	48 89 c7             	mov    rdi,rax
  400bb3:	e8 b8 09 00 00       	call   401570 <puts>
                close(fd);
  400bb8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400bbb:	89 c7                	mov    edi,eax
  400bbd:	e8 4e 04 00 00       	call   401010 <close>
  400bc2:	e9 12 f6 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400bc7:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400bce:	48 8d 15 58 4b 00 00 	lea    rdx,[rip+0x4b58]        # 40572d <b+0x1a1>
  400bd5:	48 89 d6             	mov    rsi,rdx
  400bd8:	48 89 c7             	mov    rdi,rax
  400bdb:	e8 10 0b 00 00       	call   4016f0 <strcmp>
  400be0:	85 c0                	test   eax,eax
  400be2:	0f 85 fd 01 00 00    	jne    400de5 <main+0xdaa>
            char path[100] = {0};
  400be8:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400bef:	00 00 00 00 
  400bf3:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400bfa:	00 00 00 00 
  400bfe:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400c05:	00 00 00 00 
  400c09:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400c10:	00 00 00 00 
  400c14:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400c1b:	00 00 00 00 
  400c1f:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400c26:	00 00 00 00 
  400c2a:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400c31:	00 00 00 00 
  400c35:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400c3c:	00 00 00 00 
  400c40:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400c47:	00 00 00 00 
  400c4b:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400c52:	00 00 00 00 
  400c56:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400c5d:	00 00 00 00 
  400c61:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400c68:	00 00 00 00 
  400c6c:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400c73:	00 00 00 
            printf("input path:");
  400c76:	48 8d 05 bb 49 00 00 	lea    rax,[rip+0x49bb]        # 405638 <b+0xac>
  400c7d:	48 89 c7             	mov    rdi,rax
  400c80:	b8 00 00 00 00       	mov    eax,0x0
  400c85:	e8 96 2c 00 00       	call   403920 <printf>
            gets(path);
  400c8a:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400c91:	48 89 c7             	mov    rdi,rax
  400c94:	e8 37 09 00 00       	call   4015d0 <gets>
            int fd = open(path, O_WRONLY);
  400c99:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400ca0:	be 01 00 00 00       	mov    esi,0x1
  400ca5:	48 89 c7             	mov    rdi,rax
  400ca8:	e8 53 03 00 00       	call   401000 <open>
  400cad:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
            if (fd < 0) {
  400cb0:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  400cb4:	79 23                	jns    400cd9 <main+0xc9e>
                printf("open file %s failed\n", path);
  400cb6:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400cbd:	48 89 c6             	mov    rsi,rax
  400cc0:	48 8d 05 4d 4a 00 00 	lea    rax,[rip+0x4a4d]        # 405714 <b+0x188>
  400cc7:	48 89 c7             	mov    rdi,rax
  400cca:	b8 00 00 00 00       	mov    eax,0x0
  400ccf:	e8 4c 2c 00 00       	call   403920 <printf>
  400cd4:	e9 00 f5 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400cd9:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400ce0:	00 00 00 00 
  400ce4:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400ceb:	00 00 00 00 
  400cef:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400cf6:	00 00 00 00 
  400cfa:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400d01:	00 00 00 00 
  400d05:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400d0c:	00 00 00 00 
  400d10:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400d17:	00 00 00 00 
  400d1b:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400d22:	00 00 00 00 
  400d26:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400d2d:	00 00 00 00 
  400d31:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400d38:	00 00 00 00 
  400d3c:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400d43:	00 00 00 00 
  400d47:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400d4e:	00 00 00 00 
  400d52:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400d59:	00 00 00 00 
  400d5d:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400d64:	00 00 00 
                printf("input content:");
  400d67:	48 8d 05 c5 49 00 00 	lea    rax,[rip+0x49c5]        # 405733 <b+0x1a7>
  400d6e:	48 89 c7             	mov    rdi,rax
  400d71:	b8 00 00 00 00       	mov    eax,0x0
  400d76:	e8 a5 2b 00 00       	call   403920 <printf>
                gets(buffer);
  400d7b:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400d82:	48 89 c7             	mov    rdi,rax
  400d85:	e8 46 08 00 00       	call   4015d0 <gets>
                int len = strlen(buffer);
  400d8a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400d91:	48 89 c7             	mov    rdi,rax
  400d94:	e8 a7 09 00 00       	call   401740 <strlen>
  400d99:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
                write(fd, buffer, len);
  400d9c:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400d9f:	48 63 d0             	movsxd rdx,eax
  400da2:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400da9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400dac:	48 89 ce             	mov    rsi,rcx
  400daf:	89 c7                	mov    edi,eax
  400db1:	e8 7a 02 00 00       	call   401030 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400db6:	48 8d 95 88 fd ff ff 	lea    rdx,[rbp-0x278]
  400dbd:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400dc0:	89 c6                	mov    esi,eax
  400dc2:	48 8d 05 7f 49 00 00 	lea    rax,[rip+0x497f]        # 405748 <b+0x1bc>
  400dc9:	48 89 c7             	mov    rdi,rax
  400dcc:	b8 00 00 00 00       	mov    eax,0x0
  400dd1:	e8 4a 2b 00 00       	call   403920 <printf>
                close(fd);
  400dd6:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400dd9:	89 c7                	mov    edi,eax
  400ddb:	e8 30 02 00 00       	call   401010 <close>
  400de0:	e9 f4 f3 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
  400de5:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400dec:	48 8d 15 78 49 00 00 	lea    rdx,[rip+0x4978]        # 40576b <b+0x1df>
  400df3:	48 89 d6             	mov    rsi,rdx
  400df6:	48 89 c7             	mov    rdi,rax
  400df9:	e8 f2 08 00 00       	call   4016f0 <strcmp>
  400dfe:	85 c0                	test   eax,eax
  400e00:	75 73                	jne    400e75 <main+0xe3a>
  400e02:	48 c7 45 a0 29 00 00 	mov    QWORD PTR [rbp-0x60],0x29
  400e09:	00 
  400e0a:	48 c7 45 98 01 00 00 	mov    QWORD PTR [rbp-0x68],0x1
  400e11:	00 
  400e12:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400e19:	00 
  400e1a:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400e21:	00 
  400e22:	48 c7 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],0x0
  400e29:	00 00 00 00 
  400e2d:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400e34:	00 
  400e35:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400e3c:	00 00 00 00 
typedef int (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
  400e40:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  400e44:	48 8b 4d 98          	mov    rcx,QWORD PTR [rbp-0x68]
  400e48:	48 8b 75 90          	mov    rsi,QWORD PTR [rbp-0x70]
  400e4c:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  400e50:	4c 8b 45 80          	mov    r8,QWORD PTR [rbp-0x80]
  400e54:	4c 8b 8d 78 ff ff ff 	mov    r9,QWORD PTR [rbp-0x88]
  400e5b:	48 89 cf             	mov    rdi,rcx
  400e5e:	4c 8b 95 70 fe ff ff 	mov    r10,QWORD PTR [rbp-0x190]
  400e65:	48 0f 05             	rex.W syscall 
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
  400e68:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  400e6d:	48 89 c3             	mov    rbx,rax
    return ret;
  400e70:	e9 c7 00 00 00       	jmp    400f3c <main+0xf01>
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
  400e75:	48 8d 05 f6 48 00 00 	lea    rax,[rip+0x48f6]        # 405772 <b+0x1e6>
  400e7c:	48 89 c7             	mov    rdi,rax
  400e7f:	b8 00 00 00 00       	mov    eax,0x0
  400e84:	e8 97 2a 00 00       	call   403920 <printf>
            int pid = 0;
  400e89:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
            if ((pid = fork()) == 0) {
  400e90:	e8 6b 02 00 00       	call   401100 <fork>
  400e95:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  400e98:	83 7d d8 00          	cmp    DWORD PTR [rbp-0x28],0x0
  400e9c:	75 5c                	jne    400efa <main+0xebf>
                printf("forked, ready to execve\n");
  400e9e:	48 8d 05 e3 48 00 00 	lea    rax,[rip+0x48e3]        # 405788 <b+0x1fc>
  400ea5:	48 89 c7             	mov    rdi,rax
  400ea8:	b8 00 00 00 00       	mov    eax,0x0
  400ead:	e8 6e 2a 00 00       	call   403920 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400eb2:	48 8b 95 68 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x298]
  400eb9:	48 8b 8d 70 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x290]
  400ec0:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ec7:	48 89 ce             	mov    rsi,rcx
  400eca:	48 89 c7             	mov    rdi,rax
  400ecd:	e8 3e 02 00 00       	call   401110 <execve>
  400ed2:	83 f8 ff             	cmp    eax,0xffffffff
  400ed5:	75 23                	jne    400efa <main+0xebf>
                    printf("cannot find file:%s\n", cmd);
  400ed7:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ede:	48 89 c6             	mov    rsi,rax
  400ee1:	48 8d 05 b9 48 00 00 	lea    rax,[rip+0x48b9]        # 4057a1 <b+0x215>
  400ee8:	48 89 c7             	mov    rdi,rax
  400eeb:	b8 00 00 00 00       	mov    eax,0x0
  400ef0:	e8 2b 2a 00 00       	call   403920 <printf>
  400ef5:	e9 df f2 ff ff       	jmp    4001d9 <main+0x19e>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  400efa:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400efd:	89 c6                	mov    esi,eax
  400eff:	48 8d 05 b0 48 00 00 	lea    rax,[rip+0x48b0]        # 4057b6 <b+0x22a>
  400f06:	48 89 c7             	mov    rdi,rax
  400f09:	b8 00 00 00 00       	mov    eax,0x0
  400f0e:	e8 0d 2a 00 00       	call   403920 <printf>
            int loc = 0;
  400f13:	c7 85 6c fe ff ff 00 	mov    DWORD PTR [rbp-0x194],0x0
  400f1a:	00 00 00 

            waitpid(pid, &loc, 0);
  400f1d:	48 8d 8d 6c fe ff ff 	lea    rcx,[rbp-0x194]
  400f24:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400f27:	ba 00 00 00 00       	mov    edx,0x0
  400f2c:	48 89 ce             	mov    rsi,rcx
  400f2f:	89 c7                	mov    edi,eax
  400f31:	e8 ea 01 00 00       	call   401120 <waitpid>
  400f36:	e9 9e f2 ff ff       	jmp    4001d9 <main+0x19e>
                continue;
  400f3b:	90                   	nop
    while (1) {
  400f3c:	e9 98 f2 ff ff       	jmp    4001d9 <main+0x19e>
            break;
  400f41:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400f42:	b8 00 00 00 00       	mov    eax,0x0
  400f47:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  400f4b:	c9                   	leave  
  400f4c:	c3                   	ret    
  400f4d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000400f50 <reg_dev>:
  400f50:	55                   	push   rbp
  400f51:	48 89 e5             	mov    rbp,rsp
  400f54:	b8 00 00 00 00       	mov    eax,0x0
  400f59:	55                   	push   rbp
  400f5a:	48 0f 05             	rex.W syscall 
  400f5d:	5d                   	pop    rbp
  400f5e:	c9                   	leave  
  400f5f:	c3                   	ret    

0000000000400f60 <dispose_dev>:
  400f60:	55                   	push   rbp
  400f61:	48 89 e5             	mov    rbp,rsp
  400f64:	b8 01 00 00 00       	mov    eax,0x1
  400f69:	55                   	push   rbp
  400f6a:	48 0f 05             	rex.W syscall 
  400f6d:	5d                   	pop    rbp
  400f6e:	c9                   	leave  
  400f6f:	c3                   	ret    

0000000000400f70 <reg_drv>:
  400f70:	55                   	push   rbp
  400f71:	48 89 e5             	mov    rbp,rsp
  400f74:	b8 02 00 00 00       	mov    eax,0x2
  400f79:	55                   	push   rbp
  400f7a:	48 0f 05             	rex.W syscall 
  400f7d:	5d                   	pop    rbp
  400f7e:	c9                   	leave  
  400f7f:	c3                   	ret    

0000000000400f80 <dispose_drv>:
  400f80:	55                   	push   rbp
  400f81:	48 89 e5             	mov    rbp,rsp
  400f84:	b8 03 00 00 00       	mov    eax,0x3
  400f89:	55                   	push   rbp
  400f8a:	48 0f 05             	rex.W syscall 
  400f8d:	5d                   	pop    rbp
  400f8e:	c9                   	leave  
  400f8f:	c3                   	ret    

0000000000400f90 <call_drvfunc>:
  400f90:	55                   	push   rbp
  400f91:	48 89 e5             	mov    rbp,rsp
  400f94:	b8 04 00 00 00       	mov    eax,0x4
  400f99:	55                   	push   rbp
  400f9a:	48 0f 05             	rex.W syscall 
  400f9d:	5d                   	pop    rbp
  400f9e:	c9                   	leave  
  400f9f:	c3                   	ret    

0000000000400fa0 <req_mem>:
  400fa0:	55                   	push   rbp
  400fa1:	48 89 e5             	mov    rbp,rsp
  400fa4:	b8 05 00 00 00       	mov    eax,0x5
  400fa9:	55                   	push   rbp
  400faa:	48 0f 05             	rex.W syscall 
  400fad:	5d                   	pop    rbp
  400fae:	c9                   	leave  
  400faf:	c3                   	ret    

0000000000400fb0 <free_mem>:
  400fb0:	55                   	push   rbp
  400fb1:	48 89 e5             	mov    rbp,rsp
  400fb4:	b8 06 00 00 00       	mov    eax,0x6
  400fb9:	55                   	push   rbp
  400fba:	48 0f 05             	rex.W syscall 
  400fbd:	5d                   	pop    rbp
  400fbe:	c9                   	leave  
  400fbf:	c3                   	ret    

0000000000400fc0 <reg_proc>:
  400fc0:	55                   	push   rbp
  400fc1:	48 89 e5             	mov    rbp,rsp
  400fc4:	b8 07 00 00 00       	mov    eax,0x7
  400fc9:	55                   	push   rbp
  400fca:	48 0f 05             	rex.W syscall 
  400fcd:	5d                   	pop    rbp
  400fce:	c9                   	leave  
  400fcf:	c3                   	ret    

0000000000400fd0 <del_proc>:
  400fd0:	55                   	push   rbp
  400fd1:	48 89 e5             	mov    rbp,rsp
  400fd4:	b8 08 00 00 00       	mov    eax,0x8
  400fd9:	55                   	push   rbp
  400fda:	48 0f 05             	rex.W syscall 
  400fdd:	5d                   	pop    rbp
  400fde:	c9                   	leave  
  400fdf:	c3                   	ret    

0000000000400fe0 <get_proc_addr>:
  400fe0:	55                   	push   rbp
  400fe1:	48 89 e5             	mov    rbp,rsp
  400fe4:	b8 09 00 00 00       	mov    eax,0x9
  400fe9:	55                   	push   rbp
  400fea:	48 0f 05             	rex.W syscall 
  400fed:	5d                   	pop    rbp
  400fee:	c9                   	leave  
  400fef:	c3                   	ret    

0000000000400ff0 <chk_vm>:
  400ff0:	55                   	push   rbp
  400ff1:	48 89 e5             	mov    rbp,rsp
  400ff4:	b8 0a 00 00 00       	mov    eax,0xa
  400ff9:	55                   	push   rbp
  400ffa:	48 0f 05             	rex.W syscall 
  400ffd:	5d                   	pop    rbp
  400ffe:	c9                   	leave  
  400fff:	c3                   	ret    

0000000000401000 <open>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	b8 0b 00 00 00       	mov    eax,0xb
  401009:	55                   	push   rbp
  40100a:	48 0f 05             	rex.W syscall 
  40100d:	5d                   	pop    rbp
  40100e:	c9                   	leave  
  40100f:	c3                   	ret    

0000000000401010 <close>:
  401010:	55                   	push   rbp
  401011:	48 89 e5             	mov    rbp,rsp
  401014:	b8 0c 00 00 00       	mov    eax,0xc
  401019:	55                   	push   rbp
  40101a:	48 0f 05             	rex.W syscall 
  40101d:	5d                   	pop    rbp
  40101e:	c9                   	leave  
  40101f:	c3                   	ret    

0000000000401020 <read>:
  401020:	55                   	push   rbp
  401021:	48 89 e5             	mov    rbp,rsp
  401024:	b8 0d 00 00 00       	mov    eax,0xd
  401029:	55                   	push   rbp
  40102a:	48 0f 05             	rex.W syscall 
  40102d:	5d                   	pop    rbp
  40102e:	c9                   	leave  
  40102f:	c3                   	ret    

0000000000401030 <write>:
  401030:	55                   	push   rbp
  401031:	48 89 e5             	mov    rbp,rsp
  401034:	b8 0e 00 00 00       	mov    eax,0xe
  401039:	55                   	push   rbp
  40103a:	48 0f 05             	rex.W syscall 
  40103d:	5d                   	pop    rbp
  40103e:	c9                   	leave  
  40103f:	c3                   	ret    

0000000000401040 <seek>:
  401040:	55                   	push   rbp
  401041:	48 89 e5             	mov    rbp,rsp
  401044:	b8 0f 00 00 00       	mov    eax,0xf
  401049:	55                   	push   rbp
  40104a:	48 0f 05             	rex.W syscall 
  40104d:	5d                   	pop    rbp
  40104e:	c9                   	leave  
  40104f:	c3                   	ret    

0000000000401050 <tell>:
  401050:	55                   	push   rbp
  401051:	48 89 e5             	mov    rbp,rsp
  401054:	b8 10 00 00 00       	mov    eax,0x10
  401059:	55                   	push   rbp
  40105a:	48 0f 05             	rex.W syscall 
  40105d:	5d                   	pop    rbp
  40105e:	c9                   	leave  
  40105f:	c3                   	ret    

0000000000401060 <reg_vol>:
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	b8 11 00 00 00       	mov    eax,0x11
  401069:	55                   	push   rbp
  40106a:	48 0f 05             	rex.W syscall 
  40106d:	5d                   	pop    rbp
  40106e:	c9                   	leave  
  40106f:	c3                   	ret    

0000000000401070 <free_vol>:
  401070:	55                   	push   rbp
  401071:	48 89 e5             	mov    rbp,rsp
  401074:	b8 12 00 00 00       	mov    eax,0x12
  401079:	55                   	push   rbp
  40107a:	48 0f 05             	rex.W syscall 
  40107d:	5d                   	pop    rbp
  40107e:	c9                   	leave  
  40107f:	c3                   	ret    

0000000000401080 <exec>:
  401080:	55                   	push   rbp
  401081:	48 89 e5             	mov    rbp,rsp
  401084:	b8 13 00 00 00       	mov    eax,0x13
  401089:	55                   	push   rbp
  40108a:	48 0f 05             	rex.W syscall 
  40108d:	5d                   	pop    rbp
  40108e:	c9                   	leave  
  40108f:	c3                   	ret    

0000000000401090 <exit>:
  401090:	55                   	push   rbp
  401091:	48 89 e5             	mov    rbp,rsp
  401094:	b8 14 00 00 00       	mov    eax,0x14
  401099:	55                   	push   rbp
  40109a:	48 0f 05             	rex.W syscall 
  40109d:	5d                   	pop    rbp
  40109e:	c9                   	leave  
  40109f:	c3                   	ret    

00000000004010a0 <abort>:
  4010a0:	55                   	push   rbp
  4010a1:	48 89 e5             	mov    rbp,rsp
  4010a4:	b8 14 00 00 00       	mov    eax,0x14
  4010a9:	55                   	push   rbp
  4010aa:	48 0f 05             	rex.W syscall 
  4010ad:	5d                   	pop    rbp
  4010ae:	c9                   	leave  
  4010af:	c3                   	ret    

00000000004010b0 <call>:
  4010b0:	55                   	push   rbp
  4010b1:	48 89 e5             	mov    rbp,rsp
  4010b4:	b8 15 00 00 00       	mov    eax,0x15
  4010b9:	55                   	push   rbp
  4010ba:	48 0f 05             	rex.W syscall 
  4010bd:	5d                   	pop    rbp
  4010be:	c9                   	leave  
  4010bf:	c3                   	ret    

00000000004010c0 <mkfifo>:
  4010c0:	55                   	push   rbp
  4010c1:	48 89 e5             	mov    rbp,rsp
  4010c4:	b8 16 00 00 00       	mov    eax,0x16
  4010c9:	55                   	push   rbp
  4010ca:	48 0f 05             	rex.W syscall 
  4010cd:	5d                   	pop    rbp
  4010ce:	c9                   	leave  
  4010cf:	c3                   	ret    

00000000004010d0 <brk>:
  4010d0:	55                   	push   rbp
  4010d1:	48 89 e5             	mov    rbp,rsp
  4010d4:	b8 17 00 00 00       	mov    eax,0x17
  4010d9:	55                   	push   rbp
  4010da:	48 0f 05             	rex.W syscall 
  4010dd:	5d                   	pop    rbp
  4010de:	c9                   	leave  
  4010df:	c3                   	ret    

00000000004010e0 <find_dev>:
  4010e0:	55                   	push   rbp
  4010e1:	48 89 e5             	mov    rbp,rsp
  4010e4:	b8 19 00 00 00       	mov    eax,0x19
  4010e9:	55                   	push   rbp
  4010ea:	48 0f 05             	rex.W syscall 
  4010ed:	5d                   	pop    rbp
  4010ee:	c9                   	leave  
  4010ef:	c3                   	ret    

00000000004010f0 <operate_dev>:
  4010f0:	55                   	push   rbp
  4010f1:	48 89 e5             	mov    rbp,rsp
  4010f4:	b8 1a 00 00 00       	mov    eax,0x1a
  4010f9:	55                   	push   rbp
  4010fa:	48 0f 05             	rex.W syscall 
  4010fd:	5d                   	pop    rbp
  4010fe:	c9                   	leave  
  4010ff:	c3                   	ret    

0000000000401100 <fork>:
  401100:	55                   	push   rbp
  401101:	48 89 e5             	mov    rbp,rsp
  401104:	b8 1b 00 00 00       	mov    eax,0x1b
  401109:	55                   	push   rbp
  40110a:	48 0f 05             	rex.W syscall 
  40110d:	5d                   	pop    rbp
  40110e:	c9                   	leave  
  40110f:	c3                   	ret    

0000000000401110 <execve>:
  401110:	55                   	push   rbp
  401111:	48 89 e5             	mov    rbp,rsp
  401114:	b8 1c 00 00 00       	mov    eax,0x1c
  401119:	55                   	push   rbp
  40111a:	48 0f 05             	rex.W syscall 
  40111d:	5d                   	pop    rbp
  40111e:	c9                   	leave  
  40111f:	c3                   	ret    

0000000000401120 <waitpid>:
  401120:	55                   	push   rbp
  401121:	48 89 e5             	mov    rbp,rsp
  401124:	b8 1d 00 00 00       	mov    eax,0x1d
  401129:	55                   	push   rbp
  40112a:	48 0f 05             	rex.W syscall 
  40112d:	5d                   	pop    rbp
  40112e:	c9                   	leave  
  40112f:	c3                   	ret    

0000000000401130 <mmap>:
  401130:	55                   	push   rbp
  401131:	48 89 e5             	mov    rbp,rsp
  401134:	b8 1e 00 00 00       	mov    eax,0x1e
  401139:	55                   	push   rbp
  40113a:	48 0f 05             	rex.W syscall 
  40113d:	5d                   	pop    rbp
  40113e:	c9                   	leave  
  40113f:	c3                   	ret    

0000000000401140 <munmap>:
  401140:	55                   	push   rbp
  401141:	48 89 e5             	mov    rbp,rsp
  401144:	b8 1f 00 00 00       	mov    eax,0x1f
  401149:	55                   	push   rbp
  40114a:	48 0f 05             	rex.W syscall 
  40114d:	5d                   	pop    rbp
  40114e:	c9                   	leave  
  40114f:	c3                   	ret    

0000000000401150 <mknod>:
  401150:	55                   	push   rbp
  401151:	48 89 e5             	mov    rbp,rsp
  401154:	b8 21 00 00 00       	mov    eax,0x21
  401159:	55                   	push   rbp
  40115a:	48 0f 05             	rex.W syscall 
  40115d:	5d                   	pop    rbp
  40115e:	c9                   	leave  
  40115f:	c3                   	ret    

0000000000401160 <kb_readc>:
  401160:	55                   	push   rbp
  401161:	48 89 e5             	mov    rbp,rsp
  401164:	b8 64 00 00 00       	mov    eax,0x64
  401169:	55                   	push   rbp
  40116a:	48 0f 05             	rex.W syscall 
  40116d:	5d                   	pop    rbp
  40116e:	c9                   	leave  
  40116f:	c3                   	ret    

0000000000401170 <remove>:
  401170:	55                   	push   rbp
  401171:	48 89 e5             	mov    rbp,rsp
  401174:	b8 22 00 00 00       	mov    eax,0x22
  401179:	55                   	push   rbp
  40117a:	48 0f 05             	rex.W syscall 
  40117d:	5d                   	pop    rbp
  40117e:	c9                   	leave  
  40117f:	c3                   	ret    

0000000000401180 <sbrk>:
  401180:	55                   	push   rbp
  401181:	48 89 e5             	mov    rbp,rsp
  401184:	b8 23 00 00 00       	mov    eax,0x23
  401189:	55                   	push   rbp
  40118a:	48 0f 05             	rex.W syscall 
  40118d:	5d                   	pop    rbp
  40118e:	c9                   	leave  
  40118f:	c3                   	ret    

0000000000401190 <chkmmap>:
  401190:	55                   	push   rbp
  401191:	48 89 e5             	mov    rbp,rsp
  401194:	b8 24 00 00 00       	mov    eax,0x24
  401199:	55                   	push   rbp
  40119a:	48 0f 05             	rex.W syscall 
  40119d:	5d                   	pop    rbp
  40119e:	c9                   	leave  
  40119f:	c3                   	ret    

00000000004011a0 <_readdir>:
  4011a0:	55                   	push   rbp
  4011a1:	48 89 e5             	mov    rbp,rsp
  4011a4:	b8 25 00 00 00       	mov    eax,0x25
  4011a9:	55                   	push   rbp
  4011aa:	48 0f 05             	rex.W syscall 
  4011ad:	5d                   	pop    rbp
  4011ae:	c9                   	leave  
  4011af:	c3                   	ret    

00000000004011b0 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  4011b0:	f3 0f 1e fa          	endbr64 
  4011b4:	55                   	push   rbp
  4011b5:	48 89 e5             	mov    rbp,rsp
  4011b8:	48 83 ec 20          	sub    rsp,0x20
  4011bc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  4011c0:	bf 20 00 00 00       	mov    edi,0x20
  4011c5:	e8 96 32 00 00       	call   404460 <malloc>
  4011ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  4011ce:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  4011d3:	75 0a                	jne    4011df <opendir+0x2f>
	{
		return NULL;
  4011d5:	b8 00 00 00 00       	mov    eax,0x0
  4011da:	e9 a6 00 00 00       	jmp    401285 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  4011df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4011e3:	be 00 40 00 00       	mov    esi,0x4000
  4011e8:	48 89 c7             	mov    rdi,rax
  4011eb:	e8 10 fe ff ff       	call   401000 <open>
  4011f0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4011f4:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  4011f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011fa:	8b 00                	mov    eax,DWORD PTR [rax]
  4011fc:	85 c0                	test   eax,eax
  4011fe:	79 13                	jns    401213 <opendir+0x63>
	{
		free(dirp);
  401200:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401204:	48 89 c7             	mov    rdi,rax
  401207:	e8 54 2c 00 00       	call   403e60 <free>
		return NULL;
  40120c:	b8 00 00 00 00       	mov    eax,0x0
  401211:	eb 72                	jmp    401285 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  401213:	bf 00 04 00 00       	mov    edi,0x400
  401218:	e8 43 32 00 00       	call   404460 <malloc>
  40121d:	48 89 c2             	mov    rdx,rax
  401220:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401224:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  401228:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40122c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401230:	48 85 c0             	test   rax,rax
  401233:	75 20                	jne    401255 <opendir+0xa5>
	{
		close(dirp->fd);
  401235:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401239:	8b 00                	mov    eax,DWORD PTR [rax]
  40123b:	89 c7                	mov    edi,eax
  40123d:	e8 ce fd ff ff       	call   401010 <close>
		free(dirp);
  401242:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401246:	48 89 c7             	mov    rdi,rax
  401249:	e8 12 2c 00 00       	call   403e60 <free>
		return NULL;
  40124e:	b8 00 00 00 00       	mov    eax,0x0
  401253:	eb 30                	jmp    401285 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  401255:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401259:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  401260:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401264:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  40126b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40126f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  401276:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40127a:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  401281:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  401285:	c9                   	leave  
  401286:	c3                   	ret    

0000000000401287 <closedir>:

int closedir(DIR* dirp)
{
  401287:	f3 0f 1e fa          	endbr64 
  40128b:	55                   	push   rbp
  40128c:	48 89 e5             	mov    rbp,rsp
  40128f:	48 83 ec 50          	sub    rsp,0x50
  401293:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  401297:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40129c:	75 0a                	jne    4012a8 <closedir+0x21>
	{
		return -1;
  40129e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4012a3:	e9 88 00 00 00       	jmp    401330 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  4012a8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4012ac:	8b 00                	mov    eax,DWORD PTR [rax]
  4012ae:	48 98                	cdqe   
  4012b0:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  4012b7:	00 
  4012b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4012bc:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4012c3:	00 
  4012c4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4012cb:	00 
  4012cc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4012d3:	00 
  4012d4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4012db:	00 
  4012dc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4012e3:	00 
#define SYSCALL_READDIR 37
#define SYSCALL_CHDIR 38
#define SYSCALL_RENAME 39
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  4012e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4012e8:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4012ec:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4012f0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4012f4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4012f8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4012fc:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401300:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  401303:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40130a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40130b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  40130f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401313:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401317:	48 89 c7             	mov    rdi,rax
  40131a:	e8 41 2b 00 00       	call   403e60 <free>
	free(dirp);
  40131f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401323:	48 89 c7             	mov    rdi,rax
  401326:	e8 35 2b 00 00       	call   403e60 <free>
	return 0;
  40132b:	b8 00 00 00 00       	mov    eax,0x0
}
  401330:	c9                   	leave  
  401331:	c3                   	ret    

0000000000401332 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  401332:	f3 0f 1e fa          	endbr64 
  401336:	55                   	push   rbp
  401337:	48 89 e5             	mov    rbp,rsp
  40133a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  40133e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401342:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401346:	48 89 c2             	mov    rdx,rax
  401349:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40134d:	8b 00                	mov    eax,DWORD PTR [rax]
  40134f:	48 98                	cdqe   
  401351:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  401358:	00 
  401359:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40135d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401361:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401368:	00 
  401369:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401370:	00 
  401371:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401378:	00 
  401379:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401380:	00 
        __asm__ volatile(".byte 0x48\n"
  401381:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401385:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401389:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40138d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401391:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401395:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401399:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40139d:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4013a0:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4013a7:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4013a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4013ac:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4013b0:	85 c0                	test   eax,eax
  4013b2:	79 12                	jns    4013c6 <readdir+0x94>
	{
		dirp->eof = 1;
  4013b4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013b8:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  4013bf:	b8 00 00 00 00       	mov    eax,0x0
  4013c4:	eb 08                	jmp    4013ce <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  4013c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013ca:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  4013ce:	5d                   	pop    rbp
  4013cf:	c3                   	ret    

00000000004013d0 <chdir>:
int chdir(const char* name)
{
  4013d0:	f3 0f 1e fa          	endbr64 
  4013d4:	55                   	push   rbp
  4013d5:	48 89 e5             	mov    rbp,rsp
  4013d8:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  4013dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013e0:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  4013e7:	00 
  4013e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
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
        __asm__ volatile(".byte 0x48\n"
  401414:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401418:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40141c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401420:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401424:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401428:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40142c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401430:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401433:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40143a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40143b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40143f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401443:	5d                   	pop    rbp
  401444:	c3                   	ret    

0000000000401445 <creat>:
int creat(const char* name, mode_t mode)
{
  401445:	f3 0f 1e fa          	endbr64 
  401449:	55                   	push   rbp
  40144a:	48 89 e5             	mov    rbp,rsp
  40144d:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401451:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
	return do_syscall(SYSCALL_OPEN, (long long)name,
  401454:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  401457:	83 c8 41             	or     eax,0x41
  40145a:	48 98                	cdqe   
  40145c:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401460:	48 c7 45 f8 0b 00 00 	mov    QWORD PTR [rbp-0x8],0xb
  401467:	00 
  401468:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  40146c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401470:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401477:	00 
  401478:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40147f:	00 
  401480:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401487:	00 
  401488:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40148f:	00 
        __asm__ volatile(".byte 0x48\n"
  401490:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401494:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401498:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40149c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4014a0:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4014a4:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4014a8:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4014ac:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4014af:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014b6:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4014b7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4014bb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
					  (long long)O_CREAT | (long long)O_WRONLY | (long long)mode, 0, 0, 0, 0);
}
  4014bf:	5d                   	pop    rbp
  4014c0:	c3                   	ret    

00000000004014c1 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  4014c1:	f3 0f 1e fa          	endbr64 
  4014c5:	55                   	push   rbp
  4014c6:	48 89 e5             	mov    rbp,rsp
  4014c9:	48 83 ec 10          	sub    rsp,0x10
  4014cd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  4014d1:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
	return creat(path, mode | O_DIRECTORY);
  4014d4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4014d7:	80 cc 40             	or     ah,0x40
  4014da:	89 c2                	mov    edx,eax
  4014dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4014e0:	89 d6                	mov    esi,edx
  4014e2:	48 89 c7             	mov    rdi,rax
  4014e5:	e8 5b ff ff ff       	call   401445 <creat>
}
  4014ea:	c9                   	leave  
  4014eb:	c3                   	ret    

00000000004014ec <rename>:
int rename(const char* oldpath, const char* newpath)
{
  4014ec:	f3 0f 1e fa          	endbr64 
  4014f0:	55                   	push   rbp
  4014f1:	48 89 e5             	mov    rbp,rsp
  4014f4:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  4014f8:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  4014fc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401500:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401504:	48 c7 45 f8 27 00 00 	mov    QWORD PTR [rbp-0x8],0x27
  40150b:	00 
  40150c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  401510:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401514:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40151b:	00 
  40151c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401523:	00 
  401524:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40152b:	00 
  40152c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401533:	00 
        __asm__ volatile(".byte 0x48\n"
  401534:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401538:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40153c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401540:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401544:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401548:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40154c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401550:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401553:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40155a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40155b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40155f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401563:	5d                   	pop    rbp
  401564:	c3                   	ret    

Disassembly of section .text.puts:

0000000000401570 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  401570:	f3 0f 1e fa          	endbr64 
  401574:	41 54                	push   r12
  401576:	55                   	push   rbp
  401577:	48 89 fd             	mov    rbp,rdi
  40157a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  40157b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40157e:	40 84 ff             	test   dil,dil
  401581:	74 35                	je     4015b8 <puts+0x48>
  401583:	31 db                	xor    ebx,ebx
  401585:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  401588:	e8 f3 25 00 00       	call   403b80 <putchar>
  40158d:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  401590:	48 83 c3 01          	add    rbx,0x1
  401594:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401599:	40 84 ff             	test   dil,dil
  40159c:	75 ea                	jne    401588 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  40159e:	bf 0a 00 00 00       	mov    edi,0xa
  4015a3:	e8 d8 25 00 00       	call   403b80 <putchar>
		r++;
  4015a8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  4015ad:	5b                   	pop    rbx
  4015ae:	5d                   	pop    rbp
  4015af:	41 5c                	pop    r12
  4015b1:	c3                   	ret    
  4015b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4015b8:	5b                   	pop    rbx
	return r ? r : EOF;
  4015b9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  4015be:	5d                   	pop    rbp
  4015bf:	41 5c                	pop    r12
  4015c1:	c3                   	ret    

Disassembly of section .text.gets:

00000000004015d0 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  4015d0:	f3 0f 1e fa          	endbr64 
  4015d4:	41 54                	push   r12
  4015d6:	49 89 fc             	mov    r12,rdi
  4015d9:	eb 14                	jmp    4015ef <gets+0x1f>
  4015db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  4015e0:	3c 08                	cmp    al,0x8
  4015e2:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  4015e7:	4c 0f 44 e2          	cmove  r12,rdx
		}
		str++;
  4015eb:	49 83 c4 01          	add    r12,0x1
		read(1, str, 1);
  4015ef:	ba 01 00 00 00       	mov    edx,0x1
  4015f4:	4c 89 e6             	mov    rsi,r12
  4015f7:	bf 01 00 00 00       	mov    edi,0x1
  4015fc:	31 c0                	xor    eax,eax
  4015fe:	e8 1d fa ff ff       	call   401020 <read>
		if(*str == '\n')
  401603:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  401608:	3c 0a                	cmp    al,0xa
  40160a:	75 d4                	jne    4015e0 <gets+0x10>
	}
	return str;
  40160c:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  40160f:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401614:	41 5c                	pop    r12
  401616:	c3                   	ret    

Disassembly of section .text.memset:

0000000000401620 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401620:	f3 0f 1e fa          	endbr64 
  401624:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401627:	48 85 d2             	test   rdx,rdx
  40162a:	74 77                	je     4016a3 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40162c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401631:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401634:	48 83 fa 02          	cmp    rdx,0x2
  401638:	76 69                	jbe    4016a3 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40163a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40163f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401643:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401648:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40164c:	48 83 fa 06          	cmp    rdx,0x6
  401650:	76 51                	jbe    4016a3 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401652:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401657:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40165b:	48 83 fa 08          	cmp    rdx,0x8
  40165f:	76 42                	jbe    4016a3 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401661:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401664:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401668:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40166b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40166e:	45 89 c1             	mov    r9d,r8d
	s += k;
  401671:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  401675:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401678:	44 89 c7             	mov    edi,r8d
  40167b:	41 c1 e1 10          	shl    r9d,0x10
  40167f:	c1 e7 08             	shl    edi,0x8
  401682:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401686:	44 09 cf             	or     edi,r9d
  401689:	48 01 ca             	add    rdx,rcx
  40168c:	44 09 c7             	or     edi,r8d
  40168f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  401691:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  401698:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  40169a:	48 83 c1 04          	add    rcx,0x4
  40169e:	48 39 ca             	cmp    rdx,rcx
  4016a1:	75 f5                	jne    401698 <memset+0x78>
	}

	return dest;
}
  4016a3:	c3                   	ret    

Disassembly of section .text.strcat:

00000000004016b0 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  4016b0:	f3 0f 1e fa          	endbr64 
  4016b4:	41 54                	push   r12
  4016b6:	49 89 fc             	mov    r12,rdi
  4016b9:	55                   	push   rbp
  4016ba:	48 89 f5             	mov    rbp,rsi
  4016bd:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  4016be:	e8 7d 00 00 00       	call   401740 <strlen>
	const size_t srclen = strlen(src);
  4016c3:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  4016c6:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  4016c9:	e8 72 00 00 00       	call   401740 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  4016ce:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  4016d2:	48 89 ee             	mov    rsi,rbp
  4016d5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4016d9:	e8 c2 2d 00 00       	call   4044a0 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  4016de:	4c 89 e0             	mov    rax,r12
  4016e1:	5b                   	pop    rbx
  4016e2:	5d                   	pop    rbp
  4016e3:	41 5c                	pop    r12
  4016e5:	c3                   	ret    

Disassembly of section .text.strcmp:

00000000004016f0 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  4016f0:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  4016f4:	48 39 f7             	cmp    rdi,rsi
  4016f7:	74 34                	je     40172d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  4016f9:	48 85 ff             	test   rdi,rdi
  4016fc:	74 38                	je     401736 <strcmp+0x46>
  4016fe:	48 85 f6             	test   rsi,rsi
  401701:	74 33                	je     401736 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  401703:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401706:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401709:	38 ca                	cmp    dl,cl
  40170b:	75 23                	jne    401730 <strcmp+0x40>
  40170d:	b8 01 00 00 00       	mov    eax,0x1
  401712:	eb 15                	jmp    401729 <strcmp+0x39>
  401714:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401718:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40171c:	48 83 c0 01          	add    rax,0x1
  401720:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401725:	38 ca                	cmp    dl,cl
  401727:	75 07                	jne    401730 <strcmp+0x40>
		{
			if(*s1 == 0)
  401729:	84 d2                	test   dl,dl
  40172b:	75 eb                	jne    401718 <strcmp+0x28>
		return 0;
  40172d:	31 c0                	xor    eax,eax
  40172f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  401730:	0f be c2             	movsx  eax,dl
  401733:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  401735:	c3                   	ret    
	int r = -1;
  401736:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40173b:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000401740 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  401740:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  401744:	48 89 fe             	mov    rsi,rdi
  401747:	40 f6 c7 07          	test   dil,0x7
  40174b:	75 0d                	jne    40175a <strlen+0x1a>
  40174d:	eb 21                	jmp    401770 <strlen+0x30>
  40174f:	90                   	nop
  401750:	48 83 c7 01          	add    rdi,0x1
  401754:	40 f6 c7 07          	test   dil,0x7
  401758:	74 16                	je     401770 <strlen+0x30>
	{
		if(*p == '\0')
  40175a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40175d:	75 f1                	jne    401750 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  40175f:	48 89 f8             	mov    rax,rdi
  401762:	48 29 f0             	sub    rax,rsi
  401765:	c3                   	ret    
  401766:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40176d:	00 00 00 
		if((*lp - mask01) & mask80)
  401770:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401777:	fe fe fe 
  40177a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401781:	80 80 80 
  401784:	eb 38                	jmp    4017be <strlen+0x7e>
  401786:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40178d:	00 00 00 
			testbyte(1);
  401790:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  401794:	74 3a                	je     4017d0 <strlen+0x90>
			testbyte(2);
  401796:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  40179a:	74 3c                	je     4017d8 <strlen+0x98>
			testbyte(3);
  40179c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  4017a0:	74 3e                	je     4017e0 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  4017a2:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  4017a6:	74 40                	je     4017e8 <strlen+0xa8>
			testbyte(5);
  4017a8:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  4017ac:	74 42                	je     4017f0 <strlen+0xb0>
			testbyte(6);
  4017ae:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  4017b2:	74 44                	je     4017f8 <strlen+0xb8>
			testbyte(7);
  4017b4:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  4017b8:	74 46                	je     401800 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  4017ba:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  4017be:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4017c1:	48 01 c8             	add    rax,rcx
  4017c4:	48 85 d0             	test   rax,rdx
  4017c7:	74 f1                	je     4017ba <strlen+0x7a>
			testbyte(0);
  4017c9:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4017cc:	75 c2                	jne    401790 <strlen+0x50>
  4017ce:	eb 8f                	jmp    40175f <strlen+0x1f>
			testbyte(1);
  4017d0:	48 29 f7             	sub    rdi,rsi
  4017d3:	48 8d 47 01          	lea    rax,[rdi+0x1]
  4017d7:	c3                   	ret    
			testbyte(2);
  4017d8:	48 29 f7             	sub    rdi,rsi
  4017db:	48 8d 47 02          	lea    rax,[rdi+0x2]
  4017df:	c3                   	ret    
			testbyte(3);
  4017e0:	48 29 f7             	sub    rdi,rsi
  4017e3:	48 8d 47 03          	lea    rax,[rdi+0x3]
  4017e7:	c3                   	ret    
			testbyte(4);
  4017e8:	48 29 f7             	sub    rdi,rsi
  4017eb:	48 8d 47 04          	lea    rax,[rdi+0x4]
  4017ef:	c3                   	ret    
			testbyte(5);
  4017f0:	48 29 f7             	sub    rdi,rsi
  4017f3:	48 8d 47 05          	lea    rax,[rdi+0x5]
  4017f7:	c3                   	ret    
			testbyte(6);
  4017f8:	48 29 f7             	sub    rdi,rsi
  4017fb:	48 8d 47 06          	lea    rax,[rdi+0x6]
  4017ff:	c3                   	ret    
			testbyte(7);
  401800:	48 29 f7             	sub    rdi,rsi
  401803:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  401807:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000401810 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  401810:	f3 0f 1e fa          	endbr64 
  401814:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401816:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  40181d:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  40181e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  401825:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401826:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401829:	48 c1 fd 03          	sar    rbp,0x3
  40182d:	74 16                	je     401845 <__libc_init_array+0x35>
  40182f:	31 db                	xor    ebx,ebx
  401831:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  401838:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  40183c:	48 83 c3 01          	add    rbx,0x1
  401840:	48 39 dd             	cmp    rbp,rbx
  401843:	75 f3                	jne    401838 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  401845:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40184c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401853:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401856:	48 c1 fd 03          	sar    rbp,0x3
  40185a:	74 11                	je     40186d <__libc_init_array+0x5d>
  40185c:	31 db                	xor    ebx,ebx
  40185e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401860:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401864:	48 83 c3 01          	add    rbx,0x1
  401868:	48 39 dd             	cmp    rbp,rbx
  40186b:	75 f3                	jne    401860 <__libc_init_array+0x50>
	}
}
  40186d:	5b                   	pop    rbx
  40186e:	5d                   	pop    rbp
  40186f:	41 5c                	pop    r12
  401871:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401880 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401880:	f3 0f 1e fa          	endbr64 
  401884:	55                   	push   rbp
  401885:	53                   	push   rbx
  401886:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  40188a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401891:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  401898:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  40189b:	48 c1 fb 03          	sar    rbx,0x3
  40189f:	74 14                	je     4018b5 <__libc_fini_array+0x35>
  4018a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  4018a8:	48 83 eb 01          	sub    rbx,0x1
  4018ac:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  4018b0:	48 85 db             	test   rbx,rbx
  4018b3:	75 f3                	jne    4018a8 <__libc_fini_array+0x28>
	}
}
  4018b5:	48 83 c4 08          	add    rsp,0x8
  4018b9:	5b                   	pop    rbx
  4018ba:	5d                   	pop    rbp
  4018bb:	c3                   	ret    

Disassembly of section .text.CRTStartup:

00000000004018c0 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  4018c0:	f3 0f 1e fa          	endbr64 
  4018c4:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  4018c8:	48 c7 c7 c6 57 40 00 	mov    rdi,0x4057c6
  4018cf:	48 c7 c2 cc 57 40 00 	mov    rdx,0x4057cc
  4018d6:	31 f6                	xor    esi,esi
  4018d8:	48 29 fa             	sub    rdx,rdi
  4018db:	e8 40 fd ff ff       	call   401620 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  4018e0:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  4018e4:	e9 27 ff ff ff       	jmp    401810 <__libc_init_array>

Disassembly of section .text.entry:

00000000004018f0 <entry>:
{
  4018f0:	f3 0f 1e fa          	endbr64 
  4018f4:	41 54                	push   r12
  4018f6:	49 89 f4             	mov    r12,rsi
  4018f9:	55                   	push   rbp
  4018fa:	89 fd                	mov    ebp,edi
  4018fc:	53                   	push   rbx
  4018fd:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  401900:	e8 bb ff ff ff       	call   4018c0 <CRTStartup>
	environ = _environ;
  401905:	48 c7 c0 d0 57 40 00 	mov    rax,0x4057d0
	__heap_base = sbrk(0);
  40190c:	31 ff                	xor    edi,edi
	environ = _environ;
  40190e:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  401911:	31 c0                	xor    eax,eax
  401913:	e8 68 f8 ff ff       	call   401180 <sbrk>
  401918:	48 c7 c2 50 58 40 00 	mov    rdx,0x405850
	return main(argc, argv);
  40191f:	4c 89 e6             	mov    rsi,r12
  401922:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401924:	89 02                	mov    DWORD PTR [rdx],eax
}
  401926:	5b                   	pop    rbx
  401927:	5d                   	pop    rbp
  401928:	41 5c                	pop    r12
	return main(argc, argv);
  40192a:	e9 0c e7 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

0000000000401930 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401930:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401935:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401940 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401940:	e8 eb ff ff ff       	call   401930 <get_bit_access>
  401945:	48 c1 e8 3f          	shr    rax,0x3f
}
  401949:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401950 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401950:	48 89 f8             	mov    rax,rdi
  401953:	48 c1 e8 34          	shr    rax,0x34
  401957:	25 ff 07 00 00       	and    eax,0x7ff
  40195c:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401961:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401970 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401970:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401973:	8d 50 01             	lea    edx,[rax+0x1]
  401976:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401979:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  40197c:	73 22                	jae    4019a0 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  40197e:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401981:	48 85 d2             	test   rdx,rdx
  401984:	74 12                	je     401998 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401986:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  40198a:	40 0f be fe          	movsx  edi,sil
  40198e:	4c 89 c6             	mov    rsi,r8
  401991:	ff e2                	jmp    rdx
  401993:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  401998:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  40199c:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  4019a0:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

00000000004019b0 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  4019b0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  4019b4:	74 0a                	je     4019c0 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  4019b6:	c3                   	ret    
  4019b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4019be:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  4019c0:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  4019c3:	85 d2                	test   edx,edx
  4019c5:	74 ef                	je     4019b6 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  4019c7:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  4019cb:	48 85 c9             	test   rcx,rcx
  4019ce:	74 e6                	je     4019b6 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  4019d0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  4019d3:	8d 72 ff             	lea    esi,[rdx-0x1]
  4019d6:	39 c2                	cmp    edx,eax
  4019d8:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  4019dc:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  4019e0:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

00000000004019f0 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  4019f0:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  4019f7:	48 89 f8             	mov    rax,rdi
  return gadget;
  4019fa:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401a01:	00 
  401a02:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401a09:	00 
  401a0a:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401a11:	00 
}
  401a12:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401a20 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401a20:	48 83 ec 28          	sub    rsp,0x28
  401a24:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401a27:	48 89 e7             	mov    rdi,rsp
  401a2a:	e8 c1 ff ff ff       	call   4019f0 <discarding_gadget>
  401a2f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401a34:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401a38:	48 85 f6             	test   rsi,rsi
  401a3b:	74 33                	je     401a70 <buffer_gadget+0x50>
  401a3d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401a42:	48 39 c2             	cmp    rdx,rax
  401a45:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401a49:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401a4d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401a52:	4c 89 c0             	mov    rax,r8
  return result;
  401a55:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401a5a:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401a60:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401a64:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401a69:	48 83 c4 28          	add    rsp,0x28
  401a6d:	c3                   	ret    
  401a6e:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401a70:	48 89 ce             	mov    rsi,rcx
  401a73:	eb d4                	jmp    401a49 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401a80 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401a80:	48 83 ec 28          	sub    rsp,0x28
  401a84:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401a87:	48 89 e7             	mov    rdi,rsp
  401a8a:	e8 61 ff ff ff       	call   4019f0 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401a8f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401a93:	4c 89 c0             	mov    rax,r8
  return result;
  401a96:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401a9b:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401aa0:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401aa7:	7f 
  401aa8:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401aae:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401ab2:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401ab7:	48 83 c4 28          	add    rsp,0x28
  401abb:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401ac0 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401ac0:	48 83 ec 08          	sub    rsp,0x8
  401ac4:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401ac7:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 4022b0 <putchar_wrapper>
  401ace:	31 d2                	xor    edx,edx
  401ad0:	e8 ab ff ff ff       	call   401a80 <function_gadget>
}
  401ad5:	4c 89 c8             	mov    rax,r9
  401ad8:	48 83 c4 08          	add    rsp,0x8
  401adc:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401ae0 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401ae0:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401ae3:	74 33                	je     401b18 <strnlen_s_+0x38>
  401ae5:	85 f6                	test   esi,esi
  401ae7:	74 2f                	je     401b18 <strnlen_s_+0x38>
  401ae9:	89 f6                	mov    esi,esi
  401aeb:	48 89 f8             	mov    rax,rdi
  401aee:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401af2:	eb 09                	jmp    401afd <strnlen_s_+0x1d>
  401af4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401af8:	48 39 c2             	cmp    rdx,rax
  401afb:	74 13                	je     401b10 <strnlen_s_+0x30>
  401afd:	48 83 c0 01          	add    rax,0x1
  401b01:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401b04:	75 f2                	jne    401af8 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401b06:	29 f8                	sub    eax,edi
  401b08:	c3                   	ret    
  401b09:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401b10:	89 d0                	mov    eax,edx
  401b12:	29 f8                	sub    eax,edi
  401b14:	c3                   	ret    
  401b15:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401b18:	31 c0                	xor    eax,eax
}
  401b1a:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401b20 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401b20:	83 ef 30             	sub    edi,0x30
  401b23:	40 80 ff 09          	cmp    dil,0x9
  401b27:	0f 96 c0             	setbe  al
}
  401b2a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401b30 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401b30:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401b33:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401b36:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401b39:	eb 19                	jmp    401b54 <atou_+0x24>
  401b3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401b40:	48 83 c2 01          	add    rdx,0x1
  401b44:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401b48:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401b4b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401b4f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401b54:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401b57:	e8 c4 ff ff ff       	call   401b20 <is_digit_>
  401b5c:	84 c0                	test   al,al
  401b5e:	75 e0                	jne    401b40 <atou_+0x10>
  }
  return i;
}
  401b60:	44 89 c0             	mov    eax,r8d
  401b63:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401b70 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401b70:	41 57                	push   r15
  401b72:	44 89 c0             	mov    eax,r8d
  401b75:	49 89 ff             	mov    r15,rdi
  401b78:	41 56                	push   r14
  401b7a:	41 55                	push   r13
  401b7c:	41 89 d5             	mov    r13d,edx
  401b7f:	41 54                	push   r12
  401b81:	49 89 f4             	mov    r12,rsi
  401b84:	55                   	push   rbp
  401b85:	89 cd                	mov    ebp,ecx
  401b87:	53                   	push   rbx
  401b88:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401b8c:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401b90:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401b95:	a8 03                	test   al,0x3
  401b97:	75 1b                	jne    401bb4 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401b99:	39 ca                	cmp    edx,ecx
  401b9b:	73 17                	jae    401bb4 <out_rev_+0x44>
  401b9d:	89 d3                	mov    ebx,edx
  401b9f:	90                   	nop
      putchar_via_gadget(output, ' ');
  401ba0:	be 20 00 00 00       	mov    esi,0x20
  401ba5:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401ba8:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401bab:	e8 c0 fd ff ff       	call   401970 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401bb0:	39 dd                	cmp    ebp,ebx
  401bb2:	75 ec                	jne    401ba0 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401bb4:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401bb8:	4c 01 e3             	add    rbx,r12
  401bbb:	45 85 ed             	test   r13d,r13d
  401bbe:	74 17                	je     401bd7 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401bc0:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401bc3:	4c 89 ff             	mov    rdi,r15
  401bc6:	e8 a5 fd ff ff       	call   401970 <putchar_via_gadget>
  while (len) {
  401bcb:	48 89 da             	mov    rdx,rbx
  401bce:	48 83 eb 01          	sub    rbx,0x1
  401bd2:	49 39 d4             	cmp    r12,rdx
  401bd5:	75 e9                	jne    401bc0 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401bd7:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401bdc:	74 2a                	je     401c08 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401bde:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401be2:	44 29 f2             	sub    edx,r14d
  401be5:	39 d5                	cmp    ebp,edx
  401be7:	76 1f                	jbe    401c08 <out_rev_+0x98>
  401be9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401bf0:	be 20 00 00 00       	mov    esi,0x20
  401bf5:	4c 89 ff             	mov    rdi,r15
  401bf8:	e8 73 fd ff ff       	call   401970 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401bfd:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401c01:	44 29 f2             	sub    edx,r14d
  401c04:	39 ea                	cmp    edx,ebp
  401c06:	72 e8                	jb     401bf0 <out_rev_+0x80>
    }
  }
}
  401c08:	48 83 c4 18          	add    rsp,0x18
  401c0c:	5b                   	pop    rbx
  401c0d:	5d                   	pop    rbp
  401c0e:	41 5c                	pop    r12
  401c10:	41 5d                	pop    r13
  401c12:	41 5e                	pop    r14
  401c14:	41 5f                	pop    r15
  401c16:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401c20 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401c20:	55                   	push   rbp
  401c21:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c24:	83 fa 1f             	cmp    edx,0x1f
{
  401c27:	49 89 f3             	mov    r11,rsi
  401c2a:	53                   	push   rbx
  401c2b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401c30:	89 d6                	mov    esi,edx
  401c32:	89 cb                	mov    ebx,ecx
  401c34:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c39:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401c3c:	41 f6 c0 02          	test   r8b,0x2
  401c40:	0f 85 fa 00 00 00    	jne    401d40 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401c46:	44 89 c2             	mov    edx,r8d
  401c49:	83 e2 01             	and    edx,0x1
  401c4c:	45 85 d2             	test   r10d,r10d
  401c4f:	0f 84 eb 00 00 00    	je     401d40 <print_integer_finalization+0x120>
  401c55:	85 d2                	test   edx,edx
  401c57:	0f 84 e3 00 00 00    	je     401d40 <print_integer_finalization+0x120>
  401c5d:	84 c9                	test   cl,cl
  401c5f:	0f 85 cb 01 00 00    	jne    401e30 <print_integer_finalization+0x210>
  401c65:	41 f6 c0 0c          	test   r8b,0xc
  401c69:	0f 85 c1 01 00 00    	jne    401e30 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c6f:	44 39 d6             	cmp    esi,r10d
  401c72:	0f 83 c8 00 00 00    	jae    401d40 <print_integer_finalization+0x120>
  401c78:	84 c0                	test   al,al
  401c7a:	0f 84 c0 00 00 00    	je     401d40 <print_integer_finalization+0x120>
  401c80:	89 f0                	mov    eax,esi
  401c82:	89 f2                	mov    edx,esi
  401c84:	4c 01 d8             	add    rax,r11
  401c87:	eb 0b                	jmp    401c94 <print_integer_finalization+0x74>
  401c89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401c90:	84 c9                	test   cl,cl
  401c92:	74 15                	je     401ca9 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401c94:	83 c2 01             	add    edx,0x1
  401c97:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c9a:	83 fa 1f             	cmp    edx,0x1f
  401c9d:	0f 96 c1             	setbe  cl
  401ca0:	48 83 c0 01          	add    rax,0x1
  401ca4:	44 39 d2             	cmp    edx,r10d
  401ca7:	72 e7                	jb     401c90 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ca9:	44 39 ca             	cmp    edx,r9d
  401cac:	73 26                	jae    401cd4 <print_integer_finalization+0xb4>
  401cae:	84 c9                	test   cl,cl
  401cb0:	74 22                	je     401cd4 <print_integer_finalization+0xb4>
  401cb2:	89 d0                	mov    eax,edx
  401cb4:	4c 01 d8             	add    rax,r11
  401cb7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401cbe:	00 00 
      buf[len++] = '0';
  401cc0:	83 c2 01             	add    edx,0x1
  401cc3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cc6:	48 83 c0 01          	add    rax,0x1
  401cca:	41 39 d1             	cmp    r9d,edx
  401ccd:	76 05                	jbe    401cd4 <print_integer_finalization+0xb4>
  401ccf:	83 fa 1f             	cmp    edx,0x1f
  401cd2:	76 ec                	jbe    401cc0 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401cd4:	39 d6                	cmp    esi,edx
  401cd6:	0f 92 c0             	setb   al
  401cd9:	40 80 fd 08          	cmp    bpl,0x8
  401cdd:	0f 94 c1             	sete   cl
  401ce0:	20 c1                	and    cl,al
  401ce2:	74 06                	je     401cea <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401ce4:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401ce8:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401cea:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401cf1:	0f 84 8c 00 00 00    	je     401d83 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401cf7:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401cfe:	74 58                	je     401d58 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d00:	83 fa 1f             	cmp    edx,0x1f
  401d03:	0f 96 c0             	setbe  al
  401d06:	40 80 fd 10          	cmp    bpl,0x10
  401d0a:	0f 84 30 01 00 00    	je     401e40 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d10:	40 80 fd 02          	cmp    bpl,0x2
  401d14:	75 0e                	jne    401d24 <print_integer_finalization+0x104>
  401d16:	84 c0                	test   al,al
  401d18:	74 0a                	je     401d24 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401d1a:	89 d0                	mov    eax,edx
  401d1c:	83 c2 01             	add    edx,0x1
  401d1f:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401d24:	83 fa 20             	cmp    edx,0x20
  401d27:	75 50                	jne    401d79 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401d29:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401d2a:	44 89 d1             	mov    ecx,r10d
  401d2d:	4c 89 de             	mov    rsi,r11
}
  401d30:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401d31:	e9 3a fe ff ff       	jmp    401b70 <out_rev_>
  401d36:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401d3d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d40:	44 39 ce             	cmp    esi,r9d
  401d43:	89 f2                	mov    edx,esi
  401d45:	0f 92 c1             	setb   cl
  401d48:	20 c8                	and    al,cl
  401d4a:	0f 85 62 ff ff ff    	jne    401cb2 <print_integer_finalization+0x92>
  401d50:	eb 98                	jmp    401cea <print_integer_finalization+0xca>
  401d52:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401d58:	85 d2                	test   edx,edx
  401d5a:	75 74                	jne    401dd0 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d5c:	40 80 fd 10          	cmp    bpl,0x10
  401d60:	0f 84 05 01 00 00    	je     401e6b <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d66:	40 80 fd 02          	cmp    bpl,0x2
  401d6a:	0f 85 2e 01 00 00    	jne    401e9e <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401d70:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401d74:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401d79:	89 d0                	mov    eax,edx
  401d7b:	83 c2 01             	add    edx,0x1
  401d7e:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401d83:	83 fa 20             	cmp    edx,0x20
  401d86:	74 a1                	je     401d29 <print_integer_finalization+0x109>
    if (negative) {
  401d88:	84 db                	test   bl,bl
  401d8a:	74 1c                	je     401da8 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401d8c:	89 d0                	mov    eax,edx
}
  401d8e:	5b                   	pop    rbx
      buf[len++] = '-';
  401d8f:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401d92:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401d95:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401d9a:	4c 89 de             	mov    rsi,r11
}
  401d9d:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401d9e:	e9 cd fd ff ff       	jmp    401b70 <out_rev_>
  401da3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401da8:	41 f6 c0 04          	test   r8b,0x4
  401dac:	75 62                	jne    401e10 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401dae:	41 f6 c0 08          	test   r8b,0x8
  401db2:	0f 84 71 ff ff ff    	je     401d29 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401db8:	89 d0                	mov    eax,edx
  401dba:	83 c2 01             	add    edx,0x1
  401dbd:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  401dc2:	e9 62 ff ff ff       	jmp    401d29 <print_integer_finalization+0x109>
  401dc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401dce:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401dd0:	41 39 d1             	cmp    r9d,edx
  401dd3:	74 09                	je     401dde <print_integer_finalization+0x1be>
  401dd5:	44 39 d2             	cmp    edx,r10d
  401dd8:	0f 85 22 ff ff ff    	jne    401d00 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  401dde:	84 c0                	test   al,al
  401de0:	0f 85 99 00 00 00    	jne    401e7f <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401de6:	40 80 fd 10          	cmp    bpl,0x10
  401dea:	0f 94 c0             	sete   al
  401ded:	40 80 fd 02          	cmp    bpl,0x2
  401df1:	0f 94 c1             	sete   cl
  401df4:	08 c8                	or     al,cl
  401df6:	0f 84 04 ff ff ff    	je     401d00 <print_integer_finalization+0xe0>
  401dfc:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  401dfe:	83 da 00             	sbb    edx,0x0
  401e01:	e9 fa fe ff ff       	jmp    401d00 <print_integer_finalization+0xe0>
  401e06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401e0d:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e10:	89 d0                	mov    eax,edx
}
  401e12:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e13:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401e16:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e19:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  401e1e:	4c 89 de             	mov    rsi,r11
}
  401e21:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401e22:	e9 49 fd ff ff       	jmp    401b70 <out_rev_>
  401e27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401e2e:	00 00 
        width--;
  401e30:	41 83 ea 01          	sub    r10d,0x1
  401e34:	e9 36 fe ff ff       	jmp    401c6f <print_integer_finalization+0x4f>
  401e39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e40:	44 89 c1             	mov    ecx,r8d
  401e43:	83 e1 20             	and    ecx,0x20
  401e46:	75 0c                	jne    401e54 <print_integer_finalization+0x234>
  401e48:	84 c0                	test   al,al
  401e4a:	75 60                	jne    401eac <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e4c:	85 c9                	test   ecx,ecx
  401e4e:	0f 84 d0 fe ff ff    	je     401d24 <print_integer_finalization+0x104>
  401e54:	84 c0                	test   al,al
  401e56:	0f 84 c8 fe ff ff    	je     401d24 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401e5c:	89 d0                	mov    eax,edx
  401e5e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  401e61:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  401e66:	e9 b9 fe ff ff       	jmp    401d24 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e6b:	41 f6 c0 20          	test   r8b,0x20
  401e6f:	75 1f                	jne    401e90 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  401e71:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  401e75:	ba 01 00 00 00       	mov    edx,0x1
  401e7a:	e9 fa fe ff ff       	jmp    401d79 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401e7f:	83 ea 01             	sub    edx,0x1
  401e82:	0f 84 d4 fe ff ff    	je     401d5c <print_integer_finalization+0x13c>
  401e88:	e9 59 ff ff ff       	jmp    401de6 <print_integer_finalization+0x1c6>
  401e8d:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  401e90:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  401e94:	ba 01 00 00 00       	mov    edx,0x1
  401e99:	e9 db fe ff ff       	jmp    401d79 <print_integer_finalization+0x159>
      buf[len++] = '0';
  401e9e:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  401ea2:	ba 01 00 00 00       	mov    edx,0x1
  401ea7:	e9 dc fe ff ff       	jmp    401d88 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  401eac:	89 d0                	mov    eax,edx
  401eae:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  401eb1:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  401eb6:	e9 69 fe ff ff       	jmp    401d24 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000401ec0 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401ec0:	41 57                	push   r15
  401ec2:	41 56                	push   r14
  401ec4:	41 55                	push   r13
  401ec6:	41 89 cd             	mov    r13d,ecx
  401ec9:	41 54                	push   r12
  401ecb:	49 89 fc             	mov    r12,rdi
  401ece:	55                   	push   rbp
  401ecf:	53                   	push   rbx
  401ed0:	89 d3                	mov    ebx,edx
  401ed2:	48 83 ec 28          	sub    rsp,0x28
  401ed6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  401edb:	48 85 f6             	test   rsi,rsi
  401ede:	75 48                	jne    401f28 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  401ee0:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  401ee7:	0f 85 a3 00 00 00    	jne    401f90 <print_integer+0xd0>
      buf[len++] = '0';
  401eed:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  401ef1:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  401ef5:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  401efa:	48 89 e6             	mov    rsi,rsp
  401efd:	41 56                	push   r14
  401eff:	0f b6 cb             	movzx  ecx,bl
  401f02:	4c 89 e7             	mov    rdi,r12
  401f05:	41 51                	push   r9
  401f07:	45 89 c1             	mov    r9d,r8d
  401f0a:	45 0f b6 c5          	movzx  r8d,r13b
  401f0e:	e8 0d fd ff ff       	call   401c20 <print_integer_finalization>
}
  401f13:	48 83 c4 38          	add    rsp,0x38
  401f17:	5b                   	pop    rbx
  401f18:	5d                   	pop    rbp
  401f19:	41 5c                	pop    r12
  401f1b:	41 5d                	pop    r13
  401f1d:	41 5e                	pop    r14
  401f1f:	41 5f                	pop    r15
  401f21:	c3                   	ret    
  401f22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f28:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  401f2b:	44 0f b6 d1          	movzx  r10d,cl
  401f2f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  401f34:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f39:	83 e0 20             	and    eax,0x20
  401f3c:	83 f8 01             	cmp    eax,0x1
  401f3f:	45 19 db             	sbb    r11d,r11d
  401f42:	41 83 e3 20          	and    r11d,0x20
  401f46:	41 83 c3 37          	add    r11d,0x37
  401f4a:	eb 07                	jmp    401f53 <print_integer+0x93>
  401f4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  401f50:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  401f53:	31 d2                	xor    edx,edx
  401f55:	48 89 f0             	mov    rax,rsi
  401f58:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f5b:	48 83 fa 09          	cmp    rdx,0x9
  401f5f:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  401f63:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  401f67:	89 ca                	mov    edx,ecx
  401f69:	41 0f 46 ff          	cmovbe edi,r15d
  401f6d:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  401f72:	48 83 c1 01          	add    rcx,0x1
  401f76:	4c 39 d6             	cmp    rsi,r10
  401f79:	0f 82 7b ff ff ff    	jb     401efa <print_integer+0x3a>
  401f7f:	83 fa 1f             	cmp    edx,0x1f
  401f82:	76 cc                	jbe    401f50 <print_integer+0x90>
  401f84:	e9 71 ff ff ff       	jmp    401efa <print_integer+0x3a>
  401f89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  401f90:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  401f93:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  401f95:	41 83 e6 ef          	and    r14d,0xffffffef
  401f99:	80 f9 10             	cmp    cl,0x10
  401f9c:	44 0f 45 f0          	cmovne r14d,eax
  401fa0:	e9 55 ff ff ff       	jmp    401efa <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000401fb0 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  401fb0:	e8 8b f9 ff ff       	call   401940 <get_sign_bit>
{
  401fb5:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  401fb8:	85 c0                	test   eax,eax
  401fba:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  401fbd:	74 08                	je     401fc7 <get_components+0x17>
  401fbf:	66 0f 57 05 e9 34 00 	xorpd  xmm0,XMMWORD PTR [rip+0x34e9]        # 4054b0 <powers_of_10+0x90>
  401fc6:	00 
  number_.integral = (int_fast64_t)abs_number;
  401fc7:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401fcc:	66 0f ef d2          	pxor   xmm2,xmm2
  401fd0:	66 0f 28 c8          	movapd xmm1,xmm0
  401fd4:	89 f0                	mov    eax,esi
  401fd6:	48 8d 3d 43 34 00 00 	lea    rdi,[rip+0x3443]        # 405420 <powers_of_10>
  401fdd:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  401fe2:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  401fe7:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  401feb:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401fef:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  401ff3:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  401ff8:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  401ffd:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  402001:	f2 0f 10 15 b7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34b7]        # 4054c0 <powers_of_10+0xa0>
  402008:	00 
  402009:	66 0f 2f ca          	comisd xmm1,xmm2
  40200d:	76 51                	jbe    402060 <get_components+0xb0>
    ++number_.fractional;
  40200f:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  402013:	66 0f ef c9          	pxor   xmm1,xmm1
  402017:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  40201c:	66 0f 2f cb          	comisd xmm1,xmm3
  402020:	73 56                	jae    402078 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  402022:	85 f6                	test   esi,esi
  402024:	75 27                	jne    40204d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  402026:	66 0f ef c9          	pxor   xmm1,xmm1
  40202a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40202f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  402033:	66 0f 2f d0          	comisd xmm2,xmm0
  402037:	76 06                	jbe    40203f <get_components+0x8f>
  402039:	66 0f 2f c2          	comisd xmm0,xmm2
  40203d:	76 0e                	jbe    40204d <get_components+0x9d>
  40203f:	48 89 d6             	mov    rsi,rdx
  402042:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  402045:	48 83 fe 01          	cmp    rsi,0x1
  402049:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40204d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  402051:	4c 89 c0             	mov    rax,r8
  return number_;
  402054:	49 89 10             	mov    QWORD PTR [r8],rdx
  402057:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  40205b:	c3                   	ret    
  40205c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402060:	66 0f 2e ca          	ucomisd xmm1,xmm2
  402064:	7a bc                	jp     402022 <get_components+0x72>
  402066:	75 ba                	jne    402022 <get_components+0x72>
  402068:	48 85 c0             	test   rax,rax
  40206b:	75 13                	jne    402080 <get_components+0xd0>
    ++number_.fractional;
  40206d:	48 83 c0 01          	add    rax,0x1
  402071:	eb af                	jmp    402022 <get_components+0x72>
  402073:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  402078:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  40207c:	31 c0                	xor    eax,eax
  40207e:	eb a2                	jmp    402022 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402080:	a8 01                	test   al,0x1
  402082:	74 9e                	je     402022 <get_components+0x72>
  402084:	eb e7                	jmp    40206d <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

0000000000402090 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  402090:	66 0f 2f 05 20 34 00 	comisd xmm0,QWORD PTR [rip+0x3420]        # 4054b8 <powers_of_10+0x98>
  402097:	00 
  402098:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  40209c:	73 10                	jae    4020ae <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  40209e:	66 0f ef c9          	pxor   xmm1,xmm1
  4020a2:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4020a6:	66 0f 2e c8          	ucomisd xmm1,xmm0
  4020aa:	7a 04                	jp     4020b0 <bastardized_floor+0x20>
  4020ac:	75 02                	jne    4020b0 <bastardized_floor+0x20>
}
  4020ae:	c3                   	ret    
  4020af:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  4020b0:	83 e8 01             	sub    eax,0x1
}
  4020b3:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

00000000004020c0 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  4020c0:	e8 6b f8 ff ff       	call   401930 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020c5:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  4020cc:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  4020cf:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  4020d2:	48 89 c7             	mov    rdi,rax
  4020d5:	e8 76 f8 ff ff       	call   401950 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020da:	48 21 ca             	and    rdx,rcx
  4020dd:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  4020e4:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4020e7:	f2 0f 10 1d f1 33 00 	movsd  xmm3,QWORD PTR [rip+0x33f1]        # 4054e0 <powers_of_10+0xc0>
  4020ee:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020ef:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4020f2:	f2 0f 10 05 d6 33 00 	movsd  xmm0,QWORD PTR [rip+0x33d6]        # 4054d0 <powers_of_10+0xb0>
  4020f9:	00 
  double z = (dwba.F - 1.5);
  4020fa:	66 48 0f 6e ca       	movq   xmm1,rdx
  4020ff:	f2 0f 5c 0d c1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33c1]        # 4054c8 <powers_of_10+0xa8>
  402106:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402107:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40210b:	66 0f 28 d1          	movapd xmm2,xmm1
  40210f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402113:	f2 0f 58 05 bd 33 00 	addsd  xmm0,QWORD PTR [rip+0x33bd]        # 4054d8 <powers_of_10+0xb8>
  40211a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40211b:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40211f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402123:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  402127:	f2 0f 59 15 b9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33b9]        # 4054e8 <powers_of_10+0xc8>
  40212e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40212f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402133:	f2 0f 59 0d b5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33b5]        # 4054f0 <powers_of_10+0xd0>
  40213a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40213b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40213f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402143:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  402147:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

0000000000402150 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  402150:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  402156:	0f 84 b4 00 00 00    	je     402210 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  40215c:	66 0f ef d2          	pxor   xmm2,xmm2
  402160:	f2 0f 10 05 98 33 00 	movsd  xmm0,QWORD PTR [rip+0x3398]        # 405500 <powers_of_10+0xe0>
  402167:	00 
  402168:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  40216c:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  402170:	f2 0f 58 05 48 33 00 	addsd  xmm0,QWORD PTR [rip+0x3348]        # 4054c0 <powers_of_10+0xa0>
  402177:	00 
  402178:	e8 13 ff ff ff       	call   402090 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40217d:	f2 0f 10 0d 83 33 00 	movsd  xmm1,QWORD PTR [rip+0x3383]        # 405508 <powers_of_10+0xe8>
  402184:	00 
  402185:	66 0f ef c0          	pxor   xmm0,xmm0
  402189:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  40218d:	f2 0f 59 05 7b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x337b]        # 405510 <powers_of_10+0xf0>
  402194:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  402195:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  402197:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  40219b:	48 05 ff 03 00 00    	add    rax,0x3ff
  4021a1:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021a5:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4021aa:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  4021ae:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021b2:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  4021b6:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021ba:	f2 0f 58 c1          	addsd  xmm0,xmm1
  4021be:	66 0f 28 e2          	movapd xmm4,xmm2
  4021c2:	f2 0f 5e 25 4e 33 00 	divsd  xmm4,QWORD PTR [rip+0x334e]        # 405518 <powers_of_10+0xf8>
  4021c9:	00 
  4021ca:	66 0f 28 da          	movapd xmm3,xmm2
  4021ce:	f2 0f 58 25 4a 33 00 	addsd  xmm4,QWORD PTR [rip+0x334a]        # 405520 <powers_of_10+0x100>
  4021d5:	00 
  4021d6:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4021da:	f2 0f 58 1d 46 33 00 	addsd  xmm3,QWORD PTR [rip+0x3346]        # 405528 <powers_of_10+0x108>
  4021e1:	00 
  4021e2:	f2 0f 5e d3          	divsd  xmm2,xmm3
  4021e6:	f2 0f 10 1d 42 33 00 	movsd  xmm3,QWORD PTR [rip+0x3342]        # 405530 <powers_of_10+0x110>
  4021ed:	00 
  4021ee:	f2 0f 5c d9          	subsd  xmm3,xmm1
  4021f2:	f2 0f 58 d3          	addsd  xmm2,xmm3
  4021f6:	f2 0f 5e c2          	divsd  xmm0,xmm2
  4021fa:	f2 0f 58 05 36 33 00 	addsd  xmm0,QWORD PTR [rip+0x3336]        # 405538 <powers_of_10+0x118>
  402201:	00 
  402202:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  402206:	c3                   	ret    
  402207:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40220e:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  402210:	f2 0f 10 05 e0 32 00 	movsd  xmm0,QWORD PTR [rip+0x32e0]        # 4054f8 <powers_of_10+0xd8>
  402217:	00 
}
  402218:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000402220 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  402220:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  402223:	48 8d 0d e6 2f 00 00 	lea    rcx,[rip+0x2fe6]        # 405210 <memcpy+0xd70>
  40222a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402230:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  402233:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  402236:	83 e8 20             	sub    eax,0x20
  402239:	3c 10                	cmp    al,0x10
  40223b:	77 13                	ja     402250 <parse_flags+0x30>
  40223d:	0f b6 c0             	movzx  eax,al
  402240:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402244:	48 01 c8             	add    rax,rcx
  402247:	3e ff e0             	notrack jmp rax
  40224a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  402250:	44 89 c0             	mov    eax,r8d
  402253:	c3                   	ret    
  402254:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  402258:	41 83 c8 01          	or     r8d,0x1
  40225c:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402260:	48 89 17             	mov    QWORD PTR [rdi],rdx
  402263:	eb cb                	jmp    402230 <parse_flags+0x10>
  402265:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  402268:	41 83 c8 02          	or     r8d,0x2
  40226c:	48 83 c2 01          	add    rdx,0x1
  402270:	eb ee                	jmp    402260 <parse_flags+0x40>
  402272:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402278:	41 83 c8 04          	or     r8d,0x4
  40227c:	48 83 c2 01          	add    rdx,0x1
  402280:	eb de                	jmp    402260 <parse_flags+0x40>
  402282:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  402288:	41 83 c8 10          	or     r8d,0x10
  40228c:	48 83 c2 01          	add    rdx,0x1
  402290:	eb ce                	jmp    402260 <parse_flags+0x40>
  402292:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  402298:	41 83 c8 08          	or     r8d,0x8
  40229c:	48 83 c2 01          	add    rdx,0x1
  4022a0:	eb be                	jmp    402260 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

00000000004022b0 <putchar_wrapper>:
{
  4022b0:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  4022b4:	40 0f be ff          	movsx  edi,dil
  4022b8:	e9 e3 18 00 00       	jmp    403ba0 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

00000000004022c0 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  4022c0:	41 56                	push   r14
  4022c2:	49 89 ca             	mov    r10,rcx
  4022c5:	41 89 d3             	mov    r11d,edx
  4022c8:	41 55                	push   r13
  4022ca:	45 89 c5             	mov    r13d,r8d
  4022cd:	41 54                	push   r12
  4022cf:	55                   	push   rbp
  4022d0:	53                   	push   rbx
  4022d1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  4022d6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  4022db:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  4022df:	45 85 ed             	test   r13d,r13d
  4022e2:	0f 84 90 00 00 00    	je     402378 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4022e8:	44 89 c0             	mov    eax,r8d
  4022eb:	25 10 10 00 00       	and    eax,0x1010
  4022f0:	3d 00 10 00 00       	cmp    eax,0x1000
  4022f5:	0f 84 05 02 00 00    	je     402500 <print_broken_up_decimal.isra.0+0x240>
  4022fb:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  4022fe:	89 cb                	mov    ebx,ecx
  402300:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402305:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40230c:	66 66 66 
  40230f:	49 01 ec             	add    r12,rbp
  402312:	eb 43                	jmp    402357 <print_broken_up_decimal.isra.0+0x97>
  402314:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402318:	48 89 f0             	mov    rax,rsi
  40231b:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  40231e:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402322:	49 f7 ed             	imul   r13
  402325:	48 89 f0             	mov    rax,rsi
  402328:	41 29 de             	sub    r14d,ebx
  40232b:	83 c3 01             	add    ebx,0x1
  40232e:	48 c1 f8 3f          	sar    rax,0x3f
  402332:	48 c1 fa 02          	sar    rdx,0x2
  402336:	48 29 c2             	sub    rdx,rax
  402339:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40233d:	48 01 c0             	add    rax,rax
  402340:	48 29 c6             	sub    rsi,rax
  402343:	83 c6 30             	add    esi,0x30
  402346:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40234b:	48 89 d6             	mov    rsi,rdx
  40234e:	48 85 d2             	test   rdx,rdx
  402351:	0f 84 f9 00 00 00    	je     402450 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402357:	83 fb 20             	cmp    ebx,0x20
  40235a:	75 bc                	jne    402318 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  40235c:	44 89 c0             	mov    eax,r8d
  40235f:	83 e0 03             	and    eax,0x3
  402362:	83 f8 01             	cmp    eax,0x1
  402365:	0f 84 35 01 00 00    	je     4024a0 <print_broken_up_decimal.isra.0+0x1e0>
  40236b:	ba 20 00 00 00       	mov    edx,0x20
  402370:	e9 7d 00 00 00       	jmp    4023f2 <print_broken_up_decimal.isra.0+0x132>
  402375:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402378:	41 f6 c0 10          	test   r8b,0x10
  40237c:	0f 85 8e 00 00 00    	jne    402410 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  402382:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  402389:	66 66 66 
  40238c:	89 ce                	mov    esi,ecx
  40238e:	48 01 ee             	add    rsi,rbp
  402391:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402398:	83 f9 20             	cmp    ecx,0x20
  40239b:	74 bf                	je     40235c <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  40239d:	48 89 f8             	mov    rax,rdi
  4023a0:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  4023a3:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  4023a7:	48 f7 eb             	imul   rbx
  4023aa:	48 89 f8             	mov    rax,rdi
  4023ad:	48 c1 f8 3f          	sar    rax,0x3f
  4023b1:	48 c1 fa 02          	sar    rdx,0x2
  4023b5:	48 29 c2             	sub    rdx,rax
  4023b8:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4023bc:	48 01 c0             	add    rax,rax
  4023bf:	48 29 c7             	sub    rdi,rax
  4023c2:	83 c7 30             	add    edi,0x30
  4023c5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  4023c9:	48 89 d7             	mov    rdi,rdx
  4023cc:	48 85 d2             	test   rdx,rdx
  4023cf:	75 c7                	jne    402398 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4023d1:	44 89 c0             	mov    eax,r8d
  4023d4:	83 e0 03             	and    eax,0x3
  4023d7:	83 f8 01             	cmp    eax,0x1
  4023da:	0f 84 b8 01 00 00    	je     402598 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4023e0:	83 f9 20             	cmp    ecx,0x20
  4023e3:	74 86                	je     40236b <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  4023e5:	45 84 db             	test   r11b,r11b
  4023e8:	74 46                	je     402430 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  4023ea:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  4023ef:	8d 51 01             	lea    edx,[rcx+0x1]
}
  4023f2:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  4023f3:	48 89 ee             	mov    rsi,rbp
  4023f6:	44 89 c9             	mov    ecx,r9d
}
  4023f9:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  4023fa:	4c 89 d7             	mov    rdi,r10
}
  4023fd:	41 5c                	pop    r12
  4023ff:	41 5d                	pop    r13
  402401:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  402403:	e9 68 f7 ff ff       	jmp    401b70 <out_rev_>
  402408:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40240f:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402410:	83 f9 20             	cmp    ecx,0x20
  402413:	0f 84 43 ff ff ff    	je     40235c <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  402419:	89 c8                	mov    eax,ecx
  40241b:	83 c1 01             	add    ecx,0x1
  40241e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  402423:	e9 5a ff ff ff       	jmp    402382 <print_broken_up_decimal.isra.0+0xc2>
  402428:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40242f:	00 
    else if (flags & FLAGS_PLUS) {
  402430:	41 f6 c0 04          	test   r8b,0x4
  402434:	0f 85 3e 01 00 00    	jne    402578 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40243a:	89 ca                	mov    edx,ecx
  40243c:	41 f6 c0 08          	test   r8b,0x8
  402440:	74 b0                	je     4023f2 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  402442:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  402447:	83 c2 01             	add    edx,0x1
  40244a:	eb a6                	jmp    4023f2 <print_broken_up_decimal.isra.0+0x132>
  40244c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402450:	83 fb 1f             	cmp    ebx,0x1f
  402453:	77 13                	ja     402468 <print_broken_up_decimal.isra.0+0x1a8>
  402455:	45 85 f6             	test   r14d,r14d
  402458:	89 d8                	mov    eax,ebx
  40245a:	0f 95 c2             	setne  dl
  40245d:	48 01 e8             	add    rax,rbp
  402460:	84 d2                	test   dl,dl
  402462:	75 20                	jne    402484 <print_broken_up_decimal.isra.0+0x1c4>
  402464:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402468:	83 fb 20             	cmp    ebx,0x20
  40246b:	0f 84 eb fe ff ff    	je     40235c <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  402471:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  402476:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402479:	e9 04 ff ff ff       	jmp    402382 <print_broken_up_decimal.isra.0+0xc2>
  40247e:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402480:	39 ca                	cmp    edx,ecx
  402482:	74 e4                	je     402468 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  402484:	89 da                	mov    edx,ebx
  402486:	83 c3 01             	add    ebx,0x1
  402489:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  40248c:	48 83 c0 01          	add    rax,0x1
  402490:	83 fb 1f             	cmp    ebx,0x1f
  402493:	76 eb                	jbe    402480 <print_broken_up_decimal.isra.0+0x1c0>
  402495:	eb d1                	jmp    402468 <print_broken_up_decimal.isra.0+0x1a8>
  402497:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40249e:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4024a0:	45 85 c9             	test   r9d,r9d
  4024a3:	0f 84 c2 fe ff ff    	je     40236b <print_broken_up_decimal.isra.0+0xab>
  4024a9:	31 d2                	xor    edx,edx
  4024ab:	b9 20 00 00 00       	mov    ecx,0x20
  4024b0:	45 84 db             	test   r11b,r11b
  4024b3:	0f 85 cf 00 00 00    	jne    402588 <print_broken_up_decimal.isra.0+0x2c8>
  4024b9:	41 f6 c0 0c          	test   r8b,0xc
  4024bd:	0f 85 c5 00 00 00    	jne    402588 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4024c3:	44 39 c9             	cmp    ecx,r9d
  4024c6:	0f 83 14 ff ff ff    	jae    4023e0 <print_broken_up_decimal.isra.0+0x120>
  4024cc:	89 c8                	mov    eax,ecx
  4024ce:	48 01 e8             	add    rax,rbp
  4024d1:	84 d2                	test   dl,dl
  4024d3:	0f 84 07 ff ff ff    	je     4023e0 <print_broken_up_decimal.isra.0+0x120>
  4024d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  4024e0:	83 c1 01             	add    ecx,0x1
  4024e3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4024e6:	48 83 c0 01          	add    rax,0x1
  4024ea:	44 39 c9             	cmp    ecx,r9d
  4024ed:	0f 83 ed fe ff ff    	jae    4023e0 <print_broken_up_decimal.isra.0+0x120>
  4024f3:	83 f9 1f             	cmp    ecx,0x1f
  4024f6:	76 e8                	jbe    4024e0 <print_broken_up_decimal.isra.0+0x220>
  4024f8:	e9 e3 fe ff ff       	jmp    4023e0 <print_broken_up_decimal.isra.0+0x120>
  4024fd:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402500:	48 85 f6             	test   rsi,rsi
  402503:	0f 8e 79 fe ff ff    	jle    402382 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  402509:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  402510:	cc cc cc 
  402513:	48 89 f0             	mov    rax,rsi
  402516:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  40251d:	99 99 19 
  402520:	48 0f af c3          	imul   rax,rbx
  402524:	48 01 d0             	add    rax,rdx
  402527:	48 d1 c8             	ror    rax,1
  40252a:	48 39 d0             	cmp    rax,rdx
  40252d:	0f 87 c8 fd ff ff    	ja     4022fb <print_broken_up_decimal.isra.0+0x3b>
  402533:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  40253a:	99 99 19 
  40253d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  402540:	48 89 f0             	mov    rax,rsi
  402543:	49 89 f4             	mov    r12,rsi
        --count;
  402546:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  40254a:	48 f7 e3             	mul    rbx
  40254d:	48 89 d6             	mov    rsi,rdx
  402550:	48 c1 ee 03          	shr    rsi,0x3
  402554:	48 89 f0             	mov    rax,rsi
  402557:	48 0f af c3          	imul   rax,rbx
  40255b:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  40255e:	4c 39 f0             	cmp    rax,r14
  402561:	76 dd                	jbe    402540 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  402563:	49 83 fc 09          	cmp    r12,0x9
  402567:	0f 8f 8e fd ff ff    	jg     4022fb <print_broken_up_decimal.isra.0+0x3b>
  40256d:	e9 10 fe ff ff       	jmp    402382 <print_broken_up_decimal.isra.0+0xc2>
  402572:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  402578:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  40257d:	8d 51 01             	lea    edx,[rcx+0x1]
  402580:	e9 6d fe ff ff       	jmp    4023f2 <print_broken_up_decimal.isra.0+0x132>
  402585:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  402588:	41 83 e9 01          	sub    r9d,0x1
  40258c:	e9 32 ff ff ff       	jmp    4024c3 <print_broken_up_decimal.isra.0+0x203>
  402591:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402598:	45 85 c9             	test   r9d,r9d
  40259b:	0f 84 3f fe ff ff    	je     4023e0 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4025a1:	83 f9 1f             	cmp    ecx,0x1f
  4025a4:	0f 96 c2             	setbe  dl
  4025a7:	e9 04 ff ff ff       	jmp    4024b0 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

00000000004025b0 <print_decimal_number>:
{
  4025b0:	41 54                	push   r12
  4025b2:	49 89 fb             	mov    r11,rdi
  4025b5:	41 89 f2             	mov    r10d,esi
  4025b8:	4d 89 c4             	mov    r12,r8
  4025bb:	55                   	push   rbp
  4025bc:	89 cd                	mov    ebp,ecx
  4025be:	53                   	push   rbx
  4025bf:	89 d3                	mov    ebx,edx
  4025c1:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  4025c5:	48 89 e7             	mov    rdi,rsp
  4025c8:	e8 e3 f9 ff ff       	call   401fb0 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  4025cd:	48 83 ec 08          	sub    rsp,0x8
  4025d1:	45 89 d0             	mov    r8d,r10d
  4025d4:	4c 89 d9             	mov    rcx,r11
  4025d7:	41 51                	push   r9
  4025d9:	41 89 d9             	mov    r9d,ebx
  4025dc:	41 54                	push   r12
  4025de:	55                   	push   rbp
  4025df:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  4025e4:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  4025e9:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  4025ee:	e8 cd fc ff ff       	call   4022c0 <print_broken_up_decimal.isra.0>
}
  4025f3:	48 83 c4 40          	add    rsp,0x40
  4025f7:	5b                   	pop    rbx
  4025f8:	5d                   	pop    rbp
  4025f9:	41 5c                	pop    r12
  4025fb:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000402600 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402600:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  402604:	40 84 ff             	test   dil,dil
  402607:	74 17                	je     402620 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402609:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  40260d:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402612:	31 c0                	xor    eax,eax
  402614:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402616:	66 0f 28 c1          	movapd xmm0,xmm1
}
  40261a:	c3                   	ret    
  40261b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402620:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  402624:	e8 07 f3 ff ff       	call   401930 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402629:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  40262d:	48 89 c7             	mov    rdi,rax
  402630:	e8 1b f3 ff ff       	call   401950 <get_exp2>
  402635:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402637:	e8 f4 f2 ff ff       	call   401930 <get_bit_access>
  40263c:	48 89 c7             	mov    rdi,rax
  40263f:	e8 0c f3 ff ff       	call   401950 <get_exp2>
  402644:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  402647:	89 d0                	mov    eax,edx
  402649:	f7 d8                	neg    eax
  40264b:	0f 49 d0             	cmovns edx,eax
  40264e:	44 89 c0             	mov    eax,r8d
  402651:	f7 d8                	neg    eax
  402653:	41 0f 48 c0          	cmovs  eax,r8d
  402657:	39 c2                	cmp    edx,eax
  402659:	7f 1d                	jg     402678 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40265b:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  40265f:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402664:	31 c0                	xor    eax,eax
}
  402666:	48 83 c4 08          	add    rsp,0x8
  return result;
  40266a:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40266c:	66 0f 28 c1          	movapd xmm0,xmm1
}
  402670:	c3                   	ret    
  402671:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402678:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  40267c:	31 d2                	xor    edx,edx
  return result;
  40267e:	31 c0                	xor    eax,eax
}
  402680:	48 83 c4 08          	add    rsp,0x8
  return result;
  402684:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402686:	66 0f 28 c2          	movapd xmm0,xmm2
}
  40268a:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

0000000000402690 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  402690:	40 84 ff             	test   dil,dil
  402693:	74 0b                	je     4026a0 <unapply_scaling.isra.0+0x10>
  402695:	f2 0f 5e c1          	divsd  xmm0,xmm1
  402699:	c3                   	ret    
  40269a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4026a0:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  4026a4:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

00000000004026b0 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  4026b0:	40 84 ff             	test   dil,dil
  4026b3:	74 0b                	je     4026c0 <apply_scaling.isra.0+0x10>
  4026b5:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  4026b9:	c3                   	ret    
  4026ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4026c0:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  4026c4:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

00000000004026d0 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  4026d0:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  4026d2:	48 83 ec 08          	sub    rsp,0x8
  4026d6:	49 89 f9             	mov    r9,rdi
  4026d9:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  4026db:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  4026de:	66 0f 28 d0          	movapd xmm2,xmm0
  4026e2:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  4026e5:	e8 c6 ff ff ff       	call   4026b0 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  4026ea:	3d 32 01 00 00       	cmp    eax,0x132
  4026ef:	0f 8f ab 00 00 00    	jg     4027a0 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  4026f5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4026fa:	66 0f ef c0          	pxor   xmm0,xmm0
  4026fe:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  402702:	89 d6                	mov    esi,edx
  402704:	48 8d 05 15 2d 00 00 	lea    rax,[rip+0x2d15]        # 405420 <powers_of_10>
  40270b:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40270f:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  402714:	e8 77 ff ff ff       	call   402690 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  402719:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40271e:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  402722:	66 0f 28 c3          	movapd xmm0,xmm3
  402726:	66 0f 28 cc          	movapd xmm1,xmm4
  40272a:	e8 d1 fe ff ff       	call   402600 <update_normalization.isra.0>
  40272f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402733:	89 c7                	mov    edi,eax
  402735:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  402739:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  40273b:	e8 70 ff ff ff       	call   4026b0 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402740:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  402744:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402749:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40274e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  402752:	66 0f 2f 05 66 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d66]        # 4054c0 <powers_of_10+0xa0>
  402759:	00 
  40275a:	0f 93 c0             	setae  al
  40275d:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  402760:	66 0f 2e 05 58 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d58]        # 4054c0 <powers_of_10+0xa0>
  402767:	00 
  402768:	7a 06                	jp     402770 <get_normalized_components.isra.0+0xa0>
  40276a:	75 04                	jne    402770 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  40276c:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  402770:	66 0f ef c0          	pxor   xmm0,xmm0
  402774:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  402779:	66 0f 2f c4          	comisd xmm0,xmm4
  40277d:	73 19                	jae    402798 <get_normalized_components.isra.0+0xc8>
  return components;
  40277f:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  402783:	4c 89 c8             	mov    rax,r9
  return components;
  402786:	49 89 09             	mov    QWORD PTR [r9],rcx
  402789:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  40278d:	48 83 c4 08          	add    rsp,0x8
  402791:	c3                   	ret    
  402792:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  402798:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  40279c:	31 c0                	xor    eax,eax
  40279e:	eb df                	jmp    40277f <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  4027a0:	40 84 f6             	test   sil,sil
  4027a3:	74 08                	je     4027ad <get_normalized_components.isra.0+0xdd>
  4027a5:	66 0f 57 05 03 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d03]        # 4054b0 <powers_of_10+0x90>
  4027ac:	00 
  4027ad:	89 d6                	mov    esi,edx
  4027af:	4c 89 cf             	mov    rdi,r9
  4027b2:	e8 f9 f7 ff ff       	call   401fb0 <get_components>
}
  4027b7:	4c 89 c8             	mov    rax,r9
  4027ba:	48 83 c4 08          	add    rsp,0x8
  4027be:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

00000000004027c0 <print_exponential_number>:
{
  4027c0:	41 57                	push   r15
  4027c2:	41 89 f3             	mov    r11d,esi
  4027c5:	66 0f 28 f0          	movapd xmm6,xmm0
  4027c9:	41 56                	push   r14
  4027cb:	41 55                	push   r13
  4027cd:	49 89 fd             	mov    r13,rdi
  4027d0:	41 54                	push   r12
  4027d2:	41 89 d4             	mov    r12d,edx
  4027d5:	55                   	push   rbp
  4027d6:	89 cd                	mov    ebp,ecx
  4027d8:	53                   	push   rbx
  4027d9:	48 83 ec 38          	sub    rsp,0x38
  4027dd:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4027e1:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  4027e6:	e8 55 f1 ff ff       	call   401940 <get_sign_bit>
  4027eb:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  4027ed:	85 c0                	test   eax,eax
  4027ef:	74 08                	je     4027f9 <print_exponential_number+0x39>
  4027f1:	66 0f 57 35 b7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cb7]        # 4054b0 <powers_of_10+0x90>
  4027f8:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  4027f9:	41 89 e8             	mov    r8d,ebp
  4027fc:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  402803:	66 0f 2e 35 ad 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2cad]        # 4054b8 <powers_of_10+0x98>
  40280a:	00 
  40280b:	0f 8a 9f 00 00 00    	jp     4028b0 <print_exponential_number+0xf0>
  402811:	0f 85 99 00 00 00    	jne    4028b0 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  402817:	45 85 c0             	test   r8d,r8d
  40281a:	0f 85 18 01 00 00    	jne    402938 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  402820:	85 f6                	test   esi,esi
  402822:	0f 84 63 03 00 00    	je     402b8b <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402828:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  40282a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  40282d:	66 0f 57 35 7b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c7b]        # 4054b0 <powers_of_10+0x90>
  402834:	00 
  402835:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40283a:	44 89 de             	mov    esi,r11d
  40283d:	66 0f 28 c6          	movapd xmm0,xmm6
  402841:	e8 6a f7 ff ff       	call   401fb0 <get_components>
  402846:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40284b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402850:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402855:	45 84 ff             	test   r15b,r15b
  402858:	0f 84 49 01 00 00    	je     4029a7 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  40285e:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402864:	74 09                	je     40286f <print_exponential_number+0xaf>
  402866:	83 fb ff             	cmp    ebx,0xffffffff
  402869:	0f 8d d1 02 00 00    	jge    402b40 <print_exponential_number+0x380>
        width - exp10_part_width :
  40286f:	45 85 e4             	test   r12d,r12d
  402872:	0f 84 98 02 00 00    	je     402b10 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402878:	48 83 ec 08          	sub    rsp,0x8
  40287c:	45 89 e1             	mov    r9d,r12d
  40287f:	45 89 d8             	mov    r8d,r11d
  402882:	4c 89 e9             	mov    rcx,r13
  402885:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402889:	50                   	push   rax
  40288a:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  40288e:	55                   	push   rbp
  40288f:	e8 2c fa ff ff       	call   4022c0 <print_broken_up_decimal.isra.0>
  402894:	48 83 c4 20          	add    rsp,0x20
}
  402898:	48 83 c4 38          	add    rsp,0x38
  40289c:	5b                   	pop    rbx
  40289d:	5d                   	pop    rbp
  40289e:	41 5c                	pop    r12
  4028a0:	41 5d                	pop    r13
  4028a2:	41 5e                	pop    r14
  4028a4:	41 5f                	pop    r15
  4028a6:	c3                   	ret    
  4028a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4028ae:	00 00 
    double exp10 = log10_of_positive(abs_number);
  4028b0:	66 0f 28 c6          	movapd xmm0,xmm6
  4028b4:	e8 07 f8 ff ff       	call   4020c0 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  4028b9:	e8 d2 f7 ff ff       	call   402090 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  4028be:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  4028c0:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  4028c2:	e8 89 f8 ff ff       	call   402150 <pow10_of_int>
    if (abs_number < p10) {
  4028c7:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  4028cb:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  4028cf:	76 0b                	jbe    4028dc <print_exponential_number+0x11c>
      floored_exp10--;
  4028d1:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  4028d4:	f2 0f 5e 0d 44 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c44]        # 405520 <powers_of_10+0x100>
  4028db:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  4028dc:	8d 43 11             	lea    eax,[rbx+0x11]
  4028df:	83 f8 22             	cmp    eax,0x22
  4028e2:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  4028e5:	77 15                	ja     4028fc <print_exponential_number+0x13c>
  4028e7:	89 d8                	mov    eax,ebx
  4028e9:	48 8d 15 30 2b 00 00 	lea    rdx,[rip+0x2b30]        # 405420 <powers_of_10>
  4028f0:	f7 d8                	neg    eax
  4028f2:	0f 48 c3             	cmovs  eax,ebx
  4028f5:	48 98                	cdqe   
  4028f7:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  4028fc:	89 d8                	mov    eax,ebx
  4028fe:	c1 e8 1f             	shr    eax,0x1f
  402901:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402903:	85 db                	test   ebx,ebx
  402905:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402908:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  40290b:	45 85 c0             	test   r8d,r8d
  40290e:	74 62                	je     402972 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402910:	45 85 db             	test   r11d,r11d
  402913:	b8 01 00 00 00       	mov    eax,0x1
  402918:	41 0f 45 c3          	cmovne eax,r11d
  40291c:	39 c3                	cmp    ebx,eax
  40291e:	0f 9c c0             	setl   al
  402921:	83 fb fc             	cmp    ebx,0xfffffffc
  402924:	40 0f 9d c7          	setge  dil
  402928:	21 f8                	and    eax,edi
  40292a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  40292d:	44 09 fa             	or     edx,r15d
  402930:	eb 21                	jmp    402953 <print_exponential_number+0x193>
  402932:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402938:	45 85 db             	test   r11d,r11d
  40293b:	b8 01 00 00 00       	mov    eax,0x1
  402940:	ba 01 00 00 00       	mov    edx,0x1
  402945:	41 0f 45 c3          	cmovne eax,r11d
  402949:	85 c0                	test   eax,eax
  40294b:	41 0f 9f c7          	setg   r15b
  40294f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402951:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402953:	41 83 eb 01          	sub    r11d,0x1
  402957:	44 89 df             	mov    edi,r11d
  40295a:	29 df                	sub    edi,ebx
  40295c:	45 84 ff             	test   r15b,r15b
  40295f:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402963:	31 ff                	xor    edi,edi
  402965:	45 85 db             	test   r11d,r11d
  402968:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  40296c:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402972:	84 d2                	test   dl,dl
  402974:	0f 85 86 01 00 00    	jne    402b00 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  40297a:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  40297c:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402981:	44 89 da             	mov    edx,r11d
  402984:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402987:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  40298b:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  40298f:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402993:	e8 38 fd ff ff       	call   4026d0 <get_normalized_components.isra.0>
  402998:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40299d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4029a2:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  4029a7:	48 83 ff 09          	cmp    rdi,0x9
  4029ab:	7e 0a                	jle    4029b7 <print_exponential_number+0x1f7>
      floored_exp10++;
  4029ad:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  4029b0:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  4029b2:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  4029b7:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  4029ba:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  4029bd:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  4029c1:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  4029c7:	77 47                	ja     402a10 <print_exponential_number+0x250>
      0U :
  4029c9:	45 85 d2             	test   r10d,r10d
  4029cc:	0f 84 9e 01 00 00    	je     402b70 <print_exponential_number+0x3b0>
  4029d2:	41 bf 03 00 00 00    	mov    r15d,0x3
  4029d8:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  4029dd:	48 83 ec 08          	sub    rsp,0x8
  4029e1:	45 31 c9             	xor    r9d,r9d
  4029e4:	45 89 d8             	mov    r8d,r11d
  4029e7:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  4029eb:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  4029ee:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  4029f2:	50                   	push   rax
  4029f3:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  4029f7:	55                   	push   rbp
  4029f8:	e8 c3 f8 ff ff       	call   4022c0 <print_broken_up_decimal.isra.0>
  4029fd:	48 83 c4 20          	add    rsp,0x20
  402a01:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402a06:	eb 61                	jmp    402a69 <print_exponential_number+0x2a9>
  402a08:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402a0f:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402a10:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402a15:	45 85 d2             	test   r10d,r10d
  402a18:	0f 85 62 01 00 00    	jne    402b80 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402a1e:	45 89 e1             	mov    r9d,r12d
  402a21:	b9 00 00 00 00       	mov    ecx,0x0
  402a26:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a2a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402a2d:	41 29 c1             	sub    r9d,eax
  402a30:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402a33:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402a37:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a3b:	48 83 ec 08          	sub    rsp,0x8
  402a3f:	4c 89 e9             	mov    rcx,r13
  402a42:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a46:	50                   	push   rax
  402a47:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402a4b:	55                   	push   rbp
  402a4c:	e8 6f f8 ff ff       	call   4022c0 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402a51:	48 83 c4 20          	add    rsp,0x20
  402a55:	45 84 ff             	test   r15b,r15b
  402a58:	0f 85 3a fe ff ff    	jne    402898 <print_exponential_number+0xd8>
    print_integer(output,
  402a5e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402a62:	45 31 d2             	xor    r10d,r10d
  402a65:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402a69:	83 e5 20             	and    ebp,0x20
  402a6c:	4c 89 ef             	mov    rdi,r13
  402a6f:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402a73:	83 fd 01             	cmp    ebp,0x1
  402a76:	19 f6                	sbb    esi,esi
  402a78:	83 e6 20             	and    esi,0x20
  402a7b:	83 c6 45             	add    esi,0x45
  402a7e:	e8 ed ee ff ff       	call   401970 <putchar_via_gadget>
    print_integer(output,
  402a83:	48 63 c3             	movsxd rax,ebx
  402a86:	89 da                	mov    edx,ebx
  402a88:	45 89 f9             	mov    r9d,r15d
  402a8b:	48 89 c6             	mov    rsi,rax
  402a8e:	c1 ea 1f             	shr    edx,0x1f
  402a91:	b9 0a 00 00 00       	mov    ecx,0xa
  402a96:	4c 89 ef             	mov    rdi,r13
  402a99:	48 f7 de             	neg    rsi
  402a9c:	85 db                	test   ebx,ebx
  402a9e:	48 0f 4f f0          	cmovg  rsi,rax
  402aa2:	48 83 ec 08          	sub    rsp,0x8
  402aa6:	45 31 c0             	xor    r8d,r8d
  402aa9:	6a 05                	push   0x5
  402aab:	e8 10 f4 ff ff       	call   401ec0 <print_integer>
    if (flags & FLAGS_LEFT) {
  402ab0:	58                   	pop    rax
  402ab1:	5a                   	pop    rdx
  402ab2:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402ab6:	45 85 d2             	test   r10d,r10d
  402ab9:	0f 84 d9 fd ff ff    	je     402898 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402abf:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402ac3:	44 29 f0             	sub    eax,r14d
  402ac6:	44 39 e0             	cmp    eax,r12d
  402ac9:	0f 83 c9 fd ff ff    	jae    402898 <print_exponential_number+0xd8>
  402acf:	90                   	nop
        putchar_via_gadget(output, ' ');
  402ad0:	be 20 00 00 00       	mov    esi,0x20
  402ad5:	4c 89 ef             	mov    rdi,r13
  402ad8:	e8 93 ee ff ff       	call   401970 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402add:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402ae1:	44 29 f0             	sub    eax,r14d
  402ae4:	44 39 e0             	cmp    eax,r12d
  402ae7:	72 e7                	jb     402ad0 <print_exponential_number+0x310>
}
  402ae9:	48 83 c4 38          	add    rsp,0x38
  402aed:	5b                   	pop    rbx
  402aee:	5d                   	pop    rbp
  402aef:	41 5c                	pop    r12
  402af1:	41 5d                	pop    r13
  402af3:	41 5e                	pop    r14
  402af5:	41 5f                	pop    r15
  402af7:	c3                   	ret    
  402af8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402aff:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402b00:	85 f6                	test   esi,esi
  402b02:	0f 84 2d fd ff ff    	je     402835 <print_exponential_number+0x75>
  402b08:	e9 20 fd ff ff       	jmp    40282d <print_exponential_number+0x6d>
  402b0d:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402b10:	48 83 ec 08          	sub    rsp,0x8
  402b14:	4c 89 e9             	mov    rcx,r13
  402b17:	45 31 c9             	xor    r9d,r9d
  402b1a:	45 89 d8             	mov    r8d,r11d
  402b1d:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402b21:	50                   	push   rax
  402b22:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402b26:	55                   	push   rbp
  402b27:	e8 94 f7 ff ff       	call   4022c0 <print_broken_up_decimal.isra.0>
  402b2c:	48 83 c4 20          	add    rsp,0x20
}
  402b30:	48 83 c4 38          	add    rsp,0x38
  402b34:	5b                   	pop    rbx
  402b35:	5d                   	pop    rbp
  402b36:	41 5c                	pop    r12
  402b38:	41 5d                	pop    r13
  402b3a:	41 5e                	pop    r14
  402b3c:	41 5f                	pop    r15
  402b3e:	c3                   	ret    
  402b3f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402b40:	83 c3 01             	add    ebx,0x1
  402b43:	66 0f ef c0          	pxor   xmm0,xmm0
  402b47:	48 8d 05 d2 28 00 00 	lea    rax,[rip+0x28d2]        # 405420 <powers_of_10>
  402b4e:	48 63 db             	movsxd rbx,ebx
  402b51:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402b56:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402b5b:	0f 8a 0e fd ff ff    	jp     40286f <print_exponential_number+0xaf>
  402b61:	0f 85 08 fd ff ff    	jne    40286f <print_exponential_number+0xaf>
      precision--;
  402b67:	41 83 eb 01          	sub    r11d,0x1
  402b6b:	e9 ff fc ff ff       	jmp    40286f <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402b70:	b8 04 00 00 00       	mov    eax,0x4
  402b75:	e9 a4 fe ff ff       	jmp    402a1e <print_exponential_number+0x25e>
  402b7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402b80:	41 bf 04 00 00 00    	mov    r15d,0x4
  402b86:	e9 4d fe ff ff       	jmp    4029d8 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402b8b:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402b90:	44 89 de             	mov    esi,r11d
  402b93:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402b97:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402b99:	e8 12 f4 ff ff       	call   401fb0 <get_components>
  402b9e:	45 31 ff             	xor    r15d,r15d
  402ba1:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402ba6:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402bab:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402bb0:	e9 f2 fd ff ff       	jmp    4029a7 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402bc0 <print_floating_point>:
  if (value != value) {
  402bc0:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402bc4:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402bc7:	0f 8a eb 00 00 00    	jp     402cb8 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402bcd:	f2 0f 10 0d 6b 29 00 	movsd  xmm1,QWORD PTR [rip+0x296b]        # 405540 <powers_of_10+0x120>
  402bd4:	00 
  402bd5:	66 0f 2f c8          	comisd xmm1,xmm0
  402bd9:	0f 87 21 01 00 00    	ja     402d00 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402bdf:	66 0f 2f 05 61 29 00 	comisd xmm0,QWORD PTR [rip+0x2961]        # 405548 <powers_of_10+0x128>
  402be6:	00 
  402be7:	77 57                	ja     402c40 <print_floating_point+0x80>
{
  402be9:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402bed:	45 84 c0             	test   r8b,r8b
  402bf0:	75 7e                	jne    402c70 <print_floating_point+0xb0>
  402bf2:	66 0f 2f 05 56 29 00 	comisd xmm0,QWORD PTR [rip+0x2956]        # 405550 <powers_of_10+0x130>
  402bf9:	00 
  402bfa:	0f 87 e8 00 00 00    	ja     402ce8 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402c00:	f2 0f 10 0d 50 29 00 	movsd  xmm1,QWORD PTR [rip+0x2950]        # 405558 <powers_of_10+0x138>
  402c07:	00 
  402c08:	66 0f 2f c8          	comisd xmm1,xmm0
  402c0c:	0f 87 d6 00 00 00    	ja     402ce8 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402c12:	41 89 c9             	mov    r9d,ecx
  402c15:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402c1c:	0f 85 fe 00 00 00    	jne    402d20 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402c22:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402c27:	49 89 e0             	mov    r8,rsp
  402c2a:	44 89 d2             	mov    edx,r10d
  402c2d:	e8 7e f9 ff ff       	call   4025b0 <print_decimal_number>
}
  402c32:	48 83 c4 28          	add    rsp,0x28
  402c36:	c3                   	ret    
  402c37:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402c3e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402c40:	89 c8                	mov    eax,ecx
  402c42:	48 8d 35 10 26 00 00 	lea    rsi,[rip+0x2610]        # 405259 <memcpy+0xdb9>
  402c49:	41 89 c8             	mov    r8d,ecx
  402c4c:	44 89 d1             	mov    ecx,r10d
  402c4f:	83 e0 04             	and    eax,0x4
  402c52:	83 f8 01             	cmp    eax,0x1
  402c55:	19 d2                	sbb    edx,edx
  402c57:	83 c2 04             	add    edx,0x4
  402c5a:	85 c0                	test   eax,eax
  402c5c:	48 8d 05 f1 25 00 00 	lea    rax,[rip+0x25f1]        # 405254 <memcpy+0xdb4>
  402c63:	48 0f 45 f0          	cmovne rsi,rax
  402c67:	e9 04 ef ff ff       	jmp    401b70 <out_rev_>
  402c6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402c70:	41 89 c9             	mov    r9d,ecx
  402c73:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402c7a:	74 54                	je     402cd0 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402c7c:	b8 01 00 00 00       	mov    eax,0x1
  402c81:	45 31 c9             	xor    r9d,r9d
  402c84:	83 fe 11             	cmp    esi,0x11
  402c87:	76 4c                	jbe    402cd5 <print_floating_point+0x115>
  402c89:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402c8e:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402c90:	41 89 c1             	mov    r9d,eax
  402c93:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402c97:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402c9a:	48 83 c0 01          	add    rax,0x1
  402c9e:	41 83 f9 1f          	cmp    r9d,0x1f
  402ca2:	77 05                	ja     402ca9 <print_floating_point+0xe9>
  402ca4:	83 fe 11             	cmp    esi,0x11
  402ca7:	77 e7                	ja     402c90 <print_floating_point+0xd0>
  if (prefer_exponential)
  402ca9:	45 84 c0             	test   r8b,r8b
  402cac:	0f 84 75 ff ff ff    	je     402c27 <print_floating_point+0x67>
  402cb2:	eb 21                	jmp    402cd5 <print_floating_point+0x115>
  402cb4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402cb8:	41 89 c8             	mov    r8d,ecx
  402cbb:	48 8d 35 9b 25 00 00 	lea    rsi,[rip+0x259b]        # 40525d <memcpy+0xdbd>
  402cc2:	89 d1                	mov    ecx,edx
  402cc4:	ba 03 00 00 00       	mov    edx,0x3
  402cc9:	e9 a2 ee ff ff       	jmp    401b70 <out_rev_>
  402cce:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402cd0:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402cd5:	49 89 e0             	mov    r8,rsp
  402cd8:	44 89 d2             	mov    edx,r10d
  402cdb:	e8 e0 fa ff ff       	call   4027c0 <print_exponential_number>
}
  402ce0:	48 83 c4 28          	add    rsp,0x28
  402ce4:	c3                   	ret    
  402ce5:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402ce8:	45 31 c9             	xor    r9d,r9d
  402ceb:	49 89 e0             	mov    r8,rsp
  402cee:	44 89 d2             	mov    edx,r10d
  402cf1:	e8 ca fa ff ff       	call   4027c0 <print_exponential_number>
    return;
  402cf6:	e9 37 ff ff ff       	jmp    402c32 <print_floating_point+0x72>
  402cfb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402d00:	41 89 c8             	mov    r8d,ecx
  402d03:	48 8d 35 57 25 00 00 	lea    rsi,[rip+0x2557]        # 405261 <memcpy+0xdc1>
  402d0a:	89 d1                	mov    ecx,edx
  402d0c:	ba 04 00 00 00       	mov    edx,0x4
  402d11:	e9 5a ee ff ff       	jmp    401b70 <out_rev_>
  402d16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402d1d:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402d20:	b8 01 00 00 00       	mov    eax,0x1
  402d25:	45 31 c9             	xor    r9d,r9d
  402d28:	83 fe 11             	cmp    esi,0x11
  402d2b:	0f 87 58 ff ff ff    	ja     402c89 <print_floating_point+0xc9>
  402d31:	e9 f1 fe ff ff       	jmp    402c27 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402d40 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402d40:	41 57                	push   r15
  402d42:	41 56                	push   r14
  402d44:	41 55                	push   r13
  402d46:	41 54                	push   r12
  402d48:	55                   	push   rbp
  402d49:	53                   	push   rbx
  402d4a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402d4d:	48 89 f2             	mov    rdx,rsi
{
  402d50:	48 83 ec 28          	sub    rsp,0x28
  402d54:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402d59:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402d5c:	40 84 f6             	test   sil,sil
  402d5f:	0f 84 e5 00 00 00    	je     402e4a <format_string_loop+0x10a>
  402d65:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402d68:	4c 8d 2d 05 25 00 00 	lea    r13,[rip+0x2505]        # 405274 <memcpy+0xdd4>
  402d6f:	90                   	nop
    if (*format != '%') {
  402d70:	40 80 fe 25          	cmp    sil,0x25
  402d74:	0f 85 ae 00 00 00    	jne    402e28 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402d7a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402d7e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402d83:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402d87:	0f 84 bd 00 00 00    	je     402e4a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402d8d:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402d92:	4c 89 cf             	mov    rdi,r9
  402d95:	e8 86 f4 ff ff       	call   402220 <parse_flags>
    if (is_digit_(*format)) {
  402d9a:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402d9f:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402da2:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402da5:	89 fe                	mov    esi,edi
  402da7:	e8 74 ed ff ff       	call   401b20 <is_digit_>
  402dac:	84 c0                	test   al,al
  402dae:	0f 85 ac 04 00 00    	jne    403260 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402db4:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402db7:	40 80 fe 2a          	cmp    sil,0x2a
  402dbb:	0f 84 bf 04 00 00    	je     403280 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  402dc1:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  402dc4:	40 80 fe 2e          	cmp    sil,0x2e
  402dc8:	0f 84 52 04 00 00    	je     403220 <format_string_loop+0x4e0>
    switch (*format) {
  402dce:	8d 46 98             	lea    eax,[rsi-0x68]
  402dd1:	3c 12                	cmp    al,0x12
  402dd3:	77 2f                	ja     402e04 <format_string_loop+0xc4>
  402dd5:	0f b6 c0             	movzx  eax,al
  402dd8:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402ddd:	4c 01 e8             	add    rax,r13
  402de0:	3e ff e0             	notrack jmp rax
  402de3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  402de8:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  402dec:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  402df3:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402df8:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402dfc:	40 84 f6             	test   sil,sil
  402dff:	74 49                	je     402e4a <format_string_loop+0x10a>
  402e01:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  402e04:	8d 46 db             	lea    eax,[rsi-0x25]
  402e07:	3c 53                	cmp    al,0x53
  402e09:	77 1d                	ja     402e28 <format_string_loop+0xe8>
  402e0b:	48 8d 0d ae 24 00 00 	lea    rcx,[rip+0x24ae]        # 4052c0 <memcpy+0xe20>
  402e12:	0f b6 c0             	movzx  eax,al
  402e15:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402e19:	48 01 c8             	add    rax,rcx
  402e1c:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  402e1f:	be 25 00 00 00       	mov    esi,0x25
  402e24:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402e28:	48 89 ef             	mov    rdi,rbp
  402e2b:	e8 40 eb ff ff       	call   401970 <putchar_via_gadget>
        format++;
  402e30:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402e35:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402e39:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  402e3e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402e41:	40 84 f6             	test   sil,sil
  402e44:	0f 85 26 ff ff ff    	jne    402d70 <format_string_loop+0x30>
        break;
    }
  }
}
  402e4a:	48 83 c4 28          	add    rsp,0x28
  402e4e:	5b                   	pop    rbx
  402e4f:	5d                   	pop    rbp
  402e50:	41 5c                	pop    r12
  402e52:	41 5d                	pop    r13
  402e54:	41 5e                	pop    r14
  402e56:	41 5f                	pop    r15
  402e58:	c3                   	ret    
  402e59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  402e60:	40 80 fe 64          	cmp    sil,0x64
  402e64:	0f 84 6e 06 00 00    	je     4034d8 <format_string_loop+0x798>
  402e6a:	40 80 fe 69          	cmp    sil,0x69
  402e6e:	0f 84 64 06 00 00    	je     4034d8 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  402e74:	89 f0                	mov    eax,esi
  402e76:	83 e0 df             	and    eax,0xffffffdf
  402e79:	3c 58                	cmp    al,0x58
  402e7b:	0f 84 37 06 00 00    	je     4034b8 <format_string_loop+0x778>
        else if (*format == 'o') {
  402e81:	b9 08 00 00 00       	mov    ecx,0x8
  402e86:	40 80 fe 6f          	cmp    sil,0x6f
  402e8a:	74 14                	je     402ea0 <format_string_loop+0x160>
        else if (*format == 'b') {
  402e8c:	b9 02 00 00 00       	mov    ecx,0x2
  402e91:	40 80 fe 62          	cmp    sil,0x62
  402e95:	74 09                	je     402ea0 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  402e97:	41 83 e3 ef          	and    r11d,0xffffffef
  402e9b:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  402ea0:	44 89 d8             	mov    eax,r11d
        format++;
  402ea3:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  402ea7:	83 e0 fe             	and    eax,0xfffffffe
  402eaa:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  402eb1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  402eb6:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  402eba:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  402ebc:	44 89 da             	mov    edx,r11d
  402ebf:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  402ec5:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  402ecc:	0f 84 b6 04 00 00    	je     403388 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  402ed2:	85 d2                	test   edx,edx
  402ed4:	0f 85 be 06 00 00    	jne    403598 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  402eda:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  402ee1:	0f 85 b1 06 00 00    	jne    403598 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  402ee7:	41 f6 c3 40          	test   r11b,0x40
  402eeb:	0f 84 51 08 00 00    	je     403742 <format_string_loop+0xa02>
  402ef1:	83 f8 2f             	cmp    eax,0x2f
  402ef4:	0f 87 bc 08 00 00    	ja     4037b6 <format_string_loop+0xa76>
  402efa:	89 c2                	mov    edx,eax
  402efc:	83 c0 08             	add    eax,0x8
  402eff:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402f03:	89 03                	mov    DWORD PTR [rbx],eax
  402f05:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  402f08:	48 63 f8             	movsxd rdi,eax
  402f0b:	89 c2                	mov    edx,eax
  402f0d:	45 89 e1             	mov    r9d,r12d
  402f10:	45 89 f8             	mov    r8d,r15d
  402f13:	48 89 fe             	mov    rsi,rdi
  402f16:	c1 ea 1f             	shr    edx,0x1f
  402f19:	48 f7 de             	neg    rsi
  402f1c:	85 c0                	test   eax,eax
  402f1e:	48 0f 4f f7          	cmovg  rsi,rdi
  402f22:	48 83 ec 08          	sub    rsp,0x8
  402f26:	48 89 ef             	mov    rdi,rbp
  402f29:	41 53                	push   r11
  402f2b:	e8 90 ef ff ff       	call   401ec0 <print_integer>
  while (*format)
  402f30:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402f35:	41 5a                	pop    r10
  402f37:	41 5b                	pop    r11
  402f39:	e9 00 ff ff ff       	jmp    402e3e <format_string_loop+0xfe>
  402f3e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  402f40:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402f44:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f49:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402f4d:	40 84 f6             	test   sil,sil
  402f50:	0f 84 f4 fe ff ff    	je     402e4a <format_string_loop+0x10a>
        if (*format == 'h') {
  402f56:	40 80 fe 68          	cmp    sil,0x68
  402f5a:	0f 84 d8 03 00 00    	je     403338 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  402f60:	41 80 cb 80          	or     r11b,0x80
  402f64:	48 89 c2             	mov    rdx,rax
  402f67:	e9 98 fe ff ff       	jmp    402e04 <format_string_loop+0xc4>
  402f6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  402f70:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402f74:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f79:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402f7d:	40 84 f6             	test   sil,sil
  402f80:	0f 84 c4 fe ff ff    	je     402e4a <format_string_loop+0x10a>
        if (*format == 'l') {
  402f86:	40 80 fe 6c          	cmp    sil,0x6c
  402f8a:	0f 84 d0 03 00 00    	je     403360 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  402f90:	41 81 cb 00 02 00 00 	or     r11d,0x200
  402f97:	48 89 c2             	mov    rdx,rax
  402f9a:	e9 65 fe ff ff       	jmp    402e04 <format_string_loop+0xc4>
  402f9f:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  402fa0:	89 f2                	mov    edx,esi
  402fa2:	44 89 d8             	mov    eax,r11d
  402fa5:	83 e2 df             	and    edx,0xffffffdf
  402fa8:	80 cc 10             	or     ah,0x10
  402fab:	80 fa 47             	cmp    dl,0x47
  402fae:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  402fb2:	83 e6 fd             	and    esi,0xfffffffd
  402fb5:	44 89 d8             	mov    eax,r11d
  402fb8:	83 c8 20             	or     eax,0x20
  402fbb:	40 80 fe 45          	cmp    sil,0x45
  402fbf:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  402fc3:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  402fc6:	3d af 00 00 00       	cmp    eax,0xaf
  402fcb:	0f 87 9f 03 00 00    	ja     403370 <format_string_loop+0x630>
  402fd1:	89 c7                	mov    edi,eax
  402fd3:	83 c0 10             	add    eax,0x10
  402fd6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402fda:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  402fdd:	41 b8 01 00 00 00    	mov    r8d,0x1
  402fe3:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  402fe7:	44 89 e2             	mov    edx,r12d
  402fea:	44 89 d9             	mov    ecx,r11d
  402fed:	44 89 fe             	mov    esi,r15d
  402ff0:	48 89 ef             	mov    rdi,rbp
  402ff3:	e8 c8 fb ff ff       	call   402bc0 <print_floating_point>
        format++;
  402ff8:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402ffd:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403001:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403006:	e9 33 fe ff ff       	jmp    402e3e <format_string_loop+0xfe>
  40300b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  403010:	44 89 d8             	mov    eax,r11d
  403013:	83 c8 20             	or     eax,0x20
  403016:	40 80 fe 46          	cmp    sil,0x46
  40301a:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  40301e:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403021:	3d af 00 00 00       	cmp    eax,0xaf
  403026:	0f 87 74 04 00 00    	ja     4034a0 <format_string_loop+0x760>
  40302c:	89 c7                	mov    edi,eax
  40302e:	83 c0 10             	add    eax,0x10
  403031:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  403035:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  403038:	45 31 c0             	xor    r8d,r8d
  40303b:	eb a6                	jmp    402fe3 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  40303d:	41 83 e3 02          	and    r11d,0x2
  403041:	0f 84 b9 05 00 00    	je     403600 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403047:	8b 03                	mov    eax,DWORD PTR [rbx]
  403049:	83 f8 2f             	cmp    eax,0x2f
  40304c:	0f 86 a9 06 00 00    	jbe    4036fb <format_string_loop+0x9bb>
  403052:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403056:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40305a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40305e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403061:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  403064:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40306a:	e8 01 e9 ff ff       	call   401970 <putchar_via_gadget>
          while (l++ < width) {
  40306f:	41 83 fc 01          	cmp    r12d,0x1
  403073:	0f 86 b7 fd ff ff    	jbe    402e30 <format_string_loop+0xf0>
  403079:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403080:	be 20 00 00 00       	mov    esi,0x20
  403085:	48 89 ef             	mov    rdi,rbp
  403088:	e8 e3 e8 ff ff       	call   401970 <putchar_via_gadget>
          while (l++ < width) {
  40308d:	44 89 f8             	mov    eax,r15d
  403090:	41 83 c7 01          	add    r15d,0x1
  403094:	41 39 c4             	cmp    r12d,eax
  403097:	75 e7                	jne    403080 <format_string_loop+0x340>
  403099:	e9 92 fd ff ff       	jmp    402e30 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  40309e:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  4030a0:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4030a7:	83 f8 2f             	cmp    eax,0x2f
  4030aa:	0f 87 b0 03 00 00    	ja     403460 <format_string_loop+0x720>
  4030b0:	89 c2                	mov    edx,eax
  4030b2:	83 c0 08             	add    eax,0x8
  4030b5:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4030b9:	89 03                	mov    DWORD PTR [rbx],eax
  4030bb:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4030be:	48 85 f6             	test   rsi,rsi
  4030c1:	0f 84 b1 03 00 00    	je     403478 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  4030c7:	48 83 ec 08          	sub    rsp,0x8
  4030cb:	31 d2                	xor    edx,edx
  4030cd:	41 b9 12 00 00 00    	mov    r9d,0x12
  4030d3:	45 89 f8             	mov    r8d,r15d
  4030d6:	41 53                	push   r11
  4030d8:	b9 10 00 00 00       	mov    ecx,0x10
  4030dd:	48 89 ef             	mov    rdi,rbp
  4030e0:	e8 db ed ff ff       	call   401ec0 <print_integer>
  4030e5:	58                   	pop    rax
  4030e6:	5a                   	pop    rdx
        format++;
  4030e7:	e9 44 fd ff ff       	jmp    402e30 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4030ec:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  4030ef:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4030f1:	41 f6 c3 40          	test   r11b,0x40
  4030f5:	0f 84 f5 02 00 00    	je     4033f0 <format_string_loop+0x6b0>
  4030fb:	83 f8 2f             	cmp    eax,0x2f
  4030fe:	0f 87 3c 04 00 00    	ja     403540 <format_string_loop+0x800>
  403104:	89 c2                	mov    edx,eax
  403106:	83 c0 08             	add    eax,0x8
  403109:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40310d:	89 03                	mov    DWORD PTR [rbx],eax
  40310f:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403112:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  403114:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403119:	48 83 c2 01          	add    rdx,0x1
  40311d:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403122:	e9 17 fd ff ff       	jmp    402e3e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  403127:	8b 03                	mov    eax,DWORD PTR [rbx]
  403129:	83 f8 2f             	cmp    eax,0x2f
  40312c:	0f 87 ee 02 00 00    	ja     403420 <format_string_loop+0x6e0>
  403132:	89 c2                	mov    edx,eax
  403134:	83 c0 08             	add    eax,0x8
  403137:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40313b:	89 03                	mov    DWORD PTR [rbx],eax
  40313d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403140:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403144:	48 85 c0             	test   rax,rax
  403147:	0f 84 ef 02 00 00    	je     40343c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40314d:	45 85 ff             	test   r15d,r15d
  403150:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403155:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  403159:	41 0f 45 f7          	cmovne esi,r15d
  40315d:	e8 7e e9 ff ff       	call   401ae0 <strnlen_s_>
            l = (l < precision ? l : precision);
  403162:	44 89 df             	mov    edi,r11d
  403165:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  403168:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  40316a:	41 0f 47 c7          	cmova  eax,r15d
  40316e:	81 e7 00 08 00 00    	and    edi,0x800
  403174:	41 89 fe             	mov    r14d,edi
  403177:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  40317a:	41 83 e3 02          	and    r11d,0x2
  40317e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  403183:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  403187:	0f 84 c3 04 00 00    	je     403650 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40318d:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403191:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403194:	40 84 f6             	test   sil,sil
  403197:	74 52                	je     4031eb <format_string_loop+0x4ab>
  403199:	85 ff                	test   edi,edi
  40319b:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4031a0:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4031a5:	45 85 ff             	test   r15d,r15d
  4031a8:	75 04                	jne    4031ae <format_string_loop+0x46e>
  4031aa:	84 c0                	test   al,al
  4031ac:	74 3d                	je     4031eb <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4031ae:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  4031b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  4031b8:	49 83 c6 01          	add    r14,0x1
  4031bc:	48 89 ef             	mov    rdi,rbp
  4031bf:	e8 ac e7 ff ff       	call   401970 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4031c4:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  4031c8:	40 84 f6             	test   sil,sil
  4031cb:	74 12                	je     4031df <format_string_loop+0x49f>
  4031cd:	44 89 fa             	mov    edx,r15d
  4031d0:	44 29 f2             	sub    edx,r14d
  4031d3:	03 14 24             	add    edx,DWORD PTR [rsp]
  4031d6:	75 e0                	jne    4031b8 <format_string_loop+0x478>
  4031d8:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  4031dd:	75 d9                	jne    4031b8 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  4031df:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  4031e3:	85 c9                	test   ecx,ecx
  4031e5:	0f 84 45 fc ff ff    	je     402e30 <format_string_loop+0xf0>
            while (l++ < width) {
  4031eb:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  4031ef:	44 8d 78 01          	lea    r15d,[rax+0x1]
  4031f3:	41 39 c4             	cmp    r12d,eax
  4031f6:	0f 86 34 fc ff ff    	jbe    402e30 <format_string_loop+0xf0>
  4031fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  403200:	be 20 00 00 00       	mov    esi,0x20
  403205:	48 89 ef             	mov    rdi,rbp
  403208:	e8 63 e7 ff ff       	call   401970 <putchar_via_gadget>
            while (l++ < width) {
  40320d:	44 89 f8             	mov    eax,r15d
  403210:	41 83 c7 01          	add    r15d,0x1
  403214:	41 39 c4             	cmp    r12d,eax
  403217:	75 e7                	jne    403200 <format_string_loop+0x4c0>
  403219:	e9 12 fc ff ff       	jmp    402e30 <format_string_loop+0xf0>
  40321e:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  403220:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  403224:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40322b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  403230:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  403234:	40 84 f6             	test   sil,sil
  403237:	0f 84 0d fc ff ff    	je     402e4a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40323d:	40 0f be fe          	movsx  edi,sil
  403241:	e8 da e8 ff ff       	call   401b20 <is_digit_>
  403246:	84 c0                	test   al,al
  403248:	0f 85 82 00 00 00    	jne    4032d0 <format_string_loop+0x590>
      else if (*format == '*') {
  40324e:	40 80 fe 2a          	cmp    sil,0x2a
  403252:	0f 84 98 00 00 00    	je     4032f0 <format_string_loop+0x5b0>
  403258:	48 89 ca             	mov    rdx,rcx
  40325b:	e9 6e fb ff ff       	jmp    402dce <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  403260:	4c 89 cf             	mov    rdi,r9
  403263:	e8 c8 e8 ff ff       	call   401b30 <atou_>
    if (*format == '.') {
  403268:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  40326d:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  403270:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403273:	e9 49 fb ff ff       	jmp    402dc1 <format_string_loop+0x81>
  403278:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40327f:	00 
      const int w = va_arg(args, int);
  403280:	8b 03                	mov    eax,DWORD PTR [rbx]
  403282:	83 f8 2f             	cmp    eax,0x2f
  403285:	77 39                	ja     4032c0 <format_string_loop+0x580>
  403287:	89 c1                	mov    ecx,eax
  403289:	83 c0 08             	add    eax,0x8
  40328c:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403290:	89 03                	mov    DWORD PTR [rbx],eax
  403292:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  403295:	45 85 e4             	test   r12d,r12d
  403298:	79 07                	jns    4032a1 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  40329a:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  40329e:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  4032a1:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4032a5:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4032aa:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4032ae:	40 84 f6             	test   sil,sil
  4032b1:	0f 84 93 fb ff ff    	je     402e4a <format_string_loop+0x10a>
  4032b7:	48 89 c2             	mov    rdx,rax
  4032ba:	e9 02 fb ff ff       	jmp    402dc1 <format_string_loop+0x81>
  4032bf:	90                   	nop
      const int w = va_arg(args, int);
  4032c0:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4032c4:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4032c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4032cc:	eb c4                	jmp    403292 <format_string_loop+0x552>
  4032ce:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  4032d0:	4c 89 cf             	mov    rdi,r9
  4032d3:	e8 58 e8 ff ff       	call   401b30 <atou_>
    switch (*format) {
  4032d8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  4032dd:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  4032e0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4032e3:	e9 e6 fa ff ff       	jmp    402dce <format_string_loop+0x8e>
  4032e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4032ef:	00 
        const int precision_ = va_arg(args, int);
  4032f0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4032f2:	83 f8 2f             	cmp    eax,0x2f
  4032f5:	0f 87 ed 01 00 00    	ja     4034e8 <format_string_loop+0x7a8>
  4032fb:	89 c1                	mov    ecx,eax
  4032fd:	83 c0 08             	add    eax,0x8
  403300:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403304:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  403306:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  403309:	31 c0                	xor    eax,eax
  40330b:	45 85 d2             	test   r10d,r10d
  40330e:	41 0f 49 c2          	cmovns eax,r10d
  403312:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  403315:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403319:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40331e:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403322:	40 84 f6             	test   sil,sil
  403325:	0f 84 1f fb ff ff    	je     402e4a <format_string_loop+0x10a>
  40332b:	48 89 c2             	mov    rdx,rax
  40332e:	e9 9b fa ff ff       	jmp    402dce <format_string_loop+0x8e>
  403333:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  403338:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40333c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403340:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403345:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403349:	40 84 f6             	test   sil,sil
  40334c:	0f 85 af fa ff ff    	jne    402e01 <format_string_loop+0xc1>
  403352:	e9 f3 fa ff ff       	jmp    402e4a <format_string_loop+0x10a>
  403357:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40335e:	00 00 
          flags |= FLAGS_LONG_LONG;
  403360:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  403367:	eb d3                	jmp    40333c <format_string_loop+0x5fc>
  403369:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403370:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403374:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403378:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40337c:	e9 5c fc ff ff       	jmp    402fdd <format_string_loop+0x29d>
  403381:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  403388:	44 89 de             	mov    esi,r11d
  40338b:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  40338e:	85 d2                	test   edx,edx
  403390:	0f 85 c2 01 00 00    	jne    403558 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  403396:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  40339d:	0f 85 b5 01 00 00    	jne    403558 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4033a3:	41 f6 c3 40          	test   r11b,0x40
  4033a7:	0f 84 6f 03 00 00    	je     40371c <format_string_loop+0x9dc>
  4033ad:	83 f8 2f             	cmp    eax,0x2f
  4033b0:	0f 87 d7 03 00 00    	ja     40378d <format_string_loop+0xa4d>
  4033b6:	89 c2                	mov    edx,eax
  4033b8:	83 c0 08             	add    eax,0x8
  4033bb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4033bf:	89 03                	mov    DWORD PTR [rbx],eax
  4033c1:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  4033c5:	48 83 ec 08          	sub    rsp,0x8
  4033c9:	31 d2                	xor    edx,edx
  4033cb:	48 89 ef             	mov    rdi,rbp
  4033ce:	45 89 e1             	mov    r9d,r12d
  4033d1:	56                   	push   rsi
  4033d2:	45 89 f8             	mov    r8d,r15d
  4033d5:	4c 89 de             	mov    rsi,r11
  4033d8:	e8 e3 ea ff ff       	call   401ec0 <print_integer>
  while (*format)
  4033dd:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4033e2:	5e                   	pop    rsi
  4033e3:	5f                   	pop    rdi
  4033e4:	e9 55 fa ff ff       	jmp    402e3e <format_string_loop+0xfe>
  4033e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  4033f0:	41 f6 c3 80          	test   r11b,0x80
  4033f4:	0f 84 06 01 00 00    	je     403500 <format_string_loop+0x7c0>
  4033fa:	83 f8 2f             	cmp    eax,0x2f
  4033fd:	0f 87 08 03 00 00    	ja     40370b <format_string_loop+0x9cb>
  403403:	89 c6                	mov    esi,eax
  403405:	83 c0 08             	add    eax,0x8
  403408:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40340c:	89 03                	mov    DWORD PTR [rbx],eax
  40340e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403411:	66 89 08             	mov    WORD PTR [rax],cx
  403414:	e9 00 fd ff ff       	jmp    403119 <format_string_loop+0x3d9>
  403419:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  403420:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403424:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403428:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40342c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40342f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403433:	48 85 c0             	test   rax,rax
  403436:	0f 85 11 fd ff ff    	jne    40314d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40343c:	45 89 d8             	mov    r8d,r11d
  40343f:	44 89 e1             	mov    ecx,r12d
  403442:	ba 06 00 00 00       	mov    edx,0x6
  403447:	48 89 ef             	mov    rdi,rbp
  40344a:	48 8d 35 15 1e 00 00 	lea    rsi,[rip+0x1e15]        # 405266 <memcpy+0xdc6>
  403451:	e8 1a e7 ff ff       	call   401b70 <out_rev_>
  403456:	e9 d5 f9 ff ff       	jmp    402e30 <format_string_loop+0xf0>
  40345b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403460:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403464:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403468:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40346c:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40346f:	48 85 f6             	test   rsi,rsi
  403472:	0f 85 4f fc ff ff    	jne    4030c7 <format_string_loop+0x387>
  403478:	45 89 d8             	mov    r8d,r11d
  40347b:	b9 12 00 00 00       	mov    ecx,0x12
  403480:	ba 05 00 00 00       	mov    edx,0x5
  403485:	48 89 ef             	mov    rdi,rbp
  403488:	48 8d 35 de 1d 00 00 	lea    rsi,[rip+0x1dde]        # 40526d <memcpy+0xdcd>
  40348f:	e8 dc e6 ff ff       	call   401b70 <out_rev_>
  403494:	e9 97 f9 ff ff       	jmp    402e30 <format_string_loop+0xf0>
  403499:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4034a0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4034a4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4034a8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4034ac:	e9 87 fb ff ff       	jmp    403038 <format_string_loop+0x2f8>
  4034b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  4034b8:	44 89 d8             	mov    eax,r11d
  4034bb:	41 83 cb 20          	or     r11d,0x20
  4034bf:	40 80 fe 58          	cmp    sil,0x58
  4034c3:	b9 10 00 00 00       	mov    ecx,0x10
  4034c8:	44 0f 45 d8          	cmovne r11d,eax
  4034cc:	e9 cf f9 ff ff       	jmp    402ea0 <format_string_loop+0x160>
  4034d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  4034d8:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  4034df:	e9 90 f9 ff ff       	jmp    402e74 <format_string_loop+0x134>
  4034e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  4034e8:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4034ec:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4034f0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4034f4:	e9 0d fe ff ff       	jmp    403306 <format_string_loop+0x5c6>
  4034f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  403500:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403507:	0f 85 d3 00 00 00    	jne    4035e0 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  40350d:	41 81 e3 00 04 00 00 	and    r11d,0x400
  403514:	0f 85 c6 00 00 00    	jne    4035e0 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  40351a:	83 f8 2f             	cmp    eax,0x2f
  40351d:	0f 87 a4 02 00 00    	ja     4037c7 <format_string_loop+0xa87>
  403523:	89 c6                	mov    esi,eax
  403525:	83 c0 08             	add    eax,0x8
  403528:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40352c:	89 03                	mov    DWORD PTR [rbx],eax
  40352e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403531:	89 08                	mov    DWORD PTR [rax],ecx
  403533:	e9 e1 fb ff ff       	jmp    403119 <format_string_loop+0x3d9>
  403538:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40353f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403540:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403544:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403548:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40354c:	e9 be fb ff ff       	jmp    40310f <format_string_loop+0x3cf>
  403551:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403558:	83 f8 2f             	cmp    eax,0x2f
  40355b:	0f 87 78 01 00 00    	ja     4036d9 <format_string_loop+0x999>
  403561:	89 c7                	mov    edi,eax
  403563:	83 c0 08             	add    eax,0x8
  403566:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40356a:	89 03                	mov    DWORD PTR [rbx],eax
  40356c:	48 83 ec 08          	sub    rsp,0x8
  403570:	45 89 e1             	mov    r9d,r12d
  403573:	45 89 f8             	mov    r8d,r15d
  403576:	31 d2                	xor    edx,edx
  403578:	56                   	push   rsi
  403579:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  40357c:	48 89 ef             	mov    rdi,rbp
  40357f:	e8 3c e9 ff ff       	call   401ec0 <print_integer>
  while (*format)
  403584:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403589:	41 58                	pop    r8
  40358b:	41 59                	pop    r9
  40358d:	e9 ac f8 ff ff       	jmp    402e3e <format_string_loop+0xfe>
  403592:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403598:	83 f8 2f             	cmp    eax,0x2f
  40359b:	0f 87 27 01 00 00    	ja     4036c8 <format_string_loop+0x988>
  4035a1:	89 c2                	mov    edx,eax
  4035a3:	83 c0 08             	add    eax,0x8
  4035a6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4035aa:	89 03                	mov    DWORD PTR [rbx],eax
  4035ac:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4035af:	45 89 e1             	mov    r9d,r12d
  4035b2:	45 89 f8             	mov    r8d,r15d
  4035b5:	48 89 ef             	mov    rdi,rbp
  4035b8:	48 89 d6             	mov    rsi,rdx
  4035bb:	48 f7 de             	neg    rsi
  4035be:	48 0f 48 f2          	cmovs  rsi,rdx
  4035c2:	48 83 ec 08          	sub    rsp,0x8
  4035c6:	48 c1 ea 3f          	shr    rdx,0x3f
  4035ca:	41 53                	push   r11
  4035cc:	e8 ef e8 ff ff       	call   401ec0 <print_integer>
  while (*format)
  4035d1:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4035d6:	41 5c                	pop    r12
  4035d8:	41 5e                	pop    r14
  4035da:	e9 5f f8 ff ff       	jmp    402e3e <format_string_loop+0xfe>
  4035df:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4035e0:	83 f8 2f             	cmp    eax,0x2f
  4035e3:	0f 87 7b 01 00 00    	ja     403764 <format_string_loop+0xa24>
  4035e9:	89 c6                	mov    esi,eax
  4035eb:	83 c0 08             	add    eax,0x8
  4035ee:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4035f2:	89 03                	mov    DWORD PTR [rbx],eax
  4035f4:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4035f7:	48 89 08             	mov    QWORD PTR [rax],rcx
  4035fa:	e9 1a fb ff ff       	jmp    403119 <format_string_loop+0x3d9>
  4035ff:	90                   	nop
          while (l++ < width) {
  403600:	41 83 fc 01          	cmp    r12d,0x1
  403604:	76 23                	jbe    403629 <format_string_loop+0x8e9>
  403606:	41 bf 02 00 00 00    	mov    r15d,0x2
  40360c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403610:	be 20 00 00 00       	mov    esi,0x20
  403615:	48 89 ef             	mov    rdi,rbp
  403618:	e8 53 e3 ff ff       	call   401970 <putchar_via_gadget>
          while (l++ < width) {
  40361d:	44 89 f8             	mov    eax,r15d
  403620:	41 83 c7 01          	add    r15d,0x1
  403624:	41 39 c4             	cmp    r12d,eax
  403627:	75 e7                	jne    403610 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403629:	8b 03                	mov    eax,DWORD PTR [rbx]
  40362b:	83 f8 2f             	cmp    eax,0x2f
  40362e:	0f 87 b6 00 00 00    	ja     4036ea <format_string_loop+0x9aa>
  403634:	89 c2                	mov    edx,eax
  403636:	83 c0 08             	add    eax,0x8
  403639:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40363d:	89 03                	mov    DWORD PTR [rbx],eax
  40363f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403642:	48 89 ef             	mov    rdi,rbp
  403645:	e8 26 e3 ff ff       	call   401970 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  40364a:	e9 e1 f7 ff ff       	jmp    402e30 <format_string_loop+0xf0>
  40364f:	90                   	nop
            while (l++ < width) {
  403650:	89 c1                	mov    ecx,eax
  403652:	8d 40 01             	lea    eax,[rax+0x1]
  403655:	41 39 cc             	cmp    r12d,ecx
  403658:	0f 86 bc 01 00 00    	jbe    40381a <format_string_loop+0xada>
  40365e:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  403663:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  403667:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40366e:	00 00 
              putchar_via_gadget(output, ' ');
  403670:	be 20 00 00 00       	mov    esi,0x20
  403675:	48 89 ef             	mov    rdi,rbp
  403678:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40367c:	e8 ef e2 ff ff       	call   401970 <putchar_via_gadget>
            while (l++ < width) {
  403681:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  403685:	89 c2                	mov    edx,eax
  403687:	83 c0 01             	add    eax,0x1
  40368a:	41 39 d4             	cmp    r12d,edx
  40368d:	75 e1                	jne    403670 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40368f:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403693:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403696:	40 84 f6             	test   sil,sil
  403699:	0f 84 91 f7 ff ff    	je     402e30 <format_string_loop+0xf0>
  40369f:	45 85 f6             	test   r14d,r14d
  4036a2:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4036a7:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4036ac:	45 85 ff             	test   r15d,r15d
  4036af:	0f 85 f9 fa ff ff    	jne    4031ae <format_string_loop+0x46e>
  4036b5:	84 c0                	test   al,al
  4036b7:	0f 85 f1 fa ff ff    	jne    4031ae <format_string_loop+0x46e>
  4036bd:	e9 6e f7 ff ff       	jmp    402e30 <format_string_loop+0xf0>
  4036c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4036c8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036cc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036d0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036d4:	e9 d3 fe ff ff       	jmp    4035ac <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  4036d9:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4036dd:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4036e1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036e5:	e9 82 fe ff ff       	jmp    40356c <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4036ea:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036ee:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036f2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036f6:	e9 44 ff ff ff       	jmp    40363f <format_string_loop+0x8ff>
  4036fb:	89 c2                	mov    edx,eax
  4036fd:	83 c0 08             	add    eax,0x8
  403700:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403704:	89 03                	mov    DWORD PTR [rbx],eax
  403706:	e9 53 f9 ff ff       	jmp    40305e <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  40370b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40370f:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403713:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403717:	e9 f2 fc ff ff       	jmp    40340e <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40371c:	41 81 e3 80 00 00 00 	and    r11d,0x80
  403723:	74 79                	je     40379e <format_string_loop+0xa5e>
  403725:	83 f8 2f             	cmp    eax,0x2f
  403728:	0f 87 db 00 00 00    	ja     403809 <format_string_loop+0xac9>
  40372e:	89 c2                	mov    edx,eax
  403730:	83 c0 08             	add    eax,0x8
  403733:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403737:	89 03                	mov    DWORD PTR [rbx],eax
  403739:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  40373d:	e9 83 fc ff ff       	jmp    4033c5 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403742:	41 f6 c3 80          	test   r11b,0x80
  403746:	74 2d                	je     403775 <format_string_loop+0xa35>
  403748:	83 f8 2f             	cmp    eax,0x2f
  40374b:	0f 87 a7 00 00 00    	ja     4037f8 <format_string_loop+0xab8>
  403751:	89 c2                	mov    edx,eax
  403753:	83 c0 08             	add    eax,0x8
  403756:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40375a:	89 03                	mov    DWORD PTR [rbx],eax
  40375c:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  40375f:	e9 a4 f7 ff ff       	jmp    402f08 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403764:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403768:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40376c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403770:	e9 7f fe ff ff       	jmp    4035f4 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403775:	83 f8 2f             	cmp    eax,0x2f
  403778:	76 6c                	jbe    4037e6 <format_string_loop+0xaa6>
  40377a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40377e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403782:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403786:	8b 02                	mov    eax,DWORD PTR [rdx]
  403788:	e9 7b f7 ff ff       	jmp    402f08 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  40378d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403791:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403795:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403799:	e9 23 fc ff ff       	jmp    4033c1 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40379e:	83 f8 2f             	cmp    eax,0x2f
  4037a1:	77 35                	ja     4037d8 <format_string_loop+0xa98>
  4037a3:	89 c2                	mov    edx,eax
  4037a5:	83 c0 08             	add    eax,0x8
  4037a8:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037ac:	89 03                	mov    DWORD PTR [rbx],eax
  4037ae:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  4037b1:	e9 0f fc ff ff       	jmp    4033c5 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  4037b6:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037ba:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037be:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037c2:	e9 3e f7 ff ff       	jmp    402f05 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  4037c7:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4037cb:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4037cf:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037d3:	e9 56 fd ff ff       	jmp    40352e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4037d8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037dc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037e0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037e4:	eb c8                	jmp    4037ae <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4037e6:	89 c2                	mov    edx,eax
  4037e8:	83 c0 08             	add    eax,0x8
  4037eb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037ef:	89 03                	mov    DWORD PTR [rbx],eax
  4037f1:	8b 02                	mov    eax,DWORD PTR [rdx]
  4037f3:	e9 10 f7 ff ff       	jmp    402f08 <format_string_loop+0x1c8>
  4037f8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037fc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403800:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403804:	e9 53 ff ff ff       	jmp    40375c <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403809:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40380d:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403811:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403815:	e9 1f ff ff ff       	jmp    403739 <format_string_loop+0x9f9>
            while (l++ < width) {
  40381a:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  40381e:	e9 6c fe ff ff       	jmp    40368f <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000403830 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  403830:	53                   	push   rbx
  403831:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  403834:	e8 07 f5 ff ff       	call   402d40 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  403839:	48 89 df             	mov    rdi,rbx
  40383c:	e8 6f e1 ff ff       	call   4019b0 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  403841:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  403844:	5b                   	pop    rbx
  403845:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000403850 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  403850:	f3 0f 1e fa          	endbr64 
  403854:	55                   	push   rbp
  403855:	49 89 f3             	mov    r11,rsi
  403858:	49 89 fa             	mov    r10,rdi
  40385b:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  40385f:	48 89 e5             	mov    rbp,rsp
  403862:	48 89 ef             	mov    rdi,rbp
  403865:	e8 56 e2 ff ff       	call   401ac0 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  40386a:	48 89 ef             	mov    rdi,rbp
  40386d:	4c 89 da             	mov    rdx,r11
  403870:	4c 89 d6             	mov    rsi,r10
  403873:	e8 b8 ff ff ff       	call   403830 <vsnprintf_impl>
}
  403878:	48 83 c4 20          	add    rsp,0x20
  40387c:	5d                   	pop    rbp
  40387d:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403880 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403880:	f3 0f 1e fa          	endbr64 
  403884:	55                   	push   rbp
  403885:	49 89 d1             	mov    r9,rdx
  403888:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  40388b:	48 89 f2             	mov    rdx,rsi
  40388e:	48 89 fe             	mov    rsi,rdi
{
  403891:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  403895:	48 89 e5             	mov    rbp,rsp
  403898:	48 89 ef             	mov    rdi,rbp
  40389b:	e8 80 e1 ff ff       	call   401a20 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  4038a0:	48 89 ef             	mov    rdi,rbp
  4038a3:	4c 89 d2             	mov    rdx,r10
  4038a6:	4c 89 ce             	mov    rsi,r9
  4038a9:	e8 82 ff ff ff       	call   403830 <vsnprintf_impl>
}
  4038ae:	48 83 c4 20          	add    rsp,0x20
  4038b2:	5d                   	pop    rbp
  4038b3:	c3                   	ret    

Disassembly of section .text.vsprintf:

00000000004038c0 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  4038c0:	f3 0f 1e fa          	endbr64 
  4038c4:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  4038c7:	48 89 f2             	mov    rdx,rsi
  4038ca:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4038cf:	e9 ac ff ff ff       	jmp    403880 <vsnprintf>

Disassembly of section .text.vfctprintf:

00000000004038e0 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  4038e0:	f3 0f 1e fa          	endbr64 
  4038e4:	55                   	push   rbp
  4038e5:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  4038e8:	48 89 f2             	mov    rdx,rsi
  4038eb:	48 89 fe             	mov    rsi,rdi
{
  4038ee:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  4038f2:	48 89 e5             	mov    rbp,rsp
  4038f5:	48 89 ef             	mov    rdi,rbp
  4038f8:	e8 83 e1 ff ff       	call   401a80 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  4038fd:	48 89 ef             	mov    rdi,rbp
  403900:	48 89 ca             	mov    rdx,rcx
  403903:	4c 89 ce             	mov    rsi,r9
  403906:	e8 25 ff ff ff       	call   403830 <vsnprintf_impl>
}
  40390b:	48 83 c4 20          	add    rsp,0x20
  40390f:	5d                   	pop    rbp
  403910:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403920 <printf>:

int printf_(const char* format, ...)
{
  403920:	f3 0f 1e fa          	endbr64 
  403924:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40392b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403930:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403935:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40393a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40393f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403944:	84 c0                	test   al,al
  403946:	74 37                	je     40397f <printf+0x5f>
  403948:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40394d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403952:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403957:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40395e:	00 
  40395f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403966:	00 
  403967:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40396e:	00 
  40396f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403976:	00 
  403977:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40397e:	00 
  va_list args;
  va_start(args, format);
  40397f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403986:	00 
  const int ret = vprintf_(format, args);
  403987:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  40398c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403993:	00 
  403994:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403999:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40399e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4039a5:	00 
  4039a6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  4039ab:	e8 a0 fe ff ff       	call   403850 <vprintf>
  va_end(args);
  return ret;
}
  4039b0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4039b7:	c3                   	ret    

Disassembly of section .text.sprintf:

00000000004039c0 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  4039c0:	f3 0f 1e fa          	endbr64 
  4039c4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4039cb:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4039d0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4039d5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4039da:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4039df:	84 c0                	test   al,al
  4039e1:	74 37                	je     403a1a <sprintf+0x5a>
  4039e3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4039e8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4039ed:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4039f2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4039f9:	00 
  4039fa:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403a01:	00 
  403a02:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403a09:	00 
  403a0a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403a11:	00 
  403a12:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403a19:	00 
  va_list args;
  va_start(args, format);
  403a1a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403a21:	00 
  const int ret = vsprintf_(s, format, args);
  403a22:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403a27:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403a2e:	00 
  403a2f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403a34:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403a39:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403a40:	00 
  403a41:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403a46:	e8 75 fe ff ff       	call   4038c0 <vsprintf>
  va_end(args);
  return ret;
}
  403a4b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403a52:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403a60 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403a60:	f3 0f 1e fa          	endbr64 
  403a64:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403a6b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403a70:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403a75:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403a7a:	84 c0                	test   al,al
  403a7c:	74 37                	je     403ab5 <snprintf+0x55>
  403a7e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403a83:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403a88:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403a8d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403a94:	00 
  403a95:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403a9c:	00 
  403a9d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403aa4:	00 
  403aa5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403aac:	00 
  403aad:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403ab4:	00 
  va_list args;
  va_start(args, format);
  403ab5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403abc:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403abd:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403ac2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403ac9:	00 
  403aca:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403acf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403ad4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403adb:	00 
  403adc:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403ae1:	e8 9a fd ff ff       	call   403880 <vsnprintf>
  va_end(args);
  return ret;
}
  403ae6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403aed:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403af0 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403af0:	f3 0f 1e fa          	endbr64 
  403af4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403afb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403b00:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403b05:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403b0a:	84 c0                	test   al,al
  403b0c:	74 37                	je     403b45 <fctprintf+0x55>
  403b0e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403b13:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403b18:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403b1d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403b24:	00 
  403b25:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403b2c:	00 
  403b2d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403b34:	00 
  403b35:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403b3c:	00 
  403b3d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403b44:	00 
  va_list args;
  va_start(args, format);
  403b45:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403b4c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403b4d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403b52:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403b59:	00 
  403b5a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403b5f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403b64:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403b6b:	00 
  403b6c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403b71:	e8 6a fd ff ff       	call   4038e0 <vfctprintf>
  va_end(args);
  return ret;
}
  403b76:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403b7d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403b80 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403b80:	f3 0f 1e fa          	endbr64 
  403b84:	41 54                	push   r12
  403b86:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403b89:	40 0f be ff          	movsx  edi,dil
  403b8d:	e8 0e 00 00 00       	call   403ba0 <putchar_>
	return c;
}
  403b92:	44 89 e0             	mov    eax,r12d
  403b95:	41 5c                	pop    r12
  403b97:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403ba0 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403ba0:	f3 0f 1e fa          	endbr64 
  403ba4:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403ba8:	ba 01 00 00 00       	mov    edx,0x1
  403bad:	31 c0                	xor    eax,eax
void putchar_(char c){
  403baf:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403bb4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403bb9:	bf 01 00 00 00       	mov    edi,0x1
  403bbe:	e8 6d d4 ff ff       	call   401030 <write>
  403bc3:	48 83 c4 18          	add    rsp,0x18
  403bc7:	c3                   	ret    

Disassembly of section .text.max:

0000000000403bd0 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403bd0:	48 39 f7             	cmp    rdi,rsi
  403bd3:	48 89 f0             	mov    rax,rsi
  403bd6:	48 0f 43 c7          	cmovae rax,rdi
}
  403bda:	c3                   	ret    

Disassembly of section .text.align:

0000000000403be0 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403be0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403be5:	48 f7 de             	neg    rsi
  403be8:	48 21 f0             	and    rax,rsi
}
  403beb:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403bf0 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403bf0:	31 c0                	xor    eax,eax
  403bf2:	83 ff 01             	cmp    edi,0x1
  403bf5:	76 4e                	jbe    403c45 <granules_to_chunk_kind+0x55>
  403bf7:	b8 01 00 00 00       	mov    eax,0x1
  403bfc:	83 ff 02             	cmp    edi,0x2
  403bff:	74 44                	je     403c45 <granules_to_chunk_kind+0x55>
  403c01:	83 ff 03             	cmp    edi,0x3
  403c04:	74 5a                	je     403c60 <granules_to_chunk_kind+0x70>
  403c06:	83 ff 04             	cmp    edi,0x4
  403c09:	74 45                	je     403c50 <granules_to_chunk_kind+0x60>
  403c0b:	83 ff 05             	cmp    edi,0x5
  403c0e:	74 60                	je     403c70 <granules_to_chunk_kind+0x80>
  403c10:	83 ff 06             	cmp    edi,0x6
  403c13:	74 2b                	je     403c40 <granules_to_chunk_kind+0x50>
  403c15:	b8 06 00 00 00       	mov    eax,0x6
  403c1a:	83 ff 08             	cmp    edi,0x8
  403c1d:	76 26                	jbe    403c45 <granules_to_chunk_kind+0x55>
  403c1f:	b8 07 00 00 00       	mov    eax,0x7
  403c24:	83 ff 0a             	cmp    edi,0xa
  403c27:	76 1c                	jbe    403c45 <granules_to_chunk_kind+0x55>
  403c29:	b8 08 00 00 00       	mov    eax,0x8
  403c2e:	83 ff 10             	cmp    edi,0x10
  403c31:	76 12                	jbe    403c45 <granules_to_chunk_kind+0x55>
  403c33:	83 ff 21             	cmp    edi,0x21
  403c36:	19 c0                	sbb    eax,eax
  403c38:	24 0a                	and    al,0xa
  403c3a:	05 ff 00 00 00       	add    eax,0xff
  403c3f:	c3                   	ret    
  403c40:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403c45:	c3                   	ret    
  403c46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c4d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403c50:	b8 03 00 00 00       	mov    eax,0x3
  403c55:	c3                   	ret    
  403c56:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c5d:	00 00 00 
  403c60:	b8 02 00 00 00       	mov    eax,0x2
  403c65:	c3                   	ret    
  403c66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c6d:	00 00 00 
  403c70:	b8 04 00 00 00       	mov    eax,0x4
  403c75:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403c80 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403c80:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403c85:	83 ff 09             	cmp    edi,0x9
  403c88:	77 0c                	ja     403c96 <chunk_kind_to_granules+0x16>
  403c8a:	89 ff                	mov    edi,edi
  403c8c:	48 8d 05 cd 18 00 00 	lea    rax,[rip+0x18cd]        # 405560 <CSWTCH.34>
  403c93:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403c96:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403ca0 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403ca0:	48 89 f8             	mov    rax,rdi
  403ca3:	66 31 c0             	xor    ax,ax
}
  403ca6:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403cb0 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403cb0:	89 f8                	mov    eax,edi
  403cb2:	0f b6 c4             	movzx  eax,ah
}
  403cb5:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403cc0 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403cc0:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403cc4:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403cd0 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403cd0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403cd4:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403ce0 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403ce0:	89 f6                	mov    esi,esi
  403ce2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403ce5:	48 c1 e6 08          	shl    rsi,0x8
  403ce9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403ced:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403cf0 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403cf0:	48 8b 0d f1 1a 00 00 	mov    rcx,QWORD PTR [rip+0x1af1]        # 4057e8 <large_objects>
  403cf7:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403cfe:	00 
  403cff:	76 07                	jbe    403d08 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403d01:	c3                   	ret    
  403d02:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403d08:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403d0b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403d10:	e8 9b ff ff ff       	call   403cb0 <get_chunk_index>
  403d15:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403d17:	e8 84 ff ff ff       	call   403ca0 <get_page>
  403d1c:	48 89 c7             	mov    rdi,rax
  403d1f:	e8 bc ff ff ff       	call   403ce0 <allocate_chunk>
		large_objects = large_objects->next;
  403d24:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403d27:	48 89 15 ba 1a 00 00 	mov    QWORD PTR [rip+0x1aba],rdx        # 4057e8 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403d2e:	48 8b 15 13 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b13]        # 405848 <small_object_freelists+0x48>
  403d35:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403d38:	48 89 05 09 1b 00 00 	mov    QWORD PTR [rip+0x1b09],rax        # 405848 <small_object_freelists+0x48>
}
  403d3f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403d40 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403d40:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403d44:	48 c1 e8 03          	shr    rax,0x3
}
  403d48:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403d49 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403d49:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403d50 <maybe_merge_free_large_object>:
{
  403d50:	53                   	push   rbx
	struct large_object* obj = *prev;
  403d51:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403d54:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403d57:	48 8d 1d 8a 1a 00 00 	lea    rbx,[rip+0x1a8a]        # 4057e8 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403d5e:	4c 89 df             	mov    rdi,r11
  403d61:	e8 5a ff ff ff       	call   403cc0 <get_large_object_payload>
  403d66:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403d6a:	49 89 c2             	mov    r10,rax
  403d6d:	0f 1f 00             	nop    DWORD PTR [rax]
  403d70:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403d74:	be 00 01 00 00       	mov    esi,0x100
  403d79:	48 89 d7             	mov    rdi,rdx
  403d7c:	e8 5f fe ff ff       	call   403be0 <align>
  403d81:	48 39 c2             	cmp    rdx,rax
  403d84:	0f 85 bf ff ff ff    	jne    403d49 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403d8a:	e8 21 ff ff ff       	call   403cb0 <get_chunk_index>
  403d8f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403d91:	85 c9                	test   ecx,ecx
  403d93:	74 53                	je     403de8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403d95:	e8 06 ff ff ff       	call   403ca0 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403d9a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403d9e:	75 48                	jne    403de8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403da0:	48 8b 05 41 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a41]        # 4057e8 <large_objects>
			ASSERT(walk);
  403da7:	48 85 c0             	test   rax,rax
  403daa:	0f 84 99 ff ff ff    	je     403d49 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403db0:	48 39 c2             	cmp    rdx,rax
  403db3:	74 3b                	je     403df0 <maybe_merge_free_large_object+0xa0>
  403db5:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403db8:	48 89 c1             	mov    rcx,rax
  403dbb:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  403dbe:	48 85 c0             	test   rax,rax
  403dc1:	74 32                	je     403df5 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  403dc3:	48 39 c2             	cmp    rdx,rax
  403dc6:	75 f0                	jne    403db8 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403dc8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  403dcc:	4c 39 c8             	cmp    rax,r9
  403dcf:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403dd3:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  403dd8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403ddb:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  403ddf:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  403de2:	eb 8c                	jmp    403d70 <maybe_merge_free_large_object+0x20>
  403de4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  403de8:	4c 89 c8             	mov    rax,r9
  403deb:	5b                   	pop    rbx
  403dec:	c3                   	ret    
  403ded:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403df0:	48 89 d9             	mov    rcx,rbx
  403df3:	eb d3                	jmp    403dc8 <maybe_merge_free_large_object+0x78>
  403df5:	e9 4f ff ff ff       	jmp    403d49 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000403e00 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  403e00:	8b 05 d6 19 00 00    	mov    eax,DWORD PTR [rip+0x19d6]        # 4057dc <pending_large_object_compact>
  403e06:	85 c0                	test   eax,eax
  403e08:	74 2c                	je     403e36 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  403e0a:	48 83 3d d6 19 00 00 	cmp    QWORD PTR [rip+0x19d6],0x0        # 4057e8 <large_objects>
  403e11:	00 
		pending_large_object_compact = 0;
  403e12:	c7 05 c0 19 00 00 00 	mov    DWORD PTR [rip+0x19c0],0x0        # 4057dc <pending_large_object_compact>
  403e19:	00 00 00 
		while(*prev)
  403e1c:	74 18                	je     403e36 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  403e1e:	48 8d 3d c3 19 00 00 	lea    rdi,[rip+0x19c3]        # 4057e8 <large_objects>
  403e25:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403e28:	e8 23 ff ff ff       	call   403d50 <maybe_merge_free_large_object>
  403e2d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403e30:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403e34:	75 f2                	jne    403e28 <maybe_compact_free_large_objects+0x28>
}
  403e36:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403e37 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403e37:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403e40 <get_small_object_freelist>:
  403e40:	83 ff 09             	cmp    edi,0x9
  403e43:	0f 87 ee ff ff ff    	ja     403e37 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403e49:	89 ff                	mov    edi,edi
  403e4b:	48 8d 05 ae 19 00 00 	lea    rax,[rip+0x19ae]        # 405800 <small_object_freelists>
  403e52:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403e56:	c3                   	ret    

Disassembly of section .text.free:

0000000000403e60 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  403e60:	f3 0f 1e fa          	endbr64 
  403e64:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  403e67:	48 85 ff             	test   rdi,rdi
  403e6a:	74 2a                	je     403e96 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  403e6c:	e8 2f fe ff ff       	call   403ca0 <get_page>
  403e71:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  403e74:	e8 37 fe ff ff       	call   403cb0 <get_chunk_index>
  403e79:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  403e7b:	89 c0                	mov    eax,eax
  403e7d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  403e82:	40 80 ff ff          	cmp    dil,0xff
  403e86:	74 18                	je     403ea0 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  403e88:	e8 b3 ff ff ff       	call   403e40 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  403e8d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403e90:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  403e93:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  403e96:	c3                   	ret    
  403e97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  403e9e:	00 00 
		struct large_object* obj = get_large_object(ptr);
  403ea0:	4c 89 c7             	mov    rdi,r8
  403ea3:	e8 28 fe ff ff       	call   403cd0 <get_large_object>
		obj->next = large_objects;
  403ea8:	48 8b 15 39 19 00 00 	mov    rdx,QWORD PTR [rip+0x1939]        # 4057e8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403eaf:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  403eb2:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403eb5:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  403eba:	48 89 05 27 19 00 00 	mov    QWORD PTR [rip+0x1927],rax        # 4057e8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403ec1:	e8 1a fe ff ff       	call   403ce0 <allocate_chunk>
		pending_large_object_compact = 1;
  403ec6:	c7 05 0c 19 00 00 01 	mov    DWORD PTR [rip+0x190c],0x1        # 4057dc <pending_large_object_compact>
  403ecd:	00 00 00 
  403ed0:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000403ee0 <heap_size_in_pages>:
int heap_size_in_pages()
{
  403ee0:	f3 0f 1e fa          	endbr64 
  403ee4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  403ee8:	31 ff                	xor    edi,edi
  403eea:	e8 91 d2 ff ff       	call   401180 <sbrk>
  403eef:	48 c7 c2 50 58 40 00 	mov    rdx,0x405850
  403ef6:	2b 02                	sub    eax,DWORD PTR [rdx]
  403ef8:	48 83 c4 08          	add    rsp,0x8
  403efc:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

0000000000403efd <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  403efd:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000403f00 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f00:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f02:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f04:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  403f06:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f0d:	55                   	push   rbp
  403f0e:	48 89 f5             	mov    rbp,rsi
  403f11:	53                   	push   rbx
  403f12:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f16:	e8 c5 ff ff ff       	call   403ee0 <heap_size_in_pages>
	if(!walloc_heap_size)
  403f1b:	48 8b 3d be 18 00 00 	mov    rdi,QWORD PTR [rip+0x18be]        # 4057e0 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f22:	c1 e0 10             	shl    eax,0x10
  403f25:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  403f28:	48 85 ff             	test   rdi,rdi
  403f2b:	75 63                	jne    403f90 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403f2d:	48 c7 c7 50 58 40 00 	mov    rdi,0x405850
  403f34:	be 00 00 01 00       	mov    esi,0x10000
  403f39:	e8 a2 fc ff ff       	call   403be0 <align>
		walloc_heap_size = preallocated;
  403f3e:	48 89 1d 9b 18 00 00 	mov    QWORD PTR [rip+0x189b],rbx        # 4057e0 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403f45:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  403f48:	49 39 dc             	cmp    r12,rbx
  403f4b:	0f 87 94 00 00 00    	ja     403fe5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  403f51:	48 85 db             	test   rbx,rbx
  403f54:	0f 84 a3 ff ff ff    	je     403efd <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  403f5a:	be 00 00 01 00       	mov    esi,0x10000
  403f5f:	48 89 df             	mov    rdi,rbx
  403f62:	e8 79 fc ff ff       	call   403be0 <align>
  403f67:	48 39 c3             	cmp    rbx,rax
  403f6a:	0f 85 8d ff ff ff    	jne    403efd <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  403f70:	48 c1 eb 10          	shr    rbx,0x10
  403f74:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  403f78:	48 83 c4 08          	add    rsp,0x8
  403f7c:	4c 89 c0             	mov    rax,r8
  403f7f:	5b                   	pop    rbx
  403f80:	5d                   	pop    rbp
  403f81:	41 5c                	pop    r12
  403f83:	41 5d                	pop    r13
  403f85:	c3                   	ret    
  403f86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403f8d:	00 00 00 
	if(preallocated < needed)
  403f90:	4d 85 e4             	test   r12,r12
  403f93:	74 5e                	je     403ff3 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  403f95:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403f98:	4c 89 e6             	mov    rsi,r12
  403f9b:	48 d1 ef             	shr    rdi,1
  403f9e:	e8 2d fc ff ff       	call   403bd0 <max>
  403fa3:	be 00 00 01 00       	mov    esi,0x10000
  403fa8:	48 89 c7             	mov    rdi,rax
  403fab:	e8 30 fc ff ff       	call   403be0 <align>
  403fb0:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  403fb3:	48 85 c0             	test   rax,rax
  403fb6:	0f 84 41 ff ff ff    	je     403efd <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  403fbc:	48 89 c7             	mov    rdi,rax
  403fbf:	e8 bc d1 ff ff       	call   401180 <sbrk>
  403fc4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  403fc8:	74 16                	je     403fe0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  403fca:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  403fcd:	4c 01 25 0c 18 00 00 	add    QWORD PTR [rip+0x180c],r12        # 4057e0 <walloc_heap_size>
	size_t size = grow + preallocated;
  403fd4:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  403fd8:	e9 74 ff ff ff       	jmp    403f51 <allocate_pages.constprop.0+0x51>
  403fdd:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  403fe0:	45 31 c0             	xor    r8d,r8d
  403fe3:	eb 93                	jmp    403f78 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403fe5:	49 29 dc             	sub    r12,rbx
  403fe8:	48 89 df             	mov    rdi,rbx
  403feb:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  403fee:	48 89 c3             	mov    rbx,rax
  403ff1:	eb a5                	jmp    403f98 <allocate_pages.constprop.0+0x98>
  403ff3:	e9 05 ff ff ff       	jmp    403efd <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000403ff8 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  403ff8:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000404000 <allocate_large_object>:
{
  404000:	41 54                	push   r12
  404002:	55                   	push   rbp
  404003:	53                   	push   rbx
  404004:	48 89 fb             	mov    rbx,rdi
  404007:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  40400b:	e8 f0 fd ff ff       	call   403e00 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404010:	48 8b 15 d1 17 00 00 	mov    rdx,QWORD PTR [rip+0x17d1]        # 4057e8 <large_objects>
  404017:	48 85 d2             	test   rdx,rdx
  40401a:	0f 84 da 01 00 00    	je     4041fa <allocate_large_object+0x1fa>
  404020:	4c 8d 0d c1 17 00 00 	lea    r9,[rip+0x17c1]        # 4057e8 <large_objects>
	size_t best_size = -1;
  404027:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  40402e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  404032:	45 31 d2             	xor    r10d,r10d
  404035:	4c 89 cd             	mov    rbp,r9
  404038:	eb 11                	jmp    40404b <allocate_large_object+0x4b>
  40403a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  404040:	49 89 d1             	mov    r9,rdx
  404043:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404046:	48 85 d2             	test   rdx,rdx
  404049:	74 39                	je     404084 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40404b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40404f:	4c 39 c1             	cmp    rcx,r8
  404052:	73 ec                	jae    404040 <allocate_large_object+0x40>
  404054:	48 39 d9             	cmp    rcx,rbx
  404057:	72 e7                	jb     404040 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  404059:	be 00 01 00 00       	mov    esi,0x100
  40405e:	e8 7d fb ff ff       	call   403be0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  404063:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  404067:	48 39 c6             	cmp    rsi,rax
  40406a:	0f 84 88 02 00 00    	je     4042f8 <allocate_large_object+0x2f8>
  404070:	4c 89 cd             	mov    rbp,r9
  404073:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  404076:	49 89 d1             	mov    r9,rdx
  404079:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40407c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  40407f:	48 85 d2             	test   rdx,rdx
  404082:	75 c7                	jne    40404b <allocate_large_object+0x4b>
	if(!best)
  404084:	4d 85 d2             	test   r10,r10
  404087:	0f 84 7b 01 00 00    	je     404208 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  40408d:	4c 89 d7             	mov    rdi,r10
  404090:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  404095:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404098:	e8 13 fc ff ff       	call   403cb0 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  40409d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4040a0:	89 c6                	mov    esi,eax
  4040a2:	e8 f9 fb ff ff       	call   403ca0 <get_page>
  4040a7:	48 89 c7             	mov    rdi,rax
  4040aa:	49 89 c1             	mov    r9,rax
  4040ad:	e8 2e fc ff ff       	call   403ce0 <allocate_chunk>
	struct large_object* next = best->next;
  4040b2:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  4040b5:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  4040b9:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  4040c0:	75 36                	jne    4040f8 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  4040c2:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  4040c6:	4c 89 d7             	mov    rdi,r10
  4040c9:	be 00 01 00 00       	mov    esi,0x100
  4040ce:	e8 ed fb ff ff       	call   403cc0 <get_large_object_payload>
  4040d3:	48 01 c2             	add    rdx,rax
  4040d6:	48 89 d7             	mov    rdi,rdx
  4040d9:	e8 02 fb ff ff       	call   403be0 <align>
  4040de:	48 39 c2             	cmp    rdx,rax
  4040e1:	0f 85 11 ff ff ff    	jne    403ff8 <allocate_large_object.cold>
}
  4040e7:	48 83 c4 10          	add    rsp,0x10
  4040eb:	4c 89 d0             	mov    rax,r10
  4040ee:	5b                   	pop    rbx
  4040ef:	5d                   	pop    rbp
  4040f0:	41 5c                	pop    r12
  4040f2:	c3                   	ret    
  4040f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  4040f8:	4c 89 d7             	mov    rdi,r10
  4040fb:	e8 c0 fb ff ff       	call   403cc0 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  404100:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  404103:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  404107:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  40410a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  40410d:	4c 01 df             	add    rdi,r11
  404110:	e8 8b fb ff ff       	call   403ca0 <get_page>
  404115:	49 39 c1             	cmp    r9,rax
  404118:	0f 84 e8 01 00 00    	je     404306 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  40411e:	be 00 00 01 00       	mov    esi,0x10000
  404123:	4c 89 df             	mov    rdi,r11
  404126:	e8 b5 fa ff ff       	call   403be0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40412b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  404132:	0f 86 38 01 00 00    	jbe    404270 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404138:	4c 39 d8             	cmp    rax,r11
  40413b:	0f 85 b7 fe ff ff    	jne    403ff8 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404141:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404144:	be 00 00 01 00       	mov    esi,0x10000
  404149:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  404150:	ff 
			tail_size = best_size - size;
  404151:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  404158:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404159:	e8 82 fa ff ff       	call   403be0 <align>
		best->size -= tail_size;
  40415e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  404162:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  404165:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404168:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  40416b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40416f:	48 29 cf             	sub    rdi,rcx
  404172:	e8 39 fb ff ff       	call   403cb0 <get_chunk_index>
  404177:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404179:	48 85 c9             	test   rcx,rcx
  40417c:	0f 84 44 ff ff ff    	je     4040c6 <allocate_large_object+0xc6>
  404182:	85 c0                	test   eax,eax
  404184:	75 0c                	jne    404192 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  404186:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  40418d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  404192:	48 85 c9             	test   rcx,rcx
  404195:	0f 84 2b ff ff ff    	je     4040c6 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  40419b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40419e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  4041a3:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4041a6:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  4041aa:	e8 f1 fa ff ff       	call   403ca0 <get_page>
  4041af:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4041b2:	e8 29 fb ff ff       	call   403ce0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041b7:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4041bc:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  4041bf:	48 8b 05 22 16 00 00 	mov    rax,QWORD PTR [rip+0x1622]        # 4057e8 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4041c6:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041ca:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  4041cd:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041d0:	e8 eb fa ff ff       	call   403cc0 <get_large_object_payload>
  4041d5:	48 01 c1             	add    rcx,rax
  4041d8:	48 89 cf             	mov    rdi,rcx
  4041db:	e8 00 fa ff ff       	call   403be0 <align>
  4041e0:	48 39 c1             	cmp    rcx,rax
  4041e3:	0f 85 0f fe ff ff    	jne    403ff8 <allocate_large_object.cold>
			large_objects = tail;
  4041e9:	48 89 15 f8 15 00 00 	mov    QWORD PTR [rip+0x15f8],rdx        # 4057e8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4041f0:	e8 fb fa ff ff       	call   403cf0 <maybe_repurpose_single_chunk_large_objects_head>
  4041f5:	e9 c8 fe ff ff       	jmp    4040c2 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  4041fa:	48 8d 2d e7 15 00 00 	lea    rbp,[rip+0x15e7]        # 4057e8 <large_objects>
  404201:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  404208:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40420c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  404211:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  404218:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40421a:	4c 89 e7             	mov    rdi,r12
  40421d:	e8 de fc ff ff       	call   403f00 <allocate_pages.constprop.0>
  404222:	48 89 c1             	mov    rcx,rax
		if(!page)
  404225:	48 85 c0             	test   rax,rax
  404228:	0f 84 10 01 00 00    	je     40433e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40422e:	ba ff 00 00 00       	mov    edx,0xff
  404233:	be 01 00 00 00       	mov    esi,0x1
  404238:	48 89 c7             	mov    rdi,rax
  40423b:	e8 a0 fa ff ff       	call   403ce0 <allocate_chunk>
  404240:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  404243:	48 8b 05 9e 15 00 00 	mov    rax,QWORD PTR [rip+0x159e]        # 4057e8 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40424a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40424d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  404250:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  404255:	48 c1 e0 10          	shl    rax,0x10
  404259:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  40425e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  404262:	4d 39 c4             	cmp    r12,r8
  404265:	0f 86 22 fe ff ff    	jbe    40408d <allocate_large_object+0x8d>
  40426b:	e9 88 fd ff ff       	jmp    403ff8 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404270:	4c 39 d8             	cmp    rax,r11
  404273:	0f 85 7f fd ff ff    	jne    403ff8 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404279:	48 89 ef             	mov    rdi,rbp
  40427c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404281:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404285:	e8 26 fa ff ff       	call   403cb0 <get_chunk_index>
  40428a:	4c 89 cf             	mov    rdi,r9
  40428d:	89 c6                	mov    esi,eax
  40428f:	e8 4c fa ff ff       	call   403ce0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404294:	b8 00 00 01 00       	mov    eax,0x10000
  404299:	4c 29 e0             	sub    rax,r12
  40429c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  4042a0:	48 8b 05 41 15 00 00 	mov    rax,QWORD PTR [rip+0x1541]        # 4057e8 <large_objects>
  4042a7:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  4042aa:	4c 89 15 37 15 00 00 	mov    QWORD PTR [rip+0x1537],r10        # 4057e8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4042b1:	e8 3a fa ff ff       	call   403cf0 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042b6:	ba ff 00 00 00       	mov    edx,0xff
  4042bb:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  4042c0:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042c7:	e8 14 fa ff ff       	call   403ce0 <allocate_chunk>
			best->size = best_size =
  4042cc:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  4042d3:	ff 
  4042d4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042d8:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  4042db:	48 39 d3             	cmp    rbx,rdx
  4042de:	0f 87 14 fd ff ff    	ja     403ff8 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  4042e4:	48 89 d1             	mov    rcx,rdx
  4042e7:	48 29 d9             	sub    rcx,rbx
  4042ea:	30 c9                	xor    cl,cl
  4042ec:	e9 74 fe ff ff       	jmp    404165 <allocate_large_object+0x165>
  4042f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4042f8:	4c 89 cd             	mov    rbp,r9
  4042fb:	49 89 c8             	mov    r8,rcx
  4042fe:	49 89 d2             	mov    r10,rdx
  404301:	e9 87 fd ff ff       	jmp    40408d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404306:	be 00 01 00 00       	mov    esi,0x100
  40430b:	4c 89 df             	mov    rdi,r11
  40430e:	e8 cd f8 ff ff       	call   403be0 <align>
  404313:	49 39 c3             	cmp    r11,rax
  404316:	0f 85 dc fc ff ff    	jne    403ff8 <allocate_large_object.cold>
		best->size -= tail_size;
  40431c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404320:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  404323:	48 29 ca             	sub    rdx,rcx
  404326:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40432a:	e8 81 f9 ff ff       	call   403cb0 <get_chunk_index>
  40432f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404331:	85 c0                	test   eax,eax
  404333:	0f 84 4d fe ff ff    	je     404186 <allocate_large_object+0x186>
  404339:	e9 5d fe ff ff       	jmp    40419b <allocate_large_object+0x19b>
			return NULL;
  40433e:	45 31 d2             	xor    r10d,r10d
  404341:	e9 a1 fd ff ff       	jmp    4040e7 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

0000000000404350 <allocate_large>:
{
  404350:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  404354:	e8 a7 fc ff ff       	call   404000 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  404359:	48 85 c0             	test   rax,rax
  40435c:	74 12                	je     404370 <allocate_large+0x20>
  40435e:	48 89 c7             	mov    rdi,rax
}
  404361:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  404365:	e9 56 f9 ff ff       	jmp    403cc0 <get_large_object_payload>
  40436a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  404370:	31 c0                	xor    eax,eax
  404372:	48 83 c4 08          	add    rsp,0x8
  404376:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

0000000000404380 <obtain_small_objects>:
{
  404380:	55                   	push   rbp
  404381:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  404383:	48 8b 3d be 14 00 00 	mov    rdi,QWORD PTR [rip+0x14be]        # 405848 <small_object_freelists+0x48>
  40438a:	48 85 ff             	test   rdi,rdi
  40438d:	74 71                	je     404400 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  40438f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  404392:	48 89 05 af 14 00 00 	mov    QWORD PTR [rip+0x14af],rax        # 405848 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404399:	e8 12 f9 ff ff       	call   403cb0 <get_chunk_index>
  40439e:	89 ea                	mov    edx,ebp
  4043a0:	89 c6                	mov    esi,eax
  4043a2:	e8 f9 f8 ff ff       	call   403ca0 <get_page>
  4043a7:	48 89 c7             	mov    rdi,rax
  4043aa:	e8 31 f9 ff ff       	call   403ce0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4043af:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4043b1:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4043b4:	e8 c7 f8 ff ff       	call   403c80 <chunk_kind_to_granules>
  4043b9:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043c0:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  4043c7:	77 46                	ja     40440f <obtain_small_objects+0x8f>
  4043c9:	48 89 d0             	mov    rax,rdx
  4043cc:	48 89 f1             	mov    rcx,rsi
  4043cf:	48 29 f0             	sub    rax,rsi
  4043d2:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  4043d9:	31 c0                	xor    eax,eax
  4043db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  4043e0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043e3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  4043e6:	48 89 d0             	mov    rax,rdx
		head->next = next;
  4043e9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043ec:	48 29 f2             	sub    rdx,rsi
  4043ef:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  4043f6:	76 e8                	jbe    4043e0 <obtain_small_objects+0x60>
}
  4043f8:	5d                   	pop    rbp
  4043f9:	c3                   	ret    
  4043fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  404400:	31 ff                	xor    edi,edi
  404402:	e8 f9 fb ff ff       	call   404000 <allocate_large_object>
  404407:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40440a:	48 85 c0             	test   rax,rax
  40440d:	75 8a                	jne    404399 <obtain_small_objects+0x19>
			return NULL;
  40440f:	31 c0                	xor    eax,eax
}
  404411:	5d                   	pop    rbp
  404412:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000404420 <allocate_small>:
{
  404420:	53                   	push   rbx
  404421:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  404424:	e8 17 fa ff ff       	call   403e40 <get_small_object_freelist>
  404429:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40442c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40442f:	48 85 c0             	test   rax,rax
  404432:	74 0c                	je     404440 <allocate_small+0x20>
	*loc = ret->next;
  404434:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404437:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40443a:	5b                   	pop    rbx
  40443b:	c3                   	ret    
  40443c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  404440:	44 89 c7             	mov    edi,r8d
  404443:	e8 38 ff ff ff       	call   404380 <obtain_small_objects>
		if(!freelist)
  404448:	48 85 c0             	test   rax,rax
  40444b:	74 ed                	je     40443a <allocate_small+0x1a>
		*loc = freelist;
  40444d:	48 89 03             	mov    QWORD PTR [rbx],rax
  404450:	eb e2                	jmp    404434 <allocate_small+0x14>

Disassembly of section .text.malloc:

0000000000404460 <malloc>:
{
  404460:	f3 0f 1e fa          	endbr64 
  404464:	48 83 ec 08          	sub    rsp,0x8
  404468:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  40446b:	e8 d0 f8 ff ff       	call   403d40 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  404470:	89 c7                	mov    edi,eax
  404472:	e8 79 f7 ff ff       	call   403bf0 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404477:	3d ff 00 00 00       	cmp    eax,0xff
  40447c:	74 12                	je     404490 <malloc+0x30>
  40447e:	89 c7                	mov    edi,eax
}
  404480:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404484:	e9 97 ff ff ff       	jmp    404420 <allocate_small>
  404489:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404490:	4c 89 c7             	mov    rdi,r8
}
  404493:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404497:	e9 b4 fe ff ff       	jmp    404350 <allocate_large>

Disassembly of section .text.memcpy:

00000000004044a0 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  4044a0:	f3 0f 1e fa          	endbr64 
  4044a4:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  4044a7:	48 85 d2             	test   rdx,rdx
  4044aa:	74 6c                	je     404518 <memcpy+0x78>
  4044ac:	48 89 f0             	mov    rax,rsi
  4044af:	48 39 f7             	cmp    rdi,rsi
  4044b2:	74 64                	je     404518 <memcpy+0x78>
  4044b4:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  4044b7:	73 67                	jae    404520 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  4044b9:	48 89 fa             	mov    rdx,rdi
  4044bc:	48 09 f2             	or     rdx,rsi
  4044bf:	83 e2 03             	and    edx,0x3
  4044c2:	0f 85 e8 00 00 00    	jne    4045b0 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  4044c8:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  4044cb:	49 89 c9             	mov    r9,rcx
  4044ce:	4c 89 c6             	mov    rsi,r8
  4044d1:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  4044d4:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4044d8:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  4044dc:	49 83 fa 03          	cmp    r10,0x3
  4044e0:	76 1f                	jbe    404501 <memcpy+0x61>
  4044e2:	31 d2                	xor    edx,edx
  4044e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4044e8:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  4044eb:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  4044ee:	48 83 c2 01          	add    rdx,0x1
  4044f2:	48 39 d7             	cmp    rdi,rdx
  4044f5:	75 f1                	jne    4044e8 <memcpy+0x48>
  4044f7:	48 c1 e7 02          	shl    rdi,0x2
  4044fb:	48 01 f8             	add    rax,rdi
  4044fe:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  404501:	4d 85 c9             	test   r9,r9
  404504:	74 12                	je     404518 <memcpy+0x78>
  404506:	31 d2                	xor    edx,edx
  404508:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  40450c:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  40450f:	48 83 c2 01          	add    rdx,0x1
  404513:	49 39 d1             	cmp    r9,rdx
  404516:	75 f0                	jne    404508 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  404518:	4c 89 c0             	mov    rax,r8
  40451b:	c3                   	ret    
  40451c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  404520:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  404524:	48 01 d0             	add    rax,rdx
{
  404527:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  404528:	4c 89 ca             	mov    rdx,r9
{
  40452b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  40452c:	48 09 c2             	or     rdx,rax
  40452f:	83 e2 03             	and    edx,0x3
  404532:	0f 84 b8 00 00 00    	je     4045f0 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  404538:	4c 89 ca             	mov    rdx,r9
  40453b:	48 31 c2             	xor    rdx,rax
  40453e:	83 e2 03             	and    edx,0x3
  404541:	75 0a                	jne    40454d <memcpy+0xad>
  404543:	48 83 f9 04          	cmp    rcx,0x4
  404547:	0f 87 13 01 00 00    	ja     404660 <memcpy+0x1c0>
  40454d:	31 db                	xor    ebx,ebx
  40454f:	31 d2                	xor    edx,edx
  404551:	31 ed                	xor    ebp,ebp
			length -= t;
  404553:	48 89 ce             	mov    rsi,rcx
  404556:	48 f7 de             	neg    rsi
  404559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  404560:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  404564:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  404568:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  40456e:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  404573:	48 83 e9 01          	sub    rcx,0x1
  404577:	75 e7                	jne    404560 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404579:	48 83 fd 03          	cmp    rbp,0x3
  40457d:	0f 87 8d 00 00 00    	ja     404610 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  404583:	48 85 db             	test   rbx,rbx
  404586:	74 1c                	je     4045a4 <memcpy+0x104>
  404588:	48 f7 d3             	not    rbx
  40458b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  404592:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  404597:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  40459b:	48 83 e8 01          	sub    rax,0x1
  40459f:	48 39 d8             	cmp    rax,rbx
  4045a2:	75 ee                	jne    404592 <memcpy+0xf2>
}
  4045a4:	4c 89 c0             	mov    rax,r8
  4045a7:	5b                   	pop    rbx
  4045a8:	5d                   	pop    rbp
  4045a9:	c3                   	ret    
  4045aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  4045b0:	48 89 fa             	mov    rdx,rdi
  4045b3:	48 31 f2             	xor    rdx,rsi
  4045b6:	83 e2 03             	and    edx,0x3
  4045b9:	75 06                	jne    4045c1 <memcpy+0x121>
  4045bb:	48 83 f9 03          	cmp    rcx,0x3
  4045bf:	77 77                	ja     404638 <memcpy+0x198>
  4045c1:	45 31 c9             	xor    r9d,r9d
  4045c4:	31 ff                	xor    edi,edi
  4045c6:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  4045c9:	31 d2                	xor    edx,edx
  4045cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  4045d0:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  4045d4:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  4045d8:	48 83 c2 01          	add    rdx,0x1
  4045dc:	48 39 d1             	cmp    rcx,rdx
  4045df:	75 ef                	jne    4045d0 <memcpy+0x130>
  4045e1:	48 01 c8             	add    rax,rcx
  4045e4:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  4045e8:	e9 ef fe ff ff       	jmp    4044dc <memcpy+0x3c>
  4045ed:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  4045f0:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  4045f3:	48 89 cb             	mov    rbx,rcx
  4045f6:	48 89 cd             	mov    rbp,rcx
		src += length;
  4045f9:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  4045fc:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404600:	83 e3 03             	and    ebx,0x3
		dst += length;
  404603:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404606:	48 83 fd 03          	cmp    rbp,0x3
  40460a:	0f 86 73 ff ff ff    	jbe    404583 <memcpy+0xe3>
  404610:	48 89 d0             	mov    rax,rdx
  404613:	48 f7 d8             	neg    rax
  404616:	48 c1 e0 02          	shl    rax,0x2
  40461a:	49 01 c3             	add    r11,rax
  40461d:	49 01 c2             	add    r10,rax
  404620:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  404625:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  40462a:	48 83 ea 01          	sub    rdx,0x1
  40462e:	75 f0                	jne    404620 <memcpy+0x180>
  404630:	e9 4e ff ff ff       	jmp    404583 <memcpy+0xe3>
  404635:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  404638:	48 89 f2             	mov    rdx,rsi
  40463b:	83 e2 03             	and    edx,0x3
			length -= t;
  40463e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  404643:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  404648:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  40464b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  40464e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  404651:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404655:	41 83 e1 03          	and    r9d,0x3
  404659:	e9 6b ff ff ff       	jmp    4045c9 <memcpy+0x129>
  40465e:	66 90                	xchg   ax,ax
				t &= wmask;
  404660:	48 89 c6             	mov    rsi,rax
  404663:	83 e6 03             	and    esi,0x3
			length -= t;
  404666:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  404669:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  40466c:	48 89 cb             	mov    rbx,rcx
			length -= t;
  40466f:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  404672:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  404675:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404679:	83 e3 03             	and    ebx,0x3
  40467c:	e9 d2 fe ff ff       	jmp    404553 <memcpy+0xb3>
