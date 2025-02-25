
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
  40005f:	48 8d 05 0a 56 00 00 	lea    rax,[rip+0x560a]        # 405670 <b+0x4>
  400066:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    puts("Gamessis OS shell\n");
  40006a:	48 8d 05 06 56 00 00 	lea    rax,[rip+0x5606]        # 405677 <b+0xb>
  400071:	48 89 c7             	mov    rdi,rax
  400074:	e8 a7 15 00 00       	call   401620 <puts>
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
  4001ed:	e8 ee 14 00 00       	call   4016e0 <memset>
        int p = 0;
  4001f2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
        printf("%s:>", path);
  4001f9:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400200:	48 89 c6             	mov    rsi,rax
  400203:	48 8d 05 80 54 00 00 	lea    rax,[rip+0x5480]        # 40568a <b+0x1e>
  40020a:	48 89 c7             	mov    rdi,rax
  40020d:	b8 00 00 00 00       	mov    eax,0x0
  400212:	e8 c9 37 00 00       	call   4039e0 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400217:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40021e:	48 89 c7             	mov    rdi,rax
  400221:	e8 5a 14 00 00       	call   401680 <gets>
        puts(cmd);
  400226:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40022d:	48 89 c7             	mov    rdi,rax
  400230:	e8 eb 13 00 00       	call   401620 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400235:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40023c:	48 8d 15 4c 54 00 00 	lea    rdx,[rip+0x544c]        # 40568f <b+0x23>
  400243:	48 89 d6             	mov    rsi,rdx
  400246:	48 89 c7             	mov    rdi,rax
  400249:	e8 62 15 00 00       	call   4017b0 <strcmp>
  40024e:	85 c0                	test   eax,eax
  400250:	75 14                	jne    400266 <main+0x22b>
            puts("Gamessis OS 1.0.\n");
  400252:	48 8d 05 3e 54 00 00 	lea    rax,[rip+0x543e]        # 405697 <b+0x2b>
  400259:	48 89 c7             	mov    rdi,rax
  40025c:	e8 bf 13 00 00       	call   401620 <puts>
  400261:	e9 73 ff ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400266:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40026d:	48 8d 15 35 54 00 00 	lea    rdx,[rip+0x5435]        # 4056a9 <b+0x3d>
  400274:	48 89 d6             	mov    rsi,rdx
  400277:	48 89 c7             	mov    rdi,rax
  40027a:	e8 31 15 00 00       	call   4017b0 <strcmp>
  40027f:	85 c0                	test   eax,eax
  400281:	0f 84 d2 0c 00 00    	je     400f59 <main+0xf1e>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400287:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40028e:	48 8d 15 19 54 00 00 	lea    rdx,[rip+0x5419]        # 4056ae <b+0x42>
  400295:	48 89 d6             	mov    rsi,rdx
  400298:	48 89 c7             	mov    rdi,rax
  40029b:	e8 10 15 00 00       	call   4017b0 <strcmp>
  4002a0:	85 c0                	test   eax,eax
  4002a2:	0f 85 8d 00 00 00    	jne    400335 <main+0x2fa>
            // ls
            getcwd(path, 128);
  4002a8:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4002af:	be 80 00 00 00       	mov    esi,0x80
  4002b4:	48 89 c7             	mov    rdi,rax
  4002b7:	e8 c9 12 00 00       	call   401585 <getcwd>
            DIR*           dp = opendir(path);
  4002bc:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4002c3:	48 89 c7             	mov    rdi,rax
  4002c6:	e8 05 0f 00 00       	call   4011d0 <opendir>
  4002cb:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            struct dirent* dirp;
            if (!dp) {
  4002cf:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  4002d4:	75 38                	jne    40030e <main+0x2d3>
                printf("error opening directory\n");
  4002d6:	48 8d 05 d4 53 00 00 	lea    rax,[rip+0x53d4]        # 4056b1 <b+0x45>
  4002dd:	48 89 c7             	mov    rdi,rax
  4002e0:	b8 00 00 00 00       	mov    eax,0x0
  4002e5:	e8 f6 36 00 00       	call   4039e0 <printf>
                continue;
  4002ea:	e9 65 0c 00 00       	jmp    400f54 <main+0xf19>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  4002ef:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4002f3:	48 83 c0 18          	add    rax,0x18
  4002f7:	48 89 c6             	mov    rsi,rax
  4002fa:	48 8d 05 c9 53 00 00 	lea    rax,[rip+0x53c9]        # 4056ca <b+0x5e>
  400301:	48 89 c7             	mov    rdi,rax
  400304:	b8 00 00 00 00       	mov    eax,0x0
  400309:	e8 d2 36 00 00       	call   4039e0 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  40030e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  400312:	48 89 c7             	mov    rdi,rax
  400315:	e8 38 10 00 00       	call   401352 <readdir>
  40031a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  40031e:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  400323:	75 ca                	jne    4002ef <main+0x2b4>
            }
            close(dp);
  400325:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  400329:	89 c7                	mov    edi,eax
  40032b:	e8 00 0d 00 00       	call   401030 <close>
  400330:	e9 a4 fe ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "cd") == 0) {
  400335:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40033c:	48 8d 15 8b 53 00 00 	lea    rdx,[rip+0x538b]        # 4056ce <b+0x62>
  400343:	48 89 d6             	mov    rsi,rdx
  400346:	48 89 c7             	mov    rdi,rax
  400349:	e8 62 14 00 00       	call   4017b0 <strcmp>
  40034e:	85 c0                	test   eax,eax
  400350:	0f 85 1a 02 00 00    	jne    400570 <main+0x535>
            // cd
            char tmppath[128] = {0};
  400356:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40035d:	00 00 00 00 
  400361:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400368:	00 00 00 00 
  40036c:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400373:	00 00 00 00 
  400377:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40037e:	00 00 00 00 
  400382:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400389:	00 00 00 00 
  40038d:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400394:	00 00 00 00 
  400398:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  40039f:	00 00 00 00 
  4003a3:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4003aa:	00 00 00 00 
  4003ae:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4003b5:	00 00 00 00 
  4003b9:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4003c0:	00 00 00 00 
  4003c4:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4003cb:	00 00 00 00 
  4003cf:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4003d6:	00 00 00 00 
  4003da:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  4003e1:	00 00 00 00 
  4003e5:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  4003ec:	00 00 00 00 
  4003f0:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  4003f7:	00 00 00 00 
  4003fb:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  400402:	00 00 00 00 
            printf("enter path:");
  400406:	48 8d 05 c4 52 00 00 	lea    rax,[rip+0x52c4]        # 4056d1 <b+0x65>
  40040d:	48 89 c7             	mov    rdi,rax
  400410:	b8 00 00 00 00       	mov    eax,0x0
  400415:	e8 c6 35 00 00       	call   4039e0 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  40041a:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400421:	48 89 c7             	mov    rdi,rax
  400424:	e8 57 12 00 00       	call   401680 <gets>
            if (chdir(tmppath) == -1) {
  400429:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400430:	48 89 c7             	mov    rdi,rax
  400433:	e8 b8 0f 00 00       	call   4013f0 <chdir>
  400438:	83 f8 ff             	cmp    eax,0xffffffff
  40043b:	75 23                	jne    400460 <main+0x425>
                printf("cannot find directory:%s\n", tmppath);
  40043d:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400444:	48 89 c6             	mov    rsi,rax
  400447:	48 8d 05 8f 52 00 00 	lea    rax,[rip+0x528f]        # 4056dd <b+0x71>
  40044e:	48 89 c7             	mov    rdi,rax
  400451:	b8 00 00 00 00       	mov    eax,0x0
  400456:	e8 85 35 00 00       	call   4039e0 <printf>
                continue;
  40045b:	e9 f4 0a 00 00       	jmp    400f54 <main+0xf19>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(tmppath, "..") == 0) {
  400460:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400467:	48 8d 15 89 52 00 00 	lea    rdx,[rip+0x5289]        # 4056f7 <b+0x8b>
  40046e:	48 89 d6             	mov    rsi,rdx
  400471:	48 89 c7             	mov    rdi,rax
  400474:	e8 37 13 00 00       	call   4017b0 <strcmp>
  400479:	85 c0                	test   eax,eax
  40047b:	75 75                	jne    4004f2 <main+0x4b7>
                char* p = tmppath + strlen(tmppath) - 1;
  40047d:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400484:	48 89 c7             	mov    rdi,rax
  400487:	e8 74 13 00 00       	call   401800 <strlen>
  40048c:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400490:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400497:	48 01 d0             	add    rax,rdx
  40049a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
                while (p > tmppath && *p == '/') {
  40049e:	eb 0f                	jmp    4004af <main+0x474>
                    *p-- = 0;
  4004a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004a4:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004a8:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4004ac:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  4004af:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004b6:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4004ba:	76 1c                	jbe    4004d8 <main+0x49d>
  4004bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004c3:	3c 2f                	cmp    al,0x2f
  4004c5:	74 d9                	je     4004a0 <main+0x465>
                }
                while (p > tmppath && *(p) != '/') {
  4004c7:	eb 0f                	jmp    4004d8 <main+0x49d>
                    *p-- = 0;
  4004c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004cd:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004d1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4004d5:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  4004d8:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004df:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4004e3:	76 68                	jbe    40054d <main+0x512>
  4004e5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004ec:	3c 2f                	cmp    al,0x2f
  4004ee:	75 d9                	jne    4004c9 <main+0x48e>
  4004f0:	eb 5b                	jmp    40054d <main+0x512>
                }
            }
            else if (strcmp(tmppath, ".") == 0) {
  4004f2:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004f9:	48 8d 15 fa 51 00 00 	lea    rdx,[rip+0x51fa]        # 4056fa <b+0x8e>
  400500:	48 89 d6             	mov    rsi,rdx
  400503:	48 89 c7             	mov    rdi,rax
  400506:	e8 a5 12 00 00       	call   4017b0 <strcmp>
  40050b:	85 c0                	test   eax,eax
  40050d:	0f 84 40 0a 00 00    	je     400f53 <main+0xf18>
                continue;
            }
            else {
                strcat(path, tmppath);
  400513:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  40051a:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400521:	48 89 d6             	mov    rsi,rdx
  400524:	48 89 c7             	mov    rdi,rax
  400527:	e8 44 12 00 00       	call   401770 <strcat>
                strcat(path, "/");
  40052c:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400533:	48 89 c7             	mov    rdi,rax
  400536:	e8 c5 12 00 00       	call   401800 <strlen>
  40053b:	48 89 c2             	mov    rdx,rax
  40053e:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400545:	48 01 d0             	add    rax,rdx
  400548:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  40054d:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400554:	48 89 c6             	mov    rsi,rax
  400557:	48 8d 05 9e 51 00 00 	lea    rax,[rip+0x519e]        # 4056fc <b+0x90>
  40055e:	48 89 c7             	mov    rdi,rax
  400561:	b8 00 00 00 00       	mov    eax,0x0
  400566:	e8 75 34 00 00       	call   4039e0 <printf>
  40056b:	e9 69 fc ff ff       	jmp    4001d9 <main+0x19e>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400570:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400577:	48 8d 15 94 51 00 00 	lea    rdx,[rip+0x5194]        # 405712 <b+0xa6>
  40057e:	48 89 d6             	mov    rsi,rdx
  400581:	48 89 c7             	mov    rdi,rax
  400584:	e8 27 12 00 00       	call   4017b0 <strcmp>
  400589:	85 c0                	test   eax,eax
  40058b:	0f 85 1e 01 00 00    	jne    4006af <main+0x674>
            char path[100] = {0};
  400591:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400598:	00 00 00 00 
  40059c:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4005a3:	00 00 00 00 
  4005a7:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4005ae:	00 00 00 00 
  4005b2:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4005b9:	00 00 00 00 
  4005bd:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4005c4:	00 00 00 00 
  4005c8:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4005cf:	00 00 00 00 
  4005d3:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4005da:	00 00 00 00 
  4005de:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4005e5:	00 00 00 00 
  4005e9:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4005f0:	00 00 00 00 
  4005f4:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4005fb:	00 00 00 00 
  4005ff:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400606:	00 00 00 00 
  40060a:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400611:	00 00 00 00 
  400615:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  40061c:	00 00 00 
            printf("input path:");
  40061f:	48 8d 05 f2 50 00 00 	lea    rax,[rip+0x50f2]        # 405718 <b+0xac>
  400626:	48 89 c7             	mov    rdi,rax
  400629:	b8 00 00 00 00       	mov    eax,0x0
  40062e:	e8 ad 33 00 00       	call   4039e0 <printf>
            gets(path);
  400633:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40063a:	48 89 c7             	mov    rdi,rax
  40063d:	e8 3e 10 00 00       	call   401680 <gets>
            int fd = creat(path, O_CREAT);
  400642:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400649:	be 40 00 00 00       	mov    esi,0x40
  40064e:	48 89 c7             	mov    rdi,rax
  400651:	e8 0f 0e 00 00       	call   401465 <creat>
  400656:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
            if (fd < 0) {
  400659:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  40065d:	79 23                	jns    400682 <main+0x647>
                printf("create file %s failed\n", path);
  40065f:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400666:	48 89 c6             	mov    rsi,rax
  400669:	48 8d 05 b4 50 00 00 	lea    rax,[rip+0x50b4]        # 405724 <b+0xb8>
  400670:	48 89 c7             	mov    rdi,rax
  400673:	b8 00 00 00 00       	mov    eax,0x0
  400678:	e8 63 33 00 00       	call   4039e0 <printf>
  40067d:	e9 57 fb ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("create file %s success\n", path);
  400682:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400689:	48 89 c6             	mov    rsi,rax
  40068c:	48 8d 05 a8 50 00 00 	lea    rax,[rip+0x50a8]        # 40573b <b+0xcf>
  400693:	48 89 c7             	mov    rdi,rax
  400696:	b8 00 00 00 00       	mov    eax,0x0
  40069b:	e8 40 33 00 00       	call   4039e0 <printf>
                close(fd);
  4006a0:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  4006a3:	89 c7                	mov    edi,eax
  4006a5:	e8 86 09 00 00       	call   401030 <close>
  4006aa:	e9 2a fb ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  4006af:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4006b6:	48 8d 15 96 50 00 00 	lea    rdx,[rip+0x5096]        # 405753 <b+0xe7>
  4006bd:	48 89 d6             	mov    rsi,rdx
  4006c0:	48 89 c7             	mov    rdi,rax
  4006c3:	e8 e8 10 00 00       	call   4017b0 <strcmp>
  4006c8:	85 c0                	test   eax,eax
  4006ca:	0f 85 0f 01 00 00    	jne    4007df <main+0x7a4>
            char path[100] = {0};
  4006d0:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4006d7:	00 00 00 00 
  4006db:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4006e2:	00 00 00 00 
  4006e6:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4006ed:	00 00 00 00 
  4006f1:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4006f8:	00 00 00 00 
  4006fc:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400703:	00 00 00 00 
  400707:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  40070e:	00 00 00 00 
  400712:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400719:	00 00 00 00 
  40071d:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400724:	00 00 00 00 
  400728:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40072f:	00 00 00 00 
  400733:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40073a:	00 00 00 00 
  40073e:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400745:	00 00 00 00 
  400749:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400750:	00 00 00 00 
  400754:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  40075b:	00 00 00 
            printf("input path:");
  40075e:	48 8d 05 b3 4f 00 00 	lea    rax,[rip+0x4fb3]        # 405718 <b+0xac>
  400765:	48 89 c7             	mov    rdi,rax
  400768:	b8 00 00 00 00       	mov    eax,0x0
  40076d:	e8 6e 32 00 00       	call   4039e0 <printf>
            gets(path);
  400772:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400779:	48 89 c7             	mov    rdi,rax
  40077c:	e8 ff 0e 00 00       	call   401680 <gets>
            int stat = remove(path);
  400781:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400788:	48 89 c7             	mov    rdi,rax
  40078b:	e8 00 0a 00 00       	call   401190 <remove>
  400790:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
            if (stat < 0) {
  400793:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  400797:	79 23                	jns    4007bc <main+0x781>
                printf("remove file/dir %s failed\n", path);
  400799:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4007a0:	48 89 c6             	mov    rsi,rax
  4007a3:	48 8d 05 ac 4f 00 00 	lea    rax,[rip+0x4fac]        # 405756 <b+0xea>
  4007aa:	48 89 c7             	mov    rdi,rax
  4007ad:	b8 00 00 00 00       	mov    eax,0x0
  4007b2:	e8 29 32 00 00       	call   4039e0 <printf>
  4007b7:	e9 1d fa ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("remove file/dir %s success\n", path);
  4007bc:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4007c3:	48 89 c6             	mov    rsi,rax
  4007c6:	48 8d 05 a4 4f 00 00 	lea    rax,[rip+0x4fa4]        # 405771 <b+0x105>
  4007cd:	48 89 c7             	mov    rdi,rax
  4007d0:	b8 00 00 00 00       	mov    eax,0x0
  4007d5:	e8 06 32 00 00       	call   4039e0 <printf>
  4007da:	e9 fa f9 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  4007df:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4007e6:	48 8d 15 a0 4f 00 00 	lea    rdx,[rip+0x4fa0]        # 40578d <b+0x121>
  4007ed:	48 89 d6             	mov    rsi,rdx
  4007f0:	48 89 c7             	mov    rdi,rax
  4007f3:	e8 b8 0f 00 00       	call   4017b0 <strcmp>
  4007f8:	85 c0                	test   eax,eax
  4007fa:	0f 85 d8 01 00 00    	jne    4009d8 <main+0x99d>
            char src[100] = {0};
  400800:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400807:	00 00 00 00 
  40080b:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400812:	00 00 00 00 
  400816:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  40081d:	00 00 00 00 
  400821:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400828:	00 00 00 00 
  40082c:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400833:	00 00 00 00 
  400837:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  40083e:	00 00 00 00 
  400842:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400849:	00 00 00 00 
  40084d:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400854:	00 00 00 00 
  400858:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  40085f:	00 00 00 00 
  400863:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  40086a:	00 00 00 00 
  40086e:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400875:	00 00 00 00 
  400879:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400880:	00 00 00 00 
  400884:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  40088b:	00 00 00 
            char dst[100] = {0};
  40088e:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400895:	00 00 00 00 
  400899:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4008a0:	00 00 00 00 
  4008a4:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4008ab:	00 00 00 00 
  4008af:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4008b6:	00 00 00 00 
  4008ba:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4008c1:	00 00 00 00 
  4008c5:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4008cc:	00 00 00 00 
  4008d0:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4008d7:	00 00 00 00 
  4008db:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4008e2:	00 00 00 00 
  4008e6:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4008ed:	00 00 00 00 
  4008f1:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4008f8:	00 00 00 00 
  4008fc:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400903:	00 00 00 00 
  400907:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  40090e:	00 00 00 00 
  400912:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400919:	00 00 00 
            printf("input src path:");
  40091c:	48 8d 05 6d 4e 00 00 	lea    rax,[rip+0x4e6d]        # 405790 <b+0x124>
  400923:	48 89 c7             	mov    rdi,rax
  400926:	b8 00 00 00 00       	mov    eax,0x0
  40092b:	e8 b0 30 00 00       	call   4039e0 <printf>
            gets(src);
  400930:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400937:	48 89 c7             	mov    rdi,rax
  40093a:	e8 41 0d 00 00       	call   401680 <gets>
            printf("input dst path:");
  40093f:	48 8d 05 5a 4e 00 00 	lea    rax,[rip+0x4e5a]        # 4057a0 <b+0x134>
  400946:	48 89 c7             	mov    rdi,rax
  400949:	b8 00 00 00 00       	mov    eax,0x0
  40094e:	e8 8d 30 00 00       	call   4039e0 <printf>
            gets(dst);
  400953:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40095a:	48 89 c7             	mov    rdi,rax
  40095d:	e8 1e 0d 00 00       	call   401680 <gets>
            int stat = rename(src, dst);
  400962:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  400969:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400970:	48 89 d6             	mov    rsi,rdx
  400973:	48 89 c7             	mov    rdi,rax
  400976:	e8 91 0b 00 00       	call   40150c <rename>
  40097b:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
            if (stat < 0) {
  40097e:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  400982:	79 2a                	jns    4009ae <main+0x973>
                printf("move file/dir %s to %s failed\n", src, dst);
  400984:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  40098b:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400992:	48 89 c6             	mov    rsi,rax
  400995:	48 8d 05 14 4e 00 00 	lea    rax,[rip+0x4e14]        # 4057b0 <b+0x144>
  40099c:	48 89 c7             	mov    rdi,rax
  40099f:	b8 00 00 00 00       	mov    eax,0x0
  4009a4:	e8 37 30 00 00       	call   4039e0 <printf>
  4009a9:	e9 2b f8 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  4009ae:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  4009b5:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  4009bc:	48 89 c6             	mov    rsi,rax
  4009bf:	48 8d 05 0a 4e 00 00 	lea    rax,[rip+0x4e0a]        # 4057d0 <b+0x164>
  4009c6:	48 89 c7             	mov    rdi,rax
  4009c9:	b8 00 00 00 00       	mov    eax,0x0
  4009ce:	e8 0d 30 00 00       	call   4039e0 <printf>
  4009d3:	e9 01 f8 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  4009d8:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4009df:	48 8d 15 0a 4e 00 00 	lea    rdx,[rip+0x4e0a]        # 4057f0 <b+0x184>
  4009e6:	48 89 d6             	mov    rsi,rdx
  4009e9:	48 89 c7             	mov    rdi,rax
  4009ec:	e8 bf 0d 00 00       	call   4017b0 <strcmp>
  4009f1:	85 c0                	test   eax,eax
  4009f3:	0f 85 e6 01 00 00    	jne    400bdf <main+0xba4>
            char path[100] = {0};
  4009f9:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400a00:	00 00 00 00 
  400a04:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400a0b:	00 00 00 00 
  400a0f:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400a16:	00 00 00 00 
  400a1a:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400a21:	00 00 00 00 
  400a25:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400a2c:	00 00 00 00 
  400a30:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400a37:	00 00 00 00 
  400a3b:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400a42:	00 00 00 00 
  400a46:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400a4d:	00 00 00 00 
  400a51:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400a58:	00 00 00 00 
  400a5c:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400a63:	00 00 00 00 
  400a67:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400a6e:	00 00 00 00 
  400a72:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400a79:	00 00 00 00 
  400a7d:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400a84:	00 00 00 
            printf("input path:");
  400a87:	48 8d 05 8a 4c 00 00 	lea    rax,[rip+0x4c8a]        # 405718 <b+0xac>
  400a8e:	48 89 c7             	mov    rdi,rax
  400a91:	b8 00 00 00 00       	mov    eax,0x0
  400a96:	e8 45 2f 00 00       	call   4039e0 <printf>
            gets(path);
  400a9b:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400aa2:	48 89 c7             	mov    rdi,rax
  400aa5:	e8 d6 0b 00 00       	call   401680 <gets>
            int fd = open(path, O_RDONLY);
  400aaa:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400ab1:	be 00 00 00 00       	mov    esi,0x0
  400ab6:	48 89 c7             	mov    rdi,rax
  400ab9:	e8 62 05 00 00       	call   401020 <open>
  400abe:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if (fd < 0) {
  400ac1:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  400ac5:	79 23                	jns    400aea <main+0xaaf>
                printf("open file %s failed\n", path);
  400ac7:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400ace:	48 89 c6             	mov    rsi,rax
  400ad1:	48 8d 05 1c 4d 00 00 	lea    rax,[rip+0x4d1c]        # 4057f4 <b+0x188>
  400ad8:	48 89 c7             	mov    rdi,rax
  400adb:	b8 00 00 00 00       	mov    eax,0x0
  400ae0:	e8 fb 2e 00 00       	call   4039e0 <printf>
  400ae5:	e9 ef f6 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400aea:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400af1:	00 00 00 00 
  400af5:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400afc:	00 00 00 00 
  400b00:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400b07:	00 00 00 00 
  400b0b:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400b12:	00 00 00 00 
  400b16:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400b1d:	00 00 00 00 
  400b21:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400b28:	00 00 00 00 
  400b2c:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400b33:	00 00 00 00 
  400b37:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400b3e:	00 00 00 00 
  400b42:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400b49:	00 00 00 00 
  400b4d:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400b54:	00 00 00 00 
  400b58:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400b5f:	00 00 00 00 
  400b63:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400b6a:	00 00 00 00 
  400b6e:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400b75:	00 00 00 
                int  len         = 0;
  400b78:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [rbp-0x38],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400b7f:	eb 1e                	jmp    400b9f <main+0xb64>
                    printf("%s", buffer);
  400b81:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400b88:	48 89 c6             	mov    rsi,rax
  400b8b:	48 8d 05 77 4c 00 00 	lea    rax,[rip+0x4c77]        # 405809 <b+0x19d>
  400b92:	48 89 c7             	mov    rdi,rax
  400b95:	b8 00 00 00 00       	mov    eax,0x0
  400b9a:	e8 41 2e 00 00       	call   4039e0 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400b9f:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400ba6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400ba9:	ba 64 00 00 00       	mov    edx,0x64
  400bae:	48 89 ce             	mov    rsi,rcx
  400bb1:	89 c7                	mov    edi,eax
  400bb3:	e8 88 04 00 00       	call   401040 <read>
  400bb8:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
  400bbb:	83 7d c8 00          	cmp    DWORD PTR [rbp-0x38],0x0
  400bbf:	7f c0                	jg     400b81 <main+0xb46>
                }
                puts("");
  400bc1:	48 8d 05 44 4c 00 00 	lea    rax,[rip+0x4c44]        # 40580c <b+0x1a0>
  400bc8:	48 89 c7             	mov    rdi,rax
  400bcb:	e8 50 0a 00 00       	call   401620 <puts>
                close(fd);
  400bd0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400bd3:	89 c7                	mov    edi,eax
  400bd5:	e8 56 04 00 00       	call   401030 <close>
  400bda:	e9 fa f5 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400bdf:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400be6:	48 8d 15 20 4c 00 00 	lea    rdx,[rip+0x4c20]        # 40580d <b+0x1a1>
  400bed:	48 89 d6             	mov    rsi,rdx
  400bf0:	48 89 c7             	mov    rdi,rax
  400bf3:	e8 b8 0b 00 00       	call   4017b0 <strcmp>
  400bf8:	85 c0                	test   eax,eax
  400bfa:	0f 85 fd 01 00 00    	jne    400dfd <main+0xdc2>
            char path[100] = {0};
  400c00:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400c07:	00 00 00 00 
  400c0b:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400c12:	00 00 00 00 
  400c16:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400c1d:	00 00 00 00 
  400c21:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400c28:	00 00 00 00 
  400c2c:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400c33:	00 00 00 00 
  400c37:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400c3e:	00 00 00 00 
  400c42:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400c49:	00 00 00 00 
  400c4d:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400c54:	00 00 00 00 
  400c58:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400c5f:	00 00 00 00 
  400c63:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400c6a:	00 00 00 00 
  400c6e:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400c75:	00 00 00 00 
  400c79:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400c80:	00 00 00 00 
  400c84:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400c8b:	00 00 00 
            printf("input path:");
  400c8e:	48 8d 05 83 4a 00 00 	lea    rax,[rip+0x4a83]        # 405718 <b+0xac>
  400c95:	48 89 c7             	mov    rdi,rax
  400c98:	b8 00 00 00 00       	mov    eax,0x0
  400c9d:	e8 3e 2d 00 00       	call   4039e0 <printf>
            gets(path);
  400ca2:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400ca9:	48 89 c7             	mov    rdi,rax
  400cac:	e8 cf 09 00 00       	call   401680 <gets>
            int fd = open(path, O_WRONLY);
  400cb1:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400cb8:	be 01 00 00 00       	mov    esi,0x1
  400cbd:	48 89 c7             	mov    rdi,rax
  400cc0:	e8 5b 03 00 00       	call   401020 <open>
  400cc5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
            if (fd < 0) {
  400cc8:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  400ccc:	79 23                	jns    400cf1 <main+0xcb6>
                printf("open file %s failed\n", path);
  400cce:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400cd5:	48 89 c6             	mov    rsi,rax
  400cd8:	48 8d 05 15 4b 00 00 	lea    rax,[rip+0x4b15]        # 4057f4 <b+0x188>
  400cdf:	48 89 c7             	mov    rdi,rax
  400ce2:	b8 00 00 00 00       	mov    eax,0x0
  400ce7:	e8 f4 2c 00 00       	call   4039e0 <printf>
  400cec:	e9 e8 f4 ff ff       	jmp    4001d9 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400cf1:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400cf8:	00 00 00 00 
  400cfc:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400d03:	00 00 00 00 
  400d07:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400d0e:	00 00 00 00 
  400d12:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400d19:	00 00 00 00 
  400d1d:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400d24:	00 00 00 00 
  400d28:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400d2f:	00 00 00 00 
  400d33:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400d3a:	00 00 00 00 
  400d3e:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400d45:	00 00 00 00 
  400d49:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400d50:	00 00 00 00 
  400d54:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400d5b:	00 00 00 00 
  400d5f:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400d66:	00 00 00 00 
  400d6a:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400d71:	00 00 00 00 
  400d75:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400d7c:	00 00 00 
                printf("input content:");
  400d7f:	48 8d 05 8d 4a 00 00 	lea    rax,[rip+0x4a8d]        # 405813 <b+0x1a7>
  400d86:	48 89 c7             	mov    rdi,rax
  400d89:	b8 00 00 00 00       	mov    eax,0x0
  400d8e:	e8 4d 2c 00 00       	call   4039e0 <printf>
                gets(buffer);
  400d93:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400d9a:	48 89 c7             	mov    rdi,rax
  400d9d:	e8 de 08 00 00       	call   401680 <gets>
                int len = strlen(buffer);
  400da2:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400da9:	48 89 c7             	mov    rdi,rax
  400dac:	e8 4f 0a 00 00       	call   401800 <strlen>
  400db1:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
                write(fd, buffer, len);
  400db4:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400db7:	48 63 d0             	movsxd rdx,eax
  400dba:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400dc1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400dc4:	48 89 ce             	mov    rsi,rcx
  400dc7:	89 c7                	mov    edi,eax
  400dc9:	e8 82 02 00 00       	call   401050 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400dce:	48 8d 95 88 fd ff ff 	lea    rdx,[rbp-0x278]
  400dd5:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400dd8:	89 c6                	mov    esi,eax
  400dda:	48 8d 05 47 4a 00 00 	lea    rax,[rip+0x4a47]        # 405828 <b+0x1bc>
  400de1:	48 89 c7             	mov    rdi,rax
  400de4:	b8 00 00 00 00       	mov    eax,0x0
  400de9:	e8 f2 2b 00 00       	call   4039e0 <printf>
                close(fd);
  400dee:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400df1:	89 c7                	mov    edi,eax
  400df3:	e8 38 02 00 00       	call   401030 <close>
  400df8:	e9 dc f3 ff ff       	jmp    4001d9 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
  400dfd:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400e04:	48 8d 15 40 4a 00 00 	lea    rdx,[rip+0x4a40]        # 40584b <b+0x1df>
  400e0b:	48 89 d6             	mov    rsi,rdx
  400e0e:	48 89 c7             	mov    rdi,rax
  400e11:	e8 9a 09 00 00       	call   4017b0 <strcmp>
  400e16:	85 c0                	test   eax,eax
  400e18:	75 73                	jne    400e8d <main+0xe52>
  400e1a:	48 c7 45 a0 29 00 00 	mov    QWORD PTR [rbp-0x60],0x29
  400e21:	00 
  400e22:	48 c7 45 98 01 00 00 	mov    QWORD PTR [rbp-0x68],0x1
  400e29:	00 
  400e2a:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400e31:	00 
  400e32:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400e39:	00 
  400e3a:	48 c7 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],0x0
  400e41:	00 00 00 00 
  400e45:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400e4c:	00 
  400e4d:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400e54:	00 00 00 00 
typedef int (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
  400e58:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  400e5c:	48 8b 4d 98          	mov    rcx,QWORD PTR [rbp-0x68]
  400e60:	48 8b 75 90          	mov    rsi,QWORD PTR [rbp-0x70]
  400e64:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  400e68:	4c 8b 45 80          	mov    r8,QWORD PTR [rbp-0x80]
  400e6c:	4c 8b 8d 78 ff ff ff 	mov    r9,QWORD PTR [rbp-0x88]
  400e73:	48 89 cf             	mov    rdi,rcx
  400e76:	4c 8b 95 70 fe ff ff 	mov    r10,QWORD PTR [rbp-0x190]
  400e7d:	48 0f 05             	rex.W syscall 
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
  400e80:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  400e85:	48 89 c3             	mov    rbx,rax
    return ret;
  400e88:	e9 c7 00 00 00       	jmp    400f54 <main+0xf19>
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
  400e8d:	48 8d 05 be 49 00 00 	lea    rax,[rip+0x49be]        # 405852 <b+0x1e6>
  400e94:	48 89 c7             	mov    rdi,rax
  400e97:	b8 00 00 00 00       	mov    eax,0x0
  400e9c:	e8 3f 2b 00 00       	call   4039e0 <printf>
            int pid = 0;
  400ea1:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
            if ((pid = fork()) == 0) {
  400ea8:	e8 73 02 00 00       	call   401120 <fork>
  400ead:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  400eb0:	83 7d d8 00          	cmp    DWORD PTR [rbp-0x28],0x0
  400eb4:	75 5c                	jne    400f12 <main+0xed7>
                printf("forked, ready to execve\n");
  400eb6:	48 8d 05 ab 49 00 00 	lea    rax,[rip+0x49ab]        # 405868 <b+0x1fc>
  400ebd:	48 89 c7             	mov    rdi,rax
  400ec0:	b8 00 00 00 00       	mov    eax,0x0
  400ec5:	e8 16 2b 00 00       	call   4039e0 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400eca:	48 8b 95 68 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x298]
  400ed1:	48 8b 8d 70 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x290]
  400ed8:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400edf:	48 89 ce             	mov    rsi,rcx
  400ee2:	48 89 c7             	mov    rdi,rax
  400ee5:	e8 46 02 00 00       	call   401130 <execve>
  400eea:	83 f8 ff             	cmp    eax,0xffffffff
  400eed:	75 23                	jne    400f12 <main+0xed7>
                    printf("cannot find file:%s\n", cmd);
  400eef:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ef6:	48 89 c6             	mov    rsi,rax
  400ef9:	48 8d 05 81 49 00 00 	lea    rax,[rip+0x4981]        # 405881 <b+0x215>
  400f00:	48 89 c7             	mov    rdi,rax
  400f03:	b8 00 00 00 00       	mov    eax,0x0
  400f08:	e8 d3 2a 00 00       	call   4039e0 <printf>
  400f0d:	e9 c7 f2 ff ff       	jmp    4001d9 <main+0x19e>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  400f12:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400f15:	89 c6                	mov    esi,eax
  400f17:	48 8d 05 78 49 00 00 	lea    rax,[rip+0x4978]        # 405896 <b+0x22a>
  400f1e:	48 89 c7             	mov    rdi,rax
  400f21:	b8 00 00 00 00       	mov    eax,0x0
  400f26:	e8 b5 2a 00 00       	call   4039e0 <printf>
            int loc = 0;
  400f2b:	c7 85 6c fe ff ff 00 	mov    DWORD PTR [rbp-0x194],0x0
  400f32:	00 00 00 

            waitpid(pid, &loc, 0);
  400f35:	48 8d 8d 6c fe ff ff 	lea    rcx,[rbp-0x194]
  400f3c:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400f3f:	ba 00 00 00 00       	mov    edx,0x0
  400f44:	48 89 ce             	mov    rsi,rcx
  400f47:	89 c7                	mov    edi,eax
  400f49:	e8 f2 01 00 00       	call   401140 <waitpid>
  400f4e:	e9 86 f2 ff ff       	jmp    4001d9 <main+0x19e>
                continue;
  400f53:	90                   	nop
    while (1) {
  400f54:	e9 80 f2 ff ff       	jmp    4001d9 <main+0x19e>
            break;
  400f59:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400f5a:	b8 00 00 00 00       	mov    eax,0x0
  400f5f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  400f63:	c9                   	leave  
  400f64:	c3                   	ret    
  400f65:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400f6c:	00 00 00 
  400f6f:	90                   	nop

0000000000400f70 <reg_dev>:
  400f70:	55                   	push   rbp
  400f71:	48 89 e5             	mov    rbp,rsp
  400f74:	b8 00 00 00 00       	mov    eax,0x0
  400f79:	55                   	push   rbp
  400f7a:	48 0f 05             	rex.W syscall 
  400f7d:	5d                   	pop    rbp
  400f7e:	c9                   	leave  
  400f7f:	c3                   	ret    

0000000000400f80 <dispose_dev>:
  400f80:	55                   	push   rbp
  400f81:	48 89 e5             	mov    rbp,rsp
  400f84:	b8 01 00 00 00       	mov    eax,0x1
  400f89:	55                   	push   rbp
  400f8a:	48 0f 05             	rex.W syscall 
  400f8d:	5d                   	pop    rbp
  400f8e:	c9                   	leave  
  400f8f:	c3                   	ret    

0000000000400f90 <reg_drv>:
  400f90:	55                   	push   rbp
  400f91:	48 89 e5             	mov    rbp,rsp
  400f94:	b8 02 00 00 00       	mov    eax,0x2
  400f99:	55                   	push   rbp
  400f9a:	48 0f 05             	rex.W syscall 
  400f9d:	5d                   	pop    rbp
  400f9e:	c9                   	leave  
  400f9f:	c3                   	ret    

0000000000400fa0 <dispose_drv>:
  400fa0:	55                   	push   rbp
  400fa1:	48 89 e5             	mov    rbp,rsp
  400fa4:	b8 03 00 00 00       	mov    eax,0x3
  400fa9:	55                   	push   rbp
  400faa:	48 0f 05             	rex.W syscall 
  400fad:	5d                   	pop    rbp
  400fae:	c9                   	leave  
  400faf:	c3                   	ret    

0000000000400fb0 <call_drvfunc>:
  400fb0:	55                   	push   rbp
  400fb1:	48 89 e5             	mov    rbp,rsp
  400fb4:	b8 04 00 00 00       	mov    eax,0x4
  400fb9:	55                   	push   rbp
  400fba:	48 0f 05             	rex.W syscall 
  400fbd:	5d                   	pop    rbp
  400fbe:	c9                   	leave  
  400fbf:	c3                   	ret    

0000000000400fc0 <req_mem>:
  400fc0:	55                   	push   rbp
  400fc1:	48 89 e5             	mov    rbp,rsp
  400fc4:	b8 05 00 00 00       	mov    eax,0x5
  400fc9:	55                   	push   rbp
  400fca:	48 0f 05             	rex.W syscall 
  400fcd:	5d                   	pop    rbp
  400fce:	c9                   	leave  
  400fcf:	c3                   	ret    

0000000000400fd0 <free_mem>:
  400fd0:	55                   	push   rbp
  400fd1:	48 89 e5             	mov    rbp,rsp
  400fd4:	b8 06 00 00 00       	mov    eax,0x6
  400fd9:	55                   	push   rbp
  400fda:	48 0f 05             	rex.W syscall 
  400fdd:	5d                   	pop    rbp
  400fde:	c9                   	leave  
  400fdf:	c3                   	ret    

0000000000400fe0 <reg_proc>:
  400fe0:	55                   	push   rbp
  400fe1:	48 89 e5             	mov    rbp,rsp
  400fe4:	b8 07 00 00 00       	mov    eax,0x7
  400fe9:	55                   	push   rbp
  400fea:	48 0f 05             	rex.W syscall 
  400fed:	5d                   	pop    rbp
  400fee:	c9                   	leave  
  400fef:	c3                   	ret    

0000000000400ff0 <del_proc>:
  400ff0:	55                   	push   rbp
  400ff1:	48 89 e5             	mov    rbp,rsp
  400ff4:	b8 08 00 00 00       	mov    eax,0x8
  400ff9:	55                   	push   rbp
  400ffa:	48 0f 05             	rex.W syscall 
  400ffd:	5d                   	pop    rbp
  400ffe:	c9                   	leave  
  400fff:	c3                   	ret    

0000000000401000 <get_proc_addr>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	b8 09 00 00 00       	mov    eax,0x9
  401009:	55                   	push   rbp
  40100a:	48 0f 05             	rex.W syscall 
  40100d:	5d                   	pop    rbp
  40100e:	c9                   	leave  
  40100f:	c3                   	ret    

0000000000401010 <chk_vm>:
  401010:	55                   	push   rbp
  401011:	48 89 e5             	mov    rbp,rsp
  401014:	b8 0a 00 00 00       	mov    eax,0xa
  401019:	55                   	push   rbp
  40101a:	48 0f 05             	rex.W syscall 
  40101d:	5d                   	pop    rbp
  40101e:	c9                   	leave  
  40101f:	c3                   	ret    

0000000000401020 <open>:
  401020:	55                   	push   rbp
  401021:	48 89 e5             	mov    rbp,rsp
  401024:	b8 0b 00 00 00       	mov    eax,0xb
  401029:	55                   	push   rbp
  40102a:	48 0f 05             	rex.W syscall 
  40102d:	5d                   	pop    rbp
  40102e:	c9                   	leave  
  40102f:	c3                   	ret    

0000000000401030 <close>:
  401030:	55                   	push   rbp
  401031:	48 89 e5             	mov    rbp,rsp
  401034:	b8 0c 00 00 00       	mov    eax,0xc
  401039:	55                   	push   rbp
  40103a:	48 0f 05             	rex.W syscall 
  40103d:	5d                   	pop    rbp
  40103e:	c9                   	leave  
  40103f:	c3                   	ret    

0000000000401040 <read>:
  401040:	55                   	push   rbp
  401041:	48 89 e5             	mov    rbp,rsp
  401044:	b8 0d 00 00 00       	mov    eax,0xd
  401049:	55                   	push   rbp
  40104a:	48 0f 05             	rex.W syscall 
  40104d:	5d                   	pop    rbp
  40104e:	c9                   	leave  
  40104f:	c3                   	ret    

0000000000401050 <write>:
  401050:	55                   	push   rbp
  401051:	48 89 e5             	mov    rbp,rsp
  401054:	b8 0e 00 00 00       	mov    eax,0xe
  401059:	55                   	push   rbp
  40105a:	48 0f 05             	rex.W syscall 
  40105d:	5d                   	pop    rbp
  40105e:	c9                   	leave  
  40105f:	c3                   	ret    

0000000000401060 <seek>:
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	b8 0f 00 00 00       	mov    eax,0xf
  401069:	55                   	push   rbp
  40106a:	48 0f 05             	rex.W syscall 
  40106d:	5d                   	pop    rbp
  40106e:	c9                   	leave  
  40106f:	c3                   	ret    

0000000000401070 <tell>:
  401070:	55                   	push   rbp
  401071:	48 89 e5             	mov    rbp,rsp
  401074:	b8 10 00 00 00       	mov    eax,0x10
  401079:	55                   	push   rbp
  40107a:	48 0f 05             	rex.W syscall 
  40107d:	5d                   	pop    rbp
  40107e:	c9                   	leave  
  40107f:	c3                   	ret    

0000000000401080 <reg_vol>:
  401080:	55                   	push   rbp
  401081:	48 89 e5             	mov    rbp,rsp
  401084:	b8 11 00 00 00       	mov    eax,0x11
  401089:	55                   	push   rbp
  40108a:	48 0f 05             	rex.W syscall 
  40108d:	5d                   	pop    rbp
  40108e:	c9                   	leave  
  40108f:	c3                   	ret    

0000000000401090 <free_vol>:
  401090:	55                   	push   rbp
  401091:	48 89 e5             	mov    rbp,rsp
  401094:	b8 12 00 00 00       	mov    eax,0x12
  401099:	55                   	push   rbp
  40109a:	48 0f 05             	rex.W syscall 
  40109d:	5d                   	pop    rbp
  40109e:	c9                   	leave  
  40109f:	c3                   	ret    

00000000004010a0 <exec>:
  4010a0:	55                   	push   rbp
  4010a1:	48 89 e5             	mov    rbp,rsp
  4010a4:	b8 13 00 00 00       	mov    eax,0x13
  4010a9:	55                   	push   rbp
  4010aa:	48 0f 05             	rex.W syscall 
  4010ad:	5d                   	pop    rbp
  4010ae:	c9                   	leave  
  4010af:	c3                   	ret    

00000000004010b0 <exit>:
  4010b0:	55                   	push   rbp
  4010b1:	48 89 e5             	mov    rbp,rsp
  4010b4:	b8 14 00 00 00       	mov    eax,0x14
  4010b9:	55                   	push   rbp
  4010ba:	48 0f 05             	rex.W syscall 
  4010bd:	5d                   	pop    rbp
  4010be:	c9                   	leave  
  4010bf:	c3                   	ret    

00000000004010c0 <abort>:
  4010c0:	55                   	push   rbp
  4010c1:	48 89 e5             	mov    rbp,rsp
  4010c4:	b8 14 00 00 00       	mov    eax,0x14
  4010c9:	55                   	push   rbp
  4010ca:	48 0f 05             	rex.W syscall 
  4010cd:	5d                   	pop    rbp
  4010ce:	c9                   	leave  
  4010cf:	c3                   	ret    

00000000004010d0 <call>:
  4010d0:	55                   	push   rbp
  4010d1:	48 89 e5             	mov    rbp,rsp
  4010d4:	b8 15 00 00 00       	mov    eax,0x15
  4010d9:	55                   	push   rbp
  4010da:	48 0f 05             	rex.W syscall 
  4010dd:	5d                   	pop    rbp
  4010de:	c9                   	leave  
  4010df:	c3                   	ret    

00000000004010e0 <mkfifo>:
  4010e0:	55                   	push   rbp
  4010e1:	48 89 e5             	mov    rbp,rsp
  4010e4:	b8 16 00 00 00       	mov    eax,0x16
  4010e9:	55                   	push   rbp
  4010ea:	48 0f 05             	rex.W syscall 
  4010ed:	5d                   	pop    rbp
  4010ee:	c9                   	leave  
  4010ef:	c3                   	ret    

00000000004010f0 <brk>:
  4010f0:	55                   	push   rbp
  4010f1:	48 89 e5             	mov    rbp,rsp
  4010f4:	b8 17 00 00 00       	mov    eax,0x17
  4010f9:	55                   	push   rbp
  4010fa:	48 0f 05             	rex.W syscall 
  4010fd:	5d                   	pop    rbp
  4010fe:	c9                   	leave  
  4010ff:	c3                   	ret    

0000000000401100 <find_dev>:
  401100:	55                   	push   rbp
  401101:	48 89 e5             	mov    rbp,rsp
  401104:	b8 19 00 00 00       	mov    eax,0x19
  401109:	55                   	push   rbp
  40110a:	48 0f 05             	rex.W syscall 
  40110d:	5d                   	pop    rbp
  40110e:	c9                   	leave  
  40110f:	c3                   	ret    

0000000000401110 <operate_dev>:
  401110:	55                   	push   rbp
  401111:	48 89 e5             	mov    rbp,rsp
  401114:	b8 1a 00 00 00       	mov    eax,0x1a
  401119:	55                   	push   rbp
  40111a:	48 0f 05             	rex.W syscall 
  40111d:	5d                   	pop    rbp
  40111e:	c9                   	leave  
  40111f:	c3                   	ret    

0000000000401120 <fork>:
  401120:	55                   	push   rbp
  401121:	48 89 e5             	mov    rbp,rsp
  401124:	b8 1b 00 00 00       	mov    eax,0x1b
  401129:	55                   	push   rbp
  40112a:	48 0f 05             	rex.W syscall 
  40112d:	5d                   	pop    rbp
  40112e:	c9                   	leave  
  40112f:	c3                   	ret    

0000000000401130 <execve>:
  401130:	55                   	push   rbp
  401131:	48 89 e5             	mov    rbp,rsp
  401134:	b8 1c 00 00 00       	mov    eax,0x1c
  401139:	55                   	push   rbp
  40113a:	48 0f 05             	rex.W syscall 
  40113d:	5d                   	pop    rbp
  40113e:	c9                   	leave  
  40113f:	c3                   	ret    

0000000000401140 <waitpid>:
  401140:	55                   	push   rbp
  401141:	48 89 e5             	mov    rbp,rsp
  401144:	b8 1d 00 00 00       	mov    eax,0x1d
  401149:	55                   	push   rbp
  40114a:	48 0f 05             	rex.W syscall 
  40114d:	5d                   	pop    rbp
  40114e:	c9                   	leave  
  40114f:	c3                   	ret    

0000000000401150 <mmap>:
  401150:	55                   	push   rbp
  401151:	48 89 e5             	mov    rbp,rsp
  401154:	b8 1e 00 00 00       	mov    eax,0x1e
  401159:	55                   	push   rbp
  40115a:	48 0f 05             	rex.W syscall 
  40115d:	5d                   	pop    rbp
  40115e:	c9                   	leave  
  40115f:	c3                   	ret    

0000000000401160 <munmap>:
  401160:	55                   	push   rbp
  401161:	48 89 e5             	mov    rbp,rsp
  401164:	b8 1f 00 00 00       	mov    eax,0x1f
  401169:	55                   	push   rbp
  40116a:	48 0f 05             	rex.W syscall 
  40116d:	5d                   	pop    rbp
  40116e:	c9                   	leave  
  40116f:	c3                   	ret    

0000000000401170 <mknod>:
  401170:	55                   	push   rbp
  401171:	48 89 e5             	mov    rbp,rsp
  401174:	b8 21 00 00 00       	mov    eax,0x21
  401179:	55                   	push   rbp
  40117a:	48 0f 05             	rex.W syscall 
  40117d:	5d                   	pop    rbp
  40117e:	c9                   	leave  
  40117f:	c3                   	ret    

0000000000401180 <kb_readc>:
  401180:	55                   	push   rbp
  401181:	48 89 e5             	mov    rbp,rsp
  401184:	b8 64 00 00 00       	mov    eax,0x64
  401189:	55                   	push   rbp
  40118a:	48 0f 05             	rex.W syscall 
  40118d:	5d                   	pop    rbp
  40118e:	c9                   	leave  
  40118f:	c3                   	ret    

0000000000401190 <remove>:
  401190:	55                   	push   rbp
  401191:	48 89 e5             	mov    rbp,rsp
  401194:	b8 22 00 00 00       	mov    eax,0x22
  401199:	55                   	push   rbp
  40119a:	48 0f 05             	rex.W syscall 
  40119d:	5d                   	pop    rbp
  40119e:	c9                   	leave  
  40119f:	c3                   	ret    

00000000004011a0 <sbrk>:
  4011a0:	55                   	push   rbp
  4011a1:	48 89 e5             	mov    rbp,rsp
  4011a4:	b8 23 00 00 00       	mov    eax,0x23
  4011a9:	55                   	push   rbp
  4011aa:	48 0f 05             	rex.W syscall 
  4011ad:	5d                   	pop    rbp
  4011ae:	c9                   	leave  
  4011af:	c3                   	ret    

00000000004011b0 <chkmmap>:
  4011b0:	55                   	push   rbp
  4011b1:	48 89 e5             	mov    rbp,rsp
  4011b4:	b8 24 00 00 00       	mov    eax,0x24
  4011b9:	55                   	push   rbp
  4011ba:	48 0f 05             	rex.W syscall 
  4011bd:	5d                   	pop    rbp
  4011be:	c9                   	leave  
  4011bf:	c3                   	ret    

00000000004011c0 <_readdir>:
  4011c0:	55                   	push   rbp
  4011c1:	48 89 e5             	mov    rbp,rsp
  4011c4:	b8 25 00 00 00       	mov    eax,0x25
  4011c9:	55                   	push   rbp
  4011ca:	48 0f 05             	rex.W syscall 
  4011cd:	5d                   	pop    rbp
  4011ce:	c9                   	leave  
  4011cf:	c3                   	ret    

00000000004011d0 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	55                   	push   rbp
  4011d5:	48 89 e5             	mov    rbp,rsp
  4011d8:	48 83 ec 20          	sub    rsp,0x20
  4011dc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  4011e0:	bf 20 00 00 00       	mov    edi,0x20
  4011e5:	e8 36 33 00 00       	call   404520 <malloc>
  4011ea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  4011ee:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  4011f3:	75 0a                	jne    4011ff <opendir+0x2f>
	{
		return NULL;
  4011f5:	b8 00 00 00 00       	mov    eax,0x0
  4011fa:	e9 a6 00 00 00       	jmp    4012a5 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  4011ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401203:	be 00 40 00 00       	mov    esi,0x4000
  401208:	48 89 c7             	mov    rdi,rax
  40120b:	e8 10 fe ff ff       	call   401020 <open>
  401210:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  401214:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  401216:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40121a:	8b 00                	mov    eax,DWORD PTR [rax]
  40121c:	85 c0                	test   eax,eax
  40121e:	79 13                	jns    401233 <opendir+0x63>
	{
		free(dirp);
  401220:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401224:	48 89 c7             	mov    rdi,rax
  401227:	e8 f4 2c 00 00       	call   403f20 <free>
		return NULL;
  40122c:	b8 00 00 00 00       	mov    eax,0x0
  401231:	eb 72                	jmp    4012a5 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  401233:	bf 00 04 00 00       	mov    edi,0x400
  401238:	e8 e3 32 00 00       	call   404520 <malloc>
  40123d:	48 89 c2             	mov    rdx,rax
  401240:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401244:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  401248:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40124c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401250:	48 85 c0             	test   rax,rax
  401253:	75 20                	jne    401275 <opendir+0xa5>
	{
		close(dirp->fd);
  401255:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401259:	8b 00                	mov    eax,DWORD PTR [rax]
  40125b:	89 c7                	mov    edi,eax
  40125d:	e8 ce fd ff ff       	call   401030 <close>
		free(dirp);
  401262:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401266:	48 89 c7             	mov    rdi,rax
  401269:	e8 b2 2c 00 00       	call   403f20 <free>
		return NULL;
  40126e:	b8 00 00 00 00       	mov    eax,0x0
  401273:	eb 30                	jmp    4012a5 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  401275:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401279:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  401280:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401284:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  40128b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40128f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  401296:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40129a:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  4012a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  4012a5:	c9                   	leave  
  4012a6:	c3                   	ret    

00000000004012a7 <closedir>:

int closedir(DIR* dirp)
{
  4012a7:	f3 0f 1e fa          	endbr64 
  4012ab:	55                   	push   rbp
  4012ac:	48 89 e5             	mov    rbp,rsp
  4012af:	48 83 ec 50          	sub    rsp,0x50
  4012b3:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  4012b7:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  4012bc:	75 0a                	jne    4012c8 <closedir+0x21>
	{
		return -1;
  4012be:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4012c3:	e9 88 00 00 00       	jmp    401350 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  4012c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4012cc:	8b 00                	mov    eax,DWORD PTR [rax]
  4012ce:	48 98                	cdqe   
  4012d0:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  4012d7:	00 
  4012d8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4012dc:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4012e3:	00 
  4012e4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4012eb:	00 
  4012ec:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4012f3:	00 
  4012f4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4012fb:	00 
  4012fc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401303:	00 
#define SYSCALL_DRV_IOCTL 40
#define SYSCALL_REBOOT 41
#define SYSCALL_GETCWD 42
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  401304:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401308:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40130c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401310:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401314:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401318:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40131c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401320:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  401323:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40132a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40132b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  40132f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401333:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401337:	48 89 c7             	mov    rdi,rax
  40133a:	e8 e1 2b 00 00       	call   403f20 <free>
	free(dirp);
  40133f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401343:	48 89 c7             	mov    rdi,rax
  401346:	e8 d5 2b 00 00       	call   403f20 <free>
	return 0;
  40134b:	b8 00 00 00 00       	mov    eax,0x0
}
  401350:	c9                   	leave  
  401351:	c3                   	ret    

0000000000401352 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  401352:	f3 0f 1e fa          	endbr64 
  401356:	55                   	push   rbp
  401357:	48 89 e5             	mov    rbp,rsp
  40135a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  40135e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401362:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401366:	48 89 c2             	mov    rdx,rax
  401369:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40136d:	8b 00                	mov    eax,DWORD PTR [rax]
  40136f:	48 98                	cdqe   
  401371:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  401378:	00 
  401379:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40137d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401381:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401388:	00 
  401389:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401390:	00 
  401391:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401398:	00 
  401399:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4013a0:	00 
        __asm__ volatile(".byte 0x48\n"
  4013a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013a5:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4013a9:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4013ad:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4013b1:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4013b5:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4013b9:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4013bd:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4013c0:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4013c7:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4013c8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4013cc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4013d0:	85 c0                	test   eax,eax
  4013d2:	79 12                	jns    4013e6 <readdir+0x94>
	{
		dirp->eof = 1;
  4013d4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013d8:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  4013df:	b8 00 00 00 00       	mov    eax,0x0
  4013e4:	eb 08                	jmp    4013ee <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  4013e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013ea:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  4013ee:	5d                   	pop    rbp
  4013ef:	c3                   	ret    

00000000004013f0 <chdir>:
int chdir(const char* name)
{
  4013f0:	f3 0f 1e fa          	endbr64 
  4013f4:	55                   	push   rbp
  4013f5:	48 89 e5             	mov    rbp,rsp
  4013f8:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  4013fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401400:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  401407:	00 
  401408:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40140c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401413:	00 
  401414:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40141b:	00 
  40141c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401423:	00 
  401424:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40142b:	00 
  40142c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401433:	00 
        __asm__ volatile(".byte 0x48\n"
  401434:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401438:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40143c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401440:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401444:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401448:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40144c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401450:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401453:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40145a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40145b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40145f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401463:	5d                   	pop    rbp
  401464:	c3                   	ret    

0000000000401465 <creat>:
int creat(const char* name, mode_t mode)
{
  401465:	f3 0f 1e fa          	endbr64 
  401469:	55                   	push   rbp
  40146a:	48 89 e5             	mov    rbp,rsp
  40146d:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401471:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
	return do_syscall(SYSCALL_OPEN, (long long)name,
  401474:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  401477:	83 c8 41             	or     eax,0x41
  40147a:	48 98                	cdqe   
  40147c:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401480:	48 c7 45 f8 0b 00 00 	mov    QWORD PTR [rbp-0x8],0xb
  401487:	00 
  401488:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  40148c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401490:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401497:	00 
  401498:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40149f:	00 
  4014a0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4014a7:	00 
  4014a8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4014af:	00 
        __asm__ volatile(".byte 0x48\n"
  4014b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4014b4:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4014b8:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4014bc:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4014c0:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4014c4:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4014c8:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4014cc:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4014cf:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014d6:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4014d7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4014db:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
					  (long long)O_CREAT | (long long)O_WRONLY | (long long)mode, 0, 0, 0, 0);
}
  4014df:	5d                   	pop    rbp
  4014e0:	c3                   	ret    

00000000004014e1 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  4014e1:	f3 0f 1e fa          	endbr64 
  4014e5:	55                   	push   rbp
  4014e6:	48 89 e5             	mov    rbp,rsp
  4014e9:	48 83 ec 10          	sub    rsp,0x10
  4014ed:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  4014f1:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
	return creat(path, mode | O_DIRECTORY);
  4014f4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4014f7:	80 cc 40             	or     ah,0x40
  4014fa:	89 c2                	mov    edx,eax
  4014fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401500:	89 d6                	mov    esi,edx
  401502:	48 89 c7             	mov    rdi,rax
  401505:	e8 5b ff ff ff       	call   401465 <creat>
}
  40150a:	c9                   	leave  
  40150b:	c3                   	ret    

000000000040150c <rename>:
int rename(const char* oldpath, const char* newpath)
{
  40150c:	f3 0f 1e fa          	endbr64 
  401510:	55                   	push   rbp
  401511:	48 89 e5             	mov    rbp,rsp
  401514:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401518:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  40151c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401520:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401524:	48 c7 45 f8 27 00 00 	mov    QWORD PTR [rbp-0x8],0x27
  40152b:	00 
  40152c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  401530:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401534:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40153b:	00 
  40153c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401543:	00 
  401544:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40154b:	00 
  40154c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401553:	00 
        __asm__ volatile(".byte 0x48\n"
  401554:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401558:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40155c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401560:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401564:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401568:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40156c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401570:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401573:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40157a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40157b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40157f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401583:	5d                   	pop    rbp
  401584:	c3                   	ret    

0000000000401585 <getcwd>:
char* getcwd(char* buf, size_t size)
{
  401585:	f3 0f 1e fa          	endbr64 
  401589:	55                   	push   rbp
  40158a:	48 89 e5             	mov    rbp,rsp
  40158d:	48 83 ec 50          	sub    rsp,0x50
  401591:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401595:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	if(!buf)
  401599:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40159e:	75 10                	jne    4015b0 <getcwd+0x2b>
	{
		buf = malloc(size);
  4015a0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4015a4:	48 89 c7             	mov    rdi,rax
  4015a7:	e8 74 2f 00 00       	call   404520 <malloc>
  4015ac:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	}
	return (char*)do_syscall(SYSCALL_GETCWD, (long long)buf, (long long)size, 0, 0, 0, 0);
  4015b0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4015b4:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  4015b8:	48 c7 45 f8 2a 00 00 	mov    QWORD PTR [rbp-0x8],0x2a
  4015bf:	00 
  4015c0:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  4015c4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4015c8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4015cf:	00 
  4015d0:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4015d7:	00 
  4015d8:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4015df:	00 
  4015e0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4015e7:	00 
        __asm__ volatile(".byte 0x48\n"
  4015e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4015ec:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4015f0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4015f4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4015f8:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4015fc:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401600:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401604:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401607:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40160e:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40160f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  401613:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401617:	48 98                	cdqe   
  401619:	c9                   	leave  
  40161a:	c3                   	ret    

Disassembly of section .text.puts:

0000000000401620 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  401620:	f3 0f 1e fa          	endbr64 
  401624:	41 54                	push   r12
  401626:	55                   	push   rbp
  401627:	48 89 fd             	mov    rbp,rdi
  40162a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  40162b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40162e:	40 84 ff             	test   dil,dil
  401631:	74 35                	je     401668 <puts+0x48>
  401633:	31 db                	xor    ebx,ebx
  401635:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  401638:	e8 03 26 00 00       	call   403c40 <putchar>
  40163d:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  401640:	48 83 c3 01          	add    rbx,0x1
  401644:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401649:	40 84 ff             	test   dil,dil
  40164c:	75 ea                	jne    401638 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  40164e:	bf 0a 00 00 00       	mov    edi,0xa
  401653:	e8 e8 25 00 00       	call   403c40 <putchar>
		r++;
  401658:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  40165d:	5b                   	pop    rbx
  40165e:	5d                   	pop    rbp
  40165f:	41 5c                	pop    r12
  401661:	c3                   	ret    
  401662:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401668:	5b                   	pop    rbx
	return r ? r : EOF;
  401669:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  40166e:	5d                   	pop    rbp
  40166f:	41 5c                	pop    r12
  401671:	c3                   	ret    

Disassembly of section .text.gets:

0000000000401680 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  401680:	f3 0f 1e fa          	endbr64 
  401684:	41 54                	push   r12
  401686:	49 89 fc             	mov    r12,rdi
	*str = 0;
  401689:	c6 07 00             	mov    BYTE PTR [rdi],0x0
  40168c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	while(1)
	{
		read(1, str, 1);
  401690:	ba 01 00 00 00       	mov    edx,0x1
  401695:	4c 89 e6             	mov    rsi,r12
  401698:	bf 01 00 00 00       	mov    edi,0x1
  40169d:	31 c0                	xor    eax,eax
  40169f:	e8 9c f9 ff ff       	call   401040 <read>
		if(!*str)
  4016a4:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  4016a9:	84 c0                	test   al,al
  4016ab:	74 e3                	je     401690 <gets+0x10>
		{
			continue;
		}
		if(*str == '\n')
  4016ad:	3c 0a                	cmp    al,0xa
  4016af:	74 1f                	je     4016d0 <gets+0x50>
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  4016b1:	3c 08                	cmp    al,0x8
  4016b3:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  4016b8:	4c 0f 44 e2          	cmove  r12,rdx
		}
		*++str = 0;
  4016bc:	41 c6 44 24 01 00    	mov    BYTE PTR [r12+0x1],0x0
  4016c2:	49 83 c4 01          	add    r12,0x1
  4016c6:	eb c8                	jmp    401690 <gets+0x10>
  4016c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4016cf:	00 
	}
	return str;
  4016d0:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  4016d3:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  4016d8:	41 5c                	pop    r12
  4016da:	c3                   	ret    

Disassembly of section .text.memset:

00000000004016e0 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  4016e0:	f3 0f 1e fa          	endbr64 
  4016e4:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  4016e7:	48 85 d2             	test   rdx,rdx
  4016ea:	74 77                	je     401763 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  4016ec:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  4016f1:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  4016f4:	48 83 fa 02          	cmp    rdx,0x2
  4016f8:	76 69                	jbe    401763 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  4016fa:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  4016ff:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401703:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401708:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40170c:	48 83 fa 06          	cmp    rdx,0x6
  401710:	76 51                	jbe    401763 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401712:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401717:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40171b:	48 83 fa 08          	cmp    rdx,0x8
  40171f:	76 42                	jbe    401763 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401721:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401724:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401728:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40172b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40172e:	45 89 c1             	mov    r9d,r8d
	s += k;
  401731:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  401735:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401738:	44 89 c7             	mov    edi,r8d
  40173b:	41 c1 e1 10          	shl    r9d,0x10
  40173f:	c1 e7 08             	shl    edi,0x8
  401742:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401746:	44 09 cf             	or     edi,r9d
  401749:	48 01 ca             	add    rdx,rcx
  40174c:	44 09 c7             	or     edi,r8d
  40174f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  401751:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  401758:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  40175a:	48 83 c1 04          	add    rcx,0x4
  40175e:	48 39 ca             	cmp    rdx,rcx
  401761:	75 f5                	jne    401758 <memset+0x78>
	}

	return dest;
}
  401763:	c3                   	ret    

Disassembly of section .text.strcat:

0000000000401770 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  401770:	f3 0f 1e fa          	endbr64 
  401774:	41 54                	push   r12
  401776:	49 89 fc             	mov    r12,rdi
  401779:	55                   	push   rbp
  40177a:	48 89 f5             	mov    rbp,rsi
  40177d:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  40177e:	e8 7d 00 00 00       	call   401800 <strlen>
	const size_t srclen = strlen(src);
  401783:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  401786:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  401789:	e8 72 00 00 00       	call   401800 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  40178e:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  401792:	48 89 ee             	mov    rsi,rbp
  401795:	48 8d 50 01          	lea    rdx,[rax+0x1]
  401799:	e8 c2 2d 00 00       	call   404560 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  40179e:	4c 89 e0             	mov    rax,r12
  4017a1:	5b                   	pop    rbx
  4017a2:	5d                   	pop    rbp
  4017a3:	41 5c                	pop    r12
  4017a5:	c3                   	ret    

Disassembly of section .text.strcmp:

00000000004017b0 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  4017b0:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  4017b4:	48 39 f7             	cmp    rdi,rsi
  4017b7:	74 34                	je     4017ed <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  4017b9:	48 85 ff             	test   rdi,rdi
  4017bc:	74 38                	je     4017f6 <strcmp+0x46>
  4017be:	48 85 f6             	test   rsi,rsi
  4017c1:	74 33                	je     4017f6 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  4017c3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4017c6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4017c9:	38 ca                	cmp    dl,cl
  4017cb:	75 23                	jne    4017f0 <strcmp+0x40>
  4017cd:	b8 01 00 00 00       	mov    eax,0x1
  4017d2:	eb 15                	jmp    4017e9 <strcmp+0x39>
  4017d4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4017d8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4017dc:	48 83 c0 01          	add    rax,0x1
  4017e0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4017e5:	38 ca                	cmp    dl,cl
  4017e7:	75 07                	jne    4017f0 <strcmp+0x40>
		{
			if(*s1 == 0)
  4017e9:	84 d2                	test   dl,dl
  4017eb:	75 eb                	jne    4017d8 <strcmp+0x28>
		return 0;
  4017ed:	31 c0                	xor    eax,eax
  4017ef:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  4017f0:	0f be c2             	movsx  eax,dl
  4017f3:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  4017f5:	c3                   	ret    
	int r = -1;
  4017f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4017fb:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000401800 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  401800:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  401804:	48 89 fe             	mov    rsi,rdi
  401807:	40 f6 c7 07          	test   dil,0x7
  40180b:	75 0d                	jne    40181a <strlen+0x1a>
  40180d:	eb 21                	jmp    401830 <strlen+0x30>
  40180f:	90                   	nop
  401810:	48 83 c7 01          	add    rdi,0x1
  401814:	40 f6 c7 07          	test   dil,0x7
  401818:	74 16                	je     401830 <strlen+0x30>
	{
		if(*p == '\0')
  40181a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40181d:	75 f1                	jne    401810 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  40181f:	48 89 f8             	mov    rax,rdi
  401822:	48 29 f0             	sub    rax,rsi
  401825:	c3                   	ret    
  401826:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40182d:	00 00 00 
		if((*lp - mask01) & mask80)
  401830:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401837:	fe fe fe 
  40183a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401841:	80 80 80 
  401844:	eb 38                	jmp    40187e <strlen+0x7e>
  401846:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40184d:	00 00 00 
			testbyte(1);
  401850:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  401854:	74 3a                	je     401890 <strlen+0x90>
			testbyte(2);
  401856:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  40185a:	74 3c                	je     401898 <strlen+0x98>
			testbyte(3);
  40185c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  401860:	74 3e                	je     4018a0 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  401862:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  401866:	74 40                	je     4018a8 <strlen+0xa8>
			testbyte(5);
  401868:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  40186c:	74 42                	je     4018b0 <strlen+0xb0>
			testbyte(6);
  40186e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  401872:	74 44                	je     4018b8 <strlen+0xb8>
			testbyte(7);
  401874:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  401878:	74 46                	je     4018c0 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  40187a:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  40187e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401881:	48 01 c8             	add    rax,rcx
  401884:	48 85 d0             	test   rax,rdx
  401887:	74 f1                	je     40187a <strlen+0x7a>
			testbyte(0);
  401889:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40188c:	75 c2                	jne    401850 <strlen+0x50>
  40188e:	eb 8f                	jmp    40181f <strlen+0x1f>
			testbyte(1);
  401890:	48 29 f7             	sub    rdi,rsi
  401893:	48 8d 47 01          	lea    rax,[rdi+0x1]
  401897:	c3                   	ret    
			testbyte(2);
  401898:	48 29 f7             	sub    rdi,rsi
  40189b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  40189f:	c3                   	ret    
			testbyte(3);
  4018a0:	48 29 f7             	sub    rdi,rsi
  4018a3:	48 8d 47 03          	lea    rax,[rdi+0x3]
  4018a7:	c3                   	ret    
			testbyte(4);
  4018a8:	48 29 f7             	sub    rdi,rsi
  4018ab:	48 8d 47 04          	lea    rax,[rdi+0x4]
  4018af:	c3                   	ret    
			testbyte(5);
  4018b0:	48 29 f7             	sub    rdi,rsi
  4018b3:	48 8d 47 05          	lea    rax,[rdi+0x5]
  4018b7:	c3                   	ret    
			testbyte(6);
  4018b8:	48 29 f7             	sub    rdi,rsi
  4018bb:	48 8d 47 06          	lea    rax,[rdi+0x6]
  4018bf:	c3                   	ret    
			testbyte(7);
  4018c0:	48 29 f7             	sub    rdi,rsi
  4018c3:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  4018c7:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

00000000004018d0 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  4018d0:	f3 0f 1e fa          	endbr64 
  4018d4:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4018d6:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  4018dd:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4018de:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  4018e5:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4018e6:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4018e9:	48 c1 fd 03          	sar    rbp,0x3
  4018ed:	74 16                	je     401905 <__libc_init_array+0x35>
  4018ef:	31 db                	xor    ebx,ebx
  4018f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  4018f8:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  4018fc:	48 83 c3 01          	add    rbx,0x1
  401900:	48 39 dd             	cmp    rbp,rbx
  401903:	75 f3                	jne    4018f8 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  401905:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40190c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401913:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401916:	48 c1 fd 03          	sar    rbp,0x3
  40191a:	74 11                	je     40192d <__libc_init_array+0x5d>
  40191c:	31 db                	xor    ebx,ebx
  40191e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401920:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401924:	48 83 c3 01          	add    rbx,0x1
  401928:	48 39 dd             	cmp    rbp,rbx
  40192b:	75 f3                	jne    401920 <__libc_init_array+0x50>
	}
}
  40192d:	5b                   	pop    rbx
  40192e:	5d                   	pop    rbp
  40192f:	41 5c                	pop    r12
  401931:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401940 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401940:	f3 0f 1e fa          	endbr64 
  401944:	55                   	push   rbp
  401945:	53                   	push   rbx
  401946:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  40194a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401951:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  401958:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  40195b:	48 c1 fb 03          	sar    rbx,0x3
  40195f:	74 14                	je     401975 <__libc_fini_array+0x35>
  401961:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  401968:	48 83 eb 01          	sub    rbx,0x1
  40196c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  401970:	48 85 db             	test   rbx,rbx
  401973:	75 f3                	jne    401968 <__libc_fini_array+0x28>
	}
}
  401975:	48 83 c4 08          	add    rsp,0x8
  401979:	5b                   	pop    rbx
  40197a:	5d                   	pop    rbp
  40197b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000401980 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  401980:	f3 0f 1e fa          	endbr64 
  401984:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  401988:	48 c7 c7 a6 58 40 00 	mov    rdi,0x4058a6
  40198f:	48 c7 c2 ac 58 40 00 	mov    rdx,0x4058ac
  401996:	31 f6                	xor    esi,esi
  401998:	48 29 fa             	sub    rdx,rdi
  40199b:	e8 40 fd ff ff       	call   4016e0 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  4019a0:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  4019a4:	e9 27 ff ff ff       	jmp    4018d0 <__libc_init_array>

Disassembly of section .text.entry:

00000000004019b0 <entry>:
{
  4019b0:	f3 0f 1e fa          	endbr64 
  4019b4:	41 54                	push   r12
  4019b6:	49 89 f4             	mov    r12,rsi
  4019b9:	55                   	push   rbp
  4019ba:	89 fd                	mov    ebp,edi
  4019bc:	53                   	push   rbx
  4019bd:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  4019c0:	e8 bb ff ff ff       	call   401980 <CRTStartup>
	environ = _environ;
  4019c5:	48 c7 c0 b0 58 40 00 	mov    rax,0x4058b0
	__heap_base = sbrk(0);
  4019cc:	31 ff                	xor    edi,edi
	environ = _environ;
  4019ce:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  4019d1:	31 c0                	xor    eax,eax
  4019d3:	e8 c8 f7 ff ff       	call   4011a0 <sbrk>
  4019d8:	48 c7 c2 30 59 40 00 	mov    rdx,0x405930
	return main(argc, argv);
  4019df:	4c 89 e6             	mov    rsi,r12
  4019e2:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  4019e4:	89 02                	mov    DWORD PTR [rdx],eax
}
  4019e6:	5b                   	pop    rbx
  4019e7:	5d                   	pop    rbp
  4019e8:	41 5c                	pop    r12
	return main(argc, argv);
  4019ea:	e9 4c e6 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

00000000004019f0 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  4019f0:	66 48 0f 7e c0       	movq   rax,xmm0
}
  4019f5:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401a00 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401a00:	e8 eb ff ff ff       	call   4019f0 <get_bit_access>
  401a05:	48 c1 e8 3f          	shr    rax,0x3f
}
  401a09:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401a10 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401a10:	48 89 f8             	mov    rax,rdi
  401a13:	48 c1 e8 34          	shr    rax,0x34
  401a17:	25 ff 07 00 00       	and    eax,0x7ff
  401a1c:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401a21:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401a30 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401a30:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401a33:	8d 50 01             	lea    edx,[rax+0x1]
  401a36:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401a39:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  401a3c:	73 22                	jae    401a60 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  401a3e:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401a41:	48 85 d2             	test   rdx,rdx
  401a44:	74 12                	je     401a58 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401a46:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  401a4a:	40 0f be fe          	movsx  edi,sil
  401a4e:	4c 89 c6             	mov    rsi,r8
  401a51:	ff e2                	jmp    rdx
  401a53:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  401a58:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  401a5c:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  401a60:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000401a70 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401a70:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  401a74:	74 0a                	je     401a80 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  401a76:	c3                   	ret    
  401a77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401a7e:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401a80:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  401a83:	85 d2                	test   edx,edx
  401a85:	74 ef                	je     401a76 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  401a87:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  401a8b:	48 85 c9             	test   rcx,rcx
  401a8e:	74 e6                	je     401a76 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  401a90:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401a93:	8d 72 ff             	lea    esi,[rdx-0x1]
  401a96:	39 c2                	cmp    edx,eax
  401a98:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  401a9c:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  401aa0:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401ab0 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401ab0:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401ab7:	48 89 f8             	mov    rax,rdi
  return gadget;
  401aba:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401ac1:	00 
  401ac2:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401ac9:	00 
  401aca:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401ad1:	00 
}
  401ad2:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401ae0 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401ae0:	48 83 ec 28          	sub    rsp,0x28
  401ae4:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401ae7:	48 89 e7             	mov    rdi,rsp
  401aea:	e8 c1 ff ff ff       	call   401ab0 <discarding_gadget>
  401aef:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401af4:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401af8:	48 85 f6             	test   rsi,rsi
  401afb:	74 33                	je     401b30 <buffer_gadget+0x50>
  401afd:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401b02:	48 39 c2             	cmp    rdx,rax
  401b05:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401b09:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401b0d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401b12:	4c 89 c0             	mov    rax,r8
  return result;
  401b15:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401b1a:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401b20:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401b24:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401b29:	48 83 c4 28          	add    rsp,0x28
  401b2d:	c3                   	ret    
  401b2e:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401b30:	48 89 ce             	mov    rsi,rcx
  401b33:	eb d4                	jmp    401b09 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401b40 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401b40:	48 83 ec 28          	sub    rsp,0x28
  401b44:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401b47:	48 89 e7             	mov    rdi,rsp
  401b4a:	e8 61 ff ff ff       	call   401ab0 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401b4f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401b53:	4c 89 c0             	mov    rax,r8
  return result;
  401b56:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401b5b:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401b60:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401b67:	7f 
  401b68:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401b6e:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401b72:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401b77:	48 83 c4 28          	add    rsp,0x28
  401b7b:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401b80 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401b80:	48 83 ec 08          	sub    rsp,0x8
  401b84:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401b87:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 402370 <putchar_wrapper>
  401b8e:	31 d2                	xor    edx,edx
  401b90:	e8 ab ff ff ff       	call   401b40 <function_gadget>
}
  401b95:	4c 89 c8             	mov    rax,r9
  401b98:	48 83 c4 08          	add    rsp,0x8
  401b9c:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401ba0 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401ba0:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401ba3:	74 33                	je     401bd8 <strnlen_s_+0x38>
  401ba5:	85 f6                	test   esi,esi
  401ba7:	74 2f                	je     401bd8 <strnlen_s_+0x38>
  401ba9:	89 f6                	mov    esi,esi
  401bab:	48 89 f8             	mov    rax,rdi
  401bae:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401bb2:	eb 09                	jmp    401bbd <strnlen_s_+0x1d>
  401bb4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401bb8:	48 39 c2             	cmp    rdx,rax
  401bbb:	74 13                	je     401bd0 <strnlen_s_+0x30>
  401bbd:	48 83 c0 01          	add    rax,0x1
  401bc1:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401bc4:	75 f2                	jne    401bb8 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401bc6:	29 f8                	sub    eax,edi
  401bc8:	c3                   	ret    
  401bc9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401bd0:	89 d0                	mov    eax,edx
  401bd2:	29 f8                	sub    eax,edi
  401bd4:	c3                   	ret    
  401bd5:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401bd8:	31 c0                	xor    eax,eax
}
  401bda:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401be0 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401be0:	83 ef 30             	sub    edi,0x30
  401be3:	40 80 ff 09          	cmp    dil,0x9
  401be7:	0f 96 c0             	setbe  al
}
  401bea:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401bf0 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401bf0:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401bf3:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401bf6:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401bf9:	eb 19                	jmp    401c14 <atou_+0x24>
  401bfb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401c00:	48 83 c2 01          	add    rdx,0x1
  401c04:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401c08:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401c0b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401c0f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401c14:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401c17:	e8 c4 ff ff ff       	call   401be0 <is_digit_>
  401c1c:	84 c0                	test   al,al
  401c1e:	75 e0                	jne    401c00 <atou_+0x10>
  }
  return i;
}
  401c20:	44 89 c0             	mov    eax,r8d
  401c23:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401c30 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401c30:	41 57                	push   r15
  401c32:	44 89 c0             	mov    eax,r8d
  401c35:	49 89 ff             	mov    r15,rdi
  401c38:	41 56                	push   r14
  401c3a:	41 55                	push   r13
  401c3c:	41 89 d5             	mov    r13d,edx
  401c3f:	41 54                	push   r12
  401c41:	49 89 f4             	mov    r12,rsi
  401c44:	55                   	push   rbp
  401c45:	89 cd                	mov    ebp,ecx
  401c47:	53                   	push   rbx
  401c48:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401c4c:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401c50:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401c55:	a8 03                	test   al,0x3
  401c57:	75 1b                	jne    401c74 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401c59:	39 ca                	cmp    edx,ecx
  401c5b:	73 17                	jae    401c74 <out_rev_+0x44>
  401c5d:	89 d3                	mov    ebx,edx
  401c5f:	90                   	nop
      putchar_via_gadget(output, ' ');
  401c60:	be 20 00 00 00       	mov    esi,0x20
  401c65:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401c68:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401c6b:	e8 c0 fd ff ff       	call   401a30 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401c70:	39 dd                	cmp    ebp,ebx
  401c72:	75 ec                	jne    401c60 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401c74:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401c78:	4c 01 e3             	add    rbx,r12
  401c7b:	45 85 ed             	test   r13d,r13d
  401c7e:	74 17                	je     401c97 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401c80:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401c83:	4c 89 ff             	mov    rdi,r15
  401c86:	e8 a5 fd ff ff       	call   401a30 <putchar_via_gadget>
  while (len) {
  401c8b:	48 89 da             	mov    rdx,rbx
  401c8e:	48 83 eb 01          	sub    rbx,0x1
  401c92:	49 39 d4             	cmp    r12,rdx
  401c95:	75 e9                	jne    401c80 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401c97:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401c9c:	74 2a                	je     401cc8 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401c9e:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401ca2:	44 29 f2             	sub    edx,r14d
  401ca5:	39 d5                	cmp    ebp,edx
  401ca7:	76 1f                	jbe    401cc8 <out_rev_+0x98>
  401ca9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401cb0:	be 20 00 00 00       	mov    esi,0x20
  401cb5:	4c 89 ff             	mov    rdi,r15
  401cb8:	e8 73 fd ff ff       	call   401a30 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401cbd:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401cc1:	44 29 f2             	sub    edx,r14d
  401cc4:	39 ea                	cmp    edx,ebp
  401cc6:	72 e8                	jb     401cb0 <out_rev_+0x80>
    }
  }
}
  401cc8:	48 83 c4 18          	add    rsp,0x18
  401ccc:	5b                   	pop    rbx
  401ccd:	5d                   	pop    rbp
  401cce:	41 5c                	pop    r12
  401cd0:	41 5d                	pop    r13
  401cd2:	41 5e                	pop    r14
  401cd4:	41 5f                	pop    r15
  401cd6:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401ce0 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401ce0:	55                   	push   rbp
  401ce1:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ce4:	83 fa 1f             	cmp    edx,0x1f
{
  401ce7:	49 89 f3             	mov    r11,rsi
  401cea:	53                   	push   rbx
  401ceb:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401cf0:	89 d6                	mov    esi,edx
  401cf2:	89 cb                	mov    ebx,ecx
  401cf4:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401cf9:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401cfc:	41 f6 c0 02          	test   r8b,0x2
  401d00:	0f 85 fa 00 00 00    	jne    401e00 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401d06:	44 89 c2             	mov    edx,r8d
  401d09:	83 e2 01             	and    edx,0x1
  401d0c:	45 85 d2             	test   r10d,r10d
  401d0f:	0f 84 eb 00 00 00    	je     401e00 <print_integer_finalization+0x120>
  401d15:	85 d2                	test   edx,edx
  401d17:	0f 84 e3 00 00 00    	je     401e00 <print_integer_finalization+0x120>
  401d1d:	84 c9                	test   cl,cl
  401d1f:	0f 85 cb 01 00 00    	jne    401ef0 <print_integer_finalization+0x210>
  401d25:	41 f6 c0 0c          	test   r8b,0xc
  401d29:	0f 85 c1 01 00 00    	jne    401ef0 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d2f:	44 39 d6             	cmp    esi,r10d
  401d32:	0f 83 c8 00 00 00    	jae    401e00 <print_integer_finalization+0x120>
  401d38:	84 c0                	test   al,al
  401d3a:	0f 84 c0 00 00 00    	je     401e00 <print_integer_finalization+0x120>
  401d40:	89 f0                	mov    eax,esi
  401d42:	89 f2                	mov    edx,esi
  401d44:	4c 01 d8             	add    rax,r11
  401d47:	eb 0b                	jmp    401d54 <print_integer_finalization+0x74>
  401d49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401d50:	84 c9                	test   cl,cl
  401d52:	74 15                	je     401d69 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401d54:	83 c2 01             	add    edx,0x1
  401d57:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d5a:	83 fa 1f             	cmp    edx,0x1f
  401d5d:	0f 96 c1             	setbe  cl
  401d60:	48 83 c0 01          	add    rax,0x1
  401d64:	44 39 d2             	cmp    edx,r10d
  401d67:	72 e7                	jb     401d50 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d69:	44 39 ca             	cmp    edx,r9d
  401d6c:	73 26                	jae    401d94 <print_integer_finalization+0xb4>
  401d6e:	84 c9                	test   cl,cl
  401d70:	74 22                	je     401d94 <print_integer_finalization+0xb4>
  401d72:	89 d0                	mov    eax,edx
  401d74:	4c 01 d8             	add    rax,r11
  401d77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401d7e:	00 00 
      buf[len++] = '0';
  401d80:	83 c2 01             	add    edx,0x1
  401d83:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401d86:	48 83 c0 01          	add    rax,0x1
  401d8a:	41 39 d1             	cmp    r9d,edx
  401d8d:	76 05                	jbe    401d94 <print_integer_finalization+0xb4>
  401d8f:	83 fa 1f             	cmp    edx,0x1f
  401d92:	76 ec                	jbe    401d80 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401d94:	39 d6                	cmp    esi,edx
  401d96:	0f 92 c0             	setb   al
  401d99:	40 80 fd 08          	cmp    bpl,0x8
  401d9d:	0f 94 c1             	sete   cl
  401da0:	20 c1                	and    cl,al
  401da2:	74 06                	je     401daa <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401da4:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401da8:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401daa:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401db1:	0f 84 8c 00 00 00    	je     401e43 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401db7:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401dbe:	74 58                	je     401e18 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dc0:	83 fa 1f             	cmp    edx,0x1f
  401dc3:	0f 96 c0             	setbe  al
  401dc6:	40 80 fd 10          	cmp    bpl,0x10
  401dca:	0f 84 30 01 00 00    	je     401f00 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dd0:	40 80 fd 02          	cmp    bpl,0x2
  401dd4:	75 0e                	jne    401de4 <print_integer_finalization+0x104>
  401dd6:	84 c0                	test   al,al
  401dd8:	74 0a                	je     401de4 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401dda:	89 d0                	mov    eax,edx
  401ddc:	83 c2 01             	add    edx,0x1
  401ddf:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401de4:	83 fa 20             	cmp    edx,0x20
  401de7:	75 50                	jne    401e39 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401de9:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401dea:	44 89 d1             	mov    ecx,r10d
  401ded:	4c 89 de             	mov    rsi,r11
}
  401df0:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401df1:	e9 3a fe ff ff       	jmp    401c30 <out_rev_>
  401df6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401dfd:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e00:	44 39 ce             	cmp    esi,r9d
  401e03:	89 f2                	mov    edx,esi
  401e05:	0f 92 c1             	setb   cl
  401e08:	20 c8                	and    al,cl
  401e0a:	0f 85 62 ff ff ff    	jne    401d72 <print_integer_finalization+0x92>
  401e10:	eb 98                	jmp    401daa <print_integer_finalization+0xca>
  401e12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401e18:	85 d2                	test   edx,edx
  401e1a:	75 74                	jne    401e90 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e1c:	40 80 fd 10          	cmp    bpl,0x10
  401e20:	0f 84 05 01 00 00    	je     401f2b <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e26:	40 80 fd 02          	cmp    bpl,0x2
  401e2a:	0f 85 2e 01 00 00    	jne    401f5e <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401e30:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401e34:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401e39:	89 d0                	mov    eax,edx
  401e3b:	83 c2 01             	add    edx,0x1
  401e3e:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401e43:	83 fa 20             	cmp    edx,0x20
  401e46:	74 a1                	je     401de9 <print_integer_finalization+0x109>
    if (negative) {
  401e48:	84 db                	test   bl,bl
  401e4a:	74 1c                	je     401e68 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401e4c:	89 d0                	mov    eax,edx
}
  401e4e:	5b                   	pop    rbx
      buf[len++] = '-';
  401e4f:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401e52:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401e55:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401e5a:	4c 89 de             	mov    rsi,r11
}
  401e5d:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401e5e:	e9 cd fd ff ff       	jmp    401c30 <out_rev_>
  401e63:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401e68:	41 f6 c0 04          	test   r8b,0x4
  401e6c:	75 62                	jne    401ed0 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401e6e:	41 f6 c0 08          	test   r8b,0x8
  401e72:	0f 84 71 ff ff ff    	je     401de9 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401e78:	89 d0                	mov    eax,edx
  401e7a:	83 c2 01             	add    edx,0x1
  401e7d:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  401e82:	e9 62 ff ff ff       	jmp    401de9 <print_integer_finalization+0x109>
  401e87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401e8e:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401e90:	41 39 d1             	cmp    r9d,edx
  401e93:	74 09                	je     401e9e <print_integer_finalization+0x1be>
  401e95:	44 39 d2             	cmp    edx,r10d
  401e98:	0f 85 22 ff ff ff    	jne    401dc0 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  401e9e:	84 c0                	test   al,al
  401ea0:	0f 85 99 00 00 00    	jne    401f3f <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401ea6:	40 80 fd 10          	cmp    bpl,0x10
  401eaa:	0f 94 c0             	sete   al
  401ead:	40 80 fd 02          	cmp    bpl,0x2
  401eb1:	0f 94 c1             	sete   cl
  401eb4:	08 c8                	or     al,cl
  401eb6:	0f 84 04 ff ff ff    	je     401dc0 <print_integer_finalization+0xe0>
  401ebc:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  401ebe:	83 da 00             	sbb    edx,0x0
  401ec1:	e9 fa fe ff ff       	jmp    401dc0 <print_integer_finalization+0xe0>
  401ec6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401ecd:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  401ed0:	89 d0                	mov    eax,edx
}
  401ed2:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  401ed3:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401ed6:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  401ed9:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  401ede:	4c 89 de             	mov    rsi,r11
}
  401ee1:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401ee2:	e9 49 fd ff ff       	jmp    401c30 <out_rev_>
  401ee7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401eee:	00 00 
        width--;
  401ef0:	41 83 ea 01          	sub    r10d,0x1
  401ef4:	e9 36 fe ff ff       	jmp    401d2f <print_integer_finalization+0x4f>
  401ef9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f00:	44 89 c1             	mov    ecx,r8d
  401f03:	83 e1 20             	and    ecx,0x20
  401f06:	75 0c                	jne    401f14 <print_integer_finalization+0x234>
  401f08:	84 c0                	test   al,al
  401f0a:	75 60                	jne    401f6c <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f0c:	85 c9                	test   ecx,ecx
  401f0e:	0f 84 d0 fe ff ff    	je     401de4 <print_integer_finalization+0x104>
  401f14:	84 c0                	test   al,al
  401f16:	0f 84 c8 fe ff ff    	je     401de4 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401f1c:	89 d0                	mov    eax,edx
  401f1e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  401f21:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  401f26:	e9 b9 fe ff ff       	jmp    401de4 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f2b:	41 f6 c0 20          	test   r8b,0x20
  401f2f:	75 1f                	jne    401f50 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  401f31:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  401f35:	ba 01 00 00 00       	mov    edx,0x1
  401f3a:	e9 fa fe ff ff       	jmp    401e39 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401f3f:	83 ea 01             	sub    edx,0x1
  401f42:	0f 84 d4 fe ff ff    	je     401e1c <print_integer_finalization+0x13c>
  401f48:	e9 59 ff ff ff       	jmp    401ea6 <print_integer_finalization+0x1c6>
  401f4d:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  401f50:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  401f54:	ba 01 00 00 00       	mov    edx,0x1
  401f59:	e9 db fe ff ff       	jmp    401e39 <print_integer_finalization+0x159>
      buf[len++] = '0';
  401f5e:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  401f62:	ba 01 00 00 00       	mov    edx,0x1
  401f67:	e9 dc fe ff ff       	jmp    401e48 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  401f6c:	89 d0                	mov    eax,edx
  401f6e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  401f71:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  401f76:	e9 69 fe ff ff       	jmp    401de4 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000401f80 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401f80:	41 57                	push   r15
  401f82:	41 56                	push   r14
  401f84:	41 55                	push   r13
  401f86:	41 89 cd             	mov    r13d,ecx
  401f89:	41 54                	push   r12
  401f8b:	49 89 fc             	mov    r12,rdi
  401f8e:	55                   	push   rbp
  401f8f:	53                   	push   rbx
  401f90:	89 d3                	mov    ebx,edx
  401f92:	48 83 ec 28          	sub    rsp,0x28
  401f96:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  401f9b:	48 85 f6             	test   rsi,rsi
  401f9e:	75 48                	jne    401fe8 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  401fa0:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  401fa7:	0f 85 a3 00 00 00    	jne    402050 <print_integer+0xd0>
      buf[len++] = '0';
  401fad:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  401fb1:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  401fb5:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  401fba:	48 89 e6             	mov    rsi,rsp
  401fbd:	41 56                	push   r14
  401fbf:	0f b6 cb             	movzx  ecx,bl
  401fc2:	4c 89 e7             	mov    rdi,r12
  401fc5:	41 51                	push   r9
  401fc7:	45 89 c1             	mov    r9d,r8d
  401fca:	45 0f b6 c5          	movzx  r8d,r13b
  401fce:	e8 0d fd ff ff       	call   401ce0 <print_integer_finalization>
}
  401fd3:	48 83 c4 38          	add    rsp,0x38
  401fd7:	5b                   	pop    rbx
  401fd8:	5d                   	pop    rbp
  401fd9:	41 5c                	pop    r12
  401fdb:	41 5d                	pop    r13
  401fdd:	41 5e                	pop    r14
  401fdf:	41 5f                	pop    r15
  401fe1:	c3                   	ret    
  401fe2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401fe8:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  401feb:	44 0f b6 d1          	movzx  r10d,cl
  401fef:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  401ff4:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  401ff9:	83 e0 20             	and    eax,0x20
  401ffc:	83 f8 01             	cmp    eax,0x1
  401fff:	45 19 db             	sbb    r11d,r11d
  402002:	41 83 e3 20          	and    r11d,0x20
  402006:	41 83 c3 37          	add    r11d,0x37
  40200a:	eb 07                	jmp    402013 <print_integer+0x93>
  40200c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  402010:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  402013:	31 d2                	xor    edx,edx
  402015:	48 89 f0             	mov    rax,rsi
  402018:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  40201b:	48 83 fa 09          	cmp    rdx,0x9
  40201f:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  402023:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  402027:	89 ca                	mov    edx,ecx
  402029:	41 0f 46 ff          	cmovbe edi,r15d
  40202d:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  402032:	48 83 c1 01          	add    rcx,0x1
  402036:	4c 39 d6             	cmp    rsi,r10
  402039:	0f 82 7b ff ff ff    	jb     401fba <print_integer+0x3a>
  40203f:	83 fa 1f             	cmp    edx,0x1f
  402042:	76 cc                	jbe    402010 <print_integer+0x90>
  402044:	e9 71 ff ff ff       	jmp    401fba <print_integer+0x3a>
  402049:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  402050:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  402053:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  402055:	41 83 e6 ef          	and    r14d,0xffffffef
  402059:	80 f9 10             	cmp    cl,0x10
  40205c:	44 0f 45 f0          	cmovne r14d,eax
  402060:	e9 55 ff ff ff       	jmp    401fba <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000402070 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  402070:	e8 8b f9 ff ff       	call   401a00 <get_sign_bit>
{
  402075:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  402078:	85 c0                	test   eax,eax
  40207a:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  40207d:	74 08                	je     402087 <get_components+0x17>
  40207f:	66 0f 57 05 09 35 00 	xorpd  xmm0,XMMWORD PTR [rip+0x3509]        # 405590 <powers_of_10+0x90>
  402086:	00 
  number_.integral = (int_fast64_t)abs_number;
  402087:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40208c:	66 0f ef d2          	pxor   xmm2,xmm2
  402090:	66 0f 28 c8          	movapd xmm1,xmm0
  402094:	89 f0                	mov    eax,esi
  402096:	48 8d 3d 63 34 00 00 	lea    rdi,[rip+0x3463]        # 405500 <powers_of_10>
  40209d:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  4020a2:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  4020a7:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  4020ab:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  4020af:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  4020b3:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  4020b8:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  4020bd:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  4020c1:	f2 0f 10 15 d7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34d7]        # 4055a0 <powers_of_10+0xa0>
  4020c8:	00 
  4020c9:	66 0f 2f ca          	comisd xmm1,xmm2
  4020cd:	76 51                	jbe    402120 <get_components+0xb0>
    ++number_.fractional;
  4020cf:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  4020d3:	66 0f ef c9          	pxor   xmm1,xmm1
  4020d7:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  4020dc:	66 0f 2f cb          	comisd xmm1,xmm3
  4020e0:	73 56                	jae    402138 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  4020e2:	85 f6                	test   esi,esi
  4020e4:	75 27                	jne    40210d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  4020e6:	66 0f ef c9          	pxor   xmm1,xmm1
  4020ea:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  4020ef:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  4020f3:	66 0f 2f d0          	comisd xmm2,xmm0
  4020f7:	76 06                	jbe    4020ff <get_components+0x8f>
  4020f9:	66 0f 2f c2          	comisd xmm0,xmm2
  4020fd:	76 0e                	jbe    40210d <get_components+0x9d>
  4020ff:	48 89 d6             	mov    rsi,rdx
  402102:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  402105:	48 83 fe 01          	cmp    rsi,0x1
  402109:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40210d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  402111:	4c 89 c0             	mov    rax,r8
  return number_;
  402114:	49 89 10             	mov    QWORD PTR [r8],rdx
  402117:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  40211b:	c3                   	ret    
  40211c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402120:	66 0f 2e ca          	ucomisd xmm1,xmm2
  402124:	7a bc                	jp     4020e2 <get_components+0x72>
  402126:	75 ba                	jne    4020e2 <get_components+0x72>
  402128:	48 85 c0             	test   rax,rax
  40212b:	75 13                	jne    402140 <get_components+0xd0>
    ++number_.fractional;
  40212d:	48 83 c0 01          	add    rax,0x1
  402131:	eb af                	jmp    4020e2 <get_components+0x72>
  402133:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  402138:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  40213c:	31 c0                	xor    eax,eax
  40213e:	eb a2                	jmp    4020e2 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402140:	a8 01                	test   al,0x1
  402142:	74 9e                	je     4020e2 <get_components+0x72>
  402144:	eb e7                	jmp    40212d <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

0000000000402150 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  402150:	66 0f 2f 05 40 34 00 	comisd xmm0,QWORD PTR [rip+0x3440]        # 405598 <powers_of_10+0x98>
  402157:	00 
  402158:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  40215c:	73 10                	jae    40216e <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  40215e:	66 0f ef c9          	pxor   xmm1,xmm1
  402162:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402166:	66 0f 2e c8          	ucomisd xmm1,xmm0
  40216a:	7a 04                	jp     402170 <bastardized_floor+0x20>
  40216c:	75 02                	jne    402170 <bastardized_floor+0x20>
}
  40216e:	c3                   	ret    
  40216f:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  402170:	83 e8 01             	sub    eax,0x1
}
  402173:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

0000000000402180 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  402180:	e8 6b f8 ff ff       	call   4019f0 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  402185:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  40218c:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  40218f:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  402192:	48 89 c7             	mov    rdi,rax
  402195:	e8 76 f8 ff ff       	call   401a10 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40219a:	48 21 ca             	and    rdx,rcx
  40219d:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  4021a4:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4021a7:	f2 0f 10 1d 11 34 00 	movsd  xmm3,QWORD PTR [rip+0x3411]        # 4055c0 <powers_of_10+0xc0>
  4021ae:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  4021af:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4021b2:	f2 0f 10 05 f6 33 00 	movsd  xmm0,QWORD PTR [rip+0x33f6]        # 4055b0 <powers_of_10+0xb0>
  4021b9:	00 
  double z = (dwba.F - 1.5);
  4021ba:	66 48 0f 6e ca       	movq   xmm1,rdx
  4021bf:	f2 0f 5c 0d e1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33e1]        # 4055a8 <powers_of_10+0xa8>
  4021c6:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4021c7:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4021cb:	66 0f 28 d1          	movapd xmm2,xmm1
  4021cf:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4021d3:	f2 0f 58 05 dd 33 00 	addsd  xmm0,QWORD PTR [rip+0x33dd]        # 4055b8 <powers_of_10+0xb8>
  4021da:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4021db:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4021df:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4021e3:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4021e7:	f2 0f 59 15 d9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33d9]        # 4055c8 <powers_of_10+0xc8>
  4021ee:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4021ef:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4021f3:	f2 0f 59 0d d5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33d5]        # 4055d0 <powers_of_10+0xd0>
  4021fa:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4021fb:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4021ff:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402203:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  402207:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

0000000000402210 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  402210:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  402216:	0f 84 b4 00 00 00    	je     4022d0 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  40221c:	66 0f ef d2          	pxor   xmm2,xmm2
  402220:	f2 0f 10 05 b8 33 00 	movsd  xmm0,QWORD PTR [rip+0x33b8]        # 4055e0 <powers_of_10+0xe0>
  402227:	00 
  402228:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  40222c:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  402230:	f2 0f 58 05 68 33 00 	addsd  xmm0,QWORD PTR [rip+0x3368]        # 4055a0 <powers_of_10+0xa0>
  402237:	00 
  402238:	e8 13 ff ff ff       	call   402150 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40223d:	f2 0f 10 0d a3 33 00 	movsd  xmm1,QWORD PTR [rip+0x33a3]        # 4055e8 <powers_of_10+0xe8>
  402244:	00 
  402245:	66 0f ef c0          	pxor   xmm0,xmm0
  402249:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  40224d:	f2 0f 59 05 9b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x339b]        # 4055f0 <powers_of_10+0xf0>
  402254:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  402255:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  402257:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  40225b:	48 05 ff 03 00 00    	add    rax,0x3ff
  402261:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402265:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40226a:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  40226e:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402272:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  402276:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  40227a:	f2 0f 58 c1          	addsd  xmm0,xmm1
  40227e:	66 0f 28 e2          	movapd xmm4,xmm2
  402282:	f2 0f 5e 25 6e 33 00 	divsd  xmm4,QWORD PTR [rip+0x336e]        # 4055f8 <powers_of_10+0xf8>
  402289:	00 
  40228a:	66 0f 28 da          	movapd xmm3,xmm2
  40228e:	f2 0f 58 25 6a 33 00 	addsd  xmm4,QWORD PTR [rip+0x336a]        # 405600 <powers_of_10+0x100>
  402295:	00 
  402296:	f2 0f 5e dc          	divsd  xmm3,xmm4
  40229a:	f2 0f 58 1d 66 33 00 	addsd  xmm3,QWORD PTR [rip+0x3366]        # 405608 <powers_of_10+0x108>
  4022a1:	00 
  4022a2:	f2 0f 5e d3          	divsd  xmm2,xmm3
  4022a6:	f2 0f 10 1d 62 33 00 	movsd  xmm3,QWORD PTR [rip+0x3362]        # 405610 <powers_of_10+0x110>
  4022ad:	00 
  4022ae:	f2 0f 5c d9          	subsd  xmm3,xmm1
  4022b2:	f2 0f 58 d3          	addsd  xmm2,xmm3
  4022b6:	f2 0f 5e c2          	divsd  xmm0,xmm2
  4022ba:	f2 0f 58 05 56 33 00 	addsd  xmm0,QWORD PTR [rip+0x3356]        # 405618 <powers_of_10+0x118>
  4022c1:	00 
  4022c2:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  4022c6:	c3                   	ret    
  4022c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4022ce:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  4022d0:	f2 0f 10 05 00 33 00 	movsd  xmm0,QWORD PTR [rip+0x3300]        # 4055d8 <powers_of_10+0xd8>
  4022d7:	00 
}
  4022d8:	c3                   	ret    

Disassembly of section .text.parse_flags:

00000000004022e0 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  4022e0:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  4022e3:	48 8d 0d 06 30 00 00 	lea    rcx,[rip+0x3006]        # 4052f0 <memcpy+0xd90>
  4022ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4022f0:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  4022f3:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  4022f6:	83 e8 20             	sub    eax,0x20
  4022f9:	3c 10                	cmp    al,0x10
  4022fb:	77 13                	ja     402310 <parse_flags+0x30>
  4022fd:	0f b6 c0             	movzx  eax,al
  402300:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402304:	48 01 c8             	add    rax,rcx
  402307:	3e ff e0             	notrack jmp rax
  40230a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  402310:	44 89 c0             	mov    eax,r8d
  402313:	c3                   	ret    
  402314:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  402318:	41 83 c8 01          	or     r8d,0x1
  40231c:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402320:	48 89 17             	mov    QWORD PTR [rdi],rdx
  402323:	eb cb                	jmp    4022f0 <parse_flags+0x10>
  402325:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  402328:	41 83 c8 02          	or     r8d,0x2
  40232c:	48 83 c2 01          	add    rdx,0x1
  402330:	eb ee                	jmp    402320 <parse_flags+0x40>
  402332:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402338:	41 83 c8 04          	or     r8d,0x4
  40233c:	48 83 c2 01          	add    rdx,0x1
  402340:	eb de                	jmp    402320 <parse_flags+0x40>
  402342:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  402348:	41 83 c8 10          	or     r8d,0x10
  40234c:	48 83 c2 01          	add    rdx,0x1
  402350:	eb ce                	jmp    402320 <parse_flags+0x40>
  402352:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  402358:	41 83 c8 08          	or     r8d,0x8
  40235c:	48 83 c2 01          	add    rdx,0x1
  402360:	eb be                	jmp    402320 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

0000000000402370 <putchar_wrapper>:
{
  402370:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  402374:	40 0f be ff          	movsx  edi,dil
  402378:	e9 e3 18 00 00       	jmp    403c60 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000402380 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  402380:	41 56                	push   r14
  402382:	49 89 ca             	mov    r10,rcx
  402385:	41 89 d3             	mov    r11d,edx
  402388:	41 55                	push   r13
  40238a:	45 89 c5             	mov    r13d,r8d
  40238d:	41 54                	push   r12
  40238f:	55                   	push   rbp
  402390:	53                   	push   rbx
  402391:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  402396:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40239b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  40239f:	45 85 ed             	test   r13d,r13d
  4023a2:	0f 84 90 00 00 00    	je     402438 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4023a8:	44 89 c0             	mov    eax,r8d
  4023ab:	25 10 10 00 00       	and    eax,0x1010
  4023b0:	3d 00 10 00 00       	cmp    eax,0x1000
  4023b5:	0f 84 05 02 00 00    	je     4025c0 <print_broken_up_decimal.isra.0+0x240>
  4023bb:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  4023be:	89 cb                	mov    ebx,ecx
  4023c0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  4023c5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  4023cc:	66 66 66 
  4023cf:	49 01 ec             	add    r12,rbp
  4023d2:	eb 43                	jmp    402417 <print_broken_up_decimal.isra.0+0x97>
  4023d4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4023d8:	48 89 f0             	mov    rax,rsi
  4023db:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  4023de:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  4023e2:	49 f7 ed             	imul   r13
  4023e5:	48 89 f0             	mov    rax,rsi
  4023e8:	41 29 de             	sub    r14d,ebx
  4023eb:	83 c3 01             	add    ebx,0x1
  4023ee:	48 c1 f8 3f          	sar    rax,0x3f
  4023f2:	48 c1 fa 02          	sar    rdx,0x2
  4023f6:	48 29 c2             	sub    rdx,rax
  4023f9:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4023fd:	48 01 c0             	add    rax,rax
  402400:	48 29 c6             	sub    rsi,rax
  402403:	83 c6 30             	add    esi,0x30
  402406:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40240b:	48 89 d6             	mov    rsi,rdx
  40240e:	48 85 d2             	test   rdx,rdx
  402411:	0f 84 f9 00 00 00    	je     402510 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402417:	83 fb 20             	cmp    ebx,0x20
  40241a:	75 bc                	jne    4023d8 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  40241c:	44 89 c0             	mov    eax,r8d
  40241f:	83 e0 03             	and    eax,0x3
  402422:	83 f8 01             	cmp    eax,0x1
  402425:	0f 84 35 01 00 00    	je     402560 <print_broken_up_decimal.isra.0+0x1e0>
  40242b:	ba 20 00 00 00       	mov    edx,0x20
  402430:	e9 7d 00 00 00       	jmp    4024b2 <print_broken_up_decimal.isra.0+0x132>
  402435:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402438:	41 f6 c0 10          	test   r8b,0x10
  40243c:	0f 85 8e 00 00 00    	jne    4024d0 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  402442:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  402449:	66 66 66 
  40244c:	89 ce                	mov    esi,ecx
  40244e:	48 01 ee             	add    rsi,rbp
  402451:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402458:	83 f9 20             	cmp    ecx,0x20
  40245b:	74 bf                	je     40241c <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  40245d:	48 89 f8             	mov    rax,rdi
  402460:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  402463:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  402467:	48 f7 eb             	imul   rbx
  40246a:	48 89 f8             	mov    rax,rdi
  40246d:	48 c1 f8 3f          	sar    rax,0x3f
  402471:	48 c1 fa 02          	sar    rdx,0x2
  402475:	48 29 c2             	sub    rdx,rax
  402478:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40247c:	48 01 c0             	add    rax,rax
  40247f:	48 29 c7             	sub    rdi,rax
  402482:	83 c7 30             	add    edi,0x30
  402485:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  402489:	48 89 d7             	mov    rdi,rdx
  40248c:	48 85 d2             	test   rdx,rdx
  40248f:	75 c7                	jne    402458 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  402491:	44 89 c0             	mov    eax,r8d
  402494:	83 e0 03             	and    eax,0x3
  402497:	83 f8 01             	cmp    eax,0x1
  40249a:	0f 84 b8 01 00 00    	je     402658 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4024a0:	83 f9 20             	cmp    ecx,0x20
  4024a3:	74 86                	je     40242b <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  4024a5:	45 84 db             	test   r11b,r11b
  4024a8:	74 46                	je     4024f0 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  4024aa:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  4024af:	8d 51 01             	lea    edx,[rcx+0x1]
}
  4024b2:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  4024b3:	48 89 ee             	mov    rsi,rbp
  4024b6:	44 89 c9             	mov    ecx,r9d
}
  4024b9:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  4024ba:	4c 89 d7             	mov    rdi,r10
}
  4024bd:	41 5c                	pop    r12
  4024bf:	41 5d                	pop    r13
  4024c1:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  4024c3:	e9 68 f7 ff ff       	jmp    401c30 <out_rev_>
  4024c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4024cf:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4024d0:	83 f9 20             	cmp    ecx,0x20
  4024d3:	0f 84 43 ff ff ff    	je     40241c <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  4024d9:	89 c8                	mov    eax,ecx
  4024db:	83 c1 01             	add    ecx,0x1
  4024de:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  4024e3:	e9 5a ff ff ff       	jmp    402442 <print_broken_up_decimal.isra.0+0xc2>
  4024e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4024ef:	00 
    else if (flags & FLAGS_PLUS) {
  4024f0:	41 f6 c0 04          	test   r8b,0x4
  4024f4:	0f 85 3e 01 00 00    	jne    402638 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  4024fa:	89 ca                	mov    edx,ecx
  4024fc:	41 f6 c0 08          	test   r8b,0x8
  402500:	74 b0                	je     4024b2 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  402502:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  402507:	83 c2 01             	add    edx,0x1
  40250a:	eb a6                	jmp    4024b2 <print_broken_up_decimal.isra.0+0x132>
  40250c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402510:	83 fb 1f             	cmp    ebx,0x1f
  402513:	77 13                	ja     402528 <print_broken_up_decimal.isra.0+0x1a8>
  402515:	45 85 f6             	test   r14d,r14d
  402518:	89 d8                	mov    eax,ebx
  40251a:	0f 95 c2             	setne  dl
  40251d:	48 01 e8             	add    rax,rbp
  402520:	84 d2                	test   dl,dl
  402522:	75 20                	jne    402544 <print_broken_up_decimal.isra.0+0x1c4>
  402524:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402528:	83 fb 20             	cmp    ebx,0x20
  40252b:	0f 84 eb fe ff ff    	je     40241c <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  402531:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  402536:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402539:	e9 04 ff ff ff       	jmp    402442 <print_broken_up_decimal.isra.0+0xc2>
  40253e:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402540:	39 ca                	cmp    edx,ecx
  402542:	74 e4                	je     402528 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  402544:	89 da                	mov    edx,ebx
  402546:	83 c3 01             	add    ebx,0x1
  402549:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  40254c:	48 83 c0 01          	add    rax,0x1
  402550:	83 fb 1f             	cmp    ebx,0x1f
  402553:	76 eb                	jbe    402540 <print_broken_up_decimal.isra.0+0x1c0>
  402555:	eb d1                	jmp    402528 <print_broken_up_decimal.isra.0+0x1a8>
  402557:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40255e:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402560:	45 85 c9             	test   r9d,r9d
  402563:	0f 84 c2 fe ff ff    	je     40242b <print_broken_up_decimal.isra.0+0xab>
  402569:	31 d2                	xor    edx,edx
  40256b:	b9 20 00 00 00       	mov    ecx,0x20
  402570:	45 84 db             	test   r11b,r11b
  402573:	0f 85 cf 00 00 00    	jne    402648 <print_broken_up_decimal.isra.0+0x2c8>
  402579:	41 f6 c0 0c          	test   r8b,0xc
  40257d:	0f 85 c5 00 00 00    	jne    402648 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402583:	44 39 c9             	cmp    ecx,r9d
  402586:	0f 83 14 ff ff ff    	jae    4024a0 <print_broken_up_decimal.isra.0+0x120>
  40258c:	89 c8                	mov    eax,ecx
  40258e:	48 01 e8             	add    rax,rbp
  402591:	84 d2                	test   dl,dl
  402593:	0f 84 07 ff ff ff    	je     4024a0 <print_broken_up_decimal.isra.0+0x120>
  402599:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  4025a0:	83 c1 01             	add    ecx,0x1
  4025a3:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4025a6:	48 83 c0 01          	add    rax,0x1
  4025aa:	44 39 c9             	cmp    ecx,r9d
  4025ad:	0f 83 ed fe ff ff    	jae    4024a0 <print_broken_up_decimal.isra.0+0x120>
  4025b3:	83 f9 1f             	cmp    ecx,0x1f
  4025b6:	76 e8                	jbe    4025a0 <print_broken_up_decimal.isra.0+0x220>
  4025b8:	e9 e3 fe ff ff       	jmp    4024a0 <print_broken_up_decimal.isra.0+0x120>
  4025bd:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4025c0:	48 85 f6             	test   rsi,rsi
  4025c3:	0f 8e 79 fe ff ff    	jle    402442 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  4025c9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  4025d0:	cc cc cc 
  4025d3:	48 89 f0             	mov    rax,rsi
  4025d6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  4025dd:	99 99 19 
  4025e0:	48 0f af c3          	imul   rax,rbx
  4025e4:	48 01 d0             	add    rax,rdx
  4025e7:	48 d1 c8             	ror    rax,1
  4025ea:	48 39 d0             	cmp    rax,rdx
  4025ed:	0f 87 c8 fd ff ff    	ja     4023bb <print_broken_up_decimal.isra.0+0x3b>
  4025f3:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  4025fa:	99 99 19 
  4025fd:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  402600:	48 89 f0             	mov    rax,rsi
  402603:	49 89 f4             	mov    r12,rsi
        --count;
  402606:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  40260a:	48 f7 e3             	mul    rbx
  40260d:	48 89 d6             	mov    rsi,rdx
  402610:	48 c1 ee 03          	shr    rsi,0x3
  402614:	48 89 f0             	mov    rax,rsi
  402617:	48 0f af c3          	imul   rax,rbx
  40261b:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  40261e:	4c 39 f0             	cmp    rax,r14
  402621:	76 dd                	jbe    402600 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  402623:	49 83 fc 09          	cmp    r12,0x9
  402627:	0f 8f 8e fd ff ff    	jg     4023bb <print_broken_up_decimal.isra.0+0x3b>
  40262d:	e9 10 fe ff ff       	jmp    402442 <print_broken_up_decimal.isra.0+0xc2>
  402632:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  402638:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  40263d:	8d 51 01             	lea    edx,[rcx+0x1]
  402640:	e9 6d fe ff ff       	jmp    4024b2 <print_broken_up_decimal.isra.0+0x132>
  402645:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  402648:	41 83 e9 01          	sub    r9d,0x1
  40264c:	e9 32 ff ff ff       	jmp    402583 <print_broken_up_decimal.isra.0+0x203>
  402651:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402658:	45 85 c9             	test   r9d,r9d
  40265b:	0f 84 3f fe ff ff    	je     4024a0 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402661:	83 f9 1f             	cmp    ecx,0x1f
  402664:	0f 96 c2             	setbe  dl
  402667:	e9 04 ff ff ff       	jmp    402570 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

0000000000402670 <print_decimal_number>:
{
  402670:	41 54                	push   r12
  402672:	49 89 fb             	mov    r11,rdi
  402675:	41 89 f2             	mov    r10d,esi
  402678:	4d 89 c4             	mov    r12,r8
  40267b:	55                   	push   rbp
  40267c:	89 cd                	mov    ebp,ecx
  40267e:	53                   	push   rbx
  40267f:	89 d3                	mov    ebx,edx
  402681:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  402685:	48 89 e7             	mov    rdi,rsp
  402688:	e8 e3 f9 ff ff       	call   402070 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  40268d:	48 83 ec 08          	sub    rsp,0x8
  402691:	45 89 d0             	mov    r8d,r10d
  402694:	4c 89 d9             	mov    rcx,r11
  402697:	41 51                	push   r9
  402699:	41 89 d9             	mov    r9d,ebx
  40269c:	41 54                	push   r12
  40269e:	55                   	push   rbp
  40269f:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  4026a4:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  4026a9:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  4026ae:	e8 cd fc ff ff       	call   402380 <print_broken_up_decimal.isra.0>
}
  4026b3:	48 83 c4 40          	add    rsp,0x40
  4026b7:	5b                   	pop    rbx
  4026b8:	5d                   	pop    rbp
  4026b9:	41 5c                	pop    r12
  4026bb:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

00000000004026c0 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  4026c0:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  4026c4:	40 84 ff             	test   dil,dil
  4026c7:	74 17                	je     4026e0 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  4026c9:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  4026cd:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  4026d2:	31 c0                	xor    eax,eax
  4026d4:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  4026d6:	66 0f 28 c1          	movapd xmm0,xmm1
}
  4026da:	c3                   	ret    
  4026db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  4026e0:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  4026e4:	e8 07 f3 ff ff       	call   4019f0 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  4026e9:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  4026ed:	48 89 c7             	mov    rdi,rax
  4026f0:	e8 1b f3 ff ff       	call   401a10 <get_exp2>
  4026f5:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  4026f7:	e8 f4 f2 ff ff       	call   4019f0 <get_bit_access>
  4026fc:	48 89 c7             	mov    rdi,rax
  4026ff:	e8 0c f3 ff ff       	call   401a10 <get_exp2>
  402704:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  402707:	89 d0                	mov    eax,edx
  402709:	f7 d8                	neg    eax
  40270b:	0f 49 d0             	cmovns edx,eax
  40270e:	44 89 c0             	mov    eax,r8d
  402711:	f7 d8                	neg    eax
  402713:	41 0f 48 c0          	cmovs  eax,r8d
  402717:	39 c2                	cmp    edx,eax
  402719:	7f 1d                	jg     402738 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40271b:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  40271f:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402724:	31 c0                	xor    eax,eax
}
  402726:	48 83 c4 08          	add    rsp,0x8
  return result;
  40272a:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40272c:	66 0f 28 c1          	movapd xmm0,xmm1
}
  402730:	c3                   	ret    
  402731:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402738:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  40273c:	31 d2                	xor    edx,edx
  return result;
  40273e:	31 c0                	xor    eax,eax
}
  402740:	48 83 c4 08          	add    rsp,0x8
  return result;
  402744:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402746:	66 0f 28 c2          	movapd xmm0,xmm2
}
  40274a:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

0000000000402750 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  402750:	40 84 ff             	test   dil,dil
  402753:	74 0b                	je     402760 <unapply_scaling.isra.0+0x10>
  402755:	f2 0f 5e c1          	divsd  xmm0,xmm1
  402759:	c3                   	ret    
  40275a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402760:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  402764:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

0000000000402770 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  402770:	40 84 ff             	test   dil,dil
  402773:	74 0b                	je     402780 <apply_scaling.isra.0+0x10>
  402775:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  402779:	c3                   	ret    
  40277a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402780:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  402784:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000402790 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402790:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402792:	48 83 ec 08          	sub    rsp,0x8
  402796:	49 89 f9             	mov    r9,rdi
  402799:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  40279b:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  40279e:	66 0f 28 d0          	movapd xmm2,xmm0
  4027a2:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  4027a5:	e8 c6 ff ff ff       	call   402770 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  4027aa:	3d 32 01 00 00       	cmp    eax,0x132
  4027af:	0f 8f ab 00 00 00    	jg     402860 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  4027b5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4027ba:	66 0f ef c0          	pxor   xmm0,xmm0
  4027be:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  4027c2:	89 d6                	mov    esi,edx
  4027c4:	48 8d 05 35 2d 00 00 	lea    rax,[rip+0x2d35]        # 405500 <powers_of_10>
  4027cb:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4027cf:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  4027d4:	e8 77 ff ff ff       	call   402750 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  4027d9:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4027de:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  4027e2:	66 0f 28 c3          	movapd xmm0,xmm3
  4027e6:	66 0f 28 cc          	movapd xmm1,xmm4
  4027ea:	e8 d1 fe ff ff       	call   4026c0 <update_normalization.isra.0>
  4027ef:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  4027f3:	89 c7                	mov    edi,eax
  4027f5:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  4027f9:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  4027fb:	e8 70 ff ff ff       	call   402770 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402800:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  402804:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402809:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40280e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  402812:	66 0f 2f 05 86 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d86]        # 4055a0 <powers_of_10+0xa0>
  402819:	00 
  40281a:	0f 93 c0             	setae  al
  40281d:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  402820:	66 0f 2e 05 78 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d78]        # 4055a0 <powers_of_10+0xa0>
  402827:	00 
  402828:	7a 06                	jp     402830 <get_normalized_components.isra.0+0xa0>
  40282a:	75 04                	jne    402830 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  40282c:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  402830:	66 0f ef c0          	pxor   xmm0,xmm0
  402834:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  402839:	66 0f 2f c4          	comisd xmm0,xmm4
  40283d:	73 19                	jae    402858 <get_normalized_components.isra.0+0xc8>
  return components;
  40283f:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  402843:	4c 89 c8             	mov    rax,r9
  return components;
  402846:	49 89 09             	mov    QWORD PTR [r9],rcx
  402849:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  40284d:	48 83 c4 08          	add    rsp,0x8
  402851:	c3                   	ret    
  402852:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  402858:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  40285c:	31 c0                	xor    eax,eax
  40285e:	eb df                	jmp    40283f <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  402860:	40 84 f6             	test   sil,sil
  402863:	74 08                	je     40286d <get_normalized_components.isra.0+0xdd>
  402865:	66 0f 57 05 23 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d23]        # 405590 <powers_of_10+0x90>
  40286c:	00 
  40286d:	89 d6                	mov    esi,edx
  40286f:	4c 89 cf             	mov    rdi,r9
  402872:	e8 f9 f7 ff ff       	call   402070 <get_components>
}
  402877:	4c 89 c8             	mov    rax,r9
  40287a:	48 83 c4 08          	add    rsp,0x8
  40287e:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000402880 <print_exponential_number>:
{
  402880:	41 57                	push   r15
  402882:	41 89 f3             	mov    r11d,esi
  402885:	66 0f 28 f0          	movapd xmm6,xmm0
  402889:	41 56                	push   r14
  40288b:	41 55                	push   r13
  40288d:	49 89 fd             	mov    r13,rdi
  402890:	41 54                	push   r12
  402892:	41 89 d4             	mov    r12d,edx
  402895:	55                   	push   rbp
  402896:	89 cd                	mov    ebp,ecx
  402898:	53                   	push   rbx
  402899:	48 83 ec 38          	sub    rsp,0x38
  40289d:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  4028a1:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  4028a6:	e8 55 f1 ff ff       	call   401a00 <get_sign_bit>
  4028ab:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  4028ad:	85 c0                	test   eax,eax
  4028af:	74 08                	je     4028b9 <print_exponential_number+0x39>
  4028b1:	66 0f 57 35 d7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cd7]        # 405590 <powers_of_10+0x90>
  4028b8:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  4028b9:	41 89 e8             	mov    r8d,ebp
  4028bc:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  4028c3:	66 0f 2e 35 cd 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2ccd]        # 405598 <powers_of_10+0x98>
  4028ca:	00 
  4028cb:	0f 8a 9f 00 00 00    	jp     402970 <print_exponential_number+0xf0>
  4028d1:	0f 85 99 00 00 00    	jne    402970 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  4028d7:	45 85 c0             	test   r8d,r8d
  4028da:	0f 85 18 01 00 00    	jne    4029f8 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  4028e0:	85 f6                	test   esi,esi
  4028e2:	0f 84 63 03 00 00    	je     402c4b <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  4028e8:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  4028ea:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  4028ed:	66 0f 57 35 9b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c9b]        # 405590 <powers_of_10+0x90>
  4028f4:	00 
  4028f5:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4028fa:	44 89 de             	mov    esi,r11d
  4028fd:	66 0f 28 c6          	movapd xmm0,xmm6
  402901:	e8 6a f7 ff ff       	call   402070 <get_components>
  402906:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40290b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402910:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402915:	45 84 ff             	test   r15b,r15b
  402918:	0f 84 49 01 00 00    	je     402a67 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  40291e:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402924:	74 09                	je     40292f <print_exponential_number+0xaf>
  402926:	83 fb ff             	cmp    ebx,0xffffffff
  402929:	0f 8d d1 02 00 00    	jge    402c00 <print_exponential_number+0x380>
        width - exp10_part_width :
  40292f:	45 85 e4             	test   r12d,r12d
  402932:	0f 84 98 02 00 00    	je     402bd0 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402938:	48 83 ec 08          	sub    rsp,0x8
  40293c:	45 89 e1             	mov    r9d,r12d
  40293f:	45 89 d8             	mov    r8d,r11d
  402942:	4c 89 e9             	mov    rcx,r13
  402945:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402949:	50                   	push   rax
  40294a:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  40294e:	55                   	push   rbp
  40294f:	e8 2c fa ff ff       	call   402380 <print_broken_up_decimal.isra.0>
  402954:	48 83 c4 20          	add    rsp,0x20
}
  402958:	48 83 c4 38          	add    rsp,0x38
  40295c:	5b                   	pop    rbx
  40295d:	5d                   	pop    rbp
  40295e:	41 5c                	pop    r12
  402960:	41 5d                	pop    r13
  402962:	41 5e                	pop    r14
  402964:	41 5f                	pop    r15
  402966:	c3                   	ret    
  402967:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40296e:	00 00 
    double exp10 = log10_of_positive(abs_number);
  402970:	66 0f 28 c6          	movapd xmm0,xmm6
  402974:	e8 07 f8 ff ff       	call   402180 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  402979:	e8 d2 f7 ff ff       	call   402150 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  40297e:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  402980:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  402982:	e8 89 f8 ff ff       	call   402210 <pow10_of_int>
    if (abs_number < p10) {
  402987:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  40298b:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  40298f:	76 0b                	jbe    40299c <print_exponential_number+0x11c>
      floored_exp10--;
  402991:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  402994:	f2 0f 5e 0d 64 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c64]        # 405600 <powers_of_10+0x100>
  40299b:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  40299c:	8d 43 11             	lea    eax,[rbx+0x11]
  40299f:	83 f8 22             	cmp    eax,0x22
  4029a2:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  4029a5:	77 15                	ja     4029bc <print_exponential_number+0x13c>
  4029a7:	89 d8                	mov    eax,ebx
  4029a9:	48 8d 15 50 2b 00 00 	lea    rdx,[rip+0x2b50]        # 405500 <powers_of_10>
  4029b0:	f7 d8                	neg    eax
  4029b2:	0f 48 c3             	cmovs  eax,ebx
  4029b5:	48 98                	cdqe   
  4029b7:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  4029bc:	89 d8                	mov    eax,ebx
  4029be:	c1 e8 1f             	shr    eax,0x1f
  4029c1:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  4029c3:	85 db                	test   ebx,ebx
  4029c5:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  4029c8:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  4029cb:	45 85 c0             	test   r8d,r8d
  4029ce:	74 62                	je     402a32 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  4029d0:	45 85 db             	test   r11d,r11d
  4029d3:	b8 01 00 00 00       	mov    eax,0x1
  4029d8:	41 0f 45 c3          	cmovne eax,r11d
  4029dc:	39 c3                	cmp    ebx,eax
  4029de:	0f 9c c0             	setl   al
  4029e1:	83 fb fc             	cmp    ebx,0xfffffffc
  4029e4:	40 0f 9d c7          	setge  dil
  4029e8:	21 f8                	and    eax,edi
  4029ea:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  4029ed:	44 09 fa             	or     edx,r15d
  4029f0:	eb 21                	jmp    402a13 <print_exponential_number+0x193>
  4029f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  4029f8:	45 85 db             	test   r11d,r11d
  4029fb:	b8 01 00 00 00       	mov    eax,0x1
  402a00:	ba 01 00 00 00       	mov    edx,0x1
  402a05:	41 0f 45 c3          	cmovne eax,r11d
  402a09:	85 c0                	test   eax,eax
  402a0b:	41 0f 9f c7          	setg   r15b
  402a0f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402a11:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402a13:	41 83 eb 01          	sub    r11d,0x1
  402a17:	44 89 df             	mov    edi,r11d
  402a1a:	29 df                	sub    edi,ebx
  402a1c:	45 84 ff             	test   r15b,r15b
  402a1f:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402a23:	31 ff                	xor    edi,edi
  402a25:	45 85 db             	test   r11d,r11d
  402a28:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  402a2c:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402a32:	84 d2                	test   dl,dl
  402a34:	0f 85 86 01 00 00    	jne    402bc0 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  402a3a:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402a3c:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402a41:	44 89 da             	mov    edx,r11d
  402a44:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402a47:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402a4b:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  402a4f:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402a53:	e8 38 fd ff ff       	call   402790 <get_normalized_components.isra.0>
  402a58:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402a5d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402a62:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  402a67:	48 83 ff 09          	cmp    rdi,0x9
  402a6b:	7e 0a                	jle    402a77 <print_exponential_number+0x1f7>
      floored_exp10++;
  402a6d:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  402a70:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  402a72:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402a77:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402a7a:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402a7d:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402a81:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402a87:	77 47                	ja     402ad0 <print_exponential_number+0x250>
      0U :
  402a89:	45 85 d2             	test   r10d,r10d
  402a8c:	0f 84 9e 01 00 00    	je     402c30 <print_exponential_number+0x3b0>
  402a92:	41 bf 03 00 00 00    	mov    r15d,0x3
  402a98:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a9d:	48 83 ec 08          	sub    rsp,0x8
  402aa1:	45 31 c9             	xor    r9d,r9d
  402aa4:	45 89 d8             	mov    r8d,r11d
  402aa7:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402aab:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  402aae:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402ab2:	50                   	push   rax
  402ab3:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402ab7:	55                   	push   rbp
  402ab8:	e8 c3 f8 ff ff       	call   402380 <print_broken_up_decimal.isra.0>
  402abd:	48 83 c4 20          	add    rsp,0x20
  402ac1:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402ac6:	eb 61                	jmp    402b29 <print_exponential_number+0x2a9>
  402ac8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402acf:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402ad0:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402ad5:	45 85 d2             	test   r10d,r10d
  402ad8:	0f 85 62 01 00 00    	jne    402c40 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402ade:	45 89 e1             	mov    r9d,r12d
  402ae1:	b9 00 00 00 00       	mov    ecx,0x0
  402ae6:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402aea:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402aed:	41 29 c1             	sub    r9d,eax
  402af0:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402af3:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402af7:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402afb:	48 83 ec 08          	sub    rsp,0x8
  402aff:	4c 89 e9             	mov    rcx,r13
  402b02:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402b06:	50                   	push   rax
  402b07:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402b0b:	55                   	push   rbp
  402b0c:	e8 6f f8 ff ff       	call   402380 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402b11:	48 83 c4 20          	add    rsp,0x20
  402b15:	45 84 ff             	test   r15b,r15b
  402b18:	0f 85 3a fe ff ff    	jne    402958 <print_exponential_number+0xd8>
    print_integer(output,
  402b1e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402b22:	45 31 d2             	xor    r10d,r10d
  402b25:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402b29:	83 e5 20             	and    ebp,0x20
  402b2c:	4c 89 ef             	mov    rdi,r13
  402b2f:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402b33:	83 fd 01             	cmp    ebp,0x1
  402b36:	19 f6                	sbb    esi,esi
  402b38:	83 e6 20             	and    esi,0x20
  402b3b:	83 c6 45             	add    esi,0x45
  402b3e:	e8 ed ee ff ff       	call   401a30 <putchar_via_gadget>
    print_integer(output,
  402b43:	48 63 c3             	movsxd rax,ebx
  402b46:	89 da                	mov    edx,ebx
  402b48:	45 89 f9             	mov    r9d,r15d
  402b4b:	48 89 c6             	mov    rsi,rax
  402b4e:	c1 ea 1f             	shr    edx,0x1f
  402b51:	b9 0a 00 00 00       	mov    ecx,0xa
  402b56:	4c 89 ef             	mov    rdi,r13
  402b59:	48 f7 de             	neg    rsi
  402b5c:	85 db                	test   ebx,ebx
  402b5e:	48 0f 4f f0          	cmovg  rsi,rax
  402b62:	48 83 ec 08          	sub    rsp,0x8
  402b66:	45 31 c0             	xor    r8d,r8d
  402b69:	6a 05                	push   0x5
  402b6b:	e8 10 f4 ff ff       	call   401f80 <print_integer>
    if (flags & FLAGS_LEFT) {
  402b70:	58                   	pop    rax
  402b71:	5a                   	pop    rdx
  402b72:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402b76:	45 85 d2             	test   r10d,r10d
  402b79:	0f 84 d9 fd ff ff    	je     402958 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402b7f:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402b83:	44 29 f0             	sub    eax,r14d
  402b86:	44 39 e0             	cmp    eax,r12d
  402b89:	0f 83 c9 fd ff ff    	jae    402958 <print_exponential_number+0xd8>
  402b8f:	90                   	nop
        putchar_via_gadget(output, ' ');
  402b90:	be 20 00 00 00       	mov    esi,0x20
  402b95:	4c 89 ef             	mov    rdi,r13
  402b98:	e8 93 ee ff ff       	call   401a30 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402b9d:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402ba1:	44 29 f0             	sub    eax,r14d
  402ba4:	44 39 e0             	cmp    eax,r12d
  402ba7:	72 e7                	jb     402b90 <print_exponential_number+0x310>
}
  402ba9:	48 83 c4 38          	add    rsp,0x38
  402bad:	5b                   	pop    rbx
  402bae:	5d                   	pop    rbp
  402baf:	41 5c                	pop    r12
  402bb1:	41 5d                	pop    r13
  402bb3:	41 5e                	pop    r14
  402bb5:	41 5f                	pop    r15
  402bb7:	c3                   	ret    
  402bb8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402bbf:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402bc0:	85 f6                	test   esi,esi
  402bc2:	0f 84 2d fd ff ff    	je     4028f5 <print_exponential_number+0x75>
  402bc8:	e9 20 fd ff ff       	jmp    4028ed <print_exponential_number+0x6d>
  402bcd:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402bd0:	48 83 ec 08          	sub    rsp,0x8
  402bd4:	4c 89 e9             	mov    rcx,r13
  402bd7:	45 31 c9             	xor    r9d,r9d
  402bda:	45 89 d8             	mov    r8d,r11d
  402bdd:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402be1:	50                   	push   rax
  402be2:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402be6:	55                   	push   rbp
  402be7:	e8 94 f7 ff ff       	call   402380 <print_broken_up_decimal.isra.0>
  402bec:	48 83 c4 20          	add    rsp,0x20
}
  402bf0:	48 83 c4 38          	add    rsp,0x38
  402bf4:	5b                   	pop    rbx
  402bf5:	5d                   	pop    rbp
  402bf6:	41 5c                	pop    r12
  402bf8:	41 5d                	pop    r13
  402bfa:	41 5e                	pop    r14
  402bfc:	41 5f                	pop    r15
  402bfe:	c3                   	ret    
  402bff:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402c00:	83 c3 01             	add    ebx,0x1
  402c03:	66 0f ef c0          	pxor   xmm0,xmm0
  402c07:	48 8d 05 f2 28 00 00 	lea    rax,[rip+0x28f2]        # 405500 <powers_of_10>
  402c0e:	48 63 db             	movsxd rbx,ebx
  402c11:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402c16:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402c1b:	0f 8a 0e fd ff ff    	jp     40292f <print_exponential_number+0xaf>
  402c21:	0f 85 08 fd ff ff    	jne    40292f <print_exponential_number+0xaf>
      precision--;
  402c27:	41 83 eb 01          	sub    r11d,0x1
  402c2b:	e9 ff fc ff ff       	jmp    40292f <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402c30:	b8 04 00 00 00       	mov    eax,0x4
  402c35:	e9 a4 fe ff ff       	jmp    402ade <print_exponential_number+0x25e>
  402c3a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402c40:	41 bf 04 00 00 00    	mov    r15d,0x4
  402c46:	e9 4d fe ff ff       	jmp    402a98 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402c4b:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402c50:	44 89 de             	mov    esi,r11d
  402c53:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402c57:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402c59:	e8 12 f4 ff ff       	call   402070 <get_components>
  402c5e:	45 31 ff             	xor    r15d,r15d
  402c61:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402c66:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402c6b:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402c70:	e9 f2 fd ff ff       	jmp    402a67 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402c80 <print_floating_point>:
  if (value != value) {
  402c80:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402c84:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402c87:	0f 8a eb 00 00 00    	jp     402d78 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402c8d:	f2 0f 10 0d 8b 29 00 	movsd  xmm1,QWORD PTR [rip+0x298b]        # 405620 <powers_of_10+0x120>
  402c94:	00 
  402c95:	66 0f 2f c8          	comisd xmm1,xmm0
  402c99:	0f 87 21 01 00 00    	ja     402dc0 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402c9f:	66 0f 2f 05 81 29 00 	comisd xmm0,QWORD PTR [rip+0x2981]        # 405628 <powers_of_10+0x128>
  402ca6:	00 
  402ca7:	77 57                	ja     402d00 <print_floating_point+0x80>
{
  402ca9:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402cad:	45 84 c0             	test   r8b,r8b
  402cb0:	75 7e                	jne    402d30 <print_floating_point+0xb0>
  402cb2:	66 0f 2f 05 76 29 00 	comisd xmm0,QWORD PTR [rip+0x2976]        # 405630 <powers_of_10+0x130>
  402cb9:	00 
  402cba:	0f 87 e8 00 00 00    	ja     402da8 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402cc0:	f2 0f 10 0d 70 29 00 	movsd  xmm1,QWORD PTR [rip+0x2970]        # 405638 <powers_of_10+0x138>
  402cc7:	00 
  402cc8:	66 0f 2f c8          	comisd xmm1,xmm0
  402ccc:	0f 87 d6 00 00 00    	ja     402da8 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402cd2:	41 89 c9             	mov    r9d,ecx
  402cd5:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402cdc:	0f 85 fe 00 00 00    	jne    402de0 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402ce2:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402ce7:	49 89 e0             	mov    r8,rsp
  402cea:	44 89 d2             	mov    edx,r10d
  402ced:	e8 7e f9 ff ff       	call   402670 <print_decimal_number>
}
  402cf2:	48 83 c4 28          	add    rsp,0x28
  402cf6:	c3                   	ret    
  402cf7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402cfe:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402d00:	89 c8                	mov    eax,ecx
  402d02:	48 8d 35 30 26 00 00 	lea    rsi,[rip+0x2630]        # 405339 <memcpy+0xdd9>
  402d09:	41 89 c8             	mov    r8d,ecx
  402d0c:	44 89 d1             	mov    ecx,r10d
  402d0f:	83 e0 04             	and    eax,0x4
  402d12:	83 f8 01             	cmp    eax,0x1
  402d15:	19 d2                	sbb    edx,edx
  402d17:	83 c2 04             	add    edx,0x4
  402d1a:	85 c0                	test   eax,eax
  402d1c:	48 8d 05 11 26 00 00 	lea    rax,[rip+0x2611]        # 405334 <memcpy+0xdd4>
  402d23:	48 0f 45 f0          	cmovne rsi,rax
  402d27:	e9 04 ef ff ff       	jmp    401c30 <out_rev_>
  402d2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402d30:	41 89 c9             	mov    r9d,ecx
  402d33:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402d3a:	74 54                	je     402d90 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402d3c:	b8 01 00 00 00       	mov    eax,0x1
  402d41:	45 31 c9             	xor    r9d,r9d
  402d44:	83 fe 11             	cmp    esi,0x11
  402d47:	76 4c                	jbe    402d95 <print_floating_point+0x115>
  402d49:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402d4e:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402d50:	41 89 c1             	mov    r9d,eax
  402d53:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402d57:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402d5a:	48 83 c0 01          	add    rax,0x1
  402d5e:	41 83 f9 1f          	cmp    r9d,0x1f
  402d62:	77 05                	ja     402d69 <print_floating_point+0xe9>
  402d64:	83 fe 11             	cmp    esi,0x11
  402d67:	77 e7                	ja     402d50 <print_floating_point+0xd0>
  if (prefer_exponential)
  402d69:	45 84 c0             	test   r8b,r8b
  402d6c:	0f 84 75 ff ff ff    	je     402ce7 <print_floating_point+0x67>
  402d72:	eb 21                	jmp    402d95 <print_floating_point+0x115>
  402d74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402d78:	41 89 c8             	mov    r8d,ecx
  402d7b:	48 8d 35 bb 25 00 00 	lea    rsi,[rip+0x25bb]        # 40533d <memcpy+0xddd>
  402d82:	89 d1                	mov    ecx,edx
  402d84:	ba 03 00 00 00       	mov    edx,0x3
  402d89:	e9 a2 ee ff ff       	jmp    401c30 <out_rev_>
  402d8e:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402d90:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402d95:	49 89 e0             	mov    r8,rsp
  402d98:	44 89 d2             	mov    edx,r10d
  402d9b:	e8 e0 fa ff ff       	call   402880 <print_exponential_number>
}
  402da0:	48 83 c4 28          	add    rsp,0x28
  402da4:	c3                   	ret    
  402da5:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402da8:	45 31 c9             	xor    r9d,r9d
  402dab:	49 89 e0             	mov    r8,rsp
  402dae:	44 89 d2             	mov    edx,r10d
  402db1:	e8 ca fa ff ff       	call   402880 <print_exponential_number>
    return;
  402db6:	e9 37 ff ff ff       	jmp    402cf2 <print_floating_point+0x72>
  402dbb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402dc0:	41 89 c8             	mov    r8d,ecx
  402dc3:	48 8d 35 77 25 00 00 	lea    rsi,[rip+0x2577]        # 405341 <memcpy+0xde1>
  402dca:	89 d1                	mov    ecx,edx
  402dcc:	ba 04 00 00 00       	mov    edx,0x4
  402dd1:	e9 5a ee ff ff       	jmp    401c30 <out_rev_>
  402dd6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402ddd:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402de0:	b8 01 00 00 00       	mov    eax,0x1
  402de5:	45 31 c9             	xor    r9d,r9d
  402de8:	83 fe 11             	cmp    esi,0x11
  402deb:	0f 87 58 ff ff ff    	ja     402d49 <print_floating_point+0xc9>
  402df1:	e9 f1 fe ff ff       	jmp    402ce7 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402e00 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402e00:	41 57                	push   r15
  402e02:	41 56                	push   r14
  402e04:	41 55                	push   r13
  402e06:	41 54                	push   r12
  402e08:	55                   	push   rbp
  402e09:	53                   	push   rbx
  402e0a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402e0d:	48 89 f2             	mov    rdx,rsi
{
  402e10:	48 83 ec 28          	sub    rsp,0x28
  402e14:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402e19:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402e1c:	40 84 f6             	test   sil,sil
  402e1f:	0f 84 e5 00 00 00    	je     402f0a <format_string_loop+0x10a>
  402e25:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402e28:	4c 8d 2d 25 25 00 00 	lea    r13,[rip+0x2525]        # 405354 <memcpy+0xdf4>
  402e2f:	90                   	nop
    if (*format != '%') {
  402e30:	40 80 fe 25          	cmp    sil,0x25
  402e34:	0f 85 ae 00 00 00    	jne    402ee8 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402e3a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402e3e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402e43:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402e47:	0f 84 bd 00 00 00    	je     402f0a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402e4d:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402e52:	4c 89 cf             	mov    rdi,r9
  402e55:	e8 86 f4 ff ff       	call   4022e0 <parse_flags>
    if (is_digit_(*format)) {
  402e5a:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402e5f:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402e62:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402e65:	89 fe                	mov    esi,edi
  402e67:	e8 74 ed ff ff       	call   401be0 <is_digit_>
  402e6c:	84 c0                	test   al,al
  402e6e:	0f 85 ac 04 00 00    	jne    403320 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402e74:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402e77:	40 80 fe 2a          	cmp    sil,0x2a
  402e7b:	0f 84 bf 04 00 00    	je     403340 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  402e81:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  402e84:	40 80 fe 2e          	cmp    sil,0x2e
  402e88:	0f 84 52 04 00 00    	je     4032e0 <format_string_loop+0x4e0>
    switch (*format) {
  402e8e:	8d 46 98             	lea    eax,[rsi-0x68]
  402e91:	3c 12                	cmp    al,0x12
  402e93:	77 2f                	ja     402ec4 <format_string_loop+0xc4>
  402e95:	0f b6 c0             	movzx  eax,al
  402e98:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402e9d:	4c 01 e8             	add    rax,r13
  402ea0:	3e ff e0             	notrack jmp rax
  402ea3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  402ea8:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  402eac:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  402eb3:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402eb8:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402ebc:	40 84 f6             	test   sil,sil
  402ebf:	74 49                	je     402f0a <format_string_loop+0x10a>
  402ec1:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  402ec4:	8d 46 db             	lea    eax,[rsi-0x25]
  402ec7:	3c 53                	cmp    al,0x53
  402ec9:	77 1d                	ja     402ee8 <format_string_loop+0xe8>
  402ecb:	48 8d 0d ce 24 00 00 	lea    rcx,[rip+0x24ce]        # 4053a0 <memcpy+0xe40>
  402ed2:	0f b6 c0             	movzx  eax,al
  402ed5:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402ed9:	48 01 c8             	add    rax,rcx
  402edc:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  402edf:	be 25 00 00 00       	mov    esi,0x25
  402ee4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402ee8:	48 89 ef             	mov    rdi,rbp
  402eeb:	e8 40 eb ff ff       	call   401a30 <putchar_via_gadget>
        format++;
  402ef0:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402ef5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402ef9:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  402efe:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402f01:	40 84 f6             	test   sil,sil
  402f04:	0f 85 26 ff ff ff    	jne    402e30 <format_string_loop+0x30>
        break;
    }
  }
}
  402f0a:	48 83 c4 28          	add    rsp,0x28
  402f0e:	5b                   	pop    rbx
  402f0f:	5d                   	pop    rbp
  402f10:	41 5c                	pop    r12
  402f12:	41 5d                	pop    r13
  402f14:	41 5e                	pop    r14
  402f16:	41 5f                	pop    r15
  402f18:	c3                   	ret    
  402f19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  402f20:	40 80 fe 64          	cmp    sil,0x64
  402f24:	0f 84 6e 06 00 00    	je     403598 <format_string_loop+0x798>
  402f2a:	40 80 fe 69          	cmp    sil,0x69
  402f2e:	0f 84 64 06 00 00    	je     403598 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  402f34:	89 f0                	mov    eax,esi
  402f36:	83 e0 df             	and    eax,0xffffffdf
  402f39:	3c 58                	cmp    al,0x58
  402f3b:	0f 84 37 06 00 00    	je     403578 <format_string_loop+0x778>
        else if (*format == 'o') {
  402f41:	b9 08 00 00 00       	mov    ecx,0x8
  402f46:	40 80 fe 6f          	cmp    sil,0x6f
  402f4a:	74 14                	je     402f60 <format_string_loop+0x160>
        else if (*format == 'b') {
  402f4c:	b9 02 00 00 00       	mov    ecx,0x2
  402f51:	40 80 fe 62          	cmp    sil,0x62
  402f55:	74 09                	je     402f60 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  402f57:	41 83 e3 ef          	and    r11d,0xffffffef
  402f5b:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  402f60:	44 89 d8             	mov    eax,r11d
        format++;
  402f63:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  402f67:	83 e0 fe             	and    eax,0xfffffffe
  402f6a:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  402f71:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  402f76:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  402f7a:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  402f7c:	44 89 da             	mov    edx,r11d
  402f7f:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  402f85:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  402f8c:	0f 84 b6 04 00 00    	je     403448 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  402f92:	85 d2                	test   edx,edx
  402f94:	0f 85 be 06 00 00    	jne    403658 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  402f9a:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  402fa1:	0f 85 b1 06 00 00    	jne    403658 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  402fa7:	41 f6 c3 40          	test   r11b,0x40
  402fab:	0f 84 51 08 00 00    	je     403802 <format_string_loop+0xa02>
  402fb1:	83 f8 2f             	cmp    eax,0x2f
  402fb4:	0f 87 bc 08 00 00    	ja     403876 <format_string_loop+0xa76>
  402fba:	89 c2                	mov    edx,eax
  402fbc:	83 c0 08             	add    eax,0x8
  402fbf:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  402fc3:	89 03                	mov    DWORD PTR [rbx],eax
  402fc5:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  402fc8:	48 63 f8             	movsxd rdi,eax
  402fcb:	89 c2                	mov    edx,eax
  402fcd:	45 89 e1             	mov    r9d,r12d
  402fd0:	45 89 f8             	mov    r8d,r15d
  402fd3:	48 89 fe             	mov    rsi,rdi
  402fd6:	c1 ea 1f             	shr    edx,0x1f
  402fd9:	48 f7 de             	neg    rsi
  402fdc:	85 c0                	test   eax,eax
  402fde:	48 0f 4f f7          	cmovg  rsi,rdi
  402fe2:	48 83 ec 08          	sub    rsp,0x8
  402fe6:	48 89 ef             	mov    rdi,rbp
  402fe9:	41 53                	push   r11
  402feb:	e8 90 ef ff ff       	call   401f80 <print_integer>
  while (*format)
  402ff0:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  402ff5:	41 5a                	pop    r10
  402ff7:	41 5b                	pop    r11
  402ff9:	e9 00 ff ff ff       	jmp    402efe <format_string_loop+0xfe>
  402ffe:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  403000:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403004:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403009:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40300d:	40 84 f6             	test   sil,sil
  403010:	0f 84 f4 fe ff ff    	je     402f0a <format_string_loop+0x10a>
        if (*format == 'h') {
  403016:	40 80 fe 68          	cmp    sil,0x68
  40301a:	0f 84 d8 03 00 00    	je     4033f8 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  403020:	41 80 cb 80          	or     r11b,0x80
  403024:	48 89 c2             	mov    rdx,rax
  403027:	e9 98 fe ff ff       	jmp    402ec4 <format_string_loop+0xc4>
  40302c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  403030:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403034:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403039:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40303d:	40 84 f6             	test   sil,sil
  403040:	0f 84 c4 fe ff ff    	je     402f0a <format_string_loop+0x10a>
        if (*format == 'l') {
  403046:	40 80 fe 6c          	cmp    sil,0x6c
  40304a:	0f 84 d0 03 00 00    	je     403420 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  403050:	41 81 cb 00 02 00 00 	or     r11d,0x200
  403057:	48 89 c2             	mov    rdx,rax
  40305a:	e9 65 fe ff ff       	jmp    402ec4 <format_string_loop+0xc4>
  40305f:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  403060:	89 f2                	mov    edx,esi
  403062:	44 89 d8             	mov    eax,r11d
  403065:	83 e2 df             	and    edx,0xffffffdf
  403068:	80 cc 10             	or     ah,0x10
  40306b:	80 fa 47             	cmp    dl,0x47
  40306e:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  403072:	83 e6 fd             	and    esi,0xfffffffd
  403075:	44 89 d8             	mov    eax,r11d
  403078:	83 c8 20             	or     eax,0x20
  40307b:	40 80 fe 45          	cmp    sil,0x45
  40307f:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403083:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403086:	3d af 00 00 00       	cmp    eax,0xaf
  40308b:	0f 87 9f 03 00 00    	ja     403430 <format_string_loop+0x630>
  403091:	89 c7                	mov    edi,eax
  403093:	83 c0 10             	add    eax,0x10
  403096:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40309a:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  40309d:	41 b8 01 00 00 00    	mov    r8d,0x1
  4030a3:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  4030a7:	44 89 e2             	mov    edx,r12d
  4030aa:	44 89 d9             	mov    ecx,r11d
  4030ad:	44 89 fe             	mov    esi,r15d
  4030b0:	48 89 ef             	mov    rdi,rbp
  4030b3:	e8 c8 fb ff ff       	call   402c80 <print_floating_point>
        format++;
  4030b8:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  4030bd:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4030c1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  4030c6:	e9 33 fe ff ff       	jmp    402efe <format_string_loop+0xfe>
  4030cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  4030d0:	44 89 d8             	mov    eax,r11d
  4030d3:	83 c8 20             	or     eax,0x20
  4030d6:	40 80 fe 46          	cmp    sil,0x46
  4030da:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4030de:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  4030e1:	3d af 00 00 00       	cmp    eax,0xaf
  4030e6:	0f 87 74 04 00 00    	ja     403560 <format_string_loop+0x760>
  4030ec:	89 c7                	mov    edi,eax
  4030ee:	83 c0 10             	add    eax,0x10
  4030f1:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4030f5:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  4030f8:	45 31 c0             	xor    r8d,r8d
  4030fb:	eb a6                	jmp    4030a3 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  4030fd:	41 83 e3 02          	and    r11d,0x2
  403101:	0f 84 b9 05 00 00    	je     4036c0 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403107:	8b 03                	mov    eax,DWORD PTR [rbx]
  403109:	83 f8 2f             	cmp    eax,0x2f
  40310c:	0f 86 a9 06 00 00    	jbe    4037bb <format_string_loop+0x9bb>
  403112:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403116:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40311a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40311e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403121:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  403124:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40312a:	e8 01 e9 ff ff       	call   401a30 <putchar_via_gadget>
          while (l++ < width) {
  40312f:	41 83 fc 01          	cmp    r12d,0x1
  403133:	0f 86 b7 fd ff ff    	jbe    402ef0 <format_string_loop+0xf0>
  403139:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403140:	be 20 00 00 00       	mov    esi,0x20
  403145:	48 89 ef             	mov    rdi,rbp
  403148:	e8 e3 e8 ff ff       	call   401a30 <putchar_via_gadget>
          while (l++ < width) {
  40314d:	44 89 f8             	mov    eax,r15d
  403150:	41 83 c7 01          	add    r15d,0x1
  403154:	41 39 c4             	cmp    r12d,eax
  403157:	75 e7                	jne    403140 <format_string_loop+0x340>
  403159:	e9 92 fd ff ff       	jmp    402ef0 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  40315e:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  403160:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403167:	83 f8 2f             	cmp    eax,0x2f
  40316a:	0f 87 b0 03 00 00    	ja     403520 <format_string_loop+0x720>
  403170:	89 c2                	mov    edx,eax
  403172:	83 c0 08             	add    eax,0x8
  403175:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403179:	89 03                	mov    DWORD PTR [rbx],eax
  40317b:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40317e:	48 85 f6             	test   rsi,rsi
  403181:	0f 84 b1 03 00 00    	je     403538 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  403187:	48 83 ec 08          	sub    rsp,0x8
  40318b:	31 d2                	xor    edx,edx
  40318d:	41 b9 12 00 00 00    	mov    r9d,0x12
  403193:	45 89 f8             	mov    r8d,r15d
  403196:	41 53                	push   r11
  403198:	b9 10 00 00 00       	mov    ecx,0x10
  40319d:	48 89 ef             	mov    rdi,rbp
  4031a0:	e8 db ed ff ff       	call   401f80 <print_integer>
  4031a5:	58                   	pop    rax
  4031a6:	5a                   	pop    rdx
        format++;
  4031a7:	e9 44 fd ff ff       	jmp    402ef0 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4031ac:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  4031af:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4031b1:	41 f6 c3 40          	test   r11b,0x40
  4031b5:	0f 84 f5 02 00 00    	je     4034b0 <format_string_loop+0x6b0>
  4031bb:	83 f8 2f             	cmp    eax,0x2f
  4031be:	0f 87 3c 04 00 00    	ja     403600 <format_string_loop+0x800>
  4031c4:	89 c2                	mov    edx,eax
  4031c6:	83 c0 08             	add    eax,0x8
  4031c9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4031cd:	89 03                	mov    DWORD PTR [rbx],eax
  4031cf:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4031d2:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  4031d4:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  4031d9:	48 83 c2 01          	add    rdx,0x1
  4031dd:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  4031e2:	e9 17 fd ff ff       	jmp    402efe <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  4031e7:	8b 03                	mov    eax,DWORD PTR [rbx]
  4031e9:	83 f8 2f             	cmp    eax,0x2f
  4031ec:	0f 87 ee 02 00 00    	ja     4034e0 <format_string_loop+0x6e0>
  4031f2:	89 c2                	mov    edx,eax
  4031f4:	83 c0 08             	add    eax,0x8
  4031f7:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4031fb:	89 03                	mov    DWORD PTR [rbx],eax
  4031fd:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403200:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403204:	48 85 c0             	test   rax,rax
  403207:	0f 84 ef 02 00 00    	je     4034fc <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40320d:	45 85 ff             	test   r15d,r15d
  403210:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403215:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  403219:	41 0f 45 f7          	cmovne esi,r15d
  40321d:	e8 7e e9 ff ff       	call   401ba0 <strnlen_s_>
            l = (l < precision ? l : precision);
  403222:	44 89 df             	mov    edi,r11d
  403225:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  403228:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  40322a:	41 0f 47 c7          	cmova  eax,r15d
  40322e:	81 e7 00 08 00 00    	and    edi,0x800
  403234:	41 89 fe             	mov    r14d,edi
  403237:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  40323a:	41 83 e3 02          	and    r11d,0x2
  40323e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  403243:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  403247:	0f 84 c3 04 00 00    	je     403710 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40324d:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403251:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403254:	40 84 f6             	test   sil,sil
  403257:	74 52                	je     4032ab <format_string_loop+0x4ab>
  403259:	85 ff                	test   edi,edi
  40325b:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403260:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  403265:	45 85 ff             	test   r15d,r15d
  403268:	75 04                	jne    40326e <format_string_loop+0x46e>
  40326a:	84 c0                	test   al,al
  40326c:	74 3d                	je     4032ab <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40326e:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  403272:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  403278:	49 83 c6 01          	add    r14,0x1
  40327c:	48 89 ef             	mov    rdi,rbp
  40327f:	e8 ac e7 ff ff       	call   401a30 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  403284:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  403288:	40 84 f6             	test   sil,sil
  40328b:	74 12                	je     40329f <format_string_loop+0x49f>
  40328d:	44 89 fa             	mov    edx,r15d
  403290:	44 29 f2             	sub    edx,r14d
  403293:	03 14 24             	add    edx,DWORD PTR [rsp]
  403296:	75 e0                	jne    403278 <format_string_loop+0x478>
  403298:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  40329d:	75 d9                	jne    403278 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  40329f:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  4032a3:	85 c9                	test   ecx,ecx
  4032a5:	0f 84 45 fc ff ff    	je     402ef0 <format_string_loop+0xf0>
            while (l++ < width) {
  4032ab:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  4032af:	44 8d 78 01          	lea    r15d,[rax+0x1]
  4032b3:	41 39 c4             	cmp    r12d,eax
  4032b6:	0f 86 34 fc ff ff    	jbe    402ef0 <format_string_loop+0xf0>
  4032bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  4032c0:	be 20 00 00 00       	mov    esi,0x20
  4032c5:	48 89 ef             	mov    rdi,rbp
  4032c8:	e8 63 e7 ff ff       	call   401a30 <putchar_via_gadget>
            while (l++ < width) {
  4032cd:	44 89 f8             	mov    eax,r15d
  4032d0:	41 83 c7 01          	add    r15d,0x1
  4032d4:	41 39 c4             	cmp    r12d,eax
  4032d7:	75 e7                	jne    4032c0 <format_string_loop+0x4c0>
  4032d9:	e9 12 fc ff ff       	jmp    402ef0 <format_string_loop+0xf0>
  4032de:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  4032e0:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  4032e4:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  4032eb:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  4032f0:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4032f4:	40 84 f6             	test   sil,sil
  4032f7:	0f 84 0d fc ff ff    	je     402f0a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  4032fd:	40 0f be fe          	movsx  edi,sil
  403301:	e8 da e8 ff ff       	call   401be0 <is_digit_>
  403306:	84 c0                	test   al,al
  403308:	0f 85 82 00 00 00    	jne    403390 <format_string_loop+0x590>
      else if (*format == '*') {
  40330e:	40 80 fe 2a          	cmp    sil,0x2a
  403312:	0f 84 98 00 00 00    	je     4033b0 <format_string_loop+0x5b0>
  403318:	48 89 ca             	mov    rdx,rcx
  40331b:	e9 6e fb ff ff       	jmp    402e8e <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  403320:	4c 89 cf             	mov    rdi,r9
  403323:	e8 c8 e8 ff ff       	call   401bf0 <atou_>
    if (*format == '.') {
  403328:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  40332d:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  403330:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403333:	e9 49 fb ff ff       	jmp    402e81 <format_string_loop+0x81>
  403338:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40333f:	00 
      const int w = va_arg(args, int);
  403340:	8b 03                	mov    eax,DWORD PTR [rbx]
  403342:	83 f8 2f             	cmp    eax,0x2f
  403345:	77 39                	ja     403380 <format_string_loop+0x580>
  403347:	89 c1                	mov    ecx,eax
  403349:	83 c0 08             	add    eax,0x8
  40334c:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403350:	89 03                	mov    DWORD PTR [rbx],eax
  403352:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  403355:	45 85 e4             	test   r12d,r12d
  403358:	79 07                	jns    403361 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  40335a:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  40335e:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  403361:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403365:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40336a:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40336e:	40 84 f6             	test   sil,sil
  403371:	0f 84 93 fb ff ff    	je     402f0a <format_string_loop+0x10a>
  403377:	48 89 c2             	mov    rdx,rax
  40337a:	e9 02 fb ff ff       	jmp    402e81 <format_string_loop+0x81>
  40337f:	90                   	nop
      const int w = va_arg(args, int);
  403380:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  403384:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403388:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40338c:	eb c4                	jmp    403352 <format_string_loop+0x552>
  40338e:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  403390:	4c 89 cf             	mov    rdi,r9
  403393:	e8 58 e8 ff ff       	call   401bf0 <atou_>
    switch (*format) {
  403398:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  40339d:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  4033a0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4033a3:	e9 e6 fa ff ff       	jmp    402e8e <format_string_loop+0x8e>
  4033a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4033af:	00 
        const int precision_ = va_arg(args, int);
  4033b0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4033b2:	83 f8 2f             	cmp    eax,0x2f
  4033b5:	0f 87 ed 01 00 00    	ja     4035a8 <format_string_loop+0x7a8>
  4033bb:	89 c1                	mov    ecx,eax
  4033bd:	83 c0 08             	add    eax,0x8
  4033c0:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4033c4:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  4033c6:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  4033c9:	31 c0                	xor    eax,eax
  4033cb:	45 85 d2             	test   r10d,r10d
  4033ce:	41 0f 49 c2          	cmovns eax,r10d
  4033d2:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  4033d5:	48 8d 42 02          	lea    rax,[rdx+0x2]
  4033d9:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4033de:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  4033e2:	40 84 f6             	test   sil,sil
  4033e5:	0f 84 1f fb ff ff    	je     402f0a <format_string_loop+0x10a>
  4033eb:	48 89 c2             	mov    rdx,rax
  4033ee:	e9 9b fa ff ff       	jmp    402e8e <format_string_loop+0x8e>
  4033f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  4033f8:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  4033fc:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403400:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403405:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403409:	40 84 f6             	test   sil,sil
  40340c:	0f 85 af fa ff ff    	jne    402ec1 <format_string_loop+0xc1>
  403412:	e9 f3 fa ff ff       	jmp    402f0a <format_string_loop+0x10a>
  403417:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40341e:	00 00 
          flags |= FLAGS_LONG_LONG;
  403420:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  403427:	eb d3                	jmp    4033fc <format_string_loop+0x5fc>
  403429:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403430:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403434:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403438:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40343c:	e9 5c fc ff ff       	jmp    40309d <format_string_loop+0x29d>
  403441:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  403448:	44 89 de             	mov    esi,r11d
  40344b:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  40344e:	85 d2                	test   edx,edx
  403450:	0f 85 c2 01 00 00    	jne    403618 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  403456:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  40345d:	0f 85 b5 01 00 00    	jne    403618 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  403463:	41 f6 c3 40          	test   r11b,0x40
  403467:	0f 84 6f 03 00 00    	je     4037dc <format_string_loop+0x9dc>
  40346d:	83 f8 2f             	cmp    eax,0x2f
  403470:	0f 87 d7 03 00 00    	ja     40384d <format_string_loop+0xa4d>
  403476:	89 c2                	mov    edx,eax
  403478:	83 c0 08             	add    eax,0x8
  40347b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40347f:	89 03                	mov    DWORD PTR [rbx],eax
  403481:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  403485:	48 83 ec 08          	sub    rsp,0x8
  403489:	31 d2                	xor    edx,edx
  40348b:	48 89 ef             	mov    rdi,rbp
  40348e:	45 89 e1             	mov    r9d,r12d
  403491:	56                   	push   rsi
  403492:	45 89 f8             	mov    r8d,r15d
  403495:	4c 89 de             	mov    rsi,r11
  403498:	e8 e3 ea ff ff       	call   401f80 <print_integer>
  while (*format)
  40349d:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4034a2:	5e                   	pop    rsi
  4034a3:	5f                   	pop    rdi
  4034a4:	e9 55 fa ff ff       	jmp    402efe <format_string_loop+0xfe>
  4034a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  4034b0:	41 f6 c3 80          	test   r11b,0x80
  4034b4:	0f 84 06 01 00 00    	je     4035c0 <format_string_loop+0x7c0>
  4034ba:	83 f8 2f             	cmp    eax,0x2f
  4034bd:	0f 87 08 03 00 00    	ja     4037cb <format_string_loop+0x9cb>
  4034c3:	89 c6                	mov    esi,eax
  4034c5:	83 c0 08             	add    eax,0x8
  4034c8:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4034cc:	89 03                	mov    DWORD PTR [rbx],eax
  4034ce:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4034d1:	66 89 08             	mov    WORD PTR [rax],cx
  4034d4:	e9 00 fd ff ff       	jmp    4031d9 <format_string_loop+0x3d9>
  4034d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  4034e0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4034e4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4034e8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4034ec:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4034ef:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  4034f3:	48 85 c0             	test   rax,rax
  4034f6:	0f 85 11 fd ff ff    	jne    40320d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  4034fc:	45 89 d8             	mov    r8d,r11d
  4034ff:	44 89 e1             	mov    ecx,r12d
  403502:	ba 06 00 00 00       	mov    edx,0x6
  403507:	48 89 ef             	mov    rdi,rbp
  40350a:	48 8d 35 35 1e 00 00 	lea    rsi,[rip+0x1e35]        # 405346 <memcpy+0xde6>
  403511:	e8 1a e7 ff ff       	call   401c30 <out_rev_>
  403516:	e9 d5 f9 ff ff       	jmp    402ef0 <format_string_loop+0xf0>
  40351b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403520:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403524:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403528:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40352c:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40352f:	48 85 f6             	test   rsi,rsi
  403532:	0f 85 4f fc ff ff    	jne    403187 <format_string_loop+0x387>
  403538:	45 89 d8             	mov    r8d,r11d
  40353b:	b9 12 00 00 00       	mov    ecx,0x12
  403540:	ba 05 00 00 00       	mov    edx,0x5
  403545:	48 89 ef             	mov    rdi,rbp
  403548:	48 8d 35 fe 1d 00 00 	lea    rsi,[rip+0x1dfe]        # 40534d <memcpy+0xded>
  40354f:	e8 dc e6 ff ff       	call   401c30 <out_rev_>
  403554:	e9 97 f9 ff ff       	jmp    402ef0 <format_string_loop+0xf0>
  403559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  403560:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403564:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403568:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40356c:	e9 87 fb ff ff       	jmp    4030f8 <format_string_loop+0x2f8>
  403571:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  403578:	44 89 d8             	mov    eax,r11d
  40357b:	41 83 cb 20          	or     r11d,0x20
  40357f:	40 80 fe 58          	cmp    sil,0x58
  403583:	b9 10 00 00 00       	mov    ecx,0x10
  403588:	44 0f 45 d8          	cmovne r11d,eax
  40358c:	e9 cf f9 ff ff       	jmp    402f60 <format_string_loop+0x160>
  403591:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  403598:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  40359f:	e9 90 f9 ff ff       	jmp    402f34 <format_string_loop+0x134>
  4035a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  4035a8:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4035ac:	48 8d 41 08          	lea    rax,[rcx+0x8]
  4035b0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4035b4:	e9 0d fe ff ff       	jmp    4033c6 <format_string_loop+0x5c6>
  4035b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  4035c0:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4035c7:	0f 85 d3 00 00 00    	jne    4036a0 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4035cd:	41 81 e3 00 04 00 00 	and    r11d,0x400
  4035d4:	0f 85 c6 00 00 00    	jne    4036a0 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  4035da:	83 f8 2f             	cmp    eax,0x2f
  4035dd:	0f 87 a4 02 00 00    	ja     403887 <format_string_loop+0xa87>
  4035e3:	89 c6                	mov    esi,eax
  4035e5:	83 c0 08             	add    eax,0x8
  4035e8:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4035ec:	89 03                	mov    DWORD PTR [rbx],eax
  4035ee:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4035f1:	89 08                	mov    DWORD PTR [rax],ecx
  4035f3:	e9 e1 fb ff ff       	jmp    4031d9 <format_string_loop+0x3d9>
  4035f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4035ff:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403600:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403604:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403608:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40360c:	e9 be fb ff ff       	jmp    4031cf <format_string_loop+0x3cf>
  403611:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403618:	83 f8 2f             	cmp    eax,0x2f
  40361b:	0f 87 78 01 00 00    	ja     403799 <format_string_loop+0x999>
  403621:	89 c7                	mov    edi,eax
  403623:	83 c0 08             	add    eax,0x8
  403626:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40362a:	89 03                	mov    DWORD PTR [rbx],eax
  40362c:	48 83 ec 08          	sub    rsp,0x8
  403630:	45 89 e1             	mov    r9d,r12d
  403633:	45 89 f8             	mov    r8d,r15d
  403636:	31 d2                	xor    edx,edx
  403638:	56                   	push   rsi
  403639:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  40363c:	48 89 ef             	mov    rdi,rbp
  40363f:	e8 3c e9 ff ff       	call   401f80 <print_integer>
  while (*format)
  403644:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403649:	41 58                	pop    r8
  40364b:	41 59                	pop    r9
  40364d:	e9 ac f8 ff ff       	jmp    402efe <format_string_loop+0xfe>
  403652:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403658:	83 f8 2f             	cmp    eax,0x2f
  40365b:	0f 87 27 01 00 00    	ja     403788 <format_string_loop+0x988>
  403661:	89 c2                	mov    edx,eax
  403663:	83 c0 08             	add    eax,0x8
  403666:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40366a:	89 03                	mov    DWORD PTR [rbx],eax
  40366c:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  40366f:	45 89 e1             	mov    r9d,r12d
  403672:	45 89 f8             	mov    r8d,r15d
  403675:	48 89 ef             	mov    rdi,rbp
  403678:	48 89 d6             	mov    rsi,rdx
  40367b:	48 f7 de             	neg    rsi
  40367e:	48 0f 48 f2          	cmovs  rsi,rdx
  403682:	48 83 ec 08          	sub    rsp,0x8
  403686:	48 c1 ea 3f          	shr    rdx,0x3f
  40368a:	41 53                	push   r11
  40368c:	e8 ef e8 ff ff       	call   401f80 <print_integer>
  while (*format)
  403691:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403696:	41 5c                	pop    r12
  403698:	41 5e                	pop    r14
  40369a:	e9 5f f8 ff ff       	jmp    402efe <format_string_loop+0xfe>
  40369f:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4036a0:	83 f8 2f             	cmp    eax,0x2f
  4036a3:	0f 87 7b 01 00 00    	ja     403824 <format_string_loop+0xa24>
  4036a9:	89 c6                	mov    esi,eax
  4036ab:	83 c0 08             	add    eax,0x8
  4036ae:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4036b2:	89 03                	mov    DWORD PTR [rbx],eax
  4036b4:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4036b7:	48 89 08             	mov    QWORD PTR [rax],rcx
  4036ba:	e9 1a fb ff ff       	jmp    4031d9 <format_string_loop+0x3d9>
  4036bf:	90                   	nop
          while (l++ < width) {
  4036c0:	41 83 fc 01          	cmp    r12d,0x1
  4036c4:	76 23                	jbe    4036e9 <format_string_loop+0x8e9>
  4036c6:	41 bf 02 00 00 00    	mov    r15d,0x2
  4036cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  4036d0:	be 20 00 00 00       	mov    esi,0x20
  4036d5:	48 89 ef             	mov    rdi,rbp
  4036d8:	e8 53 e3 ff ff       	call   401a30 <putchar_via_gadget>
          while (l++ < width) {
  4036dd:	44 89 f8             	mov    eax,r15d
  4036e0:	41 83 c7 01          	add    r15d,0x1
  4036e4:	41 39 c4             	cmp    r12d,eax
  4036e7:	75 e7                	jne    4036d0 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4036e9:	8b 03                	mov    eax,DWORD PTR [rbx]
  4036eb:	83 f8 2f             	cmp    eax,0x2f
  4036ee:	0f 87 b6 00 00 00    	ja     4037aa <format_string_loop+0x9aa>
  4036f4:	89 c2                	mov    edx,eax
  4036f6:	83 c0 08             	add    eax,0x8
  4036f9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4036fd:	89 03                	mov    DWORD PTR [rbx],eax
  4036ff:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403702:	48 89 ef             	mov    rdi,rbp
  403705:	e8 26 e3 ff ff       	call   401a30 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  40370a:	e9 e1 f7 ff ff       	jmp    402ef0 <format_string_loop+0xf0>
  40370f:	90                   	nop
            while (l++ < width) {
  403710:	89 c1                	mov    ecx,eax
  403712:	8d 40 01             	lea    eax,[rax+0x1]
  403715:	41 39 cc             	cmp    r12d,ecx
  403718:	0f 86 bc 01 00 00    	jbe    4038da <format_string_loop+0xada>
  40371e:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  403723:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  403727:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40372e:	00 00 
              putchar_via_gadget(output, ' ');
  403730:	be 20 00 00 00       	mov    esi,0x20
  403735:	48 89 ef             	mov    rdi,rbp
  403738:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40373c:	e8 ef e2 ff ff       	call   401a30 <putchar_via_gadget>
            while (l++ < width) {
  403741:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  403745:	89 c2                	mov    edx,eax
  403747:	83 c0 01             	add    eax,0x1
  40374a:	41 39 d4             	cmp    r12d,edx
  40374d:	75 e1                	jne    403730 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40374f:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403753:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403756:	40 84 f6             	test   sil,sil
  403759:	0f 84 91 f7 ff ff    	je     402ef0 <format_string_loop+0xf0>
  40375f:	45 85 f6             	test   r14d,r14d
  403762:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403767:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  40376c:	45 85 ff             	test   r15d,r15d
  40376f:	0f 85 f9 fa ff ff    	jne    40326e <format_string_loop+0x46e>
  403775:	84 c0                	test   al,al
  403777:	0f 85 f1 fa ff ff    	jne    40326e <format_string_loop+0x46e>
  40377d:	e9 6e f7 ff ff       	jmp    402ef0 <format_string_loop+0xf0>
  403782:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403788:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40378c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403790:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403794:	e9 d3 fe ff ff       	jmp    40366c <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403799:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  40379d:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4037a1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037a5:	e9 82 fe ff ff       	jmp    40362c <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4037aa:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037ae:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037b2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037b6:	e9 44 ff ff ff       	jmp    4036ff <format_string_loop+0x8ff>
  4037bb:	89 c2                	mov    edx,eax
  4037bd:	83 c0 08             	add    eax,0x8
  4037c0:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037c4:	89 03                	mov    DWORD PTR [rbx],eax
  4037c6:	e9 53 f9 ff ff       	jmp    40311e <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  4037cb:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4037cf:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4037d3:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037d7:	e9 f2 fc ff ff       	jmp    4034ce <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4037dc:	41 81 e3 80 00 00 00 	and    r11d,0x80
  4037e3:	74 79                	je     40385e <format_string_loop+0xa5e>
  4037e5:	83 f8 2f             	cmp    eax,0x2f
  4037e8:	0f 87 db 00 00 00    	ja     4038c9 <format_string_loop+0xac9>
  4037ee:	89 c2                	mov    edx,eax
  4037f0:	83 c0 08             	add    eax,0x8
  4037f3:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037f7:	89 03                	mov    DWORD PTR [rbx],eax
  4037f9:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  4037fd:	e9 83 fc ff ff       	jmp    403485 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403802:	41 f6 c3 80          	test   r11b,0x80
  403806:	74 2d                	je     403835 <format_string_loop+0xa35>
  403808:	83 f8 2f             	cmp    eax,0x2f
  40380b:	0f 87 a7 00 00 00    	ja     4038b8 <format_string_loop+0xab8>
  403811:	89 c2                	mov    edx,eax
  403813:	83 c0 08             	add    eax,0x8
  403816:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40381a:	89 03                	mov    DWORD PTR [rbx],eax
  40381c:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  40381f:	e9 a4 f7 ff ff       	jmp    402fc8 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403824:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403828:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40382c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403830:	e9 7f fe ff ff       	jmp    4036b4 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403835:	83 f8 2f             	cmp    eax,0x2f
  403838:	76 6c                	jbe    4038a6 <format_string_loop+0xaa6>
  40383a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40383e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403842:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403846:	8b 02                	mov    eax,DWORD PTR [rdx]
  403848:	e9 7b f7 ff ff       	jmp    402fc8 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  40384d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403851:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403855:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403859:	e9 23 fc ff ff       	jmp    403481 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40385e:	83 f8 2f             	cmp    eax,0x2f
  403861:	77 35                	ja     403898 <format_string_loop+0xa98>
  403863:	89 c2                	mov    edx,eax
  403865:	83 c0 08             	add    eax,0x8
  403868:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40386c:	89 03                	mov    DWORD PTR [rbx],eax
  40386e:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  403871:	e9 0f fc ff ff       	jmp    403485 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403876:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40387a:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40387e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403882:	e9 3e f7 ff ff       	jmp    402fc5 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  403887:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40388b:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40388f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403893:	e9 56 fd ff ff       	jmp    4035ee <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403898:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40389c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4038a0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4038a4:	eb c8                	jmp    40386e <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4038a6:	89 c2                	mov    edx,eax
  4038a8:	83 c0 08             	add    eax,0x8
  4038ab:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4038af:	89 03                	mov    DWORD PTR [rbx],eax
  4038b1:	8b 02                	mov    eax,DWORD PTR [rdx]
  4038b3:	e9 10 f7 ff ff       	jmp    402fc8 <format_string_loop+0x1c8>
  4038b8:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4038bc:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4038c0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4038c4:	e9 53 ff ff ff       	jmp    40381c <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4038c9:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4038cd:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4038d1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4038d5:	e9 1f ff ff ff       	jmp    4037f9 <format_string_loop+0x9f9>
            while (l++ < width) {
  4038da:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  4038de:	e9 6c fe ff ff       	jmp    40374f <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

00000000004038f0 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  4038f0:	53                   	push   rbx
  4038f1:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  4038f4:	e8 07 f5 ff ff       	call   402e00 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  4038f9:	48 89 df             	mov    rdi,rbx
  4038fc:	e8 6f e1 ff ff       	call   401a70 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  403901:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  403904:	5b                   	pop    rbx
  403905:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000403910 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  403910:	f3 0f 1e fa          	endbr64 
  403914:	55                   	push   rbp
  403915:	49 89 f3             	mov    r11,rsi
  403918:	49 89 fa             	mov    r10,rdi
  40391b:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  40391f:	48 89 e5             	mov    rbp,rsp
  403922:	48 89 ef             	mov    rdi,rbp
  403925:	e8 56 e2 ff ff       	call   401b80 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  40392a:	48 89 ef             	mov    rdi,rbp
  40392d:	4c 89 da             	mov    rdx,r11
  403930:	4c 89 d6             	mov    rsi,r10
  403933:	e8 b8 ff ff ff       	call   4038f0 <vsnprintf_impl>
}
  403938:	48 83 c4 20          	add    rsp,0x20
  40393c:	5d                   	pop    rbp
  40393d:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403940 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403940:	f3 0f 1e fa          	endbr64 
  403944:	55                   	push   rbp
  403945:	49 89 d1             	mov    r9,rdx
  403948:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  40394b:	48 89 f2             	mov    rdx,rsi
  40394e:	48 89 fe             	mov    rsi,rdi
{
  403951:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  403955:	48 89 e5             	mov    rbp,rsp
  403958:	48 89 ef             	mov    rdi,rbp
  40395b:	e8 80 e1 ff ff       	call   401ae0 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403960:	48 89 ef             	mov    rdi,rbp
  403963:	4c 89 d2             	mov    rdx,r10
  403966:	4c 89 ce             	mov    rsi,r9
  403969:	e8 82 ff ff ff       	call   4038f0 <vsnprintf_impl>
}
  40396e:	48 83 c4 20          	add    rsp,0x20
  403972:	5d                   	pop    rbp
  403973:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000403980 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  403980:	f3 0f 1e fa          	endbr64 
  403984:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  403987:	48 89 f2             	mov    rdx,rsi
  40398a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40398f:	e9 ac ff ff ff       	jmp    403940 <vsnprintf>

Disassembly of section .text.vfctprintf:

00000000004039a0 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  4039a0:	f3 0f 1e fa          	endbr64 
  4039a4:	55                   	push   rbp
  4039a5:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  4039a8:	48 89 f2             	mov    rdx,rsi
  4039ab:	48 89 fe             	mov    rsi,rdi
{
  4039ae:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  4039b2:	48 89 e5             	mov    rbp,rsp
  4039b5:	48 89 ef             	mov    rdi,rbp
  4039b8:	e8 83 e1 ff ff       	call   401b40 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  4039bd:	48 89 ef             	mov    rdi,rbp
  4039c0:	48 89 ca             	mov    rdx,rcx
  4039c3:	4c 89 ce             	mov    rsi,r9
  4039c6:	e8 25 ff ff ff       	call   4038f0 <vsnprintf_impl>
}
  4039cb:	48 83 c4 20          	add    rsp,0x20
  4039cf:	5d                   	pop    rbp
  4039d0:	c3                   	ret    

Disassembly of section .text.printf:

00000000004039e0 <printf>:

int printf_(const char* format, ...)
{
  4039e0:	f3 0f 1e fa          	endbr64 
  4039e4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4039eb:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  4039f0:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4039f5:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4039fa:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4039ff:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403a04:	84 c0                	test   al,al
  403a06:	74 37                	je     403a3f <printf+0x5f>
  403a08:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403a0d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403a12:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403a17:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403a1e:	00 
  403a1f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403a26:	00 
  403a27:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403a2e:	00 
  403a2f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403a36:	00 
  403a37:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403a3e:	00 
  va_list args;
  va_start(args, format);
  403a3f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403a46:	00 
  const int ret = vprintf_(format, args);
  403a47:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  403a4c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403a53:	00 
  403a54:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403a59:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403a5e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403a65:	00 
  403a66:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  403a6b:	e8 a0 fe ff ff       	call   403910 <vprintf>
  va_end(args);
  return ret;
}
  403a70:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403a77:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000403a80 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  403a80:	f3 0f 1e fa          	endbr64 
  403a84:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403a8b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403a90:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403a95:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403a9a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403a9f:	84 c0                	test   al,al
  403aa1:	74 37                	je     403ada <sprintf+0x5a>
  403aa3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403aa8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403aad:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403ab2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403ab9:	00 
  403aba:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403ac1:	00 
  403ac2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403ac9:	00 
  403aca:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403ad1:	00 
  403ad2:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403ad9:	00 
  va_list args;
  va_start(args, format);
  403ada:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403ae1:	00 
  const int ret = vsprintf_(s, format, args);
  403ae2:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403ae7:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403aee:	00 
  403aef:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403af4:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403af9:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403b00:	00 
  403b01:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403b06:	e8 75 fe ff ff       	call   403980 <vsprintf>
  va_end(args);
  return ret;
}
  403b0b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403b12:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403b20 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403b20:	f3 0f 1e fa          	endbr64 
  403b24:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403b2b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403b30:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403b35:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403b3a:	84 c0                	test   al,al
  403b3c:	74 37                	je     403b75 <snprintf+0x55>
  403b3e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403b43:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403b48:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403b4d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403b54:	00 
  403b55:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403b5c:	00 
  403b5d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403b64:	00 
  403b65:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403b6c:	00 
  403b6d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403b74:	00 
  va_list args;
  va_start(args, format);
  403b75:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403b7c:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403b7d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403b82:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403b89:	00 
  403b8a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403b8f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403b94:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403b9b:	00 
  403b9c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403ba1:	e8 9a fd ff ff       	call   403940 <vsnprintf>
  va_end(args);
  return ret;
}
  403ba6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403bad:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403bb0 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403bb0:	f3 0f 1e fa          	endbr64 
  403bb4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403bbb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403bc0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403bc5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403bca:	84 c0                	test   al,al
  403bcc:	74 37                	je     403c05 <fctprintf+0x55>
  403bce:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403bd3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403bd8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403bdd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403be4:	00 
  403be5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403bec:	00 
  403bed:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403bf4:	00 
  403bf5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403bfc:	00 
  403bfd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403c04:	00 
  va_list args;
  va_start(args, format);
  403c05:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403c0c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403c0d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403c12:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403c19:	00 
  403c1a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403c1f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403c24:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403c2b:	00 
  403c2c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403c31:	e8 6a fd ff ff       	call   4039a0 <vfctprintf>
  va_end(args);
  return ret;
}
  403c36:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403c3d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403c40 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403c40:	f3 0f 1e fa          	endbr64 
  403c44:	41 54                	push   r12
  403c46:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403c49:	40 0f be ff          	movsx  edi,dil
  403c4d:	e8 0e 00 00 00       	call   403c60 <putchar_>
	return c;
}
  403c52:	44 89 e0             	mov    eax,r12d
  403c55:	41 5c                	pop    r12
  403c57:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403c60 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403c60:	f3 0f 1e fa          	endbr64 
  403c64:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403c68:	ba 01 00 00 00       	mov    edx,0x1
  403c6d:	31 c0                	xor    eax,eax
void putchar_(char c){
  403c6f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403c74:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403c79:	bf 01 00 00 00       	mov    edi,0x1
  403c7e:	e8 cd d3 ff ff       	call   401050 <write>
  403c83:	48 83 c4 18          	add    rsp,0x18
  403c87:	c3                   	ret    

Disassembly of section .text.max:

0000000000403c90 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403c90:	48 39 f7             	cmp    rdi,rsi
  403c93:	48 89 f0             	mov    rax,rsi
  403c96:	48 0f 43 c7          	cmovae rax,rdi
}
  403c9a:	c3                   	ret    

Disassembly of section .text.align:

0000000000403ca0 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403ca0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403ca5:	48 f7 de             	neg    rsi
  403ca8:	48 21 f0             	and    rax,rsi
}
  403cab:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403cb0 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403cb0:	31 c0                	xor    eax,eax
  403cb2:	83 ff 01             	cmp    edi,0x1
  403cb5:	76 4e                	jbe    403d05 <granules_to_chunk_kind+0x55>
  403cb7:	b8 01 00 00 00       	mov    eax,0x1
  403cbc:	83 ff 02             	cmp    edi,0x2
  403cbf:	74 44                	je     403d05 <granules_to_chunk_kind+0x55>
  403cc1:	83 ff 03             	cmp    edi,0x3
  403cc4:	74 5a                	je     403d20 <granules_to_chunk_kind+0x70>
  403cc6:	83 ff 04             	cmp    edi,0x4
  403cc9:	74 45                	je     403d10 <granules_to_chunk_kind+0x60>
  403ccb:	83 ff 05             	cmp    edi,0x5
  403cce:	74 60                	je     403d30 <granules_to_chunk_kind+0x80>
  403cd0:	83 ff 06             	cmp    edi,0x6
  403cd3:	74 2b                	je     403d00 <granules_to_chunk_kind+0x50>
  403cd5:	b8 06 00 00 00       	mov    eax,0x6
  403cda:	83 ff 08             	cmp    edi,0x8
  403cdd:	76 26                	jbe    403d05 <granules_to_chunk_kind+0x55>
  403cdf:	b8 07 00 00 00       	mov    eax,0x7
  403ce4:	83 ff 0a             	cmp    edi,0xa
  403ce7:	76 1c                	jbe    403d05 <granules_to_chunk_kind+0x55>
  403ce9:	b8 08 00 00 00       	mov    eax,0x8
  403cee:	83 ff 10             	cmp    edi,0x10
  403cf1:	76 12                	jbe    403d05 <granules_to_chunk_kind+0x55>
  403cf3:	83 ff 21             	cmp    edi,0x21
  403cf6:	19 c0                	sbb    eax,eax
  403cf8:	24 0a                	and    al,0xa
  403cfa:	05 ff 00 00 00       	add    eax,0xff
  403cff:	c3                   	ret    
  403d00:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403d05:	c3                   	ret    
  403d06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403d0d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403d10:	b8 03 00 00 00       	mov    eax,0x3
  403d15:	c3                   	ret    
  403d16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403d1d:	00 00 00 
  403d20:	b8 02 00 00 00       	mov    eax,0x2
  403d25:	c3                   	ret    
  403d26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403d2d:	00 00 00 
  403d30:	b8 04 00 00 00       	mov    eax,0x4
  403d35:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403d40 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403d40:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403d45:	83 ff 09             	cmp    edi,0x9
  403d48:	77 0c                	ja     403d56 <chunk_kind_to_granules+0x16>
  403d4a:	89 ff                	mov    edi,edi
  403d4c:	48 8d 05 ed 18 00 00 	lea    rax,[rip+0x18ed]        # 405640 <CSWTCH.34>
  403d53:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403d56:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403d60 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403d60:	48 89 f8             	mov    rax,rdi
  403d63:	66 31 c0             	xor    ax,ax
}
  403d66:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403d70 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403d70:	89 f8                	mov    eax,edi
  403d72:	0f b6 c4             	movzx  eax,ah
}
  403d75:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403d80 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403d80:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403d84:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403d90 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403d90:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403d94:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403da0 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403da0:	89 f6                	mov    esi,esi
  403da2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403da5:	48 c1 e6 08          	shl    rsi,0x8
  403da9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403dad:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403db0 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403db0:	48 8b 0d 11 1b 00 00 	mov    rcx,QWORD PTR [rip+0x1b11]        # 4058c8 <large_objects>
  403db7:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403dbe:	00 
  403dbf:	76 07                	jbe    403dc8 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403dc1:	c3                   	ret    
  403dc2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403dc8:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403dcb:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403dd0:	e8 9b ff ff ff       	call   403d70 <get_chunk_index>
  403dd5:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403dd7:	e8 84 ff ff ff       	call   403d60 <get_page>
  403ddc:	48 89 c7             	mov    rdi,rax
  403ddf:	e8 bc ff ff ff       	call   403da0 <allocate_chunk>
		large_objects = large_objects->next;
  403de4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403de7:	48 89 15 da 1a 00 00 	mov    QWORD PTR [rip+0x1ada],rdx        # 4058c8 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403dee:	48 8b 15 33 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b33]        # 405928 <small_object_freelists+0x48>
  403df5:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403df8:	48 89 05 29 1b 00 00 	mov    QWORD PTR [rip+0x1b29],rax        # 405928 <small_object_freelists+0x48>
}
  403dff:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403e00 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403e00:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403e04:	48 c1 e8 03          	shr    rax,0x3
}
  403e08:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403e09 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403e09:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403e10 <maybe_merge_free_large_object>:
{
  403e10:	53                   	push   rbx
	struct large_object* obj = *prev;
  403e11:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403e14:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403e17:	48 8d 1d aa 1a 00 00 	lea    rbx,[rip+0x1aaa]        # 4058c8 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403e1e:	4c 89 df             	mov    rdi,r11
  403e21:	e8 5a ff ff ff       	call   403d80 <get_large_object_payload>
  403e26:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403e2a:	49 89 c2             	mov    r10,rax
  403e2d:	0f 1f 00             	nop    DWORD PTR [rax]
  403e30:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403e34:	be 00 01 00 00       	mov    esi,0x100
  403e39:	48 89 d7             	mov    rdi,rdx
  403e3c:	e8 5f fe ff ff       	call   403ca0 <align>
  403e41:	48 39 c2             	cmp    rdx,rax
  403e44:	0f 85 bf ff ff ff    	jne    403e09 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403e4a:	e8 21 ff ff ff       	call   403d70 <get_chunk_index>
  403e4f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403e51:	85 c9                	test   ecx,ecx
  403e53:	74 53                	je     403ea8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403e55:	e8 06 ff ff ff       	call   403d60 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403e5a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403e5e:	75 48                	jne    403ea8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403e60:	48 8b 05 61 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a61]        # 4058c8 <large_objects>
			ASSERT(walk);
  403e67:	48 85 c0             	test   rax,rax
  403e6a:	0f 84 99 ff ff ff    	je     403e09 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403e70:	48 39 c2             	cmp    rdx,rax
  403e73:	74 3b                	je     403eb0 <maybe_merge_free_large_object+0xa0>
  403e75:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403e78:	48 89 c1             	mov    rcx,rax
  403e7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  403e7e:	48 85 c0             	test   rax,rax
  403e81:	74 32                	je     403eb5 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  403e83:	48 39 c2             	cmp    rdx,rax
  403e86:	75 f0                	jne    403e78 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403e88:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  403e8c:	4c 39 c8             	cmp    rax,r9
  403e8f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403e93:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  403e98:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403e9b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  403e9f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  403ea2:	eb 8c                	jmp    403e30 <maybe_merge_free_large_object+0x20>
  403ea4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  403ea8:	4c 89 c8             	mov    rax,r9
  403eab:	5b                   	pop    rbx
  403eac:	c3                   	ret    
  403ead:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403eb0:	48 89 d9             	mov    rcx,rbx
  403eb3:	eb d3                	jmp    403e88 <maybe_merge_free_large_object+0x78>
  403eb5:	e9 4f ff ff ff       	jmp    403e09 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000403ec0 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  403ec0:	8b 05 f6 19 00 00    	mov    eax,DWORD PTR [rip+0x19f6]        # 4058bc <pending_large_object_compact>
  403ec6:	85 c0                	test   eax,eax
  403ec8:	74 2c                	je     403ef6 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  403eca:	48 83 3d f6 19 00 00 	cmp    QWORD PTR [rip+0x19f6],0x0        # 4058c8 <large_objects>
  403ed1:	00 
		pending_large_object_compact = 0;
  403ed2:	c7 05 e0 19 00 00 00 	mov    DWORD PTR [rip+0x19e0],0x0        # 4058bc <pending_large_object_compact>
  403ed9:	00 00 00 
		while(*prev)
  403edc:	74 18                	je     403ef6 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  403ede:	48 8d 3d e3 19 00 00 	lea    rdi,[rip+0x19e3]        # 4058c8 <large_objects>
  403ee5:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403ee8:	e8 23 ff ff ff       	call   403e10 <maybe_merge_free_large_object>
  403eed:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403ef0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403ef4:	75 f2                	jne    403ee8 <maybe_compact_free_large_objects+0x28>
}
  403ef6:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403ef7 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403ef7:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403f00 <get_small_object_freelist>:
  403f00:	83 ff 09             	cmp    edi,0x9
  403f03:	0f 87 ee ff ff ff    	ja     403ef7 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403f09:	89 ff                	mov    edi,edi
  403f0b:	48 8d 05 ce 19 00 00 	lea    rax,[rip+0x19ce]        # 4058e0 <small_object_freelists>
  403f12:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403f16:	c3                   	ret    

Disassembly of section .text.free:

0000000000403f20 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  403f20:	f3 0f 1e fa          	endbr64 
  403f24:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  403f27:	48 85 ff             	test   rdi,rdi
  403f2a:	74 2a                	je     403f56 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  403f2c:	e8 2f fe ff ff       	call   403d60 <get_page>
  403f31:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  403f34:	e8 37 fe ff ff       	call   403d70 <get_chunk_index>
  403f39:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  403f3b:	89 c0                	mov    eax,eax
  403f3d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  403f42:	40 80 ff ff          	cmp    dil,0xff
  403f46:	74 18                	je     403f60 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  403f48:	e8 b3 ff ff ff       	call   403f00 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  403f4d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403f50:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  403f53:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  403f56:	c3                   	ret    
  403f57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  403f5e:	00 00 
		struct large_object* obj = get_large_object(ptr);
  403f60:	4c 89 c7             	mov    rdi,r8
  403f63:	e8 28 fe ff ff       	call   403d90 <get_large_object>
		obj->next = large_objects;
  403f68:	48 8b 15 59 19 00 00 	mov    rdx,QWORD PTR [rip+0x1959]        # 4058c8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403f6f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  403f72:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403f75:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  403f7a:	48 89 05 47 19 00 00 	mov    QWORD PTR [rip+0x1947],rax        # 4058c8 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  403f81:	e8 1a fe ff ff       	call   403da0 <allocate_chunk>
		pending_large_object_compact = 1;
  403f86:	c7 05 2c 19 00 00 01 	mov    DWORD PTR [rip+0x192c],0x1        # 4058bc <pending_large_object_compact>
  403f8d:	00 00 00 
  403f90:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000403fa0 <heap_size_in_pages>:
int heap_size_in_pages()
{
  403fa0:	f3 0f 1e fa          	endbr64 
  403fa4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  403fa8:	31 ff                	xor    edi,edi
  403faa:	e8 f1 d1 ff ff       	call   4011a0 <sbrk>
  403faf:	48 c7 c2 30 59 40 00 	mov    rdx,0x405930
  403fb6:	2b 02                	sub    eax,DWORD PTR [rdx]
  403fb8:	48 83 c4 08          	add    rsp,0x8
  403fbc:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

0000000000403fbd <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  403fbd:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000403fc0 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403fc0:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403fc2:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403fc4:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  403fc6:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  403fcd:	55                   	push   rbp
  403fce:	48 89 f5             	mov    rbp,rsi
  403fd1:	53                   	push   rbx
  403fd2:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403fd6:	e8 c5 ff ff ff       	call   403fa0 <heap_size_in_pages>
	if(!walloc_heap_size)
  403fdb:	48 8b 3d de 18 00 00 	mov    rdi,QWORD PTR [rip+0x18de]        # 4058c0 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  403fe2:	c1 e0 10             	shl    eax,0x10
  403fe5:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  403fe8:	48 85 ff             	test   rdi,rdi
  403feb:	75 63                	jne    404050 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  403fed:	48 c7 c7 30 59 40 00 	mov    rdi,0x405930
  403ff4:	be 00 00 01 00       	mov    esi,0x10000
  403ff9:	e8 a2 fc ff ff       	call   403ca0 <align>
		walloc_heap_size = preallocated;
  403ffe:	48 89 1d bb 18 00 00 	mov    QWORD PTR [rip+0x18bb],rbx        # 4058c0 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  404005:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  404008:	49 39 dc             	cmp    r12,rbx
  40400b:	0f 87 94 00 00 00    	ja     4040a5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  404011:	48 85 db             	test   rbx,rbx
  404014:	0f 84 a3 ff ff ff    	je     403fbd <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  40401a:	be 00 00 01 00       	mov    esi,0x10000
  40401f:	48 89 df             	mov    rdi,rbx
  404022:	e8 79 fc ff ff       	call   403ca0 <align>
  404027:	48 39 c3             	cmp    rbx,rax
  40402a:	0f 85 8d ff ff ff    	jne    403fbd <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  404030:	48 c1 eb 10          	shr    rbx,0x10
  404034:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  404038:	48 83 c4 08          	add    rsp,0x8
  40403c:	4c 89 c0             	mov    rax,r8
  40403f:	5b                   	pop    rbx
  404040:	5d                   	pop    rbp
  404041:	41 5c                	pop    r12
  404043:	41 5d                	pop    r13
  404045:	c3                   	ret    
  404046:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40404d:	00 00 00 
	if(preallocated < needed)
  404050:	4d 85 e4             	test   r12,r12
  404053:	74 5e                	je     4040b3 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  404055:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  404058:	4c 89 e6             	mov    rsi,r12
  40405b:	48 d1 ef             	shr    rdi,1
  40405e:	e8 2d fc ff ff       	call   403c90 <max>
  404063:	be 00 00 01 00       	mov    esi,0x10000
  404068:	48 89 c7             	mov    rdi,rax
  40406b:	e8 30 fc ff ff       	call   403ca0 <align>
  404070:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  404073:	48 85 c0             	test   rax,rax
  404076:	0f 84 41 ff ff ff    	je     403fbd <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  40407c:	48 89 c7             	mov    rdi,rax
  40407f:	e8 1c d1 ff ff       	call   4011a0 <sbrk>
  404084:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  404088:	74 16                	je     4040a0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  40408a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  40408d:	4c 01 25 2c 18 00 00 	add    QWORD PTR [rip+0x182c],r12        # 4058c0 <walloc_heap_size>
	size_t size = grow + preallocated;
  404094:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  404098:	e9 74 ff ff ff       	jmp    404011 <allocate_pages.constprop.0+0x51>
  40409d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  4040a0:	45 31 c0             	xor    r8d,r8d
  4040a3:	eb 93                	jmp    404038 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  4040a5:	49 29 dc             	sub    r12,rbx
  4040a8:	48 89 df             	mov    rdi,rbx
  4040ab:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  4040ae:	48 89 c3             	mov    rbx,rax
  4040b1:	eb a5                	jmp    404058 <allocate_pages.constprop.0+0x98>
  4040b3:	e9 05 ff ff ff       	jmp    403fbd <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

00000000004040b8 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  4040b8:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

00000000004040c0 <allocate_large_object>:
{
  4040c0:	41 54                	push   r12
  4040c2:	55                   	push   rbp
  4040c3:	53                   	push   rbx
  4040c4:	48 89 fb             	mov    rbx,rdi
  4040c7:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  4040cb:	e8 f0 fd ff ff       	call   403ec0 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4040d0:	48 8b 15 f1 17 00 00 	mov    rdx,QWORD PTR [rip+0x17f1]        # 4058c8 <large_objects>
  4040d7:	48 85 d2             	test   rdx,rdx
  4040da:	0f 84 da 01 00 00    	je     4042ba <allocate_large_object+0x1fa>
  4040e0:	4c 8d 0d e1 17 00 00 	lea    r9,[rip+0x17e1]        # 4058c8 <large_objects>
	size_t best_size = -1;
  4040e7:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  4040ee:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  4040f2:	45 31 d2             	xor    r10d,r10d
  4040f5:	4c 89 cd             	mov    rbp,r9
  4040f8:	eb 11                	jmp    40410b <allocate_large_object+0x4b>
  4040fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  404100:	49 89 d1             	mov    r9,rdx
  404103:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404106:	48 85 d2             	test   rdx,rdx
  404109:	74 39                	je     404144 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40410b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40410f:	4c 39 c1             	cmp    rcx,r8
  404112:	73 ec                	jae    404100 <allocate_large_object+0x40>
  404114:	48 39 d9             	cmp    rcx,rbx
  404117:	72 e7                	jb     404100 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  404119:	be 00 01 00 00       	mov    esi,0x100
  40411e:	e8 7d fb ff ff       	call   403ca0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  404123:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  404127:	48 39 c6             	cmp    rsi,rax
  40412a:	0f 84 88 02 00 00    	je     4043b8 <allocate_large_object+0x2f8>
  404130:	4c 89 cd             	mov    rbp,r9
  404133:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  404136:	49 89 d1             	mov    r9,rdx
  404139:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40413c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  40413f:	48 85 d2             	test   rdx,rdx
  404142:	75 c7                	jne    40410b <allocate_large_object+0x4b>
	if(!best)
  404144:	4d 85 d2             	test   r10,r10
  404147:	0f 84 7b 01 00 00    	je     4042c8 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  40414d:	4c 89 d7             	mov    rdi,r10
  404150:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  404155:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404158:	e8 13 fc ff ff       	call   403d70 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  40415d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404160:	89 c6                	mov    esi,eax
  404162:	e8 f9 fb ff ff       	call   403d60 <get_page>
  404167:	48 89 c7             	mov    rdi,rax
  40416a:	49 89 c1             	mov    r9,rax
  40416d:	e8 2e fc ff ff       	call   403da0 <allocate_chunk>
	struct large_object* next = best->next;
  404172:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  404175:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  404179:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  404180:	75 36                	jne    4041b8 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  404182:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  404186:	4c 89 d7             	mov    rdi,r10
  404189:	be 00 01 00 00       	mov    esi,0x100
  40418e:	e8 ed fb ff ff       	call   403d80 <get_large_object_payload>
  404193:	48 01 c2             	add    rdx,rax
  404196:	48 89 d7             	mov    rdi,rdx
  404199:	e8 02 fb ff ff       	call   403ca0 <align>
  40419e:	48 39 c2             	cmp    rdx,rax
  4041a1:	0f 85 11 ff ff ff    	jne    4040b8 <allocate_large_object.cold>
}
  4041a7:	48 83 c4 10          	add    rsp,0x10
  4041ab:	4c 89 d0             	mov    rax,r10
  4041ae:	5b                   	pop    rbx
  4041af:	5d                   	pop    rbp
  4041b0:	41 5c                	pop    r12
  4041b2:	c3                   	ret    
  4041b3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  4041b8:	4c 89 d7             	mov    rdi,r10
  4041bb:	e8 c0 fb ff ff       	call   403d80 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  4041c0:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  4041c3:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  4041c7:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  4041ca:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  4041cd:	4c 01 df             	add    rdi,r11
  4041d0:	e8 8b fb ff ff       	call   403d60 <get_page>
  4041d5:	49 39 c1             	cmp    r9,rax
  4041d8:	0f 84 e8 01 00 00    	je     4043c6 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4041de:	be 00 00 01 00       	mov    esi,0x10000
  4041e3:	4c 89 df             	mov    rdi,r11
  4041e6:	e8 b5 fa ff ff       	call   403ca0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  4041eb:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  4041f2:	0f 86 38 01 00 00    	jbe    404330 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4041f8:	4c 39 d8             	cmp    rax,r11
  4041fb:	0f 85 b7 fe ff ff    	jne    4040b8 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404201:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404204:	be 00 00 01 00       	mov    esi,0x10000
  404209:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  404210:	ff 
			tail_size = best_size - size;
  404211:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  404218:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404219:	e8 82 fa ff ff       	call   403ca0 <align>
		best->size -= tail_size;
  40421e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  404222:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  404225:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404228:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  40422b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40422f:	48 29 cf             	sub    rdi,rcx
  404232:	e8 39 fb ff ff       	call   403d70 <get_chunk_index>
  404237:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404239:	48 85 c9             	test   rcx,rcx
  40423c:	0f 84 44 ff ff ff    	je     404186 <allocate_large_object+0xc6>
  404242:	85 c0                	test   eax,eax
  404244:	75 0c                	jne    404252 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  404246:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  40424d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  404252:	48 85 c9             	test   rcx,rcx
  404255:	0f 84 2b ff ff ff    	je     404186 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  40425b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40425e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  404263:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404266:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  40426a:	e8 f1 fa ff ff       	call   403d60 <get_page>
  40426f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  404272:	e8 29 fb ff ff       	call   403da0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404277:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40427c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  40427f:	48 8b 05 42 16 00 00 	mov    rax,QWORD PTR [rip+0x1642]        # 4058c8 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404286:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  40428a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  40428d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404290:	e8 eb fa ff ff       	call   403d80 <get_large_object_payload>
  404295:	48 01 c1             	add    rcx,rax
  404298:	48 89 cf             	mov    rdi,rcx
  40429b:	e8 00 fa ff ff       	call   403ca0 <align>
  4042a0:	48 39 c1             	cmp    rcx,rax
  4042a3:	0f 85 0f fe ff ff    	jne    4040b8 <allocate_large_object.cold>
			large_objects = tail;
  4042a9:	48 89 15 18 16 00 00 	mov    QWORD PTR [rip+0x1618],rdx        # 4058c8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4042b0:	e8 fb fa ff ff       	call   403db0 <maybe_repurpose_single_chunk_large_objects_head>
  4042b5:	e9 c8 fe ff ff       	jmp    404182 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  4042ba:	48 8d 2d 07 16 00 00 	lea    rbp,[rip+0x1607]        # 4058c8 <large_objects>
  4042c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  4042c8:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4042cc:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  4042d1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4042d8:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4042da:	4c 89 e7             	mov    rdi,r12
  4042dd:	e8 de fc ff ff       	call   403fc0 <allocate_pages.constprop.0>
  4042e2:	48 89 c1             	mov    rcx,rax
		if(!page)
  4042e5:	48 85 c0             	test   rax,rax
  4042e8:	0f 84 10 01 00 00    	je     4043fe <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4042ee:	ba ff 00 00 00       	mov    edx,0xff
  4042f3:	be 01 00 00 00       	mov    esi,0x1
  4042f8:	48 89 c7             	mov    rdi,rax
  4042fb:	e8 a0 fa ff ff       	call   403da0 <allocate_chunk>
  404300:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  404303:	48 8b 05 be 15 00 00 	mov    rax,QWORD PTR [rip+0x15be]        # 4058c8 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40430a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40430d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  404310:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  404315:	48 c1 e0 10          	shl    rax,0x10
  404319:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  40431e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  404322:	4d 39 c4             	cmp    r12,r8
  404325:	0f 86 22 fe ff ff    	jbe    40414d <allocate_large_object+0x8d>
  40432b:	e9 88 fd ff ff       	jmp    4040b8 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404330:	4c 39 d8             	cmp    rax,r11
  404333:	0f 85 7f fd ff ff    	jne    4040b8 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404339:	48 89 ef             	mov    rdi,rbp
  40433c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404341:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404345:	e8 26 fa ff ff       	call   403d70 <get_chunk_index>
  40434a:	4c 89 cf             	mov    rdi,r9
  40434d:	89 c6                	mov    esi,eax
  40434f:	e8 4c fa ff ff       	call   403da0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404354:	b8 00 00 01 00       	mov    eax,0x10000
  404359:	4c 29 e0             	sub    rax,r12
  40435c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  404360:	48 8b 05 61 15 00 00 	mov    rax,QWORD PTR [rip+0x1561]        # 4058c8 <large_objects>
  404367:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  40436a:	4c 89 15 57 15 00 00 	mov    QWORD PTR [rip+0x1557],r10        # 4058c8 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404371:	e8 3a fa ff ff       	call   403db0 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404376:	ba ff 00 00 00       	mov    edx,0xff
  40437b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  404380:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404387:	e8 14 fa ff ff       	call   403da0 <allocate_chunk>
			best->size = best_size =
  40438c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  404393:	ff 
  404394:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404398:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40439b:	48 39 d3             	cmp    rbx,rdx
  40439e:	0f 87 14 fd ff ff    	ja     4040b8 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  4043a4:	48 89 d1             	mov    rcx,rdx
  4043a7:	48 29 d9             	sub    rcx,rbx
  4043aa:	30 c9                	xor    cl,cl
  4043ac:	e9 74 fe ff ff       	jmp    404225 <allocate_large_object+0x165>
  4043b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4043b8:	4c 89 cd             	mov    rbp,r9
  4043bb:	49 89 c8             	mov    r8,rcx
  4043be:	49 89 d2             	mov    r10,rdx
  4043c1:	e9 87 fd ff ff       	jmp    40414d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  4043c6:	be 00 01 00 00       	mov    esi,0x100
  4043cb:	4c 89 df             	mov    rdi,r11
  4043ce:	e8 cd f8 ff ff       	call   403ca0 <align>
  4043d3:	49 39 c3             	cmp    r11,rax
  4043d6:	0f 85 dc fc ff ff    	jne    4040b8 <allocate_large_object.cold>
		best->size -= tail_size;
  4043dc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4043e0:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  4043e3:	48 29 ca             	sub    rdx,rcx
  4043e6:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4043ea:	e8 81 f9 ff ff       	call   403d70 <get_chunk_index>
  4043ef:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  4043f1:	85 c0                	test   eax,eax
  4043f3:	0f 84 4d fe ff ff    	je     404246 <allocate_large_object+0x186>
  4043f9:	e9 5d fe ff ff       	jmp    40425b <allocate_large_object+0x19b>
			return NULL;
  4043fe:	45 31 d2             	xor    r10d,r10d
  404401:	e9 a1 fd ff ff       	jmp    4041a7 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

0000000000404410 <allocate_large>:
{
  404410:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  404414:	e8 a7 fc ff ff       	call   4040c0 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  404419:	48 85 c0             	test   rax,rax
  40441c:	74 12                	je     404430 <allocate_large+0x20>
  40441e:	48 89 c7             	mov    rdi,rax
}
  404421:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  404425:	e9 56 f9 ff ff       	jmp    403d80 <get_large_object_payload>
  40442a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  404430:	31 c0                	xor    eax,eax
  404432:	48 83 c4 08          	add    rsp,0x8
  404436:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

0000000000404440 <obtain_small_objects>:
{
  404440:	55                   	push   rbp
  404441:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  404443:	48 8b 3d de 14 00 00 	mov    rdi,QWORD PTR [rip+0x14de]        # 405928 <small_object_freelists+0x48>
  40444a:	48 85 ff             	test   rdi,rdi
  40444d:	74 71                	je     4044c0 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  40444f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  404452:	48 89 05 cf 14 00 00 	mov    QWORD PTR [rip+0x14cf],rax        # 405928 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404459:	e8 12 f9 ff ff       	call   403d70 <get_chunk_index>
  40445e:	89 ea                	mov    edx,ebp
  404460:	89 c6                	mov    esi,eax
  404462:	e8 f9 f8 ff ff       	call   403d60 <get_page>
  404467:	48 89 c7             	mov    rdi,rax
  40446a:	e8 31 f9 ff ff       	call   403da0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  40446f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404471:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  404474:	e8 c7 f8 ff ff       	call   403d40 <chunk_kind_to_granules>
  404479:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404480:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  404487:	77 46                	ja     4044cf <obtain_small_objects+0x8f>
  404489:	48 89 d0             	mov    rax,rdx
  40448c:	48 89 f1             	mov    rcx,rsi
  40448f:	48 29 f0             	sub    rax,rsi
  404492:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  404499:	31 c0                	xor    eax,eax
  40449b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  4044a0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4044a3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  4044a6:	48 89 d0             	mov    rax,rdx
		head->next = next;
  4044a9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  4044ac:	48 29 f2             	sub    rdx,rsi
  4044af:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  4044b6:	76 e8                	jbe    4044a0 <obtain_small_objects+0x60>
}
  4044b8:	5d                   	pop    rbp
  4044b9:	c3                   	ret    
  4044ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  4044c0:	31 ff                	xor    edi,edi
  4044c2:	e8 f9 fb ff ff       	call   4040c0 <allocate_large_object>
  4044c7:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  4044ca:	48 85 c0             	test   rax,rax
  4044cd:	75 8a                	jne    404459 <obtain_small_objects+0x19>
			return NULL;
  4044cf:	31 c0                	xor    eax,eax
}
  4044d1:	5d                   	pop    rbp
  4044d2:	c3                   	ret    

Disassembly of section .text.allocate_small:

00000000004044e0 <allocate_small>:
{
  4044e0:	53                   	push   rbx
  4044e1:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  4044e4:	e8 17 fa ff ff       	call   403f00 <get_small_object_freelist>
  4044e9:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  4044ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  4044ef:	48 85 c0             	test   rax,rax
  4044f2:	74 0c                	je     404500 <allocate_small+0x20>
	*loc = ret->next;
  4044f4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  4044f7:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  4044fa:	5b                   	pop    rbx
  4044fb:	c3                   	ret    
  4044fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  404500:	44 89 c7             	mov    edi,r8d
  404503:	e8 38 ff ff ff       	call   404440 <obtain_small_objects>
		if(!freelist)
  404508:	48 85 c0             	test   rax,rax
  40450b:	74 ed                	je     4044fa <allocate_small+0x1a>
		*loc = freelist;
  40450d:	48 89 03             	mov    QWORD PTR [rbx],rax
  404510:	eb e2                	jmp    4044f4 <allocate_small+0x14>

Disassembly of section .text.malloc:

0000000000404520 <malloc>:
{
  404520:	f3 0f 1e fa          	endbr64 
  404524:	48 83 ec 08          	sub    rsp,0x8
  404528:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  40452b:	e8 d0 f8 ff ff       	call   403e00 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  404530:	89 c7                	mov    edi,eax
  404532:	e8 79 f7 ff ff       	call   403cb0 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404537:	3d ff 00 00 00       	cmp    eax,0xff
  40453c:	74 12                	je     404550 <malloc+0x30>
  40453e:	89 c7                	mov    edi,eax
}
  404540:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404544:	e9 97 ff ff ff       	jmp    4044e0 <allocate_small>
  404549:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404550:	4c 89 c7             	mov    rdi,r8
}
  404553:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404557:	e9 b4 fe ff ff       	jmp    404410 <allocate_large>

Disassembly of section .text.memcpy:

0000000000404560 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  404560:	f3 0f 1e fa          	endbr64 
  404564:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  404567:	48 85 d2             	test   rdx,rdx
  40456a:	74 6c                	je     4045d8 <memcpy+0x78>
  40456c:	48 89 f0             	mov    rax,rsi
  40456f:	48 39 f7             	cmp    rdi,rsi
  404572:	74 64                	je     4045d8 <memcpy+0x78>
  404574:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  404577:	73 67                	jae    4045e0 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  404579:	48 89 fa             	mov    rdx,rdi
  40457c:	48 09 f2             	or     rdx,rsi
  40457f:	83 e2 03             	and    edx,0x3
  404582:	0f 85 e8 00 00 00    	jne    404670 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  404588:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  40458b:	49 89 c9             	mov    r9,rcx
  40458e:	4c 89 c6             	mov    rsi,r8
  404591:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  404594:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404598:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  40459c:	49 83 fa 03          	cmp    r10,0x3
  4045a0:	76 1f                	jbe    4045c1 <memcpy+0x61>
  4045a2:	31 d2                	xor    edx,edx
  4045a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4045a8:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  4045ab:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  4045ae:	48 83 c2 01          	add    rdx,0x1
  4045b2:	48 39 d7             	cmp    rdi,rdx
  4045b5:	75 f1                	jne    4045a8 <memcpy+0x48>
  4045b7:	48 c1 e7 02          	shl    rdi,0x2
  4045bb:	48 01 f8             	add    rax,rdi
  4045be:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  4045c1:	4d 85 c9             	test   r9,r9
  4045c4:	74 12                	je     4045d8 <memcpy+0x78>
  4045c6:	31 d2                	xor    edx,edx
  4045c8:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  4045cc:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  4045cf:	48 83 c2 01          	add    rdx,0x1
  4045d3:	49 39 d1             	cmp    r9,rdx
  4045d6:	75 f0                	jne    4045c8 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  4045d8:	4c 89 c0             	mov    rax,r8
  4045db:	c3                   	ret    
  4045dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  4045e0:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  4045e4:	48 01 d0             	add    rax,rdx
{
  4045e7:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  4045e8:	4c 89 ca             	mov    rdx,r9
{
  4045eb:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  4045ec:	48 09 c2             	or     rdx,rax
  4045ef:	83 e2 03             	and    edx,0x3
  4045f2:	0f 84 b8 00 00 00    	je     4046b0 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  4045f8:	4c 89 ca             	mov    rdx,r9
  4045fb:	48 31 c2             	xor    rdx,rax
  4045fe:	83 e2 03             	and    edx,0x3
  404601:	75 0a                	jne    40460d <memcpy+0xad>
  404603:	48 83 f9 04          	cmp    rcx,0x4
  404607:	0f 87 13 01 00 00    	ja     404720 <memcpy+0x1c0>
  40460d:	31 db                	xor    ebx,ebx
  40460f:	31 d2                	xor    edx,edx
  404611:	31 ed                	xor    ebp,ebp
			length -= t;
  404613:	48 89 ce             	mov    rsi,rcx
  404616:	48 f7 de             	neg    rsi
  404619:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  404620:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  404624:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  404628:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  40462e:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  404633:	48 83 e9 01          	sub    rcx,0x1
  404637:	75 e7                	jne    404620 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404639:	48 83 fd 03          	cmp    rbp,0x3
  40463d:	0f 87 8d 00 00 00    	ja     4046d0 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  404643:	48 85 db             	test   rbx,rbx
  404646:	74 1c                	je     404664 <memcpy+0x104>
  404648:	48 f7 d3             	not    rbx
  40464b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  404652:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  404657:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  40465b:	48 83 e8 01          	sub    rax,0x1
  40465f:	48 39 d8             	cmp    rax,rbx
  404662:	75 ee                	jne    404652 <memcpy+0xf2>
}
  404664:	4c 89 c0             	mov    rax,r8
  404667:	5b                   	pop    rbx
  404668:	5d                   	pop    rbp
  404669:	c3                   	ret    
  40466a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  404670:	48 89 fa             	mov    rdx,rdi
  404673:	48 31 f2             	xor    rdx,rsi
  404676:	83 e2 03             	and    edx,0x3
  404679:	75 06                	jne    404681 <memcpy+0x121>
  40467b:	48 83 f9 03          	cmp    rcx,0x3
  40467f:	77 77                	ja     4046f8 <memcpy+0x198>
  404681:	45 31 c9             	xor    r9d,r9d
  404684:	31 ff                	xor    edi,edi
  404686:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  404689:	31 d2                	xor    edx,edx
  40468b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  404690:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  404694:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  404698:	48 83 c2 01          	add    rdx,0x1
  40469c:	48 39 d1             	cmp    rcx,rdx
  40469f:	75 ef                	jne    404690 <memcpy+0x130>
  4046a1:	48 01 c8             	add    rax,rcx
  4046a4:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  4046a8:	e9 ef fe ff ff       	jmp    40459c <memcpy+0x3c>
  4046ad:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  4046b0:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  4046b3:	48 89 cb             	mov    rbx,rcx
  4046b6:	48 89 cd             	mov    rbp,rcx
		src += length;
  4046b9:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  4046bc:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  4046c0:	83 e3 03             	and    ebx,0x3
		dst += length;
  4046c3:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  4046c6:	48 83 fd 03          	cmp    rbp,0x3
  4046ca:	0f 86 73 ff ff ff    	jbe    404643 <memcpy+0xe3>
  4046d0:	48 89 d0             	mov    rax,rdx
  4046d3:	48 f7 d8             	neg    rax
  4046d6:	48 c1 e0 02          	shl    rax,0x2
  4046da:	49 01 c3             	add    r11,rax
  4046dd:	49 01 c2             	add    r10,rax
  4046e0:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  4046e5:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  4046ea:	48 83 ea 01          	sub    rdx,0x1
  4046ee:	75 f0                	jne    4046e0 <memcpy+0x180>
  4046f0:	e9 4e ff ff ff       	jmp    404643 <memcpy+0xe3>
  4046f5:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  4046f8:	48 89 f2             	mov    rdx,rsi
  4046fb:	83 e2 03             	and    edx,0x3
			length -= t;
  4046fe:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  404703:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  404708:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  40470b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  40470e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  404711:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404715:	41 83 e1 03          	and    r9d,0x3
  404719:	e9 6b ff ff ff       	jmp    404689 <memcpy+0x129>
  40471e:	66 90                	xchg   ax,ax
				t &= wmask;
  404720:	48 89 c6             	mov    rsi,rax
  404723:	83 e6 03             	and    esi,0x3
			length -= t;
  404726:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  404729:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  40472c:	48 89 cb             	mov    rbx,rcx
			length -= t;
  40472f:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  404732:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  404735:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404739:	83 e3 03             	and    ebx,0x3
  40473c:	e9 d2 fe ff ff       	jmp    404613 <memcpy+0xb3>
