
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000400030 <__main>:


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int         __main() {}
  400030:	f3 0f 1e fa          	endbr64 
  400034:	55                   	push   rbp
  400035:	48 89 e5             	mov    rbp,rsp
  400038:	90                   	nop
  400039:	5d                   	pop    rbp
  40003a:	c3                   	ret    

000000000040003b <on_enter_pressed>:
char        text[128];
windowptr_t window, shellcontent;

void on_enter_pressed(struct _window* wndptr, int event_type, window_event_t* event)
{
  40003b:	f3 0f 1e fa          	endbr64 
  40003f:	55                   	push   rbp
  400040:	48 89 e5             	mov    rbp,rsp
  400043:	48 83 ec 20          	sub    rsp,0x20
  400047:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  40004b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  40004e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    get_window_text(shellcontent, text, 128);
  400052:	48 8b 05 af 5a 00 00 	mov    rax,QWORD PTR [rip+0x5aaf]        # 405b08 <shellcontent>
  400059:	ba 80 00 00 00       	mov    edx,0x80
  40005e:	48 8d 0d 1b 5a 00 00 	lea    rcx,[rip+0x5a1b]        # 405a80 <text>
  400065:	48 89 ce             	mov    rsi,rcx
  400068:	48 89 c7             	mov    rdi,rax
  40006b:	e8 b0 12 00 00       	call   401320 <get_window_text>
    strcat(text, "enter pressed\n");
  400070:	48 8d 05 09 5a 00 00 	lea    rax,[rip+0x5a09]        # 405a80 <text>
  400077:	48 89 c7             	mov    rdi,rax
  40007a:	e8 01 19 00 00       	call   401980 <strlen>
  40007f:	48 89 c2             	mov    rdx,rax
  400082:	48 8d 05 f7 59 00 00 	lea    rax,[rip+0x59f7]        # 405a80 <text>
  400089:	48 01 d0             	add    rax,rdx
  40008c:	48 b9 65 6e 74 65 72 	movabs rcx,0x7270207265746e65
  400093:	20 70 72 
  400096:	48 89 08             	mov    QWORD PTR [rax],rcx
  400099:	c7 40 08 65 73 73 65 	mov    DWORD PTR [rax+0x8],0x65737365
  4000a0:	66 c7 40 0c 64 0a    	mov    WORD PTR [rax+0xc],0xa64
  4000a6:	c6 40 0e 00          	mov    BYTE PTR [rax+0xe],0x0
    set_window_text(shellcontent, text);
  4000aa:	48 8b 05 57 5a 00 00 	mov    rax,QWORD PTR [rip+0x5a57]        # 405b08 <shellcontent>
  4000b1:	48 8d 15 c8 59 00 00 	lea    rdx,[rip+0x59c8]        # 405a80 <text>
  4000b8:	48 89 d6             	mov    rsi,rdx
  4000bb:	48 89 c7             	mov    rdi,rax
  4000be:	e8 fd 11 00 00       	call   4012c0 <set_window_text>
}
  4000c3:	90                   	nop
  4000c4:	c9                   	leave  
  4000c5:	c3                   	ret    

00000000004000c6 <main>:
// int   __stack_chk_fail() {}
int main(int argc, char** argv, char** environ)
{
  4000c6:	f3 0f 1e fa          	endbr64 
  4000ca:	55                   	push   rbp
  4000cb:	48 89 e5             	mov    rbp,rsp
  4000ce:	53                   	push   rbx
  4000cf:	48 81 ec 98 02 00 00 	sub    rsp,0x298
  4000d6:	89 bd 7c fd ff ff    	mov    DWORD PTR [rbp-0x284],edi
  4000dc:	48 89 b5 70 fd ff ff 	mov    QWORD PTR [rbp-0x290],rsi
  4000e3:	48 89 95 68 fd ff ff 	mov    QWORD PTR [rbp-0x298],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  4000ea:	48 8d 05 1f 57 00 00 	lea    rax,[rip+0x571f]        # 405810 <b+0x4>
  4000f1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    puts("Gamessis OS shell\n");
  4000f5:	48 8d 05 1b 57 00 00 	lea    rax,[rip+0x571b]        # 405817 <b+0xb>
  4000fc:	48 89 c7             	mov    rdi,rax
  4000ff:	e8 9c 16 00 00       	call   4017a0 <puts>
    char cmd[128]  = {0};
  400104:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x0
  40010b:	00 00 00 00 
  40010f:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  400116:	00 00 00 00 
  40011a:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  400121:	00 00 00 00 
  400125:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  40012c:	00 00 00 00 
  400130:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  400137:	00 00 00 00 
  40013b:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  400142:	00 00 00 00 
  400146:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  40014d:	00 00 00 00 
  400151:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  400158:	00 00 00 00 
  40015c:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  400163:	00 00 00 00 
  400167:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  40016e:	00 00 00 00 
  400172:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  400179:	00 00 00 00 
  40017d:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  400184:	00 00 00 00 
  400188:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  40018f:	00 00 00 00 
  400193:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  40019a:	00 00 00 00 
  40019e:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  4001a5:	00 00 00 00 
  4001a9:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  4001b0:	00 00 00 00 
    char path[128] = "/";
  4001b4:	48 c7 85 78 fe ff ff 	mov    QWORD PTR [rbp-0x188],0x2f
  4001bb:	2f 00 00 00 
  4001bf:	48 c7 85 80 fe ff ff 	mov    QWORD PTR [rbp-0x180],0x0
  4001c6:	00 00 00 00 
  4001ca:	48 c7 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],0x0
  4001d1:	00 00 00 00 
  4001d5:	48 c7 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],0x0
  4001dc:	00 00 00 00 
  4001e0:	48 c7 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],0x0
  4001e7:	00 00 00 00 
  4001eb:	48 c7 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],0x0
  4001f2:	00 00 00 00 
  4001f6:	48 c7 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],0x0
  4001fd:	00 00 00 00 
  400201:	48 c7 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],0x0
  400208:	00 00 00 00 
  40020c:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
  400213:	00 00 00 00 
  400217:	48 c7 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],0x0
  40021e:	00 00 00 00 
  400222:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
  400229:	00 00 00 00 
  40022d:	48 c7 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],0x0
  400234:	00 00 00 00 
  400238:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
  40023f:	00 00 00 00 
  400243:	48 c7 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],0x0
  40024a:	00 00 00 00 
  40024e:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
  400255:	00 00 00 00 
  400259:	48 c7 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],0x0
  400260:	00 00 00 00 
            default: default_deal_window_event(&event); break;
            }
        }
    } */
    while (1) {
        memset(cmd, 0, 128);
  400264:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40026b:	ba 80 00 00 00       	mov    edx,0x80
  400270:	be 00 00 00 00       	mov    esi,0x0
  400275:	48 89 c7             	mov    rdi,rax
  400278:	e8 e3 15 00 00       	call   401860 <memset>
        int p = 0;
  40027d:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
        printf("%s:>", path);
  400284:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  40028b:	48 89 c6             	mov    rsi,rax
  40028e:	48 8d 05 95 55 00 00 	lea    rax,[rip+0x5595]        # 40582a <b+0x1e>
  400295:	48 89 c7             	mov    rdi,rax
  400298:	b8 00 00 00 00       	mov    eax,0x0
  40029d:	e8 ce 38 00 00       	call   403b70 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  4002a2:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4002a9:	48 89 c7             	mov    rdi,rax
  4002ac:	e8 4f 15 00 00       	call   401800 <gets>
        puts(cmd);
  4002b1:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4002b8:	48 89 c7             	mov    rdi,rax
  4002bb:	e8 e0 14 00 00       	call   4017a0 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  4002c0:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4002c7:	48 8d 15 61 55 00 00 	lea    rdx,[rip+0x5561]        # 40582f <b+0x23>
  4002ce:	48 89 d6             	mov    rsi,rdx
  4002d1:	48 89 c7             	mov    rdi,rax
  4002d4:	e8 57 16 00 00       	call   401930 <strcmp>
  4002d9:	85 c0                	test   eax,eax
  4002db:	75 14                	jne    4002f1 <main+0x22b>
            puts("Gamessis OS 1.0.\n");
  4002dd:	48 8d 05 53 55 00 00 	lea    rax,[rip+0x5553]        # 405837 <b+0x2b>
  4002e4:	48 89 c7             	mov    rdi,rax
  4002e7:	e8 b4 14 00 00       	call   4017a0 <puts>
  4002ec:	e9 73 ff ff ff       	jmp    400264 <main+0x19e>
        }
        else if (strcmp(cmd, "exit") == 0) {
  4002f1:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4002f8:	48 8d 15 4a 55 00 00 	lea    rdx,[rip+0x554a]        # 405849 <b+0x3d>
  4002ff:	48 89 d6             	mov    rsi,rdx
  400302:	48 89 c7             	mov    rdi,rax
  400305:	e8 26 16 00 00       	call   401930 <strcmp>
  40030a:	85 c0                	test   eax,eax
  40030c:	0f 84 e0 0c 00 00    	je     400ff2 <main+0xf2c>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400312:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400319:	48 8d 15 2e 55 00 00 	lea    rdx,[rip+0x552e]        # 40584e <b+0x42>
  400320:	48 89 d6             	mov    rsi,rdx
  400323:	48 89 c7             	mov    rdi,rax
  400326:	e8 05 16 00 00       	call   401930 <strcmp>
  40032b:	85 c0                	test   eax,eax
  40032d:	0f 85 92 00 00 00    	jne    4003c5 <main+0x2ff>
            // ls
            getcwd(path, 128);
  400333:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  40033a:	be 80 00 00 00       	mov    esi,0x80
  40033f:	48 89 c7             	mov    rdi,rax
  400342:	b8 00 00 00 00       	mov    eax,0x0
  400347:	e8 b9 13 00 00       	call   401705 <getcwd>
            DIR*           dp = opendir(path);
  40034c:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400353:	48 89 c7             	mov    rdi,rax
  400356:	e8 f5 0f 00 00       	call   401350 <opendir>
  40035b:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            struct dirent* dirp;
            if (!dp) {
  40035f:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  400364:	75 38                	jne    40039e <main+0x2d8>
                printf("error opening directory\n");
  400366:	48 8d 05 e4 54 00 00 	lea    rax,[rip+0x54e4]        # 405851 <b+0x45>
  40036d:	48 89 c7             	mov    rdi,rax
  400370:	b8 00 00 00 00       	mov    eax,0x0
  400375:	e8 f6 37 00 00       	call   403b70 <printf>
                continue;
  40037a:	e9 6e 0c 00 00       	jmp    400fed <main+0xf27>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  40037f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  400383:	48 83 c0 18          	add    rax,0x18
  400387:	48 89 c6             	mov    rsi,rax
  40038a:	48 8d 05 d9 54 00 00 	lea    rax,[rip+0x54d9]        # 40586a <b+0x5e>
  400391:	48 89 c7             	mov    rdi,rax
  400394:	b8 00 00 00 00       	mov    eax,0x0
  400399:	e8 d2 37 00 00       	call   403b70 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  40039e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4003a2:	48 89 c7             	mov    rdi,rax
  4003a5:	e8 28 11 00 00       	call   4014d2 <readdir>
  4003aa:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  4003ae:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  4003b3:	75 ca                	jne    40037f <main+0x2b9>
            }
            close(dp);
  4003b5:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4003b9:	89 c7                	mov    edi,eax
  4003bb:	e8 00 0d 00 00       	call   4010c0 <close>
  4003c0:	e9 9f fe ff ff       	jmp    400264 <main+0x19e>
        }
        else if (strcmp(cmd, "cd") == 0) {
  4003c5:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4003cc:	48 8d 15 9b 54 00 00 	lea    rdx,[rip+0x549b]        # 40586e <b+0x62>
  4003d3:	48 89 d6             	mov    rsi,rdx
  4003d6:	48 89 c7             	mov    rdi,rax
  4003d9:	e8 52 15 00 00       	call   401930 <strcmp>
  4003de:	85 c0                	test   eax,eax
  4003e0:	0f 85 1f 02 00 00    	jne    400605 <main+0x53f>
            // cd
            char tmppath[128] = {0};
  4003e6:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4003ed:	00 00 00 00 
  4003f1:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4003f8:	00 00 00 00 
  4003fc:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400403:	00 00 00 00 
  400407:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40040e:	00 00 00 00 
  400412:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400419:	00 00 00 00 
  40041d:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400424:	00 00 00 00 
  400428:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  40042f:	00 00 00 00 
  400433:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  40043a:	00 00 00 00 
  40043e:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400445:	00 00 00 00 
  400449:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400450:	00 00 00 00 
  400454:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  40045b:	00 00 00 00 
  40045f:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400466:	00 00 00 00 
  40046a:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  400471:	00 00 00 00 
  400475:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  40047c:	00 00 00 00 
  400480:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  400487:	00 00 00 00 
  40048b:	48 c7 85 64 fe ff ff 	mov    QWORD PTR [rbp-0x19c],0x0
  400492:	00 00 00 00 
            printf("enter path:");
  400496:	48 8d 05 d4 53 00 00 	lea    rax,[rip+0x53d4]        # 405871 <b+0x65>
  40049d:	48 89 c7             	mov    rdi,rax
  4004a0:	b8 00 00 00 00       	mov    eax,0x0
  4004a5:	e8 c6 36 00 00       	call   403b70 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  4004aa:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004b1:	48 89 c7             	mov    rdi,rax
  4004b4:	e8 47 13 00 00       	call   401800 <gets>
            if (chdir(tmppath) == -1) {
  4004b9:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004c0:	48 89 c7             	mov    rdi,rax
  4004c3:	b8 00 00 00 00       	mov    eax,0x0
  4004c8:	e8 a3 10 00 00       	call   401570 <chdir>
  4004cd:	83 f8 ff             	cmp    eax,0xffffffff
  4004d0:	75 23                	jne    4004f5 <main+0x42f>
                printf("cannot find directory:%s\n", tmppath);
  4004d2:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004d9:	48 89 c6             	mov    rsi,rax
  4004dc:	48 8d 05 9a 53 00 00 	lea    rax,[rip+0x539a]        # 40587d <b+0x71>
  4004e3:	48 89 c7             	mov    rdi,rax
  4004e6:	b8 00 00 00 00       	mov    eax,0x0
  4004eb:	e8 80 36 00 00       	call   403b70 <printf>
                continue;
  4004f0:	e9 f8 0a 00 00       	jmp    400fed <main+0xf27>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(tmppath, "..") == 0) {
  4004f5:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4004fc:	48 8d 15 94 53 00 00 	lea    rdx,[rip+0x5394]        # 405897 <b+0x8b>
  400503:	48 89 d6             	mov    rsi,rdx
  400506:	48 89 c7             	mov    rdi,rax
  400509:	e8 22 14 00 00       	call   401930 <strcmp>
  40050e:	85 c0                	test   eax,eax
  400510:	75 75                	jne    400587 <main+0x4c1>
                char* p = tmppath + strlen(tmppath) - 1;
  400512:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400519:	48 89 c7             	mov    rdi,rax
  40051c:	e8 5f 14 00 00       	call   401980 <strlen>
  400521:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400525:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40052c:	48 01 d0             	add    rax,rdx
  40052f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
                while (p > tmppath && *p == '/') {
  400533:	eb 0f                	jmp    400544 <main+0x47e>
                    *p-- = 0;
  400535:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  400539:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  40053d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  400541:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  400544:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40054b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  40054f:	76 1c                	jbe    40056d <main+0x4a7>
  400551:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  400555:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  400558:	3c 2f                	cmp    al,0x2f
  40055a:	74 d9                	je     400535 <main+0x46f>
                }
                while (p > tmppath && *(p) != '/') {
  40055c:	eb 0f                	jmp    40056d <main+0x4a7>
                    *p-- = 0;
  40055e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  400562:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400566:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  40056a:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  40056d:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400574:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  400578:	76 68                	jbe    4005e2 <main+0x51c>
  40057a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  40057e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  400581:	3c 2f                	cmp    al,0x2f
  400583:	75 d9                	jne    40055e <main+0x498>
  400585:	eb 5b                	jmp    4005e2 <main+0x51c>
                }
            }
            else if (strcmp(tmppath, ".") == 0) {
  400587:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40058e:	48 8d 15 05 53 00 00 	lea    rdx,[rip+0x5305]        # 40589a <b+0x8e>
  400595:	48 89 d6             	mov    rsi,rdx
  400598:	48 89 c7             	mov    rdi,rax
  40059b:	e8 90 13 00 00       	call   401930 <strcmp>
  4005a0:	85 c0                	test   eax,eax
  4005a2:	0f 84 44 0a 00 00    	je     400fec <main+0xf26>
                continue;
            }
            else {
                strcat(path, tmppath);
  4005a8:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  4005af:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4005b6:	48 89 d6             	mov    rsi,rdx
  4005b9:	48 89 c7             	mov    rdi,rax
  4005bc:	e8 2f 13 00 00       	call   4018f0 <strcat>
                strcat(path, "/");
  4005c1:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4005c8:	48 89 c7             	mov    rdi,rax
  4005cb:	e8 b0 13 00 00       	call   401980 <strlen>
  4005d0:	48 89 c2             	mov    rdx,rax
  4005d3:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4005da:	48 01 d0             	add    rax,rdx
  4005dd:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  4005e2:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4005e9:	48 89 c6             	mov    rsi,rax
  4005ec:	48 8d 05 a9 52 00 00 	lea    rax,[rip+0x52a9]        # 40589c <b+0x90>
  4005f3:	48 89 c7             	mov    rdi,rax
  4005f6:	b8 00 00 00 00       	mov    eax,0x0
  4005fb:	e8 70 35 00 00       	call   403b70 <printf>
  400600:	e9 5f fc ff ff       	jmp    400264 <main+0x19e>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400605:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40060c:	48 8d 15 9f 52 00 00 	lea    rdx,[rip+0x529f]        # 4058b2 <b+0xa6>
  400613:	48 89 d6             	mov    rsi,rdx
  400616:	48 89 c7             	mov    rdi,rax
  400619:	e8 12 13 00 00       	call   401930 <strcmp>
  40061e:	85 c0                	test   eax,eax
  400620:	0f 85 1e 01 00 00    	jne    400744 <main+0x67e>
            char path[100] = {0};
  400626:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40062d:	00 00 00 00 
  400631:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400638:	00 00 00 00 
  40063c:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400643:	00 00 00 00 
  400647:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40064e:	00 00 00 00 
  400652:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400659:	00 00 00 00 
  40065d:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400664:	00 00 00 00 
  400668:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  40066f:	00 00 00 00 
  400673:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  40067a:	00 00 00 00 
  40067e:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400685:	00 00 00 00 
  400689:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400690:	00 00 00 00 
  400694:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  40069b:	00 00 00 00 
  40069f:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4006a6:	00 00 00 00 
  4006aa:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  4006b1:	00 00 00 
            printf("input path:");
  4006b4:	48 8d 05 fd 51 00 00 	lea    rax,[rip+0x51fd]        # 4058b8 <b+0xac>
  4006bb:	48 89 c7             	mov    rdi,rax
  4006be:	b8 00 00 00 00       	mov    eax,0x0
  4006c3:	e8 a8 34 00 00       	call   403b70 <printf>
            gets(path);
  4006c8:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4006cf:	48 89 c7             	mov    rdi,rax
  4006d2:	e8 29 11 00 00       	call   401800 <gets>
            int fd = creat(path, O_CREAT);
  4006d7:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4006de:	be 40 00 00 00       	mov    esi,0x40
  4006e3:	48 89 c7             	mov    rdi,rax
  4006e6:	e8 fa 0e 00 00       	call   4015e5 <creat>
  4006eb:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
            if (fd < 0) {
  4006ee:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  4006f2:	79 23                	jns    400717 <main+0x651>
                printf("create file %s failed\n", path);
  4006f4:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4006fb:	48 89 c6             	mov    rsi,rax
  4006fe:	48 8d 05 bf 51 00 00 	lea    rax,[rip+0x51bf]        # 4058c4 <b+0xb8>
  400705:	48 89 c7             	mov    rdi,rax
  400708:	b8 00 00 00 00       	mov    eax,0x0
  40070d:	e8 5e 34 00 00       	call   403b70 <printf>
  400712:	e9 4d fb ff ff       	jmp    400264 <main+0x19e>
            }
            else {
                printf("create file %s success\n", path);
  400717:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40071e:	48 89 c6             	mov    rsi,rax
  400721:	48 8d 05 b3 51 00 00 	lea    rax,[rip+0x51b3]        # 4058db <b+0xcf>
  400728:	48 89 c7             	mov    rdi,rax
  40072b:	b8 00 00 00 00       	mov    eax,0x0
  400730:	e8 3b 34 00 00       	call   403b70 <printf>
                close(fd);
  400735:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  400738:	89 c7                	mov    edi,eax
  40073a:	e8 81 09 00 00       	call   4010c0 <close>
  40073f:	e9 20 fb ff ff       	jmp    400264 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  400744:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40074b:	48 8d 15 a1 51 00 00 	lea    rdx,[rip+0x51a1]        # 4058f3 <b+0xe7>
  400752:	48 89 d6             	mov    rsi,rdx
  400755:	48 89 c7             	mov    rdi,rax
  400758:	e8 d3 11 00 00       	call   401930 <strcmp>
  40075d:	85 c0                	test   eax,eax
  40075f:	0f 85 0f 01 00 00    	jne    400874 <main+0x7ae>
            char path[100] = {0};
  400765:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40076c:	00 00 00 00 
  400770:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400777:	00 00 00 00 
  40077b:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400782:	00 00 00 00 
  400786:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40078d:	00 00 00 00 
  400791:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400798:	00 00 00 00 
  40079c:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4007a3:	00 00 00 00 
  4007a7:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4007ae:	00 00 00 00 
  4007b2:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4007b9:	00 00 00 00 
  4007bd:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4007c4:	00 00 00 00 
  4007c8:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4007cf:	00 00 00 00 
  4007d3:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4007da:	00 00 00 00 
  4007de:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4007e5:	00 00 00 00 
  4007e9:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  4007f0:	00 00 00 
            printf("input path:");
  4007f3:	48 8d 05 be 50 00 00 	lea    rax,[rip+0x50be]        # 4058b8 <b+0xac>
  4007fa:	48 89 c7             	mov    rdi,rax
  4007fd:	b8 00 00 00 00       	mov    eax,0x0
  400802:	e8 69 33 00 00       	call   403b70 <printf>
            gets(path);
  400807:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40080e:	48 89 c7             	mov    rdi,rax
  400811:	e8 ea 0f 00 00       	call   401800 <gets>
            int stat = remove(path);
  400816:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  40081d:	48 89 c7             	mov    rdi,rax
  400820:	e8 fb 09 00 00       	call   401220 <remove>
  400825:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
            if (stat < 0) {
  400828:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  40082c:	79 23                	jns    400851 <main+0x78b>
                printf("remove file/dir %s failed\n", path);
  40082e:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400835:	48 89 c6             	mov    rsi,rax
  400838:	48 8d 05 b7 50 00 00 	lea    rax,[rip+0x50b7]        # 4058f6 <b+0xea>
  40083f:	48 89 c7             	mov    rdi,rax
  400842:	b8 00 00 00 00       	mov    eax,0x0
  400847:	e8 24 33 00 00       	call   403b70 <printf>
  40084c:	e9 13 fa ff ff       	jmp    400264 <main+0x19e>
            }
            else {
                printf("remove file/dir %s success\n", path);
  400851:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400858:	48 89 c6             	mov    rsi,rax
  40085b:	48 8d 05 af 50 00 00 	lea    rax,[rip+0x50af]        # 405911 <b+0x105>
  400862:	48 89 c7             	mov    rdi,rax
  400865:	b8 00 00 00 00       	mov    eax,0x0
  40086a:	e8 01 33 00 00       	call   403b70 <printf>
  40086f:	e9 f0 f9 ff ff       	jmp    400264 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  400874:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40087b:	48 8d 15 ab 50 00 00 	lea    rdx,[rip+0x50ab]        # 40592d <b+0x121>
  400882:	48 89 d6             	mov    rsi,rdx
  400885:	48 89 c7             	mov    rdi,rax
  400888:	e8 a3 10 00 00       	call   401930 <strcmp>
  40088d:	85 c0                	test   eax,eax
  40088f:	0f 85 d8 01 00 00    	jne    400a6d <main+0x9a7>
            char src[100] = {0};
  400895:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  40089c:	00 00 00 00 
  4008a0:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  4008a7:	00 00 00 00 
  4008ab:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  4008b2:	00 00 00 00 
  4008b6:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  4008bd:	00 00 00 00 
  4008c1:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  4008c8:	00 00 00 00 
  4008cc:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  4008d3:	00 00 00 00 
  4008d7:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  4008de:	00 00 00 00 
  4008e2:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  4008e9:	00 00 00 00 
  4008ed:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  4008f4:	00 00 00 00 
  4008f8:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  4008ff:	00 00 00 00 
  400903:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  40090a:	00 00 00 00 
  40090e:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400915:	00 00 00 00 
  400919:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400920:	00 00 00 
            char dst[100] = {0};
  400923:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  40092a:	00 00 00 00 
  40092e:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400935:	00 00 00 00 
  400939:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400940:	00 00 00 00 
  400944:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  40094b:	00 00 00 00 
  40094f:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400956:	00 00 00 00 
  40095a:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400961:	00 00 00 00 
  400965:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  40096c:	00 00 00 00 
  400970:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400977:	00 00 00 00 
  40097b:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400982:	00 00 00 00 
  400986:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40098d:	00 00 00 00 
  400991:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400998:	00 00 00 00 
  40099c:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4009a3:	00 00 00 00 
  4009a7:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  4009ae:	00 00 00 
            printf("input src path:");
  4009b1:	48 8d 05 78 4f 00 00 	lea    rax,[rip+0x4f78]        # 405930 <b+0x124>
  4009b8:	48 89 c7             	mov    rdi,rax
  4009bb:	b8 00 00 00 00       	mov    eax,0x0
  4009c0:	e8 ab 31 00 00       	call   403b70 <printf>
            gets(src);
  4009c5:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  4009cc:	48 89 c7             	mov    rdi,rax
  4009cf:	e8 2c 0e 00 00       	call   401800 <gets>
            printf("input dst path:");
  4009d4:	48 8d 05 65 4f 00 00 	lea    rax,[rip+0x4f65]        # 405940 <b+0x134>
  4009db:	48 89 c7             	mov    rdi,rax
  4009de:	b8 00 00 00 00       	mov    eax,0x0
  4009e3:	e8 88 31 00 00       	call   403b70 <printf>
            gets(dst);
  4009e8:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  4009ef:	48 89 c7             	mov    rdi,rax
  4009f2:	e8 09 0e 00 00       	call   401800 <gets>
            int stat = rename(src, dst);
  4009f7:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  4009fe:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400a05:	48 89 d6             	mov    rsi,rdx
  400a08:	48 89 c7             	mov    rdi,rax
  400a0b:	e8 7c 0c 00 00       	call   40168c <rename>
  400a10:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
            if (stat < 0) {
  400a13:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  400a17:	79 2a                	jns    400a43 <main+0x97d>
                printf("move file/dir %s to %s failed\n", src, dst);
  400a19:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  400a20:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400a27:	48 89 c6             	mov    rsi,rax
  400a2a:	48 8d 05 1f 4f 00 00 	lea    rax,[rip+0x4f1f]        # 405950 <b+0x144>
  400a31:	48 89 c7             	mov    rdi,rax
  400a34:	b8 00 00 00 00       	mov    eax,0x0
  400a39:	e8 32 31 00 00       	call   403b70 <printf>
  400a3e:	e9 21 f8 ff ff       	jmp    400264 <main+0x19e>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  400a43:	48 8d 95 ec fd ff ff 	lea    rdx,[rbp-0x214]
  400a4a:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400a51:	48 89 c6             	mov    rsi,rax
  400a54:	48 8d 05 15 4f 00 00 	lea    rax,[rip+0x4f15]        # 405970 <b+0x164>
  400a5b:	48 89 c7             	mov    rdi,rax
  400a5e:	b8 00 00 00 00       	mov    eax,0x0
  400a63:	e8 08 31 00 00       	call   403b70 <printf>
  400a68:	e9 f7 f7 ff ff       	jmp    400264 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  400a6d:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400a74:	48 8d 15 15 4f 00 00 	lea    rdx,[rip+0x4f15]        # 405990 <b+0x184>
  400a7b:	48 89 d6             	mov    rsi,rdx
  400a7e:	48 89 c7             	mov    rdi,rax
  400a81:	e8 aa 0e 00 00       	call   401930 <strcmp>
  400a86:	85 c0                	test   eax,eax
  400a88:	0f 85 eb 01 00 00    	jne    400c79 <main+0xbb3>
            char path[100] = {0};
  400a8e:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400a95:	00 00 00 00 
  400a99:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400aa0:	00 00 00 00 
  400aa4:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400aab:	00 00 00 00 
  400aaf:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400ab6:	00 00 00 00 
  400aba:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400ac1:	00 00 00 00 
  400ac5:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400acc:	00 00 00 00 
  400ad0:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400ad7:	00 00 00 00 
  400adb:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400ae2:	00 00 00 00 
  400ae6:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400aed:	00 00 00 00 
  400af1:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400af8:	00 00 00 00 
  400afc:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400b03:	00 00 00 00 
  400b07:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400b0e:	00 00 00 00 
  400b12:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400b19:	00 00 00 
            printf("input path:");
  400b1c:	48 8d 05 95 4d 00 00 	lea    rax,[rip+0x4d95]        # 4058b8 <b+0xac>
  400b23:	48 89 c7             	mov    rdi,rax
  400b26:	b8 00 00 00 00       	mov    eax,0x0
  400b2b:	e8 40 30 00 00       	call   403b70 <printf>
            gets(path);
  400b30:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400b37:	48 89 c7             	mov    rdi,rax
  400b3a:	e8 c1 0c 00 00       	call   401800 <gets>
            int fd = open(path, O_RDONLY);
  400b3f:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400b46:	be 00 00 00 00       	mov    esi,0x0
  400b4b:	48 89 c7             	mov    rdi,rax
  400b4e:	e8 5d 05 00 00       	call   4010b0 <open>
  400b53:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if (fd < 0) {
  400b56:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  400b5a:	79 23                	jns    400b7f <main+0xab9>
                printf("open file %s failed\n", path);
  400b5c:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400b63:	48 89 c6             	mov    rsi,rax
  400b66:	48 8d 05 27 4e 00 00 	lea    rax,[rip+0x4e27]        # 405994 <b+0x188>
  400b6d:	48 89 c7             	mov    rdi,rax
  400b70:	b8 00 00 00 00       	mov    eax,0x0
  400b75:	e8 f6 2f 00 00       	call   403b70 <printf>
  400b7a:	e9 e5 f6 ff ff       	jmp    400264 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400b7f:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400b86:	00 00 00 00 
  400b8a:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400b91:	00 00 00 00 
  400b95:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400b9c:	00 00 00 00 
  400ba0:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400ba7:	00 00 00 00 
  400bab:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400bb2:	00 00 00 00 
  400bb6:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400bbd:	00 00 00 00 
  400bc1:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400bc8:	00 00 00 00 
  400bcc:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400bd3:	00 00 00 00 
  400bd7:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400bde:	00 00 00 00 
  400be2:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400be9:	00 00 00 00 
  400bed:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400bf4:	00 00 00 00 
  400bf8:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400bff:	00 00 00 00 
  400c03:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400c0a:	00 00 00 
                int  len         = 0;
  400c0d:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [rbp-0x38],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400c14:	eb 1e                	jmp    400c34 <main+0xb6e>
                    printf("%s", buffer);
  400c16:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400c1d:	48 89 c6             	mov    rsi,rax
  400c20:	48 8d 05 82 4d 00 00 	lea    rax,[rip+0x4d82]        # 4059a9 <b+0x19d>
  400c27:	48 89 c7             	mov    rdi,rax
  400c2a:	b8 00 00 00 00       	mov    eax,0x0
  400c2f:	e8 3c 2f 00 00       	call   403b70 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400c34:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400c3b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400c3e:	ba 64 00 00 00       	mov    edx,0x64
  400c43:	48 89 ce             	mov    rsi,rcx
  400c46:	89 c7                	mov    edi,eax
  400c48:	b8 00 00 00 00       	mov    eax,0x0
  400c4d:	e8 7e 04 00 00       	call   4010d0 <read>
  400c52:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
  400c55:	83 7d c8 00          	cmp    DWORD PTR [rbp-0x38],0x0
  400c59:	7f bb                	jg     400c16 <main+0xb50>
                }
                puts("");
  400c5b:	48 8d 05 4a 4d 00 00 	lea    rax,[rip+0x4d4a]        # 4059ac <b+0x1a0>
  400c62:	48 89 c7             	mov    rdi,rax
  400c65:	e8 36 0b 00 00       	call   4017a0 <puts>
                close(fd);
  400c6a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400c6d:	89 c7                	mov    edi,eax
  400c6f:	e8 4c 04 00 00       	call   4010c0 <close>
  400c74:	e9 eb f5 ff ff       	jmp    400264 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400c79:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400c80:	48 8d 15 26 4d 00 00 	lea    rdx,[rip+0x4d26]        # 4059ad <b+0x1a1>
  400c87:	48 89 d6             	mov    rsi,rdx
  400c8a:	48 89 c7             	mov    rdi,rax
  400c8d:	e8 9e 0c 00 00       	call   401930 <strcmp>
  400c92:	85 c0                	test   eax,eax
  400c94:	0f 85 ff 01 00 00    	jne    400e99 <main+0xdd3>
            char path[100] = {0};
  400c9a:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400ca1:	00 00 00 00 
  400ca5:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400cac:	00 00 00 00 
  400cb0:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400cb7:	00 00 00 00 
  400cbb:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400cc2:	00 00 00 00 
  400cc6:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400ccd:	00 00 00 00 
  400cd1:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400cd8:	00 00 00 00 
  400cdc:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400ce3:	00 00 00 00 
  400ce7:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400cee:	00 00 00 00 
  400cf2:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400cf9:	00 00 00 00 
  400cfd:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400d04:	00 00 00 00 
  400d08:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400d0f:	00 00 00 00 
  400d13:	48 c7 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],0x0
  400d1a:	00 00 00 00 
  400d1e:	c7 85 e8 fd ff ff 00 	mov    DWORD PTR [rbp-0x218],0x0
  400d25:	00 00 00 
            printf("input path:");
  400d28:	48 8d 05 89 4b 00 00 	lea    rax,[rip+0x4b89]        # 4058b8 <b+0xac>
  400d2f:	48 89 c7             	mov    rdi,rax
  400d32:	b8 00 00 00 00       	mov    eax,0x0
  400d37:	e8 34 2e 00 00       	call   403b70 <printf>
            gets(path);
  400d3c:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400d43:	48 89 c7             	mov    rdi,rax
  400d46:	e8 b5 0a 00 00       	call   401800 <gets>
            int fd = open(path, O_WRONLY);
  400d4b:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400d52:	be 01 00 00 00       	mov    esi,0x1
  400d57:	48 89 c7             	mov    rdi,rax
  400d5a:	e8 51 03 00 00       	call   4010b0 <open>
  400d5f:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
            if (fd < 0) {
  400d62:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  400d66:	79 23                	jns    400d8b <main+0xcc5>
                printf("open file %s failed\n", path);
  400d68:	48 8d 85 88 fd ff ff 	lea    rax,[rbp-0x278]
  400d6f:	48 89 c6             	mov    rsi,rax
  400d72:	48 8d 05 1b 4c 00 00 	lea    rax,[rip+0x4c1b]        # 405994 <b+0x188>
  400d79:	48 89 c7             	mov    rdi,rax
  400d7c:	b8 00 00 00 00       	mov    eax,0x0
  400d81:	e8 ea 2d 00 00       	call   403b70 <printf>
  400d86:	e9 d9 f4 ff ff       	jmp    400264 <main+0x19e>
            }
            else {
                char buffer[100] = {0};
  400d8b:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400d92:	00 00 00 00 
  400d96:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400d9d:	00 00 00 00 
  400da1:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400da8:	00 00 00 00 
  400dac:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400db3:	00 00 00 00 
  400db7:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400dbe:	00 00 00 00 
  400dc2:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400dc9:	00 00 00 00 
  400dcd:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400dd4:	00 00 00 00 
  400dd8:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400ddf:	00 00 00 00 
  400de3:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400dea:	00 00 00 00 
  400dee:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400df5:	00 00 00 00 
  400df9:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400e00:	00 00 00 00 
  400e04:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  400e0b:	00 00 00 00 
  400e0f:	c7 85 4c fe ff ff 00 	mov    DWORD PTR [rbp-0x1b4],0x0
  400e16:	00 00 00 
                printf("input content:");
  400e19:	48 8d 05 93 4b 00 00 	lea    rax,[rip+0x4b93]        # 4059b3 <b+0x1a7>
  400e20:	48 89 c7             	mov    rdi,rax
  400e23:	b8 00 00 00 00       	mov    eax,0x0
  400e28:	e8 43 2d 00 00       	call   403b70 <printf>
                gets(buffer);
  400e2d:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400e34:	48 89 c7             	mov    rdi,rax
  400e37:	e8 c4 09 00 00       	call   401800 <gets>
                int len = strlen(buffer);
  400e3c:	48 8d 85 ec fd ff ff 	lea    rax,[rbp-0x214]
  400e43:	48 89 c7             	mov    rdi,rax
  400e46:	e8 35 0b 00 00       	call   401980 <strlen>
  400e4b:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
                write(fd, buffer, len);
  400e4e:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  400e51:	48 8d 8d ec fd ff ff 	lea    rcx,[rbp-0x214]
  400e58:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400e5b:	48 89 ce             	mov    rsi,rcx
  400e5e:	89 c7                	mov    edi,eax
  400e60:	b8 00 00 00 00       	mov    eax,0x0
  400e65:	e8 76 02 00 00       	call   4010e0 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400e6a:	48 8d 95 88 fd ff ff 	lea    rdx,[rbp-0x278]
  400e71:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400e74:	89 c6                	mov    esi,eax
  400e76:	48 8d 05 4b 4b 00 00 	lea    rax,[rip+0x4b4b]        # 4059c8 <b+0x1bc>
  400e7d:	48 89 c7             	mov    rdi,rax
  400e80:	b8 00 00 00 00       	mov    eax,0x0
  400e85:	e8 e6 2c 00 00       	call   403b70 <printf>
                close(fd);
  400e8a:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  400e8d:	89 c7                	mov    edi,eax
  400e8f:	e8 2c 02 00 00       	call   4010c0 <close>
  400e94:	e9 cb f3 ff ff       	jmp    400264 <main+0x19e>
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
  400e99:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ea0:	48 8d 15 44 4b 00 00 	lea    rdx,[rip+0x4b44]        # 4059eb <b+0x1df>
  400ea7:	48 89 d6             	mov    rsi,rdx
  400eaa:	48 89 c7             	mov    rdi,rax
  400ead:	e8 7e 0a 00 00       	call   401930 <strcmp>
  400eb2:	85 c0                	test   eax,eax
  400eb4:	75 73                	jne    400f29 <main+0xe63>
  400eb6:	48 c7 45 a0 29 00 00 	mov    QWORD PTR [rbp-0x60],0x29
  400ebd:	00 
  400ebe:	48 c7 45 98 01 00 00 	mov    QWORD PTR [rbp-0x68],0x1
  400ec5:	00 
  400ec6:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400ecd:	00 
  400ece:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400ed5:	00 
  400ed6:	48 c7 85 70 fe ff ff 	mov    QWORD PTR [rbp-0x190],0x0
  400edd:	00 00 00 00 
  400ee1:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400ee8:	00 
  400ee9:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400ef0:	00 00 00 00 
typedef unsigned long long (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
  400ef4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  400ef8:	48 8b 4d 98          	mov    rcx,QWORD PTR [rbp-0x68]
  400efc:	48 8b 75 90          	mov    rsi,QWORD PTR [rbp-0x70]
  400f00:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  400f04:	4c 8b 45 80          	mov    r8,QWORD PTR [rbp-0x80]
  400f08:	4c 8b 8d 78 ff ff ff 	mov    r9,QWORD PTR [rbp-0x88]
  400f0f:	48 89 cf             	mov    rdi,rcx
  400f12:	4c 8b 95 70 fe ff ff 	mov    r10,QWORD PTR [rbp-0x190]
  400f19:	48 0f 05             	rex.W syscall 
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
  400f1c:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  400f21:	48 89 c3             	mov    rbx,rax
    return ret;
  400f24:	e9 c4 00 00 00       	jmp    400fed <main+0xf27>
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
  400f29:	48 8d 05 c2 4a 00 00 	lea    rax,[rip+0x4ac2]        # 4059f2 <b+0x1e6>
  400f30:	48 89 c7             	mov    rdi,rax
  400f33:	b8 00 00 00 00       	mov    eax,0x0
  400f38:	e8 33 2c 00 00       	call   403b70 <printf>
            int pid = 0;
  400f3d:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
            if ((pid = fork()) == 0) {
  400f44:	e8 67 02 00 00       	call   4011b0 <fork>
  400f49:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  400f4c:	83 7d d8 00          	cmp    DWORD PTR [rbp-0x28],0x0
  400f50:	75 59                	jne    400fab <main+0xee5>
                printf("forked, ready to execve\n");
  400f52:	48 8d 05 af 4a 00 00 	lea    rax,[rip+0x4aaf]        # 405a08 <b+0x1fc>
  400f59:	48 89 c7             	mov    rdi,rax
  400f5c:	b8 00 00 00 00       	mov    eax,0x0
  400f61:	e8 0a 2c 00 00       	call   403b70 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400f66:	48 8b 95 68 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x298]
  400f6d:	48 8b 8d 70 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x290]
  400f74:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400f7b:	48 89 ce             	mov    rsi,rcx
  400f7e:	48 89 c7             	mov    rdi,rax
  400f81:	e8 3a 02 00 00       	call   4011c0 <execve>
  400f86:	83 f8 ff             	cmp    eax,0xffffffff
  400f89:	75 20                	jne    400fab <main+0xee5>
                    printf("cannot find file:%s\n", cmd);
  400f8b:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400f92:	48 89 c6             	mov    rsi,rax
  400f95:	48 8d 05 85 4a 00 00 	lea    rax,[rip+0x4a85]        # 405a21 <b+0x215>
  400f9c:	48 89 c7             	mov    rdi,rax
  400f9f:	b8 00 00 00 00       	mov    eax,0x0
  400fa4:	e8 c7 2b 00 00       	call   403b70 <printf>
                    continue;
  400fa9:	eb 42                	jmp    400fed <main+0xf27>
                }
            }
            printf("forked. pid=%d\n", pid);
  400fab:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400fae:	89 c6                	mov    esi,eax
  400fb0:	48 8d 05 7f 4a 00 00 	lea    rax,[rip+0x4a7f]        # 405a36 <b+0x22a>
  400fb7:	48 89 c7             	mov    rdi,rax
  400fba:	b8 00 00 00 00       	mov    eax,0x0
  400fbf:	e8 ac 2b 00 00       	call   403b70 <printf>
            int loc = 0;
  400fc4:	c7 85 6c fe ff ff 00 	mov    DWORD PTR [rbp-0x194],0x0
  400fcb:	00 00 00 

            waitpid(pid, &loc, 0);
  400fce:	48 8d 8d 6c fe ff ff 	lea    rcx,[rbp-0x194]
  400fd5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  400fd8:	ba 00 00 00 00       	mov    edx,0x0
  400fdd:	48 89 ce             	mov    rsi,rcx
  400fe0:	89 c7                	mov    edi,eax
  400fe2:	e8 e9 01 00 00       	call   4011d0 <waitpid>
  400fe7:	e9 78 f2 ff ff       	jmp    400264 <main+0x19e>
                continue;
  400fec:	90                   	nop
    while (1) {
  400fed:	e9 72 f2 ff ff       	jmp    400264 <main+0x19e>
            break;
  400ff2:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400ff3:	b8 00 00 00 00       	mov    eax,0x0
  400ff8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  400ffc:	c9                   	leave  
  400ffd:	c3                   	ret    
  400ffe:	66 90                	xchg   ax,ax

0000000000401000 <reg_dev>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	b8 00 00 00 00       	mov    eax,0x0
  401009:	55                   	push   rbp
  40100a:	48 0f 05             	rex.W syscall 
  40100d:	5d                   	pop    rbp
  40100e:	c9                   	leave  
  40100f:	c3                   	ret    

0000000000401010 <dispose_dev>:
  401010:	55                   	push   rbp
  401011:	48 89 e5             	mov    rbp,rsp
  401014:	b8 01 00 00 00       	mov    eax,0x1
  401019:	55                   	push   rbp
  40101a:	48 0f 05             	rex.W syscall 
  40101d:	5d                   	pop    rbp
  40101e:	c9                   	leave  
  40101f:	c3                   	ret    

0000000000401020 <reg_drv>:
  401020:	55                   	push   rbp
  401021:	48 89 e5             	mov    rbp,rsp
  401024:	b8 02 00 00 00       	mov    eax,0x2
  401029:	55                   	push   rbp
  40102a:	48 0f 05             	rex.W syscall 
  40102d:	5d                   	pop    rbp
  40102e:	c9                   	leave  
  40102f:	c3                   	ret    

0000000000401030 <dispose_drv>:
  401030:	55                   	push   rbp
  401031:	48 89 e5             	mov    rbp,rsp
  401034:	b8 03 00 00 00       	mov    eax,0x3
  401039:	55                   	push   rbp
  40103a:	48 0f 05             	rex.W syscall 
  40103d:	5d                   	pop    rbp
  40103e:	c9                   	leave  
  40103f:	c3                   	ret    

0000000000401040 <call_drvfunc>:
  401040:	55                   	push   rbp
  401041:	48 89 e5             	mov    rbp,rsp
  401044:	b8 04 00 00 00       	mov    eax,0x4
  401049:	55                   	push   rbp
  40104a:	48 0f 05             	rex.W syscall 
  40104d:	5d                   	pop    rbp
  40104e:	c9                   	leave  
  40104f:	c3                   	ret    

0000000000401050 <req_mem>:
  401050:	55                   	push   rbp
  401051:	48 89 e5             	mov    rbp,rsp
  401054:	b8 05 00 00 00       	mov    eax,0x5
  401059:	55                   	push   rbp
  40105a:	48 0f 05             	rex.W syscall 
  40105d:	5d                   	pop    rbp
  40105e:	c9                   	leave  
  40105f:	c3                   	ret    

0000000000401060 <free_mem>:
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	b8 06 00 00 00       	mov    eax,0x6
  401069:	55                   	push   rbp
  40106a:	48 0f 05             	rex.W syscall 
  40106d:	5d                   	pop    rbp
  40106e:	c9                   	leave  
  40106f:	c3                   	ret    

0000000000401070 <reg_proc>:
  401070:	55                   	push   rbp
  401071:	48 89 e5             	mov    rbp,rsp
  401074:	b8 07 00 00 00       	mov    eax,0x7
  401079:	55                   	push   rbp
  40107a:	48 0f 05             	rex.W syscall 
  40107d:	5d                   	pop    rbp
  40107e:	c9                   	leave  
  40107f:	c3                   	ret    

0000000000401080 <del_proc>:
  401080:	55                   	push   rbp
  401081:	48 89 e5             	mov    rbp,rsp
  401084:	b8 08 00 00 00       	mov    eax,0x8
  401089:	55                   	push   rbp
  40108a:	48 0f 05             	rex.W syscall 
  40108d:	5d                   	pop    rbp
  40108e:	c9                   	leave  
  40108f:	c3                   	ret    

0000000000401090 <get_proc_addr>:
  401090:	55                   	push   rbp
  401091:	48 89 e5             	mov    rbp,rsp
  401094:	b8 09 00 00 00       	mov    eax,0x9
  401099:	55                   	push   rbp
  40109a:	48 0f 05             	rex.W syscall 
  40109d:	5d                   	pop    rbp
  40109e:	c9                   	leave  
  40109f:	c3                   	ret    

00000000004010a0 <chk_vm>:
  4010a0:	55                   	push   rbp
  4010a1:	48 89 e5             	mov    rbp,rsp
  4010a4:	b8 0a 00 00 00       	mov    eax,0xa
  4010a9:	55                   	push   rbp
  4010aa:	48 0f 05             	rex.W syscall 
  4010ad:	5d                   	pop    rbp
  4010ae:	c9                   	leave  
  4010af:	c3                   	ret    

00000000004010b0 <open>:
  4010b0:	55                   	push   rbp
  4010b1:	48 89 e5             	mov    rbp,rsp
  4010b4:	b8 0b 00 00 00       	mov    eax,0xb
  4010b9:	55                   	push   rbp
  4010ba:	48 0f 05             	rex.W syscall 
  4010bd:	5d                   	pop    rbp
  4010be:	c9                   	leave  
  4010bf:	c3                   	ret    

00000000004010c0 <close>:
  4010c0:	55                   	push   rbp
  4010c1:	48 89 e5             	mov    rbp,rsp
  4010c4:	b8 0c 00 00 00       	mov    eax,0xc
  4010c9:	55                   	push   rbp
  4010ca:	48 0f 05             	rex.W syscall 
  4010cd:	5d                   	pop    rbp
  4010ce:	c9                   	leave  
  4010cf:	c3                   	ret    

00000000004010d0 <read>:
  4010d0:	55                   	push   rbp
  4010d1:	48 89 e5             	mov    rbp,rsp
  4010d4:	b8 0d 00 00 00       	mov    eax,0xd
  4010d9:	55                   	push   rbp
  4010da:	48 0f 05             	rex.W syscall 
  4010dd:	5d                   	pop    rbp
  4010de:	c9                   	leave  
  4010df:	c3                   	ret    

00000000004010e0 <write>:
  4010e0:	55                   	push   rbp
  4010e1:	48 89 e5             	mov    rbp,rsp
  4010e4:	b8 0e 00 00 00       	mov    eax,0xe
  4010e9:	55                   	push   rbp
  4010ea:	48 0f 05             	rex.W syscall 
  4010ed:	5d                   	pop    rbp
  4010ee:	c9                   	leave  
  4010ef:	c3                   	ret    

00000000004010f0 <seek>:
  4010f0:	55                   	push   rbp
  4010f1:	48 89 e5             	mov    rbp,rsp
  4010f4:	b8 0f 00 00 00       	mov    eax,0xf
  4010f9:	55                   	push   rbp
  4010fa:	48 0f 05             	rex.W syscall 
  4010fd:	5d                   	pop    rbp
  4010fe:	c9                   	leave  
  4010ff:	c3                   	ret    

0000000000401100 <tell>:
  401100:	55                   	push   rbp
  401101:	48 89 e5             	mov    rbp,rsp
  401104:	b8 10 00 00 00       	mov    eax,0x10
  401109:	55                   	push   rbp
  40110a:	48 0f 05             	rex.W syscall 
  40110d:	5d                   	pop    rbp
  40110e:	c9                   	leave  
  40110f:	c3                   	ret    

0000000000401110 <reg_vol>:
  401110:	55                   	push   rbp
  401111:	48 89 e5             	mov    rbp,rsp
  401114:	b8 11 00 00 00       	mov    eax,0x11
  401119:	55                   	push   rbp
  40111a:	48 0f 05             	rex.W syscall 
  40111d:	5d                   	pop    rbp
  40111e:	c9                   	leave  
  40111f:	c3                   	ret    

0000000000401120 <free_vol>:
  401120:	55                   	push   rbp
  401121:	48 89 e5             	mov    rbp,rsp
  401124:	b8 12 00 00 00       	mov    eax,0x12
  401129:	55                   	push   rbp
  40112a:	48 0f 05             	rex.W syscall 
  40112d:	5d                   	pop    rbp
  40112e:	c9                   	leave  
  40112f:	c3                   	ret    

0000000000401130 <exec>:
  401130:	55                   	push   rbp
  401131:	48 89 e5             	mov    rbp,rsp
  401134:	b8 13 00 00 00       	mov    eax,0x13
  401139:	55                   	push   rbp
  40113a:	48 0f 05             	rex.W syscall 
  40113d:	5d                   	pop    rbp
  40113e:	c9                   	leave  
  40113f:	c3                   	ret    

0000000000401140 <exit>:
  401140:	55                   	push   rbp
  401141:	48 89 e5             	mov    rbp,rsp
  401144:	b8 14 00 00 00       	mov    eax,0x14
  401149:	55                   	push   rbp
  40114a:	48 0f 05             	rex.W syscall 
  40114d:	5d                   	pop    rbp
  40114e:	c9                   	leave  
  40114f:	c3                   	ret    

0000000000401150 <abort>:
  401150:	55                   	push   rbp
  401151:	48 89 e5             	mov    rbp,rsp
  401154:	b8 14 00 00 00       	mov    eax,0x14
  401159:	55                   	push   rbp
  40115a:	48 0f 05             	rex.W syscall 
  40115d:	5d                   	pop    rbp
  40115e:	c9                   	leave  
  40115f:	c3                   	ret    

0000000000401160 <call>:
  401160:	55                   	push   rbp
  401161:	48 89 e5             	mov    rbp,rsp
  401164:	b8 15 00 00 00       	mov    eax,0x15
  401169:	55                   	push   rbp
  40116a:	48 0f 05             	rex.W syscall 
  40116d:	5d                   	pop    rbp
  40116e:	c9                   	leave  
  40116f:	c3                   	ret    

0000000000401170 <mkfifo>:
  401170:	55                   	push   rbp
  401171:	48 89 e5             	mov    rbp,rsp
  401174:	b8 16 00 00 00       	mov    eax,0x16
  401179:	55                   	push   rbp
  40117a:	48 0f 05             	rex.W syscall 
  40117d:	5d                   	pop    rbp
  40117e:	c9                   	leave  
  40117f:	c3                   	ret    

0000000000401180 <brk>:
  401180:	55                   	push   rbp
  401181:	48 89 e5             	mov    rbp,rsp
  401184:	b8 17 00 00 00       	mov    eax,0x17
  401189:	55                   	push   rbp
  40118a:	48 0f 05             	rex.W syscall 
  40118d:	5d                   	pop    rbp
  40118e:	c9                   	leave  
  40118f:	c3                   	ret    

0000000000401190 <find_dev>:
  401190:	55                   	push   rbp
  401191:	48 89 e5             	mov    rbp,rsp
  401194:	b8 19 00 00 00       	mov    eax,0x19
  401199:	55                   	push   rbp
  40119a:	48 0f 05             	rex.W syscall 
  40119d:	5d                   	pop    rbp
  40119e:	c9                   	leave  
  40119f:	c3                   	ret    

00000000004011a0 <operate_dev>:
  4011a0:	55                   	push   rbp
  4011a1:	48 89 e5             	mov    rbp,rsp
  4011a4:	b8 1a 00 00 00       	mov    eax,0x1a
  4011a9:	55                   	push   rbp
  4011aa:	48 0f 05             	rex.W syscall 
  4011ad:	5d                   	pop    rbp
  4011ae:	c9                   	leave  
  4011af:	c3                   	ret    

00000000004011b0 <fork>:
  4011b0:	55                   	push   rbp
  4011b1:	48 89 e5             	mov    rbp,rsp
  4011b4:	b8 1b 00 00 00       	mov    eax,0x1b
  4011b9:	55                   	push   rbp
  4011ba:	48 0f 05             	rex.W syscall 
  4011bd:	5d                   	pop    rbp
  4011be:	c9                   	leave  
  4011bf:	c3                   	ret    

00000000004011c0 <execve>:
  4011c0:	55                   	push   rbp
  4011c1:	48 89 e5             	mov    rbp,rsp
  4011c4:	b8 1c 00 00 00       	mov    eax,0x1c
  4011c9:	55                   	push   rbp
  4011ca:	48 0f 05             	rex.W syscall 
  4011cd:	5d                   	pop    rbp
  4011ce:	c9                   	leave  
  4011cf:	c3                   	ret    

00000000004011d0 <waitpid>:
  4011d0:	55                   	push   rbp
  4011d1:	48 89 e5             	mov    rbp,rsp
  4011d4:	b8 1d 00 00 00       	mov    eax,0x1d
  4011d9:	55                   	push   rbp
  4011da:	48 0f 05             	rex.W syscall 
  4011dd:	5d                   	pop    rbp
  4011de:	c9                   	leave  
  4011df:	c3                   	ret    

00000000004011e0 <mmap>:
  4011e0:	55                   	push   rbp
  4011e1:	48 89 e5             	mov    rbp,rsp
  4011e4:	b8 1e 00 00 00       	mov    eax,0x1e
  4011e9:	55                   	push   rbp
  4011ea:	48 0f 05             	rex.W syscall 
  4011ed:	5d                   	pop    rbp
  4011ee:	c9                   	leave  
  4011ef:	c3                   	ret    

00000000004011f0 <munmap>:
  4011f0:	55                   	push   rbp
  4011f1:	48 89 e5             	mov    rbp,rsp
  4011f4:	b8 1f 00 00 00       	mov    eax,0x1f
  4011f9:	55                   	push   rbp
  4011fa:	48 0f 05             	rex.W syscall 
  4011fd:	5d                   	pop    rbp
  4011fe:	c9                   	leave  
  4011ff:	c3                   	ret    

0000000000401200 <mknod>:
  401200:	55                   	push   rbp
  401201:	48 89 e5             	mov    rbp,rsp
  401204:	b8 21 00 00 00       	mov    eax,0x21
  401209:	55                   	push   rbp
  40120a:	48 0f 05             	rex.W syscall 
  40120d:	5d                   	pop    rbp
  40120e:	c9                   	leave  
  40120f:	c3                   	ret    

0000000000401210 <kb_readc>:
  401210:	55                   	push   rbp
  401211:	48 89 e5             	mov    rbp,rsp
  401214:	b8 64 00 00 00       	mov    eax,0x64
  401219:	55                   	push   rbp
  40121a:	48 0f 05             	rex.W syscall 
  40121d:	5d                   	pop    rbp
  40121e:	c9                   	leave  
  40121f:	c3                   	ret    

0000000000401220 <remove>:
  401220:	55                   	push   rbp
  401221:	48 89 e5             	mov    rbp,rsp
  401224:	b8 22 00 00 00       	mov    eax,0x22
  401229:	55                   	push   rbp
  40122a:	48 0f 05             	rex.W syscall 
  40122d:	5d                   	pop    rbp
  40122e:	c9                   	leave  
  40122f:	c3                   	ret    

0000000000401230 <sbrk>:
  401230:	55                   	push   rbp
  401231:	48 89 e5             	mov    rbp,rsp
  401234:	b8 23 00 00 00       	mov    eax,0x23
  401239:	55                   	push   rbp
  40123a:	48 0f 05             	rex.W syscall 
  40123d:	5d                   	pop    rbp
  40123e:	c9                   	leave  
  40123f:	c3                   	ret    

0000000000401240 <chkmmap>:
  401240:	55                   	push   rbp
  401241:	48 89 e5             	mov    rbp,rsp
  401244:	b8 24 00 00 00       	mov    eax,0x24
  401249:	55                   	push   rbp
  40124a:	48 0f 05             	rex.W syscall 
  40124d:	5d                   	pop    rbp
  40124e:	c9                   	leave  
  40124f:	c3                   	ret    

0000000000401250 <_readdir>:
  401250:	55                   	push   rbp
  401251:	48 89 e5             	mov    rbp,rsp
  401254:	b8 25 00 00 00       	mov    eax,0x25
  401259:	55                   	push   rbp
  40125a:	48 0f 05             	rex.W syscall 
  40125d:	5d                   	pop    rbp
  40125e:	c9                   	leave  
  40125f:	c3                   	ret    

0000000000401260 <create_window>:
  401260:	55                   	push   rbp
  401261:	48 89 e5             	mov    rbp,rsp
  401264:	b8 65 00 00 00       	mov    eax,0x65
  401269:	55                   	push   rbp
  40126a:	48 0f 05             	rex.W syscall 
  40126d:	5d                   	pop    rbp
  40126e:	c9                   	leave  
  40126f:	c3                   	ret    

0000000000401270 <destroy_window>:
  401270:	55                   	push   rbp
  401271:	48 89 e5             	mov    rbp,rsp
  401274:	b8 66 00 00 00       	mov    eax,0x66
  401279:	55                   	push   rbp
  40127a:	48 0f 05             	rex.W syscall 
  40127d:	5d                   	pop    rbp
  40127e:	c9                   	leave  
  40127f:	c3                   	ret    

0000000000401280 <show_window>:
  401280:	55                   	push   rbp
  401281:	48 89 e5             	mov    rbp,rsp
  401284:	b8 67 00 00 00       	mov    eax,0x67
  401289:	55                   	push   rbp
  40128a:	48 0f 05             	rex.W syscall 
  40128d:	5d                   	pop    rbp
  40128e:	c9                   	leave  
  40128f:	c3                   	ret    

0000000000401290 <hide_window>:
  401290:	55                   	push   rbp
  401291:	48 89 e5             	mov    rbp,rsp
  401294:	b8 68 00 00 00       	mov    eax,0x68
  401299:	55                   	push   rbp
  40129a:	48 0f 05             	rex.W syscall 
  40129d:	5d                   	pop    rbp
  40129e:	c9                   	leave  
  40129f:	c3                   	ret    

00000000004012a0 <resize_window>:
  4012a0:	55                   	push   rbp
  4012a1:	48 89 e5             	mov    rbp,rsp
  4012a4:	b8 69 00 00 00       	mov    eax,0x69
  4012a9:	55                   	push   rbp
  4012aa:	48 0f 05             	rex.W syscall 
  4012ad:	5d                   	pop    rbp
  4012ae:	c9                   	leave  
  4012af:	c3                   	ret    

00000000004012b0 <move_window>:
  4012b0:	55                   	push   rbp
  4012b1:	48 89 e5             	mov    rbp,rsp
  4012b4:	b8 6a 00 00 00       	mov    eax,0x6a
  4012b9:	55                   	push   rbp
  4012ba:	48 0f 05             	rex.W syscall 
  4012bd:	5d                   	pop    rbp
  4012be:	c9                   	leave  
  4012bf:	c3                   	ret    

00000000004012c0 <set_window_text>:
  4012c0:	55                   	push   rbp
  4012c1:	48 89 e5             	mov    rbp,rsp
  4012c4:	b8 6b 00 00 00       	mov    eax,0x6b
  4012c9:	55                   	push   rbp
  4012ca:	48 0f 05             	rex.W syscall 
  4012cd:	5d                   	pop    rbp
  4012ce:	c9                   	leave  
  4012cf:	c3                   	ret    

00000000004012d0 <attach_window>:
  4012d0:	55                   	push   rbp
  4012d1:	48 89 e5             	mov    rbp,rsp
  4012d4:	b8 6c 00 00 00       	mov    eax,0x6c
  4012d9:	55                   	push   rbp
  4012da:	48 0f 05             	rex.W syscall 
  4012dd:	5d                   	pop    rbp
  4012de:	c9                   	leave  
  4012df:	c3                   	ret    

00000000004012e0 <detach_window>:
  4012e0:	55                   	push   rbp
  4012e1:	48 89 e5             	mov    rbp,rsp
  4012e4:	b8 6d 00 00 00       	mov    eax,0x6d
  4012e9:	55                   	push   rbp
  4012ea:	48 0f 05             	rex.W syscall 
  4012ed:	5d                   	pop    rbp
  4012ee:	c9                   	leave  
  4012ef:	c3                   	ret    

00000000004012f0 <add_window_event_listener>:
  4012f0:	55                   	push   rbp
  4012f1:	48 89 e5             	mov    rbp,rsp
  4012f4:	b8 6e 00 00 00       	mov    eax,0x6e
  4012f9:	55                   	push   rbp
  4012fa:	48 0f 05             	rex.W syscall 
  4012fd:	5d                   	pop    rbp
  4012fe:	c9                   	leave  
  4012ff:	c3                   	ret    

0000000000401300 <remove_window_event_listener>:
  401300:	55                   	push   rbp
  401301:	48 89 e5             	mov    rbp,rsp
  401304:	b8 6f 00 00 00       	mov    eax,0x6f
  401309:	55                   	push   rbp
  40130a:	48 0f 05             	rex.W syscall 
  40130d:	5d                   	pop    rbp
  40130e:	c9                   	leave  
  40130f:	c3                   	ret    

0000000000401310 <send_window_event>:
  401310:	55                   	push   rbp
  401311:	48 89 e5             	mov    rbp,rsp
  401314:	b8 70 00 00 00       	mov    eax,0x70
  401319:	55                   	push   rbp
  40131a:	48 0f 05             	rex.W syscall 
  40131d:	5d                   	pop    rbp
  40131e:	c9                   	leave  
  40131f:	c3                   	ret    

0000000000401320 <get_window_text>:
  401320:	55                   	push   rbp
  401321:	48 89 e5             	mov    rbp,rsp
  401324:	b8 71 00 00 00       	mov    eax,0x71
  401329:	55                   	push   rbp
  40132a:	48 0f 05             	rex.W syscall 
  40132d:	5d                   	pop    rbp
  40132e:	c9                   	leave  
  40132f:	c3                   	ret    

0000000000401330 <fetch_event>:
  401330:	55                   	push   rbp
  401331:	48 89 e5             	mov    rbp,rsp
  401334:	b8 72 00 00 00       	mov    eax,0x72
  401339:	55                   	push   rbp
  40133a:	48 0f 05             	rex.W syscall 
  40133d:	5d                   	pop    rbp
  40133e:	c9                   	leave  
  40133f:	c3                   	ret    

0000000000401340 <default_deal_window_event>:
  401340:	55                   	push   rbp
  401341:	48 89 e5             	mov    rbp,rsp
  401344:	b8 73 00 00 00       	mov    eax,0x73
  401349:	55                   	push   rbp
  40134a:	48 0f 05             	rex.W syscall 
  40134d:	5d                   	pop    rbp
  40134e:	c9                   	leave  
  40134f:	c3                   	ret    

0000000000401350 <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  401350:	f3 0f 1e fa          	endbr64 
  401354:	55                   	push   rbp
  401355:	48 89 e5             	mov    rbp,rsp
  401358:	48 83 ec 20          	sub    rsp,0x20
  40135c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
	DIR* dirp = (DIR*)malloc(sizeof(DIR));
  401360:	bf 20 00 00 00       	mov    edi,0x20
  401365:	e8 46 33 00 00       	call   4046b0 <malloc>
  40136a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	if(dirp == NULL)
  40136e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  401373:	75 0a                	jne    40137f <opendir+0x2f>
	{
		return NULL;
  401375:	b8 00 00 00 00       	mov    eax,0x0
  40137a:	e9 a6 00 00 00       	jmp    401425 <opendir+0xd5>
	}
	dirp->fd = open(name, O_DIRECTORY);
  40137f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401383:	be 00 40 00 00       	mov    esi,0x4000
  401388:	48 89 c7             	mov    rdi,rax
  40138b:	e8 20 fd ff ff       	call   4010b0 <open>
  401390:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  401394:	89 02                	mov    DWORD PTR [rdx],eax
	if(dirp->fd < 0)
  401396:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40139a:	8b 00                	mov    eax,DWORD PTR [rax]
  40139c:	85 c0                	test   eax,eax
  40139e:	79 13                	jns    4013b3 <opendir+0x63>
	{
		free(dirp);
  4013a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013a4:	48 89 c7             	mov    rdi,rax
  4013a7:	e8 04 2d 00 00       	call   4040b0 <free>
		return NULL;
  4013ac:	b8 00 00 00 00       	mov    eax,0x0
  4013b1:	eb 72                	jmp    401425 <opendir+0xd5>
	}
	dirp->buf = (char*)malloc(1024);
  4013b3:	bf 00 04 00 00       	mov    edi,0x400
  4013b8:	e8 f3 32 00 00       	call   4046b0 <malloc>
  4013bd:	48 89 c2             	mov    rdx,rax
  4013c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013c4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	if(dirp->buf == NULL)
  4013c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013cc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  4013d0:	48 85 c0             	test   rax,rax
  4013d3:	75 20                	jne    4013f5 <opendir+0xa5>
	{
		close(dirp->fd);
  4013d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013d9:	8b 00                	mov    eax,DWORD PTR [rax]
  4013db:	89 c7                	mov    edi,eax
  4013dd:	e8 de fc ff ff       	call   4010c0 <close>
		free(dirp);
  4013e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013e6:	48 89 c7             	mov    rdi,rax
  4013e9:	e8 c2 2c 00 00       	call   4040b0 <free>
		return NULL;
  4013ee:	b8 00 00 00 00       	mov    eax,0x0
  4013f3:	eb 30                	jmp    401425 <opendir+0xd5>
	}
	dirp->buflen = 1024;
  4013f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4013f9:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
	dirp->pos = 0;
  401400:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401404:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
	dirp->end = 0;
  40140b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40140f:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
	dirp->eof = 0;
  401416:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40141a:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
	return dirp;
  401421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  401425:	c9                   	leave  
  401426:	c3                   	ret    

0000000000401427 <closedir>:

int closedir(DIR* dirp)
{
  401427:	f3 0f 1e fa          	endbr64 
  40142b:	55                   	push   rbp
  40142c:	48 89 e5             	mov    rbp,rsp
  40142f:	48 83 ec 50          	sub    rsp,0x50
  401433:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	if(dirp == NULL)
  401437:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40143c:	75 0a                	jne    401448 <closedir+0x21>
	{
		return -1;
  40143e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401443:	e9 88 00 00 00       	jmp    4014d0 <closedir+0xa9>
	}
	do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  401448:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40144c:	8b 00                	mov    eax,DWORD PTR [rax]
  40144e:	48 98                	cdqe   
  401450:	48 c7 45 f8 0c 00 00 	mov    QWORD PTR [rbp-0x8],0xc
  401457:	00 
  401458:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40145c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401463:	00 
  401464:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40146b:	00 
  40146c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401473:	00 
  401474:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40147b:	00 
  40147c:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401483:	00 
#define SYSCALL_DRV_IOCTL 40
#define SYSCALL_REBOOT 41
#define SYSCALL_GETCWD 42
#define SYSCALL_KB_READC 100
__attribute__((__always_inline__))inline int do_syscall(long long func,long long a1,long long a2,long long a3,long long a4,long long a5,long long a6){
        __asm__ volatile(".byte 0x48\n"
  401484:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401488:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  40148c:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401490:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401494:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401498:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40149c:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4014a0:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
        long long ret=0;
  4014a3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014aa:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4014ab:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	free(dirp->buf);
  4014af:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014b3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  4014b7:	48 89 c7             	mov    rdi,rax
  4014ba:	e8 f1 2b 00 00       	call   4040b0 <free>
	free(dirp);
  4014bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014c3:	48 89 c7             	mov    rdi,rax
  4014c6:	e8 e5 2b 00 00       	call   4040b0 <free>
	return 0;
  4014cb:	b8 00 00 00 00       	mov    eax,0x0
}
  4014d0:	c9                   	leave  
  4014d1:	c3                   	ret    

00000000004014d2 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  4014d2:	f3 0f 1e fa          	endbr64 
  4014d6:	55                   	push   rbp
  4014d7:	48 89 e5             	mov    rbp,rsp
  4014da:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	// readdir syscall返回的是状态码
	if(do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0)
  4014de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014e2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  4014e6:	48 89 c2             	mov    rdx,rax
  4014e9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4014ed:	8b 00                	mov    eax,DWORD PTR [rax]
  4014ef:	48 98                	cdqe   
  4014f1:	48 c7 45 f8 25 00 00 	mov    QWORD PTR [rbp-0x8],0x25
  4014f8:	00 
  4014f9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4014fd:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401501:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401508:	00 
  401509:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401510:	00 
  401511:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401518:	00 
  401519:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401520:	00 
        __asm__ volatile(".byte 0x48\n"
  401521:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401525:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401529:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40152d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401531:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401535:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401539:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40153d:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401540:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401547:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  401548:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40154c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401550:	85 c0                	test   eax,eax
  401552:	79 12                	jns    401566 <readdir+0x94>
	{
		dirp->eof = 1;
  401554:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401558:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
		return NULL;
  40155f:	b8 00 00 00 00       	mov    eax,0x0
  401564:	eb 08                	jmp    40156e <readdir+0x9c>
	}
	return (struct dirent*)dirp->buf;
  401566:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  40156a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  40156e:	5d                   	pop    rbp
  40156f:	c3                   	ret    

0000000000401570 <chdir>:
int chdir(const char* name)
{
  401570:	f3 0f 1e fa          	endbr64 
  401574:	55                   	push   rbp
  401575:	48 89 e5             	mov    rbp,rsp
  401578:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
	return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  40157c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  401580:	48 c7 45 f8 26 00 00 	mov    QWORD PTR [rbp-0x8],0x26
  401587:	00 
  401588:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  40158c:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  401593:	00 
  401594:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40159b:	00 
  40159c:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4015a3:	00 
  4015a4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4015ab:	00 
  4015ac:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4015b3:	00 
        __asm__ volatile(".byte 0x48\n"
  4015b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4015b8:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4015bc:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4015c0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4015c4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4015c8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4015cc:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4015d0:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4015d3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4015da:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4015db:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4015df:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  4015e3:	5d                   	pop    rbp
  4015e4:	c3                   	ret    

00000000004015e5 <creat>:
int creat(const char* name, mode_t mode)
{
  4015e5:	f3 0f 1e fa          	endbr64 
  4015e9:	55                   	push   rbp
  4015ea:	48 89 e5             	mov    rbp,rsp
  4015ed:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  4015f1:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
	return do_syscall(SYSCALL_OPEN, (long long)name,
  4015f4:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  4015f7:	83 c8 41             	or     eax,0x41
  4015fa:	48 98                	cdqe   
  4015fc:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401600:	48 c7 45 f8 0b 00 00 	mov    QWORD PTR [rbp-0x8],0xb
  401607:	00 
  401608:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  40160c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401610:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401617:	00 
  401618:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40161f:	00 
  401620:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401627:	00 
  401628:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40162f:	00 
        __asm__ volatile(".byte 0x48\n"
  401630:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401634:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401638:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  40163c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401640:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  401644:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401648:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40164c:	48 0f 05             	rex.W syscall 
        long long ret=0;
  40164f:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401656:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  401657:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  40165b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
					  (long long)O_CREAT | (long long)O_WRONLY | (long long)mode, 0, 0, 0, 0);
}
  40165f:	5d                   	pop    rbp
  401660:	c3                   	ret    

0000000000401661 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  401661:	f3 0f 1e fa          	endbr64 
  401665:	55                   	push   rbp
  401666:	48 89 e5             	mov    rbp,rsp
  401669:	48 83 ec 10          	sub    rsp,0x10
  40166d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  401671:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
	return creat(path, mode | O_DIRECTORY);
  401674:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401677:	80 cc 40             	or     ah,0x40
  40167a:	89 c2                	mov    edx,eax
  40167c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401680:	89 d6                	mov    esi,edx
  401682:	48 89 c7             	mov    rdi,rax
  401685:	e8 5b ff ff ff       	call   4015e5 <creat>
}
  40168a:	c9                   	leave  
  40168b:	c3                   	ret    

000000000040168c <rename>:
int rename(const char* oldpath, const char* newpath)
{
  40168c:	f3 0f 1e fa          	endbr64 
  401690:	55                   	push   rbp
  401691:	48 89 e5             	mov    rbp,rsp
  401694:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401698:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  40169c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4016a0:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  4016a4:	48 c7 45 f8 27 00 00 	mov    QWORD PTR [rbp-0x8],0x27
  4016ab:	00 
  4016ac:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  4016b0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4016b4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4016bb:	00 
  4016bc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4016c3:	00 
  4016c4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4016cb:	00 
  4016cc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4016d3:	00 
        __asm__ volatile(".byte 0x48\n"
  4016d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4016d8:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  4016dc:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  4016e0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  4016e4:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  4016e8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4016ec:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4016f0:	48 0f 05             	rex.W syscall 
        long long ret=0;
  4016f3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4016fa:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  4016fb:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  4016ff:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
}
  401703:	5d                   	pop    rbp
  401704:	c3                   	ret    

0000000000401705 <getcwd>:
char* getcwd(char* buf, size_t size)
{
  401705:	f3 0f 1e fa          	endbr64 
  401709:	55                   	push   rbp
  40170a:	48 89 e5             	mov    rbp,rsp
  40170d:	48 83 ec 50          	sub    rsp,0x50
  401711:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  401715:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	if(!buf)
  401719:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  40171e:	75 10                	jne    401730 <getcwd+0x2b>
	{
		buf = malloc(size);
  401720:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401724:	48 89 c7             	mov    rdi,rax
  401727:	e8 84 2f 00 00       	call   4046b0 <malloc>
  40172c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	}
	return (char*)do_syscall(SYSCALL_GETCWD, (long long)buf, (long long)size, 0, 0, 0, 0);
  401730:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401734:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  401738:	48 c7 45 f8 2a 00 00 	mov    QWORD PTR [rbp-0x8],0x2a
  40173f:	00 
  401740:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  401744:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401748:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  40174f:	00 
  401750:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401757:	00 
  401758:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40175f:	00 
  401760:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401767:	00 
        __asm__ volatile(".byte 0x48\n"
  401768:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40176c:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  401770:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  401774:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  401778:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  40177c:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401780:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401784:	48 0f 05             	rex.W syscall 
        long long ret=0;
  401787:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40178e:	00 
        __asm__ volatile("mov %%rax,%0"::"m"(ret));
  40178f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        return ret;
  401793:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  401797:	48 98                	cdqe   
  401799:	c9                   	leave  
  40179a:	c3                   	ret    

Disassembly of section .text.puts:

00000000004017a0 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  4017a0:	f3 0f 1e fa          	endbr64 
  4017a4:	41 54                	push   r12
  4017a6:	55                   	push   rbp
  4017a7:	48 89 fd             	mov    rbp,rdi
  4017aa:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  4017ab:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  4017ae:	40 84 ff             	test   dil,dil
  4017b1:	74 35                	je     4017e8 <puts+0x48>
  4017b3:	31 db                	xor    ebx,ebx
  4017b5:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  4017b8:	e8 13 26 00 00       	call   403dd0 <putchar>
  4017bd:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  4017c0:	48 83 c3 01          	add    rbx,0x1
  4017c4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4017c9:	40 84 ff             	test   dil,dil
  4017cc:	75 ea                	jne    4017b8 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  4017ce:	bf 0a 00 00 00       	mov    edi,0xa
  4017d3:	e8 f8 25 00 00       	call   403dd0 <putchar>
		r++;
  4017d8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  4017dd:	5b                   	pop    rbx
  4017de:	5d                   	pop    rbp
  4017df:	41 5c                	pop    r12
  4017e1:	c3                   	ret    
  4017e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4017e8:	5b                   	pop    rbx
	return r ? r : EOF;
  4017e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  4017ee:	5d                   	pop    rbp
  4017ef:	41 5c                	pop    r12
  4017f1:	c3                   	ret    

Disassembly of section .text.gets:

0000000000401800 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  401800:	f3 0f 1e fa          	endbr64 
  401804:	41 54                	push   r12
  401806:	49 89 fc             	mov    r12,rdi
	*str = 0;
  401809:	c6 07 00             	mov    BYTE PTR [rdi],0x0
  40180c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	while(1)
	{
		read(1, str, 1);
  401810:	ba 01 00 00 00       	mov    edx,0x1
  401815:	4c 89 e6             	mov    rsi,r12
  401818:	bf 01 00 00 00       	mov    edi,0x1
  40181d:	31 c0                	xor    eax,eax
  40181f:	e8 ac f8 ff ff       	call   4010d0 <read>
		if(!*str)
  401824:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  401829:	84 c0                	test   al,al
  40182b:	74 e3                	je     401810 <gets+0x10>
		{
			continue;
		}
		if(*str == '\n')
  40182d:	3c 0a                	cmp    al,0xa
  40182f:	74 1f                	je     401850 <gets+0x50>
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  401831:	3c 08                	cmp    al,0x8
  401833:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  401838:	4c 0f 44 e2          	cmove  r12,rdx
		}
		*++str = 0;
  40183c:	41 c6 44 24 01 00    	mov    BYTE PTR [r12+0x1],0x0
  401842:	49 83 c4 01          	add    r12,0x1
  401846:	eb c8                	jmp    401810 <gets+0x10>
  401848:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40184f:	00 
	}
	return str;
  401850:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  401853:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401858:	41 5c                	pop    r12
  40185a:	c3                   	ret    

Disassembly of section .text.memset:

0000000000401860 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401860:	f3 0f 1e fa          	endbr64 
  401864:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401867:	48 85 d2             	test   rdx,rdx
  40186a:	74 77                	je     4018e3 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40186c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401871:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401874:	48 83 fa 02          	cmp    rdx,0x2
  401878:	76 69                	jbe    4018e3 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40187a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40187f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401883:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401888:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40188c:	48 83 fa 06          	cmp    rdx,0x6
  401890:	76 51                	jbe    4018e3 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401892:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401897:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40189b:	48 83 fa 08          	cmp    rdx,0x8
  40189f:	76 42                	jbe    4018e3 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  4018a1:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  4018a4:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4018a8:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  4018ab:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4018ae:	45 89 c1             	mov    r9d,r8d
	s += k;
  4018b1:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  4018b5:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4018b8:	44 89 c7             	mov    edi,r8d
  4018bb:	41 c1 e1 10          	shl    r9d,0x10
  4018bf:	c1 e7 08             	shl    edi,0x8
  4018c2:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  4018c6:	44 09 cf             	or     edi,r9d
  4018c9:	48 01 ca             	add    rdx,rcx
  4018cc:	44 09 c7             	or     edi,r8d
  4018cf:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  4018d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  4018d8:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  4018da:	48 83 c1 04          	add    rcx,0x4
  4018de:	48 39 ca             	cmp    rdx,rcx
  4018e1:	75 f5                	jne    4018d8 <memset+0x78>
	}

	return dest;
}
  4018e3:	c3                   	ret    

Disassembly of section .text.strcat:

00000000004018f0 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  4018f0:	f3 0f 1e fa          	endbr64 
  4018f4:	41 54                	push   r12
  4018f6:	49 89 fc             	mov    r12,rdi
  4018f9:	55                   	push   rbp
  4018fa:	48 89 f5             	mov    rbp,rsi
  4018fd:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  4018fe:	e8 7d 00 00 00       	call   401980 <strlen>
	const size_t srclen = strlen(src);
  401903:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  401906:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  401909:	e8 72 00 00 00       	call   401980 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  40190e:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  401912:	48 89 ee             	mov    rsi,rbp
  401915:	48 8d 50 01          	lea    rdx,[rax+0x1]
  401919:	e8 d2 2d 00 00       	call   4046f0 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  40191e:	4c 89 e0             	mov    rax,r12
  401921:	5b                   	pop    rbx
  401922:	5d                   	pop    rbp
  401923:	41 5c                	pop    r12
  401925:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000401930 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  401930:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  401934:	48 39 f7             	cmp    rdi,rsi
  401937:	74 34                	je     40196d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  401939:	48 85 ff             	test   rdi,rdi
  40193c:	74 38                	je     401976 <strcmp+0x46>
  40193e:	48 85 f6             	test   rsi,rsi
  401941:	74 33                	je     401976 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  401943:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401946:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401949:	38 ca                	cmp    dl,cl
  40194b:	75 23                	jne    401970 <strcmp+0x40>
  40194d:	b8 01 00 00 00       	mov    eax,0x1
  401952:	eb 15                	jmp    401969 <strcmp+0x39>
  401954:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401958:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40195c:	48 83 c0 01          	add    rax,0x1
  401960:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401965:	38 ca                	cmp    dl,cl
  401967:	75 07                	jne    401970 <strcmp+0x40>
		{
			if(*s1 == 0)
  401969:	84 d2                	test   dl,dl
  40196b:	75 eb                	jne    401958 <strcmp+0x28>
		return 0;
  40196d:	31 c0                	xor    eax,eax
  40196f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  401970:	0f be c2             	movsx  eax,dl
  401973:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  401975:	c3                   	ret    
	int r = -1;
  401976:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40197b:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000401980 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  401980:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  401984:	48 89 fe             	mov    rsi,rdi
  401987:	40 f6 c7 07          	test   dil,0x7
  40198b:	75 0d                	jne    40199a <strlen+0x1a>
  40198d:	eb 21                	jmp    4019b0 <strlen+0x30>
  40198f:	90                   	nop
  401990:	48 83 c7 01          	add    rdi,0x1
  401994:	40 f6 c7 07          	test   dil,0x7
  401998:	74 16                	je     4019b0 <strlen+0x30>
	{
		if(*p == '\0')
  40199a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40199d:	75 f1                	jne    401990 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  40199f:	48 89 f8             	mov    rax,rdi
  4019a2:	48 29 f0             	sub    rax,rsi
  4019a5:	c3                   	ret    
  4019a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4019ad:	00 00 00 
		if((*lp - mask01) & mask80)
  4019b0:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  4019b7:	fe fe fe 
  4019ba:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  4019c1:	80 80 80 
  4019c4:	eb 38                	jmp    4019fe <strlen+0x7e>
  4019c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4019cd:	00 00 00 
			testbyte(1);
  4019d0:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  4019d4:	74 3a                	je     401a10 <strlen+0x90>
			testbyte(2);
  4019d6:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  4019da:	74 3c                	je     401a18 <strlen+0x98>
			testbyte(3);
  4019dc:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  4019e0:	74 3e                	je     401a20 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  4019e2:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  4019e6:	74 40                	je     401a28 <strlen+0xa8>
			testbyte(5);
  4019e8:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  4019ec:	74 42                	je     401a30 <strlen+0xb0>
			testbyte(6);
  4019ee:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  4019f2:	74 44                	je     401a38 <strlen+0xb8>
			testbyte(7);
  4019f4:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  4019f8:	74 46                	je     401a40 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  4019fa:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  4019fe:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401a01:	48 01 c8             	add    rax,rcx
  401a04:	48 85 d0             	test   rax,rdx
  401a07:	74 f1                	je     4019fa <strlen+0x7a>
			testbyte(0);
  401a09:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401a0c:	75 c2                	jne    4019d0 <strlen+0x50>
  401a0e:	eb 8f                	jmp    40199f <strlen+0x1f>
			testbyte(1);
  401a10:	48 29 f7             	sub    rdi,rsi
  401a13:	48 8d 47 01          	lea    rax,[rdi+0x1]
  401a17:	c3                   	ret    
			testbyte(2);
  401a18:	48 29 f7             	sub    rdi,rsi
  401a1b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  401a1f:	c3                   	ret    
			testbyte(3);
  401a20:	48 29 f7             	sub    rdi,rsi
  401a23:	48 8d 47 03          	lea    rax,[rdi+0x3]
  401a27:	c3                   	ret    
			testbyte(4);
  401a28:	48 29 f7             	sub    rdi,rsi
  401a2b:	48 8d 47 04          	lea    rax,[rdi+0x4]
  401a2f:	c3                   	ret    
			testbyte(5);
  401a30:	48 29 f7             	sub    rdi,rsi
  401a33:	48 8d 47 05          	lea    rax,[rdi+0x5]
  401a37:	c3                   	ret    
			testbyte(6);
  401a38:	48 29 f7             	sub    rdi,rsi
  401a3b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  401a3f:	c3                   	ret    
			testbyte(7);
  401a40:	48 29 f7             	sub    rdi,rsi
  401a43:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  401a47:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000401a50 <__libc_init_array>:
	return main(argc, argv, _environ);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  401a50:	f3 0f 1e fa          	endbr64 
  401a54:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401a56:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  401a5d:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401a5e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  401a65:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401a66:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401a69:	48 c1 fd 03          	sar    rbp,0x3
  401a6d:	74 16                	je     401a85 <__libc_init_array+0x35>
  401a6f:	31 db                	xor    ebx,ebx
  401a71:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  401a78:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401a7c:	48 83 c3 01          	add    rbx,0x1
  401a80:	48 39 dd             	cmp    rbp,rbx
  401a83:	75 f3                	jne    401a78 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  401a85:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  401a8c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401a93:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401a96:	48 c1 fd 03          	sar    rbp,0x3
  401a9a:	74 11                	je     401aad <__libc_init_array+0x5d>
  401a9c:	31 db                	xor    ebx,ebx
  401a9e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401aa0:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401aa4:	48 83 c3 01          	add    rbx,0x1
  401aa8:	48 39 dd             	cmp    rbp,rbx
  401aab:	75 f3                	jne    401aa0 <__libc_init_array+0x50>
	}
}
  401aad:	5b                   	pop    rbx
  401aae:	5d                   	pop    rbp
  401aaf:	41 5c                	pop    r12
  401ab1:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401ac0 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401ac0:	f3 0f 1e fa          	endbr64 
  401ac4:	55                   	push   rbp
  401ac5:	53                   	push   rbx
  401ac6:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  401aca:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401ad1:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  401ad8:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  401adb:	48 c1 fb 03          	sar    rbx,0x3
  401adf:	74 14                	je     401af5 <__libc_fini_array+0x35>
  401ae1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  401ae8:	48 83 eb 01          	sub    rbx,0x1
  401aec:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  401af0:	48 85 db             	test   rbx,rbx
  401af3:	75 f3                	jne    401ae8 <__libc_fini_array+0x28>
	}
}
  401af5:	48 83 c4 08          	add    rsp,0x8
  401af9:	5b                   	pop    rbx
  401afa:	5d                   	pop    rbp
  401afb:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000401b00 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  401b00:	f3 0f 1e fa          	endbr64 
  401b04:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  401b08:	48 c7 c7 46 5a 40 00 	mov    rdi,0x405a46
  401b0f:	48 c7 c2 10 5b 40 00 	mov    rdx,0x405b10
  401b16:	31 f6                	xor    esi,esi
  401b18:	48 29 fa             	sub    rdx,rdi
  401b1b:	e8 40 fd ff ff       	call   401860 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  401b20:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  401b24:	e9 27 ff ff ff       	jmp    401a50 <__libc_init_array>

Disassembly of section .text.entry:

0000000000401b30 <entry>:
{
  401b30:	f3 0f 1e fa          	endbr64 
  401b34:	41 55                	push   r13
  401b36:	49 89 f5             	mov    r13,rsi
  401b39:	41 54                	push   r12
  401b3b:	49 89 d4             	mov    r12,rdx
  401b3e:	55                   	push   rbp
  401b3f:	89 fd                	mov    ebp,edi
	CRTStartup();
  401b41:	e8 ba ff ff ff       	call   401b00 <CRTStartup>
	environ = _environ;
  401b46:	48 c7 c0 10 5b 40 00 	mov    rax,0x405b10
	__heap_base = sbrk(0);
  401b4d:	31 ff                	xor    edi,edi
	environ = _environ;
  401b4f:	4c 89 20             	mov    QWORD PTR [rax],r12
	__heap_base = sbrk(0);
  401b52:	31 c0                	xor    eax,eax
  401b54:	e8 d7 f6 ff ff       	call   401230 <sbrk>
  401b59:	48 c7 c2 90 5b 40 00 	mov    rdx,0x405b90
	return main(argc, argv, _environ);
  401b60:	4c 89 ee             	mov    rsi,r13
  401b63:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401b65:	89 02                	mov    DWORD PTR [rdx],eax
	return main(argc, argv, _environ);
  401b67:	4c 89 e2             	mov    rdx,r12
}
  401b6a:	5d                   	pop    rbp
  401b6b:	41 5c                	pop    r12
  401b6d:	41 5d                	pop    r13
	return main(argc, argv, _environ);
  401b6f:	e9 52 e5 ff ff       	jmp    4000c6 <main>

Disassembly of section .text.get_bit_access:

0000000000401b80 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401b80:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401b85:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401b90 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401b90:	e8 eb ff ff ff       	call   401b80 <get_bit_access>
  401b95:	48 c1 e8 3f          	shr    rax,0x3f
}
  401b99:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401ba0 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401ba0:	48 89 f8             	mov    rax,rdi
  401ba3:	48 c1 e8 34          	shr    rax,0x34
  401ba7:	25 ff 07 00 00       	and    eax,0x7ff
  401bac:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401bb1:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401bc0 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401bc0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401bc3:	8d 50 01             	lea    edx,[rax+0x1]
  401bc6:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401bc9:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  401bcc:	73 22                	jae    401bf0 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  401bce:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401bd1:	48 85 d2             	test   rdx,rdx
  401bd4:	74 12                	je     401be8 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401bd6:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  401bda:	40 0f be fe          	movsx  edi,sil
  401bde:	4c 89 c6             	mov    rsi,r8
  401be1:	ff e2                	jmp    rdx
  401be3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  401be8:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  401bec:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  401bf0:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000401c00 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401c00:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  401c04:	74 0a                	je     401c10 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  401c06:	c3                   	ret    
  401c07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401c0e:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401c10:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  401c13:	85 d2                	test   edx,edx
  401c15:	74 ef                	je     401c06 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  401c17:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  401c1b:	48 85 c9             	test   rcx,rcx
  401c1e:	74 e6                	je     401c06 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  401c20:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401c23:	8d 72 ff             	lea    esi,[rdx-0x1]
  401c26:	39 c2                	cmp    edx,eax
  401c28:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  401c2c:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  401c30:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401c40 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401c40:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401c47:	48 89 f8             	mov    rax,rdi
  return gadget;
  401c4a:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401c51:	00 
  401c52:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401c59:	00 
  401c5a:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401c61:	00 
}
  401c62:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401c70 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401c70:	48 83 ec 28          	sub    rsp,0x28
  401c74:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401c77:	48 89 e7             	mov    rdi,rsp
  401c7a:	e8 c1 ff ff ff       	call   401c40 <discarding_gadget>
  401c7f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401c84:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401c88:	48 85 f6             	test   rsi,rsi
  401c8b:	74 33                	je     401cc0 <buffer_gadget+0x50>
  401c8d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401c92:	48 39 c2             	cmp    rdx,rax
  401c95:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401c99:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401c9d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401ca2:	4c 89 c0             	mov    rax,r8
  return result;
  401ca5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401caa:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401cb0:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401cb4:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401cb9:	48 83 c4 28          	add    rsp,0x28
  401cbd:	c3                   	ret    
  401cbe:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401cc0:	48 89 ce             	mov    rsi,rcx
  401cc3:	eb d4                	jmp    401c99 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401cd0 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401cd0:	48 83 ec 28          	sub    rsp,0x28
  401cd4:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401cd7:	48 89 e7             	mov    rdi,rsp
  401cda:	e8 61 ff ff ff       	call   401c40 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401cdf:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401ce3:	4c 89 c0             	mov    rax,r8
  return result;
  401ce6:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401ceb:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401cf0:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401cf7:	7f 
  401cf8:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401cfe:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401d02:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401d07:	48 83 c4 28          	add    rsp,0x28
  401d0b:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401d10 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401d10:	48 83 ec 08          	sub    rsp,0x8
  401d14:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401d17:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 402500 <putchar_wrapper>
  401d1e:	31 d2                	xor    edx,edx
  401d20:	e8 ab ff ff ff       	call   401cd0 <function_gadget>
}
  401d25:	4c 89 c8             	mov    rax,r9
  401d28:	48 83 c4 08          	add    rsp,0x8
  401d2c:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401d30 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401d30:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401d33:	74 33                	je     401d68 <strnlen_s_+0x38>
  401d35:	85 f6                	test   esi,esi
  401d37:	74 2f                	je     401d68 <strnlen_s_+0x38>
  401d39:	89 f6                	mov    esi,esi
  401d3b:	48 89 f8             	mov    rax,rdi
  401d3e:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401d42:	eb 09                	jmp    401d4d <strnlen_s_+0x1d>
  401d44:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401d48:	48 39 c2             	cmp    rdx,rax
  401d4b:	74 13                	je     401d60 <strnlen_s_+0x30>
  401d4d:	48 83 c0 01          	add    rax,0x1
  401d51:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401d54:	75 f2                	jne    401d48 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401d56:	29 f8                	sub    eax,edi
  401d58:	c3                   	ret    
  401d59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401d60:	89 d0                	mov    eax,edx
  401d62:	29 f8                	sub    eax,edi
  401d64:	c3                   	ret    
  401d65:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401d68:	31 c0                	xor    eax,eax
}
  401d6a:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401d70 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401d70:	83 ef 30             	sub    edi,0x30
  401d73:	40 80 ff 09          	cmp    dil,0x9
  401d77:	0f 96 c0             	setbe  al
}
  401d7a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401d80 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401d80:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401d83:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401d86:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401d89:	eb 19                	jmp    401da4 <atou_+0x24>
  401d8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401d90:	48 83 c2 01          	add    rdx,0x1
  401d94:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401d98:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401d9b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401d9f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401da4:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401da7:	e8 c4 ff ff ff       	call   401d70 <is_digit_>
  401dac:	84 c0                	test   al,al
  401dae:	75 e0                	jne    401d90 <atou_+0x10>
  }
  return i;
}
  401db0:	44 89 c0             	mov    eax,r8d
  401db3:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401dc0 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401dc0:	41 57                	push   r15
  401dc2:	44 89 c0             	mov    eax,r8d
  401dc5:	49 89 ff             	mov    r15,rdi
  401dc8:	41 56                	push   r14
  401dca:	41 55                	push   r13
  401dcc:	41 89 d5             	mov    r13d,edx
  401dcf:	41 54                	push   r12
  401dd1:	49 89 f4             	mov    r12,rsi
  401dd4:	55                   	push   rbp
  401dd5:	89 cd                	mov    ebp,ecx
  401dd7:	53                   	push   rbx
  401dd8:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401ddc:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401de0:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401de5:	a8 03                	test   al,0x3
  401de7:	75 1b                	jne    401e04 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401de9:	39 ca                	cmp    edx,ecx
  401deb:	73 17                	jae    401e04 <out_rev_+0x44>
  401ded:	89 d3                	mov    ebx,edx
  401def:	90                   	nop
      putchar_via_gadget(output, ' ');
  401df0:	be 20 00 00 00       	mov    esi,0x20
  401df5:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401df8:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401dfb:	e8 c0 fd ff ff       	call   401bc0 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401e00:	39 dd                	cmp    ebp,ebx
  401e02:	75 ec                	jne    401df0 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401e04:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401e08:	4c 01 e3             	add    rbx,r12
  401e0b:	45 85 ed             	test   r13d,r13d
  401e0e:	74 17                	je     401e27 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401e10:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401e13:	4c 89 ff             	mov    rdi,r15
  401e16:	e8 a5 fd ff ff       	call   401bc0 <putchar_via_gadget>
  while (len) {
  401e1b:	48 89 da             	mov    rdx,rbx
  401e1e:	48 83 eb 01          	sub    rbx,0x1
  401e22:	49 39 d4             	cmp    r12,rdx
  401e25:	75 e9                	jne    401e10 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401e27:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401e2c:	74 2a                	je     401e58 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401e2e:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401e32:	44 29 f2             	sub    edx,r14d
  401e35:	39 d5                	cmp    ebp,edx
  401e37:	76 1f                	jbe    401e58 <out_rev_+0x98>
  401e39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401e40:	be 20 00 00 00       	mov    esi,0x20
  401e45:	4c 89 ff             	mov    rdi,r15
  401e48:	e8 73 fd ff ff       	call   401bc0 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401e4d:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401e51:	44 29 f2             	sub    edx,r14d
  401e54:	39 ea                	cmp    edx,ebp
  401e56:	72 e8                	jb     401e40 <out_rev_+0x80>
    }
  }
}
  401e58:	48 83 c4 18          	add    rsp,0x18
  401e5c:	5b                   	pop    rbx
  401e5d:	5d                   	pop    rbp
  401e5e:	41 5c                	pop    r12
  401e60:	41 5d                	pop    r13
  401e62:	41 5e                	pop    r14
  401e64:	41 5f                	pop    r15
  401e66:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401e70 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401e70:	55                   	push   rbp
  401e71:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e74:	83 fa 1f             	cmp    edx,0x1f
{
  401e77:	49 89 f3             	mov    r11,rsi
  401e7a:	53                   	push   rbx
  401e7b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401e80:	89 d6                	mov    esi,edx
  401e82:	89 cb                	mov    ebx,ecx
  401e84:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401e89:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401e8c:	41 f6 c0 02          	test   r8b,0x2
  401e90:	0f 85 fa 00 00 00    	jne    401f90 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401e96:	44 89 c2             	mov    edx,r8d
  401e99:	83 e2 01             	and    edx,0x1
  401e9c:	45 85 d2             	test   r10d,r10d
  401e9f:	0f 84 eb 00 00 00    	je     401f90 <print_integer_finalization+0x120>
  401ea5:	85 d2                	test   edx,edx
  401ea7:	0f 84 e3 00 00 00    	je     401f90 <print_integer_finalization+0x120>
  401ead:	84 c9                	test   cl,cl
  401eaf:	0f 85 cb 01 00 00    	jne    402080 <print_integer_finalization+0x210>
  401eb5:	41 f6 c0 0c          	test   r8b,0xc
  401eb9:	0f 85 c1 01 00 00    	jne    402080 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ebf:	44 39 d6             	cmp    esi,r10d
  401ec2:	0f 83 c8 00 00 00    	jae    401f90 <print_integer_finalization+0x120>
  401ec8:	84 c0                	test   al,al
  401eca:	0f 84 c0 00 00 00    	je     401f90 <print_integer_finalization+0x120>
  401ed0:	89 f0                	mov    eax,esi
  401ed2:	89 f2                	mov    edx,esi
  401ed4:	4c 01 d8             	add    rax,r11
  401ed7:	eb 0b                	jmp    401ee4 <print_integer_finalization+0x74>
  401ed9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401ee0:	84 c9                	test   cl,cl
  401ee2:	74 15                	je     401ef9 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401ee4:	83 c2 01             	add    edx,0x1
  401ee7:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401eea:	83 fa 1f             	cmp    edx,0x1f
  401eed:	0f 96 c1             	setbe  cl
  401ef0:	48 83 c0 01          	add    rax,0x1
  401ef4:	44 39 d2             	cmp    edx,r10d
  401ef7:	72 e7                	jb     401ee0 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401ef9:	44 39 ca             	cmp    edx,r9d
  401efc:	73 26                	jae    401f24 <print_integer_finalization+0xb4>
  401efe:	84 c9                	test   cl,cl
  401f00:	74 22                	je     401f24 <print_integer_finalization+0xb4>
  401f02:	89 d0                	mov    eax,edx
  401f04:	4c 01 d8             	add    rax,r11
  401f07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401f0e:	00 00 
      buf[len++] = '0';
  401f10:	83 c2 01             	add    edx,0x1
  401f13:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f16:	48 83 c0 01          	add    rax,0x1
  401f1a:	41 39 d1             	cmp    r9d,edx
  401f1d:	76 05                	jbe    401f24 <print_integer_finalization+0xb4>
  401f1f:	83 fa 1f             	cmp    edx,0x1f
  401f22:	76 ec                	jbe    401f10 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401f24:	39 d6                	cmp    esi,edx
  401f26:	0f 92 c0             	setb   al
  401f29:	40 80 fd 08          	cmp    bpl,0x8
  401f2d:	0f 94 c1             	sete   cl
  401f30:	20 c1                	and    cl,al
  401f32:	74 06                	je     401f3a <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  401f34:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  401f38:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  401f3a:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  401f41:	0f 84 8c 00 00 00    	je     401fd3 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401f47:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401f4e:	74 58                	je     401fa8 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f50:	83 fa 1f             	cmp    edx,0x1f
  401f53:	0f 96 c0             	setbe  al
  401f56:	40 80 fd 10          	cmp    bpl,0x10
  401f5a:	0f 84 30 01 00 00    	je     402090 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f60:	40 80 fd 02          	cmp    bpl,0x2
  401f64:	75 0e                	jne    401f74 <print_integer_finalization+0x104>
  401f66:	84 c0                	test   al,al
  401f68:	74 0a                	je     401f74 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  401f6a:	89 d0                	mov    eax,edx
  401f6c:	83 c2 01             	add    edx,0x1
  401f6f:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401f74:	83 fa 20             	cmp    edx,0x20
  401f77:	75 50                	jne    401fc9 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  401f79:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  401f7a:	44 89 d1             	mov    ecx,r10d
  401f7d:	4c 89 de             	mov    rsi,r11
}
  401f80:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401f81:	e9 3a fe ff ff       	jmp    401dc0 <out_rev_>
  401f86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401f8d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f90:	44 39 ce             	cmp    esi,r9d
  401f93:	89 f2                	mov    edx,esi
  401f95:	0f 92 c1             	setb   cl
  401f98:	20 c8                	and    al,cl
  401f9a:	0f 85 62 ff ff ff    	jne    401f02 <print_integer_finalization+0x92>
  401fa0:	eb 98                	jmp    401f3a <print_integer_finalization+0xca>
  401fa2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  401fa8:	85 d2                	test   edx,edx
  401faa:	75 74                	jne    402020 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fac:	40 80 fd 10          	cmp    bpl,0x10
  401fb0:	0f 84 05 01 00 00    	je     4020bb <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fb6:	40 80 fd 02          	cmp    bpl,0x2
  401fba:	0f 85 2e 01 00 00    	jne    4020ee <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  401fc0:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  401fc4:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  401fc9:	89 d0                	mov    eax,edx
  401fcb:	83 c2 01             	add    edx,0x1
  401fce:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  401fd3:	83 fa 20             	cmp    edx,0x20
  401fd6:	74 a1                	je     401f79 <print_integer_finalization+0x109>
    if (negative) {
  401fd8:	84 db                	test   bl,bl
  401fda:	74 1c                	je     401ff8 <print_integer_finalization+0x188>
      buf[len++] = '-';
  401fdc:	89 d0                	mov    eax,edx
}
  401fde:	5b                   	pop    rbx
      buf[len++] = '-';
  401fdf:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  401fe2:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  401fe5:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  401fea:	4c 89 de             	mov    rsi,r11
}
  401fed:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  401fee:	e9 cd fd ff ff       	jmp    401dc0 <out_rev_>
  401ff3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  401ff8:	41 f6 c0 04          	test   r8b,0x4
  401ffc:	75 62                	jne    402060 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  401ffe:	41 f6 c0 08          	test   r8b,0x8
  402002:	0f 84 71 ff ff ff    	je     401f79 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  402008:	89 d0                	mov    eax,edx
  40200a:	83 c2 01             	add    edx,0x1
  40200d:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  402012:	e9 62 ff ff ff       	jmp    401f79 <print_integer_finalization+0x109>
  402017:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40201e:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  402020:	41 39 d1             	cmp    r9d,edx
  402023:	74 09                	je     40202e <print_integer_finalization+0x1be>
  402025:	44 39 d2             	cmp    edx,r10d
  402028:	0f 85 22 ff ff ff    	jne    401f50 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  40202e:	84 c0                	test   al,al
  402030:	0f 85 99 00 00 00    	jne    4020cf <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  402036:	40 80 fd 10          	cmp    bpl,0x10
  40203a:	0f 94 c0             	sete   al
  40203d:	40 80 fd 02          	cmp    bpl,0x2
  402041:	0f 94 c1             	sete   cl
  402044:	08 c8                	or     al,cl
  402046:	0f 84 04 ff ff ff    	je     401f50 <print_integer_finalization+0xe0>
  40204c:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  40204e:	83 da 00             	sbb    edx,0x0
  402051:	e9 fa fe ff ff       	jmp    401f50 <print_integer_finalization+0xe0>
  402056:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40205d:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  402060:	89 d0                	mov    eax,edx
}
  402062:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  402063:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  402066:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  402069:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  40206e:	4c 89 de             	mov    rsi,r11
}
  402071:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  402072:	e9 49 fd ff ff       	jmp    401dc0 <out_rev_>
  402077:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40207e:	00 00 
        width--;
  402080:	41 83 ea 01          	sub    r10d,0x1
  402084:	e9 36 fe ff ff       	jmp    401ebf <print_integer_finalization+0x4f>
  402089:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402090:	44 89 c1             	mov    ecx,r8d
  402093:	83 e1 20             	and    ecx,0x20
  402096:	75 0c                	jne    4020a4 <print_integer_finalization+0x234>
  402098:	84 c0                	test   al,al
  40209a:	75 60                	jne    4020fc <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40209c:	85 c9                	test   ecx,ecx
  40209e:	0f 84 d0 fe ff ff    	je     401f74 <print_integer_finalization+0x104>
  4020a4:	84 c0                	test   al,al
  4020a6:	0f 84 c8 fe ff ff    	je     401f74 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  4020ac:	89 d0                	mov    eax,edx
  4020ae:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  4020b1:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  4020b6:	e9 b9 fe ff ff       	jmp    401f74 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4020bb:	41 f6 c0 20          	test   r8b,0x20
  4020bf:	75 1f                	jne    4020e0 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  4020c1:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  4020c5:	ba 01 00 00 00       	mov    edx,0x1
  4020ca:	e9 fa fe ff ff       	jmp    401fc9 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  4020cf:	83 ea 01             	sub    edx,0x1
  4020d2:	0f 84 d4 fe ff ff    	je     401fac <print_integer_finalization+0x13c>
  4020d8:	e9 59 ff ff ff       	jmp    402036 <print_integer_finalization+0x1c6>
  4020dd:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  4020e0:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  4020e4:	ba 01 00 00 00       	mov    edx,0x1
  4020e9:	e9 db fe ff ff       	jmp    401fc9 <print_integer_finalization+0x159>
      buf[len++] = '0';
  4020ee:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  4020f2:	ba 01 00 00 00       	mov    edx,0x1
  4020f7:	e9 dc fe ff ff       	jmp    401fd8 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  4020fc:	89 d0                	mov    eax,edx
  4020fe:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  402101:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  402106:	e9 69 fe ff ff       	jmp    401f74 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000402110 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  402110:	41 57                	push   r15
  402112:	41 56                	push   r14
  402114:	41 55                	push   r13
  402116:	41 89 cd             	mov    r13d,ecx
  402119:	41 54                	push   r12
  40211b:	49 89 fc             	mov    r12,rdi
  40211e:	55                   	push   rbp
  40211f:	53                   	push   rbx
  402120:	89 d3                	mov    ebx,edx
  402122:	48 83 ec 28          	sub    rsp,0x28
  402126:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  40212b:	48 85 f6             	test   rsi,rsi
  40212e:	75 48                	jne    402178 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  402130:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  402137:	0f 85 a3 00 00 00    	jne    4021e0 <print_integer+0xd0>
      buf[len++] = '0';
  40213d:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  402141:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  402145:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  40214a:	48 89 e6             	mov    rsi,rsp
  40214d:	41 56                	push   r14
  40214f:	0f b6 cb             	movzx  ecx,bl
  402152:	4c 89 e7             	mov    rdi,r12
  402155:	41 51                	push   r9
  402157:	45 89 c1             	mov    r9d,r8d
  40215a:	45 0f b6 c5          	movzx  r8d,r13b
  40215e:	e8 0d fd ff ff       	call   401e70 <print_integer_finalization>
}
  402163:	48 83 c4 38          	add    rsp,0x38
  402167:	5b                   	pop    rbx
  402168:	5d                   	pop    rbp
  402169:	41 5c                	pop    r12
  40216b:	41 5d                	pop    r13
  40216d:	41 5e                	pop    r14
  40216f:	41 5f                	pop    r15
  402171:	c3                   	ret    
  402172:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  402178:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  40217b:	44 0f b6 d1          	movzx  r10d,cl
  40217f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  402184:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  402189:	83 e0 20             	and    eax,0x20
  40218c:	83 f8 01             	cmp    eax,0x1
  40218f:	45 19 db             	sbb    r11d,r11d
  402192:	41 83 e3 20          	and    r11d,0x20
  402196:	41 83 c3 37          	add    r11d,0x37
  40219a:	eb 07                	jmp    4021a3 <print_integer+0x93>
  40219c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  4021a0:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  4021a3:	31 d2                	xor    edx,edx
  4021a5:	48 89 f0             	mov    rax,rsi
  4021a8:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  4021ab:	48 83 fa 09          	cmp    rdx,0x9
  4021af:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  4021b3:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  4021b7:	89 ca                	mov    edx,ecx
  4021b9:	41 0f 46 ff          	cmovbe edi,r15d
  4021bd:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  4021c2:	48 83 c1 01          	add    rcx,0x1
  4021c6:	4c 39 d6             	cmp    rsi,r10
  4021c9:	0f 82 7b ff ff ff    	jb     40214a <print_integer+0x3a>
  4021cf:	83 fa 1f             	cmp    edx,0x1f
  4021d2:	76 cc                	jbe    4021a0 <print_integer+0x90>
  4021d4:	e9 71 ff ff ff       	jmp    40214a <print_integer+0x3a>
  4021d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  4021e0:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  4021e3:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  4021e5:	41 83 e6 ef          	and    r14d,0xffffffef
  4021e9:	80 f9 10             	cmp    cl,0x10
  4021ec:	44 0f 45 f0          	cmovne r14d,eax
  4021f0:	e9 55 ff ff ff       	jmp    40214a <print_integer+0x3a>

Disassembly of section .text.get_components:

0000000000402200 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  402200:	e8 8b f9 ff ff       	call   401b90 <get_sign_bit>
{
  402205:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  402208:	85 c0                	test   eax,eax
  40220a:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  40220d:	74 08                	je     402217 <get_components+0x17>
  40220f:	66 0f 57 05 19 35 00 	xorpd  xmm0,XMMWORD PTR [rip+0x3519]        # 405730 <powers_of_10+0x90>
  402216:	00 
  number_.integral = (int_fast64_t)abs_number;
  402217:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40221c:	66 0f ef d2          	pxor   xmm2,xmm2
  402220:	66 0f 28 c8          	movapd xmm1,xmm0
  402224:	89 f0                	mov    eax,esi
  402226:	48 8d 3d 73 34 00 00 	lea    rdi,[rip+0x3473]        # 4056a0 <powers_of_10>
  40222d:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  402232:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  402237:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  40223b:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40223f:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  402243:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  402248:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  40224d:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  402251:	f2 0f 10 15 e7 34 00 	movsd  xmm2,QWORD PTR [rip+0x34e7]        # 405740 <powers_of_10+0xa0>
  402258:	00 
  402259:	66 0f 2f ca          	comisd xmm1,xmm2
  40225d:	76 51                	jbe    4022b0 <get_components+0xb0>
    ++number_.fractional;
  40225f:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  402263:	66 0f ef c9          	pxor   xmm1,xmm1
  402267:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  40226c:	66 0f 2f cb          	comisd xmm1,xmm3
  402270:	73 56                	jae    4022c8 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  402272:	85 f6                	test   esi,esi
  402274:	75 27                	jne    40229d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  402276:	66 0f ef c9          	pxor   xmm1,xmm1
  40227a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40227f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  402283:	66 0f 2f d0          	comisd xmm2,xmm0
  402287:	76 06                	jbe    40228f <get_components+0x8f>
  402289:	66 0f 2f c2          	comisd xmm0,xmm2
  40228d:	76 0e                	jbe    40229d <get_components+0x9d>
  40228f:	48 89 d6             	mov    rsi,rdx
  402292:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  402295:	48 83 fe 01          	cmp    rsi,0x1
  402299:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40229d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  4022a1:	4c 89 c0             	mov    rax,r8
  return number_;
  4022a4:	49 89 10             	mov    QWORD PTR [r8],rdx
  4022a7:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  4022ab:	c3                   	ret    
  4022ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  4022b0:	66 0f 2e ca          	ucomisd xmm1,xmm2
  4022b4:	7a bc                	jp     402272 <get_components+0x72>
  4022b6:	75 ba                	jne    402272 <get_components+0x72>
  4022b8:	48 85 c0             	test   rax,rax
  4022bb:	75 13                	jne    4022d0 <get_components+0xd0>
    ++number_.fractional;
  4022bd:	48 83 c0 01          	add    rax,0x1
  4022c1:	eb af                	jmp    402272 <get_components+0x72>
  4022c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  4022c8:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  4022cc:	31 c0                	xor    eax,eax
  4022ce:	eb a2                	jmp    402272 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  4022d0:	a8 01                	test   al,0x1
  4022d2:	74 9e                	je     402272 <get_components+0x72>
  4022d4:	eb e7                	jmp    4022bd <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

00000000004022e0 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  4022e0:	66 0f 2f 05 50 34 00 	comisd xmm0,QWORD PTR [rip+0x3450]        # 405738 <powers_of_10+0x98>
  4022e7:	00 
  4022e8:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  4022ec:	73 10                	jae    4022fe <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  4022ee:	66 0f ef c9          	pxor   xmm1,xmm1
  4022f2:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4022f6:	66 0f 2e c8          	ucomisd xmm1,xmm0
  4022fa:	7a 04                	jp     402300 <bastardized_floor+0x20>
  4022fc:	75 02                	jne    402300 <bastardized_floor+0x20>
}
  4022fe:	c3                   	ret    
  4022ff:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  402300:	83 e8 01             	sub    eax,0x1
}
  402303:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

0000000000402310 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  402310:	e8 6b f8 ff ff       	call   401b80 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  402315:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  40231c:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  40231f:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  402322:	48 89 c7             	mov    rdi,rax
  402325:	e8 76 f8 ff ff       	call   401ba0 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40232a:	48 21 ca             	and    rdx,rcx
  40232d:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  402334:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  402337:	f2 0f 10 1d 21 34 00 	movsd  xmm3,QWORD PTR [rip+0x3421]        # 405760 <powers_of_10+0xc0>
  40233e:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40233f:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402342:	f2 0f 10 05 06 34 00 	movsd  xmm0,QWORD PTR [rip+0x3406]        # 405750 <powers_of_10+0xb0>
  402349:	00 
  double z = (dwba.F - 1.5);
  40234a:	66 48 0f 6e ca       	movq   xmm1,rdx
  40234f:	f2 0f 5c 0d f1 33 00 	subsd  xmm1,QWORD PTR [rip+0x33f1]        # 405748 <powers_of_10+0xa8>
  402356:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402357:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40235b:	66 0f 28 d1          	movapd xmm2,xmm1
  40235f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402363:	f2 0f 58 05 ed 33 00 	addsd  xmm0,QWORD PTR [rip+0x33ed]        # 405758 <powers_of_10+0xb8>
  40236a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40236b:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40236f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402373:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  402377:	f2 0f 59 15 e9 33 00 	mulsd  xmm2,QWORD PTR [rip+0x33e9]        # 405768 <powers_of_10+0xc8>
  40237e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40237f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402383:	f2 0f 59 0d e5 33 00 	mulsd  xmm1,QWORD PTR [rip+0x33e5]        # 405770 <powers_of_10+0xd0>
  40238a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40238b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40238f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402393:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  402397:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

00000000004023a0 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  4023a0:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  4023a6:	0f 84 b4 00 00 00    	je     402460 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  4023ac:	66 0f ef d2          	pxor   xmm2,xmm2
  4023b0:	f2 0f 10 05 c8 33 00 	movsd  xmm0,QWORD PTR [rip+0x33c8]        # 405780 <powers_of_10+0xe0>
  4023b7:	00 
  4023b8:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  4023bc:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  4023c0:	f2 0f 58 05 78 33 00 	addsd  xmm0,QWORD PTR [rip+0x3378]        # 405740 <powers_of_10+0xa0>
  4023c7:	00 
  4023c8:	e8 13 ff ff ff       	call   4022e0 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4023cd:	f2 0f 10 0d b3 33 00 	movsd  xmm1,QWORD PTR [rip+0x33b3]        # 405788 <powers_of_10+0xe8>
  4023d4:	00 
  4023d5:	66 0f ef c0          	pxor   xmm0,xmm0
  4023d9:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  4023dd:	f2 0f 59 05 ab 33 00 	mulsd  xmm0,QWORD PTR [rip+0x33ab]        # 405790 <powers_of_10+0xf0>
  4023e4:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4023e5:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4023e7:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4023eb:	48 05 ff 03 00 00    	add    rax,0x3ff
  4023f1:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4023f5:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4023fa:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  4023fe:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  402402:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  402406:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  40240a:	f2 0f 58 c1          	addsd  xmm0,xmm1
  40240e:	66 0f 28 e2          	movapd xmm4,xmm2
  402412:	f2 0f 5e 25 7e 33 00 	divsd  xmm4,QWORD PTR [rip+0x337e]        # 405798 <powers_of_10+0xf8>
  402419:	00 
  40241a:	66 0f 28 da          	movapd xmm3,xmm2
  40241e:	f2 0f 58 25 7a 33 00 	addsd  xmm4,QWORD PTR [rip+0x337a]        # 4057a0 <powers_of_10+0x100>
  402425:	00 
  402426:	f2 0f 5e dc          	divsd  xmm3,xmm4
  40242a:	f2 0f 58 1d 76 33 00 	addsd  xmm3,QWORD PTR [rip+0x3376]        # 4057a8 <powers_of_10+0x108>
  402431:	00 
  402432:	f2 0f 5e d3          	divsd  xmm2,xmm3
  402436:	f2 0f 10 1d 72 33 00 	movsd  xmm3,QWORD PTR [rip+0x3372]        # 4057b0 <powers_of_10+0x110>
  40243d:	00 
  40243e:	f2 0f 5c d9          	subsd  xmm3,xmm1
  402442:	f2 0f 58 d3          	addsd  xmm2,xmm3
  402446:	f2 0f 5e c2          	divsd  xmm0,xmm2
  40244a:	f2 0f 58 05 66 33 00 	addsd  xmm0,QWORD PTR [rip+0x3366]        # 4057b8 <powers_of_10+0x118>
  402451:	00 
  402452:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  402456:	c3                   	ret    
  402457:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40245e:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  402460:	f2 0f 10 05 10 33 00 	movsd  xmm0,QWORD PTR [rip+0x3310]        # 405778 <powers_of_10+0xd8>
  402467:	00 
}
  402468:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000402470 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  402470:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  402473:	48 8d 0d 26 30 00 00 	lea    rcx,[rip+0x3026]        # 4054a0 <memcpy+0xdb0>
  40247a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402480:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  402483:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  402486:	83 e8 20             	sub    eax,0x20
  402489:	3c 10                	cmp    al,0x10
  40248b:	77 13                	ja     4024a0 <parse_flags+0x30>
  40248d:	0f b6 c0             	movzx  eax,al
  402490:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402494:	48 01 c8             	add    rax,rcx
  402497:	3e ff e0             	notrack jmp rax
  40249a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  4024a0:	44 89 c0             	mov    eax,r8d
  4024a3:	c3                   	ret    
  4024a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  4024a8:	41 83 c8 01          	or     r8d,0x1
  4024ac:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4024b0:	48 89 17             	mov    QWORD PTR [rdi],rdx
  4024b3:	eb cb                	jmp    402480 <parse_flags+0x10>
  4024b5:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  4024b8:	41 83 c8 02          	or     r8d,0x2
  4024bc:	48 83 c2 01          	add    rdx,0x1
  4024c0:	eb ee                	jmp    4024b0 <parse_flags+0x40>
  4024c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4024c8:	41 83 c8 04          	or     r8d,0x4
  4024cc:	48 83 c2 01          	add    rdx,0x1
  4024d0:	eb de                	jmp    4024b0 <parse_flags+0x40>
  4024d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  4024d8:	41 83 c8 10          	or     r8d,0x10
  4024dc:	48 83 c2 01          	add    rdx,0x1
  4024e0:	eb ce                	jmp    4024b0 <parse_flags+0x40>
  4024e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  4024e8:	41 83 c8 08          	or     r8d,0x8
  4024ec:	48 83 c2 01          	add    rdx,0x1
  4024f0:	eb be                	jmp    4024b0 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

0000000000402500 <putchar_wrapper>:
{
  402500:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  402504:	40 0f be ff          	movsx  edi,dil
  402508:	e9 e3 18 00 00       	jmp    403df0 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000402510 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  402510:	41 56                	push   r14
  402512:	49 89 ca             	mov    r10,rcx
  402515:	41 89 d3             	mov    r11d,edx
  402518:	41 55                	push   r13
  40251a:	45 89 c5             	mov    r13d,r8d
  40251d:	41 54                	push   r12
  40251f:	55                   	push   rbp
  402520:	53                   	push   rbx
  402521:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  402526:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40252b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  40252f:	45 85 ed             	test   r13d,r13d
  402532:	0f 84 90 00 00 00    	je     4025c8 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402538:	44 89 c0             	mov    eax,r8d
  40253b:	25 10 10 00 00       	and    eax,0x1010
  402540:	3d 00 10 00 00       	cmp    eax,0x1000
  402545:	0f 84 05 02 00 00    	je     402750 <print_broken_up_decimal.isra.0+0x240>
  40254b:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  40254e:	89 cb                	mov    ebx,ecx
  402550:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402555:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40255c:	66 66 66 
  40255f:	49 01 ec             	add    r12,rbp
  402562:	eb 43                	jmp    4025a7 <print_broken_up_decimal.isra.0+0x97>
  402564:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402568:	48 89 f0             	mov    rax,rsi
  40256b:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  40256e:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402572:	49 f7 ed             	imul   r13
  402575:	48 89 f0             	mov    rax,rsi
  402578:	41 29 de             	sub    r14d,ebx
  40257b:	83 c3 01             	add    ebx,0x1
  40257e:	48 c1 f8 3f          	sar    rax,0x3f
  402582:	48 c1 fa 02          	sar    rdx,0x2
  402586:	48 29 c2             	sub    rdx,rax
  402589:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40258d:	48 01 c0             	add    rax,rax
  402590:	48 29 c6             	sub    rsi,rax
  402593:	83 c6 30             	add    esi,0x30
  402596:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40259b:	48 89 d6             	mov    rsi,rdx
  40259e:	48 85 d2             	test   rdx,rdx
  4025a1:	0f 84 f9 00 00 00    	je     4026a0 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4025a7:	83 fb 20             	cmp    ebx,0x20
  4025aa:	75 bc                	jne    402568 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  4025ac:	44 89 c0             	mov    eax,r8d
  4025af:	83 e0 03             	and    eax,0x3
  4025b2:	83 f8 01             	cmp    eax,0x1
  4025b5:	0f 84 35 01 00 00    	je     4026f0 <print_broken_up_decimal.isra.0+0x1e0>
  4025bb:	ba 20 00 00 00       	mov    edx,0x20
  4025c0:	e9 7d 00 00 00       	jmp    402642 <print_broken_up_decimal.isra.0+0x132>
  4025c5:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4025c8:	41 f6 c0 10          	test   r8b,0x10
  4025cc:	0f 85 8e 00 00 00    	jne    402660 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4025d2:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  4025d9:	66 66 66 
  4025dc:	89 ce                	mov    esi,ecx
  4025de:	48 01 ee             	add    rsi,rbp
  4025e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4025e8:	83 f9 20             	cmp    ecx,0x20
  4025eb:	74 bf                	je     4025ac <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4025ed:	48 89 f8             	mov    rax,rdi
  4025f0:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  4025f3:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  4025f7:	48 f7 eb             	imul   rbx
  4025fa:	48 89 f8             	mov    rax,rdi
  4025fd:	48 c1 f8 3f          	sar    rax,0x3f
  402601:	48 c1 fa 02          	sar    rdx,0x2
  402605:	48 29 c2             	sub    rdx,rax
  402608:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40260c:	48 01 c0             	add    rax,rax
  40260f:	48 29 c7             	sub    rdi,rax
  402612:	83 c7 30             	add    edi,0x30
  402615:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  402619:	48 89 d7             	mov    rdi,rdx
  40261c:	48 85 d2             	test   rdx,rdx
  40261f:	75 c7                	jne    4025e8 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  402621:	44 89 c0             	mov    eax,r8d
  402624:	83 e0 03             	and    eax,0x3
  402627:	83 f8 01             	cmp    eax,0x1
  40262a:	0f 84 b8 01 00 00    	je     4027e8 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402630:	83 f9 20             	cmp    ecx,0x20
  402633:	74 86                	je     4025bb <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  402635:	45 84 db             	test   r11b,r11b
  402638:	74 46                	je     402680 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  40263a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  40263f:	8d 51 01             	lea    edx,[rcx+0x1]
}
  402642:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  402643:	48 89 ee             	mov    rsi,rbp
  402646:	44 89 c9             	mov    ecx,r9d
}
  402649:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40264a:	4c 89 d7             	mov    rdi,r10
}
  40264d:	41 5c                	pop    r12
  40264f:	41 5d                	pop    r13
  402651:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  402653:	e9 68 f7 ff ff       	jmp    401dc0 <out_rev_>
  402658:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40265f:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402660:	83 f9 20             	cmp    ecx,0x20
  402663:	0f 84 43 ff ff ff    	je     4025ac <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  402669:	89 c8                	mov    eax,ecx
  40266b:	83 c1 01             	add    ecx,0x1
  40266e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  402673:	e9 5a ff ff ff       	jmp    4025d2 <print_broken_up_decimal.isra.0+0xc2>
  402678:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40267f:	00 
    else if (flags & FLAGS_PLUS) {
  402680:	41 f6 c0 04          	test   r8b,0x4
  402684:	0f 85 3e 01 00 00    	jne    4027c8 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40268a:	89 ca                	mov    edx,ecx
  40268c:	41 f6 c0 08          	test   r8b,0x8
  402690:	74 b0                	je     402642 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  402692:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  402697:	83 c2 01             	add    edx,0x1
  40269a:	eb a6                	jmp    402642 <print_broken_up_decimal.isra.0+0x132>
  40269c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4026a0:	83 fb 1f             	cmp    ebx,0x1f
  4026a3:	77 13                	ja     4026b8 <print_broken_up_decimal.isra.0+0x1a8>
  4026a5:	45 85 f6             	test   r14d,r14d
  4026a8:	89 d8                	mov    eax,ebx
  4026aa:	0f 95 c2             	setne  dl
  4026ad:	48 01 e8             	add    rax,rbp
  4026b0:	84 d2                	test   dl,dl
  4026b2:	75 20                	jne    4026d4 <print_broken_up_decimal.isra.0+0x1c4>
  4026b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4026b8:	83 fb 20             	cmp    ebx,0x20
  4026bb:	0f 84 eb fe ff ff    	je     4025ac <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  4026c1:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  4026c6:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4026c9:	e9 04 ff ff ff       	jmp    4025d2 <print_broken_up_decimal.isra.0+0xc2>
  4026ce:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4026d0:	39 ca                	cmp    edx,ecx
  4026d2:	74 e4                	je     4026b8 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  4026d4:	89 da                	mov    edx,ebx
  4026d6:	83 c3 01             	add    ebx,0x1
  4026d9:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4026dc:	48 83 c0 01          	add    rax,0x1
  4026e0:	83 fb 1f             	cmp    ebx,0x1f
  4026e3:	76 eb                	jbe    4026d0 <print_broken_up_decimal.isra.0+0x1c0>
  4026e5:	eb d1                	jmp    4026b8 <print_broken_up_decimal.isra.0+0x1a8>
  4026e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4026ee:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4026f0:	45 85 c9             	test   r9d,r9d
  4026f3:	0f 84 c2 fe ff ff    	je     4025bb <print_broken_up_decimal.isra.0+0xab>
  4026f9:	31 d2                	xor    edx,edx
  4026fb:	b9 20 00 00 00       	mov    ecx,0x20
  402700:	45 84 db             	test   r11b,r11b
  402703:	0f 85 cf 00 00 00    	jne    4027d8 <print_broken_up_decimal.isra.0+0x2c8>
  402709:	41 f6 c0 0c          	test   r8b,0xc
  40270d:	0f 85 c5 00 00 00    	jne    4027d8 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402713:	44 39 c9             	cmp    ecx,r9d
  402716:	0f 83 14 ff ff ff    	jae    402630 <print_broken_up_decimal.isra.0+0x120>
  40271c:	89 c8                	mov    eax,ecx
  40271e:	48 01 e8             	add    rax,rbp
  402721:	84 d2                	test   dl,dl
  402723:	0f 84 07 ff ff ff    	je     402630 <print_broken_up_decimal.isra.0+0x120>
  402729:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  402730:	83 c1 01             	add    ecx,0x1
  402733:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402736:	48 83 c0 01          	add    rax,0x1
  40273a:	44 39 c9             	cmp    ecx,r9d
  40273d:	0f 83 ed fe ff ff    	jae    402630 <print_broken_up_decimal.isra.0+0x120>
  402743:	83 f9 1f             	cmp    ecx,0x1f
  402746:	76 e8                	jbe    402730 <print_broken_up_decimal.isra.0+0x220>
  402748:	e9 e3 fe ff ff       	jmp    402630 <print_broken_up_decimal.isra.0+0x120>
  40274d:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402750:	48 85 f6             	test   rsi,rsi
  402753:	0f 8e 79 fe ff ff    	jle    4025d2 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  402759:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  402760:	cc cc cc 
  402763:	48 89 f0             	mov    rax,rsi
  402766:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  40276d:	99 99 19 
  402770:	48 0f af c3          	imul   rax,rbx
  402774:	48 01 d0             	add    rax,rdx
  402777:	48 d1 c8             	ror    rax,1
  40277a:	48 39 d0             	cmp    rax,rdx
  40277d:	0f 87 c8 fd ff ff    	ja     40254b <print_broken_up_decimal.isra.0+0x3b>
  402783:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  40278a:	99 99 19 
  40278d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  402790:	48 89 f0             	mov    rax,rsi
  402793:	49 89 f4             	mov    r12,rsi
        --count;
  402796:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  40279a:	48 f7 e3             	mul    rbx
  40279d:	48 89 d6             	mov    rsi,rdx
  4027a0:	48 c1 ee 03          	shr    rsi,0x3
  4027a4:	48 89 f0             	mov    rax,rsi
  4027a7:	48 0f af c3          	imul   rax,rbx
  4027ab:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  4027ae:	4c 39 f0             	cmp    rax,r14
  4027b1:	76 dd                	jbe    402790 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  4027b3:	49 83 fc 09          	cmp    r12,0x9
  4027b7:	0f 8f 8e fd ff ff    	jg     40254b <print_broken_up_decimal.isra.0+0x3b>
  4027bd:	e9 10 fe ff ff       	jmp    4025d2 <print_broken_up_decimal.isra.0+0xc2>
  4027c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  4027c8:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  4027cd:	8d 51 01             	lea    edx,[rcx+0x1]
  4027d0:	e9 6d fe ff ff       	jmp    402642 <print_broken_up_decimal.isra.0+0x132>
  4027d5:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  4027d8:	41 83 e9 01          	sub    r9d,0x1
  4027dc:	e9 32 ff ff ff       	jmp    402713 <print_broken_up_decimal.isra.0+0x203>
  4027e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4027e8:	45 85 c9             	test   r9d,r9d
  4027eb:	0f 84 3f fe ff ff    	je     402630 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4027f1:	83 f9 1f             	cmp    ecx,0x1f
  4027f4:	0f 96 c2             	setbe  dl
  4027f7:	e9 04 ff ff ff       	jmp    402700 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

0000000000402800 <print_decimal_number>:
{
  402800:	41 54                	push   r12
  402802:	49 89 fb             	mov    r11,rdi
  402805:	41 89 f2             	mov    r10d,esi
  402808:	4d 89 c4             	mov    r12,r8
  40280b:	55                   	push   rbp
  40280c:	89 cd                	mov    ebp,ecx
  40280e:	53                   	push   rbx
  40280f:	89 d3                	mov    ebx,edx
  402811:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  402815:	48 89 e7             	mov    rdi,rsp
  402818:	e8 e3 f9 ff ff       	call   402200 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  40281d:	48 83 ec 08          	sub    rsp,0x8
  402821:	45 89 d0             	mov    r8d,r10d
  402824:	4c 89 d9             	mov    rcx,r11
  402827:	41 51                	push   r9
  402829:	41 89 d9             	mov    r9d,ebx
  40282c:	41 54                	push   r12
  40282e:	55                   	push   rbp
  40282f:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  402834:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  402839:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  40283e:	e8 cd fc ff ff       	call   402510 <print_broken_up_decimal.isra.0>
}
  402843:	48 83 c4 40          	add    rsp,0x40
  402847:	5b                   	pop    rbx
  402848:	5d                   	pop    rbp
  402849:	41 5c                	pop    r12
  40284b:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000402850 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402850:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  402854:	40 84 ff             	test   dil,dil
  402857:	74 17                	je     402870 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402859:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  40285d:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402862:	31 c0                	xor    eax,eax
  402864:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402866:	66 0f 28 c1          	movapd xmm0,xmm1
}
  40286a:	c3                   	ret    
  40286b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402870:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  402874:	e8 07 f3 ff ff       	call   401b80 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402879:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  40287d:	48 89 c7             	mov    rdi,rax
  402880:	e8 1b f3 ff ff       	call   401ba0 <get_exp2>
  402885:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402887:	e8 f4 f2 ff ff       	call   401b80 <get_bit_access>
  40288c:	48 89 c7             	mov    rdi,rax
  40288f:	e8 0c f3 ff ff       	call   401ba0 <get_exp2>
  402894:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  402897:	89 d0                	mov    eax,edx
  402899:	f7 d8                	neg    eax
  40289b:	0f 49 d0             	cmovns edx,eax
  40289e:	44 89 c0             	mov    eax,r8d
  4028a1:	f7 d8                	neg    eax
  4028a3:	41 0f 48 c0          	cmovs  eax,r8d
  4028a7:	39 c2                	cmp    edx,eax
  4028a9:	7f 1d                	jg     4028c8 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4028ab:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  4028af:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  4028b4:	31 c0                	xor    eax,eax
}
  4028b6:	48 83 c4 08          	add    rsp,0x8
  return result;
  4028ba:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4028bc:	66 0f 28 c1          	movapd xmm0,xmm1
}
  4028c0:	c3                   	ret    
  4028c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4028c8:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  4028cc:	31 d2                	xor    edx,edx
  return result;
  4028ce:	31 c0                	xor    eax,eax
}
  4028d0:	48 83 c4 08          	add    rsp,0x8
  return result;
  4028d4:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4028d6:	66 0f 28 c2          	movapd xmm0,xmm2
}
  4028da:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

00000000004028e0 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  4028e0:	40 84 ff             	test   dil,dil
  4028e3:	74 0b                	je     4028f0 <unapply_scaling.isra.0+0x10>
  4028e5:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4028e9:	c3                   	ret    
  4028ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4028f0:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  4028f4:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

0000000000402900 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  402900:	40 84 ff             	test   dil,dil
  402903:	74 0b                	je     402910 <apply_scaling.isra.0+0x10>
  402905:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  402909:	c3                   	ret    
  40290a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402910:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  402914:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000402920 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402920:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402922:	48 83 ec 08          	sub    rsp,0x8
  402926:	49 89 f9             	mov    r9,rdi
  402929:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  40292b:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  40292e:	66 0f 28 d0          	movapd xmm2,xmm0
  402932:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  402935:	e8 c6 ff ff ff       	call   402900 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  40293a:	3d 32 01 00 00       	cmp    eax,0x132
  40293f:	0f 8f ab 00 00 00    	jg     4029f0 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  402945:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40294a:	66 0f ef c0          	pxor   xmm0,xmm0
  40294e:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  402952:	89 d6                	mov    esi,edx
  402954:	48 8d 05 45 2d 00 00 	lea    rax,[rip+0x2d45]        # 4056a0 <powers_of_10>
  40295b:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40295f:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  402964:	e8 77 ff ff ff       	call   4028e0 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  402969:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  40296e:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  402972:	66 0f 28 c3          	movapd xmm0,xmm3
  402976:	66 0f 28 cc          	movapd xmm1,xmm4
  40297a:	e8 d1 fe ff ff       	call   402850 <update_normalization.isra.0>
  40297f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402983:	89 c7                	mov    edi,eax
  402985:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  402989:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  40298b:	e8 70 ff ff ff       	call   402900 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402990:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  402994:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402999:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40299e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  4029a2:	66 0f 2f 05 96 2d 00 	comisd xmm0,QWORD PTR [rip+0x2d96]        # 405740 <powers_of_10+0xa0>
  4029a9:	00 
  4029aa:	0f 93 c0             	setae  al
  4029ad:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  4029b0:	66 0f 2e 05 88 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2d88]        # 405740 <powers_of_10+0xa0>
  4029b7:	00 
  4029b8:	7a 06                	jp     4029c0 <get_normalized_components.isra.0+0xa0>
  4029ba:	75 04                	jne    4029c0 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  4029bc:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  4029c0:	66 0f ef c0          	pxor   xmm0,xmm0
  4029c4:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  4029c9:	66 0f 2f c4          	comisd xmm0,xmm4
  4029cd:	73 19                	jae    4029e8 <get_normalized_components.isra.0+0xc8>
  return components;
  4029cf:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  4029d3:	4c 89 c8             	mov    rax,r9
  return components;
  4029d6:	49 89 09             	mov    QWORD PTR [r9],rcx
  4029d9:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  4029dd:	48 83 c4 08          	add    rsp,0x8
  4029e1:	c3                   	ret    
  4029e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  4029e8:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  4029ec:	31 c0                	xor    eax,eax
  4029ee:	eb df                	jmp    4029cf <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  4029f0:	40 84 f6             	test   sil,sil
  4029f3:	74 08                	je     4029fd <get_normalized_components.isra.0+0xdd>
  4029f5:	66 0f 57 05 33 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d33]        # 405730 <powers_of_10+0x90>
  4029fc:	00 
  4029fd:	89 d6                	mov    esi,edx
  4029ff:	4c 89 cf             	mov    rdi,r9
  402a02:	e8 f9 f7 ff ff       	call   402200 <get_components>
}
  402a07:	4c 89 c8             	mov    rax,r9
  402a0a:	48 83 c4 08          	add    rsp,0x8
  402a0e:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000402a10 <print_exponential_number>:
{
  402a10:	41 57                	push   r15
  402a12:	41 89 f3             	mov    r11d,esi
  402a15:	66 0f 28 f0          	movapd xmm6,xmm0
  402a19:	41 56                	push   r14
  402a1b:	41 55                	push   r13
  402a1d:	49 89 fd             	mov    r13,rdi
  402a20:	41 54                	push   r12
  402a22:	41 89 d4             	mov    r12d,edx
  402a25:	55                   	push   rbp
  402a26:	89 cd                	mov    ebp,ecx
  402a28:	53                   	push   rbx
  402a29:	48 83 ec 38          	sub    rsp,0x38
  402a2d:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  402a31:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  402a36:	e8 55 f1 ff ff       	call   401b90 <get_sign_bit>
  402a3b:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  402a3d:	85 c0                	test   eax,eax
  402a3f:	74 08                	je     402a49 <print_exponential_number+0x39>
  402a41:	66 0f 57 35 e7 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2ce7]        # 405730 <powers_of_10+0x90>
  402a48:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  402a49:	41 89 e8             	mov    r8d,ebp
  402a4c:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  402a53:	66 0f 2e 35 dd 2c 00 	ucomisd xmm6,QWORD PTR [rip+0x2cdd]        # 405738 <powers_of_10+0x98>
  402a5a:	00 
  402a5b:	0f 8a 9f 00 00 00    	jp     402b00 <print_exponential_number+0xf0>
  402a61:	0f 85 99 00 00 00    	jne    402b00 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  402a67:	45 85 c0             	test   r8d,r8d
  402a6a:	0f 85 18 01 00 00    	jne    402b88 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  402a70:	85 f6                	test   esi,esi
  402a72:	0f 84 63 03 00 00    	je     402ddb <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402a78:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  402a7a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  402a7d:	66 0f 57 35 ab 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cab]        # 405730 <powers_of_10+0x90>
  402a84:	00 
  402a85:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402a8a:	44 89 de             	mov    esi,r11d
  402a8d:	66 0f 28 c6          	movapd xmm0,xmm6
  402a91:	e8 6a f7 ff ff       	call   402200 <get_components>
  402a96:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402a9b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402aa0:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402aa5:	45 84 ff             	test   r15b,r15b
  402aa8:	0f 84 49 01 00 00    	je     402bf7 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402aae:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402ab4:	74 09                	je     402abf <print_exponential_number+0xaf>
  402ab6:	83 fb ff             	cmp    ebx,0xffffffff
  402ab9:	0f 8d d1 02 00 00    	jge    402d90 <print_exponential_number+0x380>
        width - exp10_part_width :
  402abf:	45 85 e4             	test   r12d,r12d
  402ac2:	0f 84 98 02 00 00    	je     402d60 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402ac8:	48 83 ec 08          	sub    rsp,0x8
  402acc:	45 89 e1             	mov    r9d,r12d
  402acf:	45 89 d8             	mov    r8d,r11d
  402ad2:	4c 89 e9             	mov    rcx,r13
  402ad5:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402ad9:	50                   	push   rax
  402ada:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402ade:	55                   	push   rbp
  402adf:	e8 2c fa ff ff       	call   402510 <print_broken_up_decimal.isra.0>
  402ae4:	48 83 c4 20          	add    rsp,0x20
}
  402ae8:	48 83 c4 38          	add    rsp,0x38
  402aec:	5b                   	pop    rbx
  402aed:	5d                   	pop    rbp
  402aee:	41 5c                	pop    r12
  402af0:	41 5d                	pop    r13
  402af2:	41 5e                	pop    r14
  402af4:	41 5f                	pop    r15
  402af6:	c3                   	ret    
  402af7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402afe:	00 00 
    double exp10 = log10_of_positive(abs_number);
  402b00:	66 0f 28 c6          	movapd xmm0,xmm6
  402b04:	e8 07 f8 ff ff       	call   402310 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  402b09:	e8 d2 f7 ff ff       	call   4022e0 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  402b0e:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  402b10:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  402b12:	e8 89 f8 ff ff       	call   4023a0 <pow10_of_int>
    if (abs_number < p10) {
  402b17:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  402b1b:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  402b1f:	76 0b                	jbe    402b2c <print_exponential_number+0x11c>
      floored_exp10--;
  402b21:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  402b24:	f2 0f 5e 0d 74 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2c74]        # 4057a0 <powers_of_10+0x100>
  402b2b:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  402b2c:	8d 43 11             	lea    eax,[rbx+0x11]
  402b2f:	83 f8 22             	cmp    eax,0x22
  402b32:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  402b35:	77 15                	ja     402b4c <print_exponential_number+0x13c>
  402b37:	89 d8                	mov    eax,ebx
  402b39:	48 8d 15 60 2b 00 00 	lea    rdx,[rip+0x2b60]        # 4056a0 <powers_of_10>
  402b40:	f7 d8                	neg    eax
  402b42:	0f 48 c3             	cmovs  eax,ebx
  402b45:	48 98                	cdqe   
  402b47:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  402b4c:	89 d8                	mov    eax,ebx
  402b4e:	c1 e8 1f             	shr    eax,0x1f
  402b51:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402b53:	85 db                	test   ebx,ebx
  402b55:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402b58:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  402b5b:	45 85 c0             	test   r8d,r8d
  402b5e:	74 62                	je     402bc2 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402b60:	45 85 db             	test   r11d,r11d
  402b63:	b8 01 00 00 00       	mov    eax,0x1
  402b68:	41 0f 45 c3          	cmovne eax,r11d
  402b6c:	39 c3                	cmp    ebx,eax
  402b6e:	0f 9c c0             	setl   al
  402b71:	83 fb fc             	cmp    ebx,0xfffffffc
  402b74:	40 0f 9d c7          	setge  dil
  402b78:	21 f8                	and    eax,edi
  402b7a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402b7d:	44 09 fa             	or     edx,r15d
  402b80:	eb 21                	jmp    402ba3 <print_exponential_number+0x193>
  402b82:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402b88:	45 85 db             	test   r11d,r11d
  402b8b:	b8 01 00 00 00       	mov    eax,0x1
  402b90:	ba 01 00 00 00       	mov    edx,0x1
  402b95:	41 0f 45 c3          	cmovne eax,r11d
  402b99:	85 c0                	test   eax,eax
  402b9b:	41 0f 9f c7          	setg   r15b
  402b9f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402ba1:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402ba3:	41 83 eb 01          	sub    r11d,0x1
  402ba7:	44 89 df             	mov    edi,r11d
  402baa:	29 df                	sub    edi,ebx
  402bac:	45 84 ff             	test   r15b,r15b
  402baf:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402bb3:	31 ff                	xor    edi,edi
  402bb5:	45 85 db             	test   r11d,r11d
  402bb8:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  402bbc:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402bc2:	84 d2                	test   dl,dl
  402bc4:	0f 85 86 01 00 00    	jne    402d50 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  402bca:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402bcc:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402bd1:	44 89 da             	mov    edx,r11d
  402bd4:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402bd7:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402bdb:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  402bdf:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402be3:	e8 38 fd ff ff       	call   402920 <get_normalized_components.isra.0>
  402be8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402bed:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402bf2:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  402bf7:	48 83 ff 09          	cmp    rdi,0x9
  402bfb:	7e 0a                	jle    402c07 <print_exponential_number+0x1f7>
      floored_exp10++;
  402bfd:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  402c00:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  402c02:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402c07:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402c0a:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402c0d:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402c11:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402c17:	77 47                	ja     402c60 <print_exponential_number+0x250>
      0U :
  402c19:	45 85 d2             	test   r10d,r10d
  402c1c:	0f 84 9e 01 00 00    	je     402dc0 <print_exponential_number+0x3b0>
  402c22:	41 bf 03 00 00 00    	mov    r15d,0x3
  402c28:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402c2d:	48 83 ec 08          	sub    rsp,0x8
  402c31:	45 31 c9             	xor    r9d,r9d
  402c34:	45 89 d8             	mov    r8d,r11d
  402c37:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402c3b:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  402c3e:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402c42:	50                   	push   rax
  402c43:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402c47:	55                   	push   rbp
  402c48:	e8 c3 f8 ff ff       	call   402510 <print_broken_up_decimal.isra.0>
  402c4d:	48 83 c4 20          	add    rsp,0x20
  402c51:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402c56:	eb 61                	jmp    402cb9 <print_exponential_number+0x2a9>
  402c58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402c5f:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402c60:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402c65:	45 85 d2             	test   r10d,r10d
  402c68:	0f 85 62 01 00 00    	jne    402dd0 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402c6e:	45 89 e1             	mov    r9d,r12d
  402c71:	b9 00 00 00 00       	mov    ecx,0x0
  402c76:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402c7a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402c7d:	41 29 c1             	sub    r9d,eax
  402c80:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402c83:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402c87:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402c8b:	48 83 ec 08          	sub    rsp,0x8
  402c8f:	4c 89 e9             	mov    rcx,r13
  402c92:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402c96:	50                   	push   rax
  402c97:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402c9b:	55                   	push   rbp
  402c9c:	e8 6f f8 ff ff       	call   402510 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402ca1:	48 83 c4 20          	add    rsp,0x20
  402ca5:	45 84 ff             	test   r15b,r15b
  402ca8:	0f 85 3a fe ff ff    	jne    402ae8 <print_exponential_number+0xd8>
    print_integer(output,
  402cae:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402cb2:	45 31 d2             	xor    r10d,r10d
  402cb5:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402cb9:	83 e5 20             	and    ebp,0x20
  402cbc:	4c 89 ef             	mov    rdi,r13
  402cbf:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402cc3:	83 fd 01             	cmp    ebp,0x1
  402cc6:	19 f6                	sbb    esi,esi
  402cc8:	83 e6 20             	and    esi,0x20
  402ccb:	83 c6 45             	add    esi,0x45
  402cce:	e8 ed ee ff ff       	call   401bc0 <putchar_via_gadget>
    print_integer(output,
  402cd3:	48 63 c3             	movsxd rax,ebx
  402cd6:	89 da                	mov    edx,ebx
  402cd8:	45 89 f9             	mov    r9d,r15d
  402cdb:	48 89 c6             	mov    rsi,rax
  402cde:	c1 ea 1f             	shr    edx,0x1f
  402ce1:	b9 0a 00 00 00       	mov    ecx,0xa
  402ce6:	4c 89 ef             	mov    rdi,r13
  402ce9:	48 f7 de             	neg    rsi
  402cec:	85 db                	test   ebx,ebx
  402cee:	48 0f 4f f0          	cmovg  rsi,rax
  402cf2:	48 83 ec 08          	sub    rsp,0x8
  402cf6:	45 31 c0             	xor    r8d,r8d
  402cf9:	6a 05                	push   0x5
  402cfb:	e8 10 f4 ff ff       	call   402110 <print_integer>
    if (flags & FLAGS_LEFT) {
  402d00:	58                   	pop    rax
  402d01:	5a                   	pop    rdx
  402d02:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402d06:	45 85 d2             	test   r10d,r10d
  402d09:	0f 84 d9 fd ff ff    	je     402ae8 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402d0f:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402d13:	44 29 f0             	sub    eax,r14d
  402d16:	44 39 e0             	cmp    eax,r12d
  402d19:	0f 83 c9 fd ff ff    	jae    402ae8 <print_exponential_number+0xd8>
  402d1f:	90                   	nop
        putchar_via_gadget(output, ' ');
  402d20:	be 20 00 00 00       	mov    esi,0x20
  402d25:	4c 89 ef             	mov    rdi,r13
  402d28:	e8 93 ee ff ff       	call   401bc0 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402d2d:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402d31:	44 29 f0             	sub    eax,r14d
  402d34:	44 39 e0             	cmp    eax,r12d
  402d37:	72 e7                	jb     402d20 <print_exponential_number+0x310>
}
  402d39:	48 83 c4 38          	add    rsp,0x38
  402d3d:	5b                   	pop    rbx
  402d3e:	5d                   	pop    rbp
  402d3f:	41 5c                	pop    r12
  402d41:	41 5d                	pop    r13
  402d43:	41 5e                	pop    r14
  402d45:	41 5f                	pop    r15
  402d47:	c3                   	ret    
  402d48:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402d4f:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402d50:	85 f6                	test   esi,esi
  402d52:	0f 84 2d fd ff ff    	je     402a85 <print_exponential_number+0x75>
  402d58:	e9 20 fd ff ff       	jmp    402a7d <print_exponential_number+0x6d>
  402d5d:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402d60:	48 83 ec 08          	sub    rsp,0x8
  402d64:	4c 89 e9             	mov    rcx,r13
  402d67:	45 31 c9             	xor    r9d,r9d
  402d6a:	45 89 d8             	mov    r8d,r11d
  402d6d:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402d71:	50                   	push   rax
  402d72:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402d76:	55                   	push   rbp
  402d77:	e8 94 f7 ff ff       	call   402510 <print_broken_up_decimal.isra.0>
  402d7c:	48 83 c4 20          	add    rsp,0x20
}
  402d80:	48 83 c4 38          	add    rsp,0x38
  402d84:	5b                   	pop    rbx
  402d85:	5d                   	pop    rbp
  402d86:	41 5c                	pop    r12
  402d88:	41 5d                	pop    r13
  402d8a:	41 5e                	pop    r14
  402d8c:	41 5f                	pop    r15
  402d8e:	c3                   	ret    
  402d8f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402d90:	83 c3 01             	add    ebx,0x1
  402d93:	66 0f ef c0          	pxor   xmm0,xmm0
  402d97:	48 8d 05 02 29 00 00 	lea    rax,[rip+0x2902]        # 4056a0 <powers_of_10>
  402d9e:	48 63 db             	movsxd rbx,ebx
  402da1:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402da6:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402dab:	0f 8a 0e fd ff ff    	jp     402abf <print_exponential_number+0xaf>
  402db1:	0f 85 08 fd ff ff    	jne    402abf <print_exponential_number+0xaf>
      precision--;
  402db7:	41 83 eb 01          	sub    r11d,0x1
  402dbb:	e9 ff fc ff ff       	jmp    402abf <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402dc0:	b8 04 00 00 00       	mov    eax,0x4
  402dc5:	e9 a4 fe ff ff       	jmp    402c6e <print_exponential_number+0x25e>
  402dca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402dd0:	41 bf 04 00 00 00    	mov    r15d,0x4
  402dd6:	e9 4d fe ff ff       	jmp    402c28 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402ddb:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402de0:	44 89 de             	mov    esi,r11d
  402de3:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402de7:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402de9:	e8 12 f4 ff ff       	call   402200 <get_components>
  402dee:	45 31 ff             	xor    r15d,r15d
  402df1:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402df6:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402dfb:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402e00:	e9 f2 fd ff ff       	jmp    402bf7 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402e10 <print_floating_point>:
  if (value != value) {
  402e10:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402e14:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402e17:	0f 8a eb 00 00 00    	jp     402f08 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402e1d:	f2 0f 10 0d 9b 29 00 	movsd  xmm1,QWORD PTR [rip+0x299b]        # 4057c0 <powers_of_10+0x120>
  402e24:	00 
  402e25:	66 0f 2f c8          	comisd xmm1,xmm0
  402e29:	0f 87 21 01 00 00    	ja     402f50 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402e2f:	66 0f 2f 05 91 29 00 	comisd xmm0,QWORD PTR [rip+0x2991]        # 4057c8 <powers_of_10+0x128>
  402e36:	00 
  402e37:	77 57                	ja     402e90 <print_floating_point+0x80>
{
  402e39:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402e3d:	45 84 c0             	test   r8b,r8b
  402e40:	75 7e                	jne    402ec0 <print_floating_point+0xb0>
  402e42:	66 0f 2f 05 86 29 00 	comisd xmm0,QWORD PTR [rip+0x2986]        # 4057d0 <powers_of_10+0x130>
  402e49:	00 
  402e4a:	0f 87 e8 00 00 00    	ja     402f38 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402e50:	f2 0f 10 0d 80 29 00 	movsd  xmm1,QWORD PTR [rip+0x2980]        # 4057d8 <powers_of_10+0x138>
  402e57:	00 
  402e58:	66 0f 2f c8          	comisd xmm1,xmm0
  402e5c:	0f 87 d6 00 00 00    	ja     402f38 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402e62:	41 89 c9             	mov    r9d,ecx
  402e65:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402e6c:	0f 85 fe 00 00 00    	jne    402f70 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402e72:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402e77:	49 89 e0             	mov    r8,rsp
  402e7a:	44 89 d2             	mov    edx,r10d
  402e7d:	e8 7e f9 ff ff       	call   402800 <print_decimal_number>
}
  402e82:	48 83 c4 28          	add    rsp,0x28
  402e86:	c3                   	ret    
  402e87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402e8e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402e90:	89 c8                	mov    eax,ecx
  402e92:	48 8d 35 50 26 00 00 	lea    rsi,[rip+0x2650]        # 4054e9 <memcpy+0xdf9>
  402e99:	41 89 c8             	mov    r8d,ecx
  402e9c:	44 89 d1             	mov    ecx,r10d
  402e9f:	83 e0 04             	and    eax,0x4
  402ea2:	83 f8 01             	cmp    eax,0x1
  402ea5:	19 d2                	sbb    edx,edx
  402ea7:	83 c2 04             	add    edx,0x4
  402eaa:	85 c0                	test   eax,eax
  402eac:	48 8d 05 31 26 00 00 	lea    rax,[rip+0x2631]        # 4054e4 <memcpy+0xdf4>
  402eb3:	48 0f 45 f0          	cmovne rsi,rax
  402eb7:	e9 04 ef ff ff       	jmp    401dc0 <out_rev_>
  402ebc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402ec0:	41 89 c9             	mov    r9d,ecx
  402ec3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402eca:	74 54                	je     402f20 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402ecc:	b8 01 00 00 00       	mov    eax,0x1
  402ed1:	45 31 c9             	xor    r9d,r9d
  402ed4:	83 fe 11             	cmp    esi,0x11
  402ed7:	76 4c                	jbe    402f25 <print_floating_point+0x115>
  402ed9:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402ede:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402ee0:	41 89 c1             	mov    r9d,eax
  402ee3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402ee7:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402eea:	48 83 c0 01          	add    rax,0x1
  402eee:	41 83 f9 1f          	cmp    r9d,0x1f
  402ef2:	77 05                	ja     402ef9 <print_floating_point+0xe9>
  402ef4:	83 fe 11             	cmp    esi,0x11
  402ef7:	77 e7                	ja     402ee0 <print_floating_point+0xd0>
  if (prefer_exponential)
  402ef9:	45 84 c0             	test   r8b,r8b
  402efc:	0f 84 75 ff ff ff    	je     402e77 <print_floating_point+0x67>
  402f02:	eb 21                	jmp    402f25 <print_floating_point+0x115>
  402f04:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402f08:	41 89 c8             	mov    r8d,ecx
  402f0b:	48 8d 35 db 25 00 00 	lea    rsi,[rip+0x25db]        # 4054ed <memcpy+0xdfd>
  402f12:	89 d1                	mov    ecx,edx
  402f14:	ba 03 00 00 00       	mov    edx,0x3
  402f19:	e9 a2 ee ff ff       	jmp    401dc0 <out_rev_>
  402f1e:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402f20:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402f25:	49 89 e0             	mov    r8,rsp
  402f28:	44 89 d2             	mov    edx,r10d
  402f2b:	e8 e0 fa ff ff       	call   402a10 <print_exponential_number>
}
  402f30:	48 83 c4 28          	add    rsp,0x28
  402f34:	c3                   	ret    
  402f35:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  402f38:	45 31 c9             	xor    r9d,r9d
  402f3b:	49 89 e0             	mov    r8,rsp
  402f3e:	44 89 d2             	mov    edx,r10d
  402f41:	e8 ca fa ff ff       	call   402a10 <print_exponential_number>
    return;
  402f46:	e9 37 ff ff ff       	jmp    402e82 <print_floating_point+0x72>
  402f4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  402f50:	41 89 c8             	mov    r8d,ecx
  402f53:	48 8d 35 97 25 00 00 	lea    rsi,[rip+0x2597]        # 4054f1 <memcpy+0xe01>
  402f5a:	89 d1                	mov    ecx,edx
  402f5c:	ba 04 00 00 00       	mov    edx,0x4
  402f61:	e9 5a ee ff ff       	jmp    401dc0 <out_rev_>
  402f66:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  402f6d:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402f70:	b8 01 00 00 00       	mov    eax,0x1
  402f75:	45 31 c9             	xor    r9d,r9d
  402f78:	83 fe 11             	cmp    esi,0x11
  402f7b:	0f 87 58 ff ff ff    	ja     402ed9 <print_floating_point+0xc9>
  402f81:	e9 f1 fe ff ff       	jmp    402e77 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000402f90 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  402f90:	41 57                	push   r15
  402f92:	41 56                	push   r14
  402f94:	41 55                	push   r13
  402f96:	41 54                	push   r12
  402f98:	55                   	push   rbp
  402f99:	53                   	push   rbx
  402f9a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  402f9d:	48 89 f2             	mov    rdx,rsi
{
  402fa0:	48 83 ec 28          	sub    rsp,0x28
  402fa4:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  402fa9:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  402fac:	40 84 f6             	test   sil,sil
  402faf:	0f 84 e5 00 00 00    	je     40309a <format_string_loop+0x10a>
  402fb5:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  402fb8:	4c 8d 2d 45 25 00 00 	lea    r13,[rip+0x2545]        # 405504 <memcpy+0xe14>
  402fbf:	90                   	nop
    if (*format != '%') {
  402fc0:	40 80 fe 25          	cmp    sil,0x25
  402fc4:	0f 85 ae 00 00 00    	jne    403078 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  402fca:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402fce:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402fd3:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  402fd7:	0f 84 bd 00 00 00    	je     40309a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  402fdd:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  402fe2:	4c 89 cf             	mov    rdi,r9
  402fe5:	e8 86 f4 ff ff       	call   402470 <parse_flags>
    if (is_digit_(*format)) {
  402fea:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  402fef:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  402ff2:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  402ff5:	89 fe                	mov    esi,edi
  402ff7:	e8 74 ed ff ff       	call   401d70 <is_digit_>
  402ffc:	84 c0                	test   al,al
  402ffe:	0f 85 ac 04 00 00    	jne    4034b0 <format_string_loop+0x520>
    printf_size_t width = 0U;
  403004:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  403007:	40 80 fe 2a          	cmp    sil,0x2a
  40300b:	0f 84 bf 04 00 00    	je     4034d0 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  403011:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  403014:	40 80 fe 2e          	cmp    sil,0x2e
  403018:	0f 84 52 04 00 00    	je     403470 <format_string_loop+0x4e0>
    switch (*format) {
  40301e:	8d 46 98             	lea    eax,[rsi-0x68]
  403021:	3c 12                	cmp    al,0x12
  403023:	77 2f                	ja     403054 <format_string_loop+0xc4>
  403025:	0f b6 c0             	movzx  eax,al
  403028:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  40302d:	4c 01 e8             	add    rax,r13
  403030:	3e ff e0             	notrack jmp rax
  403033:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  403038:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  40303c:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  403043:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403048:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40304c:	40 84 f6             	test   sil,sil
  40304f:	74 49                	je     40309a <format_string_loop+0x10a>
  403051:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  403054:	8d 46 db             	lea    eax,[rsi-0x25]
  403057:	3c 53                	cmp    al,0x53
  403059:	77 1d                	ja     403078 <format_string_loop+0xe8>
  40305b:	48 8d 0d ee 24 00 00 	lea    rcx,[rip+0x24ee]        # 405550 <memcpy+0xe60>
  403062:	0f b6 c0             	movzx  eax,al
  403065:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  403069:	48 01 c8             	add    rax,rcx
  40306c:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  40306f:	be 25 00 00 00       	mov    esi,0x25
  403074:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  403078:	48 89 ef             	mov    rdi,rbp
  40307b:	e8 40 eb ff ff       	call   401bc0 <putchar_via_gadget>
        format++;
  403080:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  403085:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403089:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  40308e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403091:	40 84 f6             	test   sil,sil
  403094:	0f 85 26 ff ff ff    	jne    402fc0 <format_string_loop+0x30>
        break;
    }
  }
}
  40309a:	48 83 c4 28          	add    rsp,0x28
  40309e:	5b                   	pop    rbx
  40309f:	5d                   	pop    rbp
  4030a0:	41 5c                	pop    r12
  4030a2:	41 5d                	pop    r13
  4030a4:	41 5e                	pop    r14
  4030a6:	41 5f                	pop    r15
  4030a8:	c3                   	ret    
  4030a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  4030b0:	40 80 fe 64          	cmp    sil,0x64
  4030b4:	0f 84 6e 06 00 00    	je     403728 <format_string_loop+0x798>
  4030ba:	40 80 fe 69          	cmp    sil,0x69
  4030be:	0f 84 64 06 00 00    	je     403728 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  4030c4:	89 f0                	mov    eax,esi
  4030c6:	83 e0 df             	and    eax,0xffffffdf
  4030c9:	3c 58                	cmp    al,0x58
  4030cb:	0f 84 37 06 00 00    	je     403708 <format_string_loop+0x778>
        else if (*format == 'o') {
  4030d1:	b9 08 00 00 00       	mov    ecx,0x8
  4030d6:	40 80 fe 6f          	cmp    sil,0x6f
  4030da:	74 14                	je     4030f0 <format_string_loop+0x160>
        else if (*format == 'b') {
  4030dc:	b9 02 00 00 00       	mov    ecx,0x2
  4030e1:	40 80 fe 62          	cmp    sil,0x62
  4030e5:	74 09                	je     4030f0 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  4030e7:	41 83 e3 ef          	and    r11d,0xffffffef
  4030eb:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  4030f0:	44 89 d8             	mov    eax,r11d
        format++;
  4030f3:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  4030f7:	83 e0 fe             	and    eax,0xfffffffe
  4030fa:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  403101:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  403106:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  40310a:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  40310c:	44 89 da             	mov    edx,r11d
  40310f:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  403115:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  40311c:	0f 84 b6 04 00 00    	je     4035d8 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  403122:	85 d2                	test   edx,edx
  403124:	0f 85 be 06 00 00    	jne    4037e8 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  40312a:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403131:	0f 85 b1 06 00 00    	jne    4037e8 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403137:	41 f6 c3 40          	test   r11b,0x40
  40313b:	0f 84 51 08 00 00    	je     403992 <format_string_loop+0xa02>
  403141:	83 f8 2f             	cmp    eax,0x2f
  403144:	0f 87 bc 08 00 00    	ja     403a06 <format_string_loop+0xa76>
  40314a:	89 c2                	mov    edx,eax
  40314c:	83 c0 08             	add    eax,0x8
  40314f:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403153:	89 03                	mov    DWORD PTR [rbx],eax
  403155:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  403158:	48 63 f8             	movsxd rdi,eax
  40315b:	89 c2                	mov    edx,eax
  40315d:	45 89 e1             	mov    r9d,r12d
  403160:	45 89 f8             	mov    r8d,r15d
  403163:	48 89 fe             	mov    rsi,rdi
  403166:	c1 ea 1f             	shr    edx,0x1f
  403169:	48 f7 de             	neg    rsi
  40316c:	85 c0                	test   eax,eax
  40316e:	48 0f 4f f7          	cmovg  rsi,rdi
  403172:	48 83 ec 08          	sub    rsp,0x8
  403176:	48 89 ef             	mov    rdi,rbp
  403179:	41 53                	push   r11
  40317b:	e8 90 ef ff ff       	call   402110 <print_integer>
  while (*format)
  403180:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403185:	41 5a                	pop    r10
  403187:	41 5b                	pop    r11
  403189:	e9 00 ff ff ff       	jmp    40308e <format_string_loop+0xfe>
  40318e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  403190:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403194:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403199:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40319d:	40 84 f6             	test   sil,sil
  4031a0:	0f 84 f4 fe ff ff    	je     40309a <format_string_loop+0x10a>
        if (*format == 'h') {
  4031a6:	40 80 fe 68          	cmp    sil,0x68
  4031aa:	0f 84 d8 03 00 00    	je     403588 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  4031b0:	41 80 cb 80          	or     r11b,0x80
  4031b4:	48 89 c2             	mov    rdx,rax
  4031b7:	e9 98 fe ff ff       	jmp    403054 <format_string_loop+0xc4>
  4031bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  4031c0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4031c4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4031c9:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4031cd:	40 84 f6             	test   sil,sil
  4031d0:	0f 84 c4 fe ff ff    	je     40309a <format_string_loop+0x10a>
        if (*format == 'l') {
  4031d6:	40 80 fe 6c          	cmp    sil,0x6c
  4031da:	0f 84 d0 03 00 00    	je     4035b0 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  4031e0:	41 81 cb 00 02 00 00 	or     r11d,0x200
  4031e7:	48 89 c2             	mov    rdx,rax
  4031ea:	e9 65 fe ff ff       	jmp    403054 <format_string_loop+0xc4>
  4031ef:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  4031f0:	89 f2                	mov    edx,esi
  4031f2:	44 89 d8             	mov    eax,r11d
  4031f5:	83 e2 df             	and    edx,0xffffffdf
  4031f8:	80 cc 10             	or     ah,0x10
  4031fb:	80 fa 47             	cmp    dl,0x47
  4031fe:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  403202:	83 e6 fd             	and    esi,0xfffffffd
  403205:	44 89 d8             	mov    eax,r11d
  403208:	83 c8 20             	or     eax,0x20
  40320b:	40 80 fe 45          	cmp    sil,0x45
  40320f:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403213:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403216:	3d af 00 00 00       	cmp    eax,0xaf
  40321b:	0f 87 9f 03 00 00    	ja     4035c0 <format_string_loop+0x630>
  403221:	89 c7                	mov    edi,eax
  403223:	83 c0 10             	add    eax,0x10
  403226:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40322a:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  40322d:	41 b8 01 00 00 00    	mov    r8d,0x1
  403233:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  403237:	44 89 e2             	mov    edx,r12d
  40323a:	44 89 d9             	mov    ecx,r11d
  40323d:	44 89 fe             	mov    esi,r15d
  403240:	48 89 ef             	mov    rdi,rbp
  403243:	e8 c8 fb ff ff       	call   402e10 <print_floating_point>
        format++;
  403248:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40324d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403251:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403256:	e9 33 fe ff ff       	jmp    40308e <format_string_loop+0xfe>
  40325b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  403260:	44 89 d8             	mov    eax,r11d
  403263:	83 c8 20             	or     eax,0x20
  403266:	40 80 fe 46          	cmp    sil,0x46
  40326a:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  40326e:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403271:	3d af 00 00 00       	cmp    eax,0xaf
  403276:	0f 87 74 04 00 00    	ja     4036f0 <format_string_loop+0x760>
  40327c:	89 c7                	mov    edi,eax
  40327e:	83 c0 10             	add    eax,0x10
  403281:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  403285:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  403288:	45 31 c0             	xor    r8d,r8d
  40328b:	eb a6                	jmp    403233 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  40328d:	41 83 e3 02          	and    r11d,0x2
  403291:	0f 84 b9 05 00 00    	je     403850 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403297:	8b 03                	mov    eax,DWORD PTR [rbx]
  403299:	83 f8 2f             	cmp    eax,0x2f
  40329c:	0f 86 a9 06 00 00    	jbe    40394b <format_string_loop+0x9bb>
  4032a2:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4032a6:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4032aa:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4032ae:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4032b1:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  4032b4:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4032ba:	e8 01 e9 ff ff       	call   401bc0 <putchar_via_gadget>
          while (l++ < width) {
  4032bf:	41 83 fc 01          	cmp    r12d,0x1
  4032c3:	0f 86 b7 fd ff ff    	jbe    403080 <format_string_loop+0xf0>
  4032c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  4032d0:	be 20 00 00 00       	mov    esi,0x20
  4032d5:	48 89 ef             	mov    rdi,rbp
  4032d8:	e8 e3 e8 ff ff       	call   401bc0 <putchar_via_gadget>
          while (l++ < width) {
  4032dd:	44 89 f8             	mov    eax,r15d
  4032e0:	41 83 c7 01          	add    r15d,0x1
  4032e4:	41 39 c4             	cmp    r12d,eax
  4032e7:	75 e7                	jne    4032d0 <format_string_loop+0x340>
  4032e9:	e9 92 fd ff ff       	jmp    403080 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4032ee:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  4032f0:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4032f7:	83 f8 2f             	cmp    eax,0x2f
  4032fa:	0f 87 b0 03 00 00    	ja     4036b0 <format_string_loop+0x720>
  403300:	89 c2                	mov    edx,eax
  403302:	83 c0 08             	add    eax,0x8
  403305:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403309:	89 03                	mov    DWORD PTR [rbx],eax
  40330b:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  40330e:	48 85 f6             	test   rsi,rsi
  403311:	0f 84 b1 03 00 00    	je     4036c8 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  403317:	48 83 ec 08          	sub    rsp,0x8
  40331b:	31 d2                	xor    edx,edx
  40331d:	41 b9 12 00 00 00    	mov    r9d,0x12
  403323:	45 89 f8             	mov    r8d,r15d
  403326:	41 53                	push   r11
  403328:	b9 10 00 00 00       	mov    ecx,0x10
  40332d:	48 89 ef             	mov    rdi,rbp
  403330:	e8 db ed ff ff       	call   402110 <print_integer>
  403335:	58                   	pop    rax
  403336:	5a                   	pop    rdx
        format++;
  403337:	e9 44 fd ff ff       	jmp    403080 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  40333c:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  40333f:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403341:	41 f6 c3 40          	test   r11b,0x40
  403345:	0f 84 f5 02 00 00    	je     403640 <format_string_loop+0x6b0>
  40334b:	83 f8 2f             	cmp    eax,0x2f
  40334e:	0f 87 3c 04 00 00    	ja     403790 <format_string_loop+0x800>
  403354:	89 c2                	mov    edx,eax
  403356:	83 c0 08             	add    eax,0x8
  403359:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40335d:	89 03                	mov    DWORD PTR [rbx],eax
  40335f:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403362:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  403364:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403369:	48 83 c2 01          	add    rdx,0x1
  40336d:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403372:	e9 17 fd ff ff       	jmp    40308e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  403377:	8b 03                	mov    eax,DWORD PTR [rbx]
  403379:	83 f8 2f             	cmp    eax,0x2f
  40337c:	0f 87 ee 02 00 00    	ja     403670 <format_string_loop+0x6e0>
  403382:	89 c2                	mov    edx,eax
  403384:	83 c0 08             	add    eax,0x8
  403387:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40338b:	89 03                	mov    DWORD PTR [rbx],eax
  40338d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403390:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403394:	48 85 c0             	test   rax,rax
  403397:	0f 84 ef 02 00 00    	je     40368c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40339d:	45 85 ff             	test   r15d,r15d
  4033a0:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4033a5:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  4033a9:	41 0f 45 f7          	cmovne esi,r15d
  4033ad:	e8 7e e9 ff ff       	call   401d30 <strnlen_s_>
            l = (l < precision ? l : precision);
  4033b2:	44 89 df             	mov    edi,r11d
  4033b5:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4033b8:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  4033ba:	41 0f 47 c7          	cmova  eax,r15d
  4033be:	81 e7 00 08 00 00    	and    edi,0x800
  4033c4:	41 89 fe             	mov    r14d,edi
  4033c7:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  4033ca:	41 83 e3 02          	and    r11d,0x2
  4033ce:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  4033d3:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  4033d7:	0f 84 c3 04 00 00    	je     4038a0 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4033dd:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4033e1:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4033e4:	40 84 f6             	test   sil,sil
  4033e7:	74 52                	je     40343b <format_string_loop+0x4ab>
  4033e9:	85 ff                	test   edi,edi
  4033eb:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4033f0:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4033f5:	45 85 ff             	test   r15d,r15d
  4033f8:	75 04                	jne    4033fe <format_string_loop+0x46e>
  4033fa:	84 c0                	test   al,al
  4033fc:	74 3d                	je     40343b <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4033fe:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  403402:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  403408:	49 83 c6 01          	add    r14,0x1
  40340c:	48 89 ef             	mov    rdi,rbp
  40340f:	e8 ac e7 ff ff       	call   401bc0 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  403414:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  403418:	40 84 f6             	test   sil,sil
  40341b:	74 12                	je     40342f <format_string_loop+0x49f>
  40341d:	44 89 fa             	mov    edx,r15d
  403420:	44 29 f2             	sub    edx,r14d
  403423:	03 14 24             	add    edx,DWORD PTR [rsp]
  403426:	75 e0                	jne    403408 <format_string_loop+0x478>
  403428:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  40342d:	75 d9                	jne    403408 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  40342f:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  403433:	85 c9                	test   ecx,ecx
  403435:	0f 84 45 fc ff ff    	je     403080 <format_string_loop+0xf0>
            while (l++ < width) {
  40343b:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  40343f:	44 8d 78 01          	lea    r15d,[rax+0x1]
  403443:	41 39 c4             	cmp    r12d,eax
  403446:	0f 86 34 fc ff ff    	jbe    403080 <format_string_loop+0xf0>
  40344c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  403450:	be 20 00 00 00       	mov    esi,0x20
  403455:	48 89 ef             	mov    rdi,rbp
  403458:	e8 63 e7 ff ff       	call   401bc0 <putchar_via_gadget>
            while (l++ < width) {
  40345d:	44 89 f8             	mov    eax,r15d
  403460:	41 83 c7 01          	add    r15d,0x1
  403464:	41 39 c4             	cmp    r12d,eax
  403467:	75 e7                	jne    403450 <format_string_loop+0x4c0>
  403469:	e9 12 fc ff ff       	jmp    403080 <format_string_loop+0xf0>
  40346e:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  403470:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  403474:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40347b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  403480:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  403484:	40 84 f6             	test   sil,sil
  403487:	0f 84 0d fc ff ff    	je     40309a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40348d:	40 0f be fe          	movsx  edi,sil
  403491:	e8 da e8 ff ff       	call   401d70 <is_digit_>
  403496:	84 c0                	test   al,al
  403498:	0f 85 82 00 00 00    	jne    403520 <format_string_loop+0x590>
      else if (*format == '*') {
  40349e:	40 80 fe 2a          	cmp    sil,0x2a
  4034a2:	0f 84 98 00 00 00    	je     403540 <format_string_loop+0x5b0>
  4034a8:	48 89 ca             	mov    rdx,rcx
  4034ab:	e9 6e fb ff ff       	jmp    40301e <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  4034b0:	4c 89 cf             	mov    rdi,r9
  4034b3:	e8 c8 e8 ff ff       	call   401d80 <atou_>
    if (*format == '.') {
  4034b8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  4034bd:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  4034c0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4034c3:	e9 49 fb ff ff       	jmp    403011 <format_string_loop+0x81>
  4034c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4034cf:	00 
      const int w = va_arg(args, int);
  4034d0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4034d2:	83 f8 2f             	cmp    eax,0x2f
  4034d5:	77 39                	ja     403510 <format_string_loop+0x580>
  4034d7:	89 c1                	mov    ecx,eax
  4034d9:	83 c0 08             	add    eax,0x8
  4034dc:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4034e0:	89 03                	mov    DWORD PTR [rbx],eax
  4034e2:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  4034e5:	45 85 e4             	test   r12d,r12d
  4034e8:	79 07                	jns    4034f1 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  4034ea:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  4034ee:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  4034f1:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4034f5:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4034fa:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4034fe:	40 84 f6             	test   sil,sil
  403501:	0f 84 93 fb ff ff    	je     40309a <format_string_loop+0x10a>
  403507:	48 89 c2             	mov    rdx,rax
  40350a:	e9 02 fb ff ff       	jmp    403011 <format_string_loop+0x81>
  40350f:	90                   	nop
      const int w = va_arg(args, int);
  403510:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  403514:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403518:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40351c:	eb c4                	jmp    4034e2 <format_string_loop+0x552>
  40351e:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  403520:	4c 89 cf             	mov    rdi,r9
  403523:	e8 58 e8 ff ff       	call   401d80 <atou_>
    switch (*format) {
  403528:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  40352d:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  403530:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403533:	e9 e6 fa ff ff       	jmp    40301e <format_string_loop+0x8e>
  403538:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40353f:	00 
        const int precision_ = va_arg(args, int);
  403540:	8b 03                	mov    eax,DWORD PTR [rbx]
  403542:	83 f8 2f             	cmp    eax,0x2f
  403545:	0f 87 ed 01 00 00    	ja     403738 <format_string_loop+0x7a8>
  40354b:	89 c1                	mov    ecx,eax
  40354d:	83 c0 08             	add    eax,0x8
  403550:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403554:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  403556:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  403559:	31 c0                	xor    eax,eax
  40355b:	45 85 d2             	test   r10d,r10d
  40355e:	41 0f 49 c2          	cmovns eax,r10d
  403562:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  403565:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403569:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40356e:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403572:	40 84 f6             	test   sil,sil
  403575:	0f 84 1f fb ff ff    	je     40309a <format_string_loop+0x10a>
  40357b:	48 89 c2             	mov    rdx,rax
  40357e:	e9 9b fa ff ff       	jmp    40301e <format_string_loop+0x8e>
  403583:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  403588:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40358c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403590:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403595:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403599:	40 84 f6             	test   sil,sil
  40359c:	0f 85 af fa ff ff    	jne    403051 <format_string_loop+0xc1>
  4035a2:	e9 f3 fa ff ff       	jmp    40309a <format_string_loop+0x10a>
  4035a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4035ae:	00 00 
          flags |= FLAGS_LONG_LONG;
  4035b0:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  4035b7:	eb d3                	jmp    40358c <format_string_loop+0x5fc>
  4035b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  4035c0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4035c4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4035c8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4035cc:	e9 5c fc ff ff       	jmp    40322d <format_string_loop+0x29d>
  4035d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  4035d8:	44 89 de             	mov    esi,r11d
  4035db:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  4035de:	85 d2                	test   edx,edx
  4035e0:	0f 85 c2 01 00 00    	jne    4037a8 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  4035e6:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4035ed:	0f 85 b5 01 00 00    	jne    4037a8 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4035f3:	41 f6 c3 40          	test   r11b,0x40
  4035f7:	0f 84 6f 03 00 00    	je     40396c <format_string_loop+0x9dc>
  4035fd:	83 f8 2f             	cmp    eax,0x2f
  403600:	0f 87 d7 03 00 00    	ja     4039dd <format_string_loop+0xa4d>
  403606:	89 c2                	mov    edx,eax
  403608:	83 c0 08             	add    eax,0x8
  40360b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40360f:	89 03                	mov    DWORD PTR [rbx],eax
  403611:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  403615:	48 83 ec 08          	sub    rsp,0x8
  403619:	31 d2                	xor    edx,edx
  40361b:	48 89 ef             	mov    rdi,rbp
  40361e:	45 89 e1             	mov    r9d,r12d
  403621:	56                   	push   rsi
  403622:	45 89 f8             	mov    r8d,r15d
  403625:	4c 89 de             	mov    rsi,r11
  403628:	e8 e3 ea ff ff       	call   402110 <print_integer>
  while (*format)
  40362d:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403632:	5e                   	pop    rsi
  403633:	5f                   	pop    rdi
  403634:	e9 55 fa ff ff       	jmp    40308e <format_string_loop+0xfe>
  403639:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403640:	41 f6 c3 80          	test   r11b,0x80
  403644:	0f 84 06 01 00 00    	je     403750 <format_string_loop+0x7c0>
  40364a:	83 f8 2f             	cmp    eax,0x2f
  40364d:	0f 87 08 03 00 00    	ja     40395b <format_string_loop+0x9cb>
  403653:	89 c6                	mov    esi,eax
  403655:	83 c0 08             	add    eax,0x8
  403658:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40365c:	89 03                	mov    DWORD PTR [rbx],eax
  40365e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403661:	66 89 08             	mov    WORD PTR [rax],cx
  403664:	e9 00 fd ff ff       	jmp    403369 <format_string_loop+0x3d9>
  403669:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  403670:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403674:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403678:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40367c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40367f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403683:	48 85 c0             	test   rax,rax
  403686:	0f 85 11 fd ff ff    	jne    40339d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40368c:	45 89 d8             	mov    r8d,r11d
  40368f:	44 89 e1             	mov    ecx,r12d
  403692:	ba 06 00 00 00       	mov    edx,0x6
  403697:	48 89 ef             	mov    rdi,rbp
  40369a:	48 8d 35 55 1e 00 00 	lea    rsi,[rip+0x1e55]        # 4054f6 <memcpy+0xe06>
  4036a1:	e8 1a e7 ff ff       	call   401dc0 <out_rev_>
  4036a6:	e9 d5 f9 ff ff       	jmp    403080 <format_string_loop+0xf0>
  4036ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4036b0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4036b4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4036b8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036bc:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4036bf:	48 85 f6             	test   rsi,rsi
  4036c2:	0f 85 4f fc ff ff    	jne    403317 <format_string_loop+0x387>
  4036c8:	45 89 d8             	mov    r8d,r11d
  4036cb:	b9 12 00 00 00       	mov    ecx,0x12
  4036d0:	ba 05 00 00 00       	mov    edx,0x5
  4036d5:	48 89 ef             	mov    rdi,rbp
  4036d8:	48 8d 35 1e 1e 00 00 	lea    rsi,[rip+0x1e1e]        # 4054fd <memcpy+0xe0d>
  4036df:	e8 dc e6 ff ff       	call   401dc0 <out_rev_>
  4036e4:	e9 97 f9 ff ff       	jmp    403080 <format_string_loop+0xf0>
  4036e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4036f0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4036f4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4036f8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036fc:	e9 87 fb ff ff       	jmp    403288 <format_string_loop+0x2f8>
  403701:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  403708:	44 89 d8             	mov    eax,r11d
  40370b:	41 83 cb 20          	or     r11d,0x20
  40370f:	40 80 fe 58          	cmp    sil,0x58
  403713:	b9 10 00 00 00       	mov    ecx,0x10
  403718:	44 0f 45 d8          	cmovne r11d,eax
  40371c:	e9 cf f9 ff ff       	jmp    4030f0 <format_string_loop+0x160>
  403721:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  403728:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  40372f:	e9 90 f9 ff ff       	jmp    4030c4 <format_string_loop+0x134>
  403734:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  403738:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  40373c:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403740:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403744:	e9 0d fe ff ff       	jmp    403556 <format_string_loop+0x5c6>
  403749:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  403750:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403757:	0f 85 d3 00 00 00    	jne    403830 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  40375d:	41 81 e3 00 04 00 00 	and    r11d,0x400
  403764:	0f 85 c6 00 00 00    	jne    403830 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  40376a:	83 f8 2f             	cmp    eax,0x2f
  40376d:	0f 87 a4 02 00 00    	ja     403a17 <format_string_loop+0xa87>
  403773:	89 c6                	mov    esi,eax
  403775:	83 c0 08             	add    eax,0x8
  403778:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40377c:	89 03                	mov    DWORD PTR [rbx],eax
  40377e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403781:	89 08                	mov    DWORD PTR [rax],ecx
  403783:	e9 e1 fb ff ff       	jmp    403369 <format_string_loop+0x3d9>
  403788:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40378f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403790:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403794:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403798:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40379c:	e9 be fb ff ff       	jmp    40335f <format_string_loop+0x3cf>
  4037a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  4037a8:	83 f8 2f             	cmp    eax,0x2f
  4037ab:	0f 87 78 01 00 00    	ja     403929 <format_string_loop+0x999>
  4037b1:	89 c7                	mov    edi,eax
  4037b3:	83 c0 08             	add    eax,0x8
  4037b6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4037ba:	89 03                	mov    DWORD PTR [rbx],eax
  4037bc:	48 83 ec 08          	sub    rsp,0x8
  4037c0:	45 89 e1             	mov    r9d,r12d
  4037c3:	45 89 f8             	mov    r8d,r15d
  4037c6:	31 d2                	xor    edx,edx
  4037c8:	56                   	push   rsi
  4037c9:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4037cc:	48 89 ef             	mov    rdi,rbp
  4037cf:	e8 3c e9 ff ff       	call   402110 <print_integer>
  while (*format)
  4037d4:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4037d9:	41 58                	pop    r8
  4037db:	41 59                	pop    r9
  4037dd:	e9 ac f8 ff ff       	jmp    40308e <format_string_loop+0xfe>
  4037e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4037e8:	83 f8 2f             	cmp    eax,0x2f
  4037eb:	0f 87 27 01 00 00    	ja     403918 <format_string_loop+0x988>
  4037f1:	89 c2                	mov    edx,eax
  4037f3:	83 c0 08             	add    eax,0x8
  4037f6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4037fa:	89 03                	mov    DWORD PTR [rbx],eax
  4037fc:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4037ff:	45 89 e1             	mov    r9d,r12d
  403802:	45 89 f8             	mov    r8d,r15d
  403805:	48 89 ef             	mov    rdi,rbp
  403808:	48 89 d6             	mov    rsi,rdx
  40380b:	48 f7 de             	neg    rsi
  40380e:	48 0f 48 f2          	cmovs  rsi,rdx
  403812:	48 83 ec 08          	sub    rsp,0x8
  403816:	48 c1 ea 3f          	shr    rdx,0x3f
  40381a:	41 53                	push   r11
  40381c:	e8 ef e8 ff ff       	call   402110 <print_integer>
  while (*format)
  403821:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403826:	41 5c                	pop    r12
  403828:	41 5e                	pop    r14
  40382a:	e9 5f f8 ff ff       	jmp    40308e <format_string_loop+0xfe>
  40382f:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403830:	83 f8 2f             	cmp    eax,0x2f
  403833:	0f 87 7b 01 00 00    	ja     4039b4 <format_string_loop+0xa24>
  403839:	89 c6                	mov    esi,eax
  40383b:	83 c0 08             	add    eax,0x8
  40383e:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  403842:	89 03                	mov    DWORD PTR [rbx],eax
  403844:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403847:	48 89 08             	mov    QWORD PTR [rax],rcx
  40384a:	e9 1a fb ff ff       	jmp    403369 <format_string_loop+0x3d9>
  40384f:	90                   	nop
          while (l++ < width) {
  403850:	41 83 fc 01          	cmp    r12d,0x1
  403854:	76 23                	jbe    403879 <format_string_loop+0x8e9>
  403856:	41 bf 02 00 00 00    	mov    r15d,0x2
  40385c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403860:	be 20 00 00 00       	mov    esi,0x20
  403865:	48 89 ef             	mov    rdi,rbp
  403868:	e8 53 e3 ff ff       	call   401bc0 <putchar_via_gadget>
          while (l++ < width) {
  40386d:	44 89 f8             	mov    eax,r15d
  403870:	41 83 c7 01          	add    r15d,0x1
  403874:	41 39 c4             	cmp    r12d,eax
  403877:	75 e7                	jne    403860 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403879:	8b 03                	mov    eax,DWORD PTR [rbx]
  40387b:	83 f8 2f             	cmp    eax,0x2f
  40387e:	0f 87 b6 00 00 00    	ja     40393a <format_string_loop+0x9aa>
  403884:	89 c2                	mov    edx,eax
  403886:	83 c0 08             	add    eax,0x8
  403889:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40388d:	89 03                	mov    DWORD PTR [rbx],eax
  40388f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403892:	48 89 ef             	mov    rdi,rbp
  403895:	e8 26 e3 ff ff       	call   401bc0 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  40389a:	e9 e1 f7 ff ff       	jmp    403080 <format_string_loop+0xf0>
  40389f:	90                   	nop
            while (l++ < width) {
  4038a0:	89 c1                	mov    ecx,eax
  4038a2:	8d 40 01             	lea    eax,[rax+0x1]
  4038a5:	41 39 cc             	cmp    r12d,ecx
  4038a8:	0f 86 bc 01 00 00    	jbe    403a6a <format_string_loop+0xada>
  4038ae:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  4038b3:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  4038b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4038be:	00 00 
              putchar_via_gadget(output, ' ');
  4038c0:	be 20 00 00 00       	mov    esi,0x20
  4038c5:	48 89 ef             	mov    rdi,rbp
  4038c8:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4038cc:	e8 ef e2 ff ff       	call   401bc0 <putchar_via_gadget>
            while (l++ < width) {
  4038d1:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4038d5:	89 c2                	mov    edx,eax
  4038d7:	83 c0 01             	add    eax,0x1
  4038da:	41 39 d4             	cmp    r12d,edx
  4038dd:	75 e1                	jne    4038c0 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4038df:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4038e3:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4038e6:	40 84 f6             	test   sil,sil
  4038e9:	0f 84 91 f7 ff ff    	je     403080 <format_string_loop+0xf0>
  4038ef:	45 85 f6             	test   r14d,r14d
  4038f2:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4038f7:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4038fc:	45 85 ff             	test   r15d,r15d
  4038ff:	0f 85 f9 fa ff ff    	jne    4033fe <format_string_loop+0x46e>
  403905:	84 c0                	test   al,al
  403907:	0f 85 f1 fa ff ff    	jne    4033fe <format_string_loop+0x46e>
  40390d:	e9 6e f7 ff ff       	jmp    403080 <format_string_loop+0xf0>
  403912:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403918:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40391c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403920:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403924:	e9 d3 fe ff ff       	jmp    4037fc <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403929:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  40392d:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403931:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403935:	e9 82 fe ff ff       	jmp    4037bc <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  40393a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  40393e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403942:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403946:	e9 44 ff ff ff       	jmp    40388f <format_string_loop+0x8ff>
  40394b:	89 c2                	mov    edx,eax
  40394d:	83 c0 08             	add    eax,0x8
  403950:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403954:	89 03                	mov    DWORD PTR [rbx],eax
  403956:	e9 53 f9 ff ff       	jmp    4032ae <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  40395b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40395f:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403963:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403967:	e9 f2 fc ff ff       	jmp    40365e <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  40396c:	41 81 e3 80 00 00 00 	and    r11d,0x80
  403973:	74 79                	je     4039ee <format_string_loop+0xa5e>
  403975:	83 f8 2f             	cmp    eax,0x2f
  403978:	0f 87 db 00 00 00    	ja     403a59 <format_string_loop+0xac9>
  40397e:	89 c2                	mov    edx,eax
  403980:	83 c0 08             	add    eax,0x8
  403983:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403987:	89 03                	mov    DWORD PTR [rbx],eax
  403989:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  40398d:	e9 83 fc ff ff       	jmp    403615 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403992:	41 f6 c3 80          	test   r11b,0x80
  403996:	74 2d                	je     4039c5 <format_string_loop+0xa35>
  403998:	83 f8 2f             	cmp    eax,0x2f
  40399b:	0f 87 a7 00 00 00    	ja     403a48 <format_string_loop+0xab8>
  4039a1:	89 c2                	mov    edx,eax
  4039a3:	83 c0 08             	add    eax,0x8
  4039a6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4039aa:	89 03                	mov    DWORD PTR [rbx],eax
  4039ac:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  4039af:	e9 a4 f7 ff ff       	jmp    403158 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  4039b4:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4039b8:	48 8d 46 08          	lea    rax,[rsi+0x8]
  4039bc:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4039c0:	e9 7f fe ff ff       	jmp    403844 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  4039c5:	83 f8 2f             	cmp    eax,0x2f
  4039c8:	76 6c                	jbe    403a36 <format_string_loop+0xaa6>
  4039ca:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4039ce:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4039d2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4039d6:	8b 02                	mov    eax,DWORD PTR [rdx]
  4039d8:	e9 7b f7 ff ff       	jmp    403158 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4039dd:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4039e1:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4039e5:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4039e9:	e9 23 fc ff ff       	jmp    403611 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  4039ee:	83 f8 2f             	cmp    eax,0x2f
  4039f1:	77 35                	ja     403a28 <format_string_loop+0xa98>
  4039f3:	89 c2                	mov    edx,eax
  4039f5:	83 c0 08             	add    eax,0x8
  4039f8:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4039fc:	89 03                	mov    DWORD PTR [rbx],eax
  4039fe:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  403a01:	e9 0f fc ff ff       	jmp    403615 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403a06:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a0a:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a0e:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a12:	e9 3e f7 ff ff       	jmp    403155 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  403a17:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403a1b:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403a1f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a23:	e9 56 fd ff ff       	jmp    40377e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403a28:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a2c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a30:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a34:	eb c8                	jmp    4039fe <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403a36:	89 c2                	mov    edx,eax
  403a38:	83 c0 08             	add    eax,0x8
  403a3b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403a3f:	89 03                	mov    DWORD PTR [rbx],eax
  403a41:	8b 02                	mov    eax,DWORD PTR [rdx]
  403a43:	e9 10 f7 ff ff       	jmp    403158 <format_string_loop+0x1c8>
  403a48:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a4c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a50:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a54:	e9 53 ff ff ff       	jmp    4039ac <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403a59:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a5d:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a61:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a65:	e9 1f ff ff ff       	jmp    403989 <format_string_loop+0x9f9>
            while (l++ < width) {
  403a6a:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  403a6e:	e9 6c fe ff ff       	jmp    4038df <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000403a80 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  403a80:	53                   	push   rbx
  403a81:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  403a84:	e8 07 f5 ff ff       	call   402f90 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  403a89:	48 89 df             	mov    rdi,rbx
  403a8c:	e8 6f e1 ff ff       	call   401c00 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  403a91:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  403a94:	5b                   	pop    rbx
  403a95:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000403aa0 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  403aa0:	f3 0f 1e fa          	endbr64 
  403aa4:	55                   	push   rbp
  403aa5:	49 89 f3             	mov    r11,rsi
  403aa8:	49 89 fa             	mov    r10,rdi
  403aab:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  403aaf:	48 89 e5             	mov    rbp,rsp
  403ab2:	48 89 ef             	mov    rdi,rbp
  403ab5:	e8 56 e2 ff ff       	call   401d10 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403aba:	48 89 ef             	mov    rdi,rbp
  403abd:	4c 89 da             	mov    rdx,r11
  403ac0:	4c 89 d6             	mov    rsi,r10
  403ac3:	e8 b8 ff ff ff       	call   403a80 <vsnprintf_impl>
}
  403ac8:	48 83 c4 20          	add    rsp,0x20
  403acc:	5d                   	pop    rbp
  403acd:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403ad0 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403ad0:	f3 0f 1e fa          	endbr64 
  403ad4:	55                   	push   rbp
  403ad5:	49 89 d1             	mov    r9,rdx
  403ad8:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  403adb:	48 89 f2             	mov    rdx,rsi
  403ade:	48 89 fe             	mov    rsi,rdi
{
  403ae1:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  403ae5:	48 89 e5             	mov    rbp,rsp
  403ae8:	48 89 ef             	mov    rdi,rbp
  403aeb:	e8 80 e1 ff ff       	call   401c70 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403af0:	48 89 ef             	mov    rdi,rbp
  403af3:	4c 89 d2             	mov    rdx,r10
  403af6:	4c 89 ce             	mov    rsi,r9
  403af9:	e8 82 ff ff ff       	call   403a80 <vsnprintf_impl>
}
  403afe:	48 83 c4 20          	add    rsp,0x20
  403b02:	5d                   	pop    rbp
  403b03:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000403b10 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  403b10:	f3 0f 1e fa          	endbr64 
  403b14:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  403b17:	48 89 f2             	mov    rdx,rsi
  403b1a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403b1f:	e9 ac ff ff ff       	jmp    403ad0 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000403b30 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  403b30:	f3 0f 1e fa          	endbr64 
  403b34:	55                   	push   rbp
  403b35:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403b38:	48 89 f2             	mov    rdx,rsi
  403b3b:	48 89 fe             	mov    rsi,rdi
{
  403b3e:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403b42:	48 89 e5             	mov    rbp,rsp
  403b45:	48 89 ef             	mov    rdi,rbp
  403b48:	e8 83 e1 ff ff       	call   401cd0 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403b4d:	48 89 ef             	mov    rdi,rbp
  403b50:	48 89 ca             	mov    rdx,rcx
  403b53:	4c 89 ce             	mov    rsi,r9
  403b56:	e8 25 ff ff ff       	call   403a80 <vsnprintf_impl>
}
  403b5b:	48 83 c4 20          	add    rsp,0x20
  403b5f:	5d                   	pop    rbp
  403b60:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403b70 <printf>:

int printf_(const char* format, ...)
{
  403b70:	f3 0f 1e fa          	endbr64 
  403b74:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403b7b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403b80:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403b85:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403b8a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403b8f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403b94:	84 c0                	test   al,al
  403b96:	74 37                	je     403bcf <printf+0x5f>
  403b98:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403b9d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403ba2:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403ba7:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403bae:	00 
  403baf:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403bb6:	00 
  403bb7:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403bbe:	00 
  403bbf:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403bc6:	00 
  403bc7:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403bce:	00 
  va_list args;
  va_start(args, format);
  403bcf:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403bd6:	00 
  const int ret = vprintf_(format, args);
  403bd7:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  403bdc:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403be3:	00 
  403be4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403be9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403bee:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403bf5:	00 
  403bf6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  403bfb:	e8 a0 fe ff ff       	call   403aa0 <vprintf>
  va_end(args);
  return ret;
}
  403c00:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403c07:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000403c10 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  403c10:	f3 0f 1e fa          	endbr64 
  403c14:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403c1b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403c20:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403c25:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403c2a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403c2f:	84 c0                	test   al,al
  403c31:	74 37                	je     403c6a <sprintf+0x5a>
  403c33:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403c38:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403c3d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403c42:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403c49:	00 
  403c4a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403c51:	00 
  403c52:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403c59:	00 
  403c5a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403c61:	00 
  403c62:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403c69:	00 
  va_list args;
  va_start(args, format);
  403c6a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403c71:	00 
  const int ret = vsprintf_(s, format, args);
  403c72:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403c77:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403c7e:	00 
  403c7f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403c84:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403c89:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403c90:	00 
  403c91:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403c96:	e8 75 fe ff ff       	call   403b10 <vsprintf>
  va_end(args);
  return ret;
}
  403c9b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403ca2:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403cb0 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403cb0:	f3 0f 1e fa          	endbr64 
  403cb4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403cbb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403cc0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403cc5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403cca:	84 c0                	test   al,al
  403ccc:	74 37                	je     403d05 <snprintf+0x55>
  403cce:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403cd3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403cd8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403cdd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403ce4:	00 
  403ce5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403cec:	00 
  403ced:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403cf4:	00 
  403cf5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403cfc:	00 
  403cfd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403d04:	00 
  va_list args;
  va_start(args, format);
  403d05:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403d0c:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403d0d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403d12:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403d19:	00 
  403d1a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403d1f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403d24:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403d2b:	00 
  403d2c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403d31:	e8 9a fd ff ff       	call   403ad0 <vsnprintf>
  va_end(args);
  return ret;
}
  403d36:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403d3d:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403d40 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403d40:	f3 0f 1e fa          	endbr64 
  403d44:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403d4b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403d50:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403d55:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403d5a:	84 c0                	test   al,al
  403d5c:	74 37                	je     403d95 <fctprintf+0x55>
  403d5e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403d63:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403d68:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403d6d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403d74:	00 
  403d75:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403d7c:	00 
  403d7d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403d84:	00 
  403d85:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403d8c:	00 
  403d8d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403d94:	00 
  va_list args;
  va_start(args, format);
  403d95:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403d9c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403d9d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403da2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403da9:	00 
  403daa:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403daf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403db4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403dbb:	00 
  403dbc:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403dc1:	e8 6a fd ff ff       	call   403b30 <vfctprintf>
  va_end(args);
  return ret;
}
  403dc6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403dcd:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403dd0 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403dd0:	f3 0f 1e fa          	endbr64 
  403dd4:	41 54                	push   r12
  403dd6:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403dd9:	40 0f be ff          	movsx  edi,dil
  403ddd:	e8 0e 00 00 00       	call   403df0 <putchar_>
	return c;
}
  403de2:	44 89 e0             	mov    eax,r12d
  403de5:	41 5c                	pop    r12
  403de7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403df0 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403df0:	f3 0f 1e fa          	endbr64 
  403df4:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403df8:	ba 01 00 00 00       	mov    edx,0x1
  403dfd:	31 c0                	xor    eax,eax
void putchar_(char c){
  403dff:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403e04:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403e09:	bf 01 00 00 00       	mov    edi,0x1
  403e0e:	e8 cd d2 ff ff       	call   4010e0 <write>
  403e13:	48 83 c4 18          	add    rsp,0x18
  403e17:	c3                   	ret    

Disassembly of section .text.max:

0000000000403e20 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403e20:	48 39 f7             	cmp    rdi,rsi
  403e23:	48 89 f0             	mov    rax,rsi
  403e26:	48 0f 43 c7          	cmovae rax,rdi
}
  403e2a:	c3                   	ret    

Disassembly of section .text.align:

0000000000403e30 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403e30:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403e35:	48 f7 de             	neg    rsi
  403e38:	48 21 f0             	and    rax,rsi
}
  403e3b:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403e40 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403e40:	31 c0                	xor    eax,eax
  403e42:	83 ff 01             	cmp    edi,0x1
  403e45:	76 4e                	jbe    403e95 <granules_to_chunk_kind+0x55>
  403e47:	b8 01 00 00 00       	mov    eax,0x1
  403e4c:	83 ff 02             	cmp    edi,0x2
  403e4f:	74 44                	je     403e95 <granules_to_chunk_kind+0x55>
  403e51:	83 ff 03             	cmp    edi,0x3
  403e54:	74 5a                	je     403eb0 <granules_to_chunk_kind+0x70>
  403e56:	83 ff 04             	cmp    edi,0x4
  403e59:	74 45                	je     403ea0 <granules_to_chunk_kind+0x60>
  403e5b:	83 ff 05             	cmp    edi,0x5
  403e5e:	74 60                	je     403ec0 <granules_to_chunk_kind+0x80>
  403e60:	83 ff 06             	cmp    edi,0x6
  403e63:	74 2b                	je     403e90 <granules_to_chunk_kind+0x50>
  403e65:	b8 06 00 00 00       	mov    eax,0x6
  403e6a:	83 ff 08             	cmp    edi,0x8
  403e6d:	76 26                	jbe    403e95 <granules_to_chunk_kind+0x55>
  403e6f:	b8 07 00 00 00       	mov    eax,0x7
  403e74:	83 ff 0a             	cmp    edi,0xa
  403e77:	76 1c                	jbe    403e95 <granules_to_chunk_kind+0x55>
  403e79:	b8 08 00 00 00       	mov    eax,0x8
  403e7e:	83 ff 10             	cmp    edi,0x10
  403e81:	76 12                	jbe    403e95 <granules_to_chunk_kind+0x55>
  403e83:	83 ff 21             	cmp    edi,0x21
  403e86:	19 c0                	sbb    eax,eax
  403e88:	24 0a                	and    al,0xa
  403e8a:	05 ff 00 00 00       	add    eax,0xff
  403e8f:	c3                   	ret    
  403e90:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403e95:	c3                   	ret    
  403e96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403e9d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403ea0:	b8 03 00 00 00       	mov    eax,0x3
  403ea5:	c3                   	ret    
  403ea6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403ead:	00 00 00 
  403eb0:	b8 02 00 00 00       	mov    eax,0x2
  403eb5:	c3                   	ret    
  403eb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403ebd:	00 00 00 
  403ec0:	b8 04 00 00 00       	mov    eax,0x4
  403ec5:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403ed0 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403ed0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403ed5:	83 ff 09             	cmp    edi,0x9
  403ed8:	77 0c                	ja     403ee6 <chunk_kind_to_granules+0x16>
  403eda:	89 ff                	mov    edi,edi
  403edc:	48 8d 05 fd 18 00 00 	lea    rax,[rip+0x18fd]        # 4057e0 <CSWTCH.34>
  403ee3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403ee6:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403ef0 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403ef0:	48 89 f8             	mov    rax,rdi
  403ef3:	66 31 c0             	xor    ax,ax
}
  403ef6:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403f00 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403f00:	89 f8                	mov    eax,edi
  403f02:	0f b6 c4             	movzx  eax,ah
}
  403f05:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000403f10 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  403f10:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  403f14:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000403f20 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  403f20:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  403f24:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000403f30 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  403f30:	89 f6                	mov    esi,esi
  403f32:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  403f35:	48 c1 e6 08          	shl    rsi,0x8
  403f39:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  403f3d:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000403f40 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  403f40:	48 8b 0d e1 1b 00 00 	mov    rcx,QWORD PTR [rip+0x1be1]        # 405b28 <large_objects>
  403f47:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  403f4e:	00 
  403f4f:	76 07                	jbe    403f58 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  403f51:	c3                   	ret    
  403f52:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  403f58:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403f5b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  403f60:	e8 9b ff ff ff       	call   403f00 <get_chunk_index>
  403f65:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  403f67:	e8 84 ff ff ff       	call   403ef0 <get_page>
  403f6c:	48 89 c7             	mov    rdi,rax
  403f6f:	e8 bc ff ff ff       	call   403f30 <allocate_chunk>
		large_objects = large_objects->next;
  403f74:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403f77:	48 89 15 aa 1b 00 00 	mov    QWORD PTR [rip+0x1baa],rdx        # 405b28 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  403f7e:	48 8b 15 03 1c 00 00 	mov    rdx,QWORD PTR [rip+0x1c03]        # 405b88 <small_object_freelists+0x48>
  403f85:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  403f88:	48 89 05 f9 1b 00 00 	mov    QWORD PTR [rip+0x1bf9],rax        # 405b88 <small_object_freelists+0x48>
}
  403f8f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000403f90 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  403f90:	48 8d 47 07          	lea    rax,[rdi+0x7]
  403f94:	48 c1 e8 03          	shr    rax,0x3
}
  403f98:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000403f99 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403f99:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000403fa0 <maybe_merge_free_large_object>:
{
  403fa0:	53                   	push   rbx
	struct large_object* obj = *prev;
  403fa1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  403fa4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403fa7:	48 8d 1d 7a 1b 00 00 	lea    rbx,[rip+0x1b7a]        # 405b28 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  403fae:	4c 89 df             	mov    rdi,r11
  403fb1:	e8 5a ff ff ff       	call   403f10 <get_large_object_payload>
  403fb6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  403fba:	49 89 c2             	mov    r10,rax
  403fbd:	0f 1f 00             	nop    DWORD PTR [rax]
  403fc0:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  403fc4:	be 00 01 00 00       	mov    esi,0x100
  403fc9:	48 89 d7             	mov    rdi,rdx
  403fcc:	e8 5f fe ff ff       	call   403e30 <align>
  403fd1:	48 39 c2             	cmp    rdx,rax
  403fd4:	0f 85 bf ff ff ff    	jne    403f99 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  403fda:	e8 21 ff ff ff       	call   403f00 <get_chunk_index>
  403fdf:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  403fe1:	85 c9                	test   ecx,ecx
  403fe3:	74 53                	je     404038 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  403fe5:	e8 06 ff ff ff       	call   403ef0 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  403fea:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  403fee:	75 48                	jne    404038 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  403ff0:	48 8b 05 31 1b 00 00 	mov    rax,QWORD PTR [rip+0x1b31]        # 405b28 <large_objects>
			ASSERT(walk);
  403ff7:	48 85 c0             	test   rax,rax
  403ffa:	0f 84 99 ff ff ff    	je     403f99 <maybe_merge_free_large_object.cold>
			if(walk == next)
  404000:	48 39 c2             	cmp    rdx,rax
  404003:	74 3b                	je     404040 <maybe_merge_free_large_object+0xa0>
  404005:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  404008:	48 89 c1             	mov    rcx,rax
  40400b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  40400e:	48 85 c0             	test   rax,rax
  404011:	74 32                	je     404045 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  404013:	48 39 c2             	cmp    rdx,rax
  404016:	75 f0                	jne    404008 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  404018:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  40401c:	4c 39 c8             	cmp    rax,r9
  40401f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  404023:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  404028:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  40402b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  40402f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  404032:	eb 8c                	jmp    403fc0 <maybe_merge_free_large_object+0x20>
  404034:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  404038:	4c 89 c8             	mov    rax,r9
  40403b:	5b                   	pop    rbx
  40403c:	c3                   	ret    
  40403d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  404040:	48 89 d9             	mov    rcx,rbx
  404043:	eb d3                	jmp    404018 <maybe_merge_free_large_object+0x78>
  404045:	e9 4f ff ff ff       	jmp    403f99 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000404050 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  404050:	8b 05 c6 1a 00 00    	mov    eax,DWORD PTR [rip+0x1ac6]        # 405b1c <pending_large_object_compact>
  404056:	85 c0                	test   eax,eax
  404058:	74 2c                	je     404086 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  40405a:	48 83 3d c6 1a 00 00 	cmp    QWORD PTR [rip+0x1ac6],0x0        # 405b28 <large_objects>
  404061:	00 
		pending_large_object_compact = 0;
  404062:	c7 05 b0 1a 00 00 00 	mov    DWORD PTR [rip+0x1ab0],0x0        # 405b1c <pending_large_object_compact>
  404069:	00 00 00 
		while(*prev)
  40406c:	74 18                	je     404086 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  40406e:	48 8d 3d b3 1a 00 00 	lea    rdi,[rip+0x1ab3]        # 405b28 <large_objects>
  404075:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  404078:	e8 23 ff ff ff       	call   403fa0 <maybe_merge_free_large_object>
  40407d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  404080:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  404084:	75 f2                	jne    404078 <maybe_compact_free_large_objects+0x28>
}
  404086:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000404087 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  404087:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000404090 <get_small_object_freelist>:
  404090:	83 ff 09             	cmp    edi,0x9
  404093:	0f 87 ee ff ff ff    	ja     404087 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  404099:	89 ff                	mov    edi,edi
  40409b:	48 8d 05 9e 1a 00 00 	lea    rax,[rip+0x1a9e]        # 405b40 <small_object_freelists>
  4040a2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  4040a6:	c3                   	ret    

Disassembly of section .text.free:

00000000004040b0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  4040b0:	f3 0f 1e fa          	endbr64 
  4040b4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  4040b7:	48 85 ff             	test   rdi,rdi
  4040ba:	74 2a                	je     4040e6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  4040bc:	e8 2f fe ff ff       	call   403ef0 <get_page>
  4040c1:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  4040c4:	e8 37 fe ff ff       	call   403f00 <get_chunk_index>
  4040c9:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  4040cb:	89 c0                	mov    eax,eax
  4040cd:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  4040d2:	40 80 ff ff          	cmp    dil,0xff
  4040d6:	74 18                	je     4040f0 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  4040d8:	e8 b3 ff ff ff       	call   404090 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  4040dd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  4040e0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  4040e3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  4040e6:	c3                   	ret    
  4040e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4040ee:	00 00 
		struct large_object* obj = get_large_object(ptr);
  4040f0:	4c 89 c7             	mov    rdi,r8
  4040f3:	e8 28 fe ff ff       	call   403f20 <get_large_object>
		obj->next = large_objects;
  4040f8:	48 8b 15 29 1a 00 00 	mov    rdx,QWORD PTR [rip+0x1a29]        # 405b28 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  4040ff:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  404102:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  404105:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  40410a:	48 89 05 17 1a 00 00 	mov    QWORD PTR [rip+0x1a17],rax        # 405b28 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  404111:	e8 1a fe ff ff       	call   403f30 <allocate_chunk>
		pending_large_object_compact = 1;
  404116:	c7 05 fc 19 00 00 01 	mov    DWORD PTR [rip+0x19fc],0x1        # 405b1c <pending_large_object_compact>
  40411d:	00 00 00 
  404120:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000404130 <heap_size_in_pages>:
int heap_size_in_pages()
{
  404130:	f3 0f 1e fa          	endbr64 
  404134:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  404138:	31 ff                	xor    edi,edi
  40413a:	e8 f1 d0 ff ff       	call   401230 <sbrk>
  40413f:	48 c7 c2 90 5b 40 00 	mov    rdx,0x405b90
  404146:	2b 02                	sub    eax,DWORD PTR [rdx]
  404148:	48 83 c4 08          	add    rsp,0x8
  40414c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

000000000040414d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  40414d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000404150 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  404150:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404152:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  404154:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  404156:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  40415d:	55                   	push   rbp
  40415e:	48 89 f5             	mov    rbp,rsi
  404161:	53                   	push   rbx
  404162:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404166:	e8 c5 ff ff ff       	call   404130 <heap_size_in_pages>
	if(!walloc_heap_size)
  40416b:	48 8b 3d ae 19 00 00 	mov    rdi,QWORD PTR [rip+0x19ae]        # 405b20 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404172:	c1 e0 10             	shl    eax,0x10
  404175:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  404178:	48 85 ff             	test   rdi,rdi
  40417b:	75 63                	jne    4041e0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  40417d:	48 c7 c7 90 5b 40 00 	mov    rdi,0x405b90
  404184:	be 00 00 01 00       	mov    esi,0x10000
  404189:	e8 a2 fc ff ff       	call   403e30 <align>
		walloc_heap_size = preallocated;
  40418e:	48 89 1d 8b 19 00 00 	mov    QWORD PTR [rip+0x198b],rbx        # 405b20 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  404195:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  404198:	49 39 dc             	cmp    r12,rbx
  40419b:	0f 87 94 00 00 00    	ja     404235 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  4041a1:	48 85 db             	test   rbx,rbx
  4041a4:	0f 84 a3 ff ff ff    	je     40414d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  4041aa:	be 00 00 01 00       	mov    esi,0x10000
  4041af:	48 89 df             	mov    rdi,rbx
  4041b2:	e8 79 fc ff ff       	call   403e30 <align>
  4041b7:	48 39 c3             	cmp    rbx,rax
  4041ba:	0f 85 8d ff ff ff    	jne    40414d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  4041c0:	48 c1 eb 10          	shr    rbx,0x10
  4041c4:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  4041c8:	48 83 c4 08          	add    rsp,0x8
  4041cc:	4c 89 c0             	mov    rax,r8
  4041cf:	5b                   	pop    rbx
  4041d0:	5d                   	pop    rbp
  4041d1:	41 5c                	pop    r12
  4041d3:	41 5d                	pop    r13
  4041d5:	c3                   	ret    
  4041d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4041dd:	00 00 00 
	if(preallocated < needed)
  4041e0:	4d 85 e4             	test   r12,r12
  4041e3:	74 5e                	je     404243 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  4041e5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  4041e8:	4c 89 e6             	mov    rsi,r12
  4041eb:	48 d1 ef             	shr    rdi,1
  4041ee:	e8 2d fc ff ff       	call   403e20 <max>
  4041f3:	be 00 00 01 00       	mov    esi,0x10000
  4041f8:	48 89 c7             	mov    rdi,rax
  4041fb:	e8 30 fc ff ff       	call   403e30 <align>
  404200:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  404203:	48 85 c0             	test   rax,rax
  404206:	0f 84 41 ff ff ff    	je     40414d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  40420c:	48 89 c7             	mov    rdi,rax
  40420f:	e8 1c d0 ff ff       	call   401230 <sbrk>
  404214:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  404218:	74 16                	je     404230 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  40421a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  40421d:	4c 01 25 fc 18 00 00 	add    QWORD PTR [rip+0x18fc],r12        # 405b20 <walloc_heap_size>
	size_t size = grow + preallocated;
  404224:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  404228:	e9 74 ff ff ff       	jmp    4041a1 <allocate_pages.constprop.0+0x51>
  40422d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  404230:	45 31 c0             	xor    r8d,r8d
  404233:	eb 93                	jmp    4041c8 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  404235:	49 29 dc             	sub    r12,rbx
  404238:	48 89 df             	mov    rdi,rbx
  40423b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  40423e:	48 89 c3             	mov    rbx,rax
  404241:	eb a5                	jmp    4041e8 <allocate_pages.constprop.0+0x98>
  404243:	e9 05 ff ff ff       	jmp    40414d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000404248 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  404248:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000404250 <allocate_large_object>:
{
  404250:	41 54                	push   r12
  404252:	55                   	push   rbp
  404253:	53                   	push   rbx
  404254:	48 89 fb             	mov    rbx,rdi
  404257:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  40425b:	e8 f0 fd ff ff       	call   404050 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404260:	48 8b 15 c1 18 00 00 	mov    rdx,QWORD PTR [rip+0x18c1]        # 405b28 <large_objects>
  404267:	48 85 d2             	test   rdx,rdx
  40426a:	0f 84 da 01 00 00    	je     40444a <allocate_large_object+0x1fa>
  404270:	4c 8d 0d b1 18 00 00 	lea    r9,[rip+0x18b1]        # 405b28 <large_objects>
	size_t best_size = -1;
  404277:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  40427e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  404282:	45 31 d2             	xor    r10d,r10d
  404285:	4c 89 cd             	mov    rbp,r9
  404288:	eb 11                	jmp    40429b <allocate_large_object+0x4b>
  40428a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  404290:	49 89 d1             	mov    r9,rdx
  404293:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404296:	48 85 d2             	test   rdx,rdx
  404299:	74 39                	je     4042d4 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40429b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40429f:	4c 39 c1             	cmp    rcx,r8
  4042a2:	73 ec                	jae    404290 <allocate_large_object+0x40>
  4042a4:	48 39 d9             	cmp    rcx,rbx
  4042a7:	72 e7                	jb     404290 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  4042a9:	be 00 01 00 00       	mov    esi,0x100
  4042ae:	e8 7d fb ff ff       	call   403e30 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  4042b3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  4042b7:	48 39 c6             	cmp    rsi,rax
  4042ba:	0f 84 88 02 00 00    	je     404548 <allocate_large_object+0x2f8>
  4042c0:	4c 89 cd             	mov    rbp,r9
  4042c3:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  4042c6:	49 89 d1             	mov    r9,rdx
  4042c9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  4042cc:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4042cf:	48 85 d2             	test   rdx,rdx
  4042d2:	75 c7                	jne    40429b <allocate_large_object+0x4b>
	if(!best)
  4042d4:	4d 85 d2             	test   r10,r10
  4042d7:	0f 84 7b 01 00 00    	je     404458 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4042dd:	4c 89 d7             	mov    rdi,r10
  4042e0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4042e5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4042e8:	e8 13 fc ff ff       	call   403f00 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4042ed:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4042f0:	89 c6                	mov    esi,eax
  4042f2:	e8 f9 fb ff ff       	call   403ef0 <get_page>
  4042f7:	48 89 c7             	mov    rdi,rax
  4042fa:	49 89 c1             	mov    r9,rax
  4042fd:	e8 2e fc ff ff       	call   403f30 <allocate_chunk>
	struct large_object* next = best->next;
  404302:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  404305:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  404309:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  404310:	75 36                	jne    404348 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  404312:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  404316:	4c 89 d7             	mov    rdi,r10
  404319:	be 00 01 00 00       	mov    esi,0x100
  40431e:	e8 ed fb ff ff       	call   403f10 <get_large_object_payload>
  404323:	48 01 c2             	add    rdx,rax
  404326:	48 89 d7             	mov    rdi,rdx
  404329:	e8 02 fb ff ff       	call   403e30 <align>
  40432e:	48 39 c2             	cmp    rdx,rax
  404331:	0f 85 11 ff ff ff    	jne    404248 <allocate_large_object.cold>
}
  404337:	48 83 c4 10          	add    rsp,0x10
  40433b:	4c 89 d0             	mov    rax,r10
  40433e:	5b                   	pop    rbx
  40433f:	5d                   	pop    rbp
  404340:	41 5c                	pop    r12
  404342:	c3                   	ret    
  404343:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  404348:	4c 89 d7             	mov    rdi,r10
  40434b:	e8 c0 fb ff ff       	call   403f10 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  404350:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  404353:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  404357:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  40435a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  40435d:	4c 01 df             	add    rdi,r11
  404360:	e8 8b fb ff ff       	call   403ef0 <get_page>
  404365:	49 39 c1             	cmp    r9,rax
  404368:	0f 84 e8 01 00 00    	je     404556 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  40436e:	be 00 00 01 00       	mov    esi,0x10000
  404373:	4c 89 df             	mov    rdi,r11
  404376:	e8 b5 fa ff ff       	call   403e30 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40437b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  404382:	0f 86 38 01 00 00    	jbe    4044c0 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404388:	4c 39 d8             	cmp    rax,r11
  40438b:	0f 85 b7 fe ff ff    	jne    404248 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404391:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404394:	be 00 00 01 00       	mov    esi,0x10000
  404399:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  4043a0:	ff 
			tail_size = best_size - size;
  4043a1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  4043a8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  4043a9:	e8 82 fa ff ff       	call   403e30 <align>
		best->size -= tail_size;
  4043ae:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  4043b2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  4043b5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4043b8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  4043bb:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4043bf:	48 29 cf             	sub    rdi,rcx
  4043c2:	e8 39 fb ff ff       	call   403f00 <get_chunk_index>
  4043c7:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  4043c9:	48 85 c9             	test   rcx,rcx
  4043cc:	0f 84 44 ff ff ff    	je     404316 <allocate_large_object+0xc6>
  4043d2:	85 c0                	test   eax,eax
  4043d4:	75 0c                	jne    4043e2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  4043d6:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  4043dd:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  4043e2:	48 85 c9             	test   rcx,rcx
  4043e5:	0f 84 2b ff ff ff    	je     404316 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  4043eb:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4043ee:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  4043f3:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4043f6:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  4043fa:	e8 f1 fa ff ff       	call   403ef0 <get_page>
  4043ff:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  404402:	e8 29 fb ff ff       	call   403f30 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404407:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  40440c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  40440f:	48 8b 05 12 17 00 00 	mov    rax,QWORD PTR [rip+0x1712]        # 405b28 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404416:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  40441a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  40441d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404420:	e8 eb fa ff ff       	call   403f10 <get_large_object_payload>
  404425:	48 01 c1             	add    rcx,rax
  404428:	48 89 cf             	mov    rdi,rcx
  40442b:	e8 00 fa ff ff       	call   403e30 <align>
  404430:	48 39 c1             	cmp    rcx,rax
  404433:	0f 85 0f fe ff ff    	jne    404248 <allocate_large_object.cold>
			large_objects = tail;
  404439:	48 89 15 e8 16 00 00 	mov    QWORD PTR [rip+0x16e8],rdx        # 405b28 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404440:	e8 fb fa ff ff       	call   403f40 <maybe_repurpose_single_chunk_large_objects_head>
  404445:	e9 c8 fe ff ff       	jmp    404312 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  40444a:	48 8d 2d d7 16 00 00 	lea    rbp,[rip+0x16d7]        # 405b28 <large_objects>
  404451:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  404458:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40445c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  404461:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  404468:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40446a:	4c 89 e7             	mov    rdi,r12
  40446d:	e8 de fc ff ff       	call   404150 <allocate_pages.constprop.0>
  404472:	48 89 c1             	mov    rcx,rax
		if(!page)
  404475:	48 85 c0             	test   rax,rax
  404478:	0f 84 10 01 00 00    	je     40458e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40447e:	ba ff 00 00 00       	mov    edx,0xff
  404483:	be 01 00 00 00       	mov    esi,0x1
  404488:	48 89 c7             	mov    rdi,rax
  40448b:	e8 a0 fa ff ff       	call   403f30 <allocate_chunk>
  404490:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  404493:	48 8b 05 8e 16 00 00 	mov    rax,QWORD PTR [rip+0x168e]        # 405b28 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40449a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40449d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  4044a0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  4044a5:	48 c1 e0 10          	shl    rax,0x10
  4044a9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  4044ae:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  4044b2:	4d 39 c4             	cmp    r12,r8
  4044b5:	0f 86 22 fe ff ff    	jbe    4042dd <allocate_large_object+0x8d>
  4044bb:	e9 88 fd ff ff       	jmp    404248 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4044c0:	4c 39 d8             	cmp    rax,r11
  4044c3:	0f 85 7f fd ff ff    	jne    404248 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4044c9:	48 89 ef             	mov    rdi,rbp
  4044cc:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4044d1:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4044d5:	e8 26 fa ff ff       	call   403f00 <get_chunk_index>
  4044da:	4c 89 cf             	mov    rdi,r9
  4044dd:	89 c6                	mov    esi,eax
  4044df:	e8 4c fa ff ff       	call   403f30 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4044e4:	b8 00 00 01 00       	mov    eax,0x10000
  4044e9:	4c 29 e0             	sub    rax,r12
  4044ec:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  4044f0:	48 8b 05 31 16 00 00 	mov    rax,QWORD PTR [rip+0x1631]        # 405b28 <large_objects>
  4044f7:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  4044fa:	4c 89 15 27 16 00 00 	mov    QWORD PTR [rip+0x1627],r10        # 405b28 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404501:	e8 3a fa ff ff       	call   403f40 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404506:	ba ff 00 00 00       	mov    edx,0xff
  40450b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  404510:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404517:	e8 14 fa ff ff       	call   403f30 <allocate_chunk>
			best->size = best_size =
  40451c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  404523:	ff 
  404524:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404528:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40452b:	48 39 d3             	cmp    rbx,rdx
  40452e:	0f 87 14 fd ff ff    	ja     404248 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  404534:	48 89 d1             	mov    rcx,rdx
  404537:	48 29 d9             	sub    rcx,rbx
  40453a:	30 c9                	xor    cl,cl
  40453c:	e9 74 fe ff ff       	jmp    4043b5 <allocate_large_object+0x165>
  404541:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404548:	4c 89 cd             	mov    rbp,r9
  40454b:	49 89 c8             	mov    r8,rcx
  40454e:	49 89 d2             	mov    r10,rdx
  404551:	e9 87 fd ff ff       	jmp    4042dd <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404556:	be 00 01 00 00       	mov    esi,0x100
  40455b:	4c 89 df             	mov    rdi,r11
  40455e:	e8 cd f8 ff ff       	call   403e30 <align>
  404563:	49 39 c3             	cmp    r11,rax
  404566:	0f 85 dc fc ff ff    	jne    404248 <allocate_large_object.cold>
		best->size -= tail_size;
  40456c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404570:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  404573:	48 29 ca             	sub    rdx,rcx
  404576:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40457a:	e8 81 f9 ff ff       	call   403f00 <get_chunk_index>
  40457f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404581:	85 c0                	test   eax,eax
  404583:	0f 84 4d fe ff ff    	je     4043d6 <allocate_large_object+0x186>
  404589:	e9 5d fe ff ff       	jmp    4043eb <allocate_large_object+0x19b>
			return NULL;
  40458e:	45 31 d2             	xor    r10d,r10d
  404591:	e9 a1 fd ff ff       	jmp    404337 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

00000000004045a0 <allocate_large>:
{
  4045a0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  4045a4:	e8 a7 fc ff ff       	call   404250 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  4045a9:	48 85 c0             	test   rax,rax
  4045ac:	74 12                	je     4045c0 <allocate_large+0x20>
  4045ae:	48 89 c7             	mov    rdi,rax
}
  4045b1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  4045b5:	e9 56 f9 ff ff       	jmp    403f10 <get_large_object_payload>
  4045ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  4045c0:	31 c0                	xor    eax,eax
  4045c2:	48 83 c4 08          	add    rsp,0x8
  4045c6:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

00000000004045d0 <obtain_small_objects>:
{
  4045d0:	55                   	push   rbp
  4045d1:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  4045d3:	48 8b 3d ae 15 00 00 	mov    rdi,QWORD PTR [rip+0x15ae]        # 405b88 <small_object_freelists+0x48>
  4045da:	48 85 ff             	test   rdi,rdi
  4045dd:	74 71                	je     404650 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  4045df:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4045e2:	48 89 05 9f 15 00 00 	mov    QWORD PTR [rip+0x159f],rax        # 405b88 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4045e9:	e8 12 f9 ff ff       	call   403f00 <get_chunk_index>
  4045ee:	89 ea                	mov    edx,ebp
  4045f0:	89 c6                	mov    esi,eax
  4045f2:	e8 f9 f8 ff ff       	call   403ef0 <get_page>
  4045f7:	48 89 c7             	mov    rdi,rax
  4045fa:	e8 31 f9 ff ff       	call   403f30 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4045ff:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  404601:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  404604:	e8 c7 f8 ff ff       	call   403ed0 <chunk_kind_to_granules>
  404609:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404610:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  404617:	77 46                	ja     40465f <obtain_small_objects+0x8f>
  404619:	48 89 d0             	mov    rax,rdx
  40461c:	48 89 f1             	mov    rcx,rsi
  40461f:	48 29 f0             	sub    rax,rsi
  404622:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  404629:	31 c0                	xor    eax,eax
  40462b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  404630:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404633:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  404636:	48 89 d0             	mov    rax,rdx
		head->next = next;
  404639:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  40463c:	48 29 f2             	sub    rdx,rsi
  40463f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  404646:	76 e8                	jbe    404630 <obtain_small_objects+0x60>
}
  404648:	5d                   	pop    rbp
  404649:	c3                   	ret    
  40464a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  404650:	31 ff                	xor    edi,edi
  404652:	e8 f9 fb ff ff       	call   404250 <allocate_large_object>
  404657:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40465a:	48 85 c0             	test   rax,rax
  40465d:	75 8a                	jne    4045e9 <obtain_small_objects+0x19>
			return NULL;
  40465f:	31 c0                	xor    eax,eax
}
  404661:	5d                   	pop    rbp
  404662:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000404670 <allocate_small>:
{
  404670:	53                   	push   rbx
  404671:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  404674:	e8 17 fa ff ff       	call   404090 <get_small_object_freelist>
  404679:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40467c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40467f:	48 85 c0             	test   rax,rax
  404682:	74 0c                	je     404690 <allocate_small+0x20>
	*loc = ret->next;
  404684:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404687:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40468a:	5b                   	pop    rbx
  40468b:	c3                   	ret    
  40468c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  404690:	44 89 c7             	mov    edi,r8d
  404693:	e8 38 ff ff ff       	call   4045d0 <obtain_small_objects>
		if(!freelist)
  404698:	48 85 c0             	test   rax,rax
  40469b:	74 ed                	je     40468a <allocate_small+0x1a>
		*loc = freelist;
  40469d:	48 89 03             	mov    QWORD PTR [rbx],rax
  4046a0:	eb e2                	jmp    404684 <allocate_small+0x14>

Disassembly of section .text.malloc:

00000000004046b0 <malloc>:
{
  4046b0:	f3 0f 1e fa          	endbr64 
  4046b4:	48 83 ec 08          	sub    rsp,0x8
  4046b8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  4046bb:	e8 d0 f8 ff ff       	call   403f90 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  4046c0:	89 c7                	mov    edi,eax
  4046c2:	e8 79 f7 ff ff       	call   403e40 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4046c7:	3d ff 00 00 00       	cmp    eax,0xff
  4046cc:	74 12                	je     4046e0 <malloc+0x30>
  4046ce:	89 c7                	mov    edi,eax
}
  4046d0:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4046d4:	e9 97 ff ff ff       	jmp    404670 <allocate_small>
  4046d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4046e0:	4c 89 c7             	mov    rdi,r8
}
  4046e3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4046e7:	e9 b4 fe ff ff       	jmp    4045a0 <allocate_large>

Disassembly of section .text.memcpy:

00000000004046f0 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  4046f0:	f3 0f 1e fa          	endbr64 
  4046f4:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  4046f7:	48 85 d2             	test   rdx,rdx
  4046fa:	74 6c                	je     404768 <memcpy+0x78>
  4046fc:	48 89 f0             	mov    rax,rsi
  4046ff:	48 39 f7             	cmp    rdi,rsi
  404702:	74 64                	je     404768 <memcpy+0x78>
  404704:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  404707:	73 67                	jae    404770 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  404709:	48 89 fa             	mov    rdx,rdi
  40470c:	48 09 f2             	or     rdx,rsi
  40470f:	83 e2 03             	and    edx,0x3
  404712:	0f 85 e8 00 00 00    	jne    404800 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  404718:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  40471b:	49 89 c9             	mov    r9,rcx
  40471e:	4c 89 c6             	mov    rsi,r8
  404721:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  404724:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404728:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  40472c:	49 83 fa 03          	cmp    r10,0x3
  404730:	76 1f                	jbe    404751 <memcpy+0x61>
  404732:	31 d2                	xor    edx,edx
  404734:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  404738:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  40473b:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  40473e:	48 83 c2 01          	add    rdx,0x1
  404742:	48 39 d7             	cmp    rdi,rdx
  404745:	75 f1                	jne    404738 <memcpy+0x48>
  404747:	48 c1 e7 02          	shl    rdi,0x2
  40474b:	48 01 f8             	add    rax,rdi
  40474e:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  404751:	4d 85 c9             	test   r9,r9
  404754:	74 12                	je     404768 <memcpy+0x78>
  404756:	31 d2                	xor    edx,edx
  404758:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  40475c:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  40475f:	48 83 c2 01          	add    rdx,0x1
  404763:	49 39 d1             	cmp    r9,rdx
  404766:	75 f0                	jne    404758 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  404768:	4c 89 c0             	mov    rax,r8
  40476b:	c3                   	ret    
  40476c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  404770:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  404774:	48 01 d0             	add    rax,rdx
{
  404777:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  404778:	4c 89 ca             	mov    rdx,r9
{
  40477b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  40477c:	48 09 c2             	or     rdx,rax
  40477f:	83 e2 03             	and    edx,0x3
  404782:	0f 84 b8 00 00 00    	je     404840 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  404788:	4c 89 ca             	mov    rdx,r9
  40478b:	48 31 c2             	xor    rdx,rax
  40478e:	83 e2 03             	and    edx,0x3
  404791:	75 0a                	jne    40479d <memcpy+0xad>
  404793:	48 83 f9 04          	cmp    rcx,0x4
  404797:	0f 87 13 01 00 00    	ja     4048b0 <memcpy+0x1c0>
  40479d:	31 db                	xor    ebx,ebx
  40479f:	31 d2                	xor    edx,edx
  4047a1:	31 ed                	xor    ebp,ebp
			length -= t;
  4047a3:	48 89 ce             	mov    rsi,rcx
  4047a6:	48 f7 de             	neg    rsi
  4047a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  4047b0:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  4047b4:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  4047b8:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  4047be:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  4047c3:	48 83 e9 01          	sub    rcx,0x1
  4047c7:	75 e7                	jne    4047b0 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  4047c9:	48 83 fd 03          	cmp    rbp,0x3
  4047cd:	0f 87 8d 00 00 00    	ja     404860 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  4047d3:	48 85 db             	test   rbx,rbx
  4047d6:	74 1c                	je     4047f4 <memcpy+0x104>
  4047d8:	48 f7 d3             	not    rbx
  4047db:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  4047e2:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  4047e7:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  4047eb:	48 83 e8 01          	sub    rax,0x1
  4047ef:	48 39 d8             	cmp    rax,rbx
  4047f2:	75 ee                	jne    4047e2 <memcpy+0xf2>
}
  4047f4:	4c 89 c0             	mov    rax,r8
  4047f7:	5b                   	pop    rbx
  4047f8:	5d                   	pop    rbp
  4047f9:	c3                   	ret    
  4047fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  404800:	48 89 fa             	mov    rdx,rdi
  404803:	48 31 f2             	xor    rdx,rsi
  404806:	83 e2 03             	and    edx,0x3
  404809:	75 06                	jne    404811 <memcpy+0x121>
  40480b:	48 83 f9 03          	cmp    rcx,0x3
  40480f:	77 77                	ja     404888 <memcpy+0x198>
  404811:	45 31 c9             	xor    r9d,r9d
  404814:	31 ff                	xor    edi,edi
  404816:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  404819:	31 d2                	xor    edx,edx
  40481b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  404820:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  404824:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  404828:	48 83 c2 01          	add    rdx,0x1
  40482c:	48 39 d1             	cmp    rcx,rdx
  40482f:	75 ef                	jne    404820 <memcpy+0x130>
  404831:	48 01 c8             	add    rax,rcx
  404834:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  404838:	e9 ef fe ff ff       	jmp    40472c <memcpy+0x3c>
  40483d:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  404840:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  404843:	48 89 cb             	mov    rbx,rcx
  404846:	48 89 cd             	mov    rbp,rcx
		src += length;
  404849:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  40484c:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404850:	83 e3 03             	and    ebx,0x3
		dst += length;
  404853:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404856:	48 83 fd 03          	cmp    rbp,0x3
  40485a:	0f 86 73 ff ff ff    	jbe    4047d3 <memcpy+0xe3>
  404860:	48 89 d0             	mov    rax,rdx
  404863:	48 f7 d8             	neg    rax
  404866:	48 c1 e0 02          	shl    rax,0x2
  40486a:	49 01 c3             	add    r11,rax
  40486d:	49 01 c2             	add    r10,rax
  404870:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  404875:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  40487a:	48 83 ea 01          	sub    rdx,0x1
  40487e:	75 f0                	jne    404870 <memcpy+0x180>
  404880:	e9 4e ff ff ff       	jmp    4047d3 <memcpy+0xe3>
  404885:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  404888:	48 89 f2             	mov    rdx,rsi
  40488b:	83 e2 03             	and    edx,0x3
			length -= t;
  40488e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  404893:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  404898:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  40489b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  40489e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  4048a1:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  4048a5:	41 83 e1 03          	and    r9d,0x3
  4048a9:	e9 6b ff ff ff       	jmp    404819 <memcpy+0x129>
  4048ae:	66 90                	xchg   ax,ax
				t &= wmask;
  4048b0:	48 89 c6             	mov    rsi,rax
  4048b3:	83 e6 03             	and    esi,0x3
			length -= t;
  4048b6:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  4048b9:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  4048bc:	48 89 cb             	mov    rbx,rcx
			length -= t;
  4048bf:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  4048c2:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  4048c5:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  4048c9:	83 e3 03             	and    ebx,0x3
  4048cc:	e9 d2 fe ff ff       	jmp    4047a3 <memcpy+0xb3>
