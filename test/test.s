
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
  40005f:	48 8d 05 ea 56 00 00 	lea    rax,[rip+0x56ea]        # 405750 <b+0x4>
  400066:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    puts("Gamessis OS shell\n");
  40006a:	48 8d 05 e6 56 00 00 	lea    rax,[rip+0x56e6]        # 405757 <b+0xb>
  400071:	48 89 c7             	mov    rdi,rax
  400074:	e8 87 16 00 00       	call   401700 <puts>
    char        cmd[128]  = {0};
  400079:	48 c7 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],0x0
  400080:	00 00 00 00 
  400084:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x0
  40008b:	00 00 00 00 
  40008f:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  400096:	00 00 00 00 
  40009a:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  4000a1:	00 00 00 00 
  4000a5:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  4000ac:	00 00 00 00 
  4000b0:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  4000b7:	00 00 00 00 
  4000bb:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  4000c2:	00 00 00 00 
  4000c6:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  4000cd:	00 00 00 00 
  4000d1:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  4000d8:	00 00 00 00 
  4000dc:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  4000e3:	00 00 00 00 
  4000e7:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  4000ee:	00 00 00 00 
  4000f2:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  4000f9:	00 00 00 00 
  4000fd:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  400104:	00 00 00 00 
  400108:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  40010f:	00 00 00 00 
  400113:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  40011a:	00 00 00 00 
  40011e:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  400125:	00 00 00 00 
    char        path[128] = "/";
  400129:	48 c7 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],0x2f
  400130:	2f 00 00 00 
  400134:	48 c7 85 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],0x0
  40013b:	00 00 00 00 
  40013f:	48 c7 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],0x0
  400146:	00 00 00 00 
  40014a:	48 c7 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],0x0
  400151:	00 00 00 00 
  400155:	48 c7 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],0x0
  40015c:	00 00 00 00 
  400160:	48 c7 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],0x0
  400167:	00 00 00 00 
  40016b:	48 c7 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],0x0
  400172:	00 00 00 00 
  400176:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x0
  40017d:	00 00 00 00 
  400181:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x0
  400188:	00 00 00 00 
  40018c:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
  400193:	00 00 00 00 
  400197:	48 c7 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],0x0
  40019e:	00 00 00 00 
  4001a2:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
  4001a9:	00 00 00 00 
  4001ad:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0x0
  4001b4:	00 00 00 00 
  4001b8:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
  4001bf:	00 00 00 00 
  4001c3:	48 c7 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],0x0
  4001ca:	00 00 00 00 
  4001ce:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
  4001d5:	00 00 00 00 
    windowptr_t window    = create_window("Shell", WNDTYPE_WINDOW);
  4001d9:	be 00 00 00 00       	mov    esi,0x0
  4001de:	48 8d 05 85 55 00 00 	lea    rax,[rip+0x5585]        # 40576a <b+0x1e>
  4001e5:	48 89 c7             	mov    rdi,rax
  4001e8:	e8 03 10 00 00       	call   4011f0 <create_window>
  4001ed:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    // resize_window(window, 200, 180);
    // move_window(window, 20, 20);
    show_window(window);
  4001f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  4001f5:	48 89 c7             	mov    rdi,rax
  4001f8:	e8 13 10 00 00       	call   401210 <show_window>
    while (1) {
        memset(cmd, 0, 128);
  4001fd:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400204:	ba 80 00 00 00       	mov    edx,0x80
  400209:	be 00 00 00 00       	mov    esi,0x0
  40020e:	48 89 c7             	mov    rdi,rax
  400211:	e8 aa 15 00 00       	call   4017c0 <memset>
        int p = 0;
  400216:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
        printf("%s:>", path);
  40021d:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  400224:	48 89 c6             	mov    rsi,rax
  400227:	48 8d 05 42 55 00 00 	lea    rax,[rip+0x5542]        # 405770 <b+0x24>
  40022e:	48 89 c7             	mov    rdi,rax
  400231:	b8 00 00 00 00       	mov    eax,0x0
  400236:	e8 85 38 00 00       	call   403ac0 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  40023b:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400242:	48 89 c7             	mov    rdi,rax
  400245:	e8 16 15 00 00       	call   401760 <gets>
        puts(cmd);
  40024a:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400251:	48 89 c7             	mov    rdi,rax
  400254:	e8 a7 14 00 00       	call   401700 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400259:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400260:	48 8d 15 0e 55 00 00 	lea    rdx,[rip+0x550e]        # 405775 <b+0x29>
  400267:	48 89 d6             	mov    rsi,rdx
  40026a:	48 89 c7             	mov    rdi,rax
  40026d:	e8 1e 16 00 00       	call   401890 <strcmp>
  400272:	85 c0                	test   eax,eax
  400274:	75 14                	jne    40028a <main+0x24f>
            puts("Gamessis OS 1.0.\n");
  400276:	48 8d 05 00 55 00 00 	lea    rax,[rip+0x5500]        # 40577d <b+0x31>
  40027d:	48 89 c7             	mov    rdi,rax
  400280:	e8 7b 14 00 00       	call   401700 <puts>
  400285:	e9 73 ff ff ff       	jmp    4001fd <main+0x1c2>
        }
        else if (strcmp(cmd, "exit") == 0) {
  40028a:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400291:	48 8d 15 f7 54 00 00 	lea    rdx,[rip+0x54f7]        # 40578f <b+0x43>
  400298:	48 89 d6             	mov    rsi,rdx
  40029b:	48 89 c7             	mov    rdi,rax
  40029e:	e8 ed 15 00 00       	call   401890 <strcmp>
  4002a3:	85 c0                	test   eax,eax
  4002a5:	0f 84 d8 0c 00 00    	je     400f83 <main+0xf48>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  4002ab:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  4002b2:	48 8d 15 db 54 00 00 	lea    rdx,[rip+0x54db]        # 405794 <b+0x48>
  4002b9:	48 89 d6             	mov    rsi,rdx
  4002bc:	48 89 c7             	mov    rdi,rax
  4002bf:	e8 cc 15 00 00       	call   401890 <strcmp>
  4002c4:	85 c0                	test   eax,eax
  4002c6:	0f 85 8d 00 00 00    	jne    400359 <main+0x31e>
            // ls
            getcwd(path, 128);
  4002cc:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  4002d3:	be 80 00 00 00       	mov    esi,0x80
  4002d8:	48 89 c7             	mov    rdi,rax
  4002db:	e8 85 13 00 00       	call   401665 <getcwd>
            DIR*           dp = opendir(path);
  4002e0:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  4002e7:	48 89 c7             	mov    rdi,rax
  4002ea:	e8 c1 0f 00 00       	call   4012b0 <opendir>
  4002ef:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            struct dirent* dirp;
            if (!dp) {
  4002f3:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  4002f8:	75 38                	jne    400332 <main+0x2f7>
                printf("error opening directory\n");
  4002fa:	48 8d 05 96 54 00 00 	lea    rax,[rip+0x5496]        # 405797 <b+0x4b>
  400301:	48 89 c7             	mov    rdi,rax
  400304:	b8 00 00 00 00       	mov    eax,0x0
  400309:	e8 b2 37 00 00       	call   403ac0 <printf>
                continue;
  40030e:	e9 6b 0c 00 00       	jmp    400f7e <main+0xf43>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  400313:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  400317:	48 83 c0 18          	add    rax,0x18
  40031b:	48 89 c6             	mov    rsi,rax
  40031e:	48 8d 05 8b 54 00 00 	lea    rax,[rip+0x548b]        # 4057b0 <b+0x64>
  400325:	48 89 c7             	mov    rdi,rax
  400328:	b8 00 00 00 00       	mov    eax,0x0
  40032d:	e8 8e 37 00 00       	call   403ac0 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  400332:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  400336:	48 89 c7             	mov    rdi,rax
  400339:	e8 f4 10 00 00       	call   401432 <readdir>
  40033e:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  400342:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
  400347:	75 ca                	jne    400313 <main+0x2d8>
            }
            close(dp);
  400349:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40034d:	89 c7                	mov    edi,eax
  40034f:	e8 fc 0c 00 00       	call   401050 <close>
  400354:	e9 a4 fe ff ff       	jmp    4001fd <main+0x1c2>
        }
        else if (strcmp(cmd, "cd") == 0) {
  400359:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400360:	48 8d 15 4d 54 00 00 	lea    rdx,[rip+0x544d]        # 4057b4 <b+0x68>
  400367:	48 89 d6             	mov    rsi,rdx
  40036a:	48 89 c7             	mov    rdi,rax
  40036d:	e8 1e 15 00 00       	call   401890 <strcmp>
  400372:	85 c0                	test   eax,eax
  400374:	0f 85 1a 02 00 00    	jne    400594 <main+0x559>
            // cd
            char tmppath[128] = {0};
  40037a:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  400381:	00 00 00 00 
  400385:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40038c:	00 00 00 00 
  400390:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400397:	00 00 00 00 
  40039b:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4003a2:	00 00 00 00 
  4003a6:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4003ad:	00 00 00 00 
  4003b1:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4003b8:	00 00 00 00 
  4003bc:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4003c3:	00 00 00 00 
  4003c7:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4003ce:	00 00 00 00 
  4003d2:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4003d9:	00 00 00 00 
  4003dd:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4003e4:	00 00 00 00 
  4003e8:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4003ef:	00 00 00 00 
  4003f3:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4003fa:	00 00 00 00 
  4003fe:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400405:	00 00 00 00 
  400409:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400410:	00 00 00 00 
  400414:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  40041b:	00 00 00 00 
  40041f:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  400426:	00 00 00 00 
            printf("enter path:");
  40042a:	48 8d 05 86 53 00 00 	lea    rax,[rip+0x5386]        # 4057b7 <b+0x6b>
  400431:	48 89 c7             	mov    rdi,rax
  400434:	b8 00 00 00 00       	mov    eax,0x0
  400439:	e8 82 36 00 00       	call   403ac0 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  40043e:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400445:	48 89 c7             	mov    rdi,rax
  400448:	e8 13 13 00 00       	call   401760 <gets>
            if (chdir(tmppath) == -1) {
  40044d:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400454:	48 89 c7             	mov    rdi,rax
  400457:	e8 74 10 00 00       	call   4014d0 <chdir>
  40045c:	83 f8 ff             	cmp    eax,0xffffffff
  40045f:	75 23                	jne    400484 <main+0x449>
                printf("cannot find directory:%s\n", tmppath);
  400461:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400468:	48 89 c6             	mov    rsi,rax
  40046b:	48 8d 05 51 53 00 00 	lea    rax,[rip+0x5351]        # 4057c3 <b+0x77>
  400472:	48 89 c7             	mov    rdi,rax
  400475:	b8 00 00 00 00       	mov    eax,0x0
  40047a:	e8 41 36 00 00       	call   403ac0 <printf>
                continue;
  40047f:	e9 fa 0a 00 00       	jmp    400f7e <main+0xf43>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(tmppath, "..") == 0) {
  400484:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40048b:	48 8d 15 4b 53 00 00 	lea    rdx,[rip+0x534b]        # 4057dd <b+0x91>
  400492:	48 89 d6             	mov    rsi,rdx
  400495:	48 89 c7             	mov    rdi,rax
  400498:	e8 f3 13 00 00       	call   401890 <strcmp>
  40049d:	85 c0                	test   eax,eax
  40049f:	75 75                	jne    400516 <main+0x4db>
                char* p = tmppath + strlen(tmppath) - 1;
  4004a1:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4004a8:	48 89 c7             	mov    rdi,rax
  4004ab:	e8 30 14 00 00       	call   4018e0 <strlen>
  4004b0:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004b4:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4004bb:	48 01 d0             	add    rax,rdx
  4004be:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
                while (p > tmppath && *p == '/') {
  4004c2:	eb 0f                	jmp    4004d3 <main+0x498>
                    *p-- = 0;
  4004c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004c8:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004cc:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4004d0:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  4004d3:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4004da:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4004de:	76 1c                	jbe    4004fc <main+0x4c1>
  4004e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4004e7:	3c 2f                	cmp    al,0x2f
  4004e9:	74 d9                	je     4004c4 <main+0x489>
                }
                while (p > tmppath && *(p) != '/') {
  4004eb:	eb 0f                	jmp    4004fc <main+0x4c1>
                    *p-- = 0;
  4004ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4004f1:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4004f5:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4004f9:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  4004fc:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400503:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  400507:	76 68                	jbe    400571 <main+0x536>
  400509:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  40050d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  400510:	3c 2f                	cmp    al,0x2f
  400512:	75 d9                	jne    4004ed <main+0x4b2>
  400514:	eb 5b                	jmp    400571 <main+0x536>
                }
            }
            else if (strcmp(tmppath, ".") == 0) {
  400516:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40051d:	48 8d 15 bc 52 00 00 	lea    rdx,[rip+0x52bc]        # 4057e0 <b+0x94>
  400524:	48 89 d6             	mov    rsi,rdx
  400527:	48 89 c7             	mov    rdi,rax
  40052a:	e8 61 13 00 00       	call   401890 <strcmp>
  40052f:	85 c0                	test   eax,eax
  400531:	0f 84 46 0a 00 00    	je     400f7d <main+0xf42>
                continue;
            }
            else {
                strcat(path, tmppath);
  400537:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  40053e:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  400545:	48 89 d6             	mov    rsi,rdx
  400548:	48 89 c7             	mov    rdi,rax
  40054b:	e8 00 13 00 00       	call   401850 <strcat>
                strcat(path, "/");
  400550:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  400557:	48 89 c7             	mov    rdi,rax
  40055a:	e8 81 13 00 00       	call   4018e0 <strlen>
  40055f:	48 89 c2             	mov    rdx,rax
  400562:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  400569:	48 01 d0             	add    rax,rdx
  40056c:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  400571:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400578:	48 89 c6             	mov    rsi,rax
  40057b:	48 8d 05 60 52 00 00 	lea    rax,[rip+0x5260]        # 4057e2 <b+0x96>
  400582:	48 89 c7             	mov    rdi,rax
  400585:	b8 00 00 00 00       	mov    eax,0x0
  40058a:	e8 31 35 00 00       	call   403ac0 <printf>
  40058f:	e9 69 fc ff ff       	jmp    4001fd <main+0x1c2>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400594:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  40059b:	48 8d 15 56 52 00 00 	lea    rdx,[rip+0x5256]        # 4057f8 <b+0xac>
  4005a2:	48 89 d6             	mov    rsi,rdx
  4005a5:	48 89 c7             	mov    rdi,rax
  4005a8:	e8 e3 12 00 00       	call   401890 <strcmp>
  4005ad:	85 c0                	test   eax,eax
  4005af:	0f 85 1e 01 00 00    	jne    4006d3 <main+0x698>
            char path[100] = {0};
  4005b5:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  4005bc:	00 00 00 00 
  4005c0:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4005c7:	00 00 00 00 
  4005cb:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4005d2:	00 00 00 00 
  4005d6:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4005dd:	00 00 00 00 
  4005e1:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4005e8:	00 00 00 00 
  4005ec:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4005f3:	00 00 00 00 
  4005f7:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4005fe:	00 00 00 00 
  400602:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400609:	00 00 00 00 
  40060d:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400614:	00 00 00 00 
  400618:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40061f:	00 00 00 00 
  400623:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40062a:	00 00 00 00 
  40062e:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400635:	00 00 00 00 
  400639:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400640:	00 00 00 
            printf("input path:");
  400643:	48 8d 05 b4 51 00 00 	lea    rax,[rip+0x51b4]        # 4057fe <b+0xb2>
  40064a:	48 89 c7             	mov    rdi,rax
  40064d:	b8 00 00 00 00       	mov    eax,0x0
  400652:	e8 69 34 00 00       	call   403ac0 <printf>
            gets(path);
  400657:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40065e:	48 89 c7             	mov    rdi,rax
  400661:	e8 fa 10 00 00       	call   401760 <gets>
            int fd = creat(path, O_CREAT);
  400666:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40066d:	be 40 00 00 00       	mov    esi,0x40
  400672:	48 89 c7             	mov    rdi,rax
  400675:	e8 cb 0e 00 00       	call   401545 <creat>
  40067a:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
            if (fd < 0) {
  40067d:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
  400681:	79 23                	jns    4006a6 <main+0x66b>
                printf("create file %s failed\n", path);
  400683:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40068a:	48 89 c6             	mov    rsi,rax
  40068d:	48 8d 05 76 51 00 00 	lea    rax,[rip+0x5176]        # 40580a <b+0xbe>
  400694:	48 89 c7             	mov    rdi,rax
  400697:	b8 00 00 00 00       	mov    eax,0x0
  40069c:	e8 1f 34 00 00       	call   403ac0 <printf>
  4006a1:	e9 57 fb ff ff       	jmp    4001fd <main+0x1c2>
            }
            else {
                printf("create file %s success\n", path);
  4006a6:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4006ad:	48 89 c6             	mov    rsi,rax
  4006b0:	48 8d 05 6a 51 00 00 	lea    rax,[rip+0x516a]        # 405821 <b+0xd5>
  4006b7:	48 89 c7             	mov    rdi,rax
  4006ba:	b8 00 00 00 00       	mov    eax,0x0
  4006bf:	e8 fc 33 00 00       	call   403ac0 <printf>
                close(fd);
  4006c4:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  4006c7:	89 c7                	mov    edi,eax
  4006c9:	e8 82 09 00 00       	call   401050 <close>
  4006ce:	e9 2a fb ff ff       	jmp    4001fd <main+0x1c2>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  4006d3:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  4006da:	48 8d 15 58 51 00 00 	lea    rdx,[rip+0x5158]        # 405839 <b+0xed>
  4006e1:	48 89 d6             	mov    rsi,rdx
  4006e4:	48 89 c7             	mov    rdi,rax
  4006e7:	e8 a4 11 00 00       	call   401890 <strcmp>
  4006ec:	85 c0                	test   eax,eax
  4006ee:	0f 85 0f 01 00 00    	jne    400803 <main+0x7c8>
            char path[100] = {0};
  4006f4:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  4006fb:	00 00 00 00 
  4006ff:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400706:	00 00 00 00 
  40070a:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400711:	00 00 00 00 
  400715:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  40071c:	00 00 00 00 
  400720:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400727:	00 00 00 00 
  40072b:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400732:	00 00 00 00 
  400736:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  40073d:	00 00 00 00 
  400741:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400748:	00 00 00 00 
  40074c:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400753:	00 00 00 00 
  400757:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40075e:	00 00 00 00 
  400762:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400769:	00 00 00 00 
  40076d:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400774:	00 00 00 00 
  400778:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  40077f:	00 00 00 
            printf("input path:");
  400782:	48 8d 05 75 50 00 00 	lea    rax,[rip+0x5075]        # 4057fe <b+0xb2>
  400789:	48 89 c7             	mov    rdi,rax
  40078c:	b8 00 00 00 00       	mov    eax,0x0
  400791:	e8 2a 33 00 00       	call   403ac0 <printf>
            gets(path);
  400796:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40079d:	48 89 c7             	mov    rdi,rax
  4007a0:	e8 bb 0f 00 00       	call   401760 <gets>
            int stat = remove(path);
  4007a5:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4007ac:	48 89 c7             	mov    rdi,rax
  4007af:	e8 fc 09 00 00       	call   4011b0 <remove>
  4007b4:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
            if (stat < 0) {
  4007b7:	83 7d b8 00          	cmp    DWORD PTR [rbp-0x48],0x0
  4007bb:	79 23                	jns    4007e0 <main+0x7a5>
                printf("remove file/dir %s failed\n", path);
  4007bd:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4007c4:	48 89 c6             	mov    rsi,rax
  4007c7:	48 8d 05 6e 50 00 00 	lea    rax,[rip+0x506e]        # 40583c <b+0xf0>
  4007ce:	48 89 c7             	mov    rdi,rax
  4007d1:	b8 00 00 00 00       	mov    eax,0x0
  4007d6:	e8 e5 32 00 00       	call   403ac0 <printf>
  4007db:	e9 1d fa ff ff       	jmp    4001fd <main+0x1c2>
            }
            else {
                printf("remove file/dir %s success\n", path);
  4007e0:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4007e7:	48 89 c6             	mov    rsi,rax
  4007ea:	48 8d 05 66 50 00 00 	lea    rax,[rip+0x5066]        # 405857 <b+0x10b>
  4007f1:	48 89 c7             	mov    rdi,rax
  4007f4:	b8 00 00 00 00       	mov    eax,0x0
  4007f9:	e8 c2 32 00 00       	call   403ac0 <printf>
  4007fe:	e9 fa f9 ff ff       	jmp    4001fd <main+0x1c2>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  400803:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  40080a:	48 8d 15 62 50 00 00 	lea    rdx,[rip+0x5062]        # 405873 <b+0x127>
  400811:	48 89 d6             	mov    rsi,rdx
  400814:	48 89 c7             	mov    rdi,rax
  400817:	e8 74 10 00 00       	call   401890 <strcmp>
  40081c:	85 c0                	test   eax,eax
  40081e:	0f 85 d8 01 00 00    	jne    4009fc <main+0x9c1>
            char src[100] = {0};
  400824:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  40082b:	00 00 00 00 
  40082f:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400836:	00 00 00 00 
  40083a:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400841:	00 00 00 00 
  400845:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  40084c:	00 00 00 00 
  400850:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400857:	00 00 00 00 
  40085b:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400862:	00 00 00 00 
  400866:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  40086d:	00 00 00 00 
  400871:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400878:	00 00 00 00 
  40087c:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400883:	00 00 00 00 
  400887:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  40088e:	00 00 00 00 
  400892:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400899:	00 00 00 00 
  40089d:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  4008a4:	00 00 00 00 
  4008a8:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  4008af:	00 00 00 
            char dst[100] = {0};
  4008b2:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  4008b9:	00 00 00 00 
  4008bd:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4008c4:	00 00 00 00 
  4008c8:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4008cf:	00 00 00 00 
  4008d3:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4008da:	00 00 00 00 
  4008de:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4008e5:	00 00 00 00 
  4008e9:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4008f0:	00 00 00 00 
  4008f4:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4008fb:	00 00 00 00 
  4008ff:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400906:	00 00 00 00 
  40090a:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400911:	00 00 00 00 
  400915:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40091c:	00 00 00 00 
  400920:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400927:	00 00 00 00 
  40092b:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400932:	00 00 00 00 
  400936:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  40093d:	00 00 00 
            printf("input src path:");
  400940:	48 8d 05 2f 4f 00 00 	lea    rax,[rip+0x4f2f]        # 405876 <b+0x12a>
  400947:	48 89 c7             	mov    rdi,rax
  40094a:	b8 00 00 00 00       	mov    eax,0x0
  40094f:	e8 6c 31 00 00       	call   403ac0 <printf>
            gets(src);
  400954:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  40095b:	48 89 c7             	mov    rdi,rax
  40095e:	e8 fd 0d 00 00       	call   401760 <gets>
            printf("input dst path:");
  400963:	48 8d 05 1c 4f 00 00 	lea    rax,[rip+0x4f1c]        # 405886 <b+0x13a>
  40096a:	48 89 c7             	mov    rdi,rax
  40096d:	b8 00 00 00 00       	mov    eax,0x0
  400972:	e8 49 31 00 00       	call   403ac0 <printf>
            gets(dst);
  400977:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40097e:	48 89 c7             	mov    rdi,rax
  400981:	e8 da 0d 00 00       	call   401760 <gets>
            int stat = rename(src, dst);
  400986:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  40098d:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400994:	48 89 d6             	mov    rsi,rdx
  400997:	48 89 c7             	mov    rdi,rax
  40099a:	e8 4d 0c 00 00       	call   4015ec <rename>
  40099f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
            if (stat < 0) {
  4009a2:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  4009a6:	79 2a                	jns    4009d2 <main+0x997>
                printf("move file/dir %s to %s failed\n", src, dst);
  4009a8:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  4009af:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  4009b6:	48 89 c6             	mov    rsi,rax
  4009b9:	48 8d 05 d8 4e 00 00 	lea    rax,[rip+0x4ed8]        # 405898 <b+0x14c>
  4009c0:	48 89 c7             	mov    rdi,rax
  4009c3:	b8 00 00 00 00       	mov    eax,0x0
  4009c8:	e8 f3 30 00 00       	call   403ac0 <printf>
  4009cd:	e9 2b f8 ff ff       	jmp    4001fd <main+0x1c2>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  4009d2:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  4009d9:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  4009e0:	48 89 c6             	mov    rsi,rax
  4009e3:	48 8d 05 ce 4e 00 00 	lea    rax,[rip+0x4ece]        # 4058b8 <b+0x16c>
  4009ea:	48 89 c7             	mov    rdi,rax
  4009ed:	b8 00 00 00 00       	mov    eax,0x0
  4009f2:	e8 c9 30 00 00       	call   403ac0 <printf>
  4009f7:	e9 01 f8 ff ff       	jmp    4001fd <main+0x1c2>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  4009fc:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400a03:	48 8d 15 ce 4e 00 00 	lea    rdx,[rip+0x4ece]        # 4058d8 <b+0x18c>
  400a0a:	48 89 d6             	mov    rsi,rdx
  400a0d:	48 89 c7             	mov    rdi,rax
  400a10:	e8 7b 0e 00 00       	call   401890 <strcmp>
  400a15:	85 c0                	test   eax,eax
  400a17:	0f 85 e6 01 00 00    	jne    400c03 <main+0xbc8>
            char path[100] = {0};
  400a1d:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  400a24:	00 00 00 00 
  400a28:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400a2f:	00 00 00 00 
  400a33:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400a3a:	00 00 00 00 
  400a3e:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400a45:	00 00 00 00 
  400a49:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400a50:	00 00 00 00 
  400a54:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400a5b:	00 00 00 00 
  400a5f:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400a66:	00 00 00 00 
  400a6a:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400a71:	00 00 00 00 
  400a75:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400a7c:	00 00 00 00 
  400a80:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400a87:	00 00 00 00 
  400a8b:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400a92:	00 00 00 00 
  400a96:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400a9d:	00 00 00 00 
  400aa1:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  400aa8:	00 00 00 
            printf("input path:");
  400aab:	48 8d 05 4c 4d 00 00 	lea    rax,[rip+0x4d4c]        # 4057fe <b+0xb2>
  400ab2:	48 89 c7             	mov    rdi,rax
  400ab5:	b8 00 00 00 00       	mov    eax,0x0
  400aba:	e8 01 30 00 00       	call   403ac0 <printf>
            gets(path);
  400abf:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400ac6:	48 89 c7             	mov    rdi,rax
  400ac9:	e8 92 0c 00 00       	call   401760 <gets>
            int fd = open(path, O_RDONLY);
  400ace:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400ad5:	be 00 00 00 00       	mov    esi,0x0
  400ada:	48 89 c7             	mov    rdi,rax
  400add:	e8 5e 05 00 00       	call   401040 <open>
  400ae2:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
            if (fd < 0) {
  400ae5:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  400ae9:	79 23                	jns    400b0e <main+0xad3>
                printf("open file %s failed\n", path);
  400aeb:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400af2:	48 89 c6             	mov    rsi,rax
  400af5:	48 8d 05 e0 4d 00 00 	lea    rax,[rip+0x4de0]        # 4058dc <b+0x190>
  400afc:	48 89 c7             	mov    rdi,rax
  400aff:	b8 00 00 00 00       	mov    eax,0x0
  400b04:	e8 b7 2f 00 00       	call   403ac0 <printf>
  400b09:	e9 ef f6 ff ff       	jmp    4001fd <main+0x1c2>
            }
            else {
                char buffer[100] = {0};
  400b0e:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  400b15:	00 00 00 00 
  400b19:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400b20:	00 00 00 00 
  400b24:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400b2b:	00 00 00 00 
  400b2f:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400b36:	00 00 00 00 
  400b3a:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400b41:	00 00 00 00 
  400b45:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400b4c:	00 00 00 00 
  400b50:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400b57:	00 00 00 00 
  400b5b:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400b62:	00 00 00 00 
  400b66:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400b6d:	00 00 00 00 
  400b71:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400b78:	00 00 00 00 
  400b7c:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400b83:	00 00 00 00 
  400b87:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400b8e:	00 00 00 00 
  400b92:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400b99:	00 00 00 
                int  len         = 0;
  400b9c:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [rbp-0x40],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400ba3:	eb 1e                	jmp    400bc3 <main+0xb88>
                    printf("%s", buffer);
  400ba5:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400bac:	48 89 c6             	mov    rsi,rax
  400baf:	48 8d 05 3b 4d 00 00 	lea    rax,[rip+0x4d3b]        # 4058f1 <b+0x1a5>
  400bb6:	48 89 c7             	mov    rdi,rax
  400bb9:	b8 00 00 00 00       	mov    eax,0x0
  400bbe:	e8 fd 2e 00 00       	call   403ac0 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400bc3:	48 8d 8d e4 fd ff ff 	lea    rcx,[rbp-0x21c]
  400bca:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  400bcd:	ba 64 00 00 00       	mov    edx,0x64
  400bd2:	48 89 ce             	mov    rsi,rcx
  400bd5:	89 c7                	mov    edi,eax
  400bd7:	e8 84 04 00 00       	call   401060 <read>
  400bdc:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
  400bdf:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  400be3:	7f c0                	jg     400ba5 <main+0xb6a>
                }
                puts("");
  400be5:	48 8d 05 08 4d 00 00 	lea    rax,[rip+0x4d08]        # 4058f4 <b+0x1a8>
  400bec:	48 89 c7             	mov    rdi,rax
  400bef:	e8 0c 0b 00 00       	call   401700 <puts>
                close(fd);
  400bf4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  400bf7:	89 c7                	mov    edi,eax
  400bf9:	e8 52 04 00 00       	call   401050 <close>
  400bfe:	e9 fa f5 ff ff       	jmp    4001fd <main+0x1c2>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400c03:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400c0a:	48 8d 15 e4 4c 00 00 	lea    rdx,[rip+0x4ce4]        # 4058f5 <b+0x1a9>
  400c11:	48 89 d6             	mov    rsi,rdx
  400c14:	48 89 c7             	mov    rdi,rax
  400c17:	e8 74 0c 00 00       	call   401890 <strcmp>
  400c1c:	85 c0                	test   eax,eax
  400c1e:	0f 85 fd 01 00 00    	jne    400e21 <main+0xde6>
            char path[100] = {0};
  400c24:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  400c2b:	00 00 00 00 
  400c2f:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400c36:	00 00 00 00 
  400c3a:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400c41:	00 00 00 00 
  400c45:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400c4c:	00 00 00 00 
  400c50:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400c57:	00 00 00 00 
  400c5b:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400c62:	00 00 00 00 
  400c66:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400c6d:	00 00 00 00 
  400c71:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400c78:	00 00 00 00 
  400c7c:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400c83:	00 00 00 00 
  400c87:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400c8e:	00 00 00 00 
  400c92:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400c99:	00 00 00 00 
  400c9d:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400ca4:	00 00 00 00 
  400ca8:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  400caf:	00 00 00 
            printf("input path:");
  400cb2:	48 8d 05 45 4b 00 00 	lea    rax,[rip+0x4b45]        # 4057fe <b+0xb2>
  400cb9:	48 89 c7             	mov    rdi,rax
  400cbc:	b8 00 00 00 00       	mov    eax,0x0
  400cc1:	e8 fa 2d 00 00       	call   403ac0 <printf>
            gets(path);
  400cc6:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400ccd:	48 89 c7             	mov    rdi,rax
  400cd0:	e8 8b 0a 00 00       	call   401760 <gets>
            int fd = open(path, O_WRONLY);
  400cd5:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400cdc:	be 01 00 00 00       	mov    esi,0x1
  400ce1:	48 89 c7             	mov    rdi,rax
  400ce4:	e8 57 03 00 00       	call   401040 <open>
  400ce9:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if (fd < 0) {
  400cec:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  400cf0:	79 23                	jns    400d15 <main+0xcda>
                printf("open file %s failed\n", path);
  400cf2:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400cf9:	48 89 c6             	mov    rsi,rax
  400cfc:	48 8d 05 d9 4b 00 00 	lea    rax,[rip+0x4bd9]        # 4058dc <b+0x190>
  400d03:	48 89 c7             	mov    rdi,rax
  400d06:	b8 00 00 00 00       	mov    eax,0x0
  400d0b:	e8 b0 2d 00 00       	call   403ac0 <printf>
  400d10:	e9 e8 f4 ff ff       	jmp    4001fd <main+0x1c2>
            }
            else {
                char buffer[100] = {0};
  400d15:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  400d1c:	00 00 00 00 
  400d20:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400d27:	00 00 00 00 
  400d2b:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400d32:	00 00 00 00 
  400d36:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400d3d:	00 00 00 00 
  400d41:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400d48:	00 00 00 00 
  400d4c:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400d53:	00 00 00 00 
  400d57:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400d5e:	00 00 00 00 
  400d62:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400d69:	00 00 00 00 
  400d6d:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400d74:	00 00 00 00 
  400d78:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400d7f:	00 00 00 00 
  400d83:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400d8a:	00 00 00 00 
  400d8e:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400d95:	00 00 00 00 
  400d99:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400da0:	00 00 00 
                printf("input content:");
  400da3:	48 8d 05 51 4b 00 00 	lea    rax,[rip+0x4b51]        # 4058fb <b+0x1af>
  400daa:	48 89 c7             	mov    rdi,rax
  400dad:	b8 00 00 00 00       	mov    eax,0x0
  400db2:	e8 09 2d 00 00       	call   403ac0 <printf>
                gets(buffer);
  400db7:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400dbe:	48 89 c7             	mov    rdi,rax
  400dc1:	e8 9a 09 00 00       	call   401760 <gets>
                int len = strlen(buffer);
  400dc6:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400dcd:	48 89 c7             	mov    rdi,rax
  400dd0:	e8 0b 0b 00 00       	call   4018e0 <strlen>
  400dd5:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                write(fd, buffer, len);
  400dd8:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400ddb:	48 63 d0             	movsxd rdx,eax
  400dde:	48 8d 8d e4 fd ff ff 	lea    rcx,[rbp-0x21c]
  400de5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400de8:	48 89 ce             	mov    rsi,rcx
  400deb:	89 c7                	mov    edi,eax
  400ded:	e8 7e 02 00 00       	call   401070 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400df2:	48 8d 95 80 fd ff ff 	lea    rdx,[rbp-0x280]
  400df9:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400dfc:	89 c6                	mov    esi,eax
  400dfe:	48 8d 05 0b 4b 00 00 	lea    rax,[rip+0x4b0b]        # 405910 <b+0x1c4>
  400e05:	48 89 c7             	mov    rdi,rax
  400e08:	b8 00 00 00 00       	mov    eax,0x0
  400e0d:	e8 ae 2c 00 00       	call   403ac0 <printf>
                close(fd);
  400e12:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400e15:	89 c7                	mov    edi,eax
  400e17:	e8 34 02 00 00       	call   401050 <close>
  400e1c:	e9 dc f3 ff ff       	jmp    4001fd <main+0x1c2>
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
  400e21:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400e28:	48 8d 15 04 4b 00 00 	lea    rdx,[rip+0x4b04]        # 405933 <b+0x1e7>
  400e2f:	48 89 d6             	mov    rsi,rdx
  400e32:	48 89 c7             	mov    rdi,rax
  400e35:	e8 56 0a 00 00       	call   401890 <strcmp>
  400e3a:	85 c0                	test   eax,eax
  400e3c:	75 79                	jne    400eb7 <main+0xe7c>
  400e3e:	48 c7 45 98 29 00 00 	mov    QWORD PTR [rbp-0x68],0x29
  400e45:	00 
  400e46:	48 c7 45 90 01 00 00 	mov    QWORD PTR [rbp-0x70],0x1
  400e4d:	00 
  400e4e:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400e55:	00 
  400e56:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400e5d:	00 
  400e5e:	48 c7 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],0x0
  400e65:	00 00 00 00 
  400e69:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400e70:	00 00 00 00 
  400e74:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  400e7b:	00 00 00 00 
typedef int (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
  400e7f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  400e83:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  400e87:	48 8b 75 88          	mov    rsi,QWORD PTR [rbp-0x78]
  400e8b:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  400e8f:	4c 8b 85 78 ff ff ff 	mov    r8,QWORD PTR [rbp-0x88]
  400e96:	4c 8b 8d 70 ff ff ff 	mov    r9,QWORD PTR [rbp-0x90]
  400e9d:	48 89 cf             	mov    rdi,rcx
  400ea0:	4c 8b 95 68 fe ff ff 	mov    r10,QWORD PTR [rbp-0x198]
  400ea7:	48 0f 05             	rex.W syscall 
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
  400eaa:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  400eaf:	48 89 c3             	mov    rbx,rax
    return ret;
  400eb2:	e9 c7 00 00 00       	jmp    400f7e <main+0xf43>
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
  400eb7:	48 8d 05 7c 4a 00 00 	lea    rax,[rip+0x4a7c]        # 40593a <b+0x1ee>
  400ebe:	48 89 c7             	mov    rdi,rax
  400ec1:	b8 00 00 00 00       	mov    eax,0x0
  400ec6:	e8 f5 2b 00 00       	call   403ac0 <printf>
            int pid = 0;
  400ecb:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [rbp-0x30],0x0
            if ((pid = fork()) == 0) {
  400ed2:	e8 69 02 00 00       	call   401140 <fork>
  400ed7:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
  400eda:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  400ede:	75 5c                	jne    400f3c <main+0xf01>
                printf("forked, ready to execve\n");
  400ee0:	48 8d 05 69 4a 00 00 	lea    rax,[rip+0x4a69]        # 405950 <b+0x204>
  400ee7:	48 89 c7             	mov    rdi,rax
  400eea:	b8 00 00 00 00       	mov    eax,0x0
  400eef:	e8 cc 2b 00 00       	call   403ac0 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400ef4:	48 8b 95 68 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x298]
  400efb:	48 8b 8d 70 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x290]
  400f02:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400f09:	48 89 ce             	mov    rsi,rcx
  400f0c:	48 89 c7             	mov    rdi,rax
  400f0f:	e8 3c 02 00 00       	call   401150 <execve>
  400f14:	83 f8 ff             	cmp    eax,0xffffffff
  400f17:	75 23                	jne    400f3c <main+0xf01>
                    printf("cannot find file:%s\n", cmd);
  400f19:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  400f20:	48 89 c6             	mov    rsi,rax
  400f23:	48 8d 05 3f 4a 00 00 	lea    rax,[rip+0x4a3f]        # 405969 <b+0x21d>
  400f2a:	48 89 c7             	mov    rdi,rax
  400f2d:	b8 00 00 00 00       	mov    eax,0x0
  400f32:	e8 89 2b 00 00       	call   403ac0 <printf>
  400f37:	e9 c1 f2 ff ff       	jmp    4001fd <main+0x1c2>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  400f3c:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400f3f:	89 c6                	mov    esi,eax
  400f41:	48 8d 05 36 4a 00 00 	lea    rax,[rip+0x4a36]        # 40597e <b+0x232>
  400f48:	48 89 c7             	mov    rdi,rax
  400f4b:	b8 00 00 00 00       	mov    eax,0x0
  400f50:	e8 6b 2b 00 00       	call   403ac0 <printf>
            int loc = 0;
  400f55:	c7 85 64 fe ff ff 00 	mov    DWORD PTR [rbp-0x19c],0x0
  400f5c:	00 00 00 

            waitpid(pid, &loc, 0);
  400f5f:	48 8d 8d 64 fe ff ff 	lea    rcx,[rbp-0x19c]
  400f66:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400f69:	ba 00 00 00 00       	mov    edx,0x0
  400f6e:	48 89 ce             	mov    rsi,rcx
  400f71:	89 c7                	mov    edi,eax
  400f73:	e8 e8 01 00 00       	call   401160 <waitpid>
  400f78:	e9 80 f2 ff ff       	jmp    4001fd <main+0x1c2>
                continue;
  400f7d:	90                   	nop
    while (1) {
  400f7e:	e9 7a f2 ff ff       	jmp    4001fd <main+0x1c2>
            break;
  400f83:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400f84:	b8 00 00 00 00       	mov    eax,0x0
  400f89:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  400f8d:	c9                   	leave  
  400f8e:	c3                   	ret    
  400f8f:	90                   	nop

0000000000400f90 <reg_dev>:
  400f90:	55                   	push   rbp
  400f91:	48 89 e5             	mov    rbp,rsp
  400f94:	b8 00 00 00 00       	mov    eax,0x0
  400f99:	55                   	push   rbp
  400f9a:	48 0f 05             	rex.W syscall 
  400f9d:	5d                   	pop    rbp
  400f9e:	c9                   	leave  
  400f9f:	c3                   	ret    

0000000000400fa0 <dispose_dev>:
  400fa0:	55                   	push   rbp
  400fa1:	48 89 e5             	mov    rbp,rsp
  400fa4:	b8 01 00 00 00       	mov    eax,0x1
  400fa9:	55                   	push   rbp
  400faa:	48 0f 05             	rex.W syscall 
  400fad:	5d                   	pop    rbp
  400fae:	c9                   	leave  
  400faf:	c3                   	ret    

0000000000400fb0 <reg_drv>:
  400fb0:	55                   	push   rbp
  400fb1:	48 89 e5             	mov    rbp,rsp
  400fb4:	b8 02 00 00 00       	mov    eax,0x2
  400fb9:	55                   	push   rbp
  400fba:	48 0f 05             	rex.W syscall 
  400fbd:	5d                   	pop    rbp
  400fbe:	c9                   	leave  
  400fbf:	c3                   	ret    

0000000000400fc0 <dispose_drv>:
  400fc0:	55                   	push   rbp
  400fc1:	48 89 e5             	mov    rbp,rsp
  400fc4:	b8 03 00 00 00       	mov    eax,0x3
  400fc9:	55                   	push   rbp
  400fca:	48 0f 05             	rex.W syscall 
  400fcd:	5d                   	pop    rbp
  400fce:	c9                   	leave  
  400fcf:	c3                   	ret    

0000000000400fd0 <call_drvfunc>:
  400fd0:	55                   	push   rbp
  400fd1:	48 89 e5             	mov    rbp,rsp
  400fd4:	b8 04 00 00 00       	mov    eax,0x4
  400fd9:	55                   	push   rbp
  400fda:	48 0f 05             	rex.W syscall 
  400fdd:	5d                   	pop    rbp
  400fde:	c9                   	leave  
  400fdf:	c3                   	ret    

0000000000400fe0 <req_mem>:
  400fe0:	55                   	push   rbp
  400fe1:	48 89 e5             	mov    rbp,rsp
  400fe4:	b8 05 00 00 00       	mov    eax,0x5
  400fe9:	55                   	push   rbp
  400fea:	48 0f 05             	rex.W syscall 
  400fed:	5d                   	pop    rbp
  400fee:	c9                   	leave  
  400fef:	c3                   	ret    

0000000000400ff0 <free_mem>:
  400ff0:	55                   	push   rbp
  400ff1:	48 89 e5             	mov    rbp,rsp
  400ff4:	b8 06 00 00 00       	mov    eax,0x6
  400ff9:	55                   	push   rbp
  400ffa:	48 0f 05             	rex.W syscall 
  400ffd:	5d                   	pop    rbp
  400ffe:	c9                   	leave  
  400fff:	c3                   	ret    

0000000000401000 <reg_proc>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	b8 07 00 00 00       	mov    eax,0x7
  401009:	55                   	push   rbp
  40100a:	48 0f 05             	rex.W syscall 
  40100d:	5d                   	pop    rbp
  40100e:	c9                   	leave  
  40100f:	c3                   	ret    

0000000000401010 <del_proc>:
  401010:	55                   	push   rbp
  401011:	48 89 e5             	mov    rbp,rsp
  401014:	b8 08 00 00 00       	mov    eax,0x8
  401019:	55                   	push   rbp
  40101a:	48 0f 05             	rex.W syscall 
  40101d:	5d                   	pop    rbp
  40101e:	c9                   	leave  
  40101f:	c3                   	ret    

0000000000401020 <get_proc_addr>:
  401020:	55                   	push   rbp
  401021:	48 89 e5             	mov    rbp,rsp
  401024:	b8 09 00 00 00       	mov    eax,0x9
  401029:	55                   	push   rbp
  40102a:	48 0f 05             	rex.W syscall 
  40102d:	5d                   	pop    rbp
  40102e:	c9                   	leave  
  40102f:	c3                   	ret    

0000000000401030 <chk_vm>:
  401030:	55                   	push   rbp
  401031:	48 89 e5             	mov    rbp,rsp
  401034:	b8 0a 00 00 00       	mov    eax,0xa
  401039:	55                   	push   rbp
  40103a:	48 0f 05             	rex.W syscall 
  40103d:	5d                   	pop    rbp
  40103e:	c9                   	leave  
  40103f:	c3                   	ret    

0000000000401040 <open>:
  401040:	55                   	push   rbp
  401041:	48 89 e5             	mov    rbp,rsp
  401044:	b8 0b 00 00 00       	mov    eax,0xb
  401049:	55                   	push   rbp
  40104a:	48 0f 05             	rex.W syscall 
  40104d:	5d                   	pop    rbp
  40104e:	c9                   	leave  
  40104f:	c3                   	ret    

0000000000401050 <close>:
  401050:	55                   	push   rbp
  401051:	48 89 e5             	mov    rbp,rsp
  401054:	b8 0c 00 00 00       	mov    eax,0xc
  401059:	55                   	push   rbp
  40105a:	48 0f 05             	rex.W syscall 
  40105d:	5d                   	pop    rbp
  40105e:	c9                   	leave  
  40105f:	c3                   	ret    

0000000000401060 <read>:
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	b8 0d 00 00 00       	mov    eax,0xd
  401069:	55                   	push   rbp
  40106a:	48 0f 05             	rex.W syscall 
  40106d:	5d                   	pop    rbp
  40106e:	c9                   	leave  
  40106f:	c3                   	ret    

0000000000401070 <write>:
  401070:	55                   	push   rbp
  401071:	48 89 e5             	mov    rbp,rsp
  401074:	b8 0e 00 00 00       	mov    eax,0xe
  401079:	55                   	push   rbp
  40107a:	48 0f 05             	rex.W syscall 
  40107d:	5d                   	pop    rbp
  40107e:	c9                   	leave  
  40107f:	c3                   	ret    

0000000000401080 <seek>:
  401080:	55                   	push   rbp
  401081:	48 89 e5             	mov    rbp,rsp
  401084:	b8 0f 00 00 00       	mov    eax,0xf
  401089:	55                   	push   rbp
  40108a:	48 0f 05             	rex.W syscall 
  40108d:	5d                   	pop    rbp
  40108e:	c9                   	leave  
  40108f:	c3                   	ret    

0000000000401090 <tell>:
  401090:	55                   	push   rbp
  401091:	48 89 e5             	mov    rbp,rsp
  401094:	b8 10 00 00 00       	mov    eax,0x10
  401099:	55                   	push   rbp
  40109a:	48 0f 05             	rex.W syscall 
  40109d:	5d                   	pop    rbp
  40109e:	c9                   	leave  
  40109f:	c3                   	ret    

00000000004010a0 <reg_vol>:
  4010a0:	55                   	push   rbp
  4010a1:	48 89 e5             	mov    rbp,rsp
  4010a4:	b8 11 00 00 00       	mov    eax,0x11
  4010a9:	55                   	push   rbp
  4010aa:	48 0f 05             	rex.W syscall 
  4010ad:	5d                   	pop    rbp
  4010ae:	c9                   	leave  
  4010af:	c3                   	ret    

00000000004010b0 <free_vol>:
  4010b0:	55                   	push   rbp
  4010b1:	48 89 e5             	mov    rbp,rsp
  4010b4:	b8 12 00 00 00       	mov    eax,0x12
  4010b9:	55                   	push   rbp
  4010ba:	48 0f 05             	rex.W syscall 
  4010bd:	5d                   	pop    rbp
  4010be:	c9                   	leave  
  4010bf:	c3                   	ret    

00000000004010c0 <exec>:
  4010c0:	55                   	push   rbp
  4010c1:	48 89 e5             	mov    rbp,rsp
  4010c4:	b8 13 00 00 00       	mov    eax,0x13
  4010c9:	55                   	push   rbp
  4010ca:	48 0f 05             	rex.W syscall 
  4010cd:	5d                   	pop    rbp
  4010ce:	c9                   	leave  
  4010cf:	c3                   	ret    

00000000004010d0 <exit>:
  4010d0:	55                   	push   rbp
  4010d1:	48 89 e5             	mov    rbp,rsp
  4010d4:	b8 14 00 00 00       	mov    eax,0x14
  4010d9:	55                   	push   rbp
  4010da:	48 0f 05             	rex.W syscall 
  4010dd:	5d                   	pop    rbp
  4010de:	c9                   	leave  
  4010df:	c3                   	ret    

00000000004010e0 <abort>:
  4010e0:	55                   	push   rbp
  4010e1:	48 89 e5             	mov    rbp,rsp
  4010e4:	b8 14 00 00 00       	mov    eax,0x14
  4010e9:	55                   	push   rbp
  4010ea:	48 0f 05             	rex.W syscall 
  4010ed:	5d                   	pop    rbp
  4010ee:	c9                   	leave  
  4010ef:	c3                   	ret    

00000000004010f0 <call>:
  4010f0:	55                   	push   rbp
  4010f1:	48 89 e5             	mov    rbp,rsp
  4010f4:	b8 15 00 00 00       	mov    eax,0x15
  4010f9:	55                   	push   rbp
  4010fa:	48 0f 05             	rex.W syscall 
  4010fd:	5d                   	pop    rbp
  4010fe:	c9                   	leave  
  4010ff:	c3                   	ret    

0000000000401100 <mkfifo>:
  401100:	55                   	push   rbp
  401101:	48 89 e5             	mov    rbp,rsp
  401104:	b8 16 00 00 00       	mov    eax,0x16
  401109:	55                   	push   rbp
  40110a:	48 0f 05             	rex.W syscall 
  40110d:	5d                   	pop    rbp
  40110e:	c9                   	leave  
  40110f:	c3                   	ret    

0000000000401110 <brk>:
  401110:	55                   	push   rbp
  401111:	48 89 e5             	mov    rbp,rsp
  401114:	b8 17 00 00 00       	mov    eax,0x17
  401119:	55                   	push   rbp
  40111a:	48 0f 05             	rex.W syscall 
  40111d:	5d                   	pop    rbp
  40111e:	c9                   	leave  
  40111f:	c3                   	ret    

0000000000401120 <find_dev>:
  401120:	55                   	push   rbp
  401121:	48 89 e5             	mov    rbp,rsp
  401124:	b8 19 00 00 00       	mov    eax,0x19
  401129:	55                   	push   rbp
  40112a:	48 0f 05             	rex.W syscall 
  40112d:	5d                   	pop    rbp
  40112e:	c9                   	leave  
  40112f:	c3                   	ret    

0000000000401130 <operate_dev>:
  401130:	55                   	push   rbp
  401131:	48 89 e5             	mov    rbp,rsp
  401134:	b8 1a 00 00 00       	mov    eax,0x1a
  401139:	55                   	push   rbp
  40113a:	48 0f 05             	rex.W syscall 
  40113d:	5d                   	pop    rbp
  40113e:	c9                   	leave  
  40113f:	c3                   	ret    

0000000000401140 <fork>:
  401140:	55                   	push   rbp
  401141:	48 89 e5             	mov    rbp,rsp
  401144:	b8 1b 00 00 00       	mov    eax,0x1b
  401149:	55                   	push   rbp
  40114a:	48 0f 05             	rex.W syscall 
  40114d:	5d                   	pop    rbp
  40114e:	c9                   	leave  
  40114f:	c3                   	ret    

0000000000401150 <execve>:
  401150:	55                   	push   rbp
  401151:	48 89 e5             	mov    rbp,rsp
  401154:	b8 1c 00 00 00       	mov    eax,0x1c
  401159:	55                   	push   rbp
  40115a:	48 0f 05             	rex.W syscall 
  40115d:	5d                   	pop    rbp
  40115e:	c9                   	leave  
  40115f:	c3                   	ret    

0000000000401160 <waitpid>:
  401160:	55                   	push   rbp
  401161:	48 89 e5             	mov    rbp,rsp
  401164:	b8 1d 00 00 00       	mov    eax,0x1d
  401169:	55                   	push   rbp
  40116a:	48 0f 05             	rex.W syscall 
  40116d:	5d                   	pop    rbp
  40116e:	c9                   	leave  
  40116f:	c3                   	ret    

0000000000401170 <mmap>:
  401170:	55                   	push   rbp
  401171:	48 89 e5             	mov    rbp,rsp
  401174:	b8 1e 00 00 00       	mov    eax,0x1e
  401179:	55                   	push   rbp
  40117a:	48 0f 05             	rex.W syscall 
  40117d:	5d                   	pop    rbp
  40117e:	c9                   	leave  
  40117f:	c3                   	ret    

0000000000401180 <munmap>:
  401180:	55                   	push   rbp
  401181:	48 89 e5             	mov    rbp,rsp
  401184:	b8 1f 00 00 00       	mov    eax,0x1f
  401189:	55                   	push   rbp
  40118a:	48 0f 05             	rex.W syscall 
  40118d:	5d                   	pop    rbp
  40118e:	c9                   	leave  
  40118f:	c3                   	ret    

0000000000401190 <mknod>:
  401190:	55                   	push   rbp
  401191:	48 89 e5             	mov    rbp,rsp
  401194:	b8 21 00 00 00       	mov    eax,0x21
  401199:	55                   	push   rbp
  40119a:	48 0f 05             	rex.W syscall 
  40119d:	5d                   	pop    rbp
  40119e:	c9                   	leave  
  40119f:	c3                   	ret    

00000000004011a0 <kb_readc>:
  4011a0:	55                   	push   rbp
  4011a1:	48 89 e5             	mov    rbp,rsp
  4011a4:	b8 64 00 00 00       	mov    eax,0x64
  4011a9:	55                   	push   rbp
  4011aa:	48 0f 05             	rex.W syscall 
  4011ad:	5d                   	pop    rbp
  4011ae:	c9                   	leave  
  4011af:	c3                   	ret    

00000000004011b0 <remove>:
  4011b0:	55                   	push   rbp
  4011b1:	48 89 e5             	mov    rbp,rsp
  4011b4:	b8 22 00 00 00       	mov    eax,0x22
  4011b9:	55                   	push   rbp
  4011ba:	48 0f 05             	rex.W syscall 
  4011bd:	5d                   	pop    rbp
  4011be:	c9                   	leave  
  4011bf:	c3                   	ret    

00000000004011c0 <sbrk>:
  4011c0:	55                   	push   rbp
  4011c1:	48 89 e5             	mov    rbp,rsp
  4011c4:	b8 23 00 00 00       	mov    eax,0x23
  4011c9:	55                   	push   rbp
  4011ca:	48 0f 05             	rex.W syscall 
  4011cd:	5d                   	pop    rbp
  4011ce:	c9                   	leave  
  4011cf:	c3                   	ret    

00000000004011d0 <chkmmap>:
  4011d0:	55                   	push   rbp
  4011d1:	48 89 e5             	mov    rbp,rsp
  4011d4:	b8 24 00 00 00       	mov    eax,0x24
  4011d9:	55                   	push   rbp
  4011da:	48 0f 05             	rex.W syscall 
  4011dd:	5d                   	pop    rbp
  4011de:	c9                   	leave  
  4011df:	c3                   	ret    

00000000004011e0 <_readdir>:
  4011e0:	55                   	push   rbp
  4011e1:	48 89 e5             	mov    rbp,rsp
  4011e4:	b8 25 00 00 00       	mov    eax,0x25
  4011e9:	55                   	push   rbp
  4011ea:	48 0f 05             	rex.W syscall 
  4011ed:	5d                   	pop    rbp
  4011ee:	c9                   	leave  
  4011ef:	c3                   	ret    

00000000004011f0 <create_window>:
  4011f0:	55                   	push   rbp
  4011f1:	48 89 e5             	mov    rbp,rsp
  4011f4:	b8 65 00 00 00       	mov    eax,0x65
  4011f9:	55                   	push   rbp
  4011fa:	48 0f 05             	rex.W syscall 
  4011fd:	5d                   	pop    rbp
  4011fe:	c9                   	leave  
  4011ff:	c3                   	ret    

0000000000401200 <destroy_window>:
  401200:	55                   	push   rbp
  401201:	48 89 e5             	mov    rbp,rsp
  401204:	b8 66 00 00 00       	mov    eax,0x66
  401209:	55                   	push   rbp
  40120a:	48 0f 05             	rex.W syscall 
  40120d:	5d                   	pop    rbp
  40120e:	c9                   	leave  
  40120f:	c3                   	ret    

0000000000401210 <show_window>:
  401210:	55                   	push   rbp
  401211:	48 89 e5             	mov    rbp,rsp
  401214:	b8 67 00 00 00       	mov    eax,0x67
  401219:	55                   	push   rbp
  40121a:	48 0f 05             	rex.W syscall 
  40121d:	5d                   	pop    rbp
  40121e:	c9                   	leave  
  40121f:	c3                   	ret    

0000000000401220 <hide_window>:
  401220:	55                   	push   rbp
  401221:	48 89 e5             	mov    rbp,rsp
  401224:	b8 68 00 00 00       	mov    eax,0x68
  401229:	55                   	push   rbp
  40122a:	48 0f 05             	rex.W syscall 
  40122d:	5d                   	pop    rbp
  40122e:	c9                   	leave  
  40122f:	c3                   	ret    

0000000000401230 <resize_window>:
  401230:	55                   	push   rbp
  401231:	48 89 e5             	mov    rbp,rsp
  401234:	b8 69 00 00 00       	mov    eax,0x69
  401239:	55                   	push   rbp
  40123a:	48 0f 05             	rex.W syscall 
  40123d:	5d                   	pop    rbp
  40123e:	c9                   	leave  
  40123f:	c3                   	ret    

0000000000401240 <move_window>:
  401240:	55                   	push   rbp
  401241:	48 89 e5             	mov    rbp,rsp
  401244:	b8 6a 00 00 00       	mov    eax,0x6a
  401249:	55                   	push   rbp
  40124a:	48 0f 05             	rex.W syscall 
  40124d:	5d                   	pop    rbp
  40124e:	c9                   	leave  
  40124f:	c3                   	ret    

0000000000401250 <set_window_text>:
  401250:	55                   	push   rbp
  401251:	48 89 e5             	mov    rbp,rsp
  401254:	b8 6b 00 00 00       	mov    eax,0x6b
  401259:	55                   	push   rbp
  40125a:	48 0f 05             	rex.W syscall 
  40125d:	5d                   	pop    rbp
  40125e:	c9                   	leave  
  40125f:	c3                   	ret    

0000000000401260 <attach_window>:
  401260:	55                   	push   rbp
  401261:	48 89 e5             	mov    rbp,rsp
  401264:	b8 6c 00 00 00       	mov    eax,0x6c
  401269:	55                   	push   rbp
  40126a:	48 0f 05             	rex.W syscall 
  40126d:	5d                   	pop    rbp
  40126e:	c9                   	leave  
  40126f:	c3                   	ret    

0000000000401270 <detach_window>:
  401270:	55                   	push   rbp
  401271:	48 89 e5             	mov    rbp,rsp
  401274:	b8 6d 00 00 00       	mov    eax,0x6d
  401279:	55                   	push   rbp
  40127a:	48 0f 05             	rex.W syscall 
  40127d:	5d                   	pop    rbp
  40127e:	c9                   	leave  
  40127f:	c3                   	ret    

0000000000401280 <add_window_event_listener>:
  401280:	55                   	push   rbp
  401281:	48 89 e5             	mov    rbp,rsp
  401284:	b8 6e 00 00 00       	mov    eax,0x6e
  401289:	55                   	push   rbp
  40128a:	48 0f 05             	rex.W syscall 
  40128d:	5d                   	pop    rbp
  40128e:	c9                   	leave  
  40128f:	c3                   	ret    

0000000000401290 <remove_window_event_listener>:
  401290:	55                   	push   rbp
  401291:	48 89 e5             	mov    rbp,rsp
  401294:	b8 6f 00 00 00       	mov    eax,0x6f
  401299:	55                   	push   rbp
  40129a:	48 0f 05             	rex.W syscall 
  40129d:	5d                   	pop    rbp
  40129e:	c9                   	leave  
  40129f:	c3                   	ret    

00000000004012a0 <send_window_event>:
  4012a0:	55                   	push   rbp
  4012a1:	48 89 e5             	mov    rbp,rsp
  4012a4:	b8 70 00 00 00       	mov    eax,0x70
  4012a9:	55                   	push   rbp
  4012aa:	48 0f 05             	rex.W syscall 
  4012ad:	5d                   	pop    rbp
  4012ae:	c9                   	leave  
  4012af:	c3                   	ret    

00000000004012b0 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  4012b0:	f3 0f 1e fa          	endbr64 
  4012b4:	55                   	push   rbp
  4012b5:	48 89 e5             	mov    rbp,rsp
  4012b8:	48 83 ec 20          	sub    rsp,0x20
  4012bc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  4012c0:	bf 20 00 00 00       	mov    edi,0x20
  4012c5:	e8 36 33 00 00       	call   404600 <malloc>
  4012ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  4012ce:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  4012d3:	75 0a                	jne    4012df <opendir+0x2f>
	{
		return NULL;
  4012d5:	b8 00 00 00 00       	mov    eax,0x0
  4012da:	e9 a6 00 00 00       	jmp    401385 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  4012df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4012e3:	be 00 40 00 00       	mov    esi,0x4000
  4012e8:	48 89 c7             	mov    rdi,rax
  4012eb:	e8 50 fd ff ff       	call   401040 <open>
  4012f0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4012f4:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  4012f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4012fa:	8b 00                	mov    eax,DWORD PTR [rax]
  4012fc:	85 c0                	test   eax,eax
  4012fe:	79 13                	jns    401313 <opendir+0x63>
	{
		free(dirp);
  401300:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401304:	48 89 c7             	mov    rdi,rax
  401307:	e8 f4 2c 00 00       	call   404000 <free>
		return NULL;
  40130c:	b8 00 00 00 00       	mov    eax,0x0
  401311:	eb 72                	jmp    401385 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  401313:	bf 00 04 00 00       	mov    edi,0x400
  401318:	e8 e3 32 00 00       	call   404600 <malloc>
  40131d:	48 89 c2             	mov    rdx,rax
  401320:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401324:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  401328:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40132c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401330:	48 85 c0             	test   rax,rax
  401333:	75 20                	jne    401355 <opendir+0xa5>
	{
		close(dirp->fd);
  401335:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401339:	8b 00                	mov    eax,DWORD PTR [rax]
  40133b:	89 c7                	mov    edi,eax
  40133d:	e8 0e fd ff ff       	call   401050 <close>
		free(dirp);
  401342:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401346:	48 89 c7             	mov    rdi,rax
  401349:	e8 b2 2c 00 00       	call   404000 <free>
		return NULL;
  40134e:	b8 00 00 00 00       	mov    eax,0x0
  401353:	eb 30                	jmp    401385 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  401355:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401359:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  401360:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401364:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  40136b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40136f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  401376:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40137a:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  401381:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  401385:	c9                   	leave  
  401386:	c3                   	ret    

0000000000401387 <closedir>:

int closedir(DIR* dirp)
{
  401387:	f3 0f 1e fa          	endbr64 
  40138b:	55                   	push   rbp
  40138c:	48 89 e5             	mov    rbp,rsp
  40138f:	48 83 ec 50          	sub    rsp,0x50
  401393:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  401397:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40139c:	75 0a                	jne    4013a8 <closedir+0x21>
	{
		return -1;
  40139e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4013a3:	e9 88 00 00 00       	jmp    401430 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  4013a8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4013ac:	8b 00                	mov    eax,DWORD PTR [rax]
  4013ae:	48 98                	cdqe   
  4013b0:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  4013b7:	00 
  4013b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4013bc:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4013c3:	00 
  4013c4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4013cb:	00 
  4013cc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4013d3:	00 
  4013d4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4013db:	00 
  4013dc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4013e3:	00 
#define SYSCALL_DRV_IOCTL 40
#define SYSCALL_REBOOT 41
#define SYSCALL_GETCWD 42
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  4013e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013e8:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4013ec:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4013f0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4013f4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4013f8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4013fc:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401400:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  401403:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40140a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40140b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  40140f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401413:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401417:	48 89 c7             	mov    rdi,rax
  40141a:	e8 e1 2b 00 00       	call   404000 <free>
	free(dirp);
  40141f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401423:	48 89 c7             	mov    rdi,rax
  401426:	e8 d5 2b 00 00       	call   404000 <free>
	return 0;
  40142b:	b8 00 00 00 00       	mov    eax,0x0
}
  401430:	c9                   	leave  
  401431:	c3                   	ret    

0000000000401432 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  401432:	f3 0f 1e fa          	endbr64 
  401436:	55                   	push   rbp
  401437:	48 89 e5             	mov    rbp,rsp
  40143a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  40143e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401442:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401446:	48 89 c2             	mov    rdx,rax
  401449:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40144d:	8b 00                	mov    eax,DWORD PTR [rax]
  40144f:	48 98                	cdqe   
  401451:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  401458:	00 
  401459:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40145d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401461:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401468:	00 
  401469:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401470:	00 
  401471:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401478:	00 
  401479:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401480:	00 
        __asm__ volatile(".byte 0x48\n"
  401481:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401485:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401489:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40148d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401491:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401495:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401499:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40149d:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4014a0:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014a7:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4014a8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4014ac:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4014b0:	85 c0                	test   eax,eax
  4014b2:	79 12                	jns    4014c6 <readdir+0x94>
	{
		dirp->eof = 1;
  4014b4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014b8:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  4014bf:	b8 00 00 00 00       	mov    eax,0x0
  4014c4:	eb 08                	jmp    4014ce <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  4014c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014ca:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  4014ce:	5d                   	pop    rbp
  4014cf:	c3                   	ret    

00000000004014d0 <chdir>:
int chdir(const char* name)
{
  4014d0:	f3 0f 1e fa          	endbr64 
  4014d4:	55                   	push   rbp
  4014d5:	48 89 e5             	mov    rbp,rsp
  4014d8:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  4014dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014e0:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  4014e7:	00 
  4014e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4014ec:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4014f3:	00 
  4014f4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4014fb:	00 
  4014fc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401503:	00 
  401504:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40150b:	00 
  40150c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401513:	00 
        __asm__ volatile(".byte 0x48\n"
  401514:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401518:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40151c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401520:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401524:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401528:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40152c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401530:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401533:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40153a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40153b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40153f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401543:	5d                   	pop    rbp
  401544:	c3                   	ret    

0000000000401545 <creat>:
int creat(const char* name, mode_t mode)
{
  401545:	f3 0f 1e fa          	endbr64 
  401549:	55                   	push   rbp
  40154a:	48 89 e5             	mov    rbp,rsp
  40154d:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401551:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
	return do_syscall(SYSCALL_OPEN, (long long)name,
  401554:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  401557:	83 c8 41             	or     eax,0x41
  40155a:	48 98                	cdqe   
  40155c:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401560:	48 c7 45 f8 0b 00 00 	mov    QWORD PTR [rbp-0x8],0xb
  401567:	00 
  401568:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  40156c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401570:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401577:	00 
  401578:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40157f:	00 
  401580:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401587:	00 
  401588:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40158f:	00 
        __asm__ volatile(".byte 0x48\n"
  401590:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401594:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401598:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40159c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4015a0:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4015a4:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4015a8:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4015ac:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4015af:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4015b6:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4015b7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4015bb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
					  (long long)O_CREAT | (long long)O_WRONLY | (long long)mode, 0, 0, 0, 0);
}
  4015bf:	5d                   	pop    rbp
  4015c0:	c3                   	ret    

00000000004015c1 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  4015c1:	f3 0f 1e fa          	endbr64 
  4015c5:	55                   	push   rbp
  4015c6:	48 89 e5             	mov    rbp,rsp
  4015c9:	48 83 ec 10          	sub    rsp,0x10
  4015cd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  4015d1:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
	return creat(path, mode | O_DIRECTORY);
  4015d4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4015d7:	80 cc 40             	or     ah,0x40
  4015da:	89 c2                	mov    edx,eax
  4015dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4015e0:	89 d6                	mov    esi,edx
  4015e2:	48 89 c7             	mov    rdi,rax
  4015e5:	e8 5b ff ff ff       	call   401545 <creat>
}
  4015ea:	c9                   	leave  
  4015eb:	c3                   	ret    

00000000004015ec <rename>:
int rename(const char* oldpath, const char* newpath)
{
  4015ec:	f3 0f 1e fa          	endbr64 
  4015f0:	55                   	push   rbp
  4015f1:	48 89 e5             	mov    rbp,rsp
  4015f4:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  4015f8:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  4015fc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401600:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401604:	48 c7 45 f8 27 00 00 	mov    QWORD PTR [rbp-0x8],0x27
  40160b:	00 
  40160c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  401610:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401614:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40161b:	00 
  40161c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401623:	00 
  401624:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40162b:	00 
  40162c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401633:	00 
        __asm__ volatile(".byte 0x48\n"
  401634:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401638:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40163c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401640:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401644:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401648:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40164c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401650:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401653:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40165a:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40165b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40165f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401663:	5d                   	pop    rbp
  401664:	c3                   	ret    

0000000000401665 <getcwd>:
char* getcwd(char* buf, size_t size)
{
  401665:	f3 0f 1e fa          	endbr64 
  401669:	55                   	push   rbp
  40166a:	48 89 e5             	mov    rbp,rsp
  40166d:	48 83 ec 50          	sub    rsp,0x50
  401671:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401675:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	if(!buf)
  401679:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40167e:	75 10                	jne    401690 <getcwd+0x2b>
	{
		buf = malloc(size);
  401680:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401684:	48 89 c7             	mov    rdi,rax
  401687:	e8 74 2f 00 00       	call   404600 <malloc>
  40168c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	}
	return (char*)do_syscall(SYSCALL_GETCWD, (long long)buf, (long long)size, 0, 0, 0, 0);
  401690:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401694:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401698:	48 c7 45 f8 2a 00 00 	mov    QWORD PTR [rbp-0x8],0x2a
  40169f:	00 
  4016a0:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  4016a4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4016a8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4016af:	00 
  4016b0:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4016b7:	00 
  4016b8:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4016bf:	00 
  4016c0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4016c7:	00 
        __asm__ volatile(".byte 0x48\n"
  4016c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4016cc:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4016d0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4016d4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4016d8:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4016dc:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4016e0:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4016e4:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4016e7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4016ee:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4016ef:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4016f3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4016f7:	48 98                	cdqe   
  4016f9:	c9                   	leave  
  4016fa:	c3                   	ret    

Disassembly of section .text.puts:

0000000000401700 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  401700:	f3 0f 1e fa          	endbr64 
  401704:	41 54                	push   r12
  401706:	55                   	push   rbp
  401707:	48 89 fd             	mov    rbp,rdi
  40170a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  40170b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40170e:	40 84 ff             	test   dil,dil
  401711:	74 35                	je     401748 <puts+0x48>
  401713:	31 db                	xor    ebx,ebx
  401715:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  401718:	e8 03 26 00 00       	call   403d20 <putchar>
  40171d:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  401720:	48 83 c3 01          	add    rbx,0x1
  401724:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401729:	40 84 ff             	test   dil,dil
  40172c:	75 ea                	jne    401718 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  40172e:	bf 0a 00 00 00       	mov    edi,0xa
  401733:	e8 e8 25 00 00       	call   403d20 <putchar>
		r++;
  401738:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  40173d:	5b                   	pop    rbx
  40173e:	5d                   	pop    rbp
  40173f:	41 5c                	pop    r12
  401741:	c3                   	ret    
  401742:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401748:	5b                   	pop    rbx
	return r ? r : EOF;
  401749:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  40174e:	5d                   	pop    rbp
  40174f:	41 5c                	pop    r12
  401751:	c3                   	ret    

Disassembly of section .text.gets:

0000000000401760 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  401760:	f3 0f 1e fa          	endbr64 
  401764:	41 54                	push   r12
  401766:	49 89 fc             	mov    r12,rdi
	*str = 0;
  401769:	c6 07 00             	mov    BYTE PTR [rdi],0x0
  40176c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	while(1)
	{
		read(1, str, 1);
  401770:	ba 01 00 00 00       	mov    edx,0x1
  401775:	4c 89 e6             	mov    rsi,r12
  401778:	bf 01 00 00 00       	mov    edi,0x1
  40177d:	31 c0                	xor    eax,eax
  40177f:	e8 dc f8 ff ff       	call   401060 <read>
		if(!*str)
  401784:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  401789:	84 c0                	test   al,al
  40178b:	74 e3                	je     401770 <gets+0x10>
		{
			continue;
		}
		if(*str == '\n')
  40178d:	3c 0a                	cmp    al,0xa
  40178f:	74 1f                	je     4017b0 <gets+0x50>
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  401791:	3c 08                	cmp    al,0x8
  401793:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  401798:	4c 0f 44 e2          	cmove  r12,rdx
		}
		*++str = 0;
  40179c:	41 c6 44 24 01 00    	mov    BYTE PTR [r12+0x1],0x0
  4017a2:	49 83 c4 01          	add    r12,0x1
  4017a6:	eb c8                	jmp    401770 <gets+0x10>
  4017a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4017af:	00 
	}
	return str;
  4017b0:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  4017b3:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  4017b8:	41 5c                	pop    r12
  4017ba:	c3                   	ret    

Disassembly of section .text.memset:

00000000004017c0 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  4017c0:	f3 0f 1e fa          	endbr64 
  4017c4:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  4017c7:	48 85 d2             	test   rdx,rdx
  4017ca:	74 77                	je     401843 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  4017cc:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  4017d1:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  4017d4:	48 83 fa 02          	cmp    rdx,0x2
  4017d8:	76 69                	jbe    401843 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  4017da:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  4017df:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  4017e3:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  4017e8:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  4017ec:	48 83 fa 06          	cmp    rdx,0x6
  4017f0:	76 51                	jbe    401843 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  4017f2:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  4017f7:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  4017fb:	48 83 fa 08          	cmp    rdx,0x8
  4017ff:	76 42                	jbe    401843 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401801:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401804:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401808:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40180b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40180e:	45 89 c1             	mov    r9d,r8d
	s += k;
  401811:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  401815:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401818:	44 89 c7             	mov    edi,r8d
  40181b:	41 c1 e1 10          	shl    r9d,0x10
  40181f:	c1 e7 08             	shl    edi,0x8
  401822:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401826:	44 09 cf             	or     edi,r9d
  401829:	48 01 ca             	add    rdx,rcx
  40182c:	44 09 c7             	or     edi,r8d
  40182f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  401831:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  401838:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  40183a:	48 83 c1 04          	add    rcx,0x4
  40183e:	48 39 ca             	cmp    rdx,rcx
  401841:	75 f5                	jne    401838 <memset+0x78>
	}

	return dest;
}
  401843:	c3                   	ret    

Disassembly of section .text.strcat:

0000000000401850 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  401850:	f3 0f 1e fa          	endbr64 
  401854:	41 54                	push   r12
  401856:	49 89 fc             	mov    r12,rdi
  401859:	55                   	push   rbp
  40185a:	48 89 f5             	mov    rbp,rsi
  40185d:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  40185e:	e8 7d 00 00 00       	call   4018e0 <strlen>
	const size_t srclen = strlen(src);
  401863:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  401866:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  401869:	e8 72 00 00 00       	call   4018e0 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  40186e:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  401872:	48 89 ee             	mov    rsi,rbp
  401875:	48 8d 50 01          	lea    rdx,[rax+0x1]
  401879:	e8 c2 2d 00 00       	call   404640 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  40187e:	4c 89 e0             	mov    rax,r12
  401881:	5b                   	pop    rbx
  401882:	5d                   	pop    rbp
  401883:	41 5c                	pop    r12
  401885:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000401890 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  401890:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  401894:	48 39 f7             	cmp    rdi,rsi
  401897:	74 34                	je     4018cd <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  401899:	48 85 ff             	test   rdi,rdi
  40189c:	74 38                	je     4018d6 <strcmp+0x46>
  40189e:	48 85 f6             	test   rsi,rsi
  4018a1:	74 33                	je     4018d6 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  4018a3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4018a6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4018a9:	38 ca                	cmp    dl,cl
  4018ab:	75 23                	jne    4018d0 <strcmp+0x40>
  4018ad:	b8 01 00 00 00       	mov    eax,0x1
  4018b2:	eb 15                	jmp    4018c9 <strcmp+0x39>
  4018b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4018b8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4018bc:	48 83 c0 01          	add    rax,0x1
  4018c0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4018c5:	38 ca                	cmp    dl,cl
  4018c7:	75 07                	jne    4018d0 <strcmp+0x40>
		{
			if(*s1 == 0)
  4018c9:	84 d2                	test   dl,dl
  4018cb:	75 eb                	jne    4018b8 <strcmp+0x28>
		return 0;
  4018cd:	31 c0                	xor    eax,eax
  4018cf:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  4018d0:	0f be c2             	movsx  eax,dl
  4018d3:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  4018d5:	c3                   	ret    
	int r = -1;
  4018d6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4018db:	c3                   	ret    

Disassembly of section .text.strlen:

00000000004018e0 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  4018e0:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  4018e4:	48 89 fe             	mov    rsi,rdi
  4018e7:	40 f6 c7 07          	test   dil,0x7
  4018eb:	75 0d                	jne    4018fa <strlen+0x1a>
  4018ed:	eb 21                	jmp    401910 <strlen+0x30>
  4018ef:	90                   	nop
  4018f0:	48 83 c7 01          	add    rdi,0x1
  4018f4:	40 f6 c7 07          	test   dil,0x7
  4018f8:	74 16                	je     401910 <strlen+0x30>
	{
		if(*p == '\0')
  4018fa:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4018fd:	75 f1                	jne    4018f0 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  4018ff:	48 89 f8             	mov    rax,rdi
  401902:	48 29 f0             	sub    rax,rsi
  401905:	c3                   	ret    
  401906:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40190d:	00 00 00 
		if((*lp - mask01) & mask80)
  401910:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401917:	fe fe fe 
  40191a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401921:	80 80 80 
  401924:	eb 38                	jmp    40195e <strlen+0x7e>
  401926:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40192d:	00 00 00 
			testbyte(1);
  401930:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  401934:	74 3a                	je     401970 <strlen+0x90>
			testbyte(2);
  401936:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  40193a:	74 3c                	je     401978 <strlen+0x98>
			testbyte(3);
  40193c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  401940:	74 3e                	je     401980 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  401942:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  401946:	74 40                	je     401988 <strlen+0xa8>
			testbyte(5);
  401948:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  40194c:	74 42                	je     401990 <strlen+0xb0>
			testbyte(6);
  40194e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  401952:	74 44                	je     401998 <strlen+0xb8>
			testbyte(7);
  401954:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  401958:	74 46                	je     4019a0 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  40195a:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  40195e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401961:	48 01 c8             	add    rax,rcx
  401964:	48 85 d0             	test   rax,rdx
  401967:	74 f1                	je     40195a <strlen+0x7a>
			testbyte(0);
  401969:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40196c:	75 c2                	jne    401930 <strlen+0x50>
  40196e:	eb 8f                	jmp    4018ff <strlen+0x1f>
			testbyte(1);
  401970:	48 29 f7             	sub    rdi,rsi
  401973:	48 8d 47 01          	lea    rax,[rdi+0x1]
  401977:	c3                   	ret    
			testbyte(2);
  401978:	48 29 f7             	sub    rdi,rsi
  40197b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  40197f:	c3                   	ret    
			testbyte(3);
  401980:	48 29 f7             	sub    rdi,rsi
  401983:	48 8d 47 03          	lea    rax,[rdi+0x3]
  401987:	c3                   	ret    
			testbyte(4);
  401988:	48 29 f7             	sub    rdi,rsi
  40198b:	48 8d 47 04          	lea    rax,[rdi+0x4]
  40198f:	c3                   	ret    
			testbyte(5);
  401990:	48 29 f7             	sub    rdi,rsi
  401993:	48 8d 47 05          	lea    rax,[rdi+0x5]
  401997:	c3                   	ret    
			testbyte(6);
  401998:	48 29 f7             	sub    rdi,rsi
  40199b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  40199f:	c3                   	ret    
			testbyte(7);
  4019a0:	48 29 f7             	sub    rdi,rsi
  4019a3:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  4019a7:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

00000000004019b0 <__libc_init_array>:
	return main(argc, argv);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  4019b0:	f3 0f 1e fa          	endbr64 
  4019b4:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4019b6:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  4019bd:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4019be:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  4019c5:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4019c6:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4019c9:	48 c1 fd 03          	sar    rbp,0x3
  4019cd:	74 16                	je     4019e5 <__libc_init_array+0x35>
  4019cf:	31 db                	xor    ebx,ebx
  4019d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  4019d8:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  4019dc:	48 83 c3 01          	add    rbx,0x1
  4019e0:	48 39 dd             	cmp    rbp,rbx
  4019e3:	75 f3                	jne    4019d8 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  4019e5:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  4019ec:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  4019f3:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4019f6:	48 c1 fd 03          	sar    rbp,0x3
  4019fa:	74 11                	je     401a0d <__libc_init_array+0x5d>
  4019fc:	31 db                	xor    ebx,ebx
  4019fe:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401a00:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401a04:	48 83 c3 01          	add    rbx,0x1
  401a08:	48 39 dd             	cmp    rbp,rbx
  401a0b:	75 f3                	jne    401a00 <__libc_init_array+0x50>
	}
}
  401a0d:	5b                   	pop    rbx
  401a0e:	5d                   	pop    rbp
  401a0f:	41 5c                	pop    r12
  401a11:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401a20 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401a20:	f3 0f 1e fa          	endbr64 
  401a24:	55                   	push   rbp
  401a25:	53                   	push   rbx
  401a26:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  401a2a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401a31:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  401a38:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  401a3b:	48 c1 fb 03          	sar    rbx,0x3
  401a3f:	74 14                	je     401a55 <__libc_fini_array+0x35>
  401a41:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  401a48:	48 83 eb 01          	sub    rbx,0x1
  401a4c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  401a50:	48 85 db             	test   rbx,rbx
  401a53:	75 f3                	jne    401a48 <__libc_fini_array+0x28>
	}
}
  401a55:	48 83 c4 08          	add    rsp,0x8
  401a59:	5b                   	pop    rbx
  401a5a:	5d                   	pop    rbp
  401a5b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000401a60 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  401a60:	f3 0f 1e fa          	endbr64 
  401a64:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  401a68:	48 c7 c7 8e 59 40 00 	mov    rdi,0x40598e
  401a6f:	48 c7 c2 94 59 40 00 	mov    rdx,0x405994
  401a76:	31 f6                	xor    esi,esi
  401a78:	48 29 fa             	sub    rdx,rdi
  401a7b:	e8 40 fd ff ff       	call   4017c0 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  401a80:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  401a84:	e9 27 ff ff ff       	jmp    4019b0 <__libc_init_array>

Disassembly of section .text.entry:

0000000000401a90 <entry>:
{
  401a90:	f3 0f 1e fa          	endbr64 
  401a94:	41 54                	push   r12
  401a96:	49 89 f4             	mov    r12,rsi
  401a99:	55                   	push   rbp
  401a9a:	89 fd                	mov    ebp,edi
  401a9c:	53                   	push   rbx
  401a9d:	48 89 d3             	mov    rbx,rdx
	CRTStartup();
  401aa0:	e8 bb ff ff ff       	call   401a60 <CRTStartup>
	environ = _environ;
  401aa5:	48 c7 c0 98 59 40 00 	mov    rax,0x405998
	__heap_base = sbrk(0);
  401aac:	31 ff                	xor    edi,edi
	environ = _environ;
  401aae:	48 89 18             	mov    QWORD PTR [rax],rbx
	__heap_base = sbrk(0);
  401ab1:	31 c0                	xor    eax,eax
  401ab3:	e8 08 f7 ff ff       	call   4011c0 <sbrk>
  401ab8:	48 c7 c2 10 5a 40 00 	mov    rdx,0x405a10
	return main(argc, argv);
  401abf:	4c 89 e6             	mov    rsi,r12
  401ac2:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401ac4:	89 02                	mov    DWORD PTR [rdx],eax
}
  401ac6:	5b                   	pop    rbx
  401ac7:	5d                   	pop    rbp
  401ac8:	41 5c                	pop    r12
	return main(argc, argv);
  401aca:	e9 6c e5 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_bit_access:

0000000000401ad0 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401ad0:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401ad5:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401ae0 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401ae0:	e8 eb ff ff ff       	call   401ad0 <get_bit_access>
  401ae5:	48 c1 e8 3f          	shr    rax,0x3f
}
  401ae9:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401af0 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401af0:	48 89 f8             	mov    rax,rdi
  401af3:	48 c1 e8 34          	shr    rax,0x34
  401af7:	25 ff 07 00 00       	and    eax,0x7ff
  401afc:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401b01:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401b10 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401b10:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401b13:	8d 50 01             	lea    edx,[rax+0x1]
  401b16:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401b19:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  401b1c:	73 22                	jae    401b40 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  401b1e:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401b21:	48 85 d2             	test   rdx,rdx
  401b24:	74 12                	je     401b38 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401b26:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  401b2a:	40 0f be fe          	movsx  edi,sil
  401b2e:	4c 89 c6             	mov    rsi,r8
  401b31:	ff e2                	jmp    rdx
  401b33:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  401b38:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  401b3c:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  401b40:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000401b50 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401b50:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  401b54:	74 0a                	je     401b60 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  401b56:	c3                   	ret    
  401b57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401b5e:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401b60:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  401b63:	85 d2                	test   edx,edx
  401b65:	74 ef                	je     401b56 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  401b67:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  401b6b:	48 85 c9             	test   rcx,rcx
  401b6e:	74 e6                	je     401b56 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  401b70:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401b73:	8d 72 ff             	lea    esi,[rdx-0x1]
  401b76:	39 c2                	cmp    edx,eax
  401b78:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  401b7c:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  401b80:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401b90 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401b90:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401b97:	48 89 f8             	mov    rax,rdi
  return gadget;
  401b9a:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401ba1:	00 
  401ba2:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401ba9:	00 
  401baa:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401bb1:	00 
}
  401bb2:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401bc0 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401bc0:	48 83 ec 28          	sub    rsp,0x28
  401bc4:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401bc7:	48 89 e7             	mov    rdi,rsp
  401bca:	e8 c1 ff ff ff       	call   401b90 <discarding_gadget>
  401bcf:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401bd4:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401bd8:	48 85 f6             	test   rsi,rsi
  401bdb:	74 33                	je     401c10 <buffer_gadget+0x50>
  401bdd:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401be2:	48 39 c2             	cmp    rdx,rax
  401be5:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401be9:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401bed:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401bf2:	4c 89 c0             	mov    rax,r8
  return result;
  401bf5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401bfa:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401c00:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401c04:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401c09:	48 83 c4 28          	add    rsp,0x28
  401c0d:	c3                   	ret    
  401c0e:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401c10:	48 89 ce             	mov    rsi,rcx
  401c13:	eb d4                	jmp    401be9 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401c20 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401c20:	48 83 ec 28          	sub    rsp,0x28
  401c24:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401c27:	48 89 e7             	mov    rdi,rsp
  401c2a:	e8 61 ff ff ff       	call   401b90 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401c2f:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401c33:	4c 89 c0             	mov    rax,r8
  return result;
  401c36:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401c3b:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401c40:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401c47:	7f 
  401c48:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401c4e:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401c52:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401c57:	48 83 c4 28          	add    rsp,0x28
  401c5b:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401c60 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401c60:	48 83 ec 08          	sub    rsp,0x8
  401c64:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401c67:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 402450 <putchar_wrapper>
  401c6e:	31 d2                	xor    edx,edx
  401c70:	e8 ab ff ff ff       	call   401c20 <function_gadget>
}
  401c75:	4c 89 c8             	mov    rax,r9
  401c78:	48 83 c4 08          	add    rsp,0x8
  401c7c:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401c80 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401c80:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401c83:	74 33                	je     401cb8 <strnlen_s_+0x38>
  401c85:	85 f6                	test   esi,esi
  401c87:	74 2f                	je     401cb8 <strnlen_s_+0x38>
  401c89:	89 f6                	mov    esi,esi
  401c8b:	48 89 f8             	mov    rax,rdi
  401c8e:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401c92:	eb 09                	jmp    401c9d <strnlen_s_+0x1d>
  401c94:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401c98:	48 39 c2             	cmp    rdx,rax
  401c9b:	74 13                	je     401cb0 <strnlen_s_+0x30>
  401c9d:	48 83 c0 01          	add    rax,0x1
  401ca1:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401ca4:	75 f2                	jne    401c98 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401ca6:	29 f8                	sub    eax,edi
  401ca8:	c3                   	ret    
  401ca9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401cb0:	89 d0                	mov    eax,edx
  401cb2:	29 f8                	sub    eax,edi
  401cb4:	c3                   	ret    
  401cb5:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401cb8:	31 c0                	xor    eax,eax
}
  401cba:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401cc0 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401cc0:	83 ef 30             	sub    edi,0x30
  401cc3:	40 80 ff 09          	cmp    dil,0x9
  401cc7:	0f 96 c0             	setbe  al
}
  401cca:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401cd0 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401cd0:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401cd3:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401cd6:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401cd9:	eb 19                	jmp    401cf4 <atou_+0x24>
  401cdb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401ce0:	48 83 c2 01          	add    rdx,0x1
  401ce4:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401ce8:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401ceb:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401cef:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401cf4:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401cf7:	e8 c4 ff ff ff       	call   401cc0 <is_digit_>
  401cfc:	84 c0                	test   al,al
  401cfe:	75 e0                	jne    401ce0 <atou_+0x10>
  }
  return i;
}
  401d00:	44 89 c0             	mov    eax,r8d
  401d03:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401d10 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401d10:	41 57                	push   r15
  401d12:	44 89 c0             	mov    eax,r8d
  401d15:	49 89 ff             	mov    r15,rdi
  401d18:	41 56                	push   r14
  401d1a:	41 55                	push   r13
  401d1c:	41 89 d5             	mov    r13d,edx
  401d1f:	41 54                	push   r12
  401d21:	49 89 f4             	mov    r12,rsi
  401d24:	55                   	push   rbp
  401d25:	89 cd                	mov    ebp,ecx
  401d27:	53                   	push   rbx
  401d28:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401d2c:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401d30:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401d35:	a8 03                	test   al,0x3
  401d37:	75 1b                	jne    401d54 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401d39:	39 ca                	cmp    edx,ecx
  401d3b:	73 17                	jae    401d54 <out_rev_+0x44>
  401d3d:	89 d3                	mov    ebx,edx
  401d3f:	90                   	nop
      putchar_via_gadget(output, ' ');
  401d40:	be 20 00 00 00       	mov    esi,0x20
  401d45:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401d48:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401d4b:	e8 c0 fd ff ff       	call   401b10 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401d50:	39 dd                	cmp    ebp,ebx
  401d52:	75 ec                	jne    401d40 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401d54:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401d58:	4c 01 e3             	add    rbx,r12
  401d5b:	45 85 ed             	test   r13d,r13d
  401d5e:	74 17                	je     401d77 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401d60:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401d63:	4c 89 ff             	mov    rdi,r15
  401d66:	e8 a5 fd ff ff       	call   401b10 <putchar_via_gadget>
  while (len) {
  401d6b:	48 89 da             	mov    rdx,rbx
  401d6e:	48 83 eb 01          	sub    rbx,0x1
  401d72:	49 39 d4             	cmp    r12,rdx
  401d75:	75 e9                	jne    401d60 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401d77:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401d7c:	74 2a                	je     401da8 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401d7e:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401d82:	44 29 f2             	sub    edx,r14d
  401d85:	39 d5                	cmp    ebp,edx
  401d87:	76 1f                	jbe    401da8 <out_rev_+0x98>
  401d89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401d90:	be 20 00 00 00       	mov    esi,0x20
  401d95:	4c 89 ff             	mov    rdi,r15
  401d98:	e8 73 fd ff ff       	call   401b10 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401d9d:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401da1:	44 29 f2             	sub    edx,r14d
  401da4:	39 ea                	cmp    edx,ebp
  401da6:	72 e8                	jb     401d90 <out_rev_+0x80>
    }
  }
}
  401da8:	48 83 c4 18          	add    rsp,0x18
  401dac:	5b                   	pop    rbx
  401dad:	5d                   	pop    rbp
  401dae:	41 5c                	pop    r12
  401db0:	41 5d                	pop    r13
  401db2:	41 5e                	pop    r14
  401db4:	41 5f                	pop    r15
  401db6:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401dc0 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401dc0:	55                   	push   rbp
  401dc1:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dc4:	83 fa 1f             	cmp    edx,0x1f
{
  401dc7:	49 89 f3             	mov    r11,rsi
  401dca:	53                   	push   rbx
  401dcb:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401dd0:	89 d6                	mov    esi,edx
  401dd2:	89 cb                	mov    ebx,ecx
  401dd4:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401dd9:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401ddc:	41 f6 c0 02          	test   r8b,0x2
  401de0:	0f 85 fa 00 00 00    	jne    401ee0 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401de6:	44 89 c2             	mov    edx,r8d
  401de9:	83 e2 01             	and    edx,0x1
  401dec:	45 85 d2             	test   r10d,r10d
  401def:	0f 84 eb 00 00 00    	je     401ee0 <print_integer_finalization+0x120>
  401df5:	85 d2                	test   edx,edx
  401df7:	0f 84 e3 00 00 00    	je     401ee0 <print_integer_finalization+0x120>
  401dfd:	84 c9                	test   cl,cl
  401dff:	0f 85 cb 01 00 00    	jne    401fd0 <print_integer_finalization+0x210>
  401e05:	41 f6 c0 0c          	test   r8b,0xc
  401e09:	0f 85 c1 01 00 00    	jne    401fd0 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e0f:	44 39 d6             	cmp    esi,r10d
  401e12:	0f 83 c8 00 00 00    	jae    401ee0 <print_integer_finalization+0x120>
  401e18:	84 c0                	test   al,al
  401e1a:	0f 84 c0 00 00 00    	je     401ee0 <print_integer_finalization+0x120>
  401e20:	89 f0                	mov    eax,esi
  401e22:	89 f2                	mov    edx,esi
  401e24:	4c 01 d8             	add    rax,r11
  401e27:	eb 0b                	jmp    401e34 <print_integer_finalization+0x74>
  401e29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401e30:	84 c9                	test   cl,cl
  401e32:	74 15                	je     401e49 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401e34:	83 c2 01             	add    edx,0x1
  401e37:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e3a:	83 fa 1f             	cmp    edx,0x1f
  401e3d:	0f 96 c1             	setbe  cl
  401e40:	48 83 c0 01          	add    rax,0x1
  401e44:	44 39 d2             	cmp    edx,r10d
  401e47:	72 e7                	jb     401e30 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e49:	44 39 ca             	cmp    edx,r9d
  401e4c:	73 26                	jae    401e74 <print_integer_finalization+0xb4>
  401e4e:	84 c9                	test   cl,cl
  401e50:	74 22                	je     401e74 <print_integer_finalization+0xb4>
  401e52:	89 d0                	mov    eax,edx
  401e54:	4c 01 d8             	add    rax,r11
  401e57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401e5e:	00 00 
      buf[len++] = '0';
  401e60:	83 c2 01             	add    edx,0x1
  401e63:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e66:	48 83 c0 01          	add    rax,0x1
  401e6a:	41 39 d1             	cmp    r9d,edx
  401e6d:	76 05                	jbe    401e74 <print_integer_finalization+0xb4>
  401e6f:	83 fa 1f             	cmp    edx,0x1f
  401e72:	76 ec                	jbe    401e60 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401e74:	39 d6                	cmp    esi,edx
  401e76:	0f 92 c0             	setb   al
  401e79:	40 80 fd 08          	cmp    bpl,0x8
  401e7d:	0f 94 c1             	sete   cl
  401e80:	20 c1                	and    cl,al
  401e82:	74 06                	je     401e8a <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401e84:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401e88:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401e8a:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401e91:	0f 84 8c 00 00 00    	je     401f23 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401e97:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401e9e:	74 58                	je     401ef8 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ea0:	83 fa 1f             	cmp    edx,0x1f
  401ea3:	0f 96 c0             	setbe  al
  401ea6:	40 80 fd 10          	cmp    bpl,0x10
  401eaa:	0f 84 30 01 00 00    	je     401fe0 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401eb0:	40 80 fd 02          	cmp    bpl,0x2
  401eb4:	75 0e                	jne    401ec4 <print_integer_finalization+0x104>
  401eb6:	84 c0                	test   al,al
  401eb8:	74 0a                	je     401ec4 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401eba:	89 d0                	mov    eax,edx
  401ebc:	83 c2 01             	add    edx,0x1
  401ebf:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401ec4:	83 fa 20             	cmp    edx,0x20
  401ec7:	75 50                	jne    401f19 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401ec9:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401eca:	44 89 d1             	mov    ecx,r10d
  401ecd:	4c 89 de             	mov    rsi,r11
}
  401ed0:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401ed1:	e9 3a fe ff ff       	jmp    401d10 <out_rev_>
  401ed6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401edd:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ee0:	44 39 ce             	cmp    esi,r9d
  401ee3:	89 f2                	mov    edx,esi
  401ee5:	0f 92 c1             	setb   cl
  401ee8:	20 c8                	and    al,cl
  401eea:	0f 85 62 ff ff ff    	jne    401e52 <print_integer_finalization+0x92>
  401ef0:	eb 98                	jmp    401e8a <print_integer_finalization+0xca>
  401ef2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401ef8:	85 d2                	test   edx,edx
  401efa:	75 74                	jne    401f70 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401efc:	40 80 fd 10          	cmp    bpl,0x10
  401f00:	0f 84 05 01 00 00    	je     40200b <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f06:	40 80 fd 02          	cmp    bpl,0x2
  401f0a:	0f 85 2e 01 00 00    	jne    40203e <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401f10:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401f14:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401f19:	89 d0                	mov    eax,edx
  401f1b:	83 c2 01             	add    edx,0x1
  401f1e:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401f23:	83 fa 20             	cmp    edx,0x20
  401f26:	74 a1                	je     401ec9 <print_integer_finalization+0x109>
    if (negative) {
  401f28:	84 db                	test   bl,bl
  401f2a:	74 1c                	je     401f48 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401f2c:	89 d0                	mov    eax,edx
}
  401f2e:	5b                   	pop    rbx
      buf[len++] = '-';
  401f2f:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401f32:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401f35:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401f3a:	4c 89 de             	mov    rsi,r11
}
  401f3d:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401f3e:	e9 cd fd ff ff       	jmp    401d10 <out_rev_>
  401f43:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401f48:	41 f6 c0 04          	test   r8b,0x4
  401f4c:	75 62                	jne    401fb0 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401f4e:	41 f6 c0 08          	test   r8b,0x8
  401f52:	0f 84 71 ff ff ff    	je     401ec9 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  401f58:	89 d0                	mov    eax,edx
  401f5a:	83 c2 01             	add    edx,0x1
  401f5d:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  401f62:	e9 62 ff ff ff       	jmp    401ec9 <print_integer_finalization+0x109>
  401f67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401f6e:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401f70:	41 39 d1             	cmp    r9d,edx
  401f73:	74 09                	je     401f7e <print_integer_finalization+0x1be>
  401f75:	44 39 d2             	cmp    edx,r10d
  401f78:	0f 85 22 ff ff ff    	jne    401ea0 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  401f7e:	84 c0                	test   al,al
  401f80:	0f 85 99 00 00 00    	jne    40201f <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  401f86:	40 80 fd 10          	cmp    bpl,0x10
  401f8a:	0f 94 c0             	sete   al
  401f8d:	40 80 fd 02          	cmp    bpl,0x2
  401f91:	0f 94 c1             	sete   cl
  401f94:	08 c8                	or     al,cl
  401f96:	0f 84 04 ff ff ff    	je     401ea0 <print_integer_finalization+0xe0>
  401f9c:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  401f9e:	83 da 00             	sbb    edx,0x0
  401fa1:	e9 fa fe ff ff       	jmp    401ea0 <print_integer_finalization+0xe0>
  401fa6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401fad:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  401fb0:	89 d0                	mov    eax,edx
}
  401fb2:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  401fb3:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401fb6:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  401fb9:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  401fbe:	4c 89 de             	mov    rsi,r11
}
  401fc1:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401fc2:	e9 49 fd ff ff       	jmp    401d10 <out_rev_>
  401fc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401fce:	00 00 
        width--;
  401fd0:	41 83 ea 01          	sub    r10d,0x1
  401fd4:	e9 36 fe ff ff       	jmp    401e0f <print_integer_finalization+0x4f>
  401fd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fe0:	44 89 c1             	mov    ecx,r8d
  401fe3:	83 e1 20             	and    ecx,0x20
  401fe6:	75 0c                	jne    401ff4 <print_integer_finalization+0x234>
  401fe8:	84 c0                	test   al,al
  401fea:	75 60                	jne    40204c <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fec:	85 c9                	test   ecx,ecx
  401fee:	0f 84 d0 fe ff ff    	je     401ec4 <print_integer_finalization+0x104>
  401ff4:	84 c0                	test   al,al
  401ff6:	0f 84 c8 fe ff ff    	je     401ec4 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401ffc:	89 d0                	mov    eax,edx
  401ffe:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  402001:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  402006:	e9 b9 fe ff ff       	jmp    401ec4 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40200b:	41 f6 c0 20          	test   r8b,0x20
  40200f:	75 1f                	jne    402030 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  402011:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  402015:	ba 01 00 00 00       	mov    edx,0x1
  40201a:	e9 fa fe ff ff       	jmp    401f19 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  40201f:	83 ea 01             	sub    edx,0x1
  402022:	0f 84 d4 fe ff ff    	je     401efc <print_integer_finalization+0x13c>
  402028:	e9 59 ff ff ff       	jmp    401f86 <print_integer_finalization+0x1c6>
  40202d:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  402030:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  402034:	ba 01 00 00 00       	mov    edx,0x1
  402039:	e9 db fe ff ff       	jmp    401f19 <print_integer_finalization+0x159>
      buf[len++] = '0';
  40203e:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  402042:	ba 01 00 00 00       	mov    edx,0x1
  402047:	e9 dc fe ff ff       	jmp    401f28 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  40204c:	89 d0                	mov    eax,edx
  40204e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  402051:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  402056:	e9 69 fe ff ff       	jmp    401ec4 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000402060 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  402060:	41 57                	push   r15
  402062:	41 56                	push   r14
  402064:	41 55                	push   r13
  402066:	41 89 cd             	mov    r13d,ecx
  402069:	41 54                	push   r12
  40206b:	49 89 fc             	mov    r12,rdi
  40206e:	55                   	push   rbp
  40206f:	53                   	push   rbx
  402070:	89 d3                	mov    ebx,edx
  402072:	48 83 ec 28          	sub    rsp,0x28
  402076:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  40207b:	48 85 f6             	test   rsi,rsi
  40207e:	75 48                	jne    4020c8 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  402080:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  402087:	0f 85 a3 00 00 00    	jne    402130 <print_integer+0xd0>
      buf[len++] = '0';
  40208d:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  402091:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  402095:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  40209a:	48 89 e6             	mov    rsi,rsp
  40209d:	41 56                	push   r14
  40209f:	0f b6 cb             	movzx  ecx,bl
  4020a2:	4c 89 e7             	mov    rdi,r12
  4020a5:	41 51                	push   r9
  4020a7:	45 89 c1             	mov    r9d,r8d
  4020aa:	45 0f b6 c5          	movzx  r8d,r13b
  4020ae:	e8 0d fd ff ff       	call   401dc0 <print_integer_finalization>
}
  4020b3:	48 83 c4 38          	add    rsp,0x38
  4020b7:	5b                   	pop    rbx
  4020b8:	5d                   	pop    rbp
  4020b9:	41 5c                	pop    r12
  4020bb:	41 5d                	pop    r13
  4020bd:	41 5e                	pop    r14
  4020bf:	41 5f                	pop    r15
  4020c1:	c3                   	ret    
  4020c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  4020c8:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  4020cb:	44 0f b6 d1          	movzx  r10d,cl
  4020cf:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  4020d4:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  4020d9:	83 e0 20             	and    eax,0x20
  4020dc:	83 f8 01             	cmp    eax,0x1
  4020df:	45 19 db             	sbb    r11d,r11d
  4020e2:	41 83 e3 20          	and    r11d,0x20
  4020e6:	41 83 c3 37          	add    r11d,0x37
  4020ea:	eb 07                	jmp    4020f3 <print_integer+0x93>
  4020ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  4020f0:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  4020f3:	31 d2                	xor    edx,edx
  4020f5:	48 89 f0             	mov    rax,rsi
  4020f8:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  4020fb:	48 83 fa 09          	cmp    rdx,0x9
  4020ff:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  402103:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  402107:	89 ca                	mov    edx,ecx
  402109:	41 0f 46 ff          	cmovbe edi,r15d
  40210d:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  402112:	48 83 c1 01          	add    rcx,0x1
  402116:	4c 39 d6             	cmp    rsi,r10
  402119:	0f 82 7b ff ff ff    	jb     40209a <print_integer+0x3a>
  40211f:	83 fa 1f             	cmp    edx,0x1f
  402122:	76 cc                	jbe    4020f0 <print_integer+0x90>
  402124:	e9 71 ff ff ff       	jmp    40209a <print_integer+0x3a>
  402129:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  402130:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  402133:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  402135:	41 83 e6 ef          	and    r14d,0xffffffef
  402139:	80 f9 10             	cmp    cl,0x10
  40213c:	44 0f 45 f0          	cmovne r14d,eax
  402140:	e9 55 ff ff ff       	jmp    40209a <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000402150 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  402150:	e8 8b f9 ff ff       	call   401ae0 <get_sign_bit>
{
  402155:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  402158:	85 c0                	test   eax,eax
  40215a:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  40215d:	74 08                	je     402167 <get_components+0x17>
  40215f:	66 0f 57 05 09 35 00 	xorpd  xmm0,XMMWORD PTR [rip+0x3509]        # 405670 <powers_of_10+0x90>
  402166:	00 
  number_.integral = (int_fast64_t)abs_number;
  402167:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40216c:	66 0f ef d2          	pxor   xmm2,xmm2
  402170:	66 0f 28 c8          	movapd xmm1,xmm0
  402174:	89 f0                	mov    eax,esi
  402176:	48 8d 3d 63 34 00 00 	lea    rdi,[rip+0x3463]        # 4055e0 <powers_of_10>
  40217d:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  402182:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  402187:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  40218b:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40218f:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  402193:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  402198:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  40219d:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  4021a1:	f2 0f 10 15 d7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34d7]        # 405680 <powers_of_10+0xa0>
  4021a8:	00 
  4021a9:	66 0f 2f ca          	comisd xmm1,xmm2
  4021ad:	76 51                	jbe    402200 <get_components+0xb0>
    ++number_.fractional;
  4021af:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  4021b3:	66 0f ef c9          	pxor   xmm1,xmm1
  4021b7:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  4021bc:	66 0f 2f cb          	comisd xmm1,xmm3
  4021c0:	73 56                	jae    402218 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  4021c2:	85 f6                	test   esi,esi
  4021c4:	75 27                	jne    4021ed <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  4021c6:	66 0f ef c9          	pxor   xmm1,xmm1
  4021ca:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  4021cf:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  4021d3:	66 0f 2f d0          	comisd xmm2,xmm0
  4021d7:	76 06                	jbe    4021df <get_components+0x8f>
  4021d9:	66 0f 2f c2          	comisd xmm0,xmm2
  4021dd:	76 0e                	jbe    4021ed <get_components+0x9d>
  4021df:	48 89 d6             	mov    rsi,rdx
  4021e2:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  4021e5:	48 83 fe 01          	cmp    rsi,0x1
  4021e9:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  4021ed:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  4021f1:	4c 89 c0             	mov    rax,r8
  return number_;
  4021f4:	49 89 10             	mov    QWORD PTR [r8],rdx
  4021f7:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  4021fb:	c3                   	ret    
  4021fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402200:	66 0f 2e ca          	ucomisd xmm1,xmm2
  402204:	7a bc                	jp     4021c2 <get_components+0x72>
  402206:	75 ba                	jne    4021c2 <get_components+0x72>
  402208:	48 85 c0             	test   rax,rax
  40220b:	75 13                	jne    402220 <get_components+0xd0>
    ++number_.fractional;
  40220d:	48 83 c0 01          	add    rax,0x1
  402211:	eb af                	jmp    4021c2 <get_components+0x72>
  402213:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  402218:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  40221c:	31 c0                	xor    eax,eax
  40221e:	eb a2                	jmp    4021c2 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  402220:	a8 01                	test   al,0x1
  402222:	74 9e                	je     4021c2 <get_components+0x72>
  402224:	eb e7                	jmp    40220d <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

0000000000402230 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  402230:	66 0f 2f 05 40 34 00 	comisd xmm0,QWORD PTR [rip+0x3440]        # 405678 <powers_of_10+0x98>
  402237:	00 
  402238:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  40223c:	73 10                	jae    40224e <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  40223e:	66 0f ef c9          	pxor   xmm1,xmm1
  402242:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402246:	66 0f 2e c8          	ucomisd xmm1,xmm0
  40224a:	7a 04                	jp     402250 <bastardized_floor+0x20>
  40224c:	75 02                	jne    402250 <bastardized_floor+0x20>
}
  40224e:	c3                   	ret    
  40224f:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  402250:	83 e8 01             	sub    eax,0x1
}
  402253:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

0000000000402260 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  402260:	e8 6b f8 ff ff       	call   401ad0 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  402265:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  40226c:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  40226f:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  402272:	48 89 c7             	mov    rdi,rax
  402275:	e8 76 f8 ff ff       	call   401af0 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40227a:	48 21 ca             	and    rdx,rcx
  40227d:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  402284:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  402287:	f2 0f 10 1d 11 34 00 	movsd  xmm3,QWORD PTR [rip+0x3411]        # 4056a0 <powers_of_10+0xc0>
  40228e:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40228f:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402292:	f2 0f 10 05 f6 33 00 	movsd  xmm0,QWORD PTR [rip+0x33f6]        # 405690 <powers_of_10+0xb0>
  402299:	00 
  double z = (dwba.F - 1.5);
  40229a:	66 48 0f 6e ca       	movq   xmm1,rdx
  40229f:	f2 0f 5c 0d e1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33e1]        # 405688 <powers_of_10+0xa8>
  4022a6:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4022a7:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4022ab:	66 0f 28 d1          	movapd xmm2,xmm1
  4022af:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  4022b3:	f2 0f 58 05 dd 33 00 	addsd  xmm0,QWORD PTR [rip+0x33dd]        # 405698 <powers_of_10+0xb8>
  4022ba:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4022bb:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4022bf:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4022c3:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4022c7:	f2 0f 59 15 d9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33d9]        # 4056a8 <powers_of_10+0xc8>
  4022ce:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4022cf:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4022d3:	f2 0f 59 0d d5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33d5]        # 4056b0 <powers_of_10+0xd0>
  4022da:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  4022db:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  4022df:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  4022e3:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  4022e7:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

00000000004022f0 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  4022f0:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  4022f6:	0f 84 b4 00 00 00    	je     4023b0 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  4022fc:	66 0f ef d2          	pxor   xmm2,xmm2
  402300:	f2 0f 10 05 b8 33 00 	movsd  xmm0,QWORD PTR [rip+0x33b8]        # 4056c0 <powers_of_10+0xe0>
  402307:	00 
  402308:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  40230c:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  402310:	f2 0f 58 05 68 33 00 	addsd  xmm0,QWORD PTR [rip+0x3368]        # 405680 <powers_of_10+0xa0>
  402317:	00 
  402318:	e8 13 ff ff ff       	call   402230 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40231d:	f2 0f 10 0d a3 33 00 	movsd  xmm1,QWORD PTR [rip+0x33a3]        # 4056c8 <powers_of_10+0xe8>
  402324:	00 
  402325:	66 0f ef c0          	pxor   xmm0,xmm0
  402329:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  40232d:	f2 0f 59 05 9b 33 00 	mulsd  xmm0,QWORD PTR [rip+0x339b]        # 4056d0 <powers_of_10+0xf0>
  402334:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  402335:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  402337:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  40233b:	48 05 ff 03 00 00    	add    rax,0x3ff
  402341:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402345:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  40234a:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  40234e:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402352:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  402356:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  40235a:	f2 0f 58 c1          	addsd  xmm0,xmm1
  40235e:	66 0f 28 e2          	movapd xmm4,xmm2
  402362:	f2 0f 5e 25 6e 33 00 	divsd  xmm4,QWORD PTR [rip+0x336e]        # 4056d8 <powers_of_10+0xf8>
  402369:	00 
  40236a:	66 0f 28 da          	movapd xmm3,xmm2
  40236e:	f2 0f 58 25 6a 33 00 	addsd  xmm4,QWORD PTR [rip+0x336a]        # 4056e0 <powers_of_10+0x100>
  402375:	00 
  402376:	f2 0f 5e dc          	divsd  xmm3,xmm4
  40237a:	f2 0f 58 1d 66 33 00 	addsd  xmm3,QWORD PTR [rip+0x3366]        # 4056e8 <powers_of_10+0x108>
  402381:	00 
  402382:	f2 0f 5e d3          	divsd  xmm2,xmm3
  402386:	f2 0f 10 1d 62 33 00 	movsd  xmm3,QWORD PTR [rip+0x3362]        # 4056f0 <powers_of_10+0x110>
  40238d:	00 
  40238e:	f2 0f 5c d9          	subsd  xmm3,xmm1
  402392:	f2 0f 58 d3          	addsd  xmm2,xmm3
  402396:	f2 0f 5e c2          	divsd  xmm0,xmm2
  40239a:	f2 0f 58 05 56 33 00 	addsd  xmm0,QWORD PTR [rip+0x3356]        # 4056f8 <powers_of_10+0x118>
  4023a1:	00 
  4023a2:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  4023a6:	c3                   	ret    
  4023a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4023ae:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  4023b0:	f2 0f 10 05 00 33 00 	movsd  xmm0,QWORD PTR [rip+0x3300]        # 4056b8 <powers_of_10+0xd8>
  4023b7:	00 
}
  4023b8:	c3                   	ret    

Disassembly of section .text.parse_flags:

00000000004023c0 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  4023c0:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  4023c3:	48 8d 0d 06 30 00 00 	lea    rcx,[rip+0x3006]        # 4053d0 <memcpy+0xd90>
  4023ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4023d0:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  4023d3:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  4023d6:	83 e8 20             	sub    eax,0x20
  4023d9:	3c 10                	cmp    al,0x10
  4023db:	77 13                	ja     4023f0 <parse_flags+0x30>
  4023dd:	0f b6 c0             	movzx  eax,al
  4023e0:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  4023e4:	48 01 c8             	add    rax,rcx
  4023e7:	3e ff e0             	notrack jmp rax
  4023ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  4023f0:	44 89 c0             	mov    eax,r8d
  4023f3:	c3                   	ret    
  4023f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  4023f8:	41 83 c8 01          	or     r8d,0x1
  4023fc:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402400:	48 89 17             	mov    QWORD PTR [rdi],rdx
  402403:	eb cb                	jmp    4023d0 <parse_flags+0x10>
  402405:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  402408:	41 83 c8 02          	or     r8d,0x2
  40240c:	48 83 c2 01          	add    rdx,0x1
  402410:	eb ee                	jmp    402400 <parse_flags+0x40>
  402412:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  402418:	41 83 c8 04          	or     r8d,0x4
  40241c:	48 83 c2 01          	add    rdx,0x1
  402420:	eb de                	jmp    402400 <parse_flags+0x40>
  402422:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  402428:	41 83 c8 10          	or     r8d,0x10
  40242c:	48 83 c2 01          	add    rdx,0x1
  402430:	eb ce                	jmp    402400 <parse_flags+0x40>
  402432:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  402438:	41 83 c8 08          	or     r8d,0x8
  40243c:	48 83 c2 01          	add    rdx,0x1
  402440:	eb be                	jmp    402400 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

0000000000402450 <putchar_wrapper>:
{
  402450:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  402454:	40 0f be ff          	movsx  edi,dil
  402458:	e9 e3 18 00 00       	jmp    403d40 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000402460 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  402460:	41 56                	push   r14
  402462:	49 89 ca             	mov    r10,rcx
  402465:	41 89 d3             	mov    r11d,edx
  402468:	41 55                	push   r13
  40246a:	45 89 c5             	mov    r13d,r8d
  40246d:	41 54                	push   r12
  40246f:	55                   	push   rbp
  402470:	53                   	push   rbx
  402471:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  402476:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40247b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  40247f:	45 85 ed             	test   r13d,r13d
  402482:	0f 84 90 00 00 00    	je     402518 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402488:	44 89 c0             	mov    eax,r8d
  40248b:	25 10 10 00 00       	and    eax,0x1010
  402490:	3d 00 10 00 00       	cmp    eax,0x1000
  402495:	0f 84 05 02 00 00    	je     4026a0 <print_broken_up_decimal.isra.0+0x240>
  40249b:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  40249e:	89 cb                	mov    ebx,ecx
  4024a0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  4024a5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  4024ac:	66 66 66 
  4024af:	49 01 ec             	add    r12,rbp
  4024b2:	eb 43                	jmp    4024f7 <print_broken_up_decimal.isra.0+0x97>
  4024b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4024b8:	48 89 f0             	mov    rax,rsi
  4024bb:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  4024be:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  4024c2:	49 f7 ed             	imul   r13
  4024c5:	48 89 f0             	mov    rax,rsi
  4024c8:	41 29 de             	sub    r14d,ebx
  4024cb:	83 c3 01             	add    ebx,0x1
  4024ce:	48 c1 f8 3f          	sar    rax,0x3f
  4024d2:	48 c1 fa 02          	sar    rdx,0x2
  4024d6:	48 29 c2             	sub    rdx,rax
  4024d9:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4024dd:	48 01 c0             	add    rax,rax
  4024e0:	48 29 c6             	sub    rsi,rax
  4024e3:	83 c6 30             	add    esi,0x30
  4024e6:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  4024eb:	48 89 d6             	mov    rsi,rdx
  4024ee:	48 85 d2             	test   rdx,rdx
  4024f1:	0f 84 f9 00 00 00    	je     4025f0 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4024f7:	83 fb 20             	cmp    ebx,0x20
  4024fa:	75 bc                	jne    4024b8 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4024fc:	44 89 c0             	mov    eax,r8d
  4024ff:	83 e0 03             	and    eax,0x3
  402502:	83 f8 01             	cmp    eax,0x1
  402505:	0f 84 35 01 00 00    	je     402640 <print_broken_up_decimal.isra.0+0x1e0>
  40250b:	ba 20 00 00 00       	mov    edx,0x20
  402510:	e9 7d 00 00 00       	jmp    402592 <print_broken_up_decimal.isra.0+0x132>
  402515:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402518:	41 f6 c0 10          	test   r8b,0x10
  40251c:	0f 85 8e 00 00 00    	jne    4025b0 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  402522:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  402529:	66 66 66 
  40252c:	89 ce                	mov    esi,ecx
  40252e:	48 01 ee             	add    rsi,rbp
  402531:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402538:	83 f9 20             	cmp    ecx,0x20
  40253b:	74 bf                	je     4024fc <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  40253d:	48 89 f8             	mov    rax,rdi
  402540:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  402543:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  402547:	48 f7 eb             	imul   rbx
  40254a:	48 89 f8             	mov    rax,rdi
  40254d:	48 c1 f8 3f          	sar    rax,0x3f
  402551:	48 c1 fa 02          	sar    rdx,0x2
  402555:	48 29 c2             	sub    rdx,rax
  402558:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40255c:	48 01 c0             	add    rax,rax
  40255f:	48 29 c7             	sub    rdi,rax
  402562:	83 c7 30             	add    edi,0x30
  402565:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  402569:	48 89 d7             	mov    rdi,rdx
  40256c:	48 85 d2             	test   rdx,rdx
  40256f:	75 c7                	jne    402538 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  402571:	44 89 c0             	mov    eax,r8d
  402574:	83 e0 03             	and    eax,0x3
  402577:	83 f8 01             	cmp    eax,0x1
  40257a:	0f 84 b8 01 00 00    	je     402738 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402580:	83 f9 20             	cmp    ecx,0x20
  402583:	74 86                	je     40250b <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  402585:	45 84 db             	test   r11b,r11b
  402588:	74 46                	je     4025d0 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  40258a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  40258f:	8d 51 01             	lea    edx,[rcx+0x1]
}
  402592:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  402593:	48 89 ee             	mov    rsi,rbp
  402596:	44 89 c9             	mov    ecx,r9d
}
  402599:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40259a:	4c 89 d7             	mov    rdi,r10
}
  40259d:	41 5c                	pop    r12
  40259f:	41 5d                	pop    r13
  4025a1:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  4025a3:	e9 68 f7 ff ff       	jmp    401d10 <out_rev_>
  4025a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4025af:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4025b0:	83 f9 20             	cmp    ecx,0x20
  4025b3:	0f 84 43 ff ff ff    	je     4024fc <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  4025b9:	89 c8                	mov    eax,ecx
  4025bb:	83 c1 01             	add    ecx,0x1
  4025be:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  4025c3:	e9 5a ff ff ff       	jmp    402522 <print_broken_up_decimal.isra.0+0xc2>
  4025c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4025cf:	00 
    else if (flags & FLAGS_PLUS) {
  4025d0:	41 f6 c0 04          	test   r8b,0x4
  4025d4:	0f 85 3e 01 00 00    	jne    402718 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  4025da:	89 ca                	mov    edx,ecx
  4025dc:	41 f6 c0 08          	test   r8b,0x8
  4025e0:	74 b0                	je     402592 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  4025e2:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  4025e7:	83 c2 01             	add    edx,0x1
  4025ea:	eb a6                	jmp    402592 <print_broken_up_decimal.isra.0+0x132>
  4025ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4025f0:	83 fb 1f             	cmp    ebx,0x1f
  4025f3:	77 13                	ja     402608 <print_broken_up_decimal.isra.0+0x1a8>
  4025f5:	45 85 f6             	test   r14d,r14d
  4025f8:	89 d8                	mov    eax,ebx
  4025fa:	0f 95 c2             	setne  dl
  4025fd:	48 01 e8             	add    rax,rbp
  402600:	84 d2                	test   dl,dl
  402602:	75 20                	jne    402624 <print_broken_up_decimal.isra.0+0x1c4>
  402604:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402608:	83 fb 20             	cmp    ebx,0x20
  40260b:	0f 84 eb fe ff ff    	je     4024fc <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  402611:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  402616:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402619:	e9 04 ff ff ff       	jmp    402522 <print_broken_up_decimal.isra.0+0xc2>
  40261e:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402620:	39 ca                	cmp    edx,ecx
  402622:	74 e4                	je     402608 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  402624:	89 da                	mov    edx,ebx
  402626:	83 c3 01             	add    ebx,0x1
  402629:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  40262c:	48 83 c0 01          	add    rax,0x1
  402630:	83 fb 1f             	cmp    ebx,0x1f
  402633:	76 eb                	jbe    402620 <print_broken_up_decimal.isra.0+0x1c0>
  402635:	eb d1                	jmp    402608 <print_broken_up_decimal.isra.0+0x1a8>
  402637:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40263e:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402640:	45 85 c9             	test   r9d,r9d
  402643:	0f 84 c2 fe ff ff    	je     40250b <print_broken_up_decimal.isra.0+0xab>
  402649:	31 d2                	xor    edx,edx
  40264b:	b9 20 00 00 00       	mov    ecx,0x20
  402650:	45 84 db             	test   r11b,r11b
  402653:	0f 85 cf 00 00 00    	jne    402728 <print_broken_up_decimal.isra.0+0x2c8>
  402659:	41 f6 c0 0c          	test   r8b,0xc
  40265d:	0f 85 c5 00 00 00    	jne    402728 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402663:	44 39 c9             	cmp    ecx,r9d
  402666:	0f 83 14 ff ff ff    	jae    402580 <print_broken_up_decimal.isra.0+0x120>
  40266c:	89 c8                	mov    eax,ecx
  40266e:	48 01 e8             	add    rax,rbp
  402671:	84 d2                	test   dl,dl
  402673:	0f 84 07 ff ff ff    	je     402580 <print_broken_up_decimal.isra.0+0x120>
  402679:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  402680:	83 c1 01             	add    ecx,0x1
  402683:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402686:	48 83 c0 01          	add    rax,0x1
  40268a:	44 39 c9             	cmp    ecx,r9d
  40268d:	0f 83 ed fe ff ff    	jae    402580 <print_broken_up_decimal.isra.0+0x120>
  402693:	83 f9 1f             	cmp    ecx,0x1f
  402696:	76 e8                	jbe    402680 <print_broken_up_decimal.isra.0+0x220>
  402698:	e9 e3 fe ff ff       	jmp    402580 <print_broken_up_decimal.isra.0+0x120>
  40269d:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  4026a0:	48 85 f6             	test   rsi,rsi
  4026a3:	0f 8e 79 fe ff ff    	jle    402522 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  4026a9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  4026b0:	cc cc cc 
  4026b3:	48 89 f0             	mov    rax,rsi
  4026b6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  4026bd:	99 99 19 
  4026c0:	48 0f af c3          	imul   rax,rbx
  4026c4:	48 01 d0             	add    rax,rdx
  4026c7:	48 d1 c8             	ror    rax,1
  4026ca:	48 39 d0             	cmp    rax,rdx
  4026cd:	0f 87 c8 fd ff ff    	ja     40249b <print_broken_up_decimal.isra.0+0x3b>
  4026d3:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  4026da:	99 99 19 
  4026dd:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  4026e0:	48 89 f0             	mov    rax,rsi
  4026e3:	49 89 f4             	mov    r12,rsi
        --count;
  4026e6:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  4026ea:	48 f7 e3             	mul    rbx
  4026ed:	48 89 d6             	mov    rsi,rdx
  4026f0:	48 c1 ee 03          	shr    rsi,0x3
  4026f4:	48 89 f0             	mov    rax,rsi
  4026f7:	48 0f af c3          	imul   rax,rbx
  4026fb:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  4026fe:	4c 39 f0             	cmp    rax,r14
  402701:	76 dd                	jbe    4026e0 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  402703:	49 83 fc 09          	cmp    r12,0x9
  402707:	0f 8f 8e fd ff ff    	jg     40249b <print_broken_up_decimal.isra.0+0x3b>
  40270d:	e9 10 fe ff ff       	jmp    402522 <print_broken_up_decimal.isra.0+0xc2>
  402712:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  402718:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  40271d:	8d 51 01             	lea    edx,[rcx+0x1]
  402720:	e9 6d fe ff ff       	jmp    402592 <print_broken_up_decimal.isra.0+0x132>
  402725:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  402728:	41 83 e9 01          	sub    r9d,0x1
  40272c:	e9 32 ff ff ff       	jmp    402663 <print_broken_up_decimal.isra.0+0x203>
  402731:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  402738:	45 85 c9             	test   r9d,r9d
  40273b:	0f 84 3f fe ff ff    	je     402580 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402741:	83 f9 1f             	cmp    ecx,0x1f
  402744:	0f 96 c2             	setbe  dl
  402747:	e9 04 ff ff ff       	jmp    402650 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

0000000000402750 <print_decimal_number>:
{
  402750:	41 54                	push   r12
  402752:	49 89 fb             	mov    r11,rdi
  402755:	41 89 f2             	mov    r10d,esi
  402758:	4d 89 c4             	mov    r12,r8
  40275b:	55                   	push   rbp
  40275c:	89 cd                	mov    ebp,ecx
  40275e:	53                   	push   rbx
  40275f:	89 d3                	mov    ebx,edx
  402761:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  402765:	48 89 e7             	mov    rdi,rsp
  402768:	e8 e3 f9 ff ff       	call   402150 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  40276d:	48 83 ec 08          	sub    rsp,0x8
  402771:	45 89 d0             	mov    r8d,r10d
  402774:	4c 89 d9             	mov    rcx,r11
  402777:	41 51                	push   r9
  402779:	41 89 d9             	mov    r9d,ebx
  40277c:	41 54                	push   r12
  40277e:	55                   	push   rbp
  40277f:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  402784:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  402789:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  40278e:	e8 cd fc ff ff       	call   402460 <print_broken_up_decimal.isra.0>
}
  402793:	48 83 c4 40          	add    rsp,0x40
  402797:	5b                   	pop    rbx
  402798:	5d                   	pop    rbp
  402799:	41 5c                	pop    r12
  40279b:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

00000000004027a0 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  4027a0:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  4027a4:	40 84 ff             	test   dil,dil
  4027a7:	74 17                	je     4027c0 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  4027a9:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  4027ad:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  4027b2:	31 c0                	xor    eax,eax
  4027b4:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  4027b6:	66 0f 28 c1          	movapd xmm0,xmm1
}
  4027ba:	c3                   	ret    
  4027bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  4027c0:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  4027c4:	e8 07 f3 ff ff       	call   401ad0 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  4027c9:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  4027cd:	48 89 c7             	mov    rdi,rax
  4027d0:	e8 1b f3 ff ff       	call   401af0 <get_exp2>
  4027d5:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  4027d7:	e8 f4 f2 ff ff       	call   401ad0 <get_bit_access>
  4027dc:	48 89 c7             	mov    rdi,rax
  4027df:	e8 0c f3 ff ff       	call   401af0 <get_exp2>
  4027e4:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  4027e7:	89 d0                	mov    eax,edx
  4027e9:	f7 d8                	neg    eax
  4027eb:	0f 49 d0             	cmovns edx,eax
  4027ee:	44 89 c0             	mov    eax,r8d
  4027f1:	f7 d8                	neg    eax
  4027f3:	41 0f 48 c0          	cmovs  eax,r8d
  4027f7:	39 c2                	cmp    edx,eax
  4027f9:	7f 1d                	jg     402818 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4027fb:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  4027ff:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402804:	31 c0                	xor    eax,eax
}
  402806:	48 83 c4 08          	add    rsp,0x8
  return result;
  40280a:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40280c:	66 0f 28 c1          	movapd xmm0,xmm1
}
  402810:	c3                   	ret    
  402811:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402818:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  40281c:	31 d2                	xor    edx,edx
  return result;
  40281e:	31 c0                	xor    eax,eax
}
  402820:	48 83 c4 08          	add    rsp,0x8
  return result;
  402824:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  402826:	66 0f 28 c2          	movapd xmm0,xmm2
}
  40282a:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

0000000000402830 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  402830:	40 84 ff             	test   dil,dil
  402833:	74 0b                	je     402840 <unapply_scaling.isra.0+0x10>
  402835:	f2 0f 5e c1          	divsd  xmm0,xmm1
  402839:	c3                   	ret    
  40283a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402840:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  402844:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

0000000000402850 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  402850:	40 84 ff             	test   dil,dil
  402853:	74 0b                	je     402860 <apply_scaling.isra.0+0x10>
  402855:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  402859:	c3                   	ret    
  40285a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402860:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  402864:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000402870 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402870:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402872:	48 83 ec 08          	sub    rsp,0x8
  402876:	49 89 f9             	mov    r9,rdi
  402879:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  40287b:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  40287e:	66 0f 28 d0          	movapd xmm2,xmm0
  402882:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  402885:	e8 c6 ff ff ff       	call   402850 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  40288a:	3d 32 01 00 00       	cmp    eax,0x132
  40288f:	0f 8f ab 00 00 00    	jg     402940 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  402895:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40289a:	66 0f ef c0          	pxor   xmm0,xmm0
  40289e:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  4028a2:	89 d6                	mov    esi,edx
  4028a4:	48 8d 05 35 2d 00 00 	lea    rax,[rip+0x2d35]        # 4055e0 <powers_of_10>
  4028ab:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4028af:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  4028b4:	e8 77 ff ff ff       	call   402830 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  4028b9:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  4028be:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  4028c2:	66 0f 28 c3          	movapd xmm0,xmm3
  4028c6:	66 0f 28 cc          	movapd xmm1,xmm4
  4028ca:	e8 d1 fe ff ff       	call   4027a0 <update_normalization.isra.0>
  4028cf:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  4028d3:	89 c7                	mov    edi,eax
  4028d5:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  4028d9:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  4028db:	e8 70 ff ff ff       	call   402850 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  4028e0:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  4028e4:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  4028e9:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  4028ee:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  4028f2:	66 0f 2f 05 86 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d86]        # 405680 <powers_of_10+0xa0>
  4028f9:	00 
  4028fa:	0f 93 c0             	setae  al
  4028fd:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  402900:	66 0f 2e 05 78 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d78]        # 405680 <powers_of_10+0xa0>
  402907:	00 
  402908:	7a 06                	jp     402910 <get_normalized_components.isra.0+0xa0>
  40290a:	75 04                	jne    402910 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  40290c:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  402910:	66 0f ef c0          	pxor   xmm0,xmm0
  402914:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  402919:	66 0f 2f c4          	comisd xmm0,xmm4
  40291d:	73 19                	jae    402938 <get_normalized_components.isra.0+0xc8>
  return components;
  40291f:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  402923:	4c 89 c8             	mov    rax,r9
  return components;
  402926:	49 89 09             	mov    QWORD PTR [r9],rcx
  402929:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  40292d:	48 83 c4 08          	add    rsp,0x8
  402931:	c3                   	ret    
  402932:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  402938:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  40293c:	31 c0                	xor    eax,eax
  40293e:	eb df                	jmp    40291f <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  402940:	40 84 f6             	test   sil,sil
  402943:	74 08                	je     40294d <get_normalized_components.isra.0+0xdd>
  402945:	66 0f 57 05 23 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d23]        # 405670 <powers_of_10+0x90>
  40294c:	00 
  40294d:	89 d6                	mov    esi,edx
  40294f:	4c 89 cf             	mov    rdi,r9
  402952:	e8 f9 f7 ff ff       	call   402150 <get_components>
}
  402957:	4c 89 c8             	mov    rax,r9
  40295a:	48 83 c4 08          	add    rsp,0x8
  40295e:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000402960 <print_exponential_number>:
{
  402960:	41 57                	push   r15
  402962:	41 89 f3             	mov    r11d,esi
  402965:	66 0f 28 f0          	movapd xmm6,xmm0
  402969:	41 56                	push   r14
  40296b:	41 55                	push   r13
  40296d:	49 89 fd             	mov    r13,rdi
  402970:	41 54                	push   r12
  402972:	41 89 d4             	mov    r12d,edx
  402975:	55                   	push   rbp
  402976:	89 cd                	mov    ebp,ecx
  402978:	53                   	push   rbx
  402979:	48 83 ec 38          	sub    rsp,0x38
  40297d:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  402981:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  402986:	e8 55 f1 ff ff       	call   401ae0 <get_sign_bit>
  40298b:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  40298d:	85 c0                	test   eax,eax
  40298f:	74 08                	je     402999 <print_exponential_number+0x39>
  402991:	66 0f 57 35 d7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cd7]        # 405670 <powers_of_10+0x90>
  402998:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  402999:	41 89 e8             	mov    r8d,ebp
  40299c:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  4029a3:	66 0f 2e 35 cd 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2ccd]        # 405678 <powers_of_10+0x98>
  4029aa:	00 
  4029ab:	0f 8a 9f 00 00 00    	jp     402a50 <print_exponential_number+0xf0>
  4029b1:	0f 85 99 00 00 00    	jne    402a50 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  4029b7:	45 85 c0             	test   r8d,r8d
  4029ba:	0f 85 18 01 00 00    	jne    402ad8 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  4029c0:	85 f6                	test   esi,esi
  4029c2:	0f 84 63 03 00 00    	je     402d2b <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  4029c8:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  4029ca:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  4029cd:	66 0f 57 35 9b 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2c9b]        # 405670 <powers_of_10+0x90>
  4029d4:	00 
  4029d5:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4029da:	44 89 de             	mov    esi,r11d
  4029dd:	66 0f 28 c6          	movapd xmm0,xmm6
  4029e1:	e8 6a f7 ff ff       	call   402150 <get_components>
  4029e6:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4029eb:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4029f0:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  4029f5:	45 84 ff             	test   r15b,r15b
  4029f8:	0f 84 49 01 00 00    	je     402b47 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  4029fe:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402a04:	74 09                	je     402a0f <print_exponential_number+0xaf>
  402a06:	83 fb ff             	cmp    ebx,0xffffffff
  402a09:	0f 8d d1 02 00 00    	jge    402ce0 <print_exponential_number+0x380>
        width - exp10_part_width :
  402a0f:	45 85 e4             	test   r12d,r12d
  402a12:	0f 84 98 02 00 00    	je     402cb0 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402a18:	48 83 ec 08          	sub    rsp,0x8
  402a1c:	45 89 e1             	mov    r9d,r12d
  402a1f:	45 89 d8             	mov    r8d,r11d
  402a22:	4c 89 e9             	mov    rcx,r13
  402a25:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a29:	50                   	push   rax
  402a2a:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402a2e:	55                   	push   rbp
  402a2f:	e8 2c fa ff ff       	call   402460 <print_broken_up_decimal.isra.0>
  402a34:	48 83 c4 20          	add    rsp,0x20
}
  402a38:	48 83 c4 38          	add    rsp,0x38
  402a3c:	5b                   	pop    rbx
  402a3d:	5d                   	pop    rbp
  402a3e:	41 5c                	pop    r12
  402a40:	41 5d                	pop    r13
  402a42:	41 5e                	pop    r14
  402a44:	41 5f                	pop    r15
  402a46:	c3                   	ret    
  402a47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402a4e:	00 00 
    double exp10 = log10_of_positive(abs_number);
  402a50:	66 0f 28 c6          	movapd xmm0,xmm6
  402a54:	e8 07 f8 ff ff       	call   402260 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  402a59:	e8 d2 f7 ff ff       	call   402230 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  402a5e:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  402a60:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  402a62:	e8 89 f8 ff ff       	call   4022f0 <pow10_of_int>
    if (abs_number < p10) {
  402a67:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  402a6b:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  402a6f:	76 0b                	jbe    402a7c <print_exponential_number+0x11c>
      floored_exp10--;
  402a71:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  402a74:	f2 0f 5e 0d 64 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c64]        # 4056e0 <powers_of_10+0x100>
  402a7b:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  402a7c:	8d 43 11             	lea    eax,[rbx+0x11]
  402a7f:	83 f8 22             	cmp    eax,0x22
  402a82:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  402a85:	77 15                	ja     402a9c <print_exponential_number+0x13c>
  402a87:	89 d8                	mov    eax,ebx
  402a89:	48 8d 15 50 2b 00 00 	lea    rdx,[rip+0x2b50]        # 4055e0 <powers_of_10>
  402a90:	f7 d8                	neg    eax
  402a92:	0f 48 c3             	cmovs  eax,ebx
  402a95:	48 98                	cdqe   
  402a97:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  402a9c:	89 d8                	mov    eax,ebx
  402a9e:	c1 e8 1f             	shr    eax,0x1f
  402aa1:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402aa3:	85 db                	test   ebx,ebx
  402aa5:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402aa8:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  402aab:	45 85 c0             	test   r8d,r8d
  402aae:	74 62                	je     402b12 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402ab0:	45 85 db             	test   r11d,r11d
  402ab3:	b8 01 00 00 00       	mov    eax,0x1
  402ab8:	41 0f 45 c3          	cmovne eax,r11d
  402abc:	39 c3                	cmp    ebx,eax
  402abe:	0f 9c c0             	setl   al
  402ac1:	83 fb fc             	cmp    ebx,0xfffffffc
  402ac4:	40 0f 9d c7          	setge  dil
  402ac8:	21 f8                	and    eax,edi
  402aca:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402acd:	44 09 fa             	or     edx,r15d
  402ad0:	eb 21                	jmp    402af3 <print_exponential_number+0x193>
  402ad2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402ad8:	45 85 db             	test   r11d,r11d
  402adb:	b8 01 00 00 00       	mov    eax,0x1
  402ae0:	ba 01 00 00 00       	mov    edx,0x1
  402ae5:	41 0f 45 c3          	cmovne eax,r11d
  402ae9:	85 c0                	test   eax,eax
  402aeb:	41 0f 9f c7          	setg   r15b
  402aef:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402af1:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402af3:	41 83 eb 01          	sub    r11d,0x1
  402af7:	44 89 df             	mov    edi,r11d
  402afa:	29 df                	sub    edi,ebx
  402afc:	45 84 ff             	test   r15b,r15b
  402aff:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402b03:	31 ff                	xor    edi,edi
  402b05:	45 85 db             	test   r11d,r11d
  402b08:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  402b0c:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402b12:	84 d2                	test   dl,dl
  402b14:	0f 85 86 01 00 00    	jne    402ca0 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  402b1a:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402b1c:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402b21:	44 89 da             	mov    edx,r11d
  402b24:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402b27:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402b2b:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  402b2f:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402b33:	e8 38 fd ff ff       	call   402870 <get_normalized_components.isra.0>
  402b38:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402b3d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402b42:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  402b47:	48 83 ff 09          	cmp    rdi,0x9
  402b4b:	7e 0a                	jle    402b57 <print_exponential_number+0x1f7>
      floored_exp10++;
  402b4d:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  402b50:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  402b52:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402b57:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402b5a:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402b5d:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402b61:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402b67:	77 47                	ja     402bb0 <print_exponential_number+0x250>
      0U :
  402b69:	45 85 d2             	test   r10d,r10d
  402b6c:	0f 84 9e 01 00 00    	je     402d10 <print_exponential_number+0x3b0>
  402b72:	41 bf 03 00 00 00    	mov    r15d,0x3
  402b78:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402b7d:	48 83 ec 08          	sub    rsp,0x8
  402b81:	45 31 c9             	xor    r9d,r9d
  402b84:	45 89 d8             	mov    r8d,r11d
  402b87:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402b8b:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  402b8e:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402b92:	50                   	push   rax
  402b93:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402b97:	55                   	push   rbp
  402b98:	e8 c3 f8 ff ff       	call   402460 <print_broken_up_decimal.isra.0>
  402b9d:	48 83 c4 20          	add    rsp,0x20
  402ba1:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402ba6:	eb 61                	jmp    402c09 <print_exponential_number+0x2a9>
  402ba8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402baf:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402bb0:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402bb5:	45 85 d2             	test   r10d,r10d
  402bb8:	0f 85 62 01 00 00    	jne    402d20 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402bbe:	45 89 e1             	mov    r9d,r12d
  402bc1:	b9 00 00 00 00       	mov    ecx,0x0
  402bc6:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402bca:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402bcd:	41 29 c1             	sub    r9d,eax
  402bd0:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402bd3:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402bd7:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402bdb:	48 83 ec 08          	sub    rsp,0x8
  402bdf:	4c 89 e9             	mov    rcx,r13
  402be2:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402be6:	50                   	push   rax
  402be7:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402beb:	55                   	push   rbp
  402bec:	e8 6f f8 ff ff       	call   402460 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402bf1:	48 83 c4 20          	add    rsp,0x20
  402bf5:	45 84 ff             	test   r15b,r15b
  402bf8:	0f 85 3a fe ff ff    	jne    402a38 <print_exponential_number+0xd8>
    print_integer(output,
  402bfe:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402c02:	45 31 d2             	xor    r10d,r10d
  402c05:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402c09:	83 e5 20             	and    ebp,0x20
  402c0c:	4c 89 ef             	mov    rdi,r13
  402c0f:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402c13:	83 fd 01             	cmp    ebp,0x1
  402c16:	19 f6                	sbb    esi,esi
  402c18:	83 e6 20             	and    esi,0x20
  402c1b:	83 c6 45             	add    esi,0x45
  402c1e:	e8 ed ee ff ff       	call   401b10 <putchar_via_gadget>
    print_integer(output,
  402c23:	48 63 c3             	movsxd rax,ebx
  402c26:	89 da                	mov    edx,ebx
  402c28:	45 89 f9             	mov    r9d,r15d
  402c2b:	48 89 c6             	mov    rsi,rax
  402c2e:	c1 ea 1f             	shr    edx,0x1f
  402c31:	b9 0a 00 00 00       	mov    ecx,0xa
  402c36:	4c 89 ef             	mov    rdi,r13
  402c39:	48 f7 de             	neg    rsi
  402c3c:	85 db                	test   ebx,ebx
  402c3e:	48 0f 4f f0          	cmovg  rsi,rax
  402c42:	48 83 ec 08          	sub    rsp,0x8
  402c46:	45 31 c0             	xor    r8d,r8d
  402c49:	6a 05                	push   0x5
  402c4b:	e8 10 f4 ff ff       	call   402060 <print_integer>
    if (flags & FLAGS_LEFT) {
  402c50:	58                   	pop    rax
  402c51:	5a                   	pop    rdx
  402c52:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402c56:	45 85 d2             	test   r10d,r10d
  402c59:	0f 84 d9 fd ff ff    	je     402a38 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402c5f:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402c63:	44 29 f0             	sub    eax,r14d
  402c66:	44 39 e0             	cmp    eax,r12d
  402c69:	0f 83 c9 fd ff ff    	jae    402a38 <print_exponential_number+0xd8>
  402c6f:	90                   	nop
        putchar_via_gadget(output, ' ');
  402c70:	be 20 00 00 00       	mov    esi,0x20
  402c75:	4c 89 ef             	mov    rdi,r13
  402c78:	e8 93 ee ff ff       	call   401b10 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402c7d:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402c81:	44 29 f0             	sub    eax,r14d
  402c84:	44 39 e0             	cmp    eax,r12d
  402c87:	72 e7                	jb     402c70 <print_exponential_number+0x310>
}
  402c89:	48 83 c4 38          	add    rsp,0x38
  402c8d:	5b                   	pop    rbx
  402c8e:	5d                   	pop    rbp
  402c8f:	41 5c                	pop    r12
  402c91:	41 5d                	pop    r13
  402c93:	41 5e                	pop    r14
  402c95:	41 5f                	pop    r15
  402c97:	c3                   	ret    
  402c98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402c9f:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402ca0:	85 f6                	test   esi,esi
  402ca2:	0f 84 2d fd ff ff    	je     4029d5 <print_exponential_number+0x75>
  402ca8:	e9 20 fd ff ff       	jmp    4029cd <print_exponential_number+0x6d>
  402cad:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402cb0:	48 83 ec 08          	sub    rsp,0x8
  402cb4:	4c 89 e9             	mov    rcx,r13
  402cb7:	45 31 c9             	xor    r9d,r9d
  402cba:	45 89 d8             	mov    r8d,r11d
  402cbd:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402cc1:	50                   	push   rax
  402cc2:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402cc6:	55                   	push   rbp
  402cc7:	e8 94 f7 ff ff       	call   402460 <print_broken_up_decimal.isra.0>
  402ccc:	48 83 c4 20          	add    rsp,0x20
}
  402cd0:	48 83 c4 38          	add    rsp,0x38
  402cd4:	5b                   	pop    rbx
  402cd5:	5d                   	pop    rbp
  402cd6:	41 5c                	pop    r12
  402cd8:	41 5d                	pop    r13
  402cda:	41 5e                	pop    r14
  402cdc:	41 5f                	pop    r15
  402cde:	c3                   	ret    
  402cdf:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402ce0:	83 c3 01             	add    ebx,0x1
  402ce3:	66 0f ef c0          	pxor   xmm0,xmm0
  402ce7:	48 8d 05 f2 28 00 00 	lea    rax,[rip+0x28f2]        # 4055e0 <powers_of_10>
  402cee:	48 63 db             	movsxd rbx,ebx
  402cf1:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402cf6:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402cfb:	0f 8a 0e fd ff ff    	jp     402a0f <print_exponential_number+0xaf>
  402d01:	0f 85 08 fd ff ff    	jne    402a0f <print_exponential_number+0xaf>
      precision--;
  402d07:	41 83 eb 01          	sub    r11d,0x1
  402d0b:	e9 ff fc ff ff       	jmp    402a0f <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402d10:	b8 04 00 00 00       	mov    eax,0x4
  402d15:	e9 a4 fe ff ff       	jmp    402bbe <print_exponential_number+0x25e>
  402d1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402d20:	41 bf 04 00 00 00    	mov    r15d,0x4
  402d26:	e9 4d fe ff ff       	jmp    402b78 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402d2b:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402d30:	44 89 de             	mov    esi,r11d
  402d33:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402d37:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402d39:	e8 12 f4 ff ff       	call   402150 <get_components>
  402d3e:	45 31 ff             	xor    r15d,r15d
  402d41:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402d46:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402d4b:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402d50:	e9 f2 fd ff ff       	jmp    402b47 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402d60 <print_floating_point>:
  if (value != value) {
  402d60:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402d64:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402d67:	0f 8a eb 00 00 00    	jp     402e58 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402d6d:	f2 0f 10 0d 8b 29 00 	movsd  xmm1,QWORD PTR [rip+0x298b]        # 405700 <powers_of_10+0x120>
  402d74:	00 
  402d75:	66 0f 2f c8          	comisd xmm1,xmm0
  402d79:	0f 87 21 01 00 00    	ja     402ea0 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402d7f:	66 0f 2f 05 81 29 00 	comisd xmm0,QWORD PTR [rip+0x2981]        # 405708 <powers_of_10+0x128>
  402d86:	00 
  402d87:	77 57                	ja     402de0 <print_floating_point+0x80>
{
  402d89:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402d8d:	45 84 c0             	test   r8b,r8b
  402d90:	75 7e                	jne    402e10 <print_floating_point+0xb0>
  402d92:	66 0f 2f 05 76 29 00 	comisd xmm0,QWORD PTR [rip+0x2976]        # 405710 <powers_of_10+0x130>
  402d99:	00 
  402d9a:	0f 87 e8 00 00 00    	ja     402e88 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402da0:	f2 0f 10 0d 70 29 00 	movsd  xmm1,QWORD PTR [rip+0x2970]        # 405718 <powers_of_10+0x138>
  402da7:	00 
  402da8:	66 0f 2f c8          	comisd xmm1,xmm0
  402dac:	0f 87 d6 00 00 00    	ja     402e88 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402db2:	41 89 c9             	mov    r9d,ecx
  402db5:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402dbc:	0f 85 fe 00 00 00    	jne    402ec0 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402dc2:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402dc7:	49 89 e0             	mov    r8,rsp
  402dca:	44 89 d2             	mov    edx,r10d
  402dcd:	e8 7e f9 ff ff       	call   402750 <print_decimal_number>
}
  402dd2:	48 83 c4 28          	add    rsp,0x28
  402dd6:	c3                   	ret    
  402dd7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402dde:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402de0:	89 c8                	mov    eax,ecx
  402de2:	48 8d 35 30 26 00 00 	lea    rsi,[rip+0x2630]        # 405419 <memcpy+0xdd9>
  402de9:	41 89 c8             	mov    r8d,ecx
  402dec:	44 89 d1             	mov    ecx,r10d
  402def:	83 e0 04             	and    eax,0x4
  402df2:	83 f8 01             	cmp    eax,0x1
  402df5:	19 d2                	sbb    edx,edx
  402df7:	83 c2 04             	add    edx,0x4
  402dfa:	85 c0                	test   eax,eax
  402dfc:	48 8d 05 11 26 00 00 	lea    rax,[rip+0x2611]        # 405414 <memcpy+0xdd4>
  402e03:	48 0f 45 f0          	cmovne rsi,rax
  402e07:	e9 04 ef ff ff       	jmp    401d10 <out_rev_>
  402e0c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402e10:	41 89 c9             	mov    r9d,ecx
  402e13:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402e1a:	74 54                	je     402e70 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402e1c:	b8 01 00 00 00       	mov    eax,0x1
  402e21:	45 31 c9             	xor    r9d,r9d
  402e24:	83 fe 11             	cmp    esi,0x11
  402e27:	76 4c                	jbe    402e75 <print_floating_point+0x115>
  402e29:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402e2e:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402e30:	41 89 c1             	mov    r9d,eax
  402e33:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402e37:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402e3a:	48 83 c0 01          	add    rax,0x1
  402e3e:	41 83 f9 1f          	cmp    r9d,0x1f
  402e42:	77 05                	ja     402e49 <print_floating_point+0xe9>
  402e44:	83 fe 11             	cmp    esi,0x11
  402e47:	77 e7                	ja     402e30 <print_floating_point+0xd0>
  if (prefer_exponential)
  402e49:	45 84 c0             	test   r8b,r8b
  402e4c:	0f 84 75 ff ff ff    	je     402dc7 <print_floating_point+0x67>
  402e52:	eb 21                	jmp    402e75 <print_floating_point+0x115>
  402e54:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402e58:	41 89 c8             	mov    r8d,ecx
  402e5b:	48 8d 35 bb 25 00 00 	lea    rsi,[rip+0x25bb]        # 40541d <memcpy+0xddd>
  402e62:	89 d1                	mov    ecx,edx
  402e64:	ba 03 00 00 00       	mov    edx,0x3
  402e69:	e9 a2 ee ff ff       	jmp    401d10 <out_rev_>
  402e6e:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402e70:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402e75:	49 89 e0             	mov    r8,rsp
  402e78:	44 89 d2             	mov    edx,r10d
  402e7b:	e8 e0 fa ff ff       	call   402960 <print_exponential_number>
}
  402e80:	48 83 c4 28          	add    rsp,0x28
  402e84:	c3                   	ret    
  402e85:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402e88:	45 31 c9             	xor    r9d,r9d
  402e8b:	49 89 e0             	mov    r8,rsp
  402e8e:	44 89 d2             	mov    edx,r10d
  402e91:	e8 ca fa ff ff       	call   402960 <print_exponential_number>
    return;
  402e96:	e9 37 ff ff ff       	jmp    402dd2 <print_floating_point+0x72>
  402e9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402ea0:	41 89 c8             	mov    r8d,ecx
  402ea3:	48 8d 35 77 25 00 00 	lea    rsi,[rip+0x2577]        # 405421 <memcpy+0xde1>
  402eaa:	89 d1                	mov    ecx,edx
  402eac:	ba 04 00 00 00       	mov    edx,0x4
  402eb1:	e9 5a ee ff ff       	jmp    401d10 <out_rev_>
  402eb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402ebd:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402ec0:	b8 01 00 00 00       	mov    eax,0x1
  402ec5:	45 31 c9             	xor    r9d,r9d
  402ec8:	83 fe 11             	cmp    esi,0x11
  402ecb:	0f 87 58 ff ff ff    	ja     402e29 <print_floating_point+0xc9>
  402ed1:	e9 f1 fe ff ff       	jmp    402dc7 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402ee0 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402ee0:	41 57                	push   r15
  402ee2:	41 56                	push   r14
  402ee4:	41 55                	push   r13
  402ee6:	41 54                	push   r12
  402ee8:	55                   	push   rbp
  402ee9:	53                   	push   rbx
  402eea:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402eed:	48 89 f2             	mov    rdx,rsi
{
  402ef0:	48 83 ec 28          	sub    rsp,0x28
  402ef4:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402ef9:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402efc:	40 84 f6             	test   sil,sil
  402eff:	0f 84 e5 00 00 00    	je     402fea <format_string_loop+0x10a>
  402f05:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402f08:	4c 8d 2d 25 25 00 00 	lea    r13,[rip+0x2525]        # 405434 <memcpy+0xdf4>
  402f0f:	90                   	nop
    if (*format != '%') {
  402f10:	40 80 fe 25          	cmp    sil,0x25
  402f14:	0f 85 ae 00 00 00    	jne    402fc8 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402f1a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402f1e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f23:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402f27:	0f 84 bd 00 00 00    	je     402fea <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402f2d:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402f32:	4c 89 cf             	mov    rdi,r9
  402f35:	e8 86 f4 ff ff       	call   4023c0 <parse_flags>
    if (is_digit_(*format)) {
  402f3a:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402f3f:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402f42:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402f45:	89 fe                	mov    esi,edi
  402f47:	e8 74 ed ff ff       	call   401cc0 <is_digit_>
  402f4c:	84 c0                	test   al,al
  402f4e:	0f 85 ac 04 00 00    	jne    403400 <format_string_loop+0x520>
    printf_size_t width = 0U;
  402f54:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  402f57:	40 80 fe 2a          	cmp    sil,0x2a
  402f5b:	0f 84 bf 04 00 00    	je     403420 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  402f61:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  402f64:	40 80 fe 2e          	cmp    sil,0x2e
  402f68:	0f 84 52 04 00 00    	je     4033c0 <format_string_loop+0x4e0>
    switch (*format) {
  402f6e:	8d 46 98             	lea    eax,[rsi-0x68]
  402f71:	3c 12                	cmp    al,0x12
  402f73:	77 2f                	ja     402fa4 <format_string_loop+0xc4>
  402f75:	0f b6 c0             	movzx  eax,al
  402f78:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402f7d:	4c 01 e8             	add    rax,r13
  402f80:	3e ff e0             	notrack jmp rax
  402f83:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  402f88:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  402f8c:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  402f93:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402f98:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  402f9c:	40 84 f6             	test   sil,sil
  402f9f:	74 49                	je     402fea <format_string_loop+0x10a>
  402fa1:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  402fa4:	8d 46 db             	lea    eax,[rsi-0x25]
  402fa7:	3c 53                	cmp    al,0x53
  402fa9:	77 1d                	ja     402fc8 <format_string_loop+0xe8>
  402fab:	48 8d 0d ce 24 00 00 	lea    rcx,[rip+0x24ce]        # 405480 <memcpy+0xe40>
  402fb2:	0f b6 c0             	movzx  eax,al
  402fb5:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402fb9:	48 01 c8             	add    rax,rcx
  402fbc:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  402fbf:	be 25 00 00 00       	mov    esi,0x25
  402fc4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  402fc8:	48 89 ef             	mov    rdi,rbp
  402fcb:	e8 40 eb ff ff       	call   401b10 <putchar_via_gadget>
        format++;
  402fd0:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  402fd5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  402fd9:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  402fde:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  402fe1:	40 84 f6             	test   sil,sil
  402fe4:	0f 85 26 ff ff ff    	jne    402f10 <format_string_loop+0x30>
        break;
    }
  }
}
  402fea:	48 83 c4 28          	add    rsp,0x28
  402fee:	5b                   	pop    rbx
  402fef:	5d                   	pop    rbp
  402ff0:	41 5c                	pop    r12
  402ff2:	41 5d                	pop    r13
  402ff4:	41 5e                	pop    r14
  402ff6:	41 5f                	pop    r15
  402ff8:	c3                   	ret    
  402ff9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  403000:	40 80 fe 64          	cmp    sil,0x64
  403004:	0f 84 6e 06 00 00    	je     403678 <format_string_loop+0x798>
  40300a:	40 80 fe 69          	cmp    sil,0x69
  40300e:	0f 84 64 06 00 00    	je     403678 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  403014:	89 f0                	mov    eax,esi
  403016:	83 e0 df             	and    eax,0xffffffdf
  403019:	3c 58                	cmp    al,0x58
  40301b:	0f 84 37 06 00 00    	je     403658 <format_string_loop+0x778>
        else if (*format == 'o') {
  403021:	b9 08 00 00 00       	mov    ecx,0x8
  403026:	40 80 fe 6f          	cmp    sil,0x6f
  40302a:	74 14                	je     403040 <format_string_loop+0x160>
        else if (*format == 'b') {
  40302c:	b9 02 00 00 00       	mov    ecx,0x2
  403031:	40 80 fe 62          	cmp    sil,0x62
  403035:	74 09                	je     403040 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  403037:	41 83 e3 ef          	and    r11d,0xffffffef
  40303b:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  403040:	44 89 d8             	mov    eax,r11d
        format++;
  403043:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  403047:	83 e0 fe             	and    eax,0xfffffffe
  40304a:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  403051:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  403056:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  40305a:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  40305c:	44 89 da             	mov    edx,r11d
  40305f:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  403065:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  40306c:	0f 84 b6 04 00 00    	je     403528 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  403072:	85 d2                	test   edx,edx
  403074:	0f 85 be 06 00 00    	jne    403738 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  40307a:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403081:	0f 85 b1 06 00 00    	jne    403738 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403087:	41 f6 c3 40          	test   r11b,0x40
  40308b:	0f 84 51 08 00 00    	je     4038e2 <format_string_loop+0xa02>
  403091:	83 f8 2f             	cmp    eax,0x2f
  403094:	0f 87 bc 08 00 00    	ja     403956 <format_string_loop+0xa76>
  40309a:	89 c2                	mov    edx,eax
  40309c:	83 c0 08             	add    eax,0x8
  40309f:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4030a3:	89 03                	mov    DWORD PTR [rbx],eax
  4030a5:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4030a8:	48 63 f8             	movsxd rdi,eax
  4030ab:	89 c2                	mov    edx,eax
  4030ad:	45 89 e1             	mov    r9d,r12d
  4030b0:	45 89 f8             	mov    r8d,r15d
  4030b3:	48 89 fe             	mov    rsi,rdi
  4030b6:	c1 ea 1f             	shr    edx,0x1f
  4030b9:	48 f7 de             	neg    rsi
  4030bc:	85 c0                	test   eax,eax
  4030be:	48 0f 4f f7          	cmovg  rsi,rdi
  4030c2:	48 83 ec 08          	sub    rsp,0x8
  4030c6:	48 89 ef             	mov    rdi,rbp
  4030c9:	41 53                	push   r11
  4030cb:	e8 90 ef ff ff       	call   402060 <print_integer>
  while (*format)
  4030d0:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4030d5:	41 5a                	pop    r10
  4030d7:	41 5b                	pop    r11
  4030d9:	e9 00 ff ff ff       	jmp    402fde <format_string_loop+0xfe>
  4030de:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  4030e0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4030e4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4030e9:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4030ed:	40 84 f6             	test   sil,sil
  4030f0:	0f 84 f4 fe ff ff    	je     402fea <format_string_loop+0x10a>
        if (*format == 'h') {
  4030f6:	40 80 fe 68          	cmp    sil,0x68
  4030fa:	0f 84 d8 03 00 00    	je     4034d8 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  403100:	41 80 cb 80          	or     r11b,0x80
  403104:	48 89 c2             	mov    rdx,rax
  403107:	e9 98 fe ff ff       	jmp    402fa4 <format_string_loop+0xc4>
  40310c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  403110:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403114:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403119:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40311d:	40 84 f6             	test   sil,sil
  403120:	0f 84 c4 fe ff ff    	je     402fea <format_string_loop+0x10a>
        if (*format == 'l') {
  403126:	40 80 fe 6c          	cmp    sil,0x6c
  40312a:	0f 84 d0 03 00 00    	je     403500 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  403130:	41 81 cb 00 02 00 00 	or     r11d,0x200
  403137:	48 89 c2             	mov    rdx,rax
  40313a:	e9 65 fe ff ff       	jmp    402fa4 <format_string_loop+0xc4>
  40313f:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  403140:	89 f2                	mov    edx,esi
  403142:	44 89 d8             	mov    eax,r11d
  403145:	83 e2 df             	and    edx,0xffffffdf
  403148:	80 cc 10             	or     ah,0x10
  40314b:	80 fa 47             	cmp    dl,0x47
  40314e:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  403152:	83 e6 fd             	and    esi,0xfffffffd
  403155:	44 89 d8             	mov    eax,r11d
  403158:	83 c8 20             	or     eax,0x20
  40315b:	40 80 fe 45          	cmp    sil,0x45
  40315f:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403163:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403166:	3d af 00 00 00       	cmp    eax,0xaf
  40316b:	0f 87 9f 03 00 00    	ja     403510 <format_string_loop+0x630>
  403171:	89 c7                	mov    edi,eax
  403173:	83 c0 10             	add    eax,0x10
  403176:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40317a:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  40317d:	41 b8 01 00 00 00    	mov    r8d,0x1
  403183:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  403187:	44 89 e2             	mov    edx,r12d
  40318a:	44 89 d9             	mov    ecx,r11d
  40318d:	44 89 fe             	mov    esi,r15d
  403190:	48 89 ef             	mov    rdi,rbp
  403193:	e8 c8 fb ff ff       	call   402d60 <print_floating_point>
        format++;
  403198:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40319d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  4031a1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  4031a6:	e9 33 fe ff ff       	jmp    402fde <format_string_loop+0xfe>
  4031ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  4031b0:	44 89 d8             	mov    eax,r11d
  4031b3:	83 c8 20             	or     eax,0x20
  4031b6:	40 80 fe 46          	cmp    sil,0x46
  4031ba:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4031be:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  4031c1:	3d af 00 00 00       	cmp    eax,0xaf
  4031c6:	0f 87 74 04 00 00    	ja     403640 <format_string_loop+0x760>
  4031cc:	89 c7                	mov    edi,eax
  4031ce:	83 c0 10             	add    eax,0x10
  4031d1:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4031d5:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  4031d8:	45 31 c0             	xor    r8d,r8d
  4031db:	eb a6                	jmp    403183 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  4031dd:	41 83 e3 02          	and    r11d,0x2
  4031e1:	0f 84 b9 05 00 00    	je     4037a0 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4031e7:	8b 03                	mov    eax,DWORD PTR [rbx]
  4031e9:	83 f8 2f             	cmp    eax,0x2f
  4031ec:	0f 86 a9 06 00 00    	jbe    40389b <format_string_loop+0x9bb>
  4031f2:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4031f6:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4031fa:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4031fe:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403201:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  403204:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40320a:	e8 01 e9 ff ff       	call   401b10 <putchar_via_gadget>
          while (l++ < width) {
  40320f:	41 83 fc 01          	cmp    r12d,0x1
  403213:	0f 86 b7 fd ff ff    	jbe    402fd0 <format_string_loop+0xf0>
  403219:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403220:	be 20 00 00 00       	mov    esi,0x20
  403225:	48 89 ef             	mov    rdi,rbp
  403228:	e8 e3 e8 ff ff       	call   401b10 <putchar_via_gadget>
          while (l++ < width) {
  40322d:	44 89 f8             	mov    eax,r15d
  403230:	41 83 c7 01          	add    r15d,0x1
  403234:	41 39 c4             	cmp    r12d,eax
  403237:	75 e7                	jne    403220 <format_string_loop+0x340>
  403239:	e9 92 fd ff ff       	jmp    402fd0 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  40323e:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  403240:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403247:	83 f8 2f             	cmp    eax,0x2f
  40324a:	0f 87 b0 03 00 00    	ja     403600 <format_string_loop+0x720>
  403250:	89 c2                	mov    edx,eax
  403252:	83 c0 08             	add    eax,0x8
  403255:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403259:	89 03                	mov    DWORD PTR [rbx],eax
  40325b:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40325e:	48 85 f6             	test   rsi,rsi
  403261:	0f 84 b1 03 00 00    	je     403618 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  403267:	48 83 ec 08          	sub    rsp,0x8
  40326b:	31 d2                	xor    edx,edx
  40326d:	41 b9 12 00 00 00    	mov    r9d,0x12
  403273:	45 89 f8             	mov    r8d,r15d
  403276:	41 53                	push   r11
  403278:	b9 10 00 00 00       	mov    ecx,0x10
  40327d:	48 89 ef             	mov    rdi,rbp
  403280:	e8 db ed ff ff       	call   402060 <print_integer>
  403285:	58                   	pop    rax
  403286:	5a                   	pop    rdx
        format++;
  403287:	e9 44 fd ff ff       	jmp    402fd0 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  40328c:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  40328f:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403291:	41 f6 c3 40          	test   r11b,0x40
  403295:	0f 84 f5 02 00 00    	je     403590 <format_string_loop+0x6b0>
  40329b:	83 f8 2f             	cmp    eax,0x2f
  40329e:	0f 87 3c 04 00 00    	ja     4036e0 <format_string_loop+0x800>
  4032a4:	89 c2                	mov    edx,eax
  4032a6:	83 c0 08             	add    eax,0x8
  4032a9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4032ad:	89 03                	mov    DWORD PTR [rbx],eax
  4032af:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4032b2:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  4032b4:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  4032b9:	48 83 c2 01          	add    rdx,0x1
  4032bd:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  4032c2:	e9 17 fd ff ff       	jmp    402fde <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  4032c7:	8b 03                	mov    eax,DWORD PTR [rbx]
  4032c9:	83 f8 2f             	cmp    eax,0x2f
  4032cc:	0f 87 ee 02 00 00    	ja     4035c0 <format_string_loop+0x6e0>
  4032d2:	89 c2                	mov    edx,eax
  4032d4:	83 c0 08             	add    eax,0x8
  4032d7:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4032db:	89 03                	mov    DWORD PTR [rbx],eax
  4032dd:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4032e0:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  4032e4:	48 85 c0             	test   rax,rax
  4032e7:	0f 84 ef 02 00 00    	je     4035dc <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4032ed:	45 85 ff             	test   r15d,r15d
  4032f0:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4032f5:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  4032f9:	41 0f 45 f7          	cmovne esi,r15d
  4032fd:	e8 7e e9 ff ff       	call   401c80 <strnlen_s_>
            l = (l < precision ? l : precision);
  403302:	44 89 df             	mov    edi,r11d
  403305:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  403308:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  40330a:	41 0f 47 c7          	cmova  eax,r15d
  40330e:	81 e7 00 08 00 00    	and    edi,0x800
  403314:	41 89 fe             	mov    r14d,edi
  403317:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  40331a:	41 83 e3 02          	and    r11d,0x2
  40331e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  403323:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  403327:	0f 84 c3 04 00 00    	je     4037f0 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40332d:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403331:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403334:	40 84 f6             	test   sil,sil
  403337:	74 52                	je     40338b <format_string_loop+0x4ab>
  403339:	85 ff                	test   edi,edi
  40333b:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403340:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  403345:	45 85 ff             	test   r15d,r15d
  403348:	75 04                	jne    40334e <format_string_loop+0x46e>
  40334a:	84 c0                	test   al,al
  40334c:	74 3d                	je     40338b <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40334e:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  403352:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  403358:	49 83 c6 01          	add    r14,0x1
  40335c:	48 89 ef             	mov    rdi,rbp
  40335f:	e8 ac e7 ff ff       	call   401b10 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  403364:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  403368:	40 84 f6             	test   sil,sil
  40336b:	74 12                	je     40337f <format_string_loop+0x49f>
  40336d:	44 89 fa             	mov    edx,r15d
  403370:	44 29 f2             	sub    edx,r14d
  403373:	03 14 24             	add    edx,DWORD PTR [rsp]
  403376:	75 e0                	jne    403358 <format_string_loop+0x478>
  403378:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  40337d:	75 d9                	jne    403358 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  40337f:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  403383:	85 c9                	test   ecx,ecx
  403385:	0f 84 45 fc ff ff    	je     402fd0 <format_string_loop+0xf0>
            while (l++ < width) {
  40338b:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  40338f:	44 8d 78 01          	lea    r15d,[rax+0x1]
  403393:	41 39 c4             	cmp    r12d,eax
  403396:	0f 86 34 fc ff ff    	jbe    402fd0 <format_string_loop+0xf0>
  40339c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  4033a0:	be 20 00 00 00       	mov    esi,0x20
  4033a5:	48 89 ef             	mov    rdi,rbp
  4033a8:	e8 63 e7 ff ff       	call   401b10 <putchar_via_gadget>
            while (l++ < width) {
  4033ad:	44 89 f8             	mov    eax,r15d
  4033b0:	41 83 c7 01          	add    r15d,0x1
  4033b4:	41 39 c4             	cmp    r12d,eax
  4033b7:	75 e7                	jne    4033a0 <format_string_loop+0x4c0>
  4033b9:	e9 12 fc ff ff       	jmp    402fd0 <format_string_loop+0xf0>
  4033be:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  4033c0:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  4033c4:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  4033cb:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  4033d0:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4033d4:	40 84 f6             	test   sil,sil
  4033d7:	0f 84 0d fc ff ff    	je     402fea <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  4033dd:	40 0f be fe          	movsx  edi,sil
  4033e1:	e8 da e8 ff ff       	call   401cc0 <is_digit_>
  4033e6:	84 c0                	test   al,al
  4033e8:	0f 85 82 00 00 00    	jne    403470 <format_string_loop+0x590>
      else if (*format == '*') {
  4033ee:	40 80 fe 2a          	cmp    sil,0x2a
  4033f2:	0f 84 98 00 00 00    	je     403490 <format_string_loop+0x5b0>
  4033f8:	48 89 ca             	mov    rdx,rcx
  4033fb:	e9 6e fb ff ff       	jmp    402f6e <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  403400:	4c 89 cf             	mov    rdi,r9
  403403:	e8 c8 e8 ff ff       	call   401cd0 <atou_>
    if (*format == '.') {
  403408:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  40340d:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  403410:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403413:	e9 49 fb ff ff       	jmp    402f61 <format_string_loop+0x81>
  403418:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40341f:	00 
      const int w = va_arg(args, int);
  403420:	8b 03                	mov    eax,DWORD PTR [rbx]
  403422:	83 f8 2f             	cmp    eax,0x2f
  403425:	77 39                	ja     403460 <format_string_loop+0x580>
  403427:	89 c1                	mov    ecx,eax
  403429:	83 c0 08             	add    eax,0x8
  40342c:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403430:	89 03                	mov    DWORD PTR [rbx],eax
  403432:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  403435:	45 85 e4             	test   r12d,r12d
  403438:	79 07                	jns    403441 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  40343a:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  40343e:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  403441:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403445:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40344a:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40344e:	40 84 f6             	test   sil,sil
  403451:	0f 84 93 fb ff ff    	je     402fea <format_string_loop+0x10a>
  403457:	48 89 c2             	mov    rdx,rax
  40345a:	e9 02 fb ff ff       	jmp    402f61 <format_string_loop+0x81>
  40345f:	90                   	nop
      const int w = va_arg(args, int);
  403460:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  403464:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403468:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40346c:	eb c4                	jmp    403432 <format_string_loop+0x552>
  40346e:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  403470:	4c 89 cf             	mov    rdi,r9
  403473:	e8 58 e8 ff ff       	call   401cd0 <atou_>
    switch (*format) {
  403478:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  40347d:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  403480:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403483:	e9 e6 fa ff ff       	jmp    402f6e <format_string_loop+0x8e>
  403488:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40348f:	00 
        const int precision_ = va_arg(args, int);
  403490:	8b 03                	mov    eax,DWORD PTR [rbx]
  403492:	83 f8 2f             	cmp    eax,0x2f
  403495:	0f 87 ed 01 00 00    	ja     403688 <format_string_loop+0x7a8>
  40349b:	89 c1                	mov    ecx,eax
  40349d:	83 c0 08             	add    eax,0x8
  4034a0:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4034a4:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  4034a6:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  4034a9:	31 c0                	xor    eax,eax
  4034ab:	45 85 d2             	test   r10d,r10d
  4034ae:	41 0f 49 c2          	cmovns eax,r10d
  4034b2:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  4034b5:	48 8d 42 02          	lea    rax,[rdx+0x2]
  4034b9:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4034be:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  4034c2:	40 84 f6             	test   sil,sil
  4034c5:	0f 84 1f fb ff ff    	je     402fea <format_string_loop+0x10a>
  4034cb:	48 89 c2             	mov    rdx,rax
  4034ce:	e9 9b fa ff ff       	jmp    402f6e <format_string_loop+0x8e>
  4034d3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  4034d8:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  4034dc:	48 8d 42 02          	lea    rax,[rdx+0x2]
  4034e0:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4034e5:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  4034e9:	40 84 f6             	test   sil,sil
  4034ec:	0f 85 af fa ff ff    	jne    402fa1 <format_string_loop+0xc1>
  4034f2:	e9 f3 fa ff ff       	jmp    402fea <format_string_loop+0x10a>
  4034f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4034fe:	00 00 
          flags |= FLAGS_LONG_LONG;
  403500:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  403507:	eb d3                	jmp    4034dc <format_string_loop+0x5fc>
  403509:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403510:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403514:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403518:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40351c:	e9 5c fc ff ff       	jmp    40317d <format_string_loop+0x29d>
  403521:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  403528:	44 89 de             	mov    esi,r11d
  40352b:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  40352e:	85 d2                	test   edx,edx
  403530:	0f 85 c2 01 00 00    	jne    4036f8 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  403536:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  40353d:	0f 85 b5 01 00 00    	jne    4036f8 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  403543:	41 f6 c3 40          	test   r11b,0x40
  403547:	0f 84 6f 03 00 00    	je     4038bc <format_string_loop+0x9dc>
  40354d:	83 f8 2f             	cmp    eax,0x2f
  403550:	0f 87 d7 03 00 00    	ja     40392d <format_string_loop+0xa4d>
  403556:	89 c2                	mov    edx,eax
  403558:	83 c0 08             	add    eax,0x8
  40355b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40355f:	89 03                	mov    DWORD PTR [rbx],eax
  403561:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  403565:	48 83 ec 08          	sub    rsp,0x8
  403569:	31 d2                	xor    edx,edx
  40356b:	48 89 ef             	mov    rdi,rbp
  40356e:	45 89 e1             	mov    r9d,r12d
  403571:	56                   	push   rsi
  403572:	45 89 f8             	mov    r8d,r15d
  403575:	4c 89 de             	mov    rsi,r11
  403578:	e8 e3 ea ff ff       	call   402060 <print_integer>
  while (*format)
  40357d:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403582:	5e                   	pop    rsi
  403583:	5f                   	pop    rdi
  403584:	e9 55 fa ff ff       	jmp    402fde <format_string_loop+0xfe>
  403589:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403590:	41 f6 c3 80          	test   r11b,0x80
  403594:	0f 84 06 01 00 00    	je     4036a0 <format_string_loop+0x7c0>
  40359a:	83 f8 2f             	cmp    eax,0x2f
  40359d:	0f 87 08 03 00 00    	ja     4038ab <format_string_loop+0x9cb>
  4035a3:	89 c6                	mov    esi,eax
  4035a5:	83 c0 08             	add    eax,0x8
  4035a8:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4035ac:	89 03                	mov    DWORD PTR [rbx],eax
  4035ae:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4035b1:	66 89 08             	mov    WORD PTR [rax],cx
  4035b4:	e9 00 fd ff ff       	jmp    4032b9 <format_string_loop+0x3d9>
  4035b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  4035c0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4035c4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4035c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4035cc:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  4035cf:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  4035d3:	48 85 c0             	test   rax,rax
  4035d6:	0f 85 11 fd ff ff    	jne    4032ed <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  4035dc:	45 89 d8             	mov    r8d,r11d
  4035df:	44 89 e1             	mov    ecx,r12d
  4035e2:	ba 06 00 00 00       	mov    edx,0x6
  4035e7:	48 89 ef             	mov    rdi,rbp
  4035ea:	48 8d 35 35 1e 00 00 	lea    rsi,[rip+0x1e35]        # 405426 <memcpy+0xde6>
  4035f1:	e8 1a e7 ff ff       	call   401d10 <out_rev_>
  4035f6:	e9 d5 f9 ff ff       	jmp    402fd0 <format_string_loop+0xf0>
  4035fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  403600:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403604:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403608:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40360c:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40360f:	48 85 f6             	test   rsi,rsi
  403612:	0f 85 4f fc ff ff    	jne    403267 <format_string_loop+0x387>
  403618:	45 89 d8             	mov    r8d,r11d
  40361b:	b9 12 00 00 00       	mov    ecx,0x12
  403620:	ba 05 00 00 00       	mov    edx,0x5
  403625:	48 89 ef             	mov    rdi,rbp
  403628:	48 8d 35 fe 1d 00 00 	lea    rsi,[rip+0x1dfe]        # 40542d <memcpy+0xded>
  40362f:	e8 dc e6 ff ff       	call   401d10 <out_rev_>
  403634:	e9 97 f9 ff ff       	jmp    402fd0 <format_string_loop+0xf0>
  403639:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  403640:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403644:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403648:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40364c:	e9 87 fb ff ff       	jmp    4031d8 <format_string_loop+0x2f8>
  403651:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  403658:	44 89 d8             	mov    eax,r11d
  40365b:	41 83 cb 20          	or     r11d,0x20
  40365f:	40 80 fe 58          	cmp    sil,0x58
  403663:	b9 10 00 00 00       	mov    ecx,0x10
  403668:	44 0f 45 d8          	cmovne r11d,eax
  40366c:	e9 cf f9 ff ff       	jmp    403040 <format_string_loop+0x160>
  403671:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  403678:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  40367f:	e9 90 f9 ff ff       	jmp    403014 <format_string_loop+0x134>
  403684:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  403688:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  40368c:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403690:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403694:	e9 0d fe ff ff       	jmp    4034a6 <format_string_loop+0x5c6>
  403699:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  4036a0:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4036a7:	0f 85 d3 00 00 00    	jne    403780 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4036ad:	41 81 e3 00 04 00 00 	and    r11d,0x400
  4036b4:	0f 85 c6 00 00 00    	jne    403780 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  4036ba:	83 f8 2f             	cmp    eax,0x2f
  4036bd:	0f 87 a4 02 00 00    	ja     403967 <format_string_loop+0xa87>
  4036c3:	89 c6                	mov    esi,eax
  4036c5:	83 c0 08             	add    eax,0x8
  4036c8:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  4036cc:	89 03                	mov    DWORD PTR [rbx],eax
  4036ce:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  4036d1:	89 08                	mov    DWORD PTR [rax],ecx
  4036d3:	e9 e1 fb ff ff       	jmp    4032b9 <format_string_loop+0x3d9>
  4036d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4036df:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  4036e0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036e4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036e8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036ec:	e9 be fb ff ff       	jmp    4032af <format_string_loop+0x3cf>
  4036f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  4036f8:	83 f8 2f             	cmp    eax,0x2f
  4036fb:	0f 87 78 01 00 00    	ja     403879 <format_string_loop+0x999>
  403701:	89 c7                	mov    edi,eax
  403703:	83 c0 08             	add    eax,0x8
  403706:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40370a:	89 03                	mov    DWORD PTR [rbx],eax
  40370c:	48 83 ec 08          	sub    rsp,0x8
  403710:	45 89 e1             	mov    r9d,r12d
  403713:	45 89 f8             	mov    r8d,r15d
  403716:	31 d2                	xor    edx,edx
  403718:	56                   	push   rsi
  403719:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  40371c:	48 89 ef             	mov    rdi,rbp
  40371f:	e8 3c e9 ff ff       	call   402060 <print_integer>
  while (*format)
  403724:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403729:	41 58                	pop    r8
  40372b:	41 59                	pop    r9
  40372d:	e9 ac f8 ff ff       	jmp    402fde <format_string_loop+0xfe>
  403732:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403738:	83 f8 2f             	cmp    eax,0x2f
  40373b:	0f 87 27 01 00 00    	ja     403868 <format_string_loop+0x988>
  403741:	89 c2                	mov    edx,eax
  403743:	83 c0 08             	add    eax,0x8
  403746:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40374a:	89 03                	mov    DWORD PTR [rbx],eax
  40374c:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  40374f:	45 89 e1             	mov    r9d,r12d
  403752:	45 89 f8             	mov    r8d,r15d
  403755:	48 89 ef             	mov    rdi,rbp
  403758:	48 89 d6             	mov    rsi,rdx
  40375b:	48 f7 de             	neg    rsi
  40375e:	48 0f 48 f2          	cmovs  rsi,rdx
  403762:	48 83 ec 08          	sub    rsp,0x8
  403766:	48 c1 ea 3f          	shr    rdx,0x3f
  40376a:	41 53                	push   r11
  40376c:	e8 ef e8 ff ff       	call   402060 <print_integer>
  while (*format)
  403771:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403776:	41 5c                	pop    r12
  403778:	41 5e                	pop    r14
  40377a:	e9 5f f8 ff ff       	jmp    402fde <format_string_loop+0xfe>
  40377f:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403780:	83 f8 2f             	cmp    eax,0x2f
  403783:	0f 87 7b 01 00 00    	ja     403904 <format_string_loop+0xa24>
  403789:	89 c6                	mov    esi,eax
  40378b:	83 c0 08             	add    eax,0x8
  40378e:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  403792:	89 03                	mov    DWORD PTR [rbx],eax
  403794:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403797:	48 89 08             	mov    QWORD PTR [rax],rcx
  40379a:	e9 1a fb ff ff       	jmp    4032b9 <format_string_loop+0x3d9>
  40379f:	90                   	nop
          while (l++ < width) {
  4037a0:	41 83 fc 01          	cmp    r12d,0x1
  4037a4:	76 23                	jbe    4037c9 <format_string_loop+0x8e9>
  4037a6:	41 bf 02 00 00 00    	mov    r15d,0x2
  4037ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  4037b0:	be 20 00 00 00       	mov    esi,0x20
  4037b5:	48 89 ef             	mov    rdi,rbp
  4037b8:	e8 53 e3 ff ff       	call   401b10 <putchar_via_gadget>
          while (l++ < width) {
  4037bd:	44 89 f8             	mov    eax,r15d
  4037c0:	41 83 c7 01          	add    r15d,0x1
  4037c4:	41 39 c4             	cmp    r12d,eax
  4037c7:	75 e7                	jne    4037b0 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4037c9:	8b 03                	mov    eax,DWORD PTR [rbx]
  4037cb:	83 f8 2f             	cmp    eax,0x2f
  4037ce:	0f 87 b6 00 00 00    	ja     40388a <format_string_loop+0x9aa>
  4037d4:	89 c2                	mov    edx,eax
  4037d6:	83 c0 08             	add    eax,0x8
  4037d9:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037dd:	89 03                	mov    DWORD PTR [rbx],eax
  4037df:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4037e2:	48 89 ef             	mov    rdi,rbp
  4037e5:	e8 26 e3 ff ff       	call   401b10 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  4037ea:	e9 e1 f7 ff ff       	jmp    402fd0 <format_string_loop+0xf0>
  4037ef:	90                   	nop
            while (l++ < width) {
  4037f0:	89 c1                	mov    ecx,eax
  4037f2:	8d 40 01             	lea    eax,[rax+0x1]
  4037f5:	41 39 cc             	cmp    r12d,ecx
  4037f8:	0f 86 bc 01 00 00    	jbe    4039ba <format_string_loop+0xada>
  4037fe:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  403803:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  403807:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40380e:	00 00 
              putchar_via_gadget(output, ' ');
  403810:	be 20 00 00 00       	mov    esi,0x20
  403815:	48 89 ef             	mov    rdi,rbp
  403818:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40381c:	e8 ef e2 ff ff       	call   401b10 <putchar_via_gadget>
            while (l++ < width) {
  403821:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  403825:	89 c2                	mov    edx,eax
  403827:	83 c0 01             	add    eax,0x1
  40382a:	41 39 d4             	cmp    r12d,edx
  40382d:	75 e1                	jne    403810 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  40382f:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  403833:	0f be 30             	movsx  esi,BYTE PTR [rax]
  403836:	40 84 f6             	test   sil,sil
  403839:	0f 84 91 f7 ff ff    	je     402fd0 <format_string_loop+0xf0>
  40383f:	45 85 f6             	test   r14d,r14d
  403842:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  403847:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  40384c:	45 85 ff             	test   r15d,r15d
  40384f:	0f 85 f9 fa ff ff    	jne    40334e <format_string_loop+0x46e>
  403855:	84 c0                	test   al,al
  403857:	0f 85 f1 fa ff ff    	jne    40334e <format_string_loop+0x46e>
  40385d:	e9 6e f7 ff ff       	jmp    402fd0 <format_string_loop+0xf0>
  403862:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403868:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40386c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403870:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403874:	e9 d3 fe ff ff       	jmp    40374c <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403879:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  40387d:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403881:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403885:	e9 82 fe ff ff       	jmp    40370c <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40388a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40388e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403892:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403896:	e9 44 ff ff ff       	jmp    4037df <format_string_loop+0x8ff>
  40389b:	89 c2                	mov    edx,eax
  40389d:	83 c0 08             	add    eax,0x8
  4038a0:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4038a4:	89 03                	mov    DWORD PTR [rbx],eax
  4038a6:	e9 53 f9 ff ff       	jmp    4031fe <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  4038ab:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4038af:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4038b3:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4038b7:	e9 f2 fc ff ff       	jmp    4035ae <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4038bc:	41 81 e3 80 00 00 00 	and    r11d,0x80
  4038c3:	74 79                	je     40393e <format_string_loop+0xa5e>
  4038c5:	83 f8 2f             	cmp    eax,0x2f
  4038c8:	0f 87 db 00 00 00    	ja     4039a9 <format_string_loop+0xac9>
  4038ce:	89 c2                	mov    edx,eax
  4038d0:	83 c0 08             	add    eax,0x8
  4038d3:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4038d7:	89 03                	mov    DWORD PTR [rbx],eax
  4038d9:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  4038dd:	e9 83 fc ff ff       	jmp    403565 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4038e2:	41 f6 c3 80          	test   r11b,0x80
  4038e6:	74 2d                	je     403915 <format_string_loop+0xa35>
  4038e8:	83 f8 2f             	cmp    eax,0x2f
  4038eb:	0f 87 a7 00 00 00    	ja     403998 <format_string_loop+0xab8>
  4038f1:	89 c2                	mov    edx,eax
  4038f3:	83 c0 08             	add    eax,0x8
  4038f6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4038fa:	89 03                	mov    DWORD PTR [rbx],eax
  4038fc:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  4038ff:	e9 a4 f7 ff ff       	jmp    4030a8 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403904:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403908:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40390c:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403910:	e9 7f fe ff ff       	jmp    403794 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403915:	83 f8 2f             	cmp    eax,0x2f
  403918:	76 6c                	jbe    403986 <format_string_loop+0xaa6>
  40391a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40391e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403922:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403926:	8b 02                	mov    eax,DWORD PTR [rdx]
  403928:	e9 7b f7 ff ff       	jmp    4030a8 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  40392d:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403931:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403935:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403939:	e9 23 fc ff ff       	jmp    403561 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40393e:	83 f8 2f             	cmp    eax,0x2f
  403941:	77 35                	ja     403978 <format_string_loop+0xa98>
  403943:	89 c2                	mov    edx,eax
  403945:	83 c0 08             	add    eax,0x8
  403948:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40394c:	89 03                	mov    DWORD PTR [rbx],eax
  40394e:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  403951:	e9 0f fc ff ff       	jmp    403565 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403956:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40395a:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40395e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403962:	e9 3e f7 ff ff       	jmp    4030a5 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  403967:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40396b:	48 8d 46 08          	lea    rax,[rsi+0x8]
  40396f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403973:	e9 56 fd ff ff       	jmp    4036ce <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403978:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40397c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403980:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403984:	eb c8                	jmp    40394e <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403986:	89 c2                	mov    edx,eax
  403988:	83 c0 08             	add    eax,0x8
  40398b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40398f:	89 03                	mov    DWORD PTR [rbx],eax
  403991:	8b 02                	mov    eax,DWORD PTR [rdx]
  403993:	e9 10 f7 ff ff       	jmp    4030a8 <format_string_loop+0x1c8>
  403998:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40399c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4039a0:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4039a4:	e9 53 ff ff ff       	jmp    4038fc <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4039a9:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4039ad:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4039b1:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4039b5:	e9 1f ff ff ff       	jmp    4038d9 <format_string_loop+0x9f9>
            while (l++ < width) {
  4039ba:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  4039be:	e9 6c fe ff ff       	jmp    40382f <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

00000000004039d0 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  4039d0:	53                   	push   rbx
  4039d1:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  4039d4:	e8 07 f5 ff ff       	call   402ee0 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  4039d9:	48 89 df             	mov    rdi,rbx
  4039dc:	e8 6f e1 ff ff       	call   401b50 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  4039e1:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  4039e4:	5b                   	pop    rbx
  4039e5:	c3                   	ret    

Disassembly of section .text.vprintf:

00000000004039f0 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  4039f0:	f3 0f 1e fa          	endbr64 
  4039f4:	55                   	push   rbp
  4039f5:	49 89 f3             	mov    r11,rsi
  4039f8:	49 89 fa             	mov    r10,rdi
  4039fb:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  4039ff:	48 89 e5             	mov    rbp,rsp
  403a02:	48 89 ef             	mov    rdi,rbp
  403a05:	e8 56 e2 ff ff       	call   401c60 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403a0a:	48 89 ef             	mov    rdi,rbp
  403a0d:	4c 89 da             	mov    rdx,r11
  403a10:	4c 89 d6             	mov    rsi,r10
  403a13:	e8 b8 ff ff ff       	call   4039d0 <vsnprintf_impl>
}
  403a18:	48 83 c4 20          	add    rsp,0x20
  403a1c:	5d                   	pop    rbp
  403a1d:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403a20 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403a20:	f3 0f 1e fa          	endbr64 
  403a24:	55                   	push   rbp
  403a25:	49 89 d1             	mov    r9,rdx
  403a28:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  403a2b:	48 89 f2             	mov    rdx,rsi
  403a2e:	48 89 fe             	mov    rsi,rdi
{
  403a31:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  403a35:	48 89 e5             	mov    rbp,rsp
  403a38:	48 89 ef             	mov    rdi,rbp
  403a3b:	e8 80 e1 ff ff       	call   401bc0 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403a40:	48 89 ef             	mov    rdi,rbp
  403a43:	4c 89 d2             	mov    rdx,r10
  403a46:	4c 89 ce             	mov    rsi,r9
  403a49:	e8 82 ff ff ff       	call   4039d0 <vsnprintf_impl>
}
  403a4e:	48 83 c4 20          	add    rsp,0x20
  403a52:	5d                   	pop    rbp
  403a53:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000403a60 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  403a60:	f3 0f 1e fa          	endbr64 
  403a64:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  403a67:	48 89 f2             	mov    rdx,rsi
  403a6a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403a6f:	e9 ac ff ff ff       	jmp    403a20 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000403a80 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  403a80:	f3 0f 1e fa          	endbr64 
  403a84:	55                   	push   rbp
  403a85:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403a88:	48 89 f2             	mov    rdx,rsi
  403a8b:	48 89 fe             	mov    rsi,rdi
{
  403a8e:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403a92:	48 89 e5             	mov    rbp,rsp
  403a95:	48 89 ef             	mov    rdi,rbp
  403a98:	e8 83 e1 ff ff       	call   401c20 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403a9d:	48 89 ef             	mov    rdi,rbp
  403aa0:	48 89 ca             	mov    rdx,rcx
  403aa3:	4c 89 ce             	mov    rsi,r9
  403aa6:	e8 25 ff ff ff       	call   4039d0 <vsnprintf_impl>
}
  403aab:	48 83 c4 20          	add    rsp,0x20
  403aaf:	5d                   	pop    rbp
  403ab0:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403ac0 <printf>:

int printf_(const char* format, ...)
{
  403ac0:	f3 0f 1e fa          	endbr64 
  403ac4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403acb:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403ad0:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403ad5:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403ada:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403adf:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403ae4:	84 c0                	test   al,al
  403ae6:	74 37                	je     403b1f <printf+0x5f>
  403ae8:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403aed:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403af2:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403af7:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403afe:	00 
  403aff:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403b06:	00 
  403b07:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403b0e:	00 
  403b0f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403b16:	00 
  403b17:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403b1e:	00 
  va_list args;
  va_start(args, format);
  403b1f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403b26:	00 
  const int ret = vprintf_(format, args);
  403b27:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  403b2c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403b33:	00 
  403b34:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403b39:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403b3e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403b45:	00 
  403b46:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  403b4b:	e8 a0 fe ff ff       	call   4039f0 <vprintf>
  va_end(args);
  return ret;
}
  403b50:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403b57:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000403b60 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  403b60:	f3 0f 1e fa          	endbr64 
  403b64:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403b6b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403b70:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403b75:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403b7a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403b7f:	84 c0                	test   al,al
  403b81:	74 37                	je     403bba <sprintf+0x5a>
  403b83:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403b88:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403b8d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403b92:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403b99:	00 
  403b9a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403ba1:	00 
  403ba2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403ba9:	00 
  403baa:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403bb1:	00 
  403bb2:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403bb9:	00 
  va_list args;
  va_start(args, format);
  403bba:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403bc1:	00 
  const int ret = vsprintf_(s, format, args);
  403bc2:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403bc7:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403bce:	00 
  403bcf:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403bd4:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403bd9:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403be0:	00 
  403be1:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403be6:	e8 75 fe ff ff       	call   403a60 <vsprintf>
  va_end(args);
  return ret;
}
  403beb:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403bf2:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403c00 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403c00:	f3 0f 1e fa          	endbr64 
  403c04:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403c0b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403c10:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403c15:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403c1a:	84 c0                	test   al,al
  403c1c:	74 37                	je     403c55 <snprintf+0x55>
  403c1e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403c23:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403c28:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403c2d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403c34:	00 
  403c35:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403c3c:	00 
  403c3d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403c44:	00 
  403c45:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403c4c:	00 
  403c4d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403c54:	00 
  va_list args;
  va_start(args, format);
  403c55:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403c5c:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403c5d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403c62:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403c69:	00 
  403c6a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403c6f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403c74:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403c7b:	00 
  403c7c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403c81:	e8 9a fd ff ff       	call   403a20 <vsnprintf>
  va_end(args);
  return ret;
}
  403c86:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403c8d:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403c90 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403c90:	f3 0f 1e fa          	endbr64 
  403c94:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403c9b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403ca0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403ca5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403caa:	84 c0                	test   al,al
  403cac:	74 37                	je     403ce5 <fctprintf+0x55>
  403cae:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403cb3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403cb8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403cbd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403cc4:	00 
  403cc5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403ccc:	00 
  403ccd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403cd4:	00 
  403cd5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403cdc:	00 
  403cdd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403ce4:	00 
  va_list args;
  va_start(args, format);
  403ce5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403cec:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403ced:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403cf2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403cf9:	00 
  403cfa:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403cff:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403d04:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403d0b:	00 
  403d0c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403d11:	e8 6a fd ff ff       	call   403a80 <vfctprintf>
  va_end(args);
  return ret;
}
  403d16:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403d1d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403d20 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403d20:	f3 0f 1e fa          	endbr64 
  403d24:	41 54                	push   r12
  403d26:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403d29:	40 0f be ff          	movsx  edi,dil
  403d2d:	e8 0e 00 00 00       	call   403d40 <putchar_>
	return c;
}
  403d32:	44 89 e0             	mov    eax,r12d
  403d35:	41 5c                	pop    r12
  403d37:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403d40 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403d40:	f3 0f 1e fa          	endbr64 
  403d44:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403d48:	ba 01 00 00 00       	mov    edx,0x1
  403d4d:	31 c0                	xor    eax,eax
void putchar_(char c){
  403d4f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403d54:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403d59:	bf 01 00 00 00       	mov    edi,0x1
  403d5e:	e8 0d d3 ff ff       	call   401070 <write>
  403d63:	48 83 c4 18          	add    rsp,0x18
  403d67:	c3                   	ret    

Disassembly of section .text.max:

0000000000403d70 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403d70:	48 39 f7             	cmp    rdi,rsi
  403d73:	48 89 f0             	mov    rax,rsi
  403d76:	48 0f 43 c7          	cmovae rax,rdi
}
  403d7a:	c3                   	ret    

Disassembly of section .text.align:

0000000000403d80 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403d80:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403d85:	48 f7 de             	neg    rsi
  403d88:	48 21 f0             	and    rax,rsi
}
  403d8b:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403d90 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403d90:	31 c0                	xor    eax,eax
  403d92:	83 ff 01             	cmp    edi,0x1
  403d95:	76 4e                	jbe    403de5 <granules_to_chunk_kind+0x55>
  403d97:	b8 01 00 00 00       	mov    eax,0x1
  403d9c:	83 ff 02             	cmp    edi,0x2
  403d9f:	74 44                	je     403de5 <granules_to_chunk_kind+0x55>
  403da1:	83 ff 03             	cmp    edi,0x3
  403da4:	74 5a                	je     403e00 <granules_to_chunk_kind+0x70>
  403da6:	83 ff 04             	cmp    edi,0x4
  403da9:	74 45                	je     403df0 <granules_to_chunk_kind+0x60>
  403dab:	83 ff 05             	cmp    edi,0x5
  403dae:	74 60                	je     403e10 <granules_to_chunk_kind+0x80>
  403db0:	83 ff 06             	cmp    edi,0x6
  403db3:	74 2b                	je     403de0 <granules_to_chunk_kind+0x50>
  403db5:	b8 06 00 00 00       	mov    eax,0x6
  403dba:	83 ff 08             	cmp    edi,0x8
  403dbd:	76 26                	jbe    403de5 <granules_to_chunk_kind+0x55>
  403dbf:	b8 07 00 00 00       	mov    eax,0x7
  403dc4:	83 ff 0a             	cmp    edi,0xa
  403dc7:	76 1c                	jbe    403de5 <granules_to_chunk_kind+0x55>
  403dc9:	b8 08 00 00 00       	mov    eax,0x8
  403dce:	83 ff 10             	cmp    edi,0x10
  403dd1:	76 12                	jbe    403de5 <granules_to_chunk_kind+0x55>
  403dd3:	83 ff 21             	cmp    edi,0x21
  403dd6:	19 c0                	sbb    eax,eax
  403dd8:	24 0a                	and    al,0xa
  403dda:	05 ff 00 00 00       	add    eax,0xff
  403ddf:	c3                   	ret    
  403de0:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403de5:	c3                   	ret    
  403de6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403ded:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403df0:	b8 03 00 00 00       	mov    eax,0x3
  403df5:	c3                   	ret    
  403df6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403dfd:	00 00 00 
  403e00:	b8 02 00 00 00       	mov    eax,0x2
  403e05:	c3                   	ret    
  403e06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403e0d:	00 00 00 
  403e10:	b8 04 00 00 00       	mov    eax,0x4
  403e15:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403e20 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403e20:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403e25:	83 ff 09             	cmp    edi,0x9
  403e28:	77 0c                	ja     403e36 <chunk_kind_to_granules+0x16>
  403e2a:	89 ff                	mov    edi,edi
  403e2c:	48 8d 05 ed 18 00 00 	lea    rax,[rip+0x18ed]        # 405720 <CSWTCH.34>
  403e33:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403e36:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403e40 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403e40:	48 89 f8             	mov    rax,rdi
  403e43:	66 31 c0             	xor    ax,ax
}
  403e46:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403e50 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403e50:	89 f8                	mov    eax,edi
  403e52:	0f b6 c4             	movzx  eax,ah
}
  403e55:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403e60 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403e60:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403e64:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403e70 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403e70:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403e74:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403e80 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403e80:	89 f6                	mov    esi,esi
  403e82:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403e85:	48 c1 e6 08          	shl    rsi,0x8
  403e89:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403e8d:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403e90 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403e90:	48 8b 0d 19 1b 00 00 	mov    rcx,QWORD PTR [rip+0x1b19]        # 4059b0 <large_objects>
  403e97:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403e9e:	00 
  403e9f:	76 07                	jbe    403ea8 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403ea1:	c3                   	ret    
  403ea2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403ea8:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403eab:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403eb0:	e8 9b ff ff ff       	call   403e50 <get_chunk_index>
  403eb5:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403eb7:	e8 84 ff ff ff       	call   403e40 <get_page>
  403ebc:	48 89 c7             	mov    rdi,rax
  403ebf:	e8 bc ff ff ff       	call   403e80 <allocate_chunk>
		large_objects = large_objects->next;
  403ec4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403ec7:	48 89 15 e2 1a 00 00 	mov    QWORD PTR [rip+0x1ae2],rdx        # 4059b0 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403ece:	48 8b 15 33 1b 00 00 	mov    rdx,QWORD PTR [rip+0x1b33]        # 405a08 <small_object_freelists+0x48>
  403ed5:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403ed8:	48 89 05 29 1b 00 00 	mov    QWORD PTR [rip+0x1b29],rax        # 405a08 <small_object_freelists+0x48>
}
  403edf:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403ee0 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403ee0:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403ee4:	48 c1 e8 03          	shr    rax,0x3
}
  403ee8:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403ee9 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403ee9:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403ef0 <maybe_merge_free_large_object>:
{
  403ef0:	53                   	push   rbx
	struct large_object* obj = *prev;
  403ef1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403ef4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403ef7:	48 8d 1d b2 1a 00 00 	lea    rbx,[rip+0x1ab2]        # 4059b0 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403efe:	4c 89 df             	mov    rdi,r11
  403f01:	e8 5a ff ff ff       	call   403e60 <get_large_object_payload>
  403f06:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403f0a:	49 89 c2             	mov    r10,rax
  403f0d:	0f 1f 00             	nop    DWORD PTR [rax]
  403f10:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403f14:	be 00 01 00 00       	mov    esi,0x100
  403f19:	48 89 d7             	mov    rdi,rdx
  403f1c:	e8 5f fe ff ff       	call   403d80 <align>
  403f21:	48 39 c2             	cmp    rdx,rax
  403f24:	0f 85 bf ff ff ff    	jne    403ee9 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403f2a:	e8 21 ff ff ff       	call   403e50 <get_chunk_index>
  403f2f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403f31:	85 c9                	test   ecx,ecx
  403f33:	74 53                	je     403f88 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403f35:	e8 06 ff ff ff       	call   403e40 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403f3a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403f3e:	75 48                	jne    403f88 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403f40:	48 8b 05 69 1a 00 00 	mov    rax,QWORD PTR [rip+0x1a69]        # 4059b0 <large_objects>
			ASSERT(walk);
  403f47:	48 85 c0             	test   rax,rax
  403f4a:	0f 84 99 ff ff ff    	je     403ee9 <maybe_merge_free_large_object.cold>
			if(walk == next)
  403f50:	48 39 c2             	cmp    rdx,rax
  403f53:	74 3b                	je     403f90 <maybe_merge_free_large_object+0xa0>
  403f55:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  403f58:	48 89 c1             	mov    rcx,rax
  403f5b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  403f5e:	48 85 c0             	test   rax,rax
  403f61:	74 32                	je     403f95 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  403f63:	48 39 c2             	cmp    rdx,rax
  403f66:	75 f0                	jne    403f58 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403f68:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  403f6c:	4c 39 c8             	cmp    rax,r9
  403f6f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403f73:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  403f78:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  403f7b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  403f7f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  403f82:	eb 8c                	jmp    403f10 <maybe_merge_free_large_object+0x20>
  403f84:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  403f88:	4c 89 c8             	mov    rax,r9
  403f8b:	5b                   	pop    rbx
  403f8c:	c3                   	ret    
  403f8d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403f90:	48 89 d9             	mov    rcx,rbx
  403f93:	eb d3                	jmp    403f68 <maybe_merge_free_large_object+0x78>
  403f95:	e9 4f ff ff ff       	jmp    403ee9 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000403fa0 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  403fa0:	8b 05 fe 19 00 00    	mov    eax,DWORD PTR [rip+0x19fe]        # 4059a4 <pending_large_object_compact>
  403fa6:	85 c0                	test   eax,eax
  403fa8:	74 2c                	je     403fd6 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  403faa:	48 83 3d fe 19 00 00 	cmp    QWORD PTR [rip+0x19fe],0x0        # 4059b0 <large_objects>
  403fb1:	00 
		pending_large_object_compact = 0;
  403fb2:	c7 05 e8 19 00 00 00 	mov    DWORD PTR [rip+0x19e8],0x0        # 4059a4 <pending_large_object_compact>
  403fb9:	00 00 00 
		while(*prev)
  403fbc:	74 18                	je     403fd6 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  403fbe:	48 8d 3d eb 19 00 00 	lea    rdi,[rip+0x19eb]        # 4059b0 <large_objects>
  403fc5:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  403fc8:	e8 23 ff ff ff       	call   403ef0 <maybe_merge_free_large_object>
  403fcd:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  403fd0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  403fd4:	75 f2                	jne    403fc8 <maybe_compact_free_large_objects+0x28>
}
  403fd6:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000403fd7 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  403fd7:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000403fe0 <get_small_object_freelist>:
  403fe0:	83 ff 09             	cmp    edi,0x9
  403fe3:	0f 87 ee ff ff ff    	ja     403fd7 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  403fe9:	89 ff                	mov    edi,edi
  403feb:	48 8d 05 ce 19 00 00 	lea    rax,[rip+0x19ce]        # 4059c0 <small_object_freelists>
  403ff2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  403ff6:	c3                   	ret    

Disassembly of section .text.free:

0000000000404000 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  404000:	f3 0f 1e fa          	endbr64 
  404004:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  404007:	48 85 ff             	test   rdi,rdi
  40400a:	74 2a                	je     404036 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  40400c:	e8 2f fe ff ff       	call   403e40 <get_page>
  404011:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  404014:	e8 37 fe ff ff       	call   403e50 <get_chunk_index>
  404019:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  40401b:	89 c0                	mov    eax,eax
  40401d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  404022:	40 80 ff ff          	cmp    dil,0xff
  404026:	74 18                	je     404040 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  404028:	e8 b3 ff ff ff       	call   403fe0 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  40402d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404030:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  404033:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  404036:	c3                   	ret    
  404037:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40403e:	00 00 
		struct large_object* obj = get_large_object(ptr);
  404040:	4c 89 c7             	mov    rdi,r8
  404043:	e8 28 fe ff ff       	call   403e70 <get_large_object>
		obj->next = large_objects;
  404048:	48 8b 15 61 19 00 00 	mov    rdx,QWORD PTR [rip+0x1961]        # 4059b0 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  40404f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  404052:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  404055:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  40405a:	48 89 05 4f 19 00 00 	mov    QWORD PTR [rip+0x194f],rax        # 4059b0 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  404061:	e8 1a fe ff ff       	call   403e80 <allocate_chunk>
		pending_large_object_compact = 1;
  404066:	c7 05 34 19 00 00 01 	mov    DWORD PTR [rip+0x1934],0x1        # 4059a4 <pending_large_object_compact>
  40406d:	00 00 00 
  404070:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000404080 <heap_size_in_pages>:
int heap_size_in_pages()
{
  404080:	f3 0f 1e fa          	endbr64 
  404084:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  404088:	31 ff                	xor    edi,edi
  40408a:	e8 31 d1 ff ff       	call   4011c0 <sbrk>
  40408f:	48 c7 c2 10 5a 40 00 	mov    rdx,0x405a10
  404096:	2b 02                	sub    eax,DWORD PTR [rdx]
  404098:	48 83 c4 08          	add    rsp,0x8
  40409c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

000000000040409d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  40409d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

00000000004040a0 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4040a0:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  4040a2:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4040a4:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  4040a6:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  4040ad:	55                   	push   rbp
  4040ae:	48 89 f5             	mov    rbp,rsi
  4040b1:	53                   	push   rbx
  4040b2:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  4040b6:	e8 c5 ff ff ff       	call   404080 <heap_size_in_pages>
	if(!walloc_heap_size)
  4040bb:	48 8b 3d e6 18 00 00 	mov    rdi,QWORD PTR [rip+0x18e6]        # 4059a8 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  4040c2:	c1 e0 10             	shl    eax,0x10
  4040c5:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  4040c8:	48 85 ff             	test   rdi,rdi
  4040cb:	75 63                	jne    404130 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  4040cd:	48 c7 c7 10 5a 40 00 	mov    rdi,0x405a10
  4040d4:	be 00 00 01 00       	mov    esi,0x10000
  4040d9:	e8 a2 fc ff ff       	call   403d80 <align>
		walloc_heap_size = preallocated;
  4040de:	48 89 1d c3 18 00 00 	mov    QWORD PTR [rip+0x18c3],rbx        # 4059a8 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  4040e5:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  4040e8:	49 39 dc             	cmp    r12,rbx
  4040eb:	0f 87 94 00 00 00    	ja     404185 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  4040f1:	48 85 db             	test   rbx,rbx
  4040f4:	0f 84 a3 ff ff ff    	je     40409d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  4040fa:	be 00 00 01 00       	mov    esi,0x10000
  4040ff:	48 89 df             	mov    rdi,rbx
  404102:	e8 79 fc ff ff       	call   403d80 <align>
  404107:	48 39 c3             	cmp    rbx,rax
  40410a:	0f 85 8d ff ff ff    	jne    40409d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  404110:	48 c1 eb 10          	shr    rbx,0x10
  404114:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  404118:	48 83 c4 08          	add    rsp,0x8
  40411c:	4c 89 c0             	mov    rax,r8
  40411f:	5b                   	pop    rbx
  404120:	5d                   	pop    rbp
  404121:	41 5c                	pop    r12
  404123:	41 5d                	pop    r13
  404125:	c3                   	ret    
  404126:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40412d:	00 00 00 
	if(preallocated < needed)
  404130:	4d 85 e4             	test   r12,r12
  404133:	74 5e                	je     404193 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  404135:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  404138:	4c 89 e6             	mov    rsi,r12
  40413b:	48 d1 ef             	shr    rdi,1
  40413e:	e8 2d fc ff ff       	call   403d70 <max>
  404143:	be 00 00 01 00       	mov    esi,0x10000
  404148:	48 89 c7             	mov    rdi,rax
  40414b:	e8 30 fc ff ff       	call   403d80 <align>
  404150:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  404153:	48 85 c0             	test   rax,rax
  404156:	0f 84 41 ff ff ff    	je     40409d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  40415c:	48 89 c7             	mov    rdi,rax
  40415f:	e8 5c d0 ff ff       	call   4011c0 <sbrk>
  404164:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  404168:	74 16                	je     404180 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  40416a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  40416d:	4c 01 25 34 18 00 00 	add    QWORD PTR [rip+0x1834],r12        # 4059a8 <walloc_heap_size>
	size_t size = grow + preallocated;
  404174:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  404178:	e9 74 ff ff ff       	jmp    4040f1 <allocate_pages.constprop.0+0x51>
  40417d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  404180:	45 31 c0             	xor    r8d,r8d
  404183:	eb 93                	jmp    404118 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  404185:	49 29 dc             	sub    r12,rbx
  404188:	48 89 df             	mov    rdi,rbx
  40418b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  40418e:	48 89 c3             	mov    rbx,rax
  404191:	eb a5                	jmp    404138 <allocate_pages.constprop.0+0x98>
  404193:	e9 05 ff ff ff       	jmp    40409d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000404198 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  404198:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

00000000004041a0 <allocate_large_object>:
{
  4041a0:	41 54                	push   r12
  4041a2:	55                   	push   rbp
  4041a3:	53                   	push   rbx
  4041a4:	48 89 fb             	mov    rbx,rdi
  4041a7:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  4041ab:	e8 f0 fd ff ff       	call   403fa0 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4041b0:	48 8b 15 f9 17 00 00 	mov    rdx,QWORD PTR [rip+0x17f9]        # 4059b0 <large_objects>
  4041b7:	48 85 d2             	test   rdx,rdx
  4041ba:	0f 84 da 01 00 00    	je     40439a <allocate_large_object+0x1fa>
  4041c0:	4c 8d 0d e9 17 00 00 	lea    r9,[rip+0x17e9]        # 4059b0 <large_objects>
	size_t best_size = -1;
  4041c7:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  4041ce:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  4041d2:	45 31 d2             	xor    r10d,r10d
  4041d5:	4c 89 cd             	mov    rbp,r9
  4041d8:	eb 11                	jmp    4041eb <allocate_large_object+0x4b>
  4041da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  4041e0:	49 89 d1             	mov    r9,rdx
  4041e3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4041e6:	48 85 d2             	test   rdx,rdx
  4041e9:	74 39                	je     404224 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  4041eb:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  4041ef:	4c 39 c1             	cmp    rcx,r8
  4041f2:	73 ec                	jae    4041e0 <allocate_large_object+0x40>
  4041f4:	48 39 d9             	cmp    rcx,rbx
  4041f7:	72 e7                	jb     4041e0 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  4041f9:	be 00 01 00 00       	mov    esi,0x100
  4041fe:	e8 7d fb ff ff       	call   403d80 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  404203:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  404207:	48 39 c6             	cmp    rsi,rax
  40420a:	0f 84 88 02 00 00    	je     404498 <allocate_large_object+0x2f8>
  404210:	4c 89 cd             	mov    rbp,r9
  404213:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  404216:	49 89 d1             	mov    r9,rdx
  404219:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  40421c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  40421f:	48 85 d2             	test   rdx,rdx
  404222:	75 c7                	jne    4041eb <allocate_large_object+0x4b>
	if(!best)
  404224:	4d 85 d2             	test   r10,r10
  404227:	0f 84 7b 01 00 00    	je     4043a8 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  40422d:	4c 89 d7             	mov    rdi,r10
  404230:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  404235:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404238:	e8 13 fc ff ff       	call   403e50 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  40423d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  404240:	89 c6                	mov    esi,eax
  404242:	e8 f9 fb ff ff       	call   403e40 <get_page>
  404247:	48 89 c7             	mov    rdi,rax
  40424a:	49 89 c1             	mov    r9,rax
  40424d:	e8 2e fc ff ff       	call   403e80 <allocate_chunk>
	struct large_object* next = best->next;
  404252:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  404255:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  404259:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  404260:	75 36                	jne    404298 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  404262:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  404266:	4c 89 d7             	mov    rdi,r10
  404269:	be 00 01 00 00       	mov    esi,0x100
  40426e:	e8 ed fb ff ff       	call   403e60 <get_large_object_payload>
  404273:	48 01 c2             	add    rdx,rax
  404276:	48 89 d7             	mov    rdi,rdx
  404279:	e8 02 fb ff ff       	call   403d80 <align>
  40427e:	48 39 c2             	cmp    rdx,rax
  404281:	0f 85 11 ff ff ff    	jne    404198 <allocate_large_object.cold>
}
  404287:	48 83 c4 10          	add    rsp,0x10
  40428b:	4c 89 d0             	mov    rax,r10
  40428e:	5b                   	pop    rbx
  40428f:	5d                   	pop    rbp
  404290:	41 5c                	pop    r12
  404292:	c3                   	ret    
  404293:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  404298:	4c 89 d7             	mov    rdi,r10
  40429b:	e8 c0 fb ff ff       	call   403e60 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  4042a0:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  4042a3:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  4042a7:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  4042aa:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  4042ad:	4c 01 df             	add    rdi,r11
  4042b0:	e8 8b fb ff ff       	call   403e40 <get_page>
  4042b5:	49 39 c1             	cmp    r9,rax
  4042b8:	0f 84 e8 01 00 00    	je     4044a6 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4042be:	be 00 00 01 00       	mov    esi,0x10000
  4042c3:	4c 89 df             	mov    rdi,r11
  4042c6:	e8 b5 fa ff ff       	call   403d80 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  4042cb:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  4042d2:	0f 86 38 01 00 00    	jbe    404410 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4042d8:	4c 39 d8             	cmp    rax,r11
  4042db:	0f 85 b7 fe ff ff    	jne    404198 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4042e1:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  4042e4:	be 00 00 01 00       	mov    esi,0x10000
  4042e9:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  4042f0:	ff 
			tail_size = best_size - size;
  4042f1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  4042f8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  4042f9:	e8 82 fa ff ff       	call   403d80 <align>
		best->size -= tail_size;
  4042fe:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  404302:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  404305:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404308:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  40430b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40430f:	48 29 cf             	sub    rdi,rcx
  404312:	e8 39 fb ff ff       	call   403e50 <get_chunk_index>
  404317:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404319:	48 85 c9             	test   rcx,rcx
  40431c:	0f 84 44 ff ff ff    	je     404266 <allocate_large_object+0xc6>
  404322:	85 c0                	test   eax,eax
  404324:	75 0c                	jne    404332 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  404326:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  40432d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  404332:	48 85 c9             	test   rcx,rcx
  404335:	0f 84 2b ff ff ff    	je     404266 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  40433b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40433e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  404343:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404346:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  40434a:	e8 f1 fa ff ff       	call   403e40 <get_page>
  40434f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  404352:	e8 29 fb ff ff       	call   403e80 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404357:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40435c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  40435f:	48 8b 05 4a 16 00 00 	mov    rax,QWORD PTR [rip+0x164a]        # 4059b0 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404366:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  40436a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  40436d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404370:	e8 eb fa ff ff       	call   403e60 <get_large_object_payload>
  404375:	48 01 c1             	add    rcx,rax
  404378:	48 89 cf             	mov    rdi,rcx
  40437b:	e8 00 fa ff ff       	call   403d80 <align>
  404380:	48 39 c1             	cmp    rcx,rax
  404383:	0f 85 0f fe ff ff    	jne    404198 <allocate_large_object.cold>
			large_objects = tail;
  404389:	48 89 15 20 16 00 00 	mov    QWORD PTR [rip+0x1620],rdx        # 4059b0 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404390:	e8 fb fa ff ff       	call   403e90 <maybe_repurpose_single_chunk_large_objects_head>
  404395:	e9 c8 fe ff ff       	jmp    404262 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  40439a:	48 8d 2d 0f 16 00 00 	lea    rbp,[rip+0x160f]        # 4059b0 <large_objects>
  4043a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  4043a8:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4043ac:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  4043b1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4043b8:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  4043ba:	4c 89 e7             	mov    rdi,r12
  4043bd:	e8 de fc ff ff       	call   4040a0 <allocate_pages.constprop.0>
  4043c2:	48 89 c1             	mov    rcx,rax
		if(!page)
  4043c5:	48 85 c0             	test   rax,rax
  4043c8:	0f 84 10 01 00 00    	je     4044de <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4043ce:	ba ff 00 00 00       	mov    edx,0xff
  4043d3:	be 01 00 00 00       	mov    esi,0x1
  4043d8:	48 89 c7             	mov    rdi,rax
  4043db:	e8 a0 fa ff ff       	call   403e80 <allocate_chunk>
  4043e0:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  4043e3:	48 8b 05 c6 15 00 00 	mov    rax,QWORD PTR [rip+0x15c6]        # 4059b0 <large_objects>
		size_t page_header = ptr - ((char*)page);
  4043ea:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  4043ed:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  4043f0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  4043f5:	48 c1 e0 10          	shl    rax,0x10
  4043f9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  4043fe:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  404402:	4d 39 c4             	cmp    r12,r8
  404405:	0f 86 22 fe ff ff    	jbe    40422d <allocate_large_object+0x8d>
  40440b:	e9 88 fd ff ff       	jmp    404198 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404410:	4c 39 d8             	cmp    rax,r11
  404413:	0f 85 7f fd ff ff    	jne    404198 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404419:	48 89 ef             	mov    rdi,rbp
  40441c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404421:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  404425:	e8 26 fa ff ff       	call   403e50 <get_chunk_index>
  40442a:	4c 89 cf             	mov    rdi,r9
  40442d:	89 c6                	mov    esi,eax
  40442f:	e8 4c fa ff ff       	call   403e80 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404434:	b8 00 00 01 00       	mov    eax,0x10000
  404439:	4c 29 e0             	sub    rax,r12
  40443c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  404440:	48 8b 05 69 15 00 00 	mov    rax,QWORD PTR [rip+0x1569]        # 4059b0 <large_objects>
  404447:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  40444a:	4c 89 15 5f 15 00 00 	mov    QWORD PTR [rip+0x155f],r10        # 4059b0 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404451:	e8 3a fa ff ff       	call   403e90 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404456:	ba ff 00 00 00       	mov    edx,0xff
  40445b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  404460:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404467:	e8 14 fa ff ff       	call   403e80 <allocate_chunk>
			best->size = best_size =
  40446c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  404473:	ff 
  404474:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404478:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40447b:	48 39 d3             	cmp    rbx,rdx
  40447e:	0f 87 14 fd ff ff    	ja     404198 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  404484:	48 89 d1             	mov    rcx,rdx
  404487:	48 29 d9             	sub    rcx,rbx
  40448a:	30 c9                	xor    cl,cl
  40448c:	e9 74 fe ff ff       	jmp    404305 <allocate_large_object+0x165>
  404491:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404498:	4c 89 cd             	mov    rbp,r9
  40449b:	49 89 c8             	mov    r8,rcx
  40449e:	49 89 d2             	mov    r10,rdx
  4044a1:	e9 87 fd ff ff       	jmp    40422d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  4044a6:	be 00 01 00 00       	mov    esi,0x100
  4044ab:	4c 89 df             	mov    rdi,r11
  4044ae:	e8 cd f8 ff ff       	call   403d80 <align>
  4044b3:	49 39 c3             	cmp    r11,rax
  4044b6:	0f 85 dc fc ff ff    	jne    404198 <allocate_large_object.cold>
		best->size -= tail_size;
  4044bc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4044c0:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  4044c3:	48 29 ca             	sub    rdx,rcx
  4044c6:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4044ca:	e8 81 f9 ff ff       	call   403e50 <get_chunk_index>
  4044cf:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  4044d1:	85 c0                	test   eax,eax
  4044d3:	0f 84 4d fe ff ff    	je     404326 <allocate_large_object+0x186>
  4044d9:	e9 5d fe ff ff       	jmp    40433b <allocate_large_object+0x19b>
			return NULL;
  4044de:	45 31 d2             	xor    r10d,r10d
  4044e1:	e9 a1 fd ff ff       	jmp    404287 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

00000000004044f0 <allocate_large>:
{
  4044f0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  4044f4:	e8 a7 fc ff ff       	call   4041a0 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  4044f9:	48 85 c0             	test   rax,rax
  4044fc:	74 12                	je     404510 <allocate_large+0x20>
  4044fe:	48 89 c7             	mov    rdi,rax
}
  404501:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  404505:	e9 56 f9 ff ff       	jmp    403e60 <get_large_object_payload>
  40450a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  404510:	31 c0                	xor    eax,eax
  404512:	48 83 c4 08          	add    rsp,0x8
  404516:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

0000000000404520 <obtain_small_objects>:
{
  404520:	55                   	push   rbp
  404521:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  404523:	48 8b 3d de 14 00 00 	mov    rdi,QWORD PTR [rip+0x14de]        # 405a08 <small_object_freelists+0x48>
  40452a:	48 85 ff             	test   rdi,rdi
  40452d:	74 71                	je     4045a0 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  40452f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  404532:	48 89 05 cf 14 00 00 	mov    QWORD PTR [rip+0x14cf],rax        # 405a08 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404539:	e8 12 f9 ff ff       	call   403e50 <get_chunk_index>
  40453e:	89 ea                	mov    edx,ebp
  404540:	89 c6                	mov    esi,eax
  404542:	e8 f9 f8 ff ff       	call   403e40 <get_page>
  404547:	48 89 c7             	mov    rdi,rax
  40454a:	e8 31 f9 ff ff       	call   403e80 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  40454f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404551:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  404554:	e8 c7 f8 ff ff       	call   403e20 <chunk_kind_to_granules>
  404559:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404560:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  404567:	77 46                	ja     4045af <obtain_small_objects+0x8f>
  404569:	48 89 d0             	mov    rax,rdx
  40456c:	48 89 f1             	mov    rcx,rsi
  40456f:	48 29 f0             	sub    rax,rsi
  404572:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  404579:	31 c0                	xor    eax,eax
  40457b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  404580:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404583:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  404586:	48 89 d0             	mov    rax,rdx
		head->next = next;
  404589:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  40458c:	48 29 f2             	sub    rdx,rsi
  40458f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  404596:	76 e8                	jbe    404580 <obtain_small_objects+0x60>
}
  404598:	5d                   	pop    rbp
  404599:	c3                   	ret    
  40459a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  4045a0:	31 ff                	xor    edi,edi
  4045a2:	e8 f9 fb ff ff       	call   4041a0 <allocate_large_object>
  4045a7:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  4045aa:	48 85 c0             	test   rax,rax
  4045ad:	75 8a                	jne    404539 <obtain_small_objects+0x19>
			return NULL;
  4045af:	31 c0                	xor    eax,eax
}
  4045b1:	5d                   	pop    rbp
  4045b2:	c3                   	ret    

Disassembly of section .text.allocate_small:

00000000004045c0 <allocate_small>:
{
  4045c0:	53                   	push   rbx
  4045c1:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  4045c4:	e8 17 fa ff ff       	call   403fe0 <get_small_object_freelist>
  4045c9:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  4045cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  4045cf:	48 85 c0             	test   rax,rax
  4045d2:	74 0c                	je     4045e0 <allocate_small+0x20>
	*loc = ret->next;
  4045d4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  4045d7:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  4045da:	5b                   	pop    rbx
  4045db:	c3                   	ret    
  4045dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  4045e0:	44 89 c7             	mov    edi,r8d
  4045e3:	e8 38 ff ff ff       	call   404520 <obtain_small_objects>
		if(!freelist)
  4045e8:	48 85 c0             	test   rax,rax
  4045eb:	74 ed                	je     4045da <allocate_small+0x1a>
		*loc = freelist;
  4045ed:	48 89 03             	mov    QWORD PTR [rbx],rax
  4045f0:	eb e2                	jmp    4045d4 <allocate_small+0x14>

Disassembly of section .text.malloc:

0000000000404600 <malloc>:
{
  404600:	f3 0f 1e fa          	endbr64 
  404604:	48 83 ec 08          	sub    rsp,0x8
  404608:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  40460b:	e8 d0 f8 ff ff       	call   403ee0 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  404610:	89 c7                	mov    edi,eax
  404612:	e8 79 f7 ff ff       	call   403d90 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404617:	3d ff 00 00 00       	cmp    eax,0xff
  40461c:	74 12                	je     404630 <malloc+0x30>
  40461e:	89 c7                	mov    edi,eax
}
  404620:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404624:	e9 97 ff ff ff       	jmp    4045c0 <allocate_small>
  404629:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404630:	4c 89 c7             	mov    rdi,r8
}
  404633:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  404637:	e9 b4 fe ff ff       	jmp    4044f0 <allocate_large>

Disassembly of section .text.memcpy:

0000000000404640 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  404640:	f3 0f 1e fa          	endbr64 
  404644:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  404647:	48 85 d2             	test   rdx,rdx
  40464a:	74 6c                	je     4046b8 <memcpy+0x78>
  40464c:	48 89 f0             	mov    rax,rsi
  40464f:	48 39 f7             	cmp    rdi,rsi
  404652:	74 64                	je     4046b8 <memcpy+0x78>
  404654:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  404657:	73 67                	jae    4046c0 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  404659:	48 89 fa             	mov    rdx,rdi
  40465c:	48 09 f2             	or     rdx,rsi
  40465f:	83 e2 03             	and    edx,0x3
  404662:	0f 85 e8 00 00 00    	jne    404750 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  404668:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  40466b:	49 89 c9             	mov    r9,rcx
  40466e:	4c 89 c6             	mov    rsi,r8
  404671:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  404674:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404678:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  40467c:	49 83 fa 03          	cmp    r10,0x3
  404680:	76 1f                	jbe    4046a1 <memcpy+0x61>
  404682:	31 d2                	xor    edx,edx
  404684:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  404688:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  40468b:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  40468e:	48 83 c2 01          	add    rdx,0x1
  404692:	48 39 d7             	cmp    rdi,rdx
  404695:	75 f1                	jne    404688 <memcpy+0x48>
  404697:	48 c1 e7 02          	shl    rdi,0x2
  40469b:	48 01 f8             	add    rax,rdi
  40469e:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  4046a1:	4d 85 c9             	test   r9,r9
  4046a4:	74 12                	je     4046b8 <memcpy+0x78>
  4046a6:	31 d2                	xor    edx,edx
  4046a8:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  4046ac:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  4046af:	48 83 c2 01          	add    rdx,0x1
  4046b3:	49 39 d1             	cmp    r9,rdx
  4046b6:	75 f0                	jne    4046a8 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  4046b8:	4c 89 c0             	mov    rax,r8
  4046bb:	c3                   	ret    
  4046bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  4046c0:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  4046c4:	48 01 d0             	add    rax,rdx
{
  4046c7:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  4046c8:	4c 89 ca             	mov    rdx,r9
{
  4046cb:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  4046cc:	48 09 c2             	or     rdx,rax
  4046cf:	83 e2 03             	and    edx,0x3
  4046d2:	0f 84 b8 00 00 00    	je     404790 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  4046d8:	4c 89 ca             	mov    rdx,r9
  4046db:	48 31 c2             	xor    rdx,rax
  4046de:	83 e2 03             	and    edx,0x3
  4046e1:	75 0a                	jne    4046ed <memcpy+0xad>
  4046e3:	48 83 f9 04          	cmp    rcx,0x4
  4046e7:	0f 87 13 01 00 00    	ja     404800 <memcpy+0x1c0>
  4046ed:	31 db                	xor    ebx,ebx
  4046ef:	31 d2                	xor    edx,edx
  4046f1:	31 ed                	xor    ebp,ebp
			length -= t;
  4046f3:	48 89 ce             	mov    rsi,rcx
  4046f6:	48 f7 de             	neg    rsi
  4046f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  404700:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  404704:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  404708:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  40470e:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  404713:	48 83 e9 01          	sub    rcx,0x1
  404717:	75 e7                	jne    404700 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404719:	48 83 fd 03          	cmp    rbp,0x3
  40471d:	0f 87 8d 00 00 00    	ja     4047b0 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  404723:	48 85 db             	test   rbx,rbx
  404726:	74 1c                	je     404744 <memcpy+0x104>
  404728:	48 f7 d3             	not    rbx
  40472b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  404732:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  404737:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  40473b:	48 83 e8 01          	sub    rax,0x1
  40473f:	48 39 d8             	cmp    rax,rbx
  404742:	75 ee                	jne    404732 <memcpy+0xf2>
}
  404744:	4c 89 c0             	mov    rax,r8
  404747:	5b                   	pop    rbx
  404748:	5d                   	pop    rbp
  404749:	c3                   	ret    
  40474a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  404750:	48 89 fa             	mov    rdx,rdi
  404753:	48 31 f2             	xor    rdx,rsi
  404756:	83 e2 03             	and    edx,0x3
  404759:	75 06                	jne    404761 <memcpy+0x121>
  40475b:	48 83 f9 03          	cmp    rcx,0x3
  40475f:	77 77                	ja     4047d8 <memcpy+0x198>
  404761:	45 31 c9             	xor    r9d,r9d
  404764:	31 ff                	xor    edi,edi
  404766:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  404769:	31 d2                	xor    edx,edx
  40476b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  404770:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  404774:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  404778:	48 83 c2 01          	add    rdx,0x1
  40477c:	48 39 d1             	cmp    rcx,rdx
  40477f:	75 ef                	jne    404770 <memcpy+0x130>
  404781:	48 01 c8             	add    rax,rcx
  404784:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  404788:	e9 ef fe ff ff       	jmp    40467c <memcpy+0x3c>
  40478d:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  404790:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  404793:	48 89 cb             	mov    rbx,rcx
  404796:	48 89 cd             	mov    rbp,rcx
		src += length;
  404799:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  40479c:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  4047a0:	83 e3 03             	and    ebx,0x3
		dst += length;
  4047a3:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  4047a6:	48 83 fd 03          	cmp    rbp,0x3
  4047aa:	0f 86 73 ff ff ff    	jbe    404723 <memcpy+0xe3>
  4047b0:	48 89 d0             	mov    rax,rdx
  4047b3:	48 f7 d8             	neg    rax
  4047b6:	48 c1 e0 02          	shl    rax,0x2
  4047ba:	49 01 c3             	add    r11,rax
  4047bd:	49 01 c2             	add    r10,rax
  4047c0:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  4047c5:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  4047ca:	48 83 ea 01          	sub    rdx,0x1
  4047ce:	75 f0                	jne    4047c0 <memcpy+0x180>
  4047d0:	e9 4e ff ff ff       	jmp    404723 <memcpy+0xe3>
  4047d5:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  4047d8:	48 89 f2             	mov    rdx,rsi
  4047db:	83 e2 03             	and    edx,0x3
			length -= t;
  4047de:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  4047e3:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  4047e8:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  4047eb:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  4047ee:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  4047f1:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4047f5:	41 83 e1 03          	and    r9d,0x3
  4047f9:	e9 6b ff ff ff       	jmp    404769 <memcpy+0x129>
  4047fe:	66 90                	xchg   ax,ax
				t &= wmask;
  404800:	48 89 c6             	mov    rsi,rax
  404803:	83 e6 03             	and    esi,0x3
			length -= t;
  404806:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  404809:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  40480c:	48 89 cb             	mov    rbx,rcx
			length -= t;
  40480f:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  404812:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  404815:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404819:	83 e3 03             	and    ebx,0x3
  40481c:	e9 d2 fe ff ff       	jmp    4046f3 <memcpy+0xb3>
