
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
  4001ed:	e8 3e 14 00 00       	call   401630 <memset>
        int p = 0;
  4001f2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
        printf("%s:>", path);
  4001f9:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400200:	48 89 c6             	mov    rsi,rax
  400203:	48 8d 05 a0 53 00 00 	lea    rax,[rip+0x53a0]        # 4055aa <b+0x1e>
  40020a:	48 89 c7             	mov    rdi,rax
  40020d:	b8 00 00 00 00       	mov    eax,0x0
  400212:	e8 19 37 00 00       	call   403930 <printf>
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
  400249:	e8 b2 14 00 00       	call   401700 <strcmp>
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
  40027a:	e8 81 14 00 00       	call   401700 <strcmp>
  40027f:	85 c0                	test   eax,eax
  400281:	0f 84 ba 0c 00 00    	je     400f41 <main+0xf06>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400287:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40028e:	48 8d 15 39 53 00 00 	lea    rdx,[rip+0x5339]        # 4055ce <b+0x42>
  400295:	48 89 d6             	mov    rsi,rdx
  400298:	48 89 c7             	mov    rdi,rax
  40029b:	e8 60 14 00 00       	call   401700 <strcmp>
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
  4002cd:	e8 5e 36 00 00       	call   403930 <printf>
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
  4002f1:	e8 3a 36 00 00       	call   403930 <printf>
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
  400331:	e8 ca 13 00 00       	call   401700 <strcmp>
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
  4003fd:	e8 2e 35 00 00       	call   403930 <printf>
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
  40043e:	e8 ed 34 00 00       	call   403930 <printf>
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
  40045c:	e8 9f 12 00 00       	call   401700 <strcmp>
  400461:	85 c0                	test   eax,eax
  400463:	75 75                	jne    4004da <main+0x49f>
                char* p = tmppath + strlen(tmppath) - 1;
  400465:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40046c:	48 89 c7             	mov    rdi,rax
  40046f:	e8 dc 12 00 00       	call   401750 <strlen>
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
  4004ee:	e8 0d 12 00 00       	call   401700 <strcmp>
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
  40050f:	e8 ac 11 00 00       	call   4016c0 <strcat>
                strcat(tmppath, "/");
  400514:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40051b:	48 89 c7             	mov    rdi,rax
  40051e:	e8 2d 12 00 00       	call   401750 <strlen>
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
  40054e:	e8 dd 33 00 00       	call   403930 <printf>
  400553:	e9 81 fc ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400558:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40055f:	48 8d 15 cc 50 00 00 	lea    rdx,[rip+0x50cc]        # 405632 <b+0xa6>
  400566:	48 89 d6             	mov    rsi,rdx
  400569:	48 89 c7             	mov    rdi,rax
  40056c:	e8 8f 11 00 00       	call   401700 <strcmp>
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
  400616:	e8 15 33 00 00       	call   403930 <printf>
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
  400660:	e8 cb 32 00 00       	call   403930 <printf>
  400665:	e9 6f fb ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("create file %s success\n", path);
  40066a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400671:	48 89 c6             	mov    rsi,rax
  400674:	48 8d 05 e0 4f 00 00 	lea    rax,[rip+0x4fe0]        # 40565b <b+0xcf>
  40067b:	48 89 c7             	mov    rdi,rax
  40067e:	b8 00 00 00 00       	mov    eax,0x0
  400683:	e8 a8 32 00 00       	call   403930 <printf>
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
  4006ab:	e8 50 10 00 00       	call   401700 <strcmp>
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
  400755:	e8 d6 31 00 00       	call   403930 <printf>
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
  40079a:	e8 91 31 00 00       	call   403930 <printf>
  40079f:	e9 35 fa ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("remove file/dir %s success\n", path);
  4007a4:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4007ab:	48 89 c6             	mov    rsi,rax
  4007ae:	48 8d 05 dc 4e 00 00 	lea    rax,[rip+0x4edc]        # 405691 <b+0x105>
  4007b5:	48 89 c7             	mov    rdi,rax
  4007b8:	b8 00 00 00 00       	mov    eax,0x0
  4007bd:	e8 6e 31 00 00       	call   403930 <printf>
  4007c2:	e9 12 fa ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  4007c7:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4007ce:	48 8d 15 d8 4e 00 00 	lea    rdx,[rip+0x4ed8]        # 4056ad <b+0x121>
  4007d5:	48 89 d6             	mov    rsi,rdx
  4007d8:	48 89 c7             	mov    rdi,rax
  4007db:	e8 20 0f 00 00       	call   401700 <strcmp>
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
  400913:	e8 18 30 00 00       	call   403930 <printf>
            gets(src);
  400918:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  40091f:	48 89 c7             	mov    rdi,rax
  400922:	e8 a9 0c 00 00       	call   4015d0 <gets>
            printf("input dst path:");
  400927:	48 8d 05 92 4d 00 00 	lea    rax,[rip+0x4d92]        # 4056c0 <b+0x134>
  40092e:	48 89 c7             	mov    rdi,rax
  400931:	b8 00 00 00 00       	mov    eax,0x0
  400936:	e8 f5 2f 00 00       	call   403930 <printf>
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
  40098c:	e8 9f 2f 00 00       	call   403930 <printf>
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
  4009b6:	e8 75 2f 00 00       	call   403930 <printf>
  4009bb:	e9 19 f8 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  4009c0:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4009c7:	48 8d 15 42 4d 00 00 	lea    rdx,[rip+0x4d42]        # 405710 <b+0x184>
  4009ce:	48 89 d6             	mov    rsi,rdx
  4009d1:	48 89 c7             	mov    rdi,rax
  4009d4:	e8 27 0d 00 00       	call   401700 <strcmp>
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
  400a7e:	e8 ad 2e 00 00       	call   403930 <printf>
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
  400ac8:	e8 63 2e 00 00       	call   403930 <printf>
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
  400b82:	e8 a9 2d 00 00       	call   403930 <printf>
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
  400bdb:	e8 20 0b 00 00       	call   401700 <strcmp>
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
  400c85:	e8 a6 2c 00 00       	call   403930 <printf>
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
  400ccf:	e8 5c 2c 00 00       	call   403930 <printf>
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
  400d76:	e8 b5 2b 00 00       	call   403930 <printf>
                gets(buffer);
  400d7b:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400d82:	48 89 c7             	mov    rdi,rax
  400d85:	e8 46 08 00 00       	call   4015d0 <gets>
                int len = strlen(buffer);
  400d8a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400d91:	48 89 c7             	mov    rdi,rax
  400d94:	e8 b7 09 00 00       	call   401750 <strlen>
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
  400dd1:	e8 5a 2b 00 00       	call   403930 <printf>
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
  400df9:	e8 02 09 00 00       	call   401700 <strcmp>
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
  400e84:	e8 a7 2a 00 00       	call   403930 <printf>
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
  400ead:	e8 7e 2a 00 00       	call   403930 <printf>
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
  400ef0:	e8 3b 2a 00 00       	call   403930 <printf>
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
  400f0e:	e8 1d 2a 00 00       	call   403930 <printf>
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
  4011c5:	e8 a6 32 00 00       	call   404470 <malloc>
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
  401207:	e8 64 2c 00 00       	call   403e70 <free>
		return NULL;
  40120c:	b8 00 00 00 00       	mov    eax,0x0
  401211:	eb 72                	jmp    401285 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  401213:	bf 00 04 00 00       	mov    edi,0x400
  401218:	e8 53 32 00 00       	call   404470 <malloc>
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
  401249:	e8 22 2c 00 00       	call   403e70 <free>
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
  40131a:	e8 51 2b 00 00       	call   403e70 <free>
	free(dirp);
  40131f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401323:	48 89 c7             	mov    rdi,rax
  401326:	e8 45 2b 00 00       	call   403e70 <free>
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
  401588:	e8 03 26 00 00       	call   403b90 <putchar>
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
  4015a3:	e8 e8 25 00 00       	call   403b90 <putchar>
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
	*str = 0;
  4015d9:	c6 07 00             	mov    BYTE PTR [rdi],0x0
  4015dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	while(1)
	{
		read(1, str, 1);
  4015e0:	ba 01 00 00 00       	mov    edx,0x1
  4015e5:	4c 89 e6             	mov    rsi,r12
  4015e8:	bf 01 00 00 00       	mov    edi,0x1
  4015ed:	31 c0                	xor    eax,eax
  4015ef:	e8 2c fa ff ff       	call   401020 <read>
		if(!*str)
  4015f4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  4015f9:	84 c0                	test   al,al
  4015fb:	74 e3                	je     4015e0 <gets+0x10>
		{
			continue;
		}
		if(*str == '\n')
  4015fd:	3c 0a                	cmp    al,0xa
  4015ff:	74 1f                	je     401620 <gets+0x50>
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  401601:	3c 08                	cmp    al,0x8
  401603:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  401608:	4c 0f 44 e2          	cmove  r12,rdx
		}
		*str++ = 0;
  40160c:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401611:	49 83 c4 01          	add    r12,0x1
  401615:	eb c9                	jmp    4015e0 <gets+0x10>
  401617:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40161e:	00 00 
	}
	return str;
  401620:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  401623:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401628:	41 5c                	pop    r12
  40162a:	c3                   	ret    

Disassembly of section .text.memset:

0000000000401630 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401630:	f3 0f 1e fa          	endbr64 
  401634:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401637:	48 85 d2             	test   rdx,rdx
  40163a:	74 77                	je     4016b3 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40163c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401641:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401644:	48 83 fa 02          	cmp    rdx,0x2
  401648:	76 69                	jbe    4016b3 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40164a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40164f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401653:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401658:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40165c:	48 83 fa 06          	cmp    rdx,0x6
  401660:	76 51                	jbe    4016b3 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401662:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401667:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40166b:	48 83 fa 08          	cmp    rdx,0x8
  40166f:	76 42                	jbe    4016b3 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401671:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401674:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401678:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40167b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40167e:	45 89 c1             	mov    r9d,r8d
	s += k;
  401681:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  401685:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401688:	44 89 c7             	mov    edi,r8d
  40168b:	41 c1 e1 10          	shl    r9d,0x10
  40168f:	c1 e7 08             	shl    edi,0x8
  401692:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401696:	44 09 cf             	or     edi,r9d
  401699:	48 01 ca             	add    rdx,rcx
  40169c:	44 09 c7             	or     edi,r8d
  40169f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  4016a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  4016a8:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  4016aa:	48 83 c1 04          	add    rcx,0x4
  4016ae:	48 39 ca             	cmp    rdx,rcx
  4016b1:	75 f5                	jne    4016a8 <memset+0x78>
	}

	return dest;
}
  4016b3:	c3                   	ret    

Disassembly of section .text.strcat:

00000000004016c0 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  4016c0:	f3 0f 1e fa          	endbr64 
  4016c4:	41 54                	push   r12
  4016c6:	49 89 fc             	mov    r12,rdi
  4016c9:	55                   	push   rbp
  4016ca:	48 89 f5             	mov    rbp,rsi
  4016cd:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  4016ce:	e8 7d 00 00 00       	call   401750 <strlen>
	const size_t srclen = strlen(src);
  4016d3:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  4016d6:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  4016d9:	e8 72 00 00 00       	call   401750 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  4016de:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  4016e2:	48 89 ee             	mov    rsi,rbp
  4016e5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4016e9:	e8 c2 2d 00 00       	call   4044b0 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  4016ee:	4c 89 e0             	mov    rax,r12
  4016f1:	5b                   	pop    rbx
  4016f2:	5d                   	pop    rbp
  4016f3:	41 5c                	pop    r12
  4016f5:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000401700 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  401700:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  401704:	48 39 f7             	cmp    rdi,rsi
  401707:	74 34                	je     40173d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  401709:	48 85 ff             	test   rdi,rdi
  40170c:	74 38                	je     401746 <strcmp+0x46>
  40170e:	48 85 f6             	test   rsi,rsi
  401711:	74 33                	je     401746 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  401713:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401716:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401719:	38 ca                	cmp    dl,cl
  40171b:	75 23                	jne    401740 <strcmp+0x40>
  40171d:	b8 01 00 00 00       	mov    eax,0x1
  401722:	eb 15                	jmp    401739 <strcmp+0x39>
  401724:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401728:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40172c:	48 83 c0 01          	add    rax,0x1
  401730:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401735:	38 ca                	cmp    dl,cl
  401737:	75 07                	jne    401740 <strcmp+0x40>
		{
			if(*s1 == 0)
  401739:	84 d2                	test   dl,dl
  40173b:	75 eb                	jne    401728 <strcmp+0x28>
		return 0;
  40173d:	31 c0                	xor    eax,eax
  40173f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  401740:	0f be c2             	movsx  eax,dl
  401743:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  401745:	c3                   	ret    
	int r = -1;
  401746:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40174b:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000401750 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  401750:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  401754:	48 89 fe             	mov    rsi,rdi
  401757:	40 f6 c7 07          	test   dil,0x7
  40175b:	75 0d                	jne    40176a <strlen+0x1a>
  40175d:	eb 21                	jmp    401780 <strlen+0x30>
  40175f:	90                   	nop
  401760:	48 83 c7 01          	add    rdi,0x1
  401764:	40 f6 c7 07          	test   dil,0x7
  401768:	74 16                	je     401780 <strlen+0x30>
	{
		if(*p == '\0')
  40176a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40176d:	75 f1                	jne    401760 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  40176f:	48 89 f8             	mov    rax,rdi
  401772:	48 29 f0             	sub    rax,rsi
  401775:	c3                   	ret    
  401776:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40177d:	00 00 00 
		if((*lp - mask01) & mask80)
  401780:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401787:	fe fe fe 
  40178a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401791:	80 80 80 
  401794:	eb 38                	jmp    4017ce <strlen+0x7e>
  401796:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40179d:	00 00 00 
			testbyte(1);
  4017a0:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  4017a4:	74 3a                	je     4017e0 <strlen+0x90>
			testbyte(2);
  4017a6:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  4017aa:	74 3c                	je     4017e8 <strlen+0x98>
			testbyte(3);
  4017ac:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  4017b0:	74 3e                	je     4017f0 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  4017b2:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  4017b6:	74 40                	je     4017f8 <strlen+0xa8>
			testbyte(5);
  4017b8:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  4017bc:	74 42                	je     401800 <strlen+0xb0>
			testbyte(6);
  4017be:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  4017c2:	74 44                	je     401808 <strlen+0xb8>
			testbyte(7);
  4017c4:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  4017c8:	74 46                	je     401810 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  4017ca:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  4017ce:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4017d1:	48 01 c8             	add    rax,rcx
  4017d4:	48 85 d0             	test   rax,rdx
  4017d7:	74 f1                	je     4017ca <strlen+0x7a>
			testbyte(0);
  4017d9:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4017dc:	75 c2                	jne    4017a0 <strlen+0x50>
  4017de:	eb 8f                	jmp    40176f <strlen+0x1f>
			testbyte(1);
  4017e0:	48 29 f7             	sub    rdi,rsi
  4017e3:	48 8d 47 01          	lea    rax,[rdi+0x1]
  4017e7:	c3                   	ret    
			testbyte(2);
  4017e8:	48 29 f7             	sub    rdi,rsi
  4017eb:	48 8d 47 02          	lea    rax,[rdi+0x2]
  4017ef:	c3                   	ret    
			testbyte(3);
  4017f0:	48 29 f7             	sub    rdi,rsi
  4017f3:	48 8d 47 03          	lea    rax,[rdi+0x3]
  4017f7:	c3                   	ret    
			testbyte(4);
  4017f8:	48 29 f7             	sub    rdi,rsi
  4017fb:	48 8d 47 04          	lea    rax,[rdi+0x4]
  4017ff:	c3                   	ret    
			testbyte(5);
  401800:	48 29 f7             	sub    rdi,rsi
  401803:	48 8d 47 05          	lea    rax,[rdi+0x5]
  401807:	c3                   	ret    
			testbyte(6);
  401808:	48 29 f7             	sub    rdi,rsi
  40180b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  40180f:	c3                   	ret    
			testbyte(7);
  401810:	48 29 f7             	sub    rdi,rsi
  401813:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  401817:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000401820 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  401820:	f3 0f 1e fa          	endbr64 
  401824:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401826:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  40182d:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  40182e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  401835:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401836:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401839:	48 c1 fd 03          	sar    rbp,0x3
  40183d:	74 16                	je     401855 <__libc_init_array+0x35>
  40183f:	31 db                	xor    ebx,ebx
  401841:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  401848:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  40184c:	48 83 c3 01          	add    rbx,0x1
  401850:	48 39 dd             	cmp    rbp,rbx
  401853:	75 f3                	jne    401848 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  401855:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40185c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401863:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401866:	48 c1 fd 03          	sar    rbp,0x3
  40186a:	74 11                	je     40187d <__libc_init_array+0x5d>
  40186c:	31 db                	xor    ebx,ebx
  40186e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401870:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401874:	48 83 c3 01          	add    rbx,0x1
  401878:	48 39 dd             	cmp    rbp,rbx
  40187b:	75 f3                	jne    401870 <__libc_init_array+0x50>
	}
}
  40187d:	5b                   	pop    rbx
  40187e:	5d                   	pop    rbp
  40187f:	41 5c                	pop    r12
  401881:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401890 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401890:	f3 0f 1e fa          	endbr64 
  401894:	55                   	push   rbp
  401895:	53                   	push   rbx
  401896:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  40189a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  4018a1:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  4018a8:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  4018ab:	48 c1 fb 03          	sar    rbx,0x3
  4018af:	74 14                	je     4018c5 <__libc_fini_array+0x35>
  4018b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  4018b8:	48 83 eb 01          	sub    rbx,0x1
  4018bc:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  4018c0:	48 85 db             	test   rbx,rbx
  4018c3:	75 f3                	jne    4018b8 <__libc_fini_array+0x28>
	}
}
  4018c5:	48 83 c4 08          	add    rsp,0x8
  4018c9:	5b                   	pop    rbx
  4018ca:	5d                   	pop    rbp
  4018cb:	c3                   	ret    

Disassembly of section .text.CRTStartup:

00000000004018d0 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  4018d0:	f3 0f 1e fa          	endbr64 
  4018d4:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  4018d8:	48 c7 c7 c6 57 40 00 	mov    rdi,0x4057c6
  4018df:	48 c7 c2 cc 57 40 00 	mov    rdx,0x4057cc
  4018e6:	31 f6                	xor    esi,esi
  4018e8:	48 29 fa             	sub    rdx,rdi
  4018eb:	e8 40 fd ff ff       	call   401630 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  4018f0:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  4018f4:	e9 27 ff ff ff       	jmp    401820 <__libc_init_array>

Disassembly of section .text.entry:

0000000000401900 <entry>:
{
  401900:	f3 0f 1e fa          	endbr64 
  401904:	41 54                	push   r12
  401906:	49 89 f4             	mov    r12,rsi
  401909:	55                   	push   rbp
  40190a:	89 fd                	mov    ebp,edi
  40190c:	53                   	push   rbx
  40190d:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  401910:	e8 bb ff ff ff       	call   4018d0 <CRTStartup>
	environ = _environ;
  401915:	48 c7 c0 d0 57 40 00 	mov    rax,0x4057d0
	__heap_base = sbrk(0);
  40191c:	31 ff                	xor    edi,edi
	environ = _environ;
  40191e:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  401921:	31 c0                	xor    eax,eax
  401923:	e8 58 f8 ff ff       	call   401180 <sbrk>
  401928:	48 c7 c2 50 58 40 00 	mov    rdx,0x405850
	return main(argc, argv);
  40192f:	4c 89 e6             	mov    rsi,r12
  401932:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401934:	89 02                	mov    DWORD PTR [rdx],eax
}
  401936:	5b                   	pop    rbx
  401937:	5d                   	pop    rbp
  401938:	41 5c                	pop    r12
	return main(argc, argv);
  40193a:	e9 fc e6 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

0000000000401940 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401940:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401945:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401950 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401950:	e8 eb ff ff ff       	call   401940 <get_bit_access>
  401955:	48 c1 e8 3f          	shr    rax,0x3f
}
  401959:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401960 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401960:	48 89 f8             	mov    rax,rdi
  401963:	48 c1 e8 34          	shr    rax,0x34
  401967:	25 ff 07 00 00       	and    eax,0x7ff
  40196c:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401971:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401980 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401980:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401983:	8d 50 01             	lea    edx,[rax+0x1]
  401986:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401989:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  40198c:	73 22                	jae    4019b0 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  40198e:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401991:	48 85 d2             	test   rdx,rdx
  401994:	74 12                	je     4019a8 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401996:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  40199a:	40 0f be fe          	movsx  edi,sil
  40199e:	4c 89 c6             	mov    rsi,r8
  4019a1:	ff e2                	jmp    rdx
  4019a3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  4019a8:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  4019ac:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  4019b0:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

00000000004019c0 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  4019c0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  4019c4:	74 0a                	je     4019d0 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  4019c6:	c3                   	ret    
  4019c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4019ce:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  4019d0:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  4019d3:	85 d2                	test   edx,edx
  4019d5:	74 ef                	je     4019c6 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  4019d7:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  4019db:	48 85 c9             	test   rcx,rcx
  4019de:	74 e6                	je     4019c6 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  4019e0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  4019e3:	8d 72 ff             	lea    esi,[rdx-0x1]
  4019e6:	39 c2                	cmp    edx,eax
  4019e8:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  4019ec:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  4019f0:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401a00 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401a00:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401a07:	48 89 f8             	mov    rax,rdi
  return gadget;
  401a0a:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401a11:	00 
  401a12:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401a19:	00 
  401a1a:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401a21:	00 
}
  401a22:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401a30 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401a30:	48 83 ec 28          	sub    rsp,0x28
  401a34:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401a37:	48 89 e7             	mov    rdi,rsp
  401a3a:	e8 c1 ff ff ff       	call   401a00 <discarding_gadget>
  401a3f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401a44:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401a48:	48 85 f6             	test   rsi,rsi
  401a4b:	74 33                	je     401a80 <buffer_gadget+0x50>
  401a4d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401a52:	48 39 c2             	cmp    rdx,rax
  401a55:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401a59:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401a5d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401a62:	4c 89 c0             	mov    rax,r8
  return result;
  401a65:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401a6a:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401a70:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401a74:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401a79:	48 83 c4 28          	add    rsp,0x28
  401a7d:	c3                   	ret    
  401a7e:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401a80:	48 89 ce             	mov    rsi,rcx
  401a83:	eb d4                	jmp    401a59 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401a90 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401a90:	48 83 ec 28          	sub    rsp,0x28
  401a94:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401a97:	48 89 e7             	mov    rdi,rsp
  401a9a:	e8 61 ff ff ff       	call   401a00 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401a9f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401aa3:	4c 89 c0             	mov    rax,r8
  return result;
  401aa6:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401aab:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401ab0:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401ab7:	7f 
  401ab8:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401abe:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401ac2:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401ac7:	48 83 c4 28          	add    rsp,0x28
  401acb:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401ad0 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401ad0:	48 83 ec 08          	sub    rsp,0x8
  401ad4:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401ad7:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 4022c0 <putchar_wrapper>
  401ade:	31 d2                	xor    edx,edx
  401ae0:	e8 ab ff ff ff       	call   401a90 <function_gadget>
}
  401ae5:	4c 89 c8             	mov    rax,r9
  401ae8:	48 83 c4 08          	add    rsp,0x8
  401aec:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401af0 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401af0:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401af3:	74 33                	je     401b28 <strnlen_s_+0x38>
  401af5:	85 f6                	test   esi,esi
  401af7:	74 2f                	je     401b28 <strnlen_s_+0x38>
  401af9:	89 f6                	mov    esi,esi
  401afb:	48 89 f8             	mov    rax,rdi
  401afe:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401b02:	eb 09                	jmp    401b0d <strnlen_s_+0x1d>
  401b04:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401b08:	48 39 c2             	cmp    rdx,rax
  401b0b:	74 13                	je     401b20 <strnlen_s_+0x30>
  401b0d:	48 83 c0 01          	add    rax,0x1
  401b11:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401b14:	75 f2                	jne    401b08 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401b16:	29 f8                	sub    eax,edi
  401b18:	c3                   	ret    
  401b19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401b20:	89 d0                	mov    eax,edx
  401b22:	29 f8                	sub    eax,edi
  401b24:	c3                   	ret    
  401b25:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401b28:	31 c0                	xor    eax,eax
}
  401b2a:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401b30 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401b30:	83 ef 30             	sub    edi,0x30
  401b33:	40 80 ff 09          	cmp    dil,0x9
  401b37:	0f 96 c0             	setbe  al
}
  401b3a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401b40 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401b40:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401b43:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401b46:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401b49:	eb 19                	jmp    401b64 <atou_+0x24>
  401b4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401b50:	48 83 c2 01          	add    rdx,0x1
  401b54:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401b58:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401b5b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401b5f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401b64:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401b67:	e8 c4 ff ff ff       	call   401b30 <is_digit_>
  401b6c:	84 c0                	test   al,al
  401b6e:	75 e0                	jne    401b50 <atou_+0x10>
  }
  return i;
}
  401b70:	44 89 c0             	mov    eax,r8d
  401b73:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401b80 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401b80:	41 57                	push   r15
  401b82:	44 89 c0             	mov    eax,r8d
  401b85:	49 89 ff             	mov    r15,rdi
  401b88:	41 56                	push   r14
  401b8a:	41 55                	push   r13
  401b8c:	41 89 d5             	mov    r13d,edx
  401b8f:	41 54                	push   r12
  401b91:	49 89 f4             	mov    r12,rsi
  401b94:	55                   	push   rbp
  401b95:	89 cd                	mov    ebp,ecx
  401b97:	53                   	push   rbx
  401b98:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401b9c:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401ba0:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401ba5:	a8 03                	test   al,0x3
  401ba7:	75 1b                	jne    401bc4 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401ba9:	39 ca                	cmp    edx,ecx
  401bab:	73 17                	jae    401bc4 <out_rev_+0x44>
  401bad:	89 d3                	mov    ebx,edx
  401baf:	90                   	nop
      putchar_via_gadget(output, ' ');
  401bb0:	be 20 00 00 00       	mov    esi,0x20
  401bb5:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401bb8:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401bbb:	e8 c0 fd ff ff       	call   401980 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401bc0:	39 dd                	cmp    ebp,ebx
  401bc2:	75 ec                	jne    401bb0 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401bc4:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401bc8:	4c 01 e3             	add    rbx,r12
  401bcb:	45 85 ed             	test   r13d,r13d
  401bce:	74 17                	je     401be7 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401bd0:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401bd3:	4c 89 ff             	mov    rdi,r15
  401bd6:	e8 a5 fd ff ff       	call   401980 <putchar_via_gadget>
  while (len) {
  401bdb:	48 89 da             	mov    rdx,rbx
  401bde:	48 83 eb 01          	sub    rbx,0x1
  401be2:	49 39 d4             	cmp    r12,rdx
  401be5:	75 e9                	jne    401bd0 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401be7:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401bec:	74 2a                	je     401c18 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401bee:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401bf2:	44 29 f2             	sub    edx,r14d
  401bf5:	39 d5                	cmp    ebp,edx
  401bf7:	76 1f                	jbe    401c18 <out_rev_+0x98>
  401bf9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401c00:	be 20 00 00 00       	mov    esi,0x20
  401c05:	4c 89 ff             	mov    rdi,r15
  401c08:	e8 73 fd ff ff       	call   401980 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401c0d:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401c11:	44 29 f2             	sub    edx,r14d
  401c14:	39 ea                	cmp    edx,ebp
  401c16:	72 e8                	jb     401c00 <out_rev_+0x80>
    }
  }
}
  401c18:	48 83 c4 18          	add    rsp,0x18
  401c1c:	5b                   	pop    rbx
  401c1d:	5d                   	pop    rbp
  401c1e:	41 5c                	pop    r12
  401c20:	41 5d                	pop    r13
  401c22:	41 5e                	pop    r14
  401c24:	41 5f                	pop    r15
  401c26:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401c30 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401c30:	55                   	push   rbp
  401c31:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c34:	83 fa 1f             	cmp    edx,0x1f
{
  401c37:	49 89 f3             	mov    r11,rsi
  401c3a:	53                   	push   rbx
  401c3b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401c40:	89 d6                	mov    esi,edx
  401c42:	89 cb                	mov    ebx,ecx
  401c44:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c49:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401c4c:	41 f6 c0 02          	test   r8b,0x2
  401c50:	0f 85 fa 00 00 00    	jne    401d50 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401c56:	44 89 c2             	mov    edx,r8d
  401c59:	83 e2 01             	and    edx,0x1
  401c5c:	45 85 d2             	test   r10d,r10d
  401c5f:	0f 84 eb 00 00 00    	je     401d50 <print_integer_finalization+0x120>
  401c65:	85 d2                	test   edx,edx
  401c67:	0f 84 e3 00 00 00    	je     401d50 <print_integer_finalization+0x120>
  401c6d:	84 c9                	test   cl,cl
  401c6f:	0f 85 cb 01 00 00    	jne    401e40 <print_integer_finalization+0x210>
  401c75:	41 f6 c0 0c          	test   r8b,0xc
  401c79:	0f 85 c1 01 00 00    	jne    401e40 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401c7f:	44 39 d6             	cmp    esi,r10d
  401c82:	0f 83 c8 00 00 00    	jae    401d50 <print_integer_finalization+0x120>
  401c88:	84 c0                	test   al,al
  401c8a:	0f 84 c0 00 00 00    	je     401d50 <print_integer_finalization+0x120>
  401c90:	89 f0                	mov    eax,esi
  401c92:	89 f2                	mov    edx,esi
  401c94:	4c 01 d8             	add    rax,r11
  401c97:	eb 0b                	jmp    401ca4 <print_integer_finalization+0x74>
  401c99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401ca0:	84 c9                	test   cl,cl
  401ca2:	74 15                	je     401cb9 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401ca4:	83 c2 01             	add    edx,0x1
  401ca7:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401caa:	83 fa 1f             	cmp    edx,0x1f
  401cad:	0f 96 c1             	setbe  cl
  401cb0:	48 83 c0 01          	add    rax,0x1
  401cb4:	44 39 d2             	cmp    edx,r10d
  401cb7:	72 e7                	jb     401ca0 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cb9:	44 39 ca             	cmp    edx,r9d
  401cbc:	73 26                	jae    401ce4 <print_integer_finalization+0xb4>
  401cbe:	84 c9                	test   cl,cl
  401cc0:	74 22                	je     401ce4 <print_integer_finalization+0xb4>
  401cc2:	89 d0                	mov    eax,edx
  401cc4:	4c 01 d8             	add    rax,r11
  401cc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401cce:	00 00 
      buf[len++] = '0';
  401cd0:	83 c2 01             	add    edx,0x1
  401cd3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cd6:	48 83 c0 01          	add    rax,0x1
  401cda:	41 39 d1             	cmp    r9d,edx
  401cdd:	76 05                	jbe    401ce4 <print_integer_finalization+0xb4>
  401cdf:	83 fa 1f             	cmp    edx,0x1f
  401ce2:	76 ec                	jbe    401cd0 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401ce4:	39 d6                	cmp    esi,edx
  401ce6:	0f 92 c0             	setb   al
  401ce9:	40 80 fd 08          	cmp    bpl,0x8
  401ced:	0f 94 c1             	sete   cl
  401cf0:	20 c1                	and    cl,al
  401cf2:	74 06                	je     401cfa <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401cf4:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401cf8:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401cfa:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401d01:	0f 84 8c 00 00 00    	je     401d93 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401d07:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401d0e:	74 58                	je     401d68 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d10:	83 fa 1f             	cmp    edx,0x1f
  401d13:	0f 96 c0             	setbe  al
  401d16:	40 80 fd 10          	cmp    bpl,0x10
  401d1a:	0f 84 30 01 00 00    	je     401e50 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d20:	40 80 fd 02          	cmp    bpl,0x2
  401d24:	75 0e                	jne    401d34 <print_integer_finalization+0x104>
  401d26:	84 c0                	test   al,al
  401d28:	74 0a                	je     401d34 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401d2a:	89 d0                	mov    eax,edx
  401d2c:	83 c2 01             	add    edx,0x1
  401d2f:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401d34:	83 fa 20             	cmp    edx,0x20
  401d37:	75 50                	jne    401d89 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401d39:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401d3a:	44 89 d1             	mov    ecx,r10d
  401d3d:	4c 89 de             	mov    rsi,r11
}
  401d40:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401d41:	e9 3a fe ff ff       	jmp    401b80 <out_rev_>
  401d46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401d4d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d50:	44 39 ce             	cmp    esi,r9d
  401d53:	89 f2                	mov    edx,esi
  401d55:	0f 92 c1             	setb   cl
  401d58:	20 c8                	and    al,cl
  401d5a:	0f 85 62 ff ff ff    	jne    401cc2 <print_integer_finalization+0x92>
  401d60:	eb 98                	jmp    401cfa <print_integer_finalization+0xca>
  401d62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401d68:	85 d2                	test   edx,edx
  401d6a:	75 74                	jne    401de0 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d6c:	40 80 fd 10          	cmp    bpl,0x10
  401d70:	0f 84 05 01 00 00    	je     401e7b <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d76:	40 80 fd 02          	cmp    bpl,0x2
  401d7a:	0f 85 2e 01 00 00    	jne    401eae <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401d80:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401d84:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401d89:	89 d0                	mov    eax,edx
  401d8b:	83 c2 01             	add    edx,0x1
  401d8e:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401d93:	83 fa 20             	cmp    edx,0x20
  401d96:	74 a1                	je     401d39 <print_integer_finalization+0x109>
    if (negative) {
  401d98:	84 db                	test   bl,bl
  401d9a:	74 1c                	je     401db8 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401d9c:	89 d0                	mov    eax,edx
}
  401d9e:	5b                   	pop    rbx
      buf[len++] = '-';
  401d9f:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401da2:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401da5:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401daa:	4c 89 de             	mov    rsi,r11
}
  401dad:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401dae:	e9 cd fd ff ff       	jmp    401b80 <out_rev_>
  401db3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401db8:	41 f6 c0 04          	test   r8b,0x4
  401dbc:	75 62                	jne    401e20 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401dbe:	41 f6 c0 08          	test   r8b,0x8
  401dc2:	0f 84 71 ff ff ff    	je     401d39 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401dc8:	89 d0                	mov    eax,edx
  401dca:	83 c2 01             	add    edx,0x1
  401dcd:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  401dd2:	e9 62 ff ff ff       	jmp    401d39 <print_integer_finalization+0x109>
  401dd7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401dde:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401de0:	41 39 d1             	cmp    r9d,edx
  401de3:	74 09                	je     401dee <print_integer_finalization+0x1be>
  401de5:	44 39 d2             	cmp    edx,r10d
  401de8:	0f 85 22 ff ff ff    	jne    401d10 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  401dee:	84 c0                	test   al,al
  401df0:	0f 85 99 00 00 00    	jne    401e8f <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401df6:	40 80 fd 10          	cmp    bpl,0x10
  401dfa:	0f 94 c0             	sete   al
  401dfd:	40 80 fd 02          	cmp    bpl,0x2
  401e01:	0f 94 c1             	sete   cl
  401e04:	08 c8                	or     al,cl
  401e06:	0f 84 04 ff ff ff    	je     401d10 <print_integer_finalization+0xe0>
  401e0c:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  401e0e:	83 da 00             	sbb    edx,0x0
  401e11:	e9 fa fe ff ff       	jmp    401d10 <print_integer_finalization+0xe0>
  401e16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401e1d:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e20:	89 d0                	mov    eax,edx
}
  401e22:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e23:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401e26:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  401e29:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  401e2e:	4c 89 de             	mov    rsi,r11
}
  401e31:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401e32:	e9 49 fd ff ff       	jmp    401b80 <out_rev_>
  401e37:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401e3e:	00 00 
        width--;
  401e40:	41 83 ea 01          	sub    r10d,0x1
  401e44:	e9 36 fe ff ff       	jmp    401c7f <print_integer_finalization+0x4f>
  401e49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e50:	44 89 c1             	mov    ecx,r8d
  401e53:	83 e1 20             	and    ecx,0x20
  401e56:	75 0c                	jne    401e64 <print_integer_finalization+0x234>
  401e58:	84 c0                	test   al,al
  401e5a:	75 60                	jne    401ebc <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e5c:	85 c9                	test   ecx,ecx
  401e5e:	0f 84 d0 fe ff ff    	je     401d34 <print_integer_finalization+0x104>
  401e64:	84 c0                	test   al,al
  401e66:	0f 84 c8 fe ff ff    	je     401d34 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401e6c:	89 d0                	mov    eax,edx
  401e6e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  401e71:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  401e76:	e9 b9 fe ff ff       	jmp    401d34 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e7b:	41 f6 c0 20          	test   r8b,0x20
  401e7f:	75 1f                	jne    401ea0 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  401e81:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  401e85:	ba 01 00 00 00       	mov    edx,0x1
  401e8a:	e9 fa fe ff ff       	jmp    401d89 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401e8f:	83 ea 01             	sub    edx,0x1
  401e92:	0f 84 d4 fe ff ff    	je     401d6c <print_integer_finalization+0x13c>
  401e98:	e9 59 ff ff ff       	jmp    401df6 <print_integer_finalization+0x1c6>
  401e9d:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  401ea0:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  401ea4:	ba 01 00 00 00       	mov    edx,0x1
  401ea9:	e9 db fe ff ff       	jmp    401d89 <print_integer_finalization+0x159>
      buf[len++] = '0';
  401eae:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  401eb2:	ba 01 00 00 00       	mov    edx,0x1
  401eb7:	e9 dc fe ff ff       	jmp    401d98 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  401ebc:	89 d0                	mov    eax,edx
  401ebe:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  401ec1:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  401ec6:	e9 69 fe ff ff       	jmp    401d34 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000401ed0 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401ed0:	41 57                	push   r15
  401ed2:	41 56                	push   r14
  401ed4:	41 55                	push   r13
  401ed6:	41 89 cd             	mov    r13d,ecx
  401ed9:	41 54                	push   r12
  401edb:	49 89 fc             	mov    r12,rdi
  401ede:	55                   	push   rbp
  401edf:	53                   	push   rbx
  401ee0:	89 d3                	mov    ebx,edx
  401ee2:	48 83 ec 28          	sub    rsp,0x28
  401ee6:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  401eeb:	48 85 f6             	test   rsi,rsi
  401eee:	75 48                	jne    401f38 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  401ef0:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  401ef7:	0f 85 a3 00 00 00    	jne    401fa0 <print_integer+0xd0>
      buf[len++] = '0';
  401efd:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  401f01:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  401f05:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  401f0a:	48 89 e6             	mov    rsi,rsp
  401f0d:	41 56                	push   r14
  401f0f:	0f b6 cb             	movzx  ecx,bl
  401f12:	4c 89 e7             	mov    rdi,r12
  401f15:	41 51                	push   r9
  401f17:	45 89 c1             	mov    r9d,r8d
  401f1a:	45 0f b6 c5          	movzx  r8d,r13b
  401f1e:	e8 0d fd ff ff       	call   401c30 <print_integer_finalization>
}
  401f23:	48 83 c4 38          	add    rsp,0x38
  401f27:	5b                   	pop    rbx
  401f28:	5d                   	pop    rbp
  401f29:	41 5c                	pop    r12
  401f2b:	41 5d                	pop    r13
  401f2d:	41 5e                	pop    r14
  401f2f:	41 5f                	pop    r15
  401f31:	c3                   	ret    
  401f32:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f38:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  401f3b:	44 0f b6 d1          	movzx  r10d,cl
  401f3f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  401f44:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f49:	83 e0 20             	and    eax,0x20
  401f4c:	83 f8 01             	cmp    eax,0x1
  401f4f:	45 19 db             	sbb    r11d,r11d
  401f52:	41 83 e3 20          	and    r11d,0x20
  401f56:	41 83 c3 37          	add    r11d,0x37
  401f5a:	eb 07                	jmp    401f63 <print_integer+0x93>
  401f5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  401f60:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  401f63:	31 d2                	xor    edx,edx
  401f65:	48 89 f0             	mov    rax,rsi
  401f68:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401f6b:	48 83 fa 09          	cmp    rdx,0x9
  401f6f:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  401f73:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  401f77:	89 ca                	mov    edx,ecx
  401f79:	41 0f 46 ff          	cmovbe edi,r15d
  401f7d:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  401f82:	48 83 c1 01          	add    rcx,0x1
  401f86:	4c 39 d6             	cmp    rsi,r10
  401f89:	0f 82 7b ff ff ff    	jb     401f0a <print_integer+0x3a>
  401f8f:	83 fa 1f             	cmp    edx,0x1f
  401f92:	76 cc                	jbe    401f60 <print_integer+0x90>
  401f94:	e9 71 ff ff ff       	jmp    401f0a <print_integer+0x3a>
  401f99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  401fa0:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  401fa3:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  401fa5:	41 83 e6 ef          	and    r14d,0xffffffef
  401fa9:	80 f9 10             	cmp    cl,0x10
  401fac:	44 0f 45 f0          	cmovne r14d,eax
  401fb0:	e9 55 ff ff ff       	jmp    401f0a <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000401fc0 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  401fc0:	e8 8b f9 ff ff       	call   401950 <get_sign_bit>
{
  401fc5:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  401fc8:	85 c0                	test   eax,eax
  401fca:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  401fcd:	74 08                	je     401fd7 <get_components+0x17>
  401fcf:	66 0f 57 05 d9 34 00 	xorpd  xmm0,XMMWORD PTR [rip+0x34d9]        # 4054b0 <powers_of_10+0x90>
  401fd6:	00 
  number_.integral = (int_fast64_t)abs_number;
  401fd7:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401fdc:	66 0f ef d2          	pxor   xmm2,xmm2
  401fe0:	66 0f 28 c8          	movapd xmm1,xmm0
  401fe4:	89 f0                	mov    eax,esi
  401fe6:	48 8d 3d 33 34 00 00 	lea    rdi,[rip+0x3433]        # 405420 <powers_of_10>
  401fed:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  401ff2:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  401ff7:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  401ffb:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  401fff:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  402003:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  402008:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  40200d:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  402011:	f2 0f 10 15 a7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34a7]        # 4054c0 <powers_of_10+0xa0>
  402018:	00 
  402019:	66 0f 2f ca          	comisd xmm1,xmm2
  40201d:	76 51                	jbe    402070 <get_components+0xb0>
    ++number_.fractional;
  40201f:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  402023:	66 0f ef c9          	pxor   xmm1,xmm1
  402027:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  40202c:	66 0f 2f cb          	comisd xmm1,xmm3
  402030:	73 56                	jae    402088 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  402032:	85 f6                	test   esi,esi
  402034:	75 27                	jne    40205d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  402036:	66 0f ef c9          	pxor   xmm1,xmm1
  40203a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40203f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  402043:	66 0f 2f d0          	comisd xmm2,xmm0
  402047:	76 06                	jbe    40204f <get_components+0x8f>
  402049:	66 0f 2f c2          	comisd xmm0,xmm2
  40204d:	76 0e                	jbe    40205d <get_components+0x9d>
  40204f:	48 89 d6             	mov    rsi,rdx
  402052:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  402055:	48 83 fe 01          	cmp    rsi,0x1
  402059:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40205d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  402061:	4c 89 c0             	mov    rax,r8
  return number_;
  402064:	49 89 10             	mov    QWORD PTR [r8],rdx
  402067:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  40206b:	c3                   	ret    
  40206c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402070:	66 0f 2e ca          	ucomisd xmm1,xmm2
  402074:	7a bc                	jp     402032 <get_components+0x72>
  402076:	75 ba                	jne    402032 <get_components+0x72>
  402078:	48 85 c0             	test   rax,rax
  40207b:	75 13                	jne    402090 <get_components+0xd0>
    ++number_.fractional;
  40207d:	48 83 c0 01          	add    rax,0x1
  402081:	eb af                	jmp    402032 <get_components+0x72>
  402083:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  402088:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  40208c:	31 c0                	xor    eax,eax
  40208e:	eb a2                	jmp    402032 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402090:	a8 01                	test   al,0x1
  402092:	74 9e                	je     402032 <get_components+0x72>
  402094:	eb e7                	jmp    40207d <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

00000000004020a0 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  4020a0:	66 0f 2f 05 10 34 00 	comisd xmm0,QWORD PTR [rip+0x3410]        # 4054b8 <powers_of_10+0x98>
  4020a7:	00 
  4020a8:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  4020ac:	73 10                	jae    4020be <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  4020ae:	66 0f ef c9          	pxor   xmm1,xmm1
  4020b2:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4020b6:	66 0f 2e c8          	ucomisd xmm1,xmm0
  4020ba:	7a 04                	jp     4020c0 <bastardized_floor+0x20>
  4020bc:	75 02                	jne    4020c0 <bastardized_floor+0x20>
}
  4020be:	c3                   	ret    
  4020bf:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  4020c0:	83 e8 01             	sub    eax,0x1
}
  4020c3:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

00000000004020d0 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  4020d0:	e8 6b f8 ff ff       	call   401940 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020d5:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  4020dc:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  4020df:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  4020e2:	48 89 c7             	mov    rdi,rax
  4020e5:	e8 76 f8 ff ff       	call   401960 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020ea:	48 21 ca             	and    rdx,rcx
  4020ed:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  4020f4:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4020f7:	f2 0f 10 1d e1 33 00 	movsd  xmm3,QWORD PTR [rip+0x33e1]        # 4054e0 <powers_of_10+0xc0>
  4020fe:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4020ff:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402102:	f2 0f 10 05 c6 33 00 	movsd  xmm0,QWORD PTR [rip+0x33c6]        # 4054d0 <powers_of_10+0xb0>
  402109:	00 
  double z = (dwba.F - 1.5);
  40210a:	66 48 0f 6e ca       	movq   xmm1,rdx
  40210f:	f2 0f 5c 0d b1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33b1]        # 4054c8 <powers_of_10+0xa8>
  402116:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402117:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40211b:	66 0f 28 d1          	movapd xmm2,xmm1
  40211f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402123:	f2 0f 58 05 ad 33 00 	addsd  xmm0,QWORD PTR [rip+0x33ad]        # 4054d8 <powers_of_10+0xb8>
  40212a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40212b:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40212f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402133:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  402137:	f2 0f 59 15 a9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33a9]        # 4054e8 <powers_of_10+0xc8>
  40213e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40213f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402143:	f2 0f 59 0d a5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33a5]        # 4054f0 <powers_of_10+0xd0>
  40214a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40214b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40214f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402153:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  402157:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

0000000000402160 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  402160:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  402166:	0f 84 b4 00 00 00    	je     402220 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  40216c:	66 0f ef d2          	pxor   xmm2,xmm2
  402170:	f2 0f 10 05 88 33 00 	movsd  xmm0,QWORD PTR [rip+0x3388]        # 405500 <powers_of_10+0xe0>
  402177:	00 
  402178:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  40217c:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  402180:	f2 0f 58 05 38 33 00 	addsd  xmm0,QWORD PTR [rip+0x3338]        # 4054c0 <powers_of_10+0xa0>
  402187:	00 
  402188:	e8 13 ff ff ff       	call   4020a0 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40218d:	f2 0f 10 0d 73 33 00 	movsd  xmm1,QWORD PTR [rip+0x3373]        # 405508 <powers_of_10+0xe8>
  402194:	00 
  402195:	66 0f ef c0          	pxor   xmm0,xmm0
  402199:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  40219d:	f2 0f 59 05 6b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x336b]        # 405510 <powers_of_10+0xf0>
  4021a4:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4021a5:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4021a7:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4021ab:	48 05 ff 03 00 00    	add    rax,0x3ff
  4021b1:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021b5:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4021ba:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  4021be:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021c2:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  4021c6:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4021ca:	f2 0f 58 c1          	addsd  xmm0,xmm1
  4021ce:	66 0f 28 e2          	movapd xmm4,xmm2
  4021d2:	f2 0f 5e 25 3e 33 00 	divsd  xmm4,QWORD PTR [rip+0x333e]        # 405518 <powers_of_10+0xf8>
  4021d9:	00 
  4021da:	66 0f 28 da          	movapd xmm3,xmm2
  4021de:	f2 0f 58 25 3a 33 00 	addsd  xmm4,QWORD PTR [rip+0x333a]        # 405520 <powers_of_10+0x100>
  4021e5:	00 
  4021e6:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4021ea:	f2 0f 58 1d 36 33 00 	addsd  xmm3,QWORD PTR [rip+0x3336]        # 405528 <powers_of_10+0x108>
  4021f1:	00 
  4021f2:	f2 0f 5e d3          	divsd  xmm2,xmm3
  4021f6:	f2 0f 10 1d 32 33 00 	movsd  xmm3,QWORD PTR [rip+0x3332]        # 405530 <powers_of_10+0x110>
  4021fd:	00 
  4021fe:	f2 0f 5c d9          	subsd  xmm3,xmm1
  402202:	f2 0f 58 d3          	addsd  xmm2,xmm3
  402206:	f2 0f 5e c2          	divsd  xmm0,xmm2
  40220a:	f2 0f 58 05 26 33 00 	addsd  xmm0,QWORD PTR [rip+0x3326]        # 405538 <powers_of_10+0x118>
  402211:	00 
  402212:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  402216:	c3                   	ret    
  402217:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40221e:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  402220:	f2 0f 10 05 d0 32 00 	movsd  xmm0,QWORD PTR [rip+0x32d0]        # 4054f8 <powers_of_10+0xd8>
  402227:	00 
}
  402228:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000402230 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  402230:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  402233:	48 8d 0d e6 2f 00 00 	lea    rcx,[rip+0x2fe6]        # 405220 <memcpy+0xd70>
  40223a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402240:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  402243:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  402246:	83 e8 20             	sub    eax,0x20
  402249:	3c 10                	cmp    al,0x10
  40224b:	77 13                	ja     402260 <parse_flags+0x30>
  40224d:	0f b6 c0             	movzx  eax,al
  402250:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402254:	48 01 c8             	add    rax,rcx
  402257:	3e ff e0             	notrack jmp rax
  40225a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  402260:	44 89 c0             	mov    eax,r8d
  402263:	c3                   	ret    
  402264:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  402268:	41 83 c8 01          	or     r8d,0x1
  40226c:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402270:	48 89 17             	mov    QWORD PTR [rdi],rdx
  402273:	eb cb                	jmp    402240 <parse_flags+0x10>
  402275:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  402278:	41 83 c8 02          	or     r8d,0x2
  40227c:	48 83 c2 01          	add    rdx,0x1
  402280:	eb ee                	jmp    402270 <parse_flags+0x40>
  402282:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402288:	41 83 c8 04          	or     r8d,0x4
  40228c:	48 83 c2 01          	add    rdx,0x1
  402290:	eb de                	jmp    402270 <parse_flags+0x40>
  402292:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  402298:	41 83 c8 10          	or     r8d,0x10
  40229c:	48 83 c2 01          	add    rdx,0x1
  4022a0:	eb ce                	jmp    402270 <parse_flags+0x40>
  4022a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  4022a8:	41 83 c8 08          	or     r8d,0x8
  4022ac:	48 83 c2 01          	add    rdx,0x1
  4022b0:	eb be                	jmp    402270 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

00000000004022c0 <putchar_wrapper>:
{
  4022c0:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  4022c4:	40 0f be ff          	movsx  edi,dil
  4022c8:	e9 e3 18 00 00       	jmp    403bb0 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

00000000004022d0 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  4022d0:	41 56                	push   r14
  4022d2:	49 89 ca             	mov    r10,rcx
  4022d5:	41 89 d3             	mov    r11d,edx
  4022d8:	41 55                	push   r13
  4022da:	45 89 c5             	mov    r13d,r8d
  4022dd:	41 54                	push   r12
  4022df:	55                   	push   rbp
  4022e0:	53                   	push   rbx
  4022e1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  4022e6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  4022eb:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  4022ef:	45 85 ed             	test   r13d,r13d
  4022f2:	0f 84 90 00 00 00    	je     402388 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4022f8:	44 89 c0             	mov    eax,r8d
  4022fb:	25 10 10 00 00       	and    eax,0x1010
  402300:	3d 00 10 00 00       	cmp    eax,0x1000
  402305:	0f 84 05 02 00 00    	je     402510 <print_broken_up_decimal.isra.0+0x240>
  40230b:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  40230e:	89 cb                	mov    ebx,ecx
  402310:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402315:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40231c:	66 66 66 
  40231f:	49 01 ec             	add    r12,rbp
  402322:	eb 43                	jmp    402367 <print_broken_up_decimal.isra.0+0x97>
  402324:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402328:	48 89 f0             	mov    rax,rsi
  40232b:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  40232e:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402332:	49 f7 ed             	imul   r13
  402335:	48 89 f0             	mov    rax,rsi
  402338:	41 29 de             	sub    r14d,ebx
  40233b:	83 c3 01             	add    ebx,0x1
  40233e:	48 c1 f8 3f          	sar    rax,0x3f
  402342:	48 c1 fa 02          	sar    rdx,0x2
  402346:	48 29 c2             	sub    rdx,rax
  402349:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40234d:	48 01 c0             	add    rax,rax
  402350:	48 29 c6             	sub    rsi,rax
  402353:	83 c6 30             	add    esi,0x30
  402356:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40235b:	48 89 d6             	mov    rsi,rdx
  40235e:	48 85 d2             	test   rdx,rdx
  402361:	0f 84 f9 00 00 00    	je     402460 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402367:	83 fb 20             	cmp    ebx,0x20
  40236a:	75 bc                	jne    402328 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  40236c:	44 89 c0             	mov    eax,r8d
  40236f:	83 e0 03             	and    eax,0x3
  402372:	83 f8 01             	cmp    eax,0x1
  402375:	0f 84 35 01 00 00    	je     4024b0 <print_broken_up_decimal.isra.0+0x1e0>
  40237b:	ba 20 00 00 00       	mov    edx,0x20
  402380:	e9 7d 00 00 00       	jmp    402402 <print_broken_up_decimal.isra.0+0x132>
  402385:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402388:	41 f6 c0 10          	test   r8b,0x10
  40238c:	0f 85 8e 00 00 00    	jne    402420 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  402392:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  402399:	66 66 66 
  40239c:	89 ce                	mov    esi,ecx
  40239e:	48 01 ee             	add    rsi,rbp
  4023a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4023a8:	83 f9 20             	cmp    ecx,0x20
  4023ab:	74 bf                	je     40236c <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4023ad:	48 89 f8             	mov    rax,rdi
  4023b0:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  4023b3:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  4023b7:	48 f7 eb             	imul   rbx
  4023ba:	48 89 f8             	mov    rax,rdi
  4023bd:	48 c1 f8 3f          	sar    rax,0x3f
  4023c1:	48 c1 fa 02          	sar    rdx,0x2
  4023c5:	48 29 c2             	sub    rdx,rax
  4023c8:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4023cc:	48 01 c0             	add    rax,rax
  4023cf:	48 29 c7             	sub    rdi,rax
  4023d2:	83 c7 30             	add    edi,0x30
  4023d5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  4023d9:	48 89 d7             	mov    rdi,rdx
  4023dc:	48 85 d2             	test   rdx,rdx
  4023df:	75 c7                	jne    4023a8 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4023e1:	44 89 c0             	mov    eax,r8d
  4023e4:	83 e0 03             	and    eax,0x3
  4023e7:	83 f8 01             	cmp    eax,0x1
  4023ea:	0f 84 b8 01 00 00    	je     4025a8 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4023f0:	83 f9 20             	cmp    ecx,0x20
  4023f3:	74 86                	je     40237b <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  4023f5:	45 84 db             	test   r11b,r11b
  4023f8:	74 46                	je     402440 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  4023fa:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  4023ff:	8d 51 01             	lea    edx,[rcx+0x1]
}
  402402:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  402403:	48 89 ee             	mov    rsi,rbp
  402406:	44 89 c9             	mov    ecx,r9d
}
  402409:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40240a:	4c 89 d7             	mov    rdi,r10
}
  40240d:	41 5c                	pop    r12
  40240f:	41 5d                	pop    r13
  402411:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  402413:	e9 68 f7 ff ff       	jmp    401b80 <out_rev_>
  402418:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40241f:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402420:	83 f9 20             	cmp    ecx,0x20
  402423:	0f 84 43 ff ff ff    	je     40236c <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  402429:	89 c8                	mov    eax,ecx
  40242b:	83 c1 01             	add    ecx,0x1
  40242e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  402433:	e9 5a ff ff ff       	jmp    402392 <print_broken_up_decimal.isra.0+0xc2>
  402438:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40243f:	00 
    else if (flags & FLAGS_PLUS) {
  402440:	41 f6 c0 04          	test   r8b,0x4
  402444:	0f 85 3e 01 00 00    	jne    402588 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40244a:	89 ca                	mov    edx,ecx
  40244c:	41 f6 c0 08          	test   r8b,0x8
  402450:	74 b0                	je     402402 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  402452:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  402457:	83 c2 01             	add    edx,0x1
  40245a:	eb a6                	jmp    402402 <print_broken_up_decimal.isra.0+0x132>
  40245c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402460:	83 fb 1f             	cmp    ebx,0x1f
  402463:	77 13                	ja     402478 <print_broken_up_decimal.isra.0+0x1a8>
  402465:	45 85 f6             	test   r14d,r14d
  402468:	89 d8                	mov    eax,ebx
  40246a:	0f 95 c2             	setne  dl
  40246d:	48 01 e8             	add    rax,rbp
  402470:	84 d2                	test   dl,dl
  402472:	75 20                	jne    402494 <print_broken_up_decimal.isra.0+0x1c4>
  402474:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402478:	83 fb 20             	cmp    ebx,0x20
  40247b:	0f 84 eb fe ff ff    	je     40236c <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  402481:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  402486:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402489:	e9 04 ff ff ff       	jmp    402392 <print_broken_up_decimal.isra.0+0xc2>
  40248e:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402490:	39 ca                	cmp    edx,ecx
  402492:	74 e4                	je     402478 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  402494:	89 da                	mov    edx,ebx
  402496:	83 c3 01             	add    ebx,0x1
  402499:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  40249c:	48 83 c0 01          	add    rax,0x1
  4024a0:	83 fb 1f             	cmp    ebx,0x1f
  4024a3:	76 eb                	jbe    402490 <print_broken_up_decimal.isra.0+0x1c0>
  4024a5:	eb d1                	jmp    402478 <print_broken_up_decimal.isra.0+0x1a8>
  4024a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4024ae:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4024b0:	45 85 c9             	test   r9d,r9d
  4024b3:	0f 84 c2 fe ff ff    	je     40237b <print_broken_up_decimal.isra.0+0xab>
  4024b9:	31 d2                	xor    edx,edx
  4024bb:	b9 20 00 00 00       	mov    ecx,0x20
  4024c0:	45 84 db             	test   r11b,r11b
  4024c3:	0f 85 cf 00 00 00    	jne    402598 <print_broken_up_decimal.isra.0+0x2c8>
  4024c9:	41 f6 c0 0c          	test   r8b,0xc
  4024cd:	0f 85 c5 00 00 00    	jne    402598 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4024d3:	44 39 c9             	cmp    ecx,r9d
  4024d6:	0f 83 14 ff ff ff    	jae    4023f0 <print_broken_up_decimal.isra.0+0x120>
  4024dc:	89 c8                	mov    eax,ecx
  4024de:	48 01 e8             	add    rax,rbp
  4024e1:	84 d2                	test   dl,dl
  4024e3:	0f 84 07 ff ff ff    	je     4023f0 <print_broken_up_decimal.isra.0+0x120>
  4024e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  4024f0:	83 c1 01             	add    ecx,0x1
  4024f3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4024f6:	48 83 c0 01          	add    rax,0x1
  4024fa:	44 39 c9             	cmp    ecx,r9d
  4024fd:	0f 83 ed fe ff ff    	jae    4023f0 <print_broken_up_decimal.isra.0+0x120>
  402503:	83 f9 1f             	cmp    ecx,0x1f
  402506:	76 e8                	jbe    4024f0 <print_broken_up_decimal.isra.0+0x220>
  402508:	e9 e3 fe ff ff       	jmp    4023f0 <print_broken_up_decimal.isra.0+0x120>
  40250d:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402510:	48 85 f6             	test   rsi,rsi
  402513:	0f 8e 79 fe ff ff    	jle    402392 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  402519:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  402520:	cc cc cc 
  402523:	48 89 f0             	mov    rax,rsi
  402526:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  40252d:	99 99 19 
  402530:	48 0f af c3          	imul   rax,rbx
  402534:	48 01 d0             	add    rax,rdx
  402537:	48 d1 c8             	ror    rax,1
  40253a:	48 39 d0             	cmp    rax,rdx
  40253d:	0f 87 c8 fd ff ff    	ja     40230b <print_broken_up_decimal.isra.0+0x3b>
  402543:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  40254a:	99 99 19 
  40254d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  402550:	48 89 f0             	mov    rax,rsi
  402553:	49 89 f4             	mov    r12,rsi
        --count;
  402556:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  40255a:	48 f7 e3             	mul    rbx
  40255d:	48 89 d6             	mov    rsi,rdx
  402560:	48 c1 ee 03          	shr    rsi,0x3
  402564:	48 89 f0             	mov    rax,rsi
  402567:	48 0f af c3          	imul   rax,rbx
  40256b:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  40256e:	4c 39 f0             	cmp    rax,r14
  402571:	76 dd                	jbe    402550 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  402573:	49 83 fc 09          	cmp    r12,0x9
  402577:	0f 8f 8e fd ff ff    	jg     40230b <print_broken_up_decimal.isra.0+0x3b>
  40257d:	e9 10 fe ff ff       	jmp    402392 <print_broken_up_decimal.isra.0+0xc2>
  402582:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  402588:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  40258d:	8d 51 01             	lea    edx,[rcx+0x1]
  402590:	e9 6d fe ff ff       	jmp    402402 <print_broken_up_decimal.isra.0+0x132>
  402595:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  402598:	41 83 e9 01          	sub    r9d,0x1
  40259c:	e9 32 ff ff ff       	jmp    4024d3 <print_broken_up_decimal.isra.0+0x203>
  4025a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4025a8:	45 85 c9             	test   r9d,r9d
  4025ab:	0f 84 3f fe ff ff    	je     4023f0 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4025b1:	83 f9 1f             	cmp    ecx,0x1f
  4025b4:	0f 96 c2             	setbe  dl
  4025b7:	e9 04 ff ff ff       	jmp    4024c0 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

00000000004025c0 <print_decimal_number>:
{
  4025c0:	41 54                	push   r12
  4025c2:	49 89 fb             	mov    r11,rdi
  4025c5:	41 89 f2             	mov    r10d,esi
  4025c8:	4d 89 c4             	mov    r12,r8
  4025cb:	55                   	push   rbp
  4025cc:	89 cd                	mov    ebp,ecx
  4025ce:	53                   	push   rbx
  4025cf:	89 d3                	mov    ebx,edx
  4025d1:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  4025d5:	48 89 e7             	mov    rdi,rsp
  4025d8:	e8 e3 f9 ff ff       	call   401fc0 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  4025dd:	48 83 ec 08          	sub    rsp,0x8
  4025e1:	45 89 d0             	mov    r8d,r10d
  4025e4:	4c 89 d9             	mov    rcx,r11
  4025e7:	41 51                	push   r9
  4025e9:	41 89 d9             	mov    r9d,ebx
  4025ec:	41 54                	push   r12
  4025ee:	55                   	push   rbp
  4025ef:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  4025f4:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  4025f9:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  4025fe:	e8 cd fc ff ff       	call   4022d0 <print_broken_up_decimal.isra.0>
}
  402603:	48 83 c4 40          	add    rsp,0x40
  402607:	5b                   	pop    rbx
  402608:	5d                   	pop    rbp
  402609:	41 5c                	pop    r12
  40260b:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000402610 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402610:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  402614:	40 84 ff             	test   dil,dil
  402617:	74 17                	je     402630 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402619:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  40261d:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402622:	31 c0                	xor    eax,eax
  402624:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402626:	66 0f 28 c1          	movapd xmm0,xmm1
}
  40262a:	c3                   	ret    
  40262b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402630:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  402634:	e8 07 f3 ff ff       	call   401940 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402639:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  40263d:	48 89 c7             	mov    rdi,rax
  402640:	e8 1b f3 ff ff       	call   401960 <get_exp2>
  402645:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402647:	e8 f4 f2 ff ff       	call   401940 <get_bit_access>
  40264c:	48 89 c7             	mov    rdi,rax
  40264f:	e8 0c f3 ff ff       	call   401960 <get_exp2>
  402654:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  402657:	89 d0                	mov    eax,edx
  402659:	f7 d8                	neg    eax
  40265b:	0f 49 d0             	cmovns edx,eax
  40265e:	44 89 c0             	mov    eax,r8d
  402661:	f7 d8                	neg    eax
  402663:	41 0f 48 c0          	cmovs  eax,r8d
  402667:	39 c2                	cmp    edx,eax
  402669:	7f 1d                	jg     402688 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40266b:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  40266f:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402674:	31 c0                	xor    eax,eax
}
  402676:	48 83 c4 08          	add    rsp,0x8
  return result;
  40267a:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40267c:	66 0f 28 c1          	movapd xmm0,xmm1
}
  402680:	c3                   	ret    
  402681:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402688:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  40268c:	31 d2                	xor    edx,edx
  return result;
  40268e:	31 c0                	xor    eax,eax
}
  402690:	48 83 c4 08          	add    rsp,0x8
  return result;
  402694:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402696:	66 0f 28 c2          	movapd xmm0,xmm2
}
  40269a:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

00000000004026a0 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  4026a0:	40 84 ff             	test   dil,dil
  4026a3:	74 0b                	je     4026b0 <unapply_scaling.isra.0+0x10>
  4026a5:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4026a9:	c3                   	ret    
  4026aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4026b0:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  4026b4:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

00000000004026c0 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  4026c0:	40 84 ff             	test   dil,dil
  4026c3:	74 0b                	je     4026d0 <apply_scaling.isra.0+0x10>
  4026c5:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  4026c9:	c3                   	ret    
  4026ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4026d0:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  4026d4:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

00000000004026e0 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  4026e0:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  4026e2:	48 83 ec 08          	sub    rsp,0x8
  4026e6:	49 89 f9             	mov    r9,rdi
  4026e9:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  4026eb:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  4026ee:	66 0f 28 d0          	movapd xmm2,xmm0
  4026f2:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  4026f5:	e8 c6 ff ff ff       	call   4026c0 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  4026fa:	3d 32 01 00 00       	cmp    eax,0x132
  4026ff:	0f 8f ab 00 00 00    	jg     4027b0 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  402705:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40270a:	66 0f ef c0          	pxor   xmm0,xmm0
  40270e:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  402712:	89 d6                	mov    esi,edx
  402714:	48 8d 05 05 2d 00 00 	lea    rax,[rip+0x2d05]        # 405420 <powers_of_10>
  40271b:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40271f:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  402724:	e8 77 ff ff ff       	call   4026a0 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  402729:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40272e:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  402732:	66 0f 28 c3          	movapd xmm0,xmm3
  402736:	66 0f 28 cc          	movapd xmm1,xmm4
  40273a:	e8 d1 fe ff ff       	call   402610 <update_normalization.isra.0>
  40273f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402743:	89 c7                	mov    edi,eax
  402745:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  402749:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  40274b:	e8 70 ff ff ff       	call   4026c0 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402750:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  402754:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402759:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40275e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  402762:	66 0f 2f 05 56 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d56]        # 4054c0 <powers_of_10+0xa0>
  402769:	00 
  40276a:	0f 93 c0             	setae  al
  40276d:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  402770:	66 0f 2e 05 48 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d48]        # 4054c0 <powers_of_10+0xa0>
  402777:	00 
  402778:	7a 06                	jp     402780 <get_normalized_components.isra.0+0xa0>
  40277a:	75 04                	jne    402780 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  40277c:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  402780:	66 0f ef c0          	pxor   xmm0,xmm0
  402784:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  402789:	66 0f 2f c4          	comisd xmm0,xmm4
  40278d:	73 19                	jae    4027a8 <get_normalized_components.isra.0+0xc8>
  return components;
  40278f:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  402793:	4c 89 c8             	mov    rax,r9
  return components;
  402796:	49 89 09             	mov    QWORD PTR [r9],rcx
  402799:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  40279d:	48 83 c4 08          	add    rsp,0x8
  4027a1:	c3                   	ret    
  4027a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  4027a8:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  4027ac:	31 c0                	xor    eax,eax
  4027ae:	eb df                	jmp    40278f <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  4027b0:	40 84 f6             	test   sil,sil
  4027b3:	74 08                	je     4027bd <get_normalized_components.isra.0+0xdd>
  4027b5:	66 0f 57 05 f3 2c 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2cf3]        # 4054b0 <powers_of_10+0x90>
  4027bc:	00 
  4027bd:	89 d6                	mov    esi,edx
  4027bf:	4c 89 cf             	mov    rdi,r9
  4027c2:	e8 f9 f7 ff ff       	call   401fc0 <get_components>
}
  4027c7:	4c 89 c8             	mov    rax,r9
  4027ca:	48 83 c4 08          	add    rsp,0x8
  4027ce:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

00000000004027d0 <print_exponential_number>:
{
  4027d0:	41 57                	push   r15
  4027d2:	41 89 f3             	mov    r11d,esi
  4027d5:	66 0f 28 f0          	movapd xmm6,xmm0
  4027d9:	41 56                	push   r14
  4027db:	41 55                	push   r13
  4027dd:	49 89 fd             	mov    r13,rdi
  4027e0:	41 54                	push   r12
  4027e2:	41 89 d4             	mov    r12d,edx
  4027e5:	55                   	push   rbp
  4027e6:	89 cd                	mov    ebp,ecx
  4027e8:	53                   	push   rbx
  4027e9:	48 83 ec 38          	sub    rsp,0x38
  4027ed:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4027f1:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  4027f6:	e8 55 f1 ff ff       	call   401950 <get_sign_bit>
  4027fb:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  4027fd:	85 c0                	test   eax,eax
  4027ff:	74 08                	je     402809 <print_exponential_number+0x39>
  402801:	66 0f 57 35 a7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2ca7]        # 4054b0 <powers_of_10+0x90>
  402808:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  402809:	41 89 e8             	mov    r8d,ebp
  40280c:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  402813:	66 0f 2e 35 9d 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2c9d]        # 4054b8 <powers_of_10+0x98>
  40281a:	00 
  40281b:	0f 8a 9f 00 00 00    	jp     4028c0 <print_exponential_number+0xf0>
  402821:	0f 85 99 00 00 00    	jne    4028c0 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  402827:	45 85 c0             	test   r8d,r8d
  40282a:	0f 85 18 01 00 00    	jne    402948 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  402830:	85 f6                	test   esi,esi
  402832:	0f 84 63 03 00 00    	je     402b9b <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402838:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  40283a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  40283d:	66 0f 57 35 6b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c6b]        # 4054b0 <powers_of_10+0x90>
  402844:	00 
  402845:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40284a:	44 89 de             	mov    esi,r11d
  40284d:	66 0f 28 c6          	movapd xmm0,xmm6
  402851:	e8 6a f7 ff ff       	call   401fc0 <get_components>
  402856:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40285b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402860:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402865:	45 84 ff             	test   r15b,r15b
  402868:	0f 84 49 01 00 00    	je     4029b7 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  40286e:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402874:	74 09                	je     40287f <print_exponential_number+0xaf>
  402876:	83 fb ff             	cmp    ebx,0xffffffff
  402879:	0f 8d d1 02 00 00    	jge    402b50 <print_exponential_number+0x380>
        width - exp10_part_width :
  40287f:	45 85 e4             	test   r12d,r12d
  402882:	0f 84 98 02 00 00    	je     402b20 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402888:	48 83 ec 08          	sub    rsp,0x8
  40288c:	45 89 e1             	mov    r9d,r12d
  40288f:	45 89 d8             	mov    r8d,r11d
  402892:	4c 89 e9             	mov    rcx,r13
  402895:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402899:	50                   	push   rax
  40289a:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  40289e:	55                   	push   rbp
  40289f:	e8 2c fa ff ff       	call   4022d0 <print_broken_up_decimal.isra.0>
  4028a4:	48 83 c4 20          	add    rsp,0x20
}
  4028a8:	48 83 c4 38          	add    rsp,0x38
  4028ac:	5b                   	pop    rbx
  4028ad:	5d                   	pop    rbp
  4028ae:	41 5c                	pop    r12
  4028b0:	41 5d                	pop    r13
  4028b2:	41 5e                	pop    r14
  4028b4:	41 5f                	pop    r15
  4028b6:	c3                   	ret    
  4028b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4028be:	00 00 
    double exp10 = log10_of_positive(abs_number);
  4028c0:	66 0f 28 c6          	movapd xmm0,xmm6
  4028c4:	e8 07 f8 ff ff       	call   4020d0 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  4028c9:	e8 d2 f7 ff ff       	call   4020a0 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  4028ce:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  4028d0:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  4028d2:	e8 89 f8 ff ff       	call   402160 <pow10_of_int>
    if (abs_number < p10) {
  4028d7:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  4028db:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  4028df:	76 0b                	jbe    4028ec <print_exponential_number+0x11c>
      floored_exp10--;
  4028e1:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  4028e4:	f2 0f 5e 0d 34 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c34]        # 405520 <powers_of_10+0x100>
  4028eb:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  4028ec:	8d 43 11             	lea    eax,[rbx+0x11]
  4028ef:	83 f8 22             	cmp    eax,0x22
  4028f2:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  4028f5:	77 15                	ja     40290c <print_exponential_number+0x13c>
  4028f7:	89 d8                	mov    eax,ebx
  4028f9:	48 8d 15 20 2b 00 00 	lea    rdx,[rip+0x2b20]        # 405420 <powers_of_10>
  402900:	f7 d8                	neg    eax
  402902:	0f 48 c3             	cmovs  eax,ebx
  402905:	48 98                	cdqe   
  402907:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  40290c:	89 d8                	mov    eax,ebx
  40290e:	c1 e8 1f             	shr    eax,0x1f
  402911:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402913:	85 db                	test   ebx,ebx
  402915:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402918:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  40291b:	45 85 c0             	test   r8d,r8d
  40291e:	74 62                	je     402982 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402920:	45 85 db             	test   r11d,r11d
  402923:	b8 01 00 00 00       	mov    eax,0x1
  402928:	41 0f 45 c3          	cmovne eax,r11d
  40292c:	39 c3                	cmp    ebx,eax
  40292e:	0f 9c c0             	setl   al
  402931:	83 fb fc             	cmp    ebx,0xfffffffc
  402934:	40 0f 9d c7          	setge  dil
  402938:	21 f8                	and    eax,edi
  40293a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  40293d:	44 09 fa             	or     edx,r15d
  402940:	eb 21                	jmp    402963 <print_exponential_number+0x193>
  402942:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402948:	45 85 db             	test   r11d,r11d
  40294b:	b8 01 00 00 00       	mov    eax,0x1
  402950:	ba 01 00 00 00       	mov    edx,0x1
  402955:	41 0f 45 c3          	cmovne eax,r11d
  402959:	85 c0                	test   eax,eax
  40295b:	41 0f 9f c7          	setg   r15b
  40295f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402961:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402963:	41 83 eb 01          	sub    r11d,0x1
  402967:	44 89 df             	mov    edi,r11d
  40296a:	29 df                	sub    edi,ebx
  40296c:	45 84 ff             	test   r15b,r15b
  40296f:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402973:	31 ff                	xor    edi,edi
  402975:	45 85 db             	test   r11d,r11d
  402978:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  40297c:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402982:	84 d2                	test   dl,dl
  402984:	0f 85 86 01 00 00    	jne    402b10 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  40298a:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  40298c:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402991:	44 89 da             	mov    edx,r11d
  402994:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402997:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  40299b:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  40299f:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  4029a3:	e8 38 fd ff ff       	call   4026e0 <get_normalized_components.isra.0>
  4029a8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4029ad:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4029b2:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  4029b7:	48 83 ff 09          	cmp    rdi,0x9
  4029bb:	7e 0a                	jle    4029c7 <print_exponential_number+0x1f7>
      floored_exp10++;
  4029bd:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  4029c0:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  4029c2:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  4029c7:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  4029ca:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  4029cd:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  4029d1:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  4029d7:	77 47                	ja     402a20 <print_exponential_number+0x250>
      0U :
  4029d9:	45 85 d2             	test   r10d,r10d
  4029dc:	0f 84 9e 01 00 00    	je     402b80 <print_exponential_number+0x3b0>
  4029e2:	41 bf 03 00 00 00    	mov    r15d,0x3
  4029e8:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  4029ed:	48 83 ec 08          	sub    rsp,0x8
  4029f1:	45 31 c9             	xor    r9d,r9d
  4029f4:	45 89 d8             	mov    r8d,r11d
  4029f7:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  4029fb:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  4029fe:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a02:	50                   	push   rax
  402a03:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402a07:	55                   	push   rbp
  402a08:	e8 c3 f8 ff ff       	call   4022d0 <print_broken_up_decimal.isra.0>
  402a0d:	48 83 c4 20          	add    rsp,0x20
  402a11:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402a16:	eb 61                	jmp    402a79 <print_exponential_number+0x2a9>
  402a18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402a1f:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402a20:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402a25:	45 85 d2             	test   r10d,r10d
  402a28:	0f 85 62 01 00 00    	jne    402b90 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402a2e:	45 89 e1             	mov    r9d,r12d
  402a31:	b9 00 00 00 00       	mov    ecx,0x0
  402a36:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a3a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402a3d:	41 29 c1             	sub    r9d,eax
  402a40:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402a43:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402a47:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a4b:	48 83 ec 08          	sub    rsp,0x8
  402a4f:	4c 89 e9             	mov    rcx,r13
  402a52:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a56:	50                   	push   rax
  402a57:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402a5b:	55                   	push   rbp
  402a5c:	e8 6f f8 ff ff       	call   4022d0 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402a61:	48 83 c4 20          	add    rsp,0x20
  402a65:	45 84 ff             	test   r15b,r15b
  402a68:	0f 85 3a fe ff ff    	jne    4028a8 <print_exponential_number+0xd8>
    print_integer(output,
  402a6e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402a72:	45 31 d2             	xor    r10d,r10d
  402a75:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402a79:	83 e5 20             	and    ebp,0x20
  402a7c:	4c 89 ef             	mov    rdi,r13
  402a7f:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402a83:	83 fd 01             	cmp    ebp,0x1
  402a86:	19 f6                	sbb    esi,esi
  402a88:	83 e6 20             	and    esi,0x20
  402a8b:	83 c6 45             	add    esi,0x45
  402a8e:	e8 ed ee ff ff       	call   401980 <putchar_via_gadget>
    print_integer(output,
  402a93:	48 63 c3             	movsxd rax,ebx
  402a96:	89 da                	mov    edx,ebx
  402a98:	45 89 f9             	mov    r9d,r15d
  402a9b:	48 89 c6             	mov    rsi,rax
  402a9e:	c1 ea 1f             	shr    edx,0x1f
  402aa1:	b9 0a 00 00 00       	mov    ecx,0xa
  402aa6:	4c 89 ef             	mov    rdi,r13
  402aa9:	48 f7 de             	neg    rsi
  402aac:	85 db                	test   ebx,ebx
  402aae:	48 0f 4f f0          	cmovg  rsi,rax
  402ab2:	48 83 ec 08          	sub    rsp,0x8
  402ab6:	45 31 c0             	xor    r8d,r8d
  402ab9:	6a 05                	push   0x5
  402abb:	e8 10 f4 ff ff       	call   401ed0 <print_integer>
    if (flags & FLAGS_LEFT) {
  402ac0:	58                   	pop    rax
  402ac1:	5a                   	pop    rdx
  402ac2:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402ac6:	45 85 d2             	test   r10d,r10d
  402ac9:	0f 84 d9 fd ff ff    	je     4028a8 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402acf:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402ad3:	44 29 f0             	sub    eax,r14d
  402ad6:	44 39 e0             	cmp    eax,r12d
  402ad9:	0f 83 c9 fd ff ff    	jae    4028a8 <print_exponential_number+0xd8>
  402adf:	90                   	nop
        putchar_via_gadget(output, ' ');
  402ae0:	be 20 00 00 00       	mov    esi,0x20
  402ae5:	4c 89 ef             	mov    rdi,r13
  402ae8:	e8 93 ee ff ff       	call   401980 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402aed:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402af1:	44 29 f0             	sub    eax,r14d
  402af4:	44 39 e0             	cmp    eax,r12d
  402af7:	72 e7                	jb     402ae0 <print_exponential_number+0x310>
}
  402af9:	48 83 c4 38          	add    rsp,0x38
  402afd:	5b                   	pop    rbx
  402afe:	5d                   	pop    rbp
  402aff:	41 5c                	pop    r12
  402b01:	41 5d                	pop    r13
  402b03:	41 5e                	pop    r14
  402b05:	41 5f                	pop    r15
  402b07:	c3                   	ret    
  402b08:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402b0f:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402b10:	85 f6                	test   esi,esi
  402b12:	0f 84 2d fd ff ff    	je     402845 <print_exponential_number+0x75>
  402b18:	e9 20 fd ff ff       	jmp    40283d <print_exponential_number+0x6d>
  402b1d:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402b20:	48 83 ec 08          	sub    rsp,0x8
  402b24:	4c 89 e9             	mov    rcx,r13
  402b27:	45 31 c9             	xor    r9d,r9d
  402b2a:	45 89 d8             	mov    r8d,r11d
  402b2d:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402b31:	50                   	push   rax
  402b32:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402b36:	55                   	push   rbp
  402b37:	e8 94 f7 ff ff       	call   4022d0 <print_broken_up_decimal.isra.0>
  402b3c:	48 83 c4 20          	add    rsp,0x20
}
  402b40:	48 83 c4 38          	add    rsp,0x38
  402b44:	5b                   	pop    rbx
  402b45:	5d                   	pop    rbp
  402b46:	41 5c                	pop    r12
  402b48:	41 5d                	pop    r13
  402b4a:	41 5e                	pop    r14
  402b4c:	41 5f                	pop    r15
  402b4e:	c3                   	ret    
  402b4f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402b50:	83 c3 01             	add    ebx,0x1
  402b53:	66 0f ef c0          	pxor   xmm0,xmm0
  402b57:	48 8d 05 c2 28 00 00 	lea    rax,[rip+0x28c2]        # 405420 <powers_of_10>
  402b5e:	48 63 db             	movsxd rbx,ebx
  402b61:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402b66:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402b6b:	0f 8a 0e fd ff ff    	jp     40287f <print_exponential_number+0xaf>
  402b71:	0f 85 08 fd ff ff    	jne    40287f <print_exponential_number+0xaf>
      precision--;
  402b77:	41 83 eb 01          	sub    r11d,0x1
  402b7b:	e9 ff fc ff ff       	jmp    40287f <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402b80:	b8 04 00 00 00       	mov    eax,0x4
  402b85:	e9 a4 fe ff ff       	jmp    402a2e <print_exponential_number+0x25e>
  402b8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402b90:	41 bf 04 00 00 00    	mov    r15d,0x4
  402b96:	e9 4d fe ff ff       	jmp    4029e8 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402b9b:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402ba0:	44 89 de             	mov    esi,r11d
  402ba3:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402ba7:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402ba9:	e8 12 f4 ff ff       	call   401fc0 <get_components>
  402bae:	45 31 ff             	xor    r15d,r15d
  402bb1:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402bb6:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402bbb:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402bc0:	e9 f2 fd ff ff       	jmp    4029b7 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402bd0 <print_floating_point>:
  if (value != value) {
  402bd0:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402bd4:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402bd7:	0f 8a eb 00 00 00    	jp     402cc8 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402bdd:	f2 0f 10 0d 5b 29 00 	movsd  xmm1,QWORD PTR [rip+0x295b]        # 405540 <powers_of_10+0x120>
  402be4:	00 
  402be5:	66 0f 2f c8          	comisd xmm1,xmm0
  402be9:	0f 87 21 01 00 00    	ja     402d10 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402bef:	66 0f 2f 05 51 29 00 	comisd xmm0,QWORD PTR [rip+0x2951]        # 405548 <powers_of_10+0x128>
  402bf6:	00 
  402bf7:	77 57                	ja     402c50 <print_floating_point+0x80>
{
  402bf9:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402bfd:	45 84 c0             	test   r8b,r8b
  402c00:	75 7e                	jne    402c80 <print_floating_point+0xb0>
  402c02:	66 0f 2f 05 46 29 00 	comisd xmm0,QWORD PTR [rip+0x2946]        # 405550 <powers_of_10+0x130>
  402c09:	00 
  402c0a:	0f 87 e8 00 00 00    	ja     402cf8 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402c10:	f2 0f 10 0d 40 29 00 	movsd  xmm1,QWORD PTR [rip+0x2940]        # 405558 <powers_of_10+0x138>
  402c17:	00 
  402c18:	66 0f 2f c8          	comisd xmm1,xmm0
  402c1c:	0f 87 d6 00 00 00    	ja     402cf8 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402c22:	41 89 c9             	mov    r9d,ecx
  402c25:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402c2c:	0f 85 fe 00 00 00    	jne    402d30 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402c32:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402c37:	49 89 e0             	mov    r8,rsp
  402c3a:	44 89 d2             	mov    edx,r10d
  402c3d:	e8 7e f9 ff ff       	call   4025c0 <print_decimal_number>
}
  402c42:	48 83 c4 28          	add    rsp,0x28
  402c46:	c3                   	ret    
  402c47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402c4e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402c50:	89 c8                	mov    eax,ecx
  402c52:	48 8d 35 10 26 00 00 	lea    rsi,[rip+0x2610]        # 405269 <memcpy+0xdb9>
  402c59:	41 89 c8             	mov    r8d,ecx
  402c5c:	44 89 d1             	mov    ecx,r10d
  402c5f:	83 e0 04             	and    eax,0x4
  402c62:	83 f8 01             	cmp    eax,0x1
  402c65:	19 d2                	sbb    edx,edx
  402c67:	83 c2 04             	add    edx,0x4
  402c6a:	85 c0                	test   eax,eax
  402c6c:	48 8d 05 f1 25 00 00 	lea    rax,[rip+0x25f1]        # 405264 <memcpy+0xdb4>
  402c73:	48 0f 45 f0          	cmovne rsi,rax
  402c77:	e9 04 ef ff ff       	jmp    401b80 <out_rev_>
  402c7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402c80:	41 89 c9             	mov    r9d,ecx
  402c83:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402c8a:	74 54                	je     402ce0 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402c8c:	b8 01 00 00 00       	mov    eax,0x1
  402c91:	45 31 c9             	xor    r9d,r9d
  402c94:	83 fe 11             	cmp    esi,0x11
  402c97:	76 4c                	jbe    402ce5 <print_floating_point+0x115>
  402c99:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402c9e:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402ca0:	41 89 c1             	mov    r9d,eax
  402ca3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402ca7:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402caa:	48 83 c0 01          	add    rax,0x1
  402cae:	41 83 f9 1f          	cmp    r9d,0x1f
  402cb2:	77 05                	ja     402cb9 <print_floating_point+0xe9>
  402cb4:	83 fe 11             	cmp    esi,0x11
  402cb7:	77 e7                	ja     402ca0 <print_floating_point+0xd0>
  if (prefer_exponential)
  402cb9:	45 84 c0             	test   r8b,r8b
  402cbc:	0f 84 75 ff ff ff    	je     402c37 <print_floating_point+0x67>
  402cc2:	eb 21                	jmp    402ce5 <print_floating_point+0x115>
  402cc4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402cc8:	41 89 c8             	mov    r8d,ecx
  402ccb:	48 8d 35 9b 25 00 00 	lea    rsi,[rip+0x259b]        # 40526d <memcpy+0xdbd>
  402cd2:	89 d1                	mov    ecx,edx
  402cd4:	ba 03 00 00 00       	mov    edx,0x3
  402cd9:	e9 a2 ee ff ff       	jmp    401b80 <out_rev_>
  402cde:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402ce0:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402ce5:	49 89 e0             	mov    r8,rsp
  402ce8:	44 89 d2             	mov    edx,r10d
  402ceb:	e8 e0 fa ff ff       	call   4027d0 <print_exponential_number>
}
  402cf0:	48 83 c4 28          	add    rsp,0x28
  402cf4:	c3                   	ret    
  402cf5:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402cf8:	45 31 c9             	xor    r9d,r9d
  402cfb:	49 89 e0             	mov    r8,rsp
  402cfe:	44 89 d2             	mov    edx,r10d
  402d01:	e8 ca fa ff ff       	call   4027d0 <print_exponential_number>
    return;
  402d06:	e9 37 ff ff ff       	jmp    402c42 <print_floating_point+0x72>
  402d0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402d10:	41 89 c8             	mov    r8d,ecx
  402d13:	48 8d 35 57 25 00 00 	lea    rsi,[rip+0x2557]        # 405271 <memcpy+0xdc1>
  402d1a:	89 d1                	mov    ecx,edx
  402d1c:	ba 04 00 00 00       	mov    edx,0x4
  402d21:	e9 5a ee ff ff       	jmp    401b80 <out_rev_>
  402d26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402d2d:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402d30:	b8 01 00 00 00       	mov    eax,0x1
  402d35:	45 31 c9             	xor    r9d,r9d
  402d38:	83 fe 11             	cmp    esi,0x11
  402d3b:	0f 87 58 ff ff ff    	ja     402c99 <print_floating_point+0xc9>
  402d41:	e9 f1 fe ff ff       	jmp    402c37 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402d50 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402d50:	41 57                	push   r15
  402d52:	41 56                	push   r14
  402d54:	41 55                	push   r13
  402d56:	41 54                	push   r12
  402d58:	55                   	push   rbp
  402d59:	53                   	push   rbx
  402d5a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402d5d:	48 89 f2             	mov    rdx,rsi
{
  402d60:	48 83 ec 28          	sub    rsp,0x28
  402d64:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402d69:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402d6c:	40 84 f6             	test   sil,sil
  402d6f:	0f 84 e5 00 00 00    	je     402e5a <format_string_loop+0x10a>
  402d75:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402d78:	4c 8d 2d 05 25 00 00 	lea    r13,[rip+0x2505]        # 405284 <memcpy+0xdd4>
  402d7f:	90                   	nop
    if (*format != '%') {
  402d80:	40 80 fe 25          	cmp    sil,0x25
  402d84:	0f 85 ae 00 00 00    	jne    402e38 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402d8a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402d8e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402d93:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402d97:	0f 84 bd 00 00 00    	je     402e5a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402d9d:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402da2:	4c 89 cf             	mov    rdi,r9
  402da5:	e8 86 f4 ff ff       	call   402230 <parse_flags>
    if (is_digit_(*format)) {
  402daa:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402daf:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402db2:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402db5:	89 fe                	mov    esi,edi
  402db7:	e8 74 ed ff ff       	call   401b30 <is_digit_>
  402dbc:	84 c0                	test   al,al
  402dbe:	0f 85 ac 04 00 00    	jne    403270 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402dc4:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402dc7:	40 80 fe 2a          	cmp    sil,0x2a
  402dcb:	0f 84 bf 04 00 00    	je     403290 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  402dd1:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  402dd4:	40 80 fe 2e          	cmp    sil,0x2e
  402dd8:	0f 84 52 04 00 00    	je     403230 <format_string_loop+0x4e0>
    switch (*format) {
  402dde:	8d 46 98             	lea    eax,[rsi-0x68]
  402de1:	3c 12                	cmp    al,0x12
  402de3:	77 2f                	ja     402e14 <format_string_loop+0xc4>
  402de5:	0f b6 c0             	movzx  eax,al
  402de8:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402ded:	4c 01 e8             	add    rax,r13
  402df0:	3e ff e0             	notrack jmp rax
  402df3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  402df8:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  402dfc:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  402e03:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402e08:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402e0c:	40 84 f6             	test   sil,sil
  402e0f:	74 49                	je     402e5a <format_string_loop+0x10a>
  402e11:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  402e14:	8d 46 db             	lea    eax,[rsi-0x25]
  402e17:	3c 53                	cmp    al,0x53
  402e19:	77 1d                	ja     402e38 <format_string_loop+0xe8>
  402e1b:	48 8d 0d ae 24 00 00 	lea    rcx,[rip+0x24ae]        # 4052d0 <memcpy+0xe20>
  402e22:	0f b6 c0             	movzx  eax,al
  402e25:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402e29:	48 01 c8             	add    rax,rcx
  402e2c:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  402e2f:	be 25 00 00 00       	mov    esi,0x25
  402e34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402e38:	48 89 ef             	mov    rdi,rbp
  402e3b:	e8 40 eb ff ff       	call   401980 <putchar_via_gadget>
        format++;
  402e40:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402e45:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402e49:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  402e4e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402e51:	40 84 f6             	test   sil,sil
  402e54:	0f 85 26 ff ff ff    	jne    402d80 <format_string_loop+0x30>
        break;
    }
  }
}
  402e5a:	48 83 c4 28          	add    rsp,0x28
  402e5e:	5b                   	pop    rbx
  402e5f:	5d                   	pop    rbp
  402e60:	41 5c                	pop    r12
  402e62:	41 5d                	pop    r13
  402e64:	41 5e                	pop    r14
  402e66:	41 5f                	pop    r15
  402e68:	c3                   	ret    
  402e69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  402e70:	40 80 fe 64          	cmp    sil,0x64
  402e74:	0f 84 6e 06 00 00    	je     4034e8 <format_string_loop+0x798>
  402e7a:	40 80 fe 69          	cmp    sil,0x69
  402e7e:	0f 84 64 06 00 00    	je     4034e8 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  402e84:	89 f0                	mov    eax,esi
  402e86:	83 e0 df             	and    eax,0xffffffdf
  402e89:	3c 58                	cmp    al,0x58
  402e8b:	0f 84 37 06 00 00    	je     4034c8 <format_string_loop+0x778>
        else if (*format == 'o') {
  402e91:	b9 08 00 00 00       	mov    ecx,0x8
  402e96:	40 80 fe 6f          	cmp    sil,0x6f
  402e9a:	74 14                	je     402eb0 <format_string_loop+0x160>
        else if (*format == 'b') {
  402e9c:	b9 02 00 00 00       	mov    ecx,0x2
  402ea1:	40 80 fe 62          	cmp    sil,0x62
  402ea5:	74 09                	je     402eb0 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  402ea7:	41 83 e3 ef          	and    r11d,0xffffffef
  402eab:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  402eb0:	44 89 d8             	mov    eax,r11d
        format++;
  402eb3:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  402eb7:	83 e0 fe             	and    eax,0xfffffffe
  402eba:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  402ec1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  402ec6:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  402eca:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  402ecc:	44 89 da             	mov    edx,r11d
  402ecf:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  402ed5:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  402edc:	0f 84 b6 04 00 00    	je     403398 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  402ee2:	85 d2                	test   edx,edx
  402ee4:	0f 85 be 06 00 00    	jne    4035a8 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  402eea:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  402ef1:	0f 85 b1 06 00 00    	jne    4035a8 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  402ef7:	41 f6 c3 40          	test   r11b,0x40
  402efb:	0f 84 51 08 00 00    	je     403752 <format_string_loop+0xa02>
  402f01:	83 f8 2f             	cmp    eax,0x2f
  402f04:	0f 87 bc 08 00 00    	ja     4037c6 <format_string_loop+0xa76>
  402f0a:	89 c2                	mov    edx,eax
  402f0c:	83 c0 08             	add    eax,0x8
  402f0f:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402f13:	89 03                	mov    DWORD PTR [rbx],eax
  402f15:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  402f18:	48 63 f8             	movsxd rdi,eax
  402f1b:	89 c2                	mov    edx,eax
  402f1d:	45 89 e1             	mov    r9d,r12d
  402f20:	45 89 f8             	mov    r8d,r15d
  402f23:	48 89 fe             	mov    rsi,rdi
  402f26:	c1 ea 1f             	shr    edx,0x1f
  402f29:	48 f7 de             	neg    rsi
  402f2c:	85 c0                	test   eax,eax
  402f2e:	48 0f 4f f7          	cmovg  rsi,rdi
  402f32:	48 83 ec 08          	sub    rsp,0x8
  402f36:	48 89 ef             	mov    rdi,rbp
  402f39:	41 53                	push   r11
  402f3b:	e8 90 ef ff ff       	call   401ed0 <print_integer>
  while (*format)
  402f40:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402f45:	41 5a                	pop    r10
  402f47:	41 5b                	pop    r11
  402f49:	e9 00 ff ff ff       	jmp    402e4e <format_string_loop+0xfe>
  402f4e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  402f50:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402f54:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f59:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402f5d:	40 84 f6             	test   sil,sil
  402f60:	0f 84 f4 fe ff ff    	je     402e5a <format_string_loop+0x10a>
        if (*format == 'h') {
  402f66:	40 80 fe 68          	cmp    sil,0x68
  402f6a:	0f 84 d8 03 00 00    	je     403348 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  402f70:	41 80 cb 80          	or     r11b,0x80
  402f74:	48 89 c2             	mov    rdx,rax
  402f77:	e9 98 fe ff ff       	jmp    402e14 <format_string_loop+0xc4>
  402f7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  402f80:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402f84:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f89:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402f8d:	40 84 f6             	test   sil,sil
  402f90:	0f 84 c4 fe ff ff    	je     402e5a <format_string_loop+0x10a>
        if (*format == 'l') {
  402f96:	40 80 fe 6c          	cmp    sil,0x6c
  402f9a:	0f 84 d0 03 00 00    	je     403370 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  402fa0:	41 81 cb 00 02 00 00 	or     r11d,0x200
  402fa7:	48 89 c2             	mov    rdx,rax
  402faa:	e9 65 fe ff ff       	jmp    402e14 <format_string_loop+0xc4>
  402faf:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  402fb0:	89 f2                	mov    edx,esi
  402fb2:	44 89 d8             	mov    eax,r11d
  402fb5:	83 e2 df             	and    edx,0xffffffdf
  402fb8:	80 cc 10             	or     ah,0x10
  402fbb:	80 fa 47             	cmp    dl,0x47
  402fbe:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  402fc2:	83 e6 fd             	and    esi,0xfffffffd
  402fc5:	44 89 d8             	mov    eax,r11d
  402fc8:	83 c8 20             	or     eax,0x20
  402fcb:	40 80 fe 45          	cmp    sil,0x45
  402fcf:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  402fd3:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  402fd6:	3d af 00 00 00       	cmp    eax,0xaf
  402fdb:	0f 87 9f 03 00 00    	ja     403380 <format_string_loop+0x630>
  402fe1:	89 c7                	mov    edi,eax
  402fe3:	83 c0 10             	add    eax,0x10
  402fe6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  402fea:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  402fed:	41 b8 01 00 00 00    	mov    r8d,0x1
  402ff3:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  402ff7:	44 89 e2             	mov    edx,r12d
  402ffa:	44 89 d9             	mov    ecx,r11d
  402ffd:	44 89 fe             	mov    esi,r15d
  403000:	48 89 ef             	mov    rdi,rbp
  403003:	e8 c8 fb ff ff       	call   402bd0 <print_floating_point>
        format++;
  403008:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40300d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403011:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403016:	e9 33 fe ff ff       	jmp    402e4e <format_string_loop+0xfe>
  40301b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  403020:	44 89 d8             	mov    eax,r11d
  403023:	83 c8 20             	or     eax,0x20
  403026:	40 80 fe 46          	cmp    sil,0x46
  40302a:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  40302e:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403031:	3d af 00 00 00       	cmp    eax,0xaf
  403036:	0f 87 74 04 00 00    	ja     4034b0 <format_string_loop+0x760>
  40303c:	89 c7                	mov    edi,eax
  40303e:	83 c0 10             	add    eax,0x10
  403041:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  403045:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  403048:	45 31 c0             	xor    r8d,r8d
  40304b:	eb a6                	jmp    402ff3 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  40304d:	41 83 e3 02          	and    r11d,0x2
  403051:	0f 84 b9 05 00 00    	je     403610 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403057:	8b 03                	mov    eax,DWORD PTR [rbx]
  403059:	83 f8 2f             	cmp    eax,0x2f
  40305c:	0f 86 a9 06 00 00    	jbe    40370b <format_string_loop+0x9bb>
  403062:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403066:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40306a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40306e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403071:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  403074:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40307a:	e8 01 e9 ff ff       	call   401980 <putchar_via_gadget>
          while (l++ < width) {
  40307f:	41 83 fc 01          	cmp    r12d,0x1
  403083:	0f 86 b7 fd ff ff    	jbe    402e40 <format_string_loop+0xf0>
  403089:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403090:	be 20 00 00 00       	mov    esi,0x20
  403095:	48 89 ef             	mov    rdi,rbp
  403098:	e8 e3 e8 ff ff       	call   401980 <putchar_via_gadget>
          while (l++ < width) {
  40309d:	44 89 f8             	mov    eax,r15d
  4030a0:	41 83 c7 01          	add    r15d,0x1
  4030a4:	41 39 c4             	cmp    r12d,eax
  4030a7:	75 e7                	jne    403090 <format_string_loop+0x340>
  4030a9:	e9 92 fd ff ff       	jmp    402e40 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4030ae:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  4030b0:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4030b7:	83 f8 2f             	cmp    eax,0x2f
  4030ba:	0f 87 b0 03 00 00    	ja     403470 <format_string_loop+0x720>
  4030c0:	89 c2                	mov    edx,eax
  4030c2:	83 c0 08             	add    eax,0x8
  4030c5:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4030c9:	89 03                	mov    DWORD PTR [rbx],eax
  4030cb:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4030ce:	48 85 f6             	test   rsi,rsi
  4030d1:	0f 84 b1 03 00 00    	je     403488 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  4030d7:	48 83 ec 08          	sub    rsp,0x8
  4030db:	31 d2                	xor    edx,edx
  4030dd:	41 b9 12 00 00 00    	mov    r9d,0x12
  4030e3:	45 89 f8             	mov    r8d,r15d
  4030e6:	41 53                	push   r11
  4030e8:	b9 10 00 00 00       	mov    ecx,0x10
  4030ed:	48 89 ef             	mov    rdi,rbp
  4030f0:	e8 db ed ff ff       	call   401ed0 <print_integer>
  4030f5:	58                   	pop    rax
  4030f6:	5a                   	pop    rdx
        format++;
  4030f7:	e9 44 fd ff ff       	jmp    402e40 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4030fc:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  4030ff:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403101:	41 f6 c3 40          	test   r11b,0x40
  403105:	0f 84 f5 02 00 00    	je     403400 <format_string_loop+0x6b0>
  40310b:	83 f8 2f             	cmp    eax,0x2f
  40310e:	0f 87 3c 04 00 00    	ja     403550 <format_string_loop+0x800>
  403114:	89 c2                	mov    edx,eax
  403116:	83 c0 08             	add    eax,0x8
  403119:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40311d:	89 03                	mov    DWORD PTR [rbx],eax
  40311f:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403122:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  403124:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403129:	48 83 c2 01          	add    rdx,0x1
  40312d:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403132:	e9 17 fd ff ff       	jmp    402e4e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  403137:	8b 03                	mov    eax,DWORD PTR [rbx]
  403139:	83 f8 2f             	cmp    eax,0x2f
  40313c:	0f 87 ee 02 00 00    	ja     403430 <format_string_loop+0x6e0>
  403142:	89 c2                	mov    edx,eax
  403144:	83 c0 08             	add    eax,0x8
  403147:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40314b:	89 03                	mov    DWORD PTR [rbx],eax
  40314d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403150:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403154:	48 85 c0             	test   rax,rax
  403157:	0f 84 ef 02 00 00    	je     40344c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40315d:	45 85 ff             	test   r15d,r15d
  403160:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403165:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  403169:	41 0f 45 f7          	cmovne esi,r15d
  40316d:	e8 7e e9 ff ff       	call   401af0 <strnlen_s_>
            l = (l < precision ? l : precision);
  403172:	44 89 df             	mov    edi,r11d
  403175:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  403178:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  40317a:	41 0f 47 c7          	cmova  eax,r15d
  40317e:	81 e7 00 08 00 00    	and    edi,0x800
  403184:	41 89 fe             	mov    r14d,edi
  403187:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  40318a:	41 83 e3 02          	and    r11d,0x2
  40318e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  403193:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  403197:	0f 84 c3 04 00 00    	je     403660 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40319d:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4031a1:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4031a4:	40 84 f6             	test   sil,sil
  4031a7:	74 52                	je     4031fb <format_string_loop+0x4ab>
  4031a9:	85 ff                	test   edi,edi
  4031ab:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4031b0:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4031b5:	45 85 ff             	test   r15d,r15d
  4031b8:	75 04                	jne    4031be <format_string_loop+0x46e>
  4031ba:	84 c0                	test   al,al
  4031bc:	74 3d                	je     4031fb <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4031be:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  4031c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  4031c8:	49 83 c6 01          	add    r14,0x1
  4031cc:	48 89 ef             	mov    rdi,rbp
  4031cf:	e8 ac e7 ff ff       	call   401980 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4031d4:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  4031d8:	40 84 f6             	test   sil,sil
  4031db:	74 12                	je     4031ef <format_string_loop+0x49f>
  4031dd:	44 89 fa             	mov    edx,r15d
  4031e0:	44 29 f2             	sub    edx,r14d
  4031e3:	03 14 24             	add    edx,DWORD PTR [rsp]
  4031e6:	75 e0                	jne    4031c8 <format_string_loop+0x478>
  4031e8:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  4031ed:	75 d9                	jne    4031c8 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  4031ef:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  4031f3:	85 c9                	test   ecx,ecx
  4031f5:	0f 84 45 fc ff ff    	je     402e40 <format_string_loop+0xf0>
            while (l++ < width) {
  4031fb:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  4031ff:	44 8d 78 01          	lea    r15d,[rax+0x1]
  403203:	41 39 c4             	cmp    r12d,eax
  403206:	0f 86 34 fc ff ff    	jbe    402e40 <format_string_loop+0xf0>
  40320c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  403210:	be 20 00 00 00       	mov    esi,0x20
  403215:	48 89 ef             	mov    rdi,rbp
  403218:	e8 63 e7 ff ff       	call   401980 <putchar_via_gadget>
            while (l++ < width) {
  40321d:	44 89 f8             	mov    eax,r15d
  403220:	41 83 c7 01          	add    r15d,0x1
  403224:	41 39 c4             	cmp    r12d,eax
  403227:	75 e7                	jne    403210 <format_string_loop+0x4c0>
  403229:	e9 12 fc ff ff       	jmp    402e40 <format_string_loop+0xf0>
  40322e:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  403230:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  403234:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40323b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  403240:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  403244:	40 84 f6             	test   sil,sil
  403247:	0f 84 0d fc ff ff    	je     402e5a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40324d:	40 0f be fe          	movsx  edi,sil
  403251:	e8 da e8 ff ff       	call   401b30 <is_digit_>
  403256:	84 c0                	test   al,al
  403258:	0f 85 82 00 00 00    	jne    4032e0 <format_string_loop+0x590>
      else if (*format == '*') {
  40325e:	40 80 fe 2a          	cmp    sil,0x2a
  403262:	0f 84 98 00 00 00    	je     403300 <format_string_loop+0x5b0>
  403268:	48 89 ca             	mov    rdx,rcx
  40326b:	e9 6e fb ff ff       	jmp    402dde <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  403270:	4c 89 cf             	mov    rdi,r9
  403273:	e8 c8 e8 ff ff       	call   401b40 <atou_>
    if (*format == '.') {
  403278:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  40327d:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  403280:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403283:	e9 49 fb ff ff       	jmp    402dd1 <format_string_loop+0x81>
  403288:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40328f:	00 
      const int w = va_arg(args, int);
  403290:	8b 03                	mov    eax,DWORD PTR [rbx]
  403292:	83 f8 2f             	cmp    eax,0x2f
  403295:	77 39                	ja     4032d0 <format_string_loop+0x580>
  403297:	89 c1                	mov    ecx,eax
  403299:	83 c0 08             	add    eax,0x8
  40329c:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4032a0:	89 03                	mov    DWORD PTR [rbx],eax
  4032a2:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  4032a5:	45 85 e4             	test   r12d,r12d
  4032a8:	79 07                	jns    4032b1 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  4032aa:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  4032ae:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  4032b1:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4032b5:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4032ba:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4032be:	40 84 f6             	test   sil,sil
  4032c1:	0f 84 93 fb ff ff    	je     402e5a <format_string_loop+0x10a>
  4032c7:	48 89 c2             	mov    rdx,rax
  4032ca:	e9 02 fb ff ff       	jmp    402dd1 <format_string_loop+0x81>
  4032cf:	90                   	nop
      const int w = va_arg(args, int);
  4032d0:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4032d4:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4032d8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4032dc:	eb c4                	jmp    4032a2 <format_string_loop+0x552>
  4032de:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  4032e0:	4c 89 cf             	mov    rdi,r9
  4032e3:	e8 58 e8 ff ff       	call   401b40 <atou_>
    switch (*format) {
  4032e8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  4032ed:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  4032f0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4032f3:	e9 e6 fa ff ff       	jmp    402dde <format_string_loop+0x8e>
  4032f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4032ff:	00 
        const int precision_ = va_arg(args, int);
  403300:	8b 03                	mov    eax,DWORD PTR [rbx]
  403302:	83 f8 2f             	cmp    eax,0x2f
  403305:	0f 87 ed 01 00 00    	ja     4034f8 <format_string_loop+0x7a8>
  40330b:	89 c1                	mov    ecx,eax
  40330d:	83 c0 08             	add    eax,0x8
  403310:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403314:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  403316:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  403319:	31 c0                	xor    eax,eax
  40331b:	45 85 d2             	test   r10d,r10d
  40331e:	41 0f 49 c2          	cmovns eax,r10d
  403322:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  403325:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403329:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40332e:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403332:	40 84 f6             	test   sil,sil
  403335:	0f 84 1f fb ff ff    	je     402e5a <format_string_loop+0x10a>
  40333b:	48 89 c2             	mov    rdx,rax
  40333e:	e9 9b fa ff ff       	jmp    402dde <format_string_loop+0x8e>
  403343:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  403348:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40334c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403350:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403355:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403359:	40 84 f6             	test   sil,sil
  40335c:	0f 85 af fa ff ff    	jne    402e11 <format_string_loop+0xc1>
  403362:	e9 f3 fa ff ff       	jmp    402e5a <format_string_loop+0x10a>
  403367:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40336e:	00 00 
          flags |= FLAGS_LONG_LONG;
  403370:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  403377:	eb d3                	jmp    40334c <format_string_loop+0x5fc>
  403379:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403380:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403384:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403388:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40338c:	e9 5c fc ff ff       	jmp    402fed <format_string_loop+0x29d>
  403391:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  403398:	44 89 de             	mov    esi,r11d
  40339b:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  40339e:	85 d2                	test   edx,edx
  4033a0:	0f 85 c2 01 00 00    	jne    403568 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  4033a6:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4033ad:	0f 85 b5 01 00 00    	jne    403568 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4033b3:	41 f6 c3 40          	test   r11b,0x40
  4033b7:	0f 84 6f 03 00 00    	je     40372c <format_string_loop+0x9dc>
  4033bd:	83 f8 2f             	cmp    eax,0x2f
  4033c0:	0f 87 d7 03 00 00    	ja     40379d <format_string_loop+0xa4d>
  4033c6:	89 c2                	mov    edx,eax
  4033c8:	83 c0 08             	add    eax,0x8
  4033cb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4033cf:	89 03                	mov    DWORD PTR [rbx],eax
  4033d1:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  4033d5:	48 83 ec 08          	sub    rsp,0x8
  4033d9:	31 d2                	xor    edx,edx
  4033db:	48 89 ef             	mov    rdi,rbp
  4033de:	45 89 e1             	mov    r9d,r12d
  4033e1:	56                   	push   rsi
  4033e2:	45 89 f8             	mov    r8d,r15d
  4033e5:	4c 89 de             	mov    rsi,r11
  4033e8:	e8 e3 ea ff ff       	call   401ed0 <print_integer>
  while (*format)
  4033ed:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4033f2:	5e                   	pop    rsi
  4033f3:	5f                   	pop    rdi
  4033f4:	e9 55 fa ff ff       	jmp    402e4e <format_string_loop+0xfe>
  4033f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403400:	41 f6 c3 80          	test   r11b,0x80
  403404:	0f 84 06 01 00 00    	je     403510 <format_string_loop+0x7c0>
  40340a:	83 f8 2f             	cmp    eax,0x2f
  40340d:	0f 87 08 03 00 00    	ja     40371b <format_string_loop+0x9cb>
  403413:	89 c6                	mov    esi,eax
  403415:	83 c0 08             	add    eax,0x8
  403418:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40341c:	89 03                	mov    DWORD PTR [rbx],eax
  40341e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403421:	66 89 08             	mov    WORD PTR [rax],cx
  403424:	e9 00 fd ff ff       	jmp    403129 <format_string_loop+0x3d9>
  403429:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  403430:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403434:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403438:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40343c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40343f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403443:	48 85 c0             	test   rax,rax
  403446:	0f 85 11 fd ff ff    	jne    40315d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40344c:	45 89 d8             	mov    r8d,r11d
  40344f:	44 89 e1             	mov    ecx,r12d
  403452:	ba 06 00 00 00       	mov    edx,0x6
  403457:	48 89 ef             	mov    rdi,rbp
  40345a:	48 8d 35 15 1e 00 00 	lea    rsi,[rip+0x1e15]        # 405276 <memcpy+0xdc6>
  403461:	e8 1a e7 ff ff       	call   401b80 <out_rev_>
  403466:	e9 d5 f9 ff ff       	jmp    402e40 <format_string_loop+0xf0>
  40346b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403470:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403474:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403478:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40347c:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40347f:	48 85 f6             	test   rsi,rsi
  403482:	0f 85 4f fc ff ff    	jne    4030d7 <format_string_loop+0x387>
  403488:	45 89 d8             	mov    r8d,r11d
  40348b:	b9 12 00 00 00       	mov    ecx,0x12
  403490:	ba 05 00 00 00       	mov    edx,0x5
  403495:	48 89 ef             	mov    rdi,rbp
  403498:	48 8d 35 de 1d 00 00 	lea    rsi,[rip+0x1dde]        # 40527d <memcpy+0xdcd>
  40349f:	e8 dc e6 ff ff       	call   401b80 <out_rev_>
  4034a4:	e9 97 f9 ff ff       	jmp    402e40 <format_string_loop+0xf0>
  4034a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4034b0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4034b4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4034b8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4034bc:	e9 87 fb ff ff       	jmp    403048 <format_string_loop+0x2f8>
  4034c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  4034c8:	44 89 d8             	mov    eax,r11d
  4034cb:	41 83 cb 20          	or     r11d,0x20
  4034cf:	40 80 fe 58          	cmp    sil,0x58
  4034d3:	b9 10 00 00 00       	mov    ecx,0x10
  4034d8:	44 0f 45 d8          	cmovne r11d,eax
  4034dc:	e9 cf f9 ff ff       	jmp    402eb0 <format_string_loop+0x160>
  4034e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  4034e8:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  4034ef:	e9 90 f9 ff ff       	jmp    402e84 <format_string_loop+0x134>
  4034f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  4034f8:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4034fc:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403500:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403504:	e9 0d fe ff ff       	jmp    403316 <format_string_loop+0x5c6>
  403509:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  403510:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403517:	0f 85 d3 00 00 00    	jne    4035f0 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  40351d:	41 81 e3 00 04 00 00 	and    r11d,0x400
  403524:	0f 85 c6 00 00 00    	jne    4035f0 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  40352a:	83 f8 2f             	cmp    eax,0x2f
  40352d:	0f 87 a4 02 00 00    	ja     4037d7 <format_string_loop+0xa87>
  403533:	89 c6                	mov    esi,eax
  403535:	83 c0 08             	add    eax,0x8
  403538:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40353c:	89 03                	mov    DWORD PTR [rbx],eax
  40353e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403541:	89 08                	mov    DWORD PTR [rax],ecx
  403543:	e9 e1 fb ff ff       	jmp    403129 <format_string_loop+0x3d9>
  403548:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40354f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403550:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403554:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403558:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40355c:	e9 be fb ff ff       	jmp    40311f <format_string_loop+0x3cf>
  403561:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403568:	83 f8 2f             	cmp    eax,0x2f
  40356b:	0f 87 78 01 00 00    	ja     4036e9 <format_string_loop+0x999>
  403571:	89 c7                	mov    edi,eax
  403573:	83 c0 08             	add    eax,0x8
  403576:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40357a:	89 03                	mov    DWORD PTR [rbx],eax
  40357c:	48 83 ec 08          	sub    rsp,0x8
  403580:	45 89 e1             	mov    r9d,r12d
  403583:	45 89 f8             	mov    r8d,r15d
  403586:	31 d2                	xor    edx,edx
  403588:	56                   	push   rsi
  403589:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  40358c:	48 89 ef             	mov    rdi,rbp
  40358f:	e8 3c e9 ff ff       	call   401ed0 <print_integer>
  while (*format)
  403594:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403599:	41 58                	pop    r8
  40359b:	41 59                	pop    r9
  40359d:	e9 ac f8 ff ff       	jmp    402e4e <format_string_loop+0xfe>
  4035a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4035a8:	83 f8 2f             	cmp    eax,0x2f
  4035ab:	0f 87 27 01 00 00    	ja     4036d8 <format_string_loop+0x988>
  4035b1:	89 c2                	mov    edx,eax
  4035b3:	83 c0 08             	add    eax,0x8
  4035b6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4035ba:	89 03                	mov    DWORD PTR [rbx],eax
  4035bc:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4035bf:	45 89 e1             	mov    r9d,r12d
  4035c2:	45 89 f8             	mov    r8d,r15d
  4035c5:	48 89 ef             	mov    rdi,rbp
  4035c8:	48 89 d6             	mov    rsi,rdx
  4035cb:	48 f7 de             	neg    rsi
  4035ce:	48 0f 48 f2          	cmovs  rsi,rdx
  4035d2:	48 83 ec 08          	sub    rsp,0x8
  4035d6:	48 c1 ea 3f          	shr    rdx,0x3f
  4035da:	41 53                	push   r11
  4035dc:	e8 ef e8 ff ff       	call   401ed0 <print_integer>
  while (*format)
  4035e1:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4035e6:	41 5c                	pop    r12
  4035e8:	41 5e                	pop    r14
  4035ea:	e9 5f f8 ff ff       	jmp    402e4e <format_string_loop+0xfe>
  4035ef:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4035f0:	83 f8 2f             	cmp    eax,0x2f
  4035f3:	0f 87 7b 01 00 00    	ja     403774 <format_string_loop+0xa24>
  4035f9:	89 c6                	mov    esi,eax
  4035fb:	83 c0 08             	add    eax,0x8
  4035fe:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  403602:	89 03                	mov    DWORD PTR [rbx],eax
  403604:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403607:	48 89 08             	mov    QWORD PTR [rax],rcx
  40360a:	e9 1a fb ff ff       	jmp    403129 <format_string_loop+0x3d9>
  40360f:	90                   	nop
          while (l++ < width) {
  403610:	41 83 fc 01          	cmp    r12d,0x1
  403614:	76 23                	jbe    403639 <format_string_loop+0x8e9>
  403616:	41 bf 02 00 00 00    	mov    r15d,0x2
  40361c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403620:	be 20 00 00 00       	mov    esi,0x20
  403625:	48 89 ef             	mov    rdi,rbp
  403628:	e8 53 e3 ff ff       	call   401980 <putchar_via_gadget>
          while (l++ < width) {
  40362d:	44 89 f8             	mov    eax,r15d
  403630:	41 83 c7 01          	add    r15d,0x1
  403634:	41 39 c4             	cmp    r12d,eax
  403637:	75 e7                	jne    403620 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403639:	8b 03                	mov    eax,DWORD PTR [rbx]
  40363b:	83 f8 2f             	cmp    eax,0x2f
  40363e:	0f 87 b6 00 00 00    	ja     4036fa <format_string_loop+0x9aa>
  403644:	89 c2                	mov    edx,eax
  403646:	83 c0 08             	add    eax,0x8
  403649:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40364d:	89 03                	mov    DWORD PTR [rbx],eax
  40364f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403652:	48 89 ef             	mov    rdi,rbp
  403655:	e8 26 e3 ff ff       	call   401980 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  40365a:	e9 e1 f7 ff ff       	jmp    402e40 <format_string_loop+0xf0>
  40365f:	90                   	nop
            while (l++ < width) {
  403660:	89 c1                	mov    ecx,eax
  403662:	8d 40 01             	lea    eax,[rax+0x1]
  403665:	41 39 cc             	cmp    r12d,ecx
  403668:	0f 86 bc 01 00 00    	jbe    40382a <format_string_loop+0xada>
  40366e:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  403673:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  403677:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40367e:	00 00 
              putchar_via_gadget(output, ' ');
  403680:	be 20 00 00 00       	mov    esi,0x20
  403685:	48 89 ef             	mov    rdi,rbp
  403688:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40368c:	e8 ef e2 ff ff       	call   401980 <putchar_via_gadget>
            while (l++ < width) {
  403691:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  403695:	89 c2                	mov    edx,eax
  403697:	83 c0 01             	add    eax,0x1
  40369a:	41 39 d4             	cmp    r12d,edx
  40369d:	75 e1                	jne    403680 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40369f:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4036a3:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4036a6:	40 84 f6             	test   sil,sil
  4036a9:	0f 84 91 f7 ff ff    	je     402e40 <format_string_loop+0xf0>
  4036af:	45 85 f6             	test   r14d,r14d
  4036b2:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4036b7:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4036bc:	45 85 ff             	test   r15d,r15d
  4036bf:	0f 85 f9 fa ff ff    	jne    4031be <format_string_loop+0x46e>
  4036c5:	84 c0                	test   al,al
  4036c7:	0f 85 f1 fa ff ff    	jne    4031be <format_string_loop+0x46e>
  4036cd:	e9 6e f7 ff ff       	jmp    402e40 <format_string_loop+0xf0>
  4036d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4036d8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036dc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036e0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036e4:	e9 d3 fe ff ff       	jmp    4035bc <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  4036e9:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4036ed:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4036f1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036f5:	e9 82 fe ff ff       	jmp    40357c <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4036fa:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036fe:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403702:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403706:	e9 44 ff ff ff       	jmp    40364f <format_string_loop+0x8ff>
  40370b:	89 c2                	mov    edx,eax
  40370d:	83 c0 08             	add    eax,0x8
  403710:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403714:	89 03                	mov    DWORD PTR [rbx],eax
  403716:	e9 53 f9 ff ff       	jmp    40306e <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  40371b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40371f:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403723:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403727:	e9 f2 fc ff ff       	jmp    40341e <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40372c:	41 81 e3 80 00 00 00 	and    r11d,0x80
  403733:	74 79                	je     4037ae <format_string_loop+0xa5e>
  403735:	83 f8 2f             	cmp    eax,0x2f
  403738:	0f 87 db 00 00 00    	ja     403819 <format_string_loop+0xac9>
  40373e:	89 c2                	mov    edx,eax
  403740:	83 c0 08             	add    eax,0x8
  403743:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403747:	89 03                	mov    DWORD PTR [rbx],eax
  403749:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  40374d:	e9 83 fc ff ff       	jmp    4033d5 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403752:	41 f6 c3 80          	test   r11b,0x80
  403756:	74 2d                	je     403785 <format_string_loop+0xa35>
  403758:	83 f8 2f             	cmp    eax,0x2f
  40375b:	0f 87 a7 00 00 00    	ja     403808 <format_string_loop+0xab8>
  403761:	89 c2                	mov    edx,eax
  403763:	83 c0 08             	add    eax,0x8
  403766:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40376a:	89 03                	mov    DWORD PTR [rbx],eax
  40376c:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  40376f:	e9 a4 f7 ff ff       	jmp    402f18 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403774:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403778:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40377c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403780:	e9 7f fe ff ff       	jmp    403604 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403785:	83 f8 2f             	cmp    eax,0x2f
  403788:	76 6c                	jbe    4037f6 <format_string_loop+0xaa6>
  40378a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40378e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403792:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403796:	8b 02                	mov    eax,DWORD PTR [rdx]
  403798:	e9 7b f7 ff ff       	jmp    402f18 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  40379d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037a1:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037a5:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037a9:	e9 23 fc ff ff       	jmp    4033d1 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4037ae:	83 f8 2f             	cmp    eax,0x2f
  4037b1:	77 35                	ja     4037e8 <format_string_loop+0xa98>
  4037b3:	89 c2                	mov    edx,eax
  4037b5:	83 c0 08             	add    eax,0x8
  4037b8:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037bc:	89 03                	mov    DWORD PTR [rbx],eax
  4037be:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  4037c1:	e9 0f fc ff ff       	jmp    4033d5 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  4037c6:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037ca:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037ce:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037d2:	e9 3e f7 ff ff       	jmp    402f15 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  4037d7:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4037db:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4037df:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037e3:	e9 56 fd ff ff       	jmp    40353e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4037e8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037ec:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037f0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037f4:	eb c8                	jmp    4037be <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4037f6:	89 c2                	mov    edx,eax
  4037f8:	83 c0 08             	add    eax,0x8
  4037fb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037ff:	89 03                	mov    DWORD PTR [rbx],eax
  403801:	8b 02                	mov    eax,DWORD PTR [rdx]
  403803:	e9 10 f7 ff ff       	jmp    402f18 <format_string_loop+0x1c8>
  403808:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40380c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403810:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403814:	e9 53 ff ff ff       	jmp    40376c <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403819:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40381d:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403821:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403825:	e9 1f ff ff ff       	jmp    403749 <format_string_loop+0x9f9>
            while (l++ < width) {
  40382a:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  40382e:	e9 6c fe ff ff       	jmp    40369f <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000403840 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  403840:	53                   	push   rbx
  403841:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  403844:	e8 07 f5 ff ff       	call   402d50 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  403849:	48 89 df             	mov    rdi,rbx
  40384c:	e8 6f e1 ff ff       	call   4019c0 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  403851:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  403854:	5b                   	pop    rbx
  403855:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000403860 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  403860:	f3 0f 1e fa          	endbr64 
  403864:	55                   	push   rbp
  403865:	49 89 f3             	mov    r11,rsi
  403868:	49 89 fa             	mov    r10,rdi
  40386b:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  40386f:	48 89 e5             	mov    rbp,rsp
  403872:	48 89 ef             	mov    rdi,rbp
  403875:	e8 56 e2 ff ff       	call   401ad0 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  40387a:	48 89 ef             	mov    rdi,rbp
  40387d:	4c 89 da             	mov    rdx,r11
  403880:	4c 89 d6             	mov    rsi,r10
  403883:	e8 b8 ff ff ff       	call   403840 <vsnprintf_impl>
}
  403888:	48 83 c4 20          	add    rsp,0x20
  40388c:	5d                   	pop    rbp
  40388d:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403890 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403890:	f3 0f 1e fa          	endbr64 
  403894:	55                   	push   rbp
  403895:	49 89 d1             	mov    r9,rdx
  403898:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  40389b:	48 89 f2             	mov    rdx,rsi
  40389e:	48 89 fe             	mov    rsi,rdi
{
  4038a1:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  4038a5:	48 89 e5             	mov    rbp,rsp
  4038a8:	48 89 ef             	mov    rdi,rbp
  4038ab:	e8 80 e1 ff ff       	call   401a30 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  4038b0:	48 89 ef             	mov    rdi,rbp
  4038b3:	4c 89 d2             	mov    rdx,r10
  4038b6:	4c 89 ce             	mov    rsi,r9
  4038b9:	e8 82 ff ff ff       	call   403840 <vsnprintf_impl>
}
  4038be:	48 83 c4 20          	add    rsp,0x20
  4038c2:	5d                   	pop    rbp
  4038c3:	c3                   	ret    

Disassembly of section .text.vsprintf:

00000000004038d0 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  4038d0:	f3 0f 1e fa          	endbr64 
  4038d4:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  4038d7:	48 89 f2             	mov    rdx,rsi
  4038da:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4038df:	e9 ac ff ff ff       	jmp    403890 <vsnprintf>

Disassembly of section .text.vfctprintf:

00000000004038f0 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  4038f0:	f3 0f 1e fa          	endbr64 
  4038f4:	55                   	push   rbp
  4038f5:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  4038f8:	48 89 f2             	mov    rdx,rsi
  4038fb:	48 89 fe             	mov    rsi,rdi
{
  4038fe:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403902:	48 89 e5             	mov    rbp,rsp
  403905:	48 89 ef             	mov    rdi,rbp
  403908:	e8 83 e1 ff ff       	call   401a90 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  40390d:	48 89 ef             	mov    rdi,rbp
  403910:	48 89 ca             	mov    rdx,rcx
  403913:	4c 89 ce             	mov    rsi,r9
  403916:	e8 25 ff ff ff       	call   403840 <vsnprintf_impl>
}
  40391b:	48 83 c4 20          	add    rsp,0x20
  40391f:	5d                   	pop    rbp
  403920:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403930 <printf>:

int printf_(const char* format, ...)
{
  403930:	f3 0f 1e fa          	endbr64 
  403934:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40393b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403940:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403945:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40394a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40394f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403954:	84 c0                	test   al,al
  403956:	74 37                	je     40398f <printf+0x5f>
  403958:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40395d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403962:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403967:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40396e:	00 
  40396f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403976:	00 
  403977:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40397e:	00 
  40397f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403986:	00 
  403987:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40398e:	00 
  va_list args;
  va_start(args, format);
  40398f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403996:	00 
  const int ret = vprintf_(format, args);
  403997:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  40399c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  4039a3:	00 
  4039a4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4039a9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4039ae:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4039b5:	00 
  4039b6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  4039bb:	e8 a0 fe ff ff       	call   403860 <vprintf>
  va_end(args);
  return ret;
}
  4039c0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4039c7:	c3                   	ret    

Disassembly of section .text.sprintf:

00000000004039d0 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  4039d0:	f3 0f 1e fa          	endbr64 
  4039d4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4039db:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4039e0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4039e5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4039ea:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4039ef:	84 c0                	test   al,al
  4039f1:	74 37                	je     403a2a <sprintf+0x5a>
  4039f3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4039f8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4039fd:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403a02:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403a09:	00 
  403a0a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403a11:	00 
  403a12:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403a19:	00 
  403a1a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403a21:	00 
  403a22:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403a29:	00 
  va_list args;
  va_start(args, format);
  403a2a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403a31:	00 
  const int ret = vsprintf_(s, format, args);
  403a32:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403a37:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403a3e:	00 
  403a3f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403a44:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403a49:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403a50:	00 
  403a51:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403a56:	e8 75 fe ff ff       	call   4038d0 <vsprintf>
  va_end(args);
  return ret;
}
  403a5b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403a62:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403a70 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403a70:	f3 0f 1e fa          	endbr64 
  403a74:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403a7b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403a80:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403a85:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403a8a:	84 c0                	test   al,al
  403a8c:	74 37                	je     403ac5 <snprintf+0x55>
  403a8e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403a93:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403a98:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403a9d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403aa4:	00 
  403aa5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403aac:	00 
  403aad:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403ab4:	00 
  403ab5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403abc:	00 
  403abd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403ac4:	00 
  va_list args;
  va_start(args, format);
  403ac5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403acc:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403acd:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403ad2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403ad9:	00 
  403ada:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403adf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403ae4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403aeb:	00 
  403aec:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403af1:	e8 9a fd ff ff       	call   403890 <vsnprintf>
  va_end(args);
  return ret;
}
  403af6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403afd:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403b00 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403b00:	f3 0f 1e fa          	endbr64 
  403b04:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403b0b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403b10:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403b15:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403b1a:	84 c0                	test   al,al
  403b1c:	74 37                	je     403b55 <fctprintf+0x55>
  403b1e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403b23:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403b28:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403b2d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403b34:	00 
  403b35:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403b3c:	00 
  403b3d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403b44:	00 
  403b45:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403b4c:	00 
  403b4d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403b54:	00 
  va_list args;
  va_start(args, format);
  403b55:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403b5c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403b5d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403b62:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403b69:	00 
  403b6a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403b6f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403b74:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403b7b:	00 
  403b7c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403b81:	e8 6a fd ff ff       	call   4038f0 <vfctprintf>
  va_end(args);
  return ret;
}
  403b86:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403b8d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403b90 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403b90:	f3 0f 1e fa          	endbr64 
  403b94:	41 54                	push   r12
  403b96:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403b99:	40 0f be ff          	movsx  edi,dil
  403b9d:	e8 0e 00 00 00       	call   403bb0 <putchar_>
	return c;
}
  403ba2:	44 89 e0             	mov    eax,r12d
  403ba5:	41 5c                	pop    r12
  403ba7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403bb0 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403bb0:	f3 0f 1e fa          	endbr64 
  403bb4:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403bb8:	ba 01 00 00 00       	mov    edx,0x1
  403bbd:	31 c0                	xor    eax,eax
void putchar_(char c){
  403bbf:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403bc4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403bc9:	bf 01 00 00 00       	mov    edi,0x1
  403bce:	e8 5d d4 ff ff       	call   401030 <write>
  403bd3:	48 83 c4 18          	add    rsp,0x18
  403bd7:	c3                   	ret    

Disassembly of section .text.max:

0000000000403be0 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403be0:	48 39 f7             	cmp    rdi,rsi
  403be3:	48 89 f0             	mov    rax,rsi
  403be6:	48 0f 43 c7          	cmovae rax,rdi
}
  403bea:	c3                   	ret    

Disassembly of section .text.align:

0000000000403bf0 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403bf0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403bf5:	48 f7 de             	neg    rsi
  403bf8:	48 21 f0             	and    rax,rsi
}
  403bfb:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403c00 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403c00:	31 c0                	xor    eax,eax
  403c02:	83 ff 01             	cmp    edi,0x1
  403c05:	76 4e                	jbe    403c55 <granules_to_chunk_kind+0x55>
  403c07:	b8 01 00 00 00       	mov    eax,0x1
  403c0c:	83 ff 02             	cmp    edi,0x2
  403c0f:	74 44                	je     403c55 <granules_to_chunk_kind+0x55>
  403c11:	83 ff 03             	cmp    edi,0x3
  403c14:	74 5a                	je     403c70 <granules_to_chunk_kind+0x70>
  403c16:	83 ff 04             	cmp    edi,0x4
  403c19:	74 45                	je     403c60 <granules_to_chunk_kind+0x60>
  403c1b:	83 ff 05             	cmp    edi,0x5
  403c1e:	74 60                	je     403c80 <granules_to_chunk_kind+0x80>
  403c20:	83 ff 06             	cmp    edi,0x6
  403c23:	74 2b                	je     403c50 <granules_to_chunk_kind+0x50>
  403c25:	b8 06 00 00 00       	mov    eax,0x6
  403c2a:	83 ff 08             	cmp    edi,0x8
  403c2d:	76 26                	jbe    403c55 <granules_to_chunk_kind+0x55>
  403c2f:	b8 07 00 00 00       	mov    eax,0x7
  403c34:	83 ff 0a             	cmp    edi,0xa
  403c37:	76 1c                	jbe    403c55 <granules_to_chunk_kind+0x55>
  403c39:	b8 08 00 00 00       	mov    eax,0x8
  403c3e:	83 ff 10             	cmp    edi,0x10
  403c41:	76 12                	jbe    403c55 <granules_to_chunk_kind+0x55>
  403c43:	83 ff 21             	cmp    edi,0x21
  403c46:	19 c0                	sbb    eax,eax
  403c48:	24 0a                	and    al,0xa
  403c4a:	05 ff 00 00 00       	add    eax,0xff
  403c4f:	c3                   	ret    
  403c50:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403c55:	c3                   	ret    
  403c56:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c5d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403c60:	b8 03 00 00 00       	mov    eax,0x3
  403c65:	c3                   	ret    
  403c66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c6d:	00 00 00 
  403c70:	b8 02 00 00 00       	mov    eax,0x2
  403c75:	c3                   	ret    
  403c76:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403c7d:	00 00 00 
  403c80:	b8 04 00 00 00       	mov    eax,0x4
  403c85:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403c90 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403c90:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403c95:	83 ff 09             	cmp    edi,0x9
  403c98:	77 0c                	ja     403ca6 <chunk_kind_to_granules+0x16>
  403c9a:	89 ff                	mov    edi,edi
  403c9c:	48 8d 05 bd 18 00 00 	lea    rax,[rip+0x18bd]        # 405560 <CSWTCH.34>
  403ca3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403ca6:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403cb0 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403cb0:	48 89 f8             	mov    rax,rdi
  403cb3:	66 31 c0             	xor    ax,ax
}
  403cb6:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403cc0 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403cc0:	89 f8                	mov    eax,edi
  403cc2:	0f b6 c4             	movzx  eax,ah
}
  403cc5:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403cd0 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403cd0:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403cd4:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403ce0 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403ce0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403ce4:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403cf0 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403cf0:	89 f6                	mov    esi,esi
  403cf2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403cf5:	48 c1 e6 08          	shl    rsi,0x8
  403cf9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403cfd:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403d00 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403d00:	48 8b 0d e1 1a 00 00 	mov    rcx,QWORD PTR [rip+0x1ae1]        # 4057e8 <large_objects>
  403d07:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403d0e:	00 
  403d0f:	76 07                	jbe    403d18 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403d11:	c3                   	ret    
  403d12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403d18:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403d1b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403d20:	e8 9b ff ff ff       	call   403cc0 <get_chunk_index>
  403d25:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403d27:	e8 84 ff ff ff       	call   403cb0 <get_page>
  403d2c:	48 89 c7             	mov    rdi,rax
  403d2f:	e8 bc ff ff ff       	call   403cf0 <allocate_chunk>
		large_objects = large_objects->next;
  403d34:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403d37:	48 89 15 aa 1a 00 00 	mov    QWORD PTR [rip+0x1aaa],rdx        # 4057e8 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403d3e:	48 8b 15 03 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b03]        # 405848 <small_object_freelists+0x48>
  403d45:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403d48:	48 89 05 f9 1a 00 00 	mov    QWORD PTR [rip+0x1af9],rax        # 405848 <small_object_freelists+0x48>
}
  403d4f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403d50 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403d50:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403d54:	48 c1 e8 03          	shr    rax,0x3
}
  403d58:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403d59 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403d59:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403d60 <maybe_merge_free_large_object>:
{
  403d60:	53                   	push   rbx
	struct large_object* obj = *prev;
  403d61:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403d64:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403d67:	48 8d 1d 7a 1a 00 00 	lea    rbx,[rip+0x1a7a]        # 4057e8 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403d6e:	4c 89 df             	mov    rdi,r11
  403d71:	e8 5a ff ff ff       	call   403cd0 <get_large_object_payload>
  403d76:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403d7a:	49 89 c2             	mov    r10,rax
  403d7d:	0f 1f 00             	nop    DWORD PTR [rax]
  403d80:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403d84:	be 00 01 00 00       	mov    esi,0x100
  403d89:	48 89 d7             	mov    rdi,rdx
  403d8c:	e8 5f fe ff ff       	call   403bf0 <align>
  403d91:	48 39 c2             	cmp    rdx,rax
  403d94:	0f 85 bf ff ff ff    	jne    403d59 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403d9a:	e8 21 ff ff ff       	call   403cc0 <get_chunk_index>
  403d9f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403da1:	85 c9                	test   ecx,ecx
  403da3:	74 53                	je     403df8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403da5:	e8 06 ff ff ff       	call   403cb0 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403daa:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403dae:	75 48                	jne    403df8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403db0:	48 8b 05 31 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a31]        # 4057e8 <large_objects>
			ASSERT(walk);
  403db7:	48 85 c0             	test   rax,rax
  403dba:	0f 84 99 ff ff ff    	je     403d59 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403dc0:	48 39 c2             	cmp    rdx,rax
  403dc3:	74 3b                	je     403e00 <maybe_merge_free_large_object+0xa0>
  403dc5:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403dc8:	48 89 c1             	mov    rcx,rax
  403dcb:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  403dce:	48 85 c0             	test   rax,rax
  403dd1:	74 32                	je     403e05 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  403dd3:	48 39 c2             	cmp    rdx,rax
  403dd6:	75 f0                	jne    403dc8 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403dd8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  403ddc:	4c 39 c8             	cmp    rax,r9
  403ddf:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403de3:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  403de8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403deb:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  403def:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  403df2:	eb 8c                	jmp    403d80 <maybe_merge_free_large_object+0x20>
  403df4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  403df8:	4c 89 c8             	mov    rax,r9
  403dfb:	5b                   	pop    rbx
  403dfc:	c3                   	ret    
  403dfd:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403e00:	48 89 d9             	mov    rcx,rbx
  403e03:	eb d3                	jmp    403dd8 <maybe_merge_free_large_object+0x78>
  403e05:	e9 4f ff ff ff       	jmp    403d59 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000403e10 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  403e10:	8b 05 c6 19 00 00    	mov    eax,DWORD PTR [rip+0x19c6]        # 4057dc <pending_large_object_compact>
  403e16:	85 c0                	test   eax,eax
  403e18:	74 2c                	je     403e46 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  403e1a:	48 83 3d c6 19 00 00 	cmp    QWORD PTR [rip+0x19c6],0x0        # 4057e8 <large_objects>
  403e21:	00 
		pending_large_object_compact = 0;
  403e22:	c7 05 b0 19 00 00 00 	mov    DWORD PTR [rip+0x19b0],0x0        # 4057dc <pending_large_object_compact>
  403e29:	00 00 00 
		while(*prev)
  403e2c:	74 18                	je     403e46 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  403e2e:	48 8d 3d b3 19 00 00 	lea    rdi,[rip+0x19b3]        # 4057e8 <large_objects>
  403e35:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403e38:	e8 23 ff ff ff       	call   403d60 <maybe_merge_free_large_object>
  403e3d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403e40:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403e44:	75 f2                	jne    403e38 <maybe_compact_free_large_objects+0x28>
}
  403e46:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403e47 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403e47:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403e50 <get_small_object_freelist>:
  403e50:	83 ff 09             	cmp    edi,0x9
  403e53:	0f 87 ee ff ff ff    	ja     403e47 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403e59:	89 ff                	mov    edi,edi
  403e5b:	48 8d 05 9e 19 00 00 	lea    rax,[rip+0x199e]        # 405800 <small_object_freelists>
  403e62:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403e66:	c3                   	ret    

Disassembly of section .text.free:

0000000000403e70 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  403e70:	f3 0f 1e fa          	endbr64 
  403e74:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  403e77:	48 85 ff             	test   rdi,rdi
  403e7a:	74 2a                	je     403ea6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  403e7c:	e8 2f fe ff ff       	call   403cb0 <get_page>
  403e81:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  403e84:	e8 37 fe ff ff       	call   403cc0 <get_chunk_index>
  403e89:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  403e8b:	89 c0                	mov    eax,eax
  403e8d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  403e92:	40 80 ff ff          	cmp    dil,0xff
  403e96:	74 18                	je     403eb0 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  403e98:	e8 b3 ff ff ff       	call   403e50 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  403e9d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403ea0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  403ea3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  403ea6:	c3                   	ret    
  403ea7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  403eae:	00 00 
		struct large_object* obj = get_large_object(ptr);
  403eb0:	4c 89 c7             	mov    rdi,r8
  403eb3:	e8 28 fe ff ff       	call   403ce0 <get_large_object>
		obj->next = large_objects;
  403eb8:	48 8b 15 29 19 00 00 	mov    rdx,QWORD PTR [rip+0x1929]        # 4057e8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403ebf:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  403ec2:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403ec5:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  403eca:	48 89 05 17 19 00 00 	mov    QWORD PTR [rip+0x1917],rax        # 4057e8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403ed1:	e8 1a fe ff ff       	call   403cf0 <allocate_chunk>
		pending_large_object_compact = 1;
  403ed6:	c7 05 fc 18 00 00 01 	mov    DWORD PTR [rip+0x18fc],0x1        # 4057dc <pending_large_object_compact>
  403edd:	00 00 00 
  403ee0:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000403ef0 <heap_size_in_pages>:
int heap_size_in_pages()
{
  403ef0:	f3 0f 1e fa          	endbr64 
  403ef4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  403ef8:	31 ff                	xor    edi,edi
  403efa:	e8 81 d2 ff ff       	call   401180 <sbrk>
  403eff:	48 c7 c2 50 58 40 00 	mov    rdx,0x405850
  403f06:	2b 02                	sub    eax,DWORD PTR [rdx]
  403f08:	48 83 c4 08          	add    rsp,0x8
  403f0c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

0000000000403f0d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  403f0d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000403f10 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f10:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f12:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f14:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  403f16:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403f1d:	55                   	push   rbp
  403f1e:	48 89 f5             	mov    rbp,rsi
  403f21:	53                   	push   rbx
  403f22:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f26:	e8 c5 ff ff ff       	call   403ef0 <heap_size_in_pages>
	if(!walloc_heap_size)
  403f2b:	48 8b 3d ae 18 00 00 	mov    rdi,QWORD PTR [rip+0x18ae]        # 4057e0 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403f32:	c1 e0 10             	shl    eax,0x10
  403f35:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  403f38:	48 85 ff             	test   rdi,rdi
  403f3b:	75 63                	jne    403fa0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403f3d:	48 c7 c7 50 58 40 00 	mov    rdi,0x405850
  403f44:	be 00 00 01 00       	mov    esi,0x10000
  403f49:	e8 a2 fc ff ff       	call   403bf0 <align>
		walloc_heap_size = preallocated;
  403f4e:	48 89 1d 8b 18 00 00 	mov    QWORD PTR [rip+0x188b],rbx        # 4057e0 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403f55:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  403f58:	49 39 dc             	cmp    r12,rbx
  403f5b:	0f 87 94 00 00 00    	ja     403ff5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  403f61:	48 85 db             	test   rbx,rbx
  403f64:	0f 84 a3 ff ff ff    	je     403f0d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  403f6a:	be 00 00 01 00       	mov    esi,0x10000
  403f6f:	48 89 df             	mov    rdi,rbx
  403f72:	e8 79 fc ff ff       	call   403bf0 <align>
  403f77:	48 39 c3             	cmp    rbx,rax
  403f7a:	0f 85 8d ff ff ff    	jne    403f0d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  403f80:	48 c1 eb 10          	shr    rbx,0x10
  403f84:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  403f88:	48 83 c4 08          	add    rsp,0x8
  403f8c:	4c 89 c0             	mov    rax,r8
  403f8f:	5b                   	pop    rbx
  403f90:	5d                   	pop    rbp
  403f91:	41 5c                	pop    r12
  403f93:	41 5d                	pop    r13
  403f95:	c3                   	ret    
  403f96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403f9d:	00 00 00 
	if(preallocated < needed)
  403fa0:	4d 85 e4             	test   r12,r12
  403fa3:	74 5e                	je     404003 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  403fa5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403fa8:	4c 89 e6             	mov    rsi,r12
  403fab:	48 d1 ef             	shr    rdi,1
  403fae:	e8 2d fc ff ff       	call   403be0 <max>
  403fb3:	be 00 00 01 00       	mov    esi,0x10000
  403fb8:	48 89 c7             	mov    rdi,rax
  403fbb:	e8 30 fc ff ff       	call   403bf0 <align>
  403fc0:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  403fc3:	48 85 c0             	test   rax,rax
  403fc6:	0f 84 41 ff ff ff    	je     403f0d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  403fcc:	48 89 c7             	mov    rdi,rax
  403fcf:	e8 ac d1 ff ff       	call   401180 <sbrk>
  403fd4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  403fd8:	74 16                	je     403ff0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  403fda:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  403fdd:	4c 01 25 fc 17 00 00 	add    QWORD PTR [rip+0x17fc],r12        # 4057e0 <walloc_heap_size>
	size_t size = grow + preallocated;
  403fe4:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  403fe8:	e9 74 ff ff ff       	jmp    403f61 <allocate_pages.constprop.0+0x51>
  403fed:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  403ff0:	45 31 c0             	xor    r8d,r8d
  403ff3:	eb 93                	jmp    403f88 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  403ff5:	49 29 dc             	sub    r12,rbx
  403ff8:	48 89 df             	mov    rdi,rbx
  403ffb:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  403ffe:	48 89 c3             	mov    rbx,rax
  404001:	eb a5                	jmp    403fa8 <allocate_pages.constprop.0+0x98>
  404003:	e9 05 ff ff ff       	jmp    403f0d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000404008 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  404008:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000404010 <allocate_large_object>:
{
  404010:	41 54                	push   r12
  404012:	55                   	push   rbp
  404013:	53                   	push   rbx
  404014:	48 89 fb             	mov    rbx,rdi
  404017:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  40401b:	e8 f0 fd ff ff       	call   403e10 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404020:	48 8b 15 c1 17 00 00 	mov    rdx,QWORD PTR [rip+0x17c1]        # 4057e8 <large_objects>
  404027:	48 85 d2             	test   rdx,rdx
  40402a:	0f 84 da 01 00 00    	je     40420a <allocate_large_object+0x1fa>
  404030:	4c 8d 0d b1 17 00 00 	lea    r9,[rip+0x17b1]        # 4057e8 <large_objects>
	size_t best_size = -1;
  404037:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  40403e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  404042:	45 31 d2             	xor    r10d,r10d
  404045:	4c 89 cd             	mov    rbp,r9
  404048:	eb 11                	jmp    40405b <allocate_large_object+0x4b>
  40404a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  404050:	49 89 d1             	mov    r9,rdx
  404053:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404056:	48 85 d2             	test   rdx,rdx
  404059:	74 39                	je     404094 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40405b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40405f:	4c 39 c1             	cmp    rcx,r8
  404062:	73 ec                	jae    404050 <allocate_large_object+0x40>
  404064:	48 39 d9             	cmp    rcx,rbx
  404067:	72 e7                	jb     404050 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  404069:	be 00 01 00 00       	mov    esi,0x100
  40406e:	e8 7d fb ff ff       	call   403bf0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  404073:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  404077:	48 39 c6             	cmp    rsi,rax
  40407a:	0f 84 88 02 00 00    	je     404308 <allocate_large_object+0x2f8>
  404080:	4c 89 cd             	mov    rbp,r9
  404083:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  404086:	49 89 d1             	mov    r9,rdx
  404089:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40408c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  40408f:	48 85 d2             	test   rdx,rdx
  404092:	75 c7                	jne    40405b <allocate_large_object+0x4b>
	if(!best)
  404094:	4d 85 d2             	test   r10,r10
  404097:	0f 84 7b 01 00 00    	je     404218 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  40409d:	4c 89 d7             	mov    rdi,r10
  4040a0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4040a5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4040a8:	e8 13 fc ff ff       	call   403cc0 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4040ad:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4040b0:	89 c6                	mov    esi,eax
  4040b2:	e8 f9 fb ff ff       	call   403cb0 <get_page>
  4040b7:	48 89 c7             	mov    rdi,rax
  4040ba:	49 89 c1             	mov    r9,rax
  4040bd:	e8 2e fc ff ff       	call   403cf0 <allocate_chunk>
	struct large_object* next = best->next;
  4040c2:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  4040c5:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  4040c9:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  4040d0:	75 36                	jne    404108 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  4040d2:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  4040d6:	4c 89 d7             	mov    rdi,r10
  4040d9:	be 00 01 00 00       	mov    esi,0x100
  4040de:	e8 ed fb ff ff       	call   403cd0 <get_large_object_payload>
  4040e3:	48 01 c2             	add    rdx,rax
  4040e6:	48 89 d7             	mov    rdi,rdx
  4040e9:	e8 02 fb ff ff       	call   403bf0 <align>
  4040ee:	48 39 c2             	cmp    rdx,rax
  4040f1:	0f 85 11 ff ff ff    	jne    404008 <allocate_large_object.cold>
}
  4040f7:	48 83 c4 10          	add    rsp,0x10
  4040fb:	4c 89 d0             	mov    rax,r10
  4040fe:	5b                   	pop    rbx
  4040ff:	5d                   	pop    rbp
  404100:	41 5c                	pop    r12
  404102:	c3                   	ret    
  404103:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  404108:	4c 89 d7             	mov    rdi,r10
  40410b:	e8 c0 fb ff ff       	call   403cd0 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  404110:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  404113:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  404117:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  40411a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  40411d:	4c 01 df             	add    rdi,r11
  404120:	e8 8b fb ff ff       	call   403cb0 <get_page>
  404125:	49 39 c1             	cmp    r9,rax
  404128:	0f 84 e8 01 00 00    	je     404316 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  40412e:	be 00 00 01 00       	mov    esi,0x10000
  404133:	4c 89 df             	mov    rdi,r11
  404136:	e8 b5 fa ff ff       	call   403bf0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40413b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  404142:	0f 86 38 01 00 00    	jbe    404280 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404148:	4c 39 d8             	cmp    rax,r11
  40414b:	0f 85 b7 fe ff ff    	jne    404008 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404151:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404154:	be 00 00 01 00       	mov    esi,0x10000
  404159:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  404160:	ff 
			tail_size = best_size - size;
  404161:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  404168:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404169:	e8 82 fa ff ff       	call   403bf0 <align>
		best->size -= tail_size;
  40416e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  404172:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  404175:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404178:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  40417b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40417f:	48 29 cf             	sub    rdi,rcx
  404182:	e8 39 fb ff ff       	call   403cc0 <get_chunk_index>
  404187:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404189:	48 85 c9             	test   rcx,rcx
  40418c:	0f 84 44 ff ff ff    	je     4040d6 <allocate_large_object+0xc6>
  404192:	85 c0                	test   eax,eax
  404194:	75 0c                	jne    4041a2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  404196:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  40419d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  4041a2:	48 85 c9             	test   rcx,rcx
  4041a5:	0f 84 2b ff ff ff    	je     4040d6 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  4041ab:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4041ae:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  4041b3:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4041b6:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  4041ba:	e8 f1 fa ff ff       	call   403cb0 <get_page>
  4041bf:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4041c2:	e8 29 fb ff ff       	call   403cf0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041c7:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4041cc:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  4041cf:	48 8b 05 12 16 00 00 	mov    rax,QWORD PTR [rip+0x1612]        # 4057e8 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4041d6:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041da:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  4041dd:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4041e0:	e8 eb fa ff ff       	call   403cd0 <get_large_object_payload>
  4041e5:	48 01 c1             	add    rcx,rax
  4041e8:	48 89 cf             	mov    rdi,rcx
  4041eb:	e8 00 fa ff ff       	call   403bf0 <align>
  4041f0:	48 39 c1             	cmp    rcx,rax
  4041f3:	0f 85 0f fe ff ff    	jne    404008 <allocate_large_object.cold>
			large_objects = tail;
  4041f9:	48 89 15 e8 15 00 00 	mov    QWORD PTR [rip+0x15e8],rdx        # 4057e8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404200:	e8 fb fa ff ff       	call   403d00 <maybe_repurpose_single_chunk_large_objects_head>
  404205:	e9 c8 fe ff ff       	jmp    4040d2 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  40420a:	48 8d 2d d7 15 00 00 	lea    rbp,[rip+0x15d7]        # 4057e8 <large_objects>
  404211:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  404218:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40421c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  404221:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  404228:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40422a:	4c 89 e7             	mov    rdi,r12
  40422d:	e8 de fc ff ff       	call   403f10 <allocate_pages.constprop.0>
  404232:	48 89 c1             	mov    rcx,rax
		if(!page)
  404235:	48 85 c0             	test   rax,rax
  404238:	0f 84 10 01 00 00    	je     40434e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40423e:	ba ff 00 00 00       	mov    edx,0xff
  404243:	be 01 00 00 00       	mov    esi,0x1
  404248:	48 89 c7             	mov    rdi,rax
  40424b:	e8 a0 fa ff ff       	call   403cf0 <allocate_chunk>
  404250:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  404253:	48 8b 05 8e 15 00 00 	mov    rax,QWORD PTR [rip+0x158e]        # 4057e8 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40425a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40425d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  404260:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  404265:	48 c1 e0 10          	shl    rax,0x10
  404269:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  40426e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  404272:	4d 39 c4             	cmp    r12,r8
  404275:	0f 86 22 fe ff ff    	jbe    40409d <allocate_large_object+0x8d>
  40427b:	e9 88 fd ff ff       	jmp    404008 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404280:	4c 39 d8             	cmp    rax,r11
  404283:	0f 85 7f fd ff ff    	jne    404008 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404289:	48 89 ef             	mov    rdi,rbp
  40428c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404291:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404295:	e8 26 fa ff ff       	call   403cc0 <get_chunk_index>
  40429a:	4c 89 cf             	mov    rdi,r9
  40429d:	89 c6                	mov    esi,eax
  40429f:	e8 4c fa ff ff       	call   403cf0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4042a4:	b8 00 00 01 00       	mov    eax,0x10000
  4042a9:	4c 29 e0             	sub    rax,r12
  4042ac:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  4042b0:	48 8b 05 31 15 00 00 	mov    rax,QWORD PTR [rip+0x1531]        # 4057e8 <large_objects>
  4042b7:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  4042ba:	4c 89 15 27 15 00 00 	mov    QWORD PTR [rip+0x1527],r10        # 4057e8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4042c1:	e8 3a fa ff ff       	call   403d00 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042c6:	ba ff 00 00 00       	mov    edx,0xff
  4042cb:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  4042d0:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042d7:	e8 14 fa ff ff       	call   403cf0 <allocate_chunk>
			best->size = best_size =
  4042dc:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  4042e3:	ff 
  4042e4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042e8:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  4042eb:	48 39 d3             	cmp    rbx,rdx
  4042ee:	0f 87 14 fd ff ff    	ja     404008 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  4042f4:	48 89 d1             	mov    rcx,rdx
  4042f7:	48 29 d9             	sub    rcx,rbx
  4042fa:	30 c9                	xor    cl,cl
  4042fc:	e9 74 fe ff ff       	jmp    404175 <allocate_large_object+0x165>
  404301:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404308:	4c 89 cd             	mov    rbp,r9
  40430b:	49 89 c8             	mov    r8,rcx
  40430e:	49 89 d2             	mov    r10,rdx
  404311:	e9 87 fd ff ff       	jmp    40409d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404316:	be 00 01 00 00       	mov    esi,0x100
  40431b:	4c 89 df             	mov    rdi,r11
  40431e:	e8 cd f8 ff ff       	call   403bf0 <align>
  404323:	49 39 c3             	cmp    r11,rax
  404326:	0f 85 dc fc ff ff    	jne    404008 <allocate_large_object.cold>
		best->size -= tail_size;
  40432c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404330:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  404333:	48 29 ca             	sub    rdx,rcx
  404336:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40433a:	e8 81 f9 ff ff       	call   403cc0 <get_chunk_index>
  40433f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404341:	85 c0                	test   eax,eax
  404343:	0f 84 4d fe ff ff    	je     404196 <allocate_large_object+0x186>
  404349:	e9 5d fe ff ff       	jmp    4041ab <allocate_large_object+0x19b>
			return NULL;
  40434e:	45 31 d2             	xor    r10d,r10d
  404351:	e9 a1 fd ff ff       	jmp    4040f7 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

0000000000404360 <allocate_large>:
{
  404360:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  404364:	e8 a7 fc ff ff       	call   404010 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  404369:	48 85 c0             	test   rax,rax
  40436c:	74 12                	je     404380 <allocate_large+0x20>
  40436e:	48 89 c7             	mov    rdi,rax
}
  404371:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  404375:	e9 56 f9 ff ff       	jmp    403cd0 <get_large_object_payload>
  40437a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  404380:	31 c0                	xor    eax,eax
  404382:	48 83 c4 08          	add    rsp,0x8
  404386:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

0000000000404390 <obtain_small_objects>:
{
  404390:	55                   	push   rbp
  404391:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  404393:	48 8b 3d ae 14 00 00 	mov    rdi,QWORD PTR [rip+0x14ae]        # 405848 <small_object_freelists+0x48>
  40439a:	48 85 ff             	test   rdi,rdi
  40439d:	74 71                	je     404410 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  40439f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4043a2:	48 89 05 9f 14 00 00 	mov    QWORD PTR [rip+0x149f],rax        # 405848 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4043a9:	e8 12 f9 ff ff       	call   403cc0 <get_chunk_index>
  4043ae:	89 ea                	mov    edx,ebp
  4043b0:	89 c6                	mov    esi,eax
  4043b2:	e8 f9 f8 ff ff       	call   403cb0 <get_page>
  4043b7:	48 89 c7             	mov    rdi,rax
  4043ba:	e8 31 f9 ff ff       	call   403cf0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4043bf:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4043c1:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4043c4:	e8 c7 f8 ff ff       	call   403c90 <chunk_kind_to_granules>
  4043c9:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043d0:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  4043d7:	77 46                	ja     40441f <obtain_small_objects+0x8f>
  4043d9:	48 89 d0             	mov    rax,rdx
  4043dc:	48 89 f1             	mov    rcx,rsi
  4043df:	48 29 f0             	sub    rax,rsi
  4043e2:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  4043e9:	31 c0                	xor    eax,eax
  4043eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  4043f0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043f3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  4043f6:	48 89 d0             	mov    rax,rdx
		head->next = next;
  4043f9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4043fc:	48 29 f2             	sub    rdx,rsi
  4043ff:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  404406:	76 e8                	jbe    4043f0 <obtain_small_objects+0x60>
}
  404408:	5d                   	pop    rbp
  404409:	c3                   	ret    
  40440a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  404410:	31 ff                	xor    edi,edi
  404412:	e8 f9 fb ff ff       	call   404010 <allocate_large_object>
  404417:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40441a:	48 85 c0             	test   rax,rax
  40441d:	75 8a                	jne    4043a9 <obtain_small_objects+0x19>
			return NULL;
  40441f:	31 c0                	xor    eax,eax
}
  404421:	5d                   	pop    rbp
  404422:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000404430 <allocate_small>:
{
  404430:	53                   	push   rbx
  404431:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  404434:	e8 17 fa ff ff       	call   403e50 <get_small_object_freelist>
  404439:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40443c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40443f:	48 85 c0             	test   rax,rax
  404442:	74 0c                	je     404450 <allocate_small+0x20>
	*loc = ret->next;
  404444:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404447:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40444a:	5b                   	pop    rbx
  40444b:	c3                   	ret    
  40444c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  404450:	44 89 c7             	mov    edi,r8d
  404453:	e8 38 ff ff ff       	call   404390 <obtain_small_objects>
		if(!freelist)
  404458:	48 85 c0             	test   rax,rax
  40445b:	74 ed                	je     40444a <allocate_small+0x1a>
		*loc = freelist;
  40445d:	48 89 03             	mov    QWORD PTR [rbx],rax
  404460:	eb e2                	jmp    404444 <allocate_small+0x14>

Disassembly of section .text.malloc:

0000000000404470 <malloc>:
{
  404470:	f3 0f 1e fa          	endbr64 
  404474:	48 83 ec 08          	sub    rsp,0x8
  404478:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  40447b:	e8 d0 f8 ff ff       	call   403d50 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  404480:	89 c7                	mov    edi,eax
  404482:	e8 79 f7 ff ff       	call   403c00 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404487:	3d ff 00 00 00       	cmp    eax,0xff
  40448c:	74 12                	je     4044a0 <malloc+0x30>
  40448e:	89 c7                	mov    edi,eax
}
  404490:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404494:	e9 97 ff ff ff       	jmp    404430 <allocate_small>
  404499:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4044a0:	4c 89 c7             	mov    rdi,r8
}
  4044a3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4044a7:	e9 b4 fe ff ff       	jmp    404360 <allocate_large>

Disassembly of section .text.memcpy:

00000000004044b0 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  4044b0:	f3 0f 1e fa          	endbr64 
  4044b4:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  4044b7:	48 85 d2             	test   rdx,rdx
  4044ba:	74 6c                	je     404528 <memcpy+0x78>
  4044bc:	48 89 f0             	mov    rax,rsi
  4044bf:	48 39 f7             	cmp    rdi,rsi
  4044c2:	74 64                	je     404528 <memcpy+0x78>
  4044c4:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  4044c7:	73 67                	jae    404530 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  4044c9:	48 89 fa             	mov    rdx,rdi
  4044cc:	48 09 f2             	or     rdx,rsi
  4044cf:	83 e2 03             	and    edx,0x3
  4044d2:	0f 85 e8 00 00 00    	jne    4045c0 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  4044d8:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  4044db:	49 89 c9             	mov    r9,rcx
  4044de:	4c 89 c6             	mov    rsi,r8
  4044e1:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  4044e4:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4044e8:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  4044ec:	49 83 fa 03          	cmp    r10,0x3
  4044f0:	76 1f                	jbe    404511 <memcpy+0x61>
  4044f2:	31 d2                	xor    edx,edx
  4044f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4044f8:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  4044fb:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  4044fe:	48 83 c2 01          	add    rdx,0x1
  404502:	48 39 d7             	cmp    rdi,rdx
  404505:	75 f1                	jne    4044f8 <memcpy+0x48>
  404507:	48 c1 e7 02          	shl    rdi,0x2
  40450b:	48 01 f8             	add    rax,rdi
  40450e:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  404511:	4d 85 c9             	test   r9,r9
  404514:	74 12                	je     404528 <memcpy+0x78>
  404516:	31 d2                	xor    edx,edx
  404518:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  40451c:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  40451f:	48 83 c2 01          	add    rdx,0x1
  404523:	49 39 d1             	cmp    r9,rdx
  404526:	75 f0                	jne    404518 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  404528:	4c 89 c0             	mov    rax,r8
  40452b:	c3                   	ret    
  40452c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  404530:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  404534:	48 01 d0             	add    rax,rdx
{
  404537:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  404538:	4c 89 ca             	mov    rdx,r9
{
  40453b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  40453c:	48 09 c2             	or     rdx,rax
  40453f:	83 e2 03             	and    edx,0x3
  404542:	0f 84 b8 00 00 00    	je     404600 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  404548:	4c 89 ca             	mov    rdx,r9
  40454b:	48 31 c2             	xor    rdx,rax
  40454e:	83 e2 03             	and    edx,0x3
  404551:	75 0a                	jne    40455d <memcpy+0xad>
  404553:	48 83 f9 04          	cmp    rcx,0x4
  404557:	0f 87 13 01 00 00    	ja     404670 <memcpy+0x1c0>
  40455d:	31 db                	xor    ebx,ebx
  40455f:	31 d2                	xor    edx,edx
  404561:	31 ed                	xor    ebp,ebp
			length -= t;
  404563:	48 89 ce             	mov    rsi,rcx
  404566:	48 f7 de             	neg    rsi
  404569:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  404570:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  404574:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  404578:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  40457e:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  404583:	48 83 e9 01          	sub    rcx,0x1
  404587:	75 e7                	jne    404570 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404589:	48 83 fd 03          	cmp    rbp,0x3
  40458d:	0f 87 8d 00 00 00    	ja     404620 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  404593:	48 85 db             	test   rbx,rbx
  404596:	74 1c                	je     4045b4 <memcpy+0x104>
  404598:	48 f7 d3             	not    rbx
  40459b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  4045a2:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  4045a7:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  4045ab:	48 83 e8 01          	sub    rax,0x1
  4045af:	48 39 d8             	cmp    rax,rbx
  4045b2:	75 ee                	jne    4045a2 <memcpy+0xf2>
}
  4045b4:	4c 89 c0             	mov    rax,r8
  4045b7:	5b                   	pop    rbx
  4045b8:	5d                   	pop    rbp
  4045b9:	c3                   	ret    
  4045ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  4045c0:	48 89 fa             	mov    rdx,rdi
  4045c3:	48 31 f2             	xor    rdx,rsi
  4045c6:	83 e2 03             	and    edx,0x3
  4045c9:	75 06                	jne    4045d1 <memcpy+0x121>
  4045cb:	48 83 f9 03          	cmp    rcx,0x3
  4045cf:	77 77                	ja     404648 <memcpy+0x198>
  4045d1:	45 31 c9             	xor    r9d,r9d
  4045d4:	31 ff                	xor    edi,edi
  4045d6:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  4045d9:	31 d2                	xor    edx,edx
  4045db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  4045e0:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  4045e4:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  4045e8:	48 83 c2 01          	add    rdx,0x1
  4045ec:	48 39 d1             	cmp    rcx,rdx
  4045ef:	75 ef                	jne    4045e0 <memcpy+0x130>
  4045f1:	48 01 c8             	add    rax,rcx
  4045f4:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  4045f8:	e9 ef fe ff ff       	jmp    4044ec <memcpy+0x3c>
  4045fd:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  404600:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  404603:	48 89 cb             	mov    rbx,rcx
  404606:	48 89 cd             	mov    rbp,rcx
		src += length;
  404609:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  40460c:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404610:	83 e3 03             	and    ebx,0x3
		dst += length;
  404613:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404616:	48 83 fd 03          	cmp    rbp,0x3
  40461a:	0f 86 73 ff ff ff    	jbe    404593 <memcpy+0xe3>
  404620:	48 89 d0             	mov    rax,rdx
  404623:	48 f7 d8             	neg    rax
  404626:	48 c1 e0 02          	shl    rax,0x2
  40462a:	49 01 c3             	add    r11,rax
  40462d:	49 01 c2             	add    r10,rax
  404630:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  404635:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  40463a:	48 83 ea 01          	sub    rdx,0x1
  40463e:	75 f0                	jne    404630 <memcpy+0x180>
  404640:	e9 4e ff ff ff       	jmp    404593 <memcpy+0xe3>
  404645:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  404648:	48 89 f2             	mov    rdx,rsi
  40464b:	83 e2 03             	and    edx,0x3
			length -= t;
  40464e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  404653:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  404658:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  40465b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  40465e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  404661:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404665:	41 83 e1 03          	and    r9d,0x3
  404669:	e9 6b ff ff ff       	jmp    4045d9 <memcpy+0x129>
  40466e:	66 90                	xchg   ax,ax
				t &= wmask;
  404670:	48 89 c6             	mov    rsi,rax
  404673:	83 e6 03             	and    esi,0x3
			length -= t;
  404676:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  404679:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  40467c:	48 89 cb             	mov    rbx,rcx
			length -= t;
  40467f:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  404682:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  404685:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404689:	83 e3 03             	and    ebx,0x3
  40468c:	e9 d2 fe ff ff       	jmp    404563 <memcpy+0xb3>
