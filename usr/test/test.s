
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
  400052:	48 8b 05 0f 5c 00 00 	mov    rax,QWORD PTR [rip+0x5c0f]        # 405c68 <shellcontent>
  400059:	ba 80 00 00 00       	mov    edx,0x80
  40005e:	48 8d 0d 7b 5b 00 00 	lea    rcx,[rip+0x5b7b]        # 405be0 <text>
  400065:	48 89 ce             	mov    rsi,rcx
  400068:	48 89 c7             	mov    rdi,rax
  40006b:	e8 f0 17 00 00       	call   401860 <get_window_text>
    strcat(text, "enter pressed\n");
  400070:	48 8d 05 69 5b 00 00 	lea    rax,[rip+0x5b69]        # 405be0 <text>
  400077:	48 89 c7             	mov    rdi,rax
  40007a:	e8 f1 19 00 00       	call   401a70 <strlen>
  40007f:	48 89 c2             	mov    rdx,rax
  400082:	48 8d 05 57 5b 00 00 	lea    rax,[rip+0x5b57]        # 405be0 <text>
  400089:	48 01 d0             	add    rax,rdx
  40008c:	48 b9 65 6e 74 65 72 	movabs rcx,0x7270207265746e65
  400093:	20 70 72 
  400096:	48 89 08             	mov    QWORD PTR [rax],rcx
  400099:	c7 40 08 65 73 73 65 	mov    DWORD PTR [rax+0x8],0x65737365
  4000a0:	66 c7 40 0c 64 0a    	mov    WORD PTR [rax+0xc],0xa64
  4000a6:	c6 40 0e 00          	mov    BYTE PTR [rax+0xe],0x0
    set_window_text(shellcontent, text);
  4000aa:	48 8b 05 b7 5b 00 00 	mov    rax,QWORD PTR [rip+0x5bb7]        # 405c68 <shellcontent>
  4000b1:	48 8d 15 28 5b 00 00 	lea    rdx,[rip+0x5b28]        # 405be0 <text>
  4000b8:	48 89 d6             	mov    rsi,rdx
  4000bb:	48 89 c7             	mov    rdi,rax
  4000be:	e8 3d 17 00 00       	call   401800 <set_window_text>
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
  4000ea:	48 8d 05 5f 58 00 00 	lea    rax,[rip+0x585f]        # 405950 <b+0x4>
  4000f1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    puts("Gamessis OS shell\n");
  4000f5:	48 8d 05 5b 58 00 00 	lea    rax,[rip+0x585b]        # 405957 <b+0xb>
  4000fc:	48 89 c7             	mov    rdi,rax
  4000ff:	e8 8c 17 00 00       	call   401890 <puts>
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
                break;
            default: default_deal_window_event(&event); break;
            }
        }
    } */
    int child = fork();
  400264:	e8 87 14 00 00       	call   4016f0 <fork>
  400269:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if (child != 0) {
  40026c:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  400270:	74 50                	je     4002c2 <main+0x1fc>
        // parent
        send_signal(child, SIGINT);
  400272:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  400275:	be 02 00 00 00       	mov    esi,0x2
  40027a:	89 c7                	mov    edi,eax
  40027c:	e8 dd 0d 00 00       	call   40105e <send_signal>
        int stat = 0;
  400281:	c7 85 74 fe ff ff 00 	mov    DWORD PTR [rbp-0x18c],0x0
  400288:	00 00 00 
        waitpid(child, &stat, 0);
  40028b:	48 8d 8d 74 fe ff ff 	lea    rcx,[rbp-0x18c]
  400292:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  400295:	ba 00 00 00 00       	mov    edx,0x0
  40029a:	48 89 ce             	mov    rsi,rcx
  40029d:	89 c7                	mov    edi,eax
  40029f:	e8 6c 14 00 00       	call   401710 <waitpid>
        printf("Child process exited with status %d\n", stat);
  4002a4:	8b 85 74 fe ff ff    	mov    eax,DWORD PTR [rbp-0x18c]
  4002aa:	89 c6                	mov    esi,eax
  4002ac:	48 8d 05 bd 56 00 00 	lea    rax,[rip+0x56bd]        # 405970 <b+0x24>
  4002b3:	48 89 c7             	mov    rdi,rax
  4002b6:	b8 00 00 00 00       	mov    eax,0x0
  4002bb:	e8 a0 39 00 00       	call   403c60 <printf>
  4002c0:	eb 02                	jmp    4002c4 <main+0x1fe>
    }
    else {
        while (1) {}
  4002c2:	eb fe                	jmp    4002c2 <main+0x1fc>
    }
    while (1) {
        memset(cmd, 0, 128);
  4002c4:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4002cb:	ba 80 00 00 00       	mov    edx,0x80
  4002d0:	be 00 00 00 00       	mov    esi,0x0
  4002d5:	48 89 c7             	mov    rdi,rax
  4002d8:	e8 73 16 00 00       	call   401950 <memset>
        int p = 0;
  4002dd:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
        printf("%s:>", path);
  4002e4:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4002eb:	48 89 c6             	mov    rsi,rax
  4002ee:	48 8d 05 a0 56 00 00 	lea    rax,[rip+0x56a0]        # 405995 <b+0x49>
  4002f5:	48 89 c7             	mov    rdi,rax
  4002f8:	b8 00 00 00 00       	mov    eax,0x0
  4002fd:	e8 5e 39 00 00       	call   403c60 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400302:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400309:	48 89 c7             	mov    rdi,rax
  40030c:	e8 df 15 00 00       	call   4018f0 <gets>
        puts(cmd);
  400311:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400318:	48 89 c7             	mov    rdi,rax
  40031b:	e8 70 15 00 00       	call   401890 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400320:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400327:	48 8d 15 6c 56 00 00 	lea    rdx,[rip+0x566c]        # 40599a <b+0x4e>
  40032e:	48 89 d6             	mov    rsi,rdx
  400331:	48 89 c7             	mov    rdi,rax
  400334:	e8 e7 16 00 00       	call   401a20 <strcmp>
  400339:	85 c0                	test   eax,eax
  40033b:	75 14                	jne    400351 <main+0x28b>
            puts("Gamessis OS 1.0.\n");
  40033d:	48 8d 05 5e 56 00 00 	lea    rax,[rip+0x565e]        # 4059a2 <b+0x56>
  400344:	48 89 c7             	mov    rdi,rax
  400347:	e8 44 15 00 00       	call   401890 <puts>
  40034c:	e9 73 ff ff ff       	jmp    4002c4 <main+0x1fe>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400351:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400358:	48 8d 15 55 56 00 00 	lea    rdx,[rip+0x5655]        # 4059b4 <b+0x68>
  40035f:	48 89 d6             	mov    rsi,rdx
  400362:	48 89 c7             	mov    rdi,rax
  400365:	e8 b6 16 00 00       	call   401a20 <strcmp>
  40036a:	85 c0                	test   eax,eax
  40036c:	0f 84 e0 0c 00 00    	je     401052 <main+0xf8c>
            break;
        }
        else if (strcmp(cmd, "ls") == 0) {
  400372:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400379:	48 8d 15 39 56 00 00 	lea    rdx,[rip+0x5639]        # 4059b9 <b+0x6d>
  400380:	48 89 d6             	mov    rsi,rdx
  400383:	48 89 c7             	mov    rdi,rax
  400386:	e8 95 16 00 00       	call   401a20 <strcmp>
  40038b:	85 c0                	test   eax,eax
  40038d:	0f 85 92 00 00 00    	jne    400425 <main+0x35f>
            // ls
            getcwd(path, 128);
  400393:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  40039a:	be 80 00 00 00       	mov    esi,0x80
  40039f:	48 89 c7             	mov    rdi,rax
  4003a2:	b8 00 00 00 00       	mov    eax,0x0
  4003a7:	e8 ef 10 00 00       	call   40149b <getcwd>
            DIR*           dp = opendir(path);
  4003ac:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  4003b3:	48 89 c7             	mov    rdi,rax
  4003b6:	e8 1f 0d 00 00       	call   4010da <opendir>
  4003bb:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            struct dirent* dirp;
            if (!dp) {
  4003bf:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  4003c4:	75 38                	jne    4003fe <main+0x338>
                printf("error opening directory\n");
  4003c6:	48 8d 05 ef 55 00 00 	lea    rax,[rip+0x55ef]        # 4059bc <b+0x70>
  4003cd:	48 89 c7             	mov    rdi,rax
  4003d0:	b8 00 00 00 00       	mov    eax,0x0
  4003d5:	e8 86 38 00 00       	call   403c60 <printf>
                continue;
  4003da:	e9 6e 0c 00 00       	jmp    40104d <main+0xf87>
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
  4003df:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4003e3:	48 83 c0 18          	add    rax,0x18
  4003e7:	48 89 c6             	mov    rsi,rax
  4003ea:	48 8d 05 e4 55 00 00 	lea    rax,[rip+0x55e4]        # 4059d5 <b+0x89>
  4003f1:	48 89 c7             	mov    rdi,rax
  4003f4:	b8 00 00 00 00       	mov    eax,0x0
  4003f9:	e8 62 38 00 00       	call   403c60 <printf>
            while ((dirp = readdir(dp)) != NULL) {
  4003fe:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  400402:	48 89 c7             	mov    rdi,rax
  400405:	e8 56 0e 00 00       	call   401260 <readdir>
  40040a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  40040e:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  400413:	75 ca                	jne    4003df <main+0x319>
            }
            close(dp);
  400415:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  400419:	89 c7                	mov    edi,eax
  40041b:	e8 e0 11 00 00       	call   401600 <close>
  400420:	e9 9f fe ff ff       	jmp    4002c4 <main+0x1fe>
        }
        else if (strcmp(cmd, "cd") == 0) {
  400425:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40042c:	48 8d 15 a6 55 00 00 	lea    rdx,[rip+0x55a6]        # 4059d9 <b+0x8d>
  400433:	48 89 d6             	mov    rsi,rdx
  400436:	48 89 c7             	mov    rdi,rax
  400439:	e8 e2 15 00 00       	call   401a20 <strcmp>
  40043e:	85 c0                	test   eax,eax
  400440:	0f 85 1f 02 00 00    	jne    400665 <main+0x59f>
            // cd
            char tmppath[128] = {0};
  400446:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  40044d:	00 00 00 00 
  400451:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400458:	00 00 00 00 
  40045c:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400463:	00 00 00 00 
  400467:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  40046e:	00 00 00 00 
  400472:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400479:	00 00 00 00 
  40047d:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400484:	00 00 00 00 
  400488:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  40048f:	00 00 00 00 
  400493:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  40049a:	00 00 00 00 
  40049e:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4004a5:	00 00 00 00 
  4004a9:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4004b0:	00 00 00 00 
  4004b4:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4004bb:	00 00 00 00 
  4004bf:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  4004c6:	00 00 00 00 
  4004ca:	48 c7 85 44 fe ff ff 	mov    QWORD PTR [rbp-0x1bc],0x0
  4004d1:	00 00 00 00 
  4004d5:	48 c7 85 4c fe ff ff 	mov    QWORD PTR [rbp-0x1b4],0x0
  4004dc:	00 00 00 00 
  4004e0:	48 c7 85 54 fe ff ff 	mov    QWORD PTR [rbp-0x1ac],0x0
  4004e7:	00 00 00 00 
  4004eb:	48 c7 85 5c fe ff ff 	mov    QWORD PTR [rbp-0x1a4],0x0
  4004f2:	00 00 00 00 
            printf("enter path:");
  4004f6:	48 8d 05 df 54 00 00 	lea    rax,[rip+0x54df]        # 4059dc <b+0x90>
  4004fd:	48 89 c7             	mov    rdi,rax
  400500:	b8 00 00 00 00       	mov    eax,0x0
  400505:	e8 56 37 00 00       	call   403c60 <printf>
            // write(2, "enter path:", 11);
            gets(tmppath);
  40050a:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400511:	48 89 c7             	mov    rdi,rax
  400514:	e8 d7 13 00 00       	call   4018f0 <gets>
            if (chdir(tmppath) == -1) {
  400519:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400520:	48 89 c7             	mov    rdi,rax
  400523:	b8 00 00 00 00       	mov    eax,0x0
  400528:	e8 d3 0d 00 00       	call   401300 <chdir>
  40052d:	83 f8 ff             	cmp    eax,0xffffffff
  400530:	75 23                	jne    400555 <main+0x48f>
                printf("cannot find directory:%s\n", tmppath);
  400532:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400539:	48 89 c6             	mov    rsi,rax
  40053c:	48 8d 05 a5 54 00 00 	lea    rax,[rip+0x54a5]        # 4059e8 <b+0x9c>
  400543:	48 89 c7             	mov    rdi,rax
  400546:	b8 00 00 00 00       	mov    eax,0x0
  40054b:	e8 10 37 00 00       	call   403c60 <printf>
                continue;
  400550:	e9 f8 0a 00 00       	jmp    40104d <main+0xf87>

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(tmppath, "..") == 0) {
  400555:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40055c:	48 8d 15 9f 54 00 00 	lea    rdx,[rip+0x549f]        # 405a02 <b+0xb6>
  400563:	48 89 d6             	mov    rsi,rdx
  400566:	48 89 c7             	mov    rdi,rax
  400569:	e8 b2 14 00 00       	call   401a20 <strcmp>
  40056e:	85 c0                	test   eax,eax
  400570:	75 75                	jne    4005e7 <main+0x521>
                char* p = tmppath + strlen(tmppath) - 1;
  400572:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400579:	48 89 c7             	mov    rdi,rax
  40057c:	e8 ef 14 00 00       	call   401a70 <strlen>
  400581:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  400585:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40058c:	48 01 d0             	add    rax,rdx
  40058f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
                while (p > tmppath && *p == '/') {
  400593:	eb 0f                	jmp    4005a4 <main+0x4de>
                    *p-- = 0;
  400595:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  400599:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  40059d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4005a1:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *p == '/') {
  4005a4:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4005ab:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4005af:	76 1c                	jbe    4005cd <main+0x507>
  4005b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4005b5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005b8:	3c 2f                	cmp    al,0x2f
  4005ba:	74 d9                	je     400595 <main+0x4cf>
                }
                while (p > tmppath && *(p) != '/') {
  4005bc:	eb 0f                	jmp    4005cd <main+0x507>
                    *p-- = 0;
  4005be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4005c2:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  4005c6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  4005ca:	c6 00 00             	mov    BYTE PTR [rax],0x0
                while (p > tmppath && *(p) != '/') {
  4005cd:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4005d4:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  4005d8:	76 68                	jbe    400642 <main+0x57c>
  4005da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  4005de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005e1:	3c 2f                	cmp    al,0x2f
  4005e3:	75 d9                	jne    4005be <main+0x4f8>
  4005e5:	eb 5b                	jmp    400642 <main+0x57c>
                }
            }
            else if (strcmp(tmppath, ".") == 0) {
  4005e7:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4005ee:	48 8d 15 10 54 00 00 	lea    rdx,[rip+0x5410]        # 405a05 <b+0xb9>
  4005f5:	48 89 d6             	mov    rsi,rdx
  4005f8:	48 89 c7             	mov    rdi,rax
  4005fb:	e8 20 14 00 00       	call   401a20 <strcmp>
  400600:	85 c0                	test   eax,eax
  400602:	0f 84 44 0a 00 00    	je     40104c <main+0xf86>
                continue;
            }
            else {
                strcat(path, tmppath);
  400608:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  40060f:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400616:	48 89 d6             	mov    rsi,rdx
  400619:	48 89 c7             	mov    rdi,rax
  40061c:	e8 bf 13 00 00       	call   4019e0 <strcat>
                strcat(path, "/");
  400621:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  400628:	48 89 c7             	mov    rdi,rax
  40062b:	e8 40 14 00 00       	call   401a70 <strlen>
  400630:	48 89 c2             	mov    rdx,rax
  400633:	48 8d 85 78 fe ff ff 	lea    rax,[rbp-0x188]
  40063a:	48 01 d0             	add    rax,rdx
  40063d:	66 c7 00 2f 00       	mov    WORD PTR [rax],0x2f
            }
            printf("current directory:%s\n", tmppath);
  400642:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400649:	48 89 c6             	mov    rsi,rax
  40064c:	48 8d 05 b4 53 00 00 	lea    rax,[rip+0x53b4]        # 405a07 <b+0xbb>
  400653:	48 89 c7             	mov    rdi,rax
  400656:	b8 00 00 00 00       	mov    eax,0x0
  40065b:	e8 00 36 00 00       	call   403c60 <printf>
  400660:	e9 5f fc ff ff       	jmp    4002c4 <main+0x1fe>
        }
        else if (strcmp(cmd, "touch") == 0) {
  400665:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  40066c:	48 8d 15 aa 53 00 00 	lea    rdx,[rip+0x53aa]        # 405a1d <b+0xd1>
  400673:	48 89 d6             	mov    rsi,rdx
  400676:	48 89 c7             	mov    rdi,rax
  400679:	e8 a2 13 00 00       	call   401a20 <strcmp>
  40067e:	85 c0                	test   eax,eax
  400680:	0f 85 1e 01 00 00    	jne    4007a4 <main+0x6de>
            char path[100] = {0};
  400686:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  40068d:	00 00 00 00 
  400691:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400698:	00 00 00 00 
  40069c:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4006a3:	00 00 00 00 
  4006a7:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4006ae:	00 00 00 00 
  4006b2:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4006b9:	00 00 00 00 
  4006bd:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4006c4:	00 00 00 00 
  4006c8:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4006cf:	00 00 00 00 
  4006d3:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4006da:	00 00 00 00 
  4006de:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4006e5:	00 00 00 00 
  4006e9:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4006f0:	00 00 00 00 
  4006f4:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4006fb:	00 00 00 00 
  4006ff:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400706:	00 00 00 00 
  40070a:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400711:	00 00 00 
            printf("input path:");
  400714:	48 8d 05 08 53 00 00 	lea    rax,[rip+0x5308]        # 405a23 <b+0xd7>
  40071b:	48 89 c7             	mov    rdi,rax
  40071e:	b8 00 00 00 00       	mov    eax,0x0
  400723:	e8 38 35 00 00       	call   403c60 <printf>
            gets(path);
  400728:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40072f:	48 89 c7             	mov    rdi,rax
  400732:	e8 b9 11 00 00       	call   4018f0 <gets>
            int fd = creat(path, O_CREAT);
  400737:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40073e:	be 40 00 00 00       	mov    esi,0x40
  400743:	48 89 c7             	mov    rdi,rax
  400746:	e8 2c 0c 00 00       	call   401377 <creat>
  40074b:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
            if (fd < 0) {
  40074e:	83 7d b8 00          	cmp    DWORD PTR [rbp-0x48],0x0
  400752:	79 23                	jns    400777 <main+0x6b1>
                printf("create file %s failed\n", path);
  400754:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40075b:	48 89 c6             	mov    rsi,rax
  40075e:	48 8d 05 ca 52 00 00 	lea    rax,[rip+0x52ca]        # 405a2f <b+0xe3>
  400765:	48 89 c7             	mov    rdi,rax
  400768:	b8 00 00 00 00       	mov    eax,0x0
  40076d:	e8 ee 34 00 00       	call   403c60 <printf>
  400772:	e9 4d fb ff ff       	jmp    4002c4 <main+0x1fe>
            }
            else {
                printf("create file %s success\n", path);
  400777:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40077e:	48 89 c6             	mov    rsi,rax
  400781:	48 8d 05 be 52 00 00 	lea    rax,[rip+0x52be]        # 405a46 <b+0xfa>
  400788:	48 89 c7             	mov    rdi,rax
  40078b:	b8 00 00 00 00       	mov    eax,0x0
  400790:	e8 cb 34 00 00       	call   403c60 <printf>
                close(fd);
  400795:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  400798:	89 c7                	mov    edi,eax
  40079a:	e8 61 0e 00 00       	call   401600 <close>
  40079f:	e9 20 fb ff ff       	jmp    4002c4 <main+0x1fe>
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
  4007a4:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4007ab:	48 8d 15 ac 52 00 00 	lea    rdx,[rip+0x52ac]        # 405a5e <b+0x112>
  4007b2:	48 89 d6             	mov    rsi,rdx
  4007b5:	48 89 c7             	mov    rdi,rax
  4007b8:	e8 63 12 00 00       	call   401a20 <strcmp>
  4007bd:	85 c0                	test   eax,eax
  4007bf:	0f 85 0f 01 00 00    	jne    4008d4 <main+0x80e>
            char path[100] = {0};
  4007c5:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  4007cc:	00 00 00 00 
  4007d0:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  4007d7:	00 00 00 00 
  4007db:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4007e2:	00 00 00 00 
  4007e6:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4007ed:	00 00 00 00 
  4007f1:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4007f8:	00 00 00 00 
  4007fc:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400803:	00 00 00 00 
  400807:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  40080e:	00 00 00 00 
  400812:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400819:	00 00 00 00 
  40081d:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400824:	00 00 00 00 
  400828:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  40082f:	00 00 00 00 
  400833:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  40083a:	00 00 00 00 
  40083e:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400845:	00 00 00 00 
  400849:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400850:	00 00 00 
            printf("input path:");
  400853:	48 8d 05 c9 51 00 00 	lea    rax,[rip+0x51c9]        # 405a23 <b+0xd7>
  40085a:	48 89 c7             	mov    rdi,rax
  40085d:	b8 00 00 00 00       	mov    eax,0x0
  400862:	e8 f9 33 00 00       	call   403c60 <printf>
            gets(path);
  400867:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40086e:	48 89 c7             	mov    rdi,rax
  400871:	e8 7a 10 00 00       	call   4018f0 <gets>
            int stat = remove(path);
  400876:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  40087d:	48 89 c7             	mov    rdi,rax
  400880:	e8 db 0e 00 00       	call   401760 <remove>
  400885:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
            if (stat < 0) {
  400888:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  40088c:	79 23                	jns    4008b1 <main+0x7eb>
                printf("remove file/dir %s failed\n", path);
  40088e:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400895:	48 89 c6             	mov    rsi,rax
  400898:	48 8d 05 c2 51 00 00 	lea    rax,[rip+0x51c2]        # 405a61 <b+0x115>
  40089f:	48 89 c7             	mov    rdi,rax
  4008a2:	b8 00 00 00 00       	mov    eax,0x0
  4008a7:	e8 b4 33 00 00       	call   403c60 <printf>
  4008ac:	e9 13 fa ff ff       	jmp    4002c4 <main+0x1fe>
            }
            else {
                printf("remove file/dir %s success\n", path);
  4008b1:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  4008b8:	48 89 c6             	mov    rsi,rax
  4008bb:	48 8d 05 ba 51 00 00 	lea    rax,[rip+0x51ba]        # 405a7c <b+0x130>
  4008c2:	48 89 c7             	mov    rdi,rax
  4008c5:	b8 00 00 00 00       	mov    eax,0x0
  4008ca:	e8 91 33 00 00       	call   403c60 <printf>
  4008cf:	e9 f0 f9 ff ff       	jmp    4002c4 <main+0x1fe>
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
  4008d4:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  4008db:	48 8d 15 b6 51 00 00 	lea    rdx,[rip+0x51b6]        # 405a98 <b+0x14c>
  4008e2:	48 89 d6             	mov    rsi,rdx
  4008e5:	48 89 c7             	mov    rdi,rax
  4008e8:	e8 33 11 00 00       	call   401a20 <strcmp>
  4008ed:	85 c0                	test   eax,eax
  4008ef:	0f 85 d8 01 00 00    	jne    400acd <main+0xa07>
            char src[100] = {0};
  4008f5:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  4008fc:	00 00 00 00 
  400900:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400907:	00 00 00 00 
  40090b:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400912:	00 00 00 00 
  400916:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  40091d:	00 00 00 00 
  400921:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400928:	00 00 00 00 
  40092c:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400933:	00 00 00 00 
  400937:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  40093e:	00 00 00 00 
  400942:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400949:	00 00 00 00 
  40094d:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400954:	00 00 00 00 
  400958:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  40095f:	00 00 00 00 
  400963:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  40096a:	00 00 00 00 
  40096e:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400975:	00 00 00 00 
  400979:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  400980:	00 00 00 
            char dst[100] = {0};
  400983:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  40098a:	00 00 00 00 
  40098e:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400995:	00 00 00 00 
  400999:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  4009a0:	00 00 00 00 
  4009a4:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  4009ab:	00 00 00 00 
  4009af:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  4009b6:	00 00 00 00 
  4009ba:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  4009c1:	00 00 00 00 
  4009c5:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  4009cc:	00 00 00 00 
  4009d0:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  4009d7:	00 00 00 00 
  4009db:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  4009e2:	00 00 00 00 
  4009e6:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  4009ed:	00 00 00 00 
  4009f1:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  4009f8:	00 00 00 00 
  4009fc:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400a03:	00 00 00 00 
  400a07:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400a0e:	00 00 00 
            printf("input src path:");
  400a11:	48 8d 05 83 50 00 00 	lea    rax,[rip+0x5083]        # 405a9b <b+0x14f>
  400a18:	48 89 c7             	mov    rdi,rax
  400a1b:	b8 00 00 00 00       	mov    eax,0x0
  400a20:	e8 3b 32 00 00       	call   403c60 <printf>
            gets(src);
  400a25:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400a2c:	48 89 c7             	mov    rdi,rax
  400a2f:	e8 bc 0e 00 00       	call   4018f0 <gets>
            printf("input dst path:");
  400a34:	48 8d 05 70 50 00 00 	lea    rax,[rip+0x5070]        # 405aab <b+0x15f>
  400a3b:	48 89 c7             	mov    rdi,rax
  400a3e:	b8 00 00 00 00       	mov    eax,0x0
  400a43:	e8 18 32 00 00       	call   403c60 <printf>
            gets(dst);
  400a48:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400a4f:	48 89 c7             	mov    rdi,rax
  400a52:	e8 99 0e 00 00       	call   4018f0 <gets>
            int stat = rename(src, dst);
  400a57:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  400a5e:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400a65:	48 89 d6             	mov    rsi,rdx
  400a68:	48 89 c7             	mov    rdi,rax
  400a6b:	e8 b0 09 00 00       	call   401420 <rename>
  400a70:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
            if (stat < 0) {
  400a73:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  400a77:	79 2a                	jns    400aa3 <main+0x9dd>
                printf("move file/dir %s to %s failed\n", src, dst);
  400a79:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  400a80:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400a87:	48 89 c6             	mov    rsi,rax
  400a8a:	48 8d 05 2f 50 00 00 	lea    rax,[rip+0x502f]        # 405ac0 <b+0x174>
  400a91:	48 89 c7             	mov    rdi,rax
  400a94:	b8 00 00 00 00       	mov    eax,0x0
  400a99:	e8 c2 31 00 00       	call   403c60 <printf>
  400a9e:	e9 21 f8 ff ff       	jmp    4002c4 <main+0x1fe>
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
  400aa3:	48 8d 95 e4 fd ff ff 	lea    rdx,[rbp-0x21c]
  400aaa:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400ab1:	48 89 c6             	mov    rsi,rax
  400ab4:	48 8d 05 25 50 00 00 	lea    rax,[rip+0x5025]        # 405ae0 <b+0x194>
  400abb:	48 89 c7             	mov    rdi,rax
  400abe:	b8 00 00 00 00       	mov    eax,0x0
  400ac3:	e8 98 31 00 00       	call   403c60 <printf>
  400ac8:	e9 f7 f7 ff ff       	jmp    4002c4 <main+0x1fe>
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
  400acd:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ad4:	48 8d 15 25 50 00 00 	lea    rdx,[rip+0x5025]        # 405b00 <b+0x1b4>
  400adb:	48 89 d6             	mov    rsi,rdx
  400ade:	48 89 c7             	mov    rdi,rax
  400ae1:	e8 3a 0f 00 00       	call   401a20 <strcmp>
  400ae6:	85 c0                	test   eax,eax
  400ae8:	0f 85 eb 01 00 00    	jne    400cd9 <main+0xc13>
            char path[100] = {0};
  400aee:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  400af5:	00 00 00 00 
  400af9:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400b00:	00 00 00 00 
  400b04:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400b0b:	00 00 00 00 
  400b0f:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400b16:	00 00 00 00 
  400b1a:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400b21:	00 00 00 00 
  400b25:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400b2c:	00 00 00 00 
  400b30:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400b37:	00 00 00 00 
  400b3b:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400b42:	00 00 00 00 
  400b46:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400b4d:	00 00 00 00 
  400b51:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400b58:	00 00 00 00 
  400b5c:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400b63:	00 00 00 00 
  400b67:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400b6e:	00 00 00 00 
  400b72:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  400b79:	00 00 00 
            printf("input path:");
  400b7c:	48 8d 05 a0 4e 00 00 	lea    rax,[rip+0x4ea0]        # 405a23 <b+0xd7>
  400b83:	48 89 c7             	mov    rdi,rax
  400b86:	b8 00 00 00 00       	mov    eax,0x0
  400b8b:	e8 d0 30 00 00       	call   403c60 <printf>
            gets(path);
  400b90:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400b97:	48 89 c7             	mov    rdi,rax
  400b9a:	e8 51 0d 00 00       	call   4018f0 <gets>
            int fd = open(path, O_RDONLY);
  400b9f:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400ba6:	be 00 00 00 00       	mov    esi,0x0
  400bab:	48 89 c7             	mov    rdi,rax
  400bae:	e8 3d 0a 00 00       	call   4015f0 <open>
  400bb3:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
            if (fd < 0) {
  400bb6:	83 7d c8 00          	cmp    DWORD PTR [rbp-0x38],0x0
  400bba:	79 23                	jns    400bdf <main+0xb19>
                printf("open file %s failed\n", path);
  400bbc:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400bc3:	48 89 c6             	mov    rsi,rax
  400bc6:	48 8d 05 37 4f 00 00 	lea    rax,[rip+0x4f37]        # 405b04 <b+0x1b8>
  400bcd:	48 89 c7             	mov    rdi,rax
  400bd0:	b8 00 00 00 00       	mov    eax,0x0
  400bd5:	e8 86 30 00 00       	call   403c60 <printf>
  400bda:	e9 e5 f6 ff ff       	jmp    4002c4 <main+0x1fe>
            }
            else {
                char buffer[100] = {0};
  400bdf:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  400be6:	00 00 00 00 
  400bea:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400bf1:	00 00 00 00 
  400bf5:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400bfc:	00 00 00 00 
  400c00:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400c07:	00 00 00 00 
  400c0b:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400c12:	00 00 00 00 
  400c16:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400c1d:	00 00 00 00 
  400c21:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400c28:	00 00 00 00 
  400c2c:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400c33:	00 00 00 00 
  400c37:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400c3e:	00 00 00 00 
  400c42:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400c49:	00 00 00 00 
  400c4d:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400c54:	00 00 00 00 
  400c58:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400c5f:	00 00 00 00 
  400c63:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400c6a:	00 00 00 
                int  len         = 0;
  400c6d:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                while ((len = read(fd, buffer, 100)) > 0) {
  400c74:	eb 1e                	jmp    400c94 <main+0xbce>
                    printf("%s", buffer);
  400c76:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400c7d:	48 89 c6             	mov    rsi,rax
  400c80:	48 8d 05 92 4e 00 00 	lea    rax,[rip+0x4e92]        # 405b19 <b+0x1cd>
  400c87:	48 89 c7             	mov    rdi,rax
  400c8a:	b8 00 00 00 00       	mov    eax,0x0
  400c8f:	e8 cc 2f 00 00       	call   403c60 <printf>
                while ((len = read(fd, buffer, 100)) > 0) {
  400c94:	48 8d 8d e4 fd ff ff 	lea    rcx,[rbp-0x21c]
  400c9b:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400c9e:	ba 64 00 00 00       	mov    edx,0x64
  400ca3:	48 89 ce             	mov    rsi,rcx
  400ca6:	89 c7                	mov    edi,eax
  400ca8:	b8 00 00 00 00       	mov    eax,0x0
  400cad:	e8 5e 09 00 00       	call   401610 <read>
  400cb2:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
  400cb5:	83 7d c4 00          	cmp    DWORD PTR [rbp-0x3c],0x0
  400cb9:	7f bb                	jg     400c76 <main+0xbb0>
                }
                puts("");
  400cbb:	48 8d 05 5a 4e 00 00 	lea    rax,[rip+0x4e5a]        # 405b1c <b+0x1d0>
  400cc2:	48 89 c7             	mov    rdi,rax
  400cc5:	e8 c6 0b 00 00       	call   401890 <puts>
                close(fd);
  400cca:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  400ccd:	89 c7                	mov    edi,eax
  400ccf:	e8 2c 09 00 00       	call   401600 <close>
  400cd4:	e9 eb f5 ff ff       	jmp    4002c4 <main+0x1fe>
            }
        }
        else if (strcmp(cmd, "write") == 0) {
  400cd9:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ce0:	48 8d 15 36 4e 00 00 	lea    rdx,[rip+0x4e36]        # 405b1d <b+0x1d1>
  400ce7:	48 89 d6             	mov    rsi,rdx
  400cea:	48 89 c7             	mov    rdi,rax
  400ced:	e8 2e 0d 00 00       	call   401a20 <strcmp>
  400cf2:	85 c0                	test   eax,eax
  400cf4:	0f 85 ff 01 00 00    	jne    400ef9 <main+0xe33>
            char path[100] = {0};
  400cfa:	48 c7 85 80 fd ff ff 	mov    QWORD PTR [rbp-0x280],0x0
  400d01:	00 00 00 00 
  400d05:	48 c7 85 88 fd ff ff 	mov    QWORD PTR [rbp-0x278],0x0
  400d0c:	00 00 00 00 
  400d10:	48 c7 85 90 fd ff ff 	mov    QWORD PTR [rbp-0x270],0x0
  400d17:	00 00 00 00 
  400d1b:	48 c7 85 98 fd ff ff 	mov    QWORD PTR [rbp-0x268],0x0
  400d22:	00 00 00 00 
  400d26:	48 c7 85 a0 fd ff ff 	mov    QWORD PTR [rbp-0x260],0x0
  400d2d:	00 00 00 00 
  400d31:	48 c7 85 a8 fd ff ff 	mov    QWORD PTR [rbp-0x258],0x0
  400d38:	00 00 00 00 
  400d3c:	48 c7 85 b0 fd ff ff 	mov    QWORD PTR [rbp-0x250],0x0
  400d43:	00 00 00 00 
  400d47:	48 c7 85 b8 fd ff ff 	mov    QWORD PTR [rbp-0x248],0x0
  400d4e:	00 00 00 00 
  400d52:	48 c7 85 c0 fd ff ff 	mov    QWORD PTR [rbp-0x240],0x0
  400d59:	00 00 00 00 
  400d5d:	48 c7 85 c8 fd ff ff 	mov    QWORD PTR [rbp-0x238],0x0
  400d64:	00 00 00 00 
  400d68:	48 c7 85 d0 fd ff ff 	mov    QWORD PTR [rbp-0x230],0x0
  400d6f:	00 00 00 00 
  400d73:	48 c7 85 d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],0x0
  400d7a:	00 00 00 00 
  400d7e:	c7 85 e0 fd ff ff 00 	mov    DWORD PTR [rbp-0x220],0x0
  400d85:	00 00 00 
            printf("input path:");
  400d88:	48 8d 05 94 4c 00 00 	lea    rax,[rip+0x4c94]        # 405a23 <b+0xd7>
  400d8f:	48 89 c7             	mov    rdi,rax
  400d92:	b8 00 00 00 00       	mov    eax,0x0
  400d97:	e8 c4 2e 00 00       	call   403c60 <printf>
            gets(path);
  400d9c:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400da3:	48 89 c7             	mov    rdi,rax
  400da6:	e8 45 0b 00 00       	call   4018f0 <gets>
            int fd = open(path, O_WRONLY);
  400dab:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400db2:	be 01 00 00 00       	mov    esi,0x1
  400db7:	48 89 c7             	mov    rdi,rax
  400dba:	e8 31 08 00 00       	call   4015f0 <open>
  400dbf:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if (fd < 0) {
  400dc2:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  400dc6:	79 23                	jns    400deb <main+0xd25>
                printf("open file %s failed\n", path);
  400dc8:	48 8d 85 80 fd ff ff 	lea    rax,[rbp-0x280]
  400dcf:	48 89 c6             	mov    rsi,rax
  400dd2:	48 8d 05 2b 4d 00 00 	lea    rax,[rip+0x4d2b]        # 405b04 <b+0x1b8>
  400dd9:	48 89 c7             	mov    rdi,rax
  400ddc:	b8 00 00 00 00       	mov    eax,0x0
  400de1:	e8 7a 2e 00 00       	call   403c60 <printf>
  400de6:	e9 d9 f4 ff ff       	jmp    4002c4 <main+0x1fe>
            }
            else {
                char buffer[100] = {0};
  400deb:	48 c7 85 e4 fd ff ff 	mov    QWORD PTR [rbp-0x21c],0x0
  400df2:	00 00 00 00 
  400df6:	48 c7 85 ec fd ff ff 	mov    QWORD PTR [rbp-0x214],0x0
  400dfd:	00 00 00 00 
  400e01:	48 c7 85 f4 fd ff ff 	mov    QWORD PTR [rbp-0x20c],0x0
  400e08:	00 00 00 00 
  400e0c:	48 c7 85 fc fd ff ff 	mov    QWORD PTR [rbp-0x204],0x0
  400e13:	00 00 00 00 
  400e17:	48 c7 85 04 fe ff ff 	mov    QWORD PTR [rbp-0x1fc],0x0
  400e1e:	00 00 00 00 
  400e22:	48 c7 85 0c fe ff ff 	mov    QWORD PTR [rbp-0x1f4],0x0
  400e29:	00 00 00 00 
  400e2d:	48 c7 85 14 fe ff ff 	mov    QWORD PTR [rbp-0x1ec],0x0
  400e34:	00 00 00 00 
  400e38:	48 c7 85 1c fe ff ff 	mov    QWORD PTR [rbp-0x1e4],0x0
  400e3f:	00 00 00 00 
  400e43:	48 c7 85 24 fe ff ff 	mov    QWORD PTR [rbp-0x1dc],0x0
  400e4a:	00 00 00 00 
  400e4e:	48 c7 85 2c fe ff ff 	mov    QWORD PTR [rbp-0x1d4],0x0
  400e55:	00 00 00 00 
  400e59:	48 c7 85 34 fe ff ff 	mov    QWORD PTR [rbp-0x1cc],0x0
  400e60:	00 00 00 00 
  400e64:	48 c7 85 3c fe ff ff 	mov    QWORD PTR [rbp-0x1c4],0x0
  400e6b:	00 00 00 00 
  400e6f:	c7 85 44 fe ff ff 00 	mov    DWORD PTR [rbp-0x1bc],0x0
  400e76:	00 00 00 
                printf("input content:");
  400e79:	48 8d 05 a3 4c 00 00 	lea    rax,[rip+0x4ca3]        # 405b23 <b+0x1d7>
  400e80:	48 89 c7             	mov    rdi,rax
  400e83:	b8 00 00 00 00       	mov    eax,0x0
  400e88:	e8 d3 2d 00 00       	call   403c60 <printf>
                gets(buffer);
  400e8d:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400e94:	48 89 c7             	mov    rdi,rax
  400e97:	e8 54 0a 00 00       	call   4018f0 <gets>
                int len = strlen(buffer);
  400e9c:	48 8d 85 e4 fd ff ff 	lea    rax,[rbp-0x21c]
  400ea3:	48 89 c7             	mov    rdi,rax
  400ea6:	e8 c5 0b 00 00       	call   401a70 <strlen>
  400eab:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                write(fd, buffer, len);
  400eae:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  400eb1:	48 8d 8d e4 fd ff ff 	lea    rcx,[rbp-0x21c]
  400eb8:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400ebb:	48 89 ce             	mov    rsi,rcx
  400ebe:	89 c7                	mov    edi,eax
  400ec0:	b8 00 00 00 00       	mov    eax,0x0
  400ec5:	e8 56 07 00 00       	call   401620 <write>
                printf("write %d bytes to file %s success\n", len, path);
  400eca:	48 8d 95 80 fd ff ff 	lea    rdx,[rbp-0x280]
  400ed1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  400ed4:	89 c6                	mov    esi,eax
  400ed6:	48 8d 05 5b 4c 00 00 	lea    rax,[rip+0x4c5b]        # 405b38 <b+0x1ec>
  400edd:	48 89 c7             	mov    rdi,rax
  400ee0:	b8 00 00 00 00       	mov    eax,0x0
  400ee5:	e8 76 2d 00 00       	call   403c60 <printf>
                close(fd);
  400eea:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  400eed:	89 c7                	mov    edi,eax
  400eef:	e8 0c 07 00 00       	call   401600 <close>
  400ef4:	e9 cb f3 ff ff       	jmp    4002c4 <main+0x1fe>
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
  400ef9:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400f00:	48 8d 15 54 4c 00 00 	lea    rdx,[rip+0x4c54]        # 405b5b <b+0x20f>
  400f07:	48 89 d6             	mov    rsi,rdx
  400f0a:	48 89 c7             	mov    rdi,rax
  400f0d:	e8 0e 0b 00 00       	call   401a20 <strcmp>
  400f12:	85 c0                	test   eax,eax
  400f14:	75 73                	jne    400f89 <main+0xec3>
  400f16:	48 c7 45 a0 29 00 00 	mov    QWORD PTR [rbp-0x60],0x29
  400f1d:	00 
  400f1e:	48 c7 45 98 01 00 00 	mov    QWORD PTR [rbp-0x68],0x1
  400f25:	00 
  400f26:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400f2d:	00 
  400f2e:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400f35:	00 
  400f36:	48 c7 85 68 fe ff ff 	mov    QWORD PTR [rbp-0x198],0x0
  400f3d:	00 00 00 00 
  400f41:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400f48:	00 
  400f49:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400f50:	00 00 00 00 
typedef unsigned long long (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
  400f54:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  400f58:	48 8b 4d 98          	mov    rcx,QWORD PTR [rbp-0x68]
  400f5c:	48 8b 75 90          	mov    rsi,QWORD PTR [rbp-0x70]
  400f60:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  400f64:	4c 8b 45 80          	mov    r8,QWORD PTR [rbp-0x80]
  400f68:	4c 8b 8d 78 ff ff ff 	mov    r9,QWORD PTR [rbp-0x88]
  400f6f:	48 89 cf             	mov    rdi,rcx
  400f72:	4c 8b 95 68 fe ff ff 	mov    r10,QWORD PTR [rbp-0x198]
  400f79:	48 0f 05             	rex.W syscall 
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
  400f7c:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  400f81:	48 89 c3             	mov    rbx,rax
    return ret;
  400f84:	e9 c4 00 00 00       	jmp    40104d <main+0xf87>
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
  400f89:	48 8d 05 d2 4b 00 00 	lea    rax,[rip+0x4bd2]        # 405b62 <b+0x216>
  400f90:	48 89 c7             	mov    rdi,rax
  400f93:	b8 00 00 00 00       	mov    eax,0x0
  400f98:	e8 c3 2c 00 00       	call   403c60 <printf>
            int pid = 0;
  400f9d:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
            if ((pid = fork()) == 0) {
  400fa4:	e8 47 07 00 00       	call   4016f0 <fork>
  400fa9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  400fac:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  400fb0:	75 59                	jne    40100b <main+0xf45>
                printf("forked, ready to execve\n");
  400fb2:	48 8d 05 bf 4b 00 00 	lea    rax,[rip+0x4bbf]        # 405b78 <b+0x22c>
  400fb9:	48 89 c7             	mov    rdi,rax
  400fbc:	b8 00 00 00 00       	mov    eax,0x0
  400fc1:	e8 9a 2c 00 00       	call   403c60 <printf>
                if (execve(cmd, argv, environ) == -1) {
  400fc6:	48 8b 95 68 fd ff ff 	mov    rdx,QWORD PTR [rbp-0x298]
  400fcd:	48 8b 8d 70 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x290]
  400fd4:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400fdb:	48 89 ce             	mov    rsi,rcx
  400fde:	48 89 c7             	mov    rdi,rax
  400fe1:	e8 1a 07 00 00       	call   401700 <execve>
  400fe6:	83 f8 ff             	cmp    eax,0xffffffff
  400fe9:	75 20                	jne    40100b <main+0xf45>
                    printf("cannot find file:%s\n", cmd);
  400feb:	48 8d 85 f8 fe ff ff 	lea    rax,[rbp-0x108]
  400ff2:	48 89 c6             	mov    rsi,rax
  400ff5:	48 8d 05 95 4b 00 00 	lea    rax,[rip+0x4b95]        # 405b91 <b+0x245>
  400ffc:	48 89 c7             	mov    rdi,rax
  400fff:	b8 00 00 00 00       	mov    eax,0x0
  401004:	e8 57 2c 00 00       	call   403c60 <printf>
                    continue;
  401009:	eb 42                	jmp    40104d <main+0xf87>
                }
            }
            printf("forked. pid=%d\n", pid);
  40100b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  40100e:	89 c6                	mov    esi,eax
  401010:	48 8d 05 8f 4b 00 00 	lea    rax,[rip+0x4b8f]        # 405ba6 <b+0x25a>
  401017:	48 89 c7             	mov    rdi,rax
  40101a:	b8 00 00 00 00       	mov    eax,0x0
  40101f:	e8 3c 2c 00 00       	call   403c60 <printf>
            int loc = 0;
  401024:	c7 85 64 fe ff ff 00 	mov    DWORD PTR [rbp-0x19c],0x0
  40102b:	00 00 00 

            waitpid(pid, &loc, 0);
  40102e:	48 8d 8d 64 fe ff ff 	lea    rcx,[rbp-0x19c]
  401035:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  401038:	ba 00 00 00 00       	mov    edx,0x0
  40103d:	48 89 ce             	mov    rsi,rcx
  401040:	89 c7                	mov    edi,eax
  401042:	e8 c9 06 00 00       	call   401710 <waitpid>
  401047:	e9 78 f2 ff ff       	jmp    4002c4 <main+0x1fe>
                continue;
  40104c:	90                   	nop
    while (1) {
  40104d:	e9 72 f2 ff ff       	jmp    4002c4 <main+0x1fe>
            break;
  401052:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  401053:	b8 00 00 00 00       	mov    eax,0x0
  401058:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  40105c:	c9                   	leave  
  40105d:	c3                   	ret    

000000000040105e <send_signal>:
#include <sys/types.h>
#include "syscall.h"
int send_signal(pid_t pid, int sig)
{
  40105e:	f3 0f 1e fa          	endbr64 
  401062:	55                   	push   rbp
  401063:	48 89 e5             	mov    rbp,rsp
  401066:	53                   	push   rbx
  401067:	89 7d b4             	mov    DWORD PTR [rbp-0x4c],edi
  40106a:	89 75 b0             	mov    DWORD PTR [rbp-0x50],esi
    return do_syscall(SYSCALL_SEND_SIGNAL, pid, sig, 0, 0, 0, 0);
  40106d:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  401070:	48 98                	cdqe   
  401072:	8b 55 b4             	mov    edx,DWORD PTR [rbp-0x4c]
  401075:	48 63 d2             	movsxd rdx,edx
  401078:	48 c7 45 f0 78 00 00 	mov    QWORD PTR [rbp-0x10],0x78
  40107f:	00 
  401080:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401084:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  401088:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40108f:	00 
  401090:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401097:	00 
  401098:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40109f:	00 
  4010a0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4010a7:	00 
    __asm__ volatile("mov %4,%%r10\n"
  4010a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4010ac:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  4010b0:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  4010b4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4010b8:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4010bc:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4010c0:	48 89 cf             	mov    rdi,rcx
  4010c3:	4c 8b 55 c0          	mov    r10,QWORD PTR [rbp-0x40]
  4010c7:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  4010ca:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  4010cf:	48 89 c3             	mov    rbx,rax
    return ret;
  4010d2:	89 d8                	mov    eax,ebx
  4010d4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  4010d8:	c9                   	leave  
  4010d9:	c3                   	ret    

00000000004010da <opendir>:
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
  4010da:	f3 0f 1e fa          	endbr64 
  4010de:	55                   	push   rbp
  4010df:	48 89 e5             	mov    rbp,rsp
  4010e2:	48 83 ec 20          	sub    rsp,0x20
  4010e6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    DIR* dirp = (DIR*)malloc(sizeof(DIR));
  4010ea:	bf 20 00 00 00       	mov    edi,0x20
  4010ef:	e8 ac 36 00 00       	call   4047a0 <malloc>
  4010f4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (dirp == NULL) {
  4010f8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  4010fd:	75 0a                	jne    401109 <opendir+0x2f>
        return NULL;
  4010ff:	b8 00 00 00 00       	mov    eax,0x0
  401104:	e9 a6 00 00 00       	jmp    4011af <opendir+0xd5>
    }
    dirp->fd = open(name, O_DIRECTORY);
  401109:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  40110d:	be 00 40 00 00       	mov    esi,0x4000
  401112:	48 89 c7             	mov    rdi,rax
  401115:	e8 d6 04 00 00       	call   4015f0 <open>
  40111a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  40111e:	89 02                	mov    DWORD PTR [rdx],eax
    if (dirp->fd < 0) {
  401120:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401124:	8b 00                	mov    eax,DWORD PTR [rax]
  401126:	85 c0                	test   eax,eax
  401128:	79 13                	jns    40113d <opendir+0x63>
        free(dirp);
  40112a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40112e:	48 89 c7             	mov    rdi,rax
  401131:	e8 6a 30 00 00       	call   4041a0 <free>
        return NULL;
  401136:	b8 00 00 00 00       	mov    eax,0x0
  40113b:	eb 72                	jmp    4011af <opendir+0xd5>
    }
    dirp->buf = (char*)malloc(1024);
  40113d:	bf 00 04 00 00       	mov    edi,0x400
  401142:	e8 59 36 00 00       	call   4047a0 <malloc>
  401147:	48 89 c2             	mov    rdx,rax
  40114a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40114e:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    if (dirp->buf == NULL) {
  401152:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401156:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  40115a:	48 85 c0             	test   rax,rax
  40115d:	75 20                	jne    40117f <opendir+0xa5>
        close(dirp->fd);
  40115f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401163:	8b 00                	mov    eax,DWORD PTR [rax]
  401165:	89 c7                	mov    edi,eax
  401167:	e8 94 04 00 00       	call   401600 <close>
        free(dirp);
  40116c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401170:	48 89 c7             	mov    rdi,rax
  401173:	e8 28 30 00 00       	call   4041a0 <free>
        return NULL;
  401178:	b8 00 00 00 00       	mov    eax,0x0
  40117d:	eb 30                	jmp    4011af <opendir+0xd5>
    }
    dirp->buflen = 1024;
  40117f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401183:	c7 40 10 00 04 00 00 	mov    DWORD PTR [rax+0x10],0x400
    dirp->pos    = 0;
  40118a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40118e:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
    dirp->end    = 0;
  401195:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401199:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
    dirp->eof    = 0;
  4011a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4011a4:	c7 40 1c 00 00 00 00 	mov    DWORD PTR [rax+0x1c],0x0
    return dirp;
  4011ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  4011af:	c9                   	leave  
  4011b0:	c3                   	ret    

00000000004011b1 <closedir>:

int closedir(DIR* dirp)
{
  4011b1:	f3 0f 1e fa          	endbr64 
  4011b5:	55                   	push   rbp
  4011b6:	48 89 e5             	mov    rbp,rsp
  4011b9:	53                   	push   rbx
  4011ba:	48 83 ec 58          	sub    rsp,0x58
  4011be:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    if (dirp == NULL) {
  4011c2:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  4011c7:	75 0a                	jne    4011d3 <closedir+0x22>
        return -1;
  4011c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4011ce:	e9 87 00 00 00       	jmp    40125a <closedir+0xa9>
    }
    do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
  4011d3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4011d7:	8b 00                	mov    eax,DWORD PTR [rax]
  4011d9:	48 98                	cdqe   
  4011db:	48 c7 45 e8 0c 00 00 	mov    QWORD PTR [rbp-0x18],0xc
  4011e2:	00 
  4011e3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4011e7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4011ee:	00 
  4011ef:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4011f6:	00 
  4011f7:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4011fe:	00 
  4011ff:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401206:	00 
  401207:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40120e:	00 
    __asm__ volatile("mov %4,%%r10\n"
  40120f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401213:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  401217:	48 8b 75 d8          	mov    rsi,QWORD PTR [rbp-0x28]
  40121b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  40121f:	4c 8b 45 c8          	mov    r8,QWORD PTR [rbp-0x38]
  401223:	4c 8b 4d c0          	mov    r9,QWORD PTR [rbp-0x40]
  401227:	48 89 cf             	mov    rdi,rcx
  40122a:	4c 8b 55 b8          	mov    r10,QWORD PTR [rbp-0x48]
  40122e:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  401231:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  401236:	48 89 c3             	mov    rbx,rax
    free(dirp->buf);
  401239:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40123d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401241:	48 89 c7             	mov    rdi,rax
  401244:	e8 57 2f 00 00       	call   4041a0 <free>
    free(dirp);
  401249:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  40124d:	48 89 c7             	mov    rdi,rax
  401250:	e8 4b 2f 00 00       	call   4041a0 <free>
    return 0;
  401255:	b8 00 00 00 00       	mov    eax,0x0
}
  40125a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  40125e:	c9                   	leave  
  40125f:	c3                   	ret    

0000000000401260 <readdir>:

struct dirent* readdir(DIR* dirp)
{
  401260:	f3 0f 1e fa          	endbr64 
  401264:	55                   	push   rbp
  401265:	48 89 e5             	mov    rbp,rsp
  401268:	53                   	push   rbx
  401269:	48 89 7d b0          	mov    QWORD PTR [rbp-0x50],rdi
    // readdir syscall返回的是状态码
    if (do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0) {
  40126d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401271:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  401275:	48 89 c2             	mov    rdx,rax
  401278:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  40127c:	8b 00                	mov    eax,DWORD PTR [rax]
  40127e:	48 98                	cdqe   
  401280:	48 c7 45 f0 25 00 00 	mov    QWORD PTR [rbp-0x10],0x25
  401287:	00 
  401288:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40128c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  401290:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401297:	00 
  401298:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40129f:	00 
  4012a0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4012a7:	00 
  4012a8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4012af:	00 
    __asm__ volatile("mov %4,%%r10\n"
  4012b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4012b4:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  4012b8:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  4012bc:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4012c0:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4012c4:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4012c8:	48 89 cf             	mov    rdi,rcx
  4012cb:	4c 8b 55 c0          	mov    r10,QWORD PTR [rbp-0x40]
  4012cf:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  4012d2:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  4012d7:	48 89 c3             	mov    rbx,rax
    return ret;
  4012da:	89 d8                	mov    eax,ebx
  4012dc:	85 c0                	test   eax,eax
  4012de:	79 12                	jns    4012f2 <readdir+0x92>
        dirp->eof = 1;
  4012e0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4012e4:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
        return NULL;
  4012eb:	b8 00 00 00 00       	mov    eax,0x0
  4012f0:	eb 08                	jmp    4012fa <readdir+0x9a>
    }
    return (struct dirent*)dirp->buf;
  4012f2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  4012f6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
}
  4012fa:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  4012fe:	c9                   	leave  
  4012ff:	c3                   	ret    

0000000000401300 <chdir>:
int chdir(const char* name)
{
  401300:	f3 0f 1e fa          	endbr64 
  401304:	55                   	push   rbp
  401305:	48 89 e5             	mov    rbp,rsp
  401308:	53                   	push   rbx
  401309:	48 89 7d b0          	mov    QWORD PTR [rbp-0x50],rdi
    return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
  40130d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  401311:	48 c7 45 f0 26 00 00 	mov    QWORD PTR [rbp-0x10],0x26
  401318:	00 
  401319:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40131d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  401324:	00 
  401325:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40132c:	00 
  40132d:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401334:	00 
  401335:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  40133c:	00 
  40133d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401344:	00 
    __asm__ volatile("mov %4,%%r10\n"
  401345:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  401349:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  40134d:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  401351:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  401355:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  401359:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  40135d:	48 89 cf             	mov    rdi,rcx
  401360:	4c 8b 55 c0          	mov    r10,QWORD PTR [rbp-0x40]
  401364:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  401367:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  40136c:	48 89 c3             	mov    rbx,rax
    return ret;
  40136f:	89 d8                	mov    eax,ebx
}
  401371:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  401375:	c9                   	leave  
  401376:	c3                   	ret    

0000000000401377 <creat>:
int creat(const char* name, mode_t mode)
{
  401377:	f3 0f 1e fa          	endbr64 
  40137b:	55                   	push   rbp
  40137c:	48 89 e5             	mov    rbp,rsp
  40137f:	53                   	push   rbx
  401380:	48 89 7d b0          	mov    QWORD PTR [rbp-0x50],rdi
  401384:	89 75 ac             	mov    DWORD PTR [rbp-0x54],esi
    return do_syscall(SYSCALL_OPEN,
  401387:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  40138a:	83 c8 41             	or     eax,0x41
  40138d:	48 98                	cdqe   
  40138f:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  401393:	48 c7 45 f0 0b 00 00 	mov    QWORD PTR [rbp-0x10],0xb
  40139a:	00 
  40139b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  40139f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4013a3:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4013aa:	00 
  4013ab:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4013b2:	00 
  4013b3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4013ba:	00 
  4013bb:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4013c2:	00 
    __asm__ volatile("mov %4,%%r10\n"
  4013c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4013c7:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  4013cb:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  4013cf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4013d3:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  4013d7:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  4013db:	48 89 cf             	mov    rdi,rcx
  4013de:	4c 8b 55 c0          	mov    r10,QWORD PTR [rbp-0x40]
  4013e2:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  4013e5:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  4013ea:	48 89 c3             	mov    rbx,rax
    return ret;
  4013ed:	89 d8                	mov    eax,ebx
                      (long long)O_CREAT | (long long)O_WRONLY | (long long)mode,
                      0,
                      0,
                      0,
                      0);
}
  4013ef:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  4013f3:	c9                   	leave  
  4013f4:	c3                   	ret    

00000000004013f5 <mkdir>:

int mkdir(const char* path, mode_t mode)
{
  4013f5:	f3 0f 1e fa          	endbr64 
  4013f9:	55                   	push   rbp
  4013fa:	48 89 e5             	mov    rbp,rsp
  4013fd:	48 83 ec 10          	sub    rsp,0x10
  401401:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  401405:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    return creat(path, mode | O_DIRECTORY);
  401408:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  40140b:	80 cc 40             	or     ah,0x40
  40140e:	89 c2                	mov    edx,eax
  401410:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401414:	89 d6                	mov    esi,edx
  401416:	48 89 c7             	mov    rdi,rax
  401419:	e8 59 ff ff ff       	call   401377 <creat>
}
  40141e:	c9                   	leave  
  40141f:	c3                   	ret    

0000000000401420 <rename>:
int rename(const char* oldpath, const char* newpath)
{
  401420:	f3 0f 1e fa          	endbr64 
  401424:	55                   	push   rbp
  401425:	48 89 e5             	mov    rbp,rsp
  401428:	53                   	push   rbx
  401429:	48 89 7d b0          	mov    QWORD PTR [rbp-0x50],rdi
  40142d:	48 89 75 a8          	mov    QWORD PTR [rbp-0x58],rsi
    return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
  401431:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  401435:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  401439:	48 c7 45 f0 27 00 00 	mov    QWORD PTR [rbp-0x10],0x27
  401440:	00 
  401441:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  401445:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  401449:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  401450:	00 
  401451:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  401458:	00 
  401459:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  401460:	00 
  401461:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  401468:	00 
    __asm__ volatile("mov %4,%%r10\n"
  401469:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  40146d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  401471:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  401475:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  401479:	4c 8b 45 d0          	mov    r8,QWORD PTR [rbp-0x30]
  40147d:	4c 8b 4d c8          	mov    r9,QWORD PTR [rbp-0x38]
  401481:	48 89 cf             	mov    rdi,rcx
  401484:	4c 8b 55 c0          	mov    r10,QWORD PTR [rbp-0x40]
  401488:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  40148b:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  401490:	48 89 c3             	mov    rbx,rax
    return ret;
  401493:	89 d8                	mov    eax,ebx
}
  401495:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  401499:	c9                   	leave  
  40149a:	c3                   	ret    

000000000040149b <getcwd>:
char* getcwd(char* buf, size_t size)
{
  40149b:	f3 0f 1e fa          	endbr64 
  40149f:	55                   	push   rbp
  4014a0:	48 89 e5             	mov    rbp,rsp
  4014a3:	53                   	push   rbx
  4014a4:	48 83 ec 58          	sub    rsp,0x58
  4014a8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4014ac:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    if (!buf) {
  4014b0:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
  4014b5:	75 10                	jne    4014c7 <getcwd+0x2c>
        buf = malloc(size);
  4014b7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4014bb:	48 89 c7             	mov    rdi,rax
  4014be:	e8 dd 32 00 00       	call   4047a0 <malloc>
  4014c3:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    }
    return (char*)do_syscall(SYSCALL_GETCWD, (long long)buf, (long long)size, 0, 0, 0, 0);
  4014c7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4014cb:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  4014cf:	48 c7 45 e8 2a 00 00 	mov    QWORD PTR [rbp-0x18],0x2a
  4014d6:	00 
  4014d7:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  4014db:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4014df:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4014e6:	00 
  4014e7:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4014ee:	00 
  4014ef:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4014f6:	00 
  4014f7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4014fe:	00 
    __asm__ volatile("mov %4,%%r10\n"
  4014ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401503:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  401507:	48 8b 75 d8          	mov    rsi,QWORD PTR [rbp-0x28]
  40150b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  40150f:	4c 8b 45 c8          	mov    r8,QWORD PTR [rbp-0x38]
  401513:	4c 8b 4d c0          	mov    r9,QWORD PTR [rbp-0x40]
  401517:	48 89 cf             	mov    rdi,rcx
  40151a:	4c 8b 55 b8          	mov    r10,QWORD PTR [rbp-0x48]
  40151e:	48 0f 05             	rex.W syscall 
    register long ret = 0;
  401521:	bb 00 00 00 00       	mov    ebx,0x0
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
  401526:	48 89 c3             	mov    rbx,rax
    return ret;
  401529:	89 d8                	mov    eax,ebx
  40152b:	48 98                	cdqe   
}
  40152d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  401531:	c9                   	leave  
  401532:	c3                   	ret    
  401533:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40153a:	00 00 00 
  40153d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000401540 <reg_dev>:
  401540:	55                   	push   rbp
  401541:	48 89 e5             	mov    rbp,rsp
  401544:	b8 00 00 00 00       	mov    eax,0x0
  401549:	55                   	push   rbp
  40154a:	48 0f 05             	rex.W syscall 
  40154d:	5d                   	pop    rbp
  40154e:	c9                   	leave  
  40154f:	c3                   	ret    

0000000000401550 <dispose_dev>:
  401550:	55                   	push   rbp
  401551:	48 89 e5             	mov    rbp,rsp
  401554:	b8 01 00 00 00       	mov    eax,0x1
  401559:	55                   	push   rbp
  40155a:	48 0f 05             	rex.W syscall 
  40155d:	5d                   	pop    rbp
  40155e:	c9                   	leave  
  40155f:	c3                   	ret    

0000000000401560 <reg_drv>:
  401560:	55                   	push   rbp
  401561:	48 89 e5             	mov    rbp,rsp
  401564:	b8 02 00 00 00       	mov    eax,0x2
  401569:	55                   	push   rbp
  40156a:	48 0f 05             	rex.W syscall 
  40156d:	5d                   	pop    rbp
  40156e:	c9                   	leave  
  40156f:	c3                   	ret    

0000000000401570 <dispose_drv>:
  401570:	55                   	push   rbp
  401571:	48 89 e5             	mov    rbp,rsp
  401574:	b8 03 00 00 00       	mov    eax,0x3
  401579:	55                   	push   rbp
  40157a:	48 0f 05             	rex.W syscall 
  40157d:	5d                   	pop    rbp
  40157e:	c9                   	leave  
  40157f:	c3                   	ret    

0000000000401580 <call_drvfunc>:
  401580:	55                   	push   rbp
  401581:	48 89 e5             	mov    rbp,rsp
  401584:	b8 04 00 00 00       	mov    eax,0x4
  401589:	55                   	push   rbp
  40158a:	48 0f 05             	rex.W syscall 
  40158d:	5d                   	pop    rbp
  40158e:	c9                   	leave  
  40158f:	c3                   	ret    

0000000000401590 <req_mem>:
  401590:	55                   	push   rbp
  401591:	48 89 e5             	mov    rbp,rsp
  401594:	b8 05 00 00 00       	mov    eax,0x5
  401599:	55                   	push   rbp
  40159a:	48 0f 05             	rex.W syscall 
  40159d:	5d                   	pop    rbp
  40159e:	c9                   	leave  
  40159f:	c3                   	ret    

00000000004015a0 <free_mem>:
  4015a0:	55                   	push   rbp
  4015a1:	48 89 e5             	mov    rbp,rsp
  4015a4:	b8 06 00 00 00       	mov    eax,0x6
  4015a9:	55                   	push   rbp
  4015aa:	48 0f 05             	rex.W syscall 
  4015ad:	5d                   	pop    rbp
  4015ae:	c9                   	leave  
  4015af:	c3                   	ret    

00000000004015b0 <reg_proc>:
  4015b0:	55                   	push   rbp
  4015b1:	48 89 e5             	mov    rbp,rsp
  4015b4:	b8 07 00 00 00       	mov    eax,0x7
  4015b9:	55                   	push   rbp
  4015ba:	48 0f 05             	rex.W syscall 
  4015bd:	5d                   	pop    rbp
  4015be:	c9                   	leave  
  4015bf:	c3                   	ret    

00000000004015c0 <del_proc>:
  4015c0:	55                   	push   rbp
  4015c1:	48 89 e5             	mov    rbp,rsp
  4015c4:	b8 08 00 00 00       	mov    eax,0x8
  4015c9:	55                   	push   rbp
  4015ca:	48 0f 05             	rex.W syscall 
  4015cd:	5d                   	pop    rbp
  4015ce:	c9                   	leave  
  4015cf:	c3                   	ret    

00000000004015d0 <get_proc_addr>:
  4015d0:	55                   	push   rbp
  4015d1:	48 89 e5             	mov    rbp,rsp
  4015d4:	b8 09 00 00 00       	mov    eax,0x9
  4015d9:	55                   	push   rbp
  4015da:	48 0f 05             	rex.W syscall 
  4015dd:	5d                   	pop    rbp
  4015de:	c9                   	leave  
  4015df:	c3                   	ret    

00000000004015e0 <chk_vm>:
  4015e0:	55                   	push   rbp
  4015e1:	48 89 e5             	mov    rbp,rsp
  4015e4:	b8 0a 00 00 00       	mov    eax,0xa
  4015e9:	55                   	push   rbp
  4015ea:	48 0f 05             	rex.W syscall 
  4015ed:	5d                   	pop    rbp
  4015ee:	c9                   	leave  
  4015ef:	c3                   	ret    

00000000004015f0 <open>:
  4015f0:	55                   	push   rbp
  4015f1:	48 89 e5             	mov    rbp,rsp
  4015f4:	b8 0b 00 00 00       	mov    eax,0xb
  4015f9:	55                   	push   rbp
  4015fa:	48 0f 05             	rex.W syscall 
  4015fd:	5d                   	pop    rbp
  4015fe:	c9                   	leave  
  4015ff:	c3                   	ret    

0000000000401600 <close>:
  401600:	55                   	push   rbp
  401601:	48 89 e5             	mov    rbp,rsp
  401604:	b8 0c 00 00 00       	mov    eax,0xc
  401609:	55                   	push   rbp
  40160a:	48 0f 05             	rex.W syscall 
  40160d:	5d                   	pop    rbp
  40160e:	c9                   	leave  
  40160f:	c3                   	ret    

0000000000401610 <read>:
  401610:	55                   	push   rbp
  401611:	48 89 e5             	mov    rbp,rsp
  401614:	b8 0d 00 00 00       	mov    eax,0xd
  401619:	55                   	push   rbp
  40161a:	48 0f 05             	rex.W syscall 
  40161d:	5d                   	pop    rbp
  40161e:	c9                   	leave  
  40161f:	c3                   	ret    

0000000000401620 <write>:
  401620:	55                   	push   rbp
  401621:	48 89 e5             	mov    rbp,rsp
  401624:	b8 0e 00 00 00       	mov    eax,0xe
  401629:	55                   	push   rbp
  40162a:	48 0f 05             	rex.W syscall 
  40162d:	5d                   	pop    rbp
  40162e:	c9                   	leave  
  40162f:	c3                   	ret    

0000000000401630 <seek>:
  401630:	55                   	push   rbp
  401631:	48 89 e5             	mov    rbp,rsp
  401634:	b8 0f 00 00 00       	mov    eax,0xf
  401639:	55                   	push   rbp
  40163a:	48 0f 05             	rex.W syscall 
  40163d:	5d                   	pop    rbp
  40163e:	c9                   	leave  
  40163f:	c3                   	ret    

0000000000401640 <tell>:
  401640:	55                   	push   rbp
  401641:	48 89 e5             	mov    rbp,rsp
  401644:	b8 10 00 00 00       	mov    eax,0x10
  401649:	55                   	push   rbp
  40164a:	48 0f 05             	rex.W syscall 
  40164d:	5d                   	pop    rbp
  40164e:	c9                   	leave  
  40164f:	c3                   	ret    

0000000000401650 <reg_vol>:
  401650:	55                   	push   rbp
  401651:	48 89 e5             	mov    rbp,rsp
  401654:	b8 11 00 00 00       	mov    eax,0x11
  401659:	55                   	push   rbp
  40165a:	48 0f 05             	rex.W syscall 
  40165d:	5d                   	pop    rbp
  40165e:	c9                   	leave  
  40165f:	c3                   	ret    

0000000000401660 <free_vol>:
  401660:	55                   	push   rbp
  401661:	48 89 e5             	mov    rbp,rsp
  401664:	b8 12 00 00 00       	mov    eax,0x12
  401669:	55                   	push   rbp
  40166a:	48 0f 05             	rex.W syscall 
  40166d:	5d                   	pop    rbp
  40166e:	c9                   	leave  
  40166f:	c3                   	ret    

0000000000401670 <exec>:
  401670:	55                   	push   rbp
  401671:	48 89 e5             	mov    rbp,rsp
  401674:	b8 13 00 00 00       	mov    eax,0x13
  401679:	55                   	push   rbp
  40167a:	48 0f 05             	rex.W syscall 
  40167d:	5d                   	pop    rbp
  40167e:	c9                   	leave  
  40167f:	c3                   	ret    

0000000000401680 <exit>:
  401680:	55                   	push   rbp
  401681:	48 89 e5             	mov    rbp,rsp
  401684:	b8 14 00 00 00       	mov    eax,0x14
  401689:	55                   	push   rbp
  40168a:	48 0f 05             	rex.W syscall 
  40168d:	5d                   	pop    rbp
  40168e:	c9                   	leave  
  40168f:	c3                   	ret    

0000000000401690 <abort>:
  401690:	55                   	push   rbp
  401691:	48 89 e5             	mov    rbp,rsp
  401694:	b8 14 00 00 00       	mov    eax,0x14
  401699:	55                   	push   rbp
  40169a:	48 0f 05             	rex.W syscall 
  40169d:	5d                   	pop    rbp
  40169e:	c9                   	leave  
  40169f:	c3                   	ret    

00000000004016a0 <call>:
  4016a0:	55                   	push   rbp
  4016a1:	48 89 e5             	mov    rbp,rsp
  4016a4:	b8 15 00 00 00       	mov    eax,0x15
  4016a9:	55                   	push   rbp
  4016aa:	48 0f 05             	rex.W syscall 
  4016ad:	5d                   	pop    rbp
  4016ae:	c9                   	leave  
  4016af:	c3                   	ret    

00000000004016b0 <mkfifo>:
  4016b0:	55                   	push   rbp
  4016b1:	48 89 e5             	mov    rbp,rsp
  4016b4:	b8 16 00 00 00       	mov    eax,0x16
  4016b9:	55                   	push   rbp
  4016ba:	48 0f 05             	rex.W syscall 
  4016bd:	5d                   	pop    rbp
  4016be:	c9                   	leave  
  4016bf:	c3                   	ret    

00000000004016c0 <brk>:
  4016c0:	55                   	push   rbp
  4016c1:	48 89 e5             	mov    rbp,rsp
  4016c4:	b8 17 00 00 00       	mov    eax,0x17
  4016c9:	55                   	push   rbp
  4016ca:	48 0f 05             	rex.W syscall 
  4016cd:	5d                   	pop    rbp
  4016ce:	c9                   	leave  
  4016cf:	c3                   	ret    

00000000004016d0 <find_dev>:
  4016d0:	55                   	push   rbp
  4016d1:	48 89 e5             	mov    rbp,rsp
  4016d4:	b8 19 00 00 00       	mov    eax,0x19
  4016d9:	55                   	push   rbp
  4016da:	48 0f 05             	rex.W syscall 
  4016dd:	5d                   	pop    rbp
  4016de:	c9                   	leave  
  4016df:	c3                   	ret    

00000000004016e0 <operate_dev>:
  4016e0:	55                   	push   rbp
  4016e1:	48 89 e5             	mov    rbp,rsp
  4016e4:	b8 1a 00 00 00       	mov    eax,0x1a
  4016e9:	55                   	push   rbp
  4016ea:	48 0f 05             	rex.W syscall 
  4016ed:	5d                   	pop    rbp
  4016ee:	c9                   	leave  
  4016ef:	c3                   	ret    

00000000004016f0 <fork>:
  4016f0:	55                   	push   rbp
  4016f1:	48 89 e5             	mov    rbp,rsp
  4016f4:	b8 1b 00 00 00       	mov    eax,0x1b
  4016f9:	55                   	push   rbp
  4016fa:	48 0f 05             	rex.W syscall 
  4016fd:	5d                   	pop    rbp
  4016fe:	c9                   	leave  
  4016ff:	c3                   	ret    

0000000000401700 <execve>:
  401700:	55                   	push   rbp
  401701:	48 89 e5             	mov    rbp,rsp
  401704:	b8 1c 00 00 00       	mov    eax,0x1c
  401709:	55                   	push   rbp
  40170a:	48 0f 05             	rex.W syscall 
  40170d:	5d                   	pop    rbp
  40170e:	c9                   	leave  
  40170f:	c3                   	ret    

0000000000401710 <waitpid>:
  401710:	55                   	push   rbp
  401711:	48 89 e5             	mov    rbp,rsp
  401714:	b8 1d 00 00 00       	mov    eax,0x1d
  401719:	55                   	push   rbp
  40171a:	48 0f 05             	rex.W syscall 
  40171d:	5d                   	pop    rbp
  40171e:	c9                   	leave  
  40171f:	c3                   	ret    

0000000000401720 <mmap>:
  401720:	55                   	push   rbp
  401721:	48 89 e5             	mov    rbp,rsp
  401724:	b8 1e 00 00 00       	mov    eax,0x1e
  401729:	55                   	push   rbp
  40172a:	48 0f 05             	rex.W syscall 
  40172d:	5d                   	pop    rbp
  40172e:	c9                   	leave  
  40172f:	c3                   	ret    

0000000000401730 <munmap>:
  401730:	55                   	push   rbp
  401731:	48 89 e5             	mov    rbp,rsp
  401734:	b8 1f 00 00 00       	mov    eax,0x1f
  401739:	55                   	push   rbp
  40173a:	48 0f 05             	rex.W syscall 
  40173d:	5d                   	pop    rbp
  40173e:	c9                   	leave  
  40173f:	c3                   	ret    

0000000000401740 <mknod>:
  401740:	55                   	push   rbp
  401741:	48 89 e5             	mov    rbp,rsp
  401744:	b8 21 00 00 00       	mov    eax,0x21
  401749:	55                   	push   rbp
  40174a:	48 0f 05             	rex.W syscall 
  40174d:	5d                   	pop    rbp
  40174e:	c9                   	leave  
  40174f:	c3                   	ret    

0000000000401750 <kb_readc>:
  401750:	55                   	push   rbp
  401751:	48 89 e5             	mov    rbp,rsp
  401754:	b8 64 00 00 00       	mov    eax,0x64
  401759:	55                   	push   rbp
  40175a:	48 0f 05             	rex.W syscall 
  40175d:	5d                   	pop    rbp
  40175e:	c9                   	leave  
  40175f:	c3                   	ret    

0000000000401760 <remove>:
  401760:	55                   	push   rbp
  401761:	48 89 e5             	mov    rbp,rsp
  401764:	b8 22 00 00 00       	mov    eax,0x22
  401769:	55                   	push   rbp
  40176a:	48 0f 05             	rex.W syscall 
  40176d:	5d                   	pop    rbp
  40176e:	c9                   	leave  
  40176f:	c3                   	ret    

0000000000401770 <sbrk>:
  401770:	55                   	push   rbp
  401771:	48 89 e5             	mov    rbp,rsp
  401774:	b8 23 00 00 00       	mov    eax,0x23
  401779:	55                   	push   rbp
  40177a:	48 0f 05             	rex.W syscall 
  40177d:	5d                   	pop    rbp
  40177e:	c9                   	leave  
  40177f:	c3                   	ret    

0000000000401780 <chkmmap>:
  401780:	55                   	push   rbp
  401781:	48 89 e5             	mov    rbp,rsp
  401784:	b8 24 00 00 00       	mov    eax,0x24
  401789:	55                   	push   rbp
  40178a:	48 0f 05             	rex.W syscall 
  40178d:	5d                   	pop    rbp
  40178e:	c9                   	leave  
  40178f:	c3                   	ret    

0000000000401790 <_readdir>:
  401790:	55                   	push   rbp
  401791:	48 89 e5             	mov    rbp,rsp
  401794:	b8 25 00 00 00       	mov    eax,0x25
  401799:	55                   	push   rbp
  40179a:	48 0f 05             	rex.W syscall 
  40179d:	5d                   	pop    rbp
  40179e:	c9                   	leave  
  40179f:	c3                   	ret    

00000000004017a0 <create_window>:
  4017a0:	55                   	push   rbp
  4017a1:	48 89 e5             	mov    rbp,rsp
  4017a4:	b8 65 00 00 00       	mov    eax,0x65
  4017a9:	55                   	push   rbp
  4017aa:	48 0f 05             	rex.W syscall 
  4017ad:	5d                   	pop    rbp
  4017ae:	c9                   	leave  
  4017af:	c3                   	ret    

00000000004017b0 <destroy_window>:
  4017b0:	55                   	push   rbp
  4017b1:	48 89 e5             	mov    rbp,rsp
  4017b4:	b8 66 00 00 00       	mov    eax,0x66
  4017b9:	55                   	push   rbp
  4017ba:	48 0f 05             	rex.W syscall 
  4017bd:	5d                   	pop    rbp
  4017be:	c9                   	leave  
  4017bf:	c3                   	ret    

00000000004017c0 <show_window>:
  4017c0:	55                   	push   rbp
  4017c1:	48 89 e5             	mov    rbp,rsp
  4017c4:	b8 67 00 00 00       	mov    eax,0x67
  4017c9:	55                   	push   rbp
  4017ca:	48 0f 05             	rex.W syscall 
  4017cd:	5d                   	pop    rbp
  4017ce:	c9                   	leave  
  4017cf:	c3                   	ret    

00000000004017d0 <hide_window>:
  4017d0:	55                   	push   rbp
  4017d1:	48 89 e5             	mov    rbp,rsp
  4017d4:	b8 68 00 00 00       	mov    eax,0x68
  4017d9:	55                   	push   rbp
  4017da:	48 0f 05             	rex.W syscall 
  4017dd:	5d                   	pop    rbp
  4017de:	c9                   	leave  
  4017df:	c3                   	ret    

00000000004017e0 <resize_window>:
  4017e0:	55                   	push   rbp
  4017e1:	48 89 e5             	mov    rbp,rsp
  4017e4:	b8 69 00 00 00       	mov    eax,0x69
  4017e9:	55                   	push   rbp
  4017ea:	48 0f 05             	rex.W syscall 
  4017ed:	5d                   	pop    rbp
  4017ee:	c9                   	leave  
  4017ef:	c3                   	ret    

00000000004017f0 <move_window>:
  4017f0:	55                   	push   rbp
  4017f1:	48 89 e5             	mov    rbp,rsp
  4017f4:	b8 6a 00 00 00       	mov    eax,0x6a
  4017f9:	55                   	push   rbp
  4017fa:	48 0f 05             	rex.W syscall 
  4017fd:	5d                   	pop    rbp
  4017fe:	c9                   	leave  
  4017ff:	c3                   	ret    

0000000000401800 <set_window_text>:
  401800:	55                   	push   rbp
  401801:	48 89 e5             	mov    rbp,rsp
  401804:	b8 6b 00 00 00       	mov    eax,0x6b
  401809:	55                   	push   rbp
  40180a:	48 0f 05             	rex.W syscall 
  40180d:	5d                   	pop    rbp
  40180e:	c9                   	leave  
  40180f:	c3                   	ret    

0000000000401810 <attach_window>:
  401810:	55                   	push   rbp
  401811:	48 89 e5             	mov    rbp,rsp
  401814:	b8 6c 00 00 00       	mov    eax,0x6c
  401819:	55                   	push   rbp
  40181a:	48 0f 05             	rex.W syscall 
  40181d:	5d                   	pop    rbp
  40181e:	c9                   	leave  
  40181f:	c3                   	ret    

0000000000401820 <detach_window>:
  401820:	55                   	push   rbp
  401821:	48 89 e5             	mov    rbp,rsp
  401824:	b8 6d 00 00 00       	mov    eax,0x6d
  401829:	55                   	push   rbp
  40182a:	48 0f 05             	rex.W syscall 
  40182d:	5d                   	pop    rbp
  40182e:	c9                   	leave  
  40182f:	c3                   	ret    

0000000000401830 <add_window_event_listener>:
  401830:	55                   	push   rbp
  401831:	48 89 e5             	mov    rbp,rsp
  401834:	b8 6e 00 00 00       	mov    eax,0x6e
  401839:	55                   	push   rbp
  40183a:	48 0f 05             	rex.W syscall 
  40183d:	5d                   	pop    rbp
  40183e:	c9                   	leave  
  40183f:	c3                   	ret    

0000000000401840 <remove_window_event_listener>:
  401840:	55                   	push   rbp
  401841:	48 89 e5             	mov    rbp,rsp
  401844:	b8 6f 00 00 00       	mov    eax,0x6f
  401849:	55                   	push   rbp
  40184a:	48 0f 05             	rex.W syscall 
  40184d:	5d                   	pop    rbp
  40184e:	c9                   	leave  
  40184f:	c3                   	ret    

0000000000401850 <send_window_event>:
  401850:	55                   	push   rbp
  401851:	48 89 e5             	mov    rbp,rsp
  401854:	b8 70 00 00 00       	mov    eax,0x70
  401859:	55                   	push   rbp
  40185a:	48 0f 05             	rex.W syscall 
  40185d:	5d                   	pop    rbp
  40185e:	c9                   	leave  
  40185f:	c3                   	ret    

0000000000401860 <get_window_text>:
  401860:	55                   	push   rbp
  401861:	48 89 e5             	mov    rbp,rsp
  401864:	b8 71 00 00 00       	mov    eax,0x71
  401869:	55                   	push   rbp
  40186a:	48 0f 05             	rex.W syscall 
  40186d:	5d                   	pop    rbp
  40186e:	c9                   	leave  
  40186f:	c3                   	ret    

0000000000401870 <fetch_event>:
  401870:	55                   	push   rbp
  401871:	48 89 e5             	mov    rbp,rsp
  401874:	b8 72 00 00 00       	mov    eax,0x72
  401879:	55                   	push   rbp
  40187a:	48 0f 05             	rex.W syscall 
  40187d:	5d                   	pop    rbp
  40187e:	c9                   	leave  
  40187f:	c3                   	ret    

0000000000401880 <default_deal_window_event>:
  401880:	55                   	push   rbp
  401881:	48 89 e5             	mov    rbp,rsp
  401884:	b8 73 00 00 00       	mov    eax,0x73
  401889:	55                   	push   rbp
  40188a:	48 0f 05             	rex.W syscall 
  40188d:	5d                   	pop    rbp
  40188e:	c9                   	leave  
  40188f:	c3                   	ret    

Disassembly of section .text.puts:

0000000000401890 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  401890:	f3 0f 1e fa          	endbr64 
  401894:	41 54                	push   r12
  401896:	55                   	push   rbp
  401897:	48 89 fd             	mov    rbp,rdi
  40189a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  40189b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40189e:	40 84 ff             	test   dil,dil
  4018a1:	74 35                	je     4018d8 <puts+0x48>
  4018a3:	31 db                	xor    ebx,ebx
  4018a5:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  4018a8:	e8 13 26 00 00       	call   403ec0 <putchar>
  4018ad:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  4018b0:	48 83 c3 01          	add    rbx,0x1
  4018b4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4018b9:	40 84 ff             	test   dil,dil
  4018bc:	75 ea                	jne    4018a8 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  4018be:	bf 0a 00 00 00       	mov    edi,0xa
  4018c3:	e8 f8 25 00 00       	call   403ec0 <putchar>
		r++;
  4018c8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  4018cd:	5b                   	pop    rbx
  4018ce:	5d                   	pop    rbp
  4018cf:	41 5c                	pop    r12
  4018d1:	c3                   	ret    
  4018d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4018d8:	5b                   	pop    rbx
	return r ? r : EOF;
  4018d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  4018de:	5d                   	pop    rbp
  4018df:	41 5c                	pop    r12
  4018e1:	c3                   	ret    

Disassembly of section .text.gets:

00000000004018f0 <gets>:
#include "stdio.h"
char* gets(char* str)
{
  4018f0:	f3 0f 1e fa          	endbr64 
  4018f4:	41 54                	push   r12
  4018f6:	49 89 fc             	mov    r12,rdi
	*str = 0;
  4018f9:	c6 07 00             	mov    BYTE PTR [rdi],0x0
  4018fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
	while(1)
	{
		read(1, str, 1);
  401900:	ba 01 00 00 00       	mov    edx,0x1
  401905:	4c 89 e6             	mov    rsi,r12
  401908:	bf 01 00 00 00       	mov    edi,0x1
  40190d:	31 c0                	xor    eax,eax
  40190f:	e8 fc fc ff ff       	call   401610 <read>
		if(!*str)
  401914:	41 0f b6 04 24       	movzx  eax,BYTE PTR [r12]
  401919:	84 c0                	test   al,al
  40191b:	74 e3                	je     401900 <gets+0x10>
		{
			continue;
		}
		if(*str == '\n')
  40191d:	3c 0a                	cmp    al,0xa
  40191f:	74 1f                	je     401940 <gets+0x50>
			*str = '\0';
			break;
		}
		else if(*str == '\b')
		{
			str -= 2;
  401921:	3c 08                	cmp    al,0x8
  401923:	49 8d 54 24 fe       	lea    rdx,[r12-0x2]
  401928:	4c 0f 44 e2          	cmove  r12,rdx
		}
		*++str = 0;
  40192c:	41 c6 44 24 01 00    	mov    BYTE PTR [r12+0x1],0x0
  401932:	49 83 c4 01          	add    r12,0x1
  401936:	eb c8                	jmp    401900 <gets+0x10>
  401938:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40193f:	00 
	}
	return str;
  401940:	4c 89 e0             	mov    rax,r12
			*str = '\0';
  401943:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  401948:	41 5c                	pop    r12
  40194a:	c3                   	ret    

Disassembly of section .text.memset:

0000000000401950 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401950:	f3 0f 1e fa          	endbr64 
  401954:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401957:	48 85 d2             	test   rdx,rdx
  40195a:	74 77                	je     4019d3 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40195c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401961:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401964:	48 83 fa 02          	cmp    rdx,0x2
  401968:	76 69                	jbe    4019d3 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40196a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40196f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401973:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401978:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40197c:	48 83 fa 06          	cmp    rdx,0x6
  401980:	76 51                	jbe    4019d3 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401982:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401987:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40198b:	48 83 fa 08          	cmp    rdx,0x8
  40198f:	76 42                	jbe    4019d3 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401991:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401994:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401998:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40199b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40199e:	45 89 c1             	mov    r9d,r8d
	s += k;
  4019a1:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  4019a5:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  4019a8:	44 89 c7             	mov    edi,r8d
  4019ab:	41 c1 e1 10          	shl    r9d,0x10
  4019af:	c1 e7 08             	shl    edi,0x8
  4019b2:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  4019b6:	44 09 cf             	or     edi,r9d
  4019b9:	48 01 ca             	add    rdx,rcx
  4019bc:	44 09 c7             	or     edi,r8d
  4019bf:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  4019c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  4019c8:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  4019ca:	48 83 c1 04          	add    rcx,0x4
  4019ce:	48 39 ca             	cmp    rdx,rcx
  4019d1:	75 f5                	jne    4019c8 <memset+0x78>
	}

	return dest;
}
  4019d3:	c3                   	ret    

Disassembly of section .text.strcat:

00000000004019e0 <strcat>:
 */

#include <string.h>

char* strcat(char* __restrict dst, const char* __restrict src)
{
  4019e0:	f3 0f 1e fa          	endbr64 
  4019e4:	41 54                	push   r12
  4019e6:	49 89 fc             	mov    r12,rdi
  4019e9:	55                   	push   rbp
  4019ea:	48 89 f5             	mov    rbp,rsi
  4019ed:	53                   	push   rbx
	const size_t dstlen = strlen(dst);
  4019ee:	e8 7d 00 00 00       	call   401a70 <strlen>
	const size_t srclen = strlen(src);
  4019f3:	48 89 ef             	mov    rdi,rbp
	const size_t dstlen = strlen(dst);
  4019f6:	48 89 c3             	mov    rbx,rax
	const size_t srclen = strlen(src);
  4019f9:	e8 72 00 00 00       	call   401a70 <strlen>
	//  The strcat() and strncat() functions append a copy of the null-
	//  terminated string src to the end of the null-terminated string dst,
	//  then add a terminating '\0'.  The string dst must have sufficient
	//  space to hold the result.
	memcpy(dst + dstlen, src, srclen + 1);
  4019fe:	49 8d 3c 1c          	lea    rdi,[r12+rbx*1]
  401a02:	48 89 ee             	mov    rsi,rbp
  401a05:	48 8d 50 01          	lea    rdx,[rax+0x1]
  401a09:	e8 d2 2d 00 00       	call   4047e0 <memcpy>
	//  The strcat() and strncat() functions return dst.
	return dst;
}
  401a0e:	4c 89 e0             	mov    rax,r12
  401a11:	5b                   	pop    rbx
  401a12:	5d                   	pop    rbp
  401a13:	41 5c                	pop    r12
  401a15:	c3                   	ret    

Disassembly of section .text.strcmp:

0000000000401a20 <strcmp>:
 * Otherwise we compare the strings as normal.
 * We bail out when s1 ends (null-term)
 */

int strcmp(const char* s1, const char* s2)
{
  401a20:	f3 0f 1e fa          	endbr64 
	int r = -1;

	if(s1 == s2)
  401a24:	48 39 f7             	cmp    rdi,rsi
  401a27:	74 34                	je     401a5d <strcmp+0x3d>
		// short circuit - same string
		return 0;
	}

	// I don't want to panic with a NULL ptr - we'll fall through and fail w/ -1
	if(s1 != NULL && s2 != NULL)
  401a29:	48 85 ff             	test   rdi,rdi
  401a2c:	74 38                	je     401a66 <strcmp+0x46>
  401a2e:	48 85 f6             	test   rsi,rsi
  401a31:	74 33                	je     401a66 <strcmp+0x46>
	{
		// iterate through strings until they don't match or s1 ends (null-term)
		for(; *s1 == *s2; ++s1, ++s2)
  401a33:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401a36:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401a39:	38 ca                	cmp    dl,cl
  401a3b:	75 23                	jne    401a60 <strcmp+0x40>
  401a3d:	b8 01 00 00 00       	mov    eax,0x1
  401a42:	eb 15                	jmp    401a59 <strcmp+0x39>
  401a44:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401a48:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  401a4c:	48 83 c0 01          	add    rax,0x1
  401a50:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401a55:	38 ca                	cmp    dl,cl
  401a57:	75 07                	jne    401a60 <strcmp+0x40>
		{
			if(*s1 == 0)
  401a59:	84 d2                	test   dl,dl
  401a5b:	75 eb                	jne    401a48 <strcmp+0x28>
		return 0;
  401a5d:	31 c0                	xor    eax,eax
  401a5f:	c3                   	ret    
		}

		// handle case where we didn't break early - set return code.
		if(r != 0)
		{
			r = *(const char*)s1 - *(const char*)s2;
  401a60:	0f be c2             	movsx  eax,dl
  401a63:	29 c8                	sub    eax,ecx
		}
	}

	return r;
}
  401a65:	c3                   	ret    
	int r = -1;
  401a66:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401a6b:	c3                   	ret    

Disassembly of section .text.strlen:

0000000000401a70 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  401a70:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  401a74:	48 89 fe             	mov    rsi,rdi
  401a77:	40 f6 c7 07          	test   dil,0x7
  401a7b:	75 0d                	jne    401a8a <strlen+0x1a>
  401a7d:	eb 21                	jmp    401aa0 <strlen+0x30>
  401a7f:	90                   	nop
  401a80:	48 83 c7 01          	add    rdi,0x1
  401a84:	40 f6 c7 07          	test   dil,0x7
  401a88:	74 16                	je     401aa0 <strlen+0x30>
	{
		if(*p == '\0')
  401a8a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401a8d:	75 f1                	jne    401a80 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  401a8f:	48 89 f8             	mov    rax,rdi
  401a92:	48 29 f0             	sub    rax,rsi
  401a95:	c3                   	ret    
  401a96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401a9d:	00 00 00 
		if((*lp - mask01) & mask80)
  401aa0:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  401aa7:	fe fe fe 
  401aaa:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  401ab1:	80 80 80 
  401ab4:	eb 38                	jmp    401aee <strlen+0x7e>
  401ab6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401abd:	00 00 00 
			testbyte(1);
  401ac0:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  401ac4:	74 3a                	je     401b00 <strlen+0x90>
			testbyte(2);
  401ac6:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  401aca:	74 3c                	je     401b08 <strlen+0x98>
			testbyte(3);
  401acc:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  401ad0:	74 3e                	je     401b10 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  401ad2:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  401ad6:	74 40                	je     401b18 <strlen+0xa8>
			testbyte(5);
  401ad8:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  401adc:	74 42                	je     401b20 <strlen+0xb0>
			testbyte(6);
  401ade:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  401ae2:	74 44                	je     401b28 <strlen+0xb8>
			testbyte(7);
  401ae4:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  401ae8:	74 46                	je     401b30 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  401aea:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  401aee:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  401af1:	48 01 c8             	add    rax,rcx
  401af4:	48 85 d0             	test   rax,rdx
  401af7:	74 f1                	je     401aea <strlen+0x7a>
			testbyte(0);
  401af9:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401afc:	75 c2                	jne    401ac0 <strlen+0x50>
  401afe:	eb 8f                	jmp    401a8f <strlen+0x1f>
			testbyte(1);
  401b00:	48 29 f7             	sub    rdi,rsi
  401b03:	48 8d 47 01          	lea    rax,[rdi+0x1]
  401b07:	c3                   	ret    
			testbyte(2);
  401b08:	48 29 f7             	sub    rdi,rsi
  401b0b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  401b0f:	c3                   	ret    
			testbyte(3);
  401b10:	48 29 f7             	sub    rdi,rsi
  401b13:	48 8d 47 03          	lea    rax,[rdi+0x3]
  401b17:	c3                   	ret    
			testbyte(4);
  401b18:	48 29 f7             	sub    rdi,rsi
  401b1b:	48 8d 47 04          	lea    rax,[rdi+0x4]
  401b1f:	c3                   	ret    
			testbyte(5);
  401b20:	48 29 f7             	sub    rdi,rsi
  401b23:	48 8d 47 05          	lea    rax,[rdi+0x5]
  401b27:	c3                   	ret    
			testbyte(6);
  401b28:	48 29 f7             	sub    rdi,rsi
  401b2b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  401b2f:	c3                   	ret    
			testbyte(7);
  401b30:	48 29 f7             	sub    rdi,rsi
  401b33:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  401b37:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000401b40 <__libc_init_array>:
	return main(argc, argv, _environ);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  401b40:	f3 0f 1e fa          	endbr64 
  401b44:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401b46:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  401b4d:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401b4e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  401b55:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  401b56:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401b59:	48 c1 fd 03          	sar    rbp,0x3
  401b5d:	74 16                	je     401b75 <__libc_init_array+0x35>
  401b5f:	31 db                	xor    ebx,ebx
  401b61:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  401b68:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401b6c:	48 83 c3 01          	add    rbx,0x1
  401b70:	48 39 dd             	cmp    rbp,rbx
  401b73:	75 f3                	jne    401b68 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  401b75:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  401b7c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401b83:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  401b86:	48 c1 fd 03          	sar    rbp,0x3
  401b8a:	74 11                	je     401b9d <__libc_init_array+0x5d>
  401b8c:	31 db                	xor    ebx,ebx
  401b8e:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  401b90:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  401b94:	48 83 c3 01          	add    rbx,0x1
  401b98:	48 39 dd             	cmp    rbp,rbx
  401b9b:	75 f3                	jne    401b90 <__libc_init_array+0x50>
	}
}
  401b9d:	5b                   	pop    rbx
  401b9e:	5d                   	pop    rbp
  401b9f:	41 5c                	pop    r12
  401ba1:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000401bb0 <__libc_fini_array>:

void __libc_fini_array(void)
{
  401bb0:	f3 0f 1e fa          	endbr64 
  401bb4:	55                   	push   rbp
  401bb5:	53                   	push   rbx
  401bb6:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  401bba:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  401bc1:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  401bc8:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  401bcb:	48 c1 fb 03          	sar    rbx,0x3
  401bcf:	74 14                	je     401be5 <__libc_fini_array+0x35>
  401bd1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  401bd8:	48 83 eb 01          	sub    rbx,0x1
  401bdc:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  401be0:	48 85 db             	test   rbx,rbx
  401be3:	75 f3                	jne    401bd8 <__libc_fini_array+0x28>
	}
}
  401be5:	48 83 c4 08          	add    rsp,0x8
  401be9:	5b                   	pop    rbx
  401bea:	5d                   	pop    rbp
  401beb:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000401bf0 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  401bf0:	f3 0f 1e fa          	endbr64 
  401bf4:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  401bf8:	48 c7 c7 b6 5b 40 00 	mov    rdi,0x405bb6
  401bff:	48 c7 c2 70 5c 40 00 	mov    rdx,0x405c70
  401c06:	31 f6                	xor    esi,esi
  401c08:	48 29 fa             	sub    rdx,rdi
  401c0b:	e8 40 fd ff ff       	call   401950 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  401c10:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  401c14:	e9 27 ff ff ff       	jmp    401b40 <__libc_init_array>

Disassembly of section .text.entry:

0000000000401c20 <entry>:
{
  401c20:	f3 0f 1e fa          	endbr64 
  401c24:	41 55                	push   r13
  401c26:	49 89 f5             	mov    r13,rsi
  401c29:	41 54                	push   r12
  401c2b:	49 89 d4             	mov    r12,rdx
  401c2e:	55                   	push   rbp
  401c2f:	89 fd                	mov    ebp,edi
	CRTStartup();
  401c31:	e8 ba ff ff ff       	call   401bf0 <CRTStartup>
	environ = _environ;
  401c36:	48 c7 c0 70 5c 40 00 	mov    rax,0x405c70
	__heap_base = sbrk(0);
  401c3d:	31 ff                	xor    edi,edi
	environ = _environ;
  401c3f:	4c 89 20             	mov    QWORD PTR [rax],r12
	__heap_base = sbrk(0);
  401c42:	31 c0                	xor    eax,eax
  401c44:	e8 27 fb ff ff       	call   401770 <sbrk>
  401c49:	48 c7 c2 f0 5c 40 00 	mov    rdx,0x405cf0
	return main(argc, argv, _environ);
  401c50:	4c 89 ee             	mov    rsi,r13
  401c53:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  401c55:	89 02                	mov    DWORD PTR [rdx],eax
	return main(argc, argv, _environ);
  401c57:	4c 89 e2             	mov    rdx,r12
}
  401c5a:	5d                   	pop    rbp
  401c5b:	41 5c                	pop    r12
  401c5d:	41 5d                	pop    r13
	return main(argc, argv, _environ);
  401c5f:	e9 62 e4 ff ff       	jmp    4000c6 <main>

Disassembly of section .text.get_bit_access:

0000000000401c70 <get_bit_access>:
// 3. If you try to use it as C++, only C++20 supports compound literals
static inline double_with_bit_access get_bit_access(double x)
{
  double_with_bit_access dwba;
  dwba.F = x;
  return dwba;
  401c70:	66 48 0f 7e c0       	movq   rax,xmm0
}
  401c75:	c3                   	ret    

Disassembly of section .text.get_sign_bit:

0000000000401c80 <get_sign_bit>:

static inline int get_sign_bit(double x)
{
  // The sign is stored in the highest bit
  return (int) (get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1));
  401c80:	e8 eb ff ff ff       	call   401c70 <get_bit_access>
  401c85:	48 c1 e8 3f          	shr    rax,0x3f
}
  401c89:	c3                   	ret    

Disassembly of section .text.get_exp2:

0000000000401c90 <get_exp2>:
{
  // The exponent in an IEEE-754 floating-point number occupies a contiguous
  // sequence of bits (e.g. 52..62 for 64-bit doubles), but with a non-trivial representation: An
  // unsigned offset from some negative value (with the extremal offset values reserved for
  // special use).
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
  401c90:	48 89 f8             	mov    rax,rdi
  401c93:	48 c1 e8 34          	shr    rax,0x34
  401c97:	25 ff 07 00 00       	and    eax,0x7ff
  401c9c:	2d ff 03 00 00       	sub    eax,0x3ff
}
  401ca1:	c3                   	ret    

Disassembly of section .text.putchar_via_gadget:

0000000000401cb0 <putchar_via_gadget>:
// or alternatively, that '\0' can be passed to the function in the output
// gadget. The former assumption holds within the printf library. It also
// assumes that the output gadget has been properly initialized.
static inline void putchar_via_gadget(output_gadget_t* gadget, char c)
{
  printf_size_t write_pos = gadget->pos++;
  401cb0:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401cb3:	8d 50 01             	lea    edx,[rax+0x1]
  401cb6:	89 57 18             	mov    DWORD PTR [rdi+0x18],edx
    // We're _always_ increasing pos, so as to count how may characters
    // _would_ have been written if not for the max_chars limitation
  if (write_pos >= gadget->max_chars) {
  401cb9:	3b 47 1c             	cmp    eax,DWORD PTR [rdi+0x1c]
  401cbc:	73 22                	jae    401ce0 <putchar_via_gadget+0x30>
    return;
  }
  if (gadget->function != NULL) {
  401cbe:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  401cc1:	48 85 d2             	test   rdx,rdx
  401cc4:	74 12                	je     401cd8 <putchar_via_gadget+0x28>
    // No check for c == '\0' .
    gadget->function(c, gadget->extra_function_arg);
  401cc6:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
  401cca:	40 0f be fe          	movsx  edi,sil
  401cce:	4c 89 c6             	mov    rsi,r8
  401cd1:	ff e2                	jmp    rdx
  401cd3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  }
  else {
    // it must be the case that gadget->buffer != NULL , due to the constraint
    // on output_gadget_t ; and note we're relying on write_pos being non-negative.
    gadget->buffer[write_pos] = c;
  401cd8:	48 8b 57 10          	mov    rdx,QWORD PTR [rdi+0x10]
  401cdc:	40 88 34 02          	mov    BYTE PTR [rdx+rax*1],sil
  }
}
  401ce0:	c3                   	ret    

Disassembly of section .text.append_termination_with_gadget:

0000000000401cf0 <append_termination_with_gadget>:

// Possibly-write the string-terminating '\0' character
static inline void append_termination_with_gadget(output_gadget_t* gadget)
{
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401cf0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  401cf4:	74 0a                	je     401d00 <append_termination_with_gadget+0x10>
  if (gadget->buffer == NULL) {
    return;
  }
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  gadget->buffer[null_char_pos] = '\0';
}
  401cf6:	c3                   	ret    
  401cf7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401cfe:	00 00 
  if (gadget->function != NULL || gadget->max_chars == 0) {
  401d00:	8b 57 1c             	mov    edx,DWORD PTR [rdi+0x1c]
  401d03:	85 d2                	test   edx,edx
  401d05:	74 ef                	je     401cf6 <append_termination_with_gadget+0x6>
  if (gadget->buffer == NULL) {
  401d07:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
  401d0b:	48 85 c9             	test   rcx,rcx
  401d0e:	74 e6                	je     401cf6 <append_termination_with_gadget+0x6>
  printf_size_t null_char_pos = gadget->pos < gadget->max_chars ? gadget->pos : gadget->max_chars - 1;
  401d10:	8b 47 18             	mov    eax,DWORD PTR [rdi+0x18]
  401d13:	8d 72 ff             	lea    esi,[rdx-0x1]
  401d16:	39 c2                	cmp    edx,eax
  401d18:	48 0f 46 c6          	cmovbe rax,rsi
  gadget->buffer[null_char_pos] = '\0';
  401d1c:	c6 04 01 00          	mov    BYTE PTR [rcx+rax*1],0x0
}
  401d20:	c3                   	ret    

Disassembly of section .text.discarding_gadget:

0000000000401d30 <discarding_gadget>:
  gadget.function = NULL;
  gadget.extra_function_arg = NULL;
  gadget.buffer = NULL;
  gadget.pos = 0;
  gadget.max_chars = 0;
  return gadget;
  401d30:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
{
  401d37:	48 89 f8             	mov    rax,rdi
  return gadget;
  401d3a:	48 c7 47 08 00 00 00 	mov    QWORD PTR [rdi+0x8],0x0
  401d41:	00 
  401d42:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
  401d49:	00 
  401d4a:	48 c7 47 18 00 00 00 	mov    QWORD PTR [rdi+0x18],0x0
  401d51:	00 
}
  401d52:	c3                   	ret    

Disassembly of section .text.buffer_gadget:

0000000000401d60 <buffer_gadget>:

static inline output_gadget_t buffer_gadget(char* buffer, size_t buffer_size)
{
  401d60:	48 83 ec 28          	sub    rsp,0x28
  401d64:	49 89 f8             	mov    r8,rdi
  printf_size_t usable_buffer_size = (buffer_size > PRINTF_MAX_POSSIBLE_BUFFER_SIZE) ?
    PRINTF_MAX_POSSIBLE_BUFFER_SIZE : (printf_size_t) buffer_size;
  output_gadget_t result = discarding_gadget();
  401d67:	48 89 e7             	mov    rdi,rsp
  401d6a:	e8 c1 ff ff ff       	call   401d30 <discarding_gadget>
  401d6f:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
  401d74:	8b 44 24 1c          	mov    eax,DWORD PTR [rsp+0x1c]
  if (buffer != NULL) {
  401d78:	48 85 f6             	test   rsi,rsi
  401d7b:	74 33                	je     401db0 <buffer_gadget+0x50>
  401d7d:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  401d82:	48 39 c2             	cmp    rdx,rax
  401d85:	48 0f 46 c2          	cmovbe rax,rdx
    result.buffer = buffer;
    result.max_chars = usable_buffer_size;
  }
  return result;
  401d89:	89 44 24 1c          	mov    DWORD PTR [rsp+0x1c],eax
  401d8d:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
}
  401d92:	4c 89 c0             	mov    rax,r8
  return result;
  401d95:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
  401d9a:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401da0:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401da4:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401da9:	48 83 c4 28          	add    rsp,0x28
  401dad:	c3                   	ret    
  401dae:	66 90                	xchg   ax,ax
  output_gadget_t result = discarding_gadget();
  401db0:	48 89 ce             	mov    rsi,rcx
  401db3:	eb d4                	jmp    401d89 <buffer_gadget+0x29>

Disassembly of section .text.function_gadget:

0000000000401dc0 <function_gadget>:

static inline output_gadget_t function_gadget(void (*function)(char, void*), void* extra_arg)
{
  401dc0:	48 83 ec 28          	sub    rsp,0x28
  401dc4:	49 89 f8             	mov    r8,rdi
  output_gadget_t result = discarding_gadget();
  401dc7:	48 89 e7             	mov    rdi,rsp
  401dca:	e8 61 ff ff ff       	call   401d30 <discarding_gadget>
  result.function = function;
  result.extra_function_arg = extra_arg;
  result.max_chars = PRINTF_MAX_POSSIBLE_BUFFER_SIZE;
  return result;
  401dcf:	48 89 34 24          	mov    QWORD PTR [rsp],rsi
}
  401dd3:	4c 89 c0             	mov    rax,r8
  return result;
  401dd6:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
  401ddb:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
  401de0:	c7 44 24 1c ff ff ff 	mov    DWORD PTR [rsp+0x1c],0x7fffffff
  401de7:	7f 
  401de8:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
  401dee:	41 0f 11 00          	movups XMMWORD PTR [r8],xmm0
  401df2:	41 0f 11 48 10       	movups XMMWORD PTR [r8+0x10],xmm1
}
  401df7:	48 83 c4 28          	add    rsp,0x28
  401dfb:	c3                   	ret    

Disassembly of section .text.extern_putchar_gadget:

0000000000401e00 <extern_putchar_gadget>:

static inline output_gadget_t extern_putchar_gadget(void)
{
  401e00:	48 83 ec 08          	sub    rsp,0x8
  401e04:	49 89 f9             	mov    r9,rdi
  return function_gadget(putchar_wrapper, NULL);
  401e07:	48 8d 35 e2 07 00 00 	lea    rsi,[rip+0x7e2]        # 4025f0 <putchar_wrapper>
  401e0e:	31 d2                	xor    edx,edx
  401e10:	e8 ab ff ff ff       	call   401dc0 <function_gadget>
}
  401e15:	4c 89 c8             	mov    rax,r9
  401e18:	48 83 c4 08          	add    rsp,0x8
  401e1c:	c3                   	ret    

Disassembly of section .text.strnlen_s_:

0000000000401e20 <strnlen_s_>:
// @note strlen uses size_t, but wes only use this function with printf_size_t
// variables - hence the signature.
static inline printf_size_t strnlen_s_(const char* str, printf_size_t maxsize)
{
  const char* s;
  for (s = str; *s && maxsize--; ++s);
  401e20:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  401e23:	74 33                	je     401e58 <strnlen_s_+0x38>
  401e25:	85 f6                	test   esi,esi
  401e27:	74 2f                	je     401e58 <strnlen_s_+0x38>
  401e29:	89 f6                	mov    esi,esi
  401e2b:	48 89 f8             	mov    rax,rdi
  401e2e:	48 8d 14 37          	lea    rdx,[rdi+rsi*1]
  401e32:	eb 09                	jmp    401e3d <strnlen_s_+0x1d>
  401e34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401e38:	48 39 c2             	cmp    rdx,rax
  401e3b:	74 13                	je     401e50 <strnlen_s_+0x30>
  401e3d:	48 83 c0 01          	add    rax,0x1
  401e41:	80 38 00             	cmp    BYTE PTR [rax],0x0
  401e44:	75 f2                	jne    401e38 <strnlen_s_+0x18>
  return (printf_size_t)(s - str);
  401e46:	29 f8                	sub    eax,edi
  401e48:	c3                   	ret    
  401e49:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401e50:	89 d0                	mov    eax,edx
  401e52:	29 f8                	sub    eax,edi
  401e54:	c3                   	ret    
  401e55:	0f 1f 00             	nop    DWORD PTR [rax]
  for (s = str; *s && maxsize--; ++s);
  401e58:	31 c0                	xor    eax,eax
}
  401e5a:	c3                   	ret    

Disassembly of section .text.is_digit_:

0000000000401e60 <is_digit_>:

// internal test if char is a digit (0-9)
// @return true if char is a digit
static inline bool is_digit_(char ch)
{
  return (ch >= '0') && (ch <= '9');
  401e60:	83 ef 30             	sub    edi,0x30
  401e63:	40 80 ff 09          	cmp    dil,0x9
  401e67:	0f 96 c0             	setbe  al
}
  401e6a:	c3                   	ret    

Disassembly of section .text.atou_:

0000000000401e70 <atou_>:

// internal ASCII string to printf_size_t conversion
static printf_size_t atou_(const char** str)
{
  printf_size_t i = 0U;
  while (is_digit_(**str)) {
  401e70:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
{
  401e73:	48 89 fe             	mov    rsi,rdi
  printf_size_t i = 0U;
  401e76:	45 31 c0             	xor    r8d,r8d
  while (is_digit_(**str)) {
  401e79:	eb 19                	jmp    401e94 <atou_+0x24>
  401e7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    i = i * 10U + (printf_size_t)(*((*str)++) - '0');
  401e80:	48 83 c2 01          	add    rdx,0x1
  401e84:	43 8d 0c 80          	lea    ecx,[r8+r8*4]
  401e88:	48 89 16             	mov    QWORD PTR [rsi],rdx
  401e8b:	0f be 42 ff          	movsx  eax,BYTE PTR [rdx-0x1]
  401e8f:	44 8d 44 48 d0       	lea    r8d,[rax+rcx*2-0x30]
  while (is_digit_(**str)) {
  401e94:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  401e97:	e8 c4 ff ff ff       	call   401e60 <is_digit_>
  401e9c:	84 c0                	test   al,al
  401e9e:	75 e0                	jne    401e80 <atou_+0x10>
  }
  return i;
}
  401ea0:	44 89 c0             	mov    eax,r8d
  401ea3:	c3                   	ret    

Disassembly of section .text.out_rev_:

0000000000401eb0 <out_rev_>:


// output the specified string in reverse, taking care of any zero-padding
static void out_rev_(output_gadget_t* output, const char* buf, printf_size_t len, printf_size_t width, printf_flags_t flags)
{
  401eb0:	41 57                	push   r15
  401eb2:	44 89 c0             	mov    eax,r8d
  401eb5:	49 89 ff             	mov    r15,rdi
  401eb8:	41 56                	push   r14
  401eba:	41 55                	push   r13
  401ebc:	41 89 d5             	mov    r13d,edx
  401ebf:	41 54                	push   r12
  401ec1:	49 89 f4             	mov    r12,rsi
  401ec4:	55                   	push   rbp
  401ec5:	89 cd                	mov    ebp,ecx
  401ec7:	53                   	push   rbx
  401ec8:	48 83 ec 18          	sub    rsp,0x18
  const printf_size_t start_pos = output->pos;
  401ecc:	44 8b 77 18          	mov    r14d,DWORD PTR [rdi+0x18]
{
  401ed0:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
  401ed5:	a8 03                	test   al,0x3
  401ed7:	75 1b                	jne    401ef4 <out_rev_+0x44>
    for (printf_size_t i = len; i < width; i++) {
  401ed9:	39 ca                	cmp    edx,ecx
  401edb:	73 17                	jae    401ef4 <out_rev_+0x44>
  401edd:	89 d3                	mov    ebx,edx
  401edf:	90                   	nop
      putchar_via_gadget(output, ' ');
  401ee0:	be 20 00 00 00       	mov    esi,0x20
  401ee5:	4c 89 ff             	mov    rdi,r15
    for (printf_size_t i = len; i < width; i++) {
  401ee8:	83 c3 01             	add    ebx,0x1
      putchar_via_gadget(output, ' ');
  401eeb:	e8 c0 fd ff ff       	call   401cb0 <putchar_via_gadget>
    for (printf_size_t i = len; i < width; i++) {
  401ef0:	39 dd                	cmp    ebp,ebx
  401ef2:	75 ec                	jne    401ee0 <out_rev_+0x30>
    }
  }

  // reverse string
  while (len) {
  401ef4:	41 8d 5d ff          	lea    ebx,[r13-0x1]
  401ef8:	4c 01 e3             	add    rbx,r12
  401efb:	45 85 ed             	test   r13d,r13d
  401efe:	74 17                	je     401f17 <out_rev_+0x67>
    putchar_via_gadget(output, buf[--len]);
  401f00:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401f03:	4c 89 ff             	mov    rdi,r15
  401f06:	e8 a5 fd ff ff       	call   401cb0 <putchar_via_gadget>
  while (len) {
  401f0b:	48 89 da             	mov    rdx,rbx
  401f0e:	48 83 eb 01          	sub    rbx,0x1
  401f12:	49 39 d4             	cmp    r12,rdx
  401f15:	75 e9                	jne    401f00 <out_rev_+0x50>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
  401f17:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401f1c:	74 2a                	je     401f48 <out_rev_+0x98>
    while (output->pos - start_pos < width) {
  401f1e:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401f22:	44 29 f2             	sub    edx,r14d
  401f25:	39 d5                	cmp    ebp,edx
  401f27:	76 1f                	jbe    401f48 <out_rev_+0x98>
  401f29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      putchar_via_gadget(output, ' ');
  401f30:	be 20 00 00 00       	mov    esi,0x20
  401f35:	4c 89 ff             	mov    rdi,r15
  401f38:	e8 73 fd ff ff       	call   401cb0 <putchar_via_gadget>
    while (output->pos - start_pos < width) {
  401f3d:	41 8b 57 18          	mov    edx,DWORD PTR [r15+0x18]
  401f41:	44 29 f2             	sub    edx,r14d
  401f44:	39 ea                	cmp    edx,ebp
  401f46:	72 e8                	jb     401f30 <out_rev_+0x80>
    }
  }
}
  401f48:	48 83 c4 18          	add    rsp,0x18
  401f4c:	5b                   	pop    rbx
  401f4d:	5d                   	pop    rbp
  401f4e:	41 5c                	pop    r12
  401f50:	41 5d                	pop    r13
  401f52:	41 5e                	pop    r14
  401f54:	41 5f                	pop    r15
  401f56:	c3                   	ret    

Disassembly of section .text.print_integer_finalization:

0000000000401f60 <print_integer_finalization>:


// Invoked by print_integer after the actual number has been printed, performing necessary
// work on the number's prefix (as the number is initially printed in reverse order)
static void print_integer_finalization(output_gadget_t* output, char* buf, printf_size_t len, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  401f60:	55                   	push   rbp
  401f61:	44 89 c5             	mov    ebp,r8d
  {
    if (!(flags & FLAGS_LEFT)) {
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
        width--;
      }
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f64:	83 fa 1f             	cmp    edx,0x1f
{
  401f67:	49 89 f3             	mov    r11,rsi
  401f6a:	53                   	push   rbx
  401f6b:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
  401f70:	89 d6                	mov    esi,edx
  401f72:	89 cb                	mov    ebx,ecx
  401f74:	44 8b 54 24 18       	mov    r10d,DWORD PTR [rsp+0x18]
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401f79:	0f 96 c0             	setbe  al
    if (!(flags & FLAGS_LEFT)) {
  401f7c:	41 f6 c0 02          	test   r8b,0x2
  401f80:	0f 85 fa 00 00 00    	jne    402080 <print_integer_finalization+0x120>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  401f86:	44 89 c2             	mov    edx,r8d
  401f89:	83 e2 01             	and    edx,0x1
  401f8c:	45 85 d2             	test   r10d,r10d
  401f8f:	0f 84 eb 00 00 00    	je     402080 <print_integer_finalization+0x120>
  401f95:	85 d2                	test   edx,edx
  401f97:	0f 84 e3 00 00 00    	je     402080 <print_integer_finalization+0x120>
  401f9d:	84 c9                	test   cl,cl
  401f9f:	0f 85 cb 01 00 00    	jne    402170 <print_integer_finalization+0x210>
  401fa5:	41 f6 c0 0c          	test   r8b,0xc
  401fa9:	0f 85 c1 01 00 00    	jne    402170 <print_integer_finalization+0x210>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401faf:	44 39 d6             	cmp    esi,r10d
  401fb2:	0f 83 c8 00 00 00    	jae    402080 <print_integer_finalization+0x120>
  401fb8:	84 c0                	test   al,al
  401fba:	0f 84 c0 00 00 00    	je     402080 <print_integer_finalization+0x120>
  401fc0:	89 f0                	mov    eax,esi
  401fc2:	89 f2                	mov    edx,esi
  401fc4:	4c 01 d8             	add    rax,r11
  401fc7:	eb 0b                	jmp    401fd4 <print_integer_finalization+0x74>
  401fc9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401fd0:	84 c9                	test   cl,cl
  401fd2:	74 15                	je     401fe9 <print_integer_finalization+0x89>
        buf[len++] = '0';
  401fd4:	83 c2 01             	add    edx,0x1
  401fd7:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fda:	83 fa 1f             	cmp    edx,0x1f
  401fdd:	0f 96 c1             	setbe  cl
  401fe0:	48 83 c0 01          	add    rax,0x1
  401fe4:	44 39 d2             	cmp    edx,r10d
  401fe7:	72 e7                	jb     401fd0 <print_integer_finalization+0x70>
      }
    }

    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  401fe9:	44 39 ca             	cmp    edx,r9d
  401fec:	73 26                	jae    402014 <print_integer_finalization+0xb4>
  401fee:	84 c9                	test   cl,cl
  401ff0:	74 22                	je     402014 <print_integer_finalization+0xb4>
  401ff2:	89 d0                	mov    eax,edx
  401ff4:	4c 01 d8             	add    rax,r11
  401ff7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401ffe:	00 00 
      buf[len++] = '0';
  402000:	83 c2 01             	add    edx,0x1
  402003:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402006:	48 83 c0 01          	add    rax,0x1
  40200a:	41 39 d1             	cmp    r9d,edx
  40200d:	76 05                	jbe    402014 <print_integer_finalization+0xb4>
  40200f:	83 fa 1f             	cmp    edx,0x1f
  402012:	76 ec                	jbe    402000 <print_integer_finalization+0xa0>
    }

    if (base == BASE_OCTAL && (len > unpadded_len)) {
  402014:	39 d6                	cmp    esi,edx
  402016:	0f 92 c0             	setb   al
  402019:	40 80 fd 08          	cmp    bpl,0x8
  40201d:	0f 94 c1             	sete   cl
  402020:	20 c1                	and    cl,al
  402022:	74 06                	je     40202a <print_integer_finalization+0xca>
      // Since we've written some zeros, we've satisfied the alternative format leading space requirement
      flags &= ~FLAGS_HASH;
  402024:	41 83 e0 ef          	and    r8d,0xffffffef
    if (base == BASE_OCTAL && (len > unpadded_len)) {
  402028:	89 c8                	mov    eax,ecx
    }
  }

  // handle hash
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
  40202a:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  402031:	0f 84 8c 00 00 00    	je     4020c3 <print_integer_finalization+0x163>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  402037:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40203e:	74 58                	je     402098 <print_integer_finalization+0x138>
      }
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
        len--; // ... and an extra one for 0x or 0b
      }
    }
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402040:	83 fa 1f             	cmp    edx,0x1f
  402043:	0f 96 c0             	setbe  al
  402046:	40 80 fd 10          	cmp    bpl,0x10
  40204a:	0f 84 30 01 00 00    	je     402180 <print_integer_finalization+0x220>
      buf[len++] = 'x';
    }
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402050:	40 80 fd 02          	cmp    bpl,0x2
  402054:	75 0e                	jne    402064 <print_integer_finalization+0x104>
  402056:	84 c0                	test   al,al
  402058:	74 0a                	je     402064 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  40205a:	89 d0                	mov    eax,edx
  40205c:	83 c2 01             	add    edx,0x1
  40205f:	41 c6 04 03 62       	mov    BYTE PTR [r11+rax*1],0x62
    }
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  402064:	83 fa 20             	cmp    edx,0x20
  402067:	75 50                	jne    4020b9 <print_integer_finalization+0x159>
      buf[len++] = ' ';
    }
  }

  out_rev_(output, buf, len, width, flags);
}
  402069:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  40206a:	44 89 d1             	mov    ecx,r10d
  40206d:	4c 89 de             	mov    rsi,r11
}
  402070:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  402071:	e9 3a fe ff ff       	jmp    401eb0 <out_rev_>
  402076:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40207d:	00 00 00 
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402080:	44 39 ce             	cmp    esi,r9d
  402083:	89 f2                	mov    edx,esi
  402085:	0f 92 c1             	setb   cl
  402088:	20 c8                	and    al,cl
  40208a:	0f 85 62 ff ff ff    	jne    401ff2 <print_integer_finalization+0x92>
  402090:	eb 98                	jmp    40202a <print_integer_finalization+0xca>
  402092:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  402098:	85 d2                	test   edx,edx
  40209a:	75 74                	jne    402110 <print_integer_finalization+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40209c:	40 80 fd 10          	cmp    bpl,0x10
  4020a0:	0f 84 05 01 00 00    	je     4021ab <print_integer_finalization+0x24b>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4020a6:	40 80 fd 02          	cmp    bpl,0x2
  4020aa:	0f 85 2e 01 00 00    	jne    4021de <print_integer_finalization+0x27e>
      buf[len++] = 'b';
  4020b0:	41 c6 03 62          	mov    BYTE PTR [r11],0x62
  4020b4:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = '0';
  4020b9:	89 d0                	mov    eax,edx
  4020bb:	83 c2 01             	add    edx,0x1
  4020be:	41 c6 04 03 30       	mov    BYTE PTR [r11+rax*1],0x30
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
  4020c3:	83 fa 20             	cmp    edx,0x20
  4020c6:	74 a1                	je     402069 <print_integer_finalization+0x109>
    if (negative) {
  4020c8:	84 db                	test   bl,bl
  4020ca:	74 1c                	je     4020e8 <print_integer_finalization+0x188>
      buf[len++] = '-';
  4020cc:	89 d0                	mov    eax,edx
}
  4020ce:	5b                   	pop    rbx
      buf[len++] = '-';
  4020cf:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  4020d2:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '-';
  4020d5:	41 c6 04 03 2d       	mov    BYTE PTR [r11+rax*1],0x2d
  out_rev_(output, buf, len, width, flags);
  4020da:	4c 89 de             	mov    rsi,r11
}
  4020dd:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  4020de:	e9 cd fd ff ff       	jmp    401eb0 <out_rev_>
  4020e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    else if (flags & FLAGS_PLUS) {
  4020e8:	41 f6 c0 04          	test   r8b,0x4
  4020ec:	75 62                	jne    402150 <print_integer_finalization+0x1f0>
    else if (flags & FLAGS_SPACE) {
  4020ee:	41 f6 c0 08          	test   r8b,0x8
  4020f2:	0f 84 71 ff ff ff    	je     402069 <print_integer_finalization+0x109>
      buf[len++] = ' ';
  4020f8:	89 d0                	mov    eax,edx
  4020fa:	83 c2 01             	add    edx,0x1
  4020fd:	41 c6 04 03 20       	mov    BYTE PTR [r11+rax*1],0x20
  402102:	e9 62 ff ff ff       	jmp    402069 <print_integer_finalization+0x109>
  402107:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40210e:	00 00 
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
  402110:	41 39 d1             	cmp    r9d,edx
  402113:	74 09                	je     40211e <print_integer_finalization+0x1be>
  402115:	44 39 d2             	cmp    edx,r10d
  402118:	0f 85 22 ff ff ff    	jne    402040 <print_integer_finalization+0xe0>
      if (unpadded_len < len) {
  40211e:	84 c0                	test   al,al
  402120:	0f 85 99 00 00 00    	jne    4021bf <print_integer_finalization+0x25f>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  402126:	40 80 fd 10          	cmp    bpl,0x10
  40212a:	0f 94 c0             	sete   al
  40212d:	40 80 fd 02          	cmp    bpl,0x2
  402131:	0f 94 c1             	sete   cl
  402134:	08 c8                	or     al,cl
  402136:	0f 84 04 ff ff ff    	je     402040 <print_integer_finalization+0xe0>
  40213c:	39 d6                	cmp    esi,edx
        len--; // ... and an extra one for 0x or 0b
  40213e:	83 da 00             	sbb    edx,0x0
  402141:	e9 fa fe ff ff       	jmp    402040 <print_integer_finalization+0xe0>
  402146:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40214d:	00 00 00 
      buf[len++] = '+';  // ignore the space if the '+' exists
  402150:	89 d0                	mov    eax,edx
}
  402152:	5b                   	pop    rbx
      buf[len++] = '+';  // ignore the space if the '+' exists
  402153:	83 c2 01             	add    edx,0x1
  out_rev_(output, buf, len, width, flags);
  402156:	44 89 d1             	mov    ecx,r10d
      buf[len++] = '+';  // ignore the space if the '+' exists
  402159:	41 c6 04 03 2b       	mov    BYTE PTR [r11+rax*1],0x2b
  out_rev_(output, buf, len, width, flags);
  40215e:	4c 89 de             	mov    rsi,r11
}
  402161:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  402162:	e9 49 fd ff ff       	jmp    401eb0 <out_rev_>
  402167:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40216e:	00 00 
        width--;
  402170:	41 83 ea 01          	sub    r10d,0x1
  402174:	e9 36 fe ff ff       	jmp    401faf <print_integer_finalization+0x4f>
  402179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  402180:	44 89 c1             	mov    ecx,r8d
  402183:	83 e1 20             	and    ecx,0x20
  402186:	75 0c                	jne    402194 <print_integer_finalization+0x234>
  402188:	84 c0                	test   al,al
  40218a:	75 60                	jne    4021ec <print_integer_finalization+0x28c>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  40218c:	85 c9                	test   ecx,ecx
  40218e:	0f 84 d0 fe ff ff    	je     402064 <print_integer_finalization+0x104>
  402194:	84 c0                	test   al,al
  402196:	0f 84 c8 fe ff ff    	je     402064 <print_integer_finalization+0x104>
      buf[len++] = 'b';
  40219c:	89 d0                	mov    eax,edx
  40219e:	83 c2 01             	add    edx,0x1
      buf[len++] = 'X';
  4021a1:	41 c6 04 03 58       	mov    BYTE PTR [r11+rax*1],0x58
  4021a6:	e9 b9 fe ff ff       	jmp    402064 <print_integer_finalization+0x104>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
  4021ab:	41 f6 c0 20          	test   r8b,0x20
  4021af:	75 1f                	jne    4021d0 <print_integer_finalization+0x270>
      buf[len++] = 'x';
  4021b1:	41 c6 03 78          	mov    BYTE PTR [r11],0x78
  4021b5:	ba 01 00 00 00       	mov    edx,0x1
  4021ba:	e9 fa fe ff ff       	jmp    4020b9 <print_integer_finalization+0x159>
      if (len && (base == BASE_HEX || base == BASE_BINARY) && (unpadded_len < len)) {
  4021bf:	83 ea 01             	sub    edx,0x1
  4021c2:	0f 84 d4 fe ff ff    	je     40209c <print_integer_finalization+0x13c>
  4021c8:	e9 59 ff ff ff       	jmp    402126 <print_integer_finalization+0x1c6>
  4021cd:	0f 1f 00             	nop    DWORD PTR [rax]
      buf[len++] = 'X';
  4021d0:	41 c6 03 58          	mov    BYTE PTR [r11],0x58
  4021d4:	ba 01 00 00 00       	mov    edx,0x1
  4021d9:	e9 db fe ff ff       	jmp    4020b9 <print_integer_finalization+0x159>
      buf[len++] = '0';
  4021de:	41 c6 03 30          	mov    BYTE PTR [r11],0x30
  4021e2:	ba 01 00 00 00       	mov    edx,0x1
  4021e7:	e9 dc fe ff ff       	jmp    4020c8 <print_integer_finalization+0x168>
      buf[len++] = 'b';
  4021ec:	89 d0                	mov    eax,edx
  4021ee:	83 c2 01             	add    edx,0x1
      buf[len++] = 'x';
  4021f1:	41 c6 04 03 78       	mov    BYTE PTR [r11+rax*1],0x78
  4021f6:	e9 69 fe ff ff       	jmp    402064 <print_integer_finalization+0x104>

Disassembly of section .text.print_integer:

0000000000402200 <print_integer>:

// An internal itoa-like function
static void print_integer(output_gadget_t* output, printf_unsigned_value_t value, bool negative, numeric_base_t base, printf_size_t precision, printf_size_t width, printf_flags_t flags)
{
  402200:	41 57                	push   r15
  402202:	41 56                	push   r14
  402204:	41 55                	push   r13
  402206:	41 89 cd             	mov    r13d,ecx
  402209:	41 54                	push   r12
  40220b:	49 89 fc             	mov    r12,rdi
  40220e:	55                   	push   rbp
  40220f:	53                   	push   rbx
  402210:	89 d3                	mov    ebx,edx
  402212:	48 83 ec 28          	sub    rsp,0x28
  402216:	44 8b 74 24 60       	mov    r14d,DWORD PTR [rsp+0x60]
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  printf_size_t len = 0U;

  if (!value) {
  40221b:	48 85 f6             	test   rsi,rsi
  40221e:	75 48                	jne    402268 <print_integer+0x68>
    if ( !(flags & FLAGS_PRECISION) ) {
  402220:	41 f7 c6 00 08 00 00 	test   r14d,0x800
  402227:	0f 85 a3 00 00 00    	jne    4022d0 <print_integer+0xd0>
      buf[len++] = '0';
  40222d:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
      flags &= ~FLAGS_HASH;
  402231:	41 83 e6 ef          	and    r14d,0xffffffef
      buf[len++] = '0';
  402235:	ba 01 00 00 00       	mov    edx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  print_integer_finalization(output, buf, len, negative, base, precision, width, flags);
  40223a:	48 89 e6             	mov    rsi,rsp
  40223d:	41 56                	push   r14
  40223f:	0f b6 cb             	movzx  ecx,bl
  402242:	4c 89 e7             	mov    rdi,r12
  402245:	41 51                	push   r9
  402247:	45 89 c1             	mov    r9d,r8d
  40224a:	45 0f b6 c5          	movzx  r8d,r13b
  40224e:	e8 0d fd ff ff       	call   401f60 <print_integer_finalization>
}
  402253:	48 83 c4 38          	add    rsp,0x38
  402257:	5b                   	pop    rbx
  402258:	5d                   	pop    rbp
  402259:	41 5c                	pop    r12
  40225b:	41 5d                	pop    r13
  40225d:	41 5e                	pop    r14
  40225f:	41 5f                	pop    r15
  402261:	c3                   	ret    
  402262:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  402268:	44 89 f0             	mov    eax,r14d
      const char digit = (char)(value % base);
  40226b:	44 0f b6 d1          	movzx  r10d,cl
  40226f:	48 8d 6c 24 ff       	lea    rbp,[rsp-0x1]
  402274:	b9 01 00 00 00       	mov    ecx,0x1
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  402279:	83 e0 20             	and    eax,0x20
  40227c:	83 f8 01             	cmp    eax,0x1
  40227f:	45 19 db             	sbb    r11d,r11d
  402282:	41 83 e3 20          	and    r11d,0x20
  402286:	41 83 c3 37          	add    r11d,0x37
  40228a:	eb 07                	jmp    402293 <print_integer+0x93>
  40228c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      value /= base;
  402290:	48 89 c6             	mov    rsi,rax
      const char digit = (char)(value % base);
  402293:	31 d2                	xor    edx,edx
  402295:	48 89 f0             	mov    rax,rsi
  402298:	49 f7 f2             	div    r10
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
  40229b:	48 83 fa 09          	cmp    rdx,0x9
  40229f:	44 8d 7a 30          	lea    r15d,[rdx+0x30]
  4022a3:	41 8d 3c 13          	lea    edi,[r11+rdx*1]
  4022a7:	89 ca                	mov    edx,ecx
  4022a9:	41 0f 46 ff          	cmovbe edi,r15d
  4022ad:	40 88 7c 0d 00       	mov    BYTE PTR [rbp+rcx*1+0x0],dil
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  4022b2:	48 83 c1 01          	add    rcx,0x1
  4022b6:	4c 39 d6             	cmp    rsi,r10
  4022b9:	0f 82 7b ff ff ff    	jb     40223a <print_integer+0x3a>
  4022bf:	83 fa 1f             	cmp    edx,0x1f
  4022c2:	76 cc                	jbe    402290 <print_integer+0x90>
  4022c4:	e9 71 ff ff ff       	jmp    40223a <print_integer+0x3a>
  4022c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      flags &= ~FLAGS_HASH;
  4022d0:	44 89 f0             	mov    eax,r14d
  printf_size_t len = 0U;
  4022d3:	31 d2                	xor    edx,edx
      flags &= ~FLAGS_HASH;
  4022d5:	41 83 e6 ef          	and    r14d,0xffffffef
  4022d9:	80 f9 10             	cmp    cl,0x10
  4022dc:	44 0f 45 f0          	cmovne r14d,eax
  4022e0:	e9 55 ff ff ff       	jmp    40223a <print_integer+0x3a>

Disassembly of section .text.get_components:

00000000004022f0 <get_components>:
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, printf_size_t precision)
{
  struct double_components number_;
  number_.is_negative = get_sign_bit(number);
  4022f0:	e8 8b f9 ff ff       	call   401c80 <get_sign_bit>
{
  4022f5:	49 89 f8             	mov    r8,rdi
  number_.is_negative = get_sign_bit(number);
  4022f8:	85 c0                	test   eax,eax
  4022fa:	0f 95 c1             	setne  cl
  double abs_number = (number_.is_negative) ? -number : number;
  4022fd:	74 08                	je     402307 <get_components+0x17>
  4022ff:	66 0f 57 05 69 35 00 	xorpd  xmm0,XMMWORD PTR [rip+0x3569]        # 405870 <powers_of_10+0x90>
  402306:	00 
  number_.integral = (int_fast64_t)abs_number;
  402307:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40230c:	66 0f ef d2          	pxor   xmm2,xmm2
  402310:	66 0f 28 c8          	movapd xmm1,xmm0
  402314:	89 f0                	mov    eax,esi
  402316:	48 8d 3d c3 34 00 00 	lea    rdi,[rip+0x34c3]        # 4057e0 <powers_of_10>
  40231d:	f2 0f 10 1c c7       	movsd  xmm3,QWORD PTR [rdi+rax*8]
  402322:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  402327:	f2 0f 5c ca          	subsd  xmm1,xmm2
  number_.fractional = (int_fast64_t)remainder;

  remainder -= (double) number_.fractional;
  40232b:	66 0f ef d2          	pxor   xmm2,xmm2
  double remainder = (abs_number - (double) number_.integral) * powers_of_10[precision];
  40232f:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  number_.fractional = (int_fast64_t)remainder;
  402333:	f2 48 0f 2c c1       	cvttsd2si rax,xmm1
  remainder -= (double) number_.fractional;
  402338:	f2 48 0f 2a d0       	cvtsi2sd xmm2,rax
  40233d:	f2 0f 5c ca          	subsd  xmm1,xmm2

  if (remainder > 0.5) {
  402341:	f2 0f 10 15 37 35 00 	movsd  xmm2,QWORD PTR [rip+0x3537]        # 405880 <powers_of_10+0xa0>
  402348:	00 
  402349:	66 0f 2f ca          	comisd xmm1,xmm2
  40234d:	76 51                	jbe    4023a0 <get_components+0xb0>
    ++number_.fractional;
  40234f:	48 83 c0 01          	add    rax,0x1
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
  402353:	66 0f ef c9          	pxor   xmm1,xmm1
  402357:	f2 48 0f 2a c8       	cvtsi2sd xmm1,rax
  40235c:	66 0f 2f cb          	comisd xmm1,xmm3
  402360:	73 56                	jae    4023b8 <get_components+0xc8>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
    // if halfway, round up if odd OR if last digit is 0
    ++number_.fractional;
  }

  if (precision == 0U) {
  402362:	85 f6                	test   esi,esi
  402364:	75 27                	jne    40238d <get_components+0x9d>
    remainder = abs_number - (double) number_.integral;
  402366:	66 0f ef c9          	pxor   xmm1,xmm1
  40236a:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  40236f:	f2 0f 5c c1          	subsd  xmm0,xmm1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
  402373:	66 0f 2f d0          	comisd xmm2,xmm0
  402377:	76 06                	jbe    40237f <get_components+0x8f>
  402379:	66 0f 2f c2          	comisd xmm0,xmm2
  40237d:	76 0e                	jbe    40238d <get_components+0x9d>
  40237f:	48 89 d6             	mov    rsi,rdx
  402382:	83 e6 01             	and    esi,0x1
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
  402385:	48 83 fe 01          	cmp    rsi,0x1
  402389:	48 83 da ff          	sbb    rdx,0xffffffffffffffff
    }
  }
  return number_;
  40238d:	49 89 40 08          	mov    QWORD PTR [r8+0x8],rax
}
  402391:	4c 89 c0             	mov    rax,r8
  return number_;
  402394:	49 89 10             	mov    QWORD PTR [r8],rdx
  402397:	41 88 48 10          	mov    BYTE PTR [r8+0x10],cl
}
  40239b:	c3                   	ret    
  40239c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  4023a0:	66 0f 2e ca          	ucomisd xmm1,xmm2
  4023a4:	7a bc                	jp     402362 <get_components+0x72>
  4023a6:	75 ba                	jne    402362 <get_components+0x72>
  4023a8:	48 85 c0             	test   rax,rax
  4023ab:	75 13                	jne    4023c0 <get_components+0xd0>
    ++number_.fractional;
  4023ad:	48 83 c0 01          	add    rax,0x1
  4023b1:	eb af                	jmp    402362 <get_components+0x72>
  4023b3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
      ++number_.integral;
  4023b8:	48 83 c2 01          	add    rdx,0x1
      number_.fractional = 0;
  4023bc:	31 c0                	xor    eax,eax
  4023be:	eb a2                	jmp    402362 <get_components+0x72>
  else if ((remainder == 0.5) && ((number_.fractional == 0U) || (number_.fractional & 1U))) {
  4023c0:	a8 01                	test   al,0x1
  4023c2:	74 9e                	je     402362 <get_components+0x72>
  4023c4:	eb e7                	jmp    4023ad <get_components+0xbd>

Disassembly of section .text.bastardized_floor:

00000000004023d0 <bastardized_floor>:

// A floor function - but one which only works for numbers whose
// floor value is representable by an int.
static int bastardized_floor(double x)
{
  if (x >= 0) { return (int) x; }
  4023d0:	66 0f 2f 05 a0 34 00 	comisd xmm0,QWORD PTR [rip+0x34a0]        # 405878 <powers_of_10+0x98>
  4023d7:	00 
  4023d8:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  4023dc:	73 10                	jae    4023ee <bastardized_floor+0x1e>
  int n = (int) x;
  return ( ((double) n) == x ) ? n : n-1;
  4023de:	66 0f ef c9          	pxor   xmm1,xmm1
  4023e2:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  4023e6:	66 0f 2e c8          	ucomisd xmm1,xmm0
  4023ea:	7a 04                	jp     4023f0 <bastardized_floor+0x20>
  4023ec:	75 02                	jne    4023f0 <bastardized_floor+0x20>
}
  4023ee:	c3                   	ret    
  4023ef:	90                   	nop
  return ( ((double) n) == x ) ? n : n-1;
  4023f0:	83 e8 01             	sub    eax,0x1
}
  4023f3:	c3                   	ret    

Disassembly of section .text.log10_of_positive:

0000000000402400 <log10_of_positive>:
  // our input number, and need only solve log_10(M) for M between 1 and 2 (as
  // the base-2 mantissa is always 1-point-something). In that limited range, a
  // Taylor series expansion of log10(x) should serve us well enough; and we'll
  // take the mid-point, 1.5, as the point of expansion.

  double_with_bit_access dwba = get_bit_access(positive_number);
  402400:	e8 6b f8 ff ff       	call   401c70 <get_bit_access>
  // based on the algorithm by David Gay (https://www.ampl.com/netlib/fp/dtoa.c)
  int exp2 = get_exp2(dwba);
  // drop the exponent, so dwba.F comes into the range [1,2)
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  402405:	48 b9 ff ff ff ff ff 	movabs rcx,0xfffffffffffff
  40240c:	ff 0f 00 
  double_with_bit_access dwba = get_bit_access(positive_number);
  40240f:	48 89 c2             	mov    rdx,rax
  int exp2 = get_exp2(dwba);
  402412:	48 89 c7             	mov    rdi,rax
  402415:	e8 76 f8 ff ff       	call   401c90 <get_exp2>
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40241a:	48 21 ca             	and    rdx,rcx
  40241d:	48 b9 00 00 00 00 00 	movabs rcx,0x3ff0000000000000
  402424:	00 f0 3f 
  return (
    // Taylor expansion around 1.5:
    0.1760912590556812420           // Expansion term 0: ln(1.5)            / ln(10)
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
#if PRINTF_LOG10_TAYLOR_TERMS > 2
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  402427:	f2 0f 10 1d 71 34 00 	movsd  xmm3,QWORD PTR [rip+0x3471]        # 4058a0 <powers_of_10+0xc0>
  40242e:	00 
  dwba.U = (dwba.U & (((double_uint_t) (1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) |
  40242f:	48 09 ca             	or     rdx,rcx
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402432:	f2 0f 10 05 56 34 00 	movsd  xmm0,QWORD PTR [rip+0x3456]        # 405890 <powers_of_10+0xb0>
  402439:	00 
  double z = (dwba.F - 1.5);
  40243a:	66 48 0f 6e ca       	movq   xmm1,rdx
  40243f:	f2 0f 5c 0d 41 34 00 	subsd  xmm1,QWORD PTR [rip+0x3441]        # 405888 <powers_of_10+0xa8>
  402446:	00 
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402447:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40244b:	66 0f 28 d1          	movapd xmm2,xmm1
  40244f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
    + z     * 0.2895296546021678851 // Expansion term 1: (M - 1.5)   * 2/3  / ln(10)
  402453:	f2 0f 58 05 3d 34 00 	addsd  xmm0,QWORD PTR [rip+0x343d]        # 405898 <powers_of_10+0xb8>
  40245a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40245b:	f2 0f 59 da          	mulsd  xmm3,xmm2
#if PRINTF_LOG10_TAYLOR_TERMS > 3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40245f:	f2 0f 59 d1          	mulsd  xmm2,xmm1
#endif
#endif
    // exact log_2 of the exponent x, with logarithm base change
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402463:	66 0f ef c9          	pxor   xmm1,xmm1
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  402467:	f2 0f 59 15 39 34 00 	mulsd  xmm2,QWORD PTR [rip+0x3439]        # 4058a8 <powers_of_10+0xc8>
  40246e:	00 
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  40246f:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
  402473:	f2 0f 59 0d 35 34 00 	mulsd  xmm1,QWORD PTR [rip+0x3435]        # 4058b0 <powers_of_10+0xd0>
  40247a:	00 
    - z*z   * 0.0965098848673892950 // Expansion term 2: (M - 1.5)^2 * 2/9  / ln(10)
  40247b:	f2 0f 5c c3          	subsd  xmm0,xmm3
    + z*z*z * 0.0428932821632841311 // Expansion term 2: (M - 1.5)^3 * 8/81 / ln(10)
  40247f:	f2 0f 58 c2          	addsd  xmm0,xmm2
    + exp2 * 0.30102999566398119521 // = exp2 * log_10(2) = exp2 * ln(2)/ln(10)
  402483:	f2 0f 58 c1          	addsd  xmm0,xmm1
  );
}
  402487:	c3                   	ret    

Disassembly of section .text.pow10_of_int:

0000000000402490 <pow10_of_int>:


static double pow10_of_int(int floored_exp10)
{
  // A crude hack for avoiding undesired behavior with barely-normal or slightly-subnormal values.
  if (floored_exp10 == DOUBLE_MAX_SUBNORMAL_EXPONENT_OF_10) {
  402490:	81 ff cc fe ff ff    	cmp    edi,0xfffffecc
  402496:	0f 84 b4 00 00 00    	je     402550 <pow10_of_int+0xc0>
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  }
  // Compute 10^(floored_exp10) but (try to) make sure that doesn't overflow
  double_with_bit_access dwba;
  int exp2 = bastardized_floor(floored_exp10 * 3.321928094887362 + 0.5);
  40249c:	66 0f ef d2          	pxor   xmm2,xmm2
  4024a0:	f2 0f 10 05 18 34 00 	movsd  xmm0,QWORD PTR [rip+0x3418]        # 4058c0 <powers_of_10+0xe0>
  4024a7:	00 
  4024a8:	f2 0f 2a d7          	cvtsi2sd xmm2,edi
  4024ac:	f2 0f 59 c2          	mulsd  xmm0,xmm2
  4024b0:	f2 0f 58 05 c8 33 00 	addsd  xmm0,QWORD PTR [rip+0x33c8]        # 405880 <powers_of_10+0xa0>
  4024b7:	00 
  4024b8:	e8 13 ff ff ff       	call   4023d0 <bastardized_floor>
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4024bd:	f2 0f 10 0d 03 34 00 	movsd  xmm1,QWORD PTR [rip+0x3403]        # 4058c8 <powers_of_10+0xe8>
  4024c4:	00 
  4024c5:	66 0f ef c0          	pxor   xmm0,xmm0
  4024c9:	f2 0f 2a c0          	cvtsi2sd xmm0,eax
  4024cd:	f2 0f 59 05 fb 33 00 	mulsd  xmm0,QWORD PTR [rip+0x33fb]        # 4058d0 <powers_of_10+0xf0>
  4024d4:	00 
  const double z2 = z * z;
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4024d5:	48 98                	cdqe   
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4024d7:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  dwba.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
  4024db:	48 05 ff 03 00 00    	add    rax,0x3ff
  4024e1:	48 c1 e0 34          	shl    rax,0x34
  // compute exp(z) using continued fractions,
  // see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4024e5:	66 48 0f 6e e8       	movq   xmm5,rax
  const double z  = floored_exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
  4024ea:	f2 0f 5c c8          	subsd  xmm1,xmm0
  const double z2 = z * z;
  4024ee:	66 0f 28 d1          	movapd xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4024f2:	66 0f 28 c1          	movapd xmm0,xmm1
  const double z2 = z * z;
  4024f6:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  dwba.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
  4024fa:	f2 0f 58 c1          	addsd  xmm0,xmm1
  4024fe:	66 0f 28 e2          	movapd xmm4,xmm2
  402502:	f2 0f 5e 25 ce 33 00 	divsd  xmm4,QWORD PTR [rip+0x33ce]        # 4058d8 <powers_of_10+0xf8>
  402509:	00 
  40250a:	66 0f 28 da          	movapd xmm3,xmm2
  40250e:	f2 0f 58 25 ca 33 00 	addsd  xmm4,QWORD PTR [rip+0x33ca]        # 4058e0 <powers_of_10+0x100>
  402515:	00 
  402516:	f2 0f 5e dc          	divsd  xmm3,xmm4
  40251a:	f2 0f 58 1d c6 33 00 	addsd  xmm3,QWORD PTR [rip+0x33c6]        # 4058e8 <powers_of_10+0x108>
  402521:	00 
  402522:	f2 0f 5e d3          	divsd  xmm2,xmm3
  402526:	f2 0f 10 1d c2 33 00 	movsd  xmm3,QWORD PTR [rip+0x33c2]        # 4058f0 <powers_of_10+0x110>
  40252d:	00 
  40252e:	f2 0f 5c d9          	subsd  xmm3,xmm1
  402532:	f2 0f 58 d3          	addsd  xmm2,xmm3
  402536:	f2 0f 5e c2          	divsd  xmm0,xmm2
  40253a:	f2 0f 58 05 b6 33 00 	addsd  xmm0,QWORD PTR [rip+0x33b6]        # 4058f8 <powers_of_10+0x118>
  402541:	00 
  402542:	f2 0f 59 c5          	mulsd  xmm0,xmm5
  return dwba.F;
  402546:	c3                   	ret    
  402547:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40254e:	00 00 
    return DOUBLE_MAX_SUBNORMAL_POWER_OF_10;
  402550:	f2 0f 10 05 60 33 00 	movsd  xmm0,QWORD PTR [rip+0x3360]        # 4058b8 <powers_of_10+0xd8>
  402557:	00 
}
  402558:	c3                   	ret    

Disassembly of section .text.parse_flags:

0000000000402560 <parse_flags>:

// Advances the format pointer past the flags, and returns the parsed flags
// due to the characters passed
static printf_flags_t parse_flags(const char** format)
{
  printf_flags_t flags = 0U;
  402560:	45 31 c0             	xor    r8d,r8d
  do {
    switch (**format) {
  402563:	48 8d 0d 66 30 00 00 	lea    rcx,[rip+0x3066]        # 4055d0 <memcpy+0xdf0>
  40256a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402570:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
  402573:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  402576:	83 e8 20             	sub    eax,0x20
  402579:	3c 10                	cmp    al,0x10
  40257b:	77 13                	ja     402590 <parse_flags+0x30>
  40257d:	0f b6 c0             	movzx  eax,al
  402580:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  402584:	48 01 c8             	add    rax,rcx
  402587:	3e ff e0             	notrack jmp rax
  40258a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
      default : return flags;
    }
  } while (true);
}
  402590:	44 89 c0             	mov    eax,r8d
  402593:	c3                   	ret    
  402594:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      case '0': flags |= FLAGS_ZEROPAD; (*format)++; break;
  402598:	41 83 c8 01          	or     r8d,0x1
  40259c:	48 83 c2 01          	add    rdx,0x1
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4025a0:	48 89 17             	mov    QWORD PTR [rdi],rdx
  4025a3:	eb cb                	jmp    402570 <parse_flags+0x10>
  4025a5:	0f 1f 00             	nop    DWORD PTR [rax]
      case '-': flags |= FLAGS_LEFT;    (*format)++; break;
  4025a8:	41 83 c8 02          	or     r8d,0x2
  4025ac:	48 83 c2 01          	add    rdx,0x1
  4025b0:	eb ee                	jmp    4025a0 <parse_flags+0x40>
  4025b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '+': flags |= FLAGS_PLUS;    (*format)++; break;
  4025b8:	41 83 c8 04          	or     r8d,0x4
  4025bc:	48 83 c2 01          	add    rdx,0x1
  4025c0:	eb de                	jmp    4025a0 <parse_flags+0x40>
  4025c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case '#': flags |= FLAGS_HASH;    (*format)++; break;
  4025c8:	41 83 c8 10          	or     r8d,0x10
  4025cc:	48 83 c2 01          	add    rdx,0x1
  4025d0:	eb ce                	jmp    4025a0 <parse_flags+0x40>
  4025d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      case ' ': flags |= FLAGS_SPACE;   (*format)++; break;
  4025d8:	41 83 c8 08          	or     r8d,0x8
  4025dc:	48 83 c2 01          	add    rdx,0x1
  4025e0:	eb be                	jmp    4025a0 <parse_flags+0x40>

Disassembly of section .text.putchar_wrapper:

00000000004025f0 <putchar_wrapper>:
{
  4025f0:	f3 0f 1e fa          	endbr64 
  putchar_(c);
  4025f4:	40 0f be ff          	movsx  edi,dil
  4025f8:	e9 e3 18 00 00       	jmp    403ee0 <putchar_>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000402600 <print_broken_up_decimal.isra.0>:
static void print_broken_up_decimal(
  402600:	41 56                	push   r14
  402602:	49 89 ca             	mov    r10,rcx
  402605:	41 89 d3             	mov    r11d,edx
  402608:	41 55                	push   r13
  40260a:	45 89 c5             	mov    r13d,r8d
  40260d:	41 54                	push   r12
  40260f:	55                   	push   rbp
  402610:	53                   	push   rbx
  402611:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  402616:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40261b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  if (precision != 0U) {
  40261f:	45 85 ed             	test   r13d,r13d
  402622:	0f 84 90 00 00 00    	je     4026b8 <print_broken_up_decimal.isra.0+0xb8>
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402628:	44 89 c0             	mov    eax,r8d
  40262b:	25 10 10 00 00       	and    eax,0x1010
  402630:	3d 00 10 00 00       	cmp    eax,0x1000
  402635:	0f 84 05 02 00 00    	je     402840 <print_broken_up_decimal.isra.0+0x240>
  40263b:	41 89 cc             	mov    r12d,ecx
static void print_broken_up_decimal(
  40263e:	89 cb                	mov    ebx,ecx
  402640:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402645:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40264c:	66 66 66 
  40264f:	49 01 ec             	add    r12,rbp
  402652:	eb 43                	jmp    402697 <print_broken_up_decimal.isra.0+0x97>
  402654:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402658:	48 89 f0             	mov    rax,rsi
  40265b:	41 89 ce             	mov    r14d,ecx
        if (!(number_.fractional /= 10U)) {
  40265e:	49 83 c4 01          	add    r12,0x1
        buf[len++] = (char)('0' + number_.fractional % 10U);
  402662:	49 f7 ed             	imul   r13
  402665:	48 89 f0             	mov    rax,rsi
  402668:	41 29 de             	sub    r14d,ebx
  40266b:	83 c3 01             	add    ebx,0x1
  40266e:	48 c1 f8 3f          	sar    rax,0x3f
  402672:	48 c1 fa 02          	sar    rdx,0x2
  402676:	48 29 c2             	sub    rdx,rax
  402679:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  40267d:	48 01 c0             	add    rax,rax
  402680:	48 29 c6             	sub    rsi,rax
  402683:	83 c6 30             	add    esi,0x30
  402686:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
        if (!(number_.fractional /= 10U)) {
  40268b:	48 89 d6             	mov    rsi,rdx
  40268e:	48 85 d2             	test   rdx,rdx
  402691:	0f 84 f9 00 00 00    	je     402790 <print_broken_up_decimal.isra.0+0x190>
      while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402697:	83 fb 20             	cmp    ebx,0x20
  40269a:	75 bc                	jne    402658 <print_broken_up_decimal.isra.0+0x58>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  40269c:	44 89 c0             	mov    eax,r8d
  40269f:	83 e0 03             	and    eax,0x3
  4026a2:	83 f8 01             	cmp    eax,0x1
  4026a5:	0f 84 35 01 00 00    	je     4027e0 <print_broken_up_decimal.isra.0+0x1e0>
  4026ab:	ba 20 00 00 00       	mov    edx,0x20
  4026b0:	e9 7d 00 00 00       	jmp    402732 <print_broken_up_decimal.isra.0+0x132>
  4026b5:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4026b8:	41 f6 c0 10          	test   r8b,0x10
  4026bc:	0f 85 8e 00 00 00    	jne    402750 <print_broken_up_decimal.isra.0+0x150>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4026c2:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  4026c9:	66 66 66 
  4026cc:	89 ce                	mov    esi,ecx
  4026ce:	48 01 ee             	add    rsi,rbp
  4026d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  while (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4026d8:	83 f9 20             	cmp    ecx,0x20
  4026db:	74 bf                	je     40269c <print_broken_up_decimal.isra.0+0x9c>
    buf[len++] = (char)('0' + (number_.integral % 10));
  4026dd:	48 89 f8             	mov    rax,rdi
  4026e0:	83 c1 01             	add    ecx,0x1
    if (!(number_.integral /= 10)) {
  4026e3:	48 83 c6 01          	add    rsi,0x1
    buf[len++] = (char)('0' + (number_.integral % 10));
  4026e7:	48 f7 eb             	imul   rbx
  4026ea:	48 89 f8             	mov    rax,rdi
  4026ed:	48 c1 f8 3f          	sar    rax,0x3f
  4026f1:	48 c1 fa 02          	sar    rdx,0x2
  4026f5:	48 29 c2             	sub    rdx,rax
  4026f8:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4026fc:	48 01 c0             	add    rax,rax
  4026ff:	48 29 c7             	sub    rdi,rax
  402702:	83 c7 30             	add    edi,0x30
  402705:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
    if (!(number_.integral /= 10)) {
  402709:	48 89 d7             	mov    rdi,rdx
  40270c:	48 85 d2             	test   rdx,rdx
  40270f:	75 c7                	jne    4026d8 <print_broken_up_decimal.isra.0+0xd8>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
  402711:	44 89 c0             	mov    eax,r8d
  402714:	83 e0 03             	and    eax,0x3
  402717:	83 f8 01             	cmp    eax,0x1
  40271a:	0f 84 b8 01 00 00    	je     4028d8 <print_broken_up_decimal.isra.0+0x2d8>
  if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  402720:	83 f9 20             	cmp    ecx,0x20
  402723:	74 86                	je     4026ab <print_broken_up_decimal.isra.0+0xab>
    if (number_.is_negative) {
  402725:	45 84 db             	test   r11b,r11b
  402728:	74 46                	je     402770 <print_broken_up_decimal.isra.0+0x170>
      buf[len++] = '-';
  40272a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  40272f:	8d 51 01             	lea    edx,[rcx+0x1]
}
  402732:	5b                   	pop    rbx
  out_rev_(output, buf, len, width, flags);
  402733:	48 89 ee             	mov    rsi,rbp
  402736:	44 89 c9             	mov    ecx,r9d
}
  402739:	5d                   	pop    rbp
  out_rev_(output, buf, len, width, flags);
  40273a:	4c 89 d7             	mov    rdi,r10
}
  40273d:	41 5c                	pop    r12
  40273f:	41 5d                	pop    r13
  402741:	41 5e                	pop    r14
  out_rev_(output, buf, len, width, flags);
  402743:	e9 68 f7 ff ff       	jmp    401eb0 <out_rev_>
  402748:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40274f:	00 
    if ((flags & FLAGS_HASH) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402750:	83 f9 20             	cmp    ecx,0x20
  402753:	0f 84 43 ff ff ff    	je     40269c <print_broken_up_decimal.isra.0+0x9c>
      buf[len++] = '.';
  402759:	89 c8                	mov    eax,ecx
  40275b:	83 c1 01             	add    ecx,0x1
  40275e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  402763:	e9 5a ff ff ff       	jmp    4026c2 <print_broken_up_decimal.isra.0+0xc2>
  402768:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40276f:	00 
    else if (flags & FLAGS_PLUS) {
  402770:	41 f6 c0 04          	test   r8b,0x4
  402774:	0f 85 3e 01 00 00    	jne    4028b8 <print_broken_up_decimal.isra.0+0x2b8>
    else if (flags & FLAGS_SPACE) {
  40277a:	89 ca                	mov    edx,ecx
  40277c:	41 f6 c0 08          	test   r8b,0x8
  402780:	74 b0                	je     402732 <print_broken_up_decimal.isra.0+0x132>
      buf[len++] = ' ';
  402782:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  402787:	83 c2 01             	add    edx,0x1
  40278a:	eb a6                	jmp    402732 <print_broken_up_decimal.isra.0+0x132>
  40278c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  402790:	83 fb 1f             	cmp    ebx,0x1f
  402793:	77 13                	ja     4027a8 <print_broken_up_decimal.isra.0+0x1a8>
  402795:	45 85 f6             	test   r14d,r14d
  402798:	89 d8                	mov    eax,ebx
  40279a:	0f 95 c2             	setne  dl
  40279d:	48 01 e8             	add    rax,rbp
  4027a0:	84 d2                	test   dl,dl
  4027a2:	75 20                	jne    4027c4 <print_broken_up_decimal.isra.0+0x1c4>
  4027a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      if (len < PRINTF_DECIMAL_BUFFER_SIZE) {
  4027a8:	83 fb 20             	cmp    ebx,0x20
  4027ab:	0f 84 eb fe ff ff    	je     40269c <print_broken_up_decimal.isra.0+0x9c>
        buf[len++] = '.';
  4027b1:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  4027b6:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4027b9:	e9 04 ff ff ff       	jmp    4026c2 <print_broken_up_decimal.isra.0+0xc2>
  4027be:	66 90                	xchg   ax,ax
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4027c0:	39 ca                	cmp    edx,ecx
  4027c2:	74 e4                	je     4027a8 <print_broken_up_decimal.isra.0+0x1a8>
        buf[len++] = '0';
  4027c4:	89 da                	mov    edx,ebx
  4027c6:	83 c3 01             	add    ebx,0x1
  4027c9:	c6 00 30             	mov    BYTE PTR [rax],0x30
      while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (count > 0U)) {
  4027cc:	48 83 c0 01          	add    rax,0x1
  4027d0:	83 fb 1f             	cmp    ebx,0x1f
  4027d3:	76 eb                	jbe    4027c0 <print_broken_up_decimal.isra.0+0x1c0>
  4027d5:	eb d1                	jmp    4027a8 <print_broken_up_decimal.isra.0+0x1a8>
  4027d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4027de:	00 00 
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4027e0:	45 85 c9             	test   r9d,r9d
  4027e3:	0f 84 c2 fe ff ff    	je     4026ab <print_broken_up_decimal.isra.0+0xab>
  4027e9:	31 d2                	xor    edx,edx
  4027eb:	b9 20 00 00 00       	mov    ecx,0x20
  4027f0:	45 84 db             	test   r11b,r11b
  4027f3:	0f 85 cf 00 00 00    	jne    4028c8 <print_broken_up_decimal.isra.0+0x2c8>
  4027f9:	41 f6 c0 0c          	test   r8b,0xc
  4027fd:	0f 85 c5 00 00 00    	jne    4028c8 <print_broken_up_decimal.isra.0+0x2c8>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402803:	44 39 c9             	cmp    ecx,r9d
  402806:	0f 83 14 ff ff ff    	jae    402720 <print_broken_up_decimal.isra.0+0x120>
  40280c:	89 c8                	mov    eax,ecx
  40280e:	48 01 e8             	add    rax,rbp
  402811:	84 d2                	test   dl,dl
  402813:	0f 84 07 ff ff ff    	je     402720 <print_broken_up_decimal.isra.0+0x120>
  402819:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      buf[len++] = '0';
  402820:	83 c1 01             	add    ecx,0x1
  402823:	c6 00 30             	mov    BYTE PTR [rax],0x30
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  402826:	48 83 c0 01          	add    rax,0x1
  40282a:	44 39 c9             	cmp    ecx,r9d
  40282d:	0f 83 ed fe ff ff    	jae    402720 <print_broken_up_decimal.isra.0+0x120>
  402833:	83 f9 1f             	cmp    ecx,0x1f
  402836:	76 e8                	jbe    402820 <print_broken_up_decimal.isra.0+0x220>
  402838:	e9 e3 fe ff ff       	jmp    402720 <print_broken_up_decimal.isra.0+0x120>
  40283d:	0f 1f 00             	nop    DWORD PTR [rax]
    if ((flags & FLAGS_ADAPT_EXP) && !(flags & FLAGS_HASH) && (number_.fractional > 0)) {
  402840:	48 85 f6             	test   rsi,rsi
  402843:	0f 8e 79 fe ff ff    	jle    4026c2 <print_broken_up_decimal.isra.0+0xc2>
        if (digit != 0) {
  402849:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  402850:	cc cc cc 
  402853:	48 89 f0             	mov    rax,rsi
  402856:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  40285d:	99 99 19 
  402860:	48 0f af c3          	imul   rax,rbx
  402864:	48 01 d0             	add    rax,rdx
  402867:	48 d1 c8             	ror    rax,1
  40286a:	48 39 d0             	cmp    rax,rdx
  40286d:	0f 87 c8 fd ff ff    	ja     40263b <print_broken_up_decimal.isra.0+0x3b>
  402873:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  40287a:	99 99 19 
  40287d:	0f 1f 00             	nop    DWORD PTR [rax]
        number_.fractional /= 10U;
  402880:	48 89 f0             	mov    rax,rsi
  402883:	49 89 f4             	mov    r12,rsi
        --count;
  402886:	41 83 ed 01          	sub    r13d,0x1
        number_.fractional /= 10U;
  40288a:	48 f7 e3             	mul    rbx
  40288d:	48 89 d6             	mov    rsi,rdx
  402890:	48 c1 ee 03          	shr    rsi,0x3
  402894:	48 89 f0             	mov    rax,rsi
  402897:	48 0f af c3          	imul   rax,rbx
  40289b:	48 d1 c8             	ror    rax,1
        if (digit != 0) {
  40289e:	4c 39 f0             	cmp    rax,r14
  4028a1:	76 dd                	jbe    402880 <print_broken_up_decimal.isra.0+0x280>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
  4028a3:	49 83 fc 09          	cmp    r12,0x9
  4028a7:	0f 8f 8e fd ff ff    	jg     40263b <print_broken_up_decimal.isra.0+0x3b>
  4028ad:	e9 10 fe ff ff       	jmp    4026c2 <print_broken_up_decimal.isra.0+0xc2>
  4028b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      buf[len++] = '+';  // ignore the space if the '+' exists
  4028b8:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  4028bd:	8d 51 01             	lea    edx,[rcx+0x1]
  4028c0:	e9 6d fe ff ff       	jmp    402732 <print_broken_up_decimal.isra.0+0x132>
  4028c5:	0f 1f 00             	nop    DWORD PTR [rax]
      width--;
  4028c8:	41 83 e9 01          	sub    r9d,0x1
  4028cc:	e9 32 ff ff ff       	jmp    402803 <print_broken_up_decimal.isra.0+0x203>
  4028d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
  4028d8:	45 85 c9             	test   r9d,r9d
  4028db:	0f 84 3f fe ff ff    	je     402720 <print_broken_up_decimal.isra.0+0x120>
    while ((len < width) && (len < PRINTF_DECIMAL_BUFFER_SIZE)) {
  4028e1:	83 f9 1f             	cmp    ecx,0x1f
  4028e4:	0f 96 c2             	setbe  dl
  4028e7:	e9 04 ff ff ff       	jmp    4027f0 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_decimal_number:

00000000004028f0 <print_decimal_number>:
{
  4028f0:	41 54                	push   r12
  4028f2:	49 89 fb             	mov    r11,rdi
  4028f5:	41 89 f2             	mov    r10d,esi
  4028f8:	4d 89 c4             	mov    r12,r8
  4028fb:	55                   	push   rbp
  4028fc:	89 cd                	mov    ebp,ecx
  4028fe:	53                   	push   rbx
  4028ff:	89 d3                	mov    ebx,edx
  402901:	48 83 ec 20          	sub    rsp,0x20
  struct double_components value_ = get_components(number, precision);
  402905:	48 89 e7             	mov    rdi,rsp
  402908:	e8 e3 f9 ff ff       	call   4022f0 <get_components>
  print_broken_up_decimal(value_, output, precision, width, flags, buf, len);
  40290d:	48 83 ec 08          	sub    rsp,0x8
  402911:	45 89 d0             	mov    r8d,r10d
  402914:	4c 89 d9             	mov    rcx,r11
  402917:	41 51                	push   r9
  402919:	41 89 d9             	mov    r9d,ebx
  40291c:	41 54                	push   r12
  40291e:	55                   	push   rbp
  40291f:	0f b6 54 24 30       	movzx  edx,BYTE PTR [rsp+0x30]
  402924:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
  402929:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
  40292e:	e8 cd fc ff ff       	call   402600 <print_broken_up_decimal.isra.0>
}
  402933:	48 83 c4 40          	add    rsp,0x40
  402937:	5b                   	pop    rbx
  402938:	5d                   	pop    rbp
  402939:	41 5c                	pop    r12
  40293b:	c3                   	ret    

Disassembly of section .text.update_normalization.isra.0:

0000000000402940 <update_normalization.isra.0>:
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402940:	66 0f 28 d0          	movapd xmm2,xmm0
  if (sf.multiply) {
  402944:	40 84 ff             	test   dil,dil
  402947:	74 17                	je     402960 <update_normalization.isra.0+0x20>
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402949:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    result.multiply = true;
  40294d:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  402952:	31 c0                	xor    eax,eax
  402954:	88 d0                	mov    al,dl
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
  402956:	66 0f 28 c1          	movapd xmm0,xmm1
}
  40295a:	c3                   	ret    
  40295b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
static struct scaling_factor update_normalization(struct scaling_factor sf, double extra_multiplicative_factor)
  402960:	48 83 ec 08          	sub    rsp,0x8
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  402964:	e8 07 f3 ff ff       	call   401c70 <get_bit_access>
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402969:	66 0f 28 c1          	movapd xmm0,xmm1
    int factor_exp2 = get_exp2(get_bit_access(sf.raw_factor));
  40296d:	48 89 c7             	mov    rdi,rax
  402970:	e8 1b f3 ff ff       	call   401c90 <get_exp2>
  402975:	89 c2                	mov    edx,eax
    int extra_factor_exp2 = get_exp2(get_bit_access(extra_multiplicative_factor));
  402977:	e8 f4 f2 ff ff       	call   401c70 <get_bit_access>
  40297c:	48 89 c7             	mov    rdi,rax
  40297f:	e8 0c f3 ff ff       	call   401c90 <get_exp2>
  402984:	41 89 c0             	mov    r8d,eax
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
  402987:	89 d0                	mov    eax,edx
  402989:	f7 d8                	neg    eax
  40298b:	0f 49 d0             	cmovns edx,eax
  40298e:	44 89 c0             	mov    eax,r8d
  402991:	f7 d8                	neg    eax
  402993:	41 0f 48 c0          	cmovs  eax,r8d
  402997:	39 c2                	cmp    edx,eax
  402999:	7f 1d                	jg     4029b8 <update_normalization.isra.0+0x78>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  40299b:	f2 0f 5e ca          	divsd  xmm1,xmm2
      result.multiply = true;
  40299f:	ba 01 00 00 00       	mov    edx,0x1
  return result;
  4029a4:	31 c0                	xor    eax,eax
}
  4029a6:	48 83 c4 08          	add    rsp,0x8
  return result;
  4029aa:	88 d0                	mov    al,dl
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
  4029ac:	66 0f 28 c1          	movapd xmm0,xmm1
}
  4029b0:	c3                   	ret    
  4029b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4029b8:	f2 0f 5e d1          	divsd  xmm2,xmm1
      result.multiply = false;
  4029bc:	31 d2                	xor    edx,edx
  return result;
  4029be:	31 c0                	xor    eax,eax
}
  4029c0:	48 83 c4 08          	add    rsp,0x8
  return result;
  4029c4:	88 d0                	mov    al,dl
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
  4029c6:	66 0f 28 c2          	movapd xmm0,xmm2
}
  4029ca:	c3                   	ret    

Disassembly of section .text.unapply_scaling.isra.0:

00000000004029d0 <unapply_scaling.isra.0>:
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
  4029d0:	40 84 ff             	test   dil,dil
  4029d3:	74 0b                	je     4029e0 <unapply_scaling.isra.0+0x10>
  4029d5:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4029d9:	c3                   	ret    
  4029da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4029e0:	f2 0f 59 c1          	mulsd  xmm0,xmm1
}
  4029e4:	c3                   	ret    

Disassembly of section .text.apply_scaling.isra.0:

00000000004029f0 <apply_scaling.isra.0>:
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
  4029f0:	40 84 ff             	test   dil,dil
  4029f3:	74 0b                	je     402a00 <apply_scaling.isra.0+0x10>
  4029f5:	f2 0f 59 c1          	mulsd  xmm0,xmm1
  4029f9:	c3                   	ret    
  4029fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402a00:	f2 0f 5e c1          	divsd  xmm0,xmm1
}
  402a04:	c3                   	ret    

Disassembly of section .text.get_normalized_components.isra.0:

0000000000402a10 <get_normalized_components.isra.0>:
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402a10:	89 d0                	mov    eax,edx
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402a12:	48 83 ec 08          	sub    rsp,0x8
  402a16:	49 89 f9             	mov    r9,rdi
  402a19:	89 cf                	mov    edi,ecx
  bool close_to_representation_extremum = ( (-floored_exp10 + (int) precision) >= DBL_MAX_10_EXP - 1 );
  402a1b:	44 29 c0             	sub    eax,r8d
static struct double_components get_normalized_components(bool negative, printf_size_t precision, double non_normalized, struct scaling_factor normalization, int floored_exp10)
  402a1e:	66 0f 28 d0          	movapd xmm2,xmm0
  402a22:	41 89 f2             	mov    r10d,esi
  double scaled = apply_scaling(non_normalized, normalization);
  402a25:	e8 c6 ff ff ff       	call   4029f0 <apply_scaling.isra.0>
  if (close_to_representation_extremum) {
  402a2a:	3d 32 01 00 00       	cmp    eax,0x132
  402a2f:	0f 8f ab 00 00 00    	jg     402ae0 <get_normalized_components.isra.0+0xd0>
  components.integral = (int_fast64_t) scaled;
  402a35:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  402a3a:	66 0f ef c0          	pxor   xmm0,xmm0
  402a3e:	66 0f 28 ea          	movapd xmm5,xmm2
  double prec_power_of_10 = powers_of_10[precision];
  402a42:	89 d6                	mov    esi,edx
  402a44:	48 8d 05 95 2d 00 00 	lea    rax,[rip+0x2d95]        # 4057e0 <powers_of_10>
  402a4b:	66 0f 28 d9          	movapd xmm3,xmm1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  402a4f:	f2 48 0f 2a c1       	cvtsi2sd xmm0,rcx
  402a54:	e8 77 ff ff ff       	call   4029d0 <unapply_scaling.isra.0>
  double prec_power_of_10 = powers_of_10[precision];
  402a59:	f2 0f 10 24 f0       	movsd  xmm4,QWORD PTR [rax+rsi*8]
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
  402a5e:	f2 0f 5c e8          	subsd  xmm5,xmm0
  struct scaling_factor account_for_precision = update_normalization(normalization, prec_power_of_10);
  402a62:	66 0f 28 c3          	movapd xmm0,xmm3
  402a66:	66 0f 28 cc          	movapd xmm1,xmm4
  402a6a:	e8 d1 fe ff ff       	call   402940 <update_normalization.isra.0>
  402a6f:	66 0f 28 c8          	movapd xmm1,xmm0
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402a73:	89 c7                	mov    edi,eax
  402a75:	66 0f 28 c5          	movapd xmm0,xmm5
  components.fractional += (scaled_remainder >= rounding_threshold);
  402a79:	31 c0                	xor    eax,eax
  double scaled_remainder = apply_scaling(remainder, account_for_precision);
  402a7b:	e8 70 ff ff ff       	call   4029f0 <apply_scaling.isra.0>
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402a80:	66 0f ef c9          	pxor   xmm1,xmm1
  components.fractional = (int_fast64_t) scaled_remainder; // when precision == 0, the assigned value should be 0
  402a84:	f2 48 0f 2c d0       	cvttsd2si rdx,xmm0
  scaled_remainder -= (double) components.fractional; //when precision == 0, this will not change scaled_remainder
  402a89:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  402a8e:	f2 0f 5c c1          	subsd  xmm0,xmm1
  components.fractional += (scaled_remainder >= rounding_threshold);
  402a92:	66 0f 2f 05 e6 2d 00 	comisd xmm0,QWORD PTR [rip+0x2de6]        # 405880 <powers_of_10+0xa0>
  402a99:	00 
  402a9a:	0f 93 c0             	setae  al
  402a9d:	48 01 d0             	add    rax,rdx
  if (scaled_remainder == rounding_threshold) {
  402aa0:	66 0f 2e 05 d8 2d 00 	ucomisd xmm0,QWORD PTR [rip+0x2dd8]        # 405880 <powers_of_10+0xa0>
  402aa7:	00 
  402aa8:	7a 06                	jp     402ab0 <get_normalized_components.isra.0+0xa0>
  402aaa:	75 04                	jne    402ab0 <get_normalized_components.isra.0+0xa0>
    components.fractional &= ~((int_fast64_t) 0x1);
  402aac:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
  if ((double) components.fractional >= prec_power_of_10) {
  402ab0:	66 0f ef c0          	pxor   xmm0,xmm0
  402ab4:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
  402ab9:	66 0f 2f c4          	comisd xmm0,xmm4
  402abd:	73 19                	jae    402ad8 <get_normalized_components.isra.0+0xc8>
  return components;
  402abf:	49 89 41 08          	mov    QWORD PTR [r9+0x8],rax
}
  402ac3:	4c 89 c8             	mov    rax,r9
  return components;
  402ac6:	49 89 09             	mov    QWORD PTR [r9],rcx
  402ac9:	45 88 51 10          	mov    BYTE PTR [r9+0x10],r10b
}
  402acd:	48 83 c4 08          	add    rsp,0x8
  402ad1:	c3                   	ret    
  402ad2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    ++components.integral;
  402ad8:	48 83 c1 01          	add    rcx,0x1
    components.fractional = 0;
  402adc:	31 c0                	xor    eax,eax
  402ade:	eb df                	jmp    402abf <get_normalized_components.isra.0+0xaf>
    return get_components(negative ? -scaled : scaled, precision);
  402ae0:	40 84 f6             	test   sil,sil
  402ae3:	74 08                	je     402aed <get_normalized_components.isra.0+0xdd>
  402ae5:	66 0f 57 05 83 2d 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2d83]        # 405870 <powers_of_10+0x90>
  402aec:	00 
  402aed:	89 d6                	mov    esi,edx
  402aef:	4c 89 cf             	mov    rdi,r9
  402af2:	e8 f9 f7 ff ff       	call   4022f0 <get_components>
}
  402af7:	4c 89 c8             	mov    rax,r9
  402afa:	48 83 c4 08          	add    rsp,0x8
  402afe:	c3                   	ret    

Disassembly of section .text.print_exponential_number:

0000000000402b00 <print_exponential_number>:
{
  402b00:	41 57                	push   r15
  402b02:	41 89 f3             	mov    r11d,esi
  402b05:	66 0f 28 f0          	movapd xmm6,xmm0
  402b09:	41 56                	push   r14
  402b0b:	41 55                	push   r13
  402b0d:	49 89 fd             	mov    r13,rdi
  402b10:	41 54                	push   r12
  402b12:	41 89 d4             	mov    r12d,edx
  402b15:	55                   	push   rbp
  402b16:	89 cd                	mov    ebp,ecx
  402b18:	53                   	push   rbx
  402b19:	48 83 ec 38          	sub    rsp,0x38
  402b1d:	4c 89 04 24          	mov    QWORD PTR [rsp],r8
  402b21:	44 89 4c 24 08       	mov    DWORD PTR [rsp+0x8],r9d
  const bool negative = get_sign_bit(number);
  402b26:	e8 55 f1 ff ff       	call   401c80 <get_sign_bit>
  402b2b:	89 c6                	mov    esi,eax
  double abs_number =  negative ? -number : number;
  402b2d:	85 c0                	test   eax,eax
  402b2f:	74 08                	je     402b39 <print_exponential_number+0x39>
  402b31:	66 0f 57 35 37 2d 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2d37]        # 405870 <powers_of_10+0x90>
  402b38:	00 
  if (flags & FLAGS_ADAPT_EXP) {
  402b39:	41 89 e8             	mov    r8d,ebp
  402b3c:	41 81 e0 00 10 00 00 	and    r8d,0x1000
  if (abs_number == 0.0) {
  402b43:	66 0f 2e 35 2d 2d 00 	ucomisd xmm6,QWORD PTR [rip+0x2d2d]        # 405878 <powers_of_10+0x98>
  402b4a:	00 
  402b4b:	0f 8a 9f 00 00 00    	jp     402bf0 <print_exponential_number+0xf0>
  402b51:	0f 85 99 00 00 00    	jne    402bf0 <print_exponential_number+0xf0>
  if (flags & FLAGS_ADAPT_EXP) {
  402b57:	45 85 c0             	test   r8d,r8d
  402b5a:	0f 85 18 01 00 00    	jne    402c78 <print_exponential_number+0x178>
    get_components(negative ? -abs_number : abs_number, precision) :
  402b60:	85 f6                	test   esi,esi
  402b62:	0f 84 63 03 00 00    	je     402ecb <print_exponential_number+0x3cb>
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402b68:	31 db                	xor    ebx,ebx
  bool fall_back_to_decimal_only_mode = false;
  402b6a:	45 31 ff             	xor    r15d,r15d
    get_components(negative ? -abs_number : abs_number, precision) :
  402b6d:	66 0f 57 35 fb 2c 00 	xorpd  xmm6,XMMWORD PTR [rip+0x2cfb]        # 405870 <powers_of_10+0x90>
  402b74:	00 
  402b75:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402b7a:	44 89 de             	mov    esi,r11d
  402b7d:	66 0f 28 c6          	movapd xmm0,xmm6
  402b81:	e8 6a f7 ff ff       	call   4022f0 <get_components>
  402b86:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402b8b:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402b90:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402b95:	45 84 ff             	test   r15b,r15b
  402b98:	0f 84 49 01 00 00    	je     402ce7 <print_exponential_number+0x1e7>
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402b9e:	f7 c5 00 10 00 00    	test   ebp,0x1000
  402ba4:	74 09                	je     402baf <print_exponential_number+0xaf>
  402ba6:	83 fb ff             	cmp    ebx,0xffffffff
  402ba9:	0f 8d d1 02 00 00    	jge    402e80 <print_exponential_number+0x380>
        width - exp10_part_width :
  402baf:	45 85 e4             	test   r12d,r12d
  402bb2:	0f 84 98 02 00 00    	je     402e50 <print_exponential_number+0x350>
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402bb8:	48 83 ec 08          	sub    rsp,0x8
  402bbc:	45 89 e1             	mov    r9d,r12d
  402bbf:	45 89 d8             	mov    r8d,r11d
  402bc2:	4c 89 e9             	mov    rcx,r13
  402bc5:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402bc9:	50                   	push   rax
  402bca:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402bce:	55                   	push   rbp
  402bcf:	e8 2c fa ff ff       	call   402600 <print_broken_up_decimal.isra.0>
  402bd4:	48 83 c4 20          	add    rsp,0x20
}
  402bd8:	48 83 c4 38          	add    rsp,0x38
  402bdc:	5b                   	pop    rbx
  402bdd:	5d                   	pop    rbp
  402bde:	41 5c                	pop    r12
  402be0:	41 5d                	pop    r13
  402be2:	41 5e                	pop    r14
  402be4:	41 5f                	pop    r15
  402be6:	c3                   	ret    
  402be7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402bee:	00 00 
    double exp10 = log10_of_positive(abs_number);
  402bf0:	66 0f 28 c6          	movapd xmm0,xmm6
  402bf4:	e8 07 f8 ff ff       	call   402400 <log10_of_positive>
    floored_exp10 = bastardized_floor(exp10);
  402bf9:	e8 d2 f7 ff ff       	call   4023d0 <bastardized_floor>
    double p10 = pow10_of_int(floored_exp10);
  402bfe:	89 c7                	mov    edi,eax
    floored_exp10 = bastardized_floor(exp10);
  402c00:	89 c3                	mov    ebx,eax
    double p10 = pow10_of_int(floored_exp10);
  402c02:	e8 89 f8 ff ff       	call   402490 <pow10_of_int>
    if (abs_number < p10) {
  402c07:	66 0f 2f c6          	comisd xmm0,xmm6
    double p10 = pow10_of_int(floored_exp10);
  402c0b:	66 0f 28 c8          	movapd xmm1,xmm0
    if (abs_number < p10) {
  402c0f:	76 0b                	jbe    402c1c <print_exponential_number+0x11c>
      floored_exp10--;
  402c11:	83 eb 01             	sub    ebx,0x1
      p10 /= 10;
  402c14:	f2 0f 5e 0d c4 2c 00 	divsd  xmm1,QWORD PTR [rip+0x2cc4]        # 4058e0 <powers_of_10+0x100>
  402c1b:	00 
    abs_exp10_covered_by_powers_table = PRINTF_ABS(floored_exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
  402c1c:	8d 43 11             	lea    eax,[rbx+0x11]
  402c1f:	83 f8 22             	cmp    eax,0x22
  402c22:	0f 96 c1             	setbe  cl
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(floored_exp10)] : p10;
  402c25:	77 15                	ja     402c3c <print_exponential_number+0x13c>
  402c27:	89 d8                	mov    eax,ebx
  402c29:	48 8d 15 b0 2b 00 00 	lea    rdx,[rip+0x2bb0]        # 4057e0 <powers_of_10>
  402c30:	f7 d8                	neg    eax
  402c32:	0f 48 c3             	cmovs  eax,ebx
  402c35:	48 98                	cdqe   
  402c37:	f2 0f 10 0c c2       	movsd  xmm1,QWORD PTR [rdx+rax*8]
  normalization.multiply = (floored_exp10 < 0 && abs_exp10_covered_by_powers_table);
  402c3c:	89 d8                	mov    eax,ebx
  402c3e:	c1 e8 1f             	shr    eax,0x1f
  402c41:	21 c1                	and    ecx,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402c43:	85 db                	test   ebx,ebx
  402c45:	0f 94 c2             	sete   dl
  bool fall_back_to_decimal_only_mode = false;
  402c48:	45 31 ff             	xor    r15d,r15d
  if (flags & FLAGS_ADAPT_EXP) {
  402c4b:	45 85 c0             	test   r8d,r8d
  402c4e:	74 62                	je     402cb2 <print_exponential_number+0x1b2>
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402c50:	45 85 db             	test   r11d,r11d
  402c53:	b8 01 00 00 00       	mov    eax,0x1
  402c58:	41 0f 45 c3          	cmovne eax,r11d
  402c5c:	39 c3                	cmp    ebx,eax
  402c5e:	0f 9c c0             	setl   al
  402c61:	83 fb fc             	cmp    ebx,0xfffffffc
  402c64:	40 0f 9d c7          	setge  dil
  402c68:	21 f8                	and    eax,edi
  402c6a:	41 89 c7             	mov    r15d,eax
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || floored_exp10 == 0);
  402c6d:	44 09 fa             	or     edx,r15d
  402c70:	eb 21                	jmp    402c93 <print_exponential_number+0x193>
  402c72:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    fall_back_to_decimal_only_mode = (floored_exp10 >= -4 && floored_exp10 < required_significant_digits);
  402c78:	45 85 db             	test   r11d,r11d
  402c7b:	b8 01 00 00 00       	mov    eax,0x1
  402c80:	ba 01 00 00 00       	mov    edx,0x1
  402c85:	41 0f 45 c3          	cmovne eax,r11d
  402c89:	85 c0                	test   eax,eax
  402c8b:	41 0f 9f c7          	setg   r15b
  402c8f:	31 c9                	xor    ecx,ecx
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402c91:	31 db                	xor    ebx,ebx
                     (int) precision - 1 - floored_exp10 :
  402c93:	41 83 eb 01          	sub    r11d,0x1
  402c97:	44 89 df             	mov    edi,r11d
  402c9a:	29 df                	sub    edi,ebx
  402c9c:	45 84 ff             	test   r15b,r15b
  402c9f:	44 0f 45 df          	cmovne r11d,edi
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
  402ca3:	31 ff                	xor    edi,edi
  402ca5:	45 85 db             	test   r11d,r11d
  402ca8:	44 0f 48 df          	cmovs  r11d,edi
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
  402cac:	81 cd 00 08 00 00    	or     ebp,0x800
  struct double_components decimal_part_components =
  402cb2:	84 d2                	test   dl,dl
  402cb4:	0f 85 86 01 00 00    	jne    402e40 <print_exponential_number+0x340>
  const bool negative = get_sign_bit(number);
  402cba:	85 f6                	test   esi,esi
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402cbc:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402cc1:	44 89 da             	mov    edx,r11d
  402cc4:	41 89 d8             	mov    r8d,ebx
  const bool negative = get_sign_bit(number);
  402cc7:	40 0f 95 c6          	setne  sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402ccb:	66 0f 28 c6          	movapd xmm0,xmm6
  const bool negative = get_sign_bit(number);
  402ccf:	40 0f b6 f6          	movzx  esi,sil
    get_normalized_components(negative, precision, abs_number, normalization, floored_exp10);
  402cd3:	e8 38 fd ff ff       	call   402a10 <get_normalized_components.isra.0>
  402cd8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402cdd:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402ce2:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
    if (decimal_part_components.integral >= 10) {
  402ce7:	48 83 ff 09          	cmp    rdi,0x9
  402ceb:	7e 0a                	jle    402cf7 <print_exponential_number+0x1f7>
      floored_exp10++;
  402ced:	83 c3 01             	add    ebx,0x1
      decimal_part_components.fractional = 0;
  402cf0:	31 f6                	xor    esi,esi
      decimal_part_components.integral = 1;
  402cf2:	bf 01 00 00 00       	mov    edi,0x1
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402cf7:	41 89 ea             	mov    r10d,ebp
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402cfa:	8d 4b 63             	lea    ecx,[rbx+0x63]
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
  402cfd:	41 83 e2 02          	and    r10d,0x2
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402d01:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402d07:	77 47                	ja     402d50 <print_exponential_number+0x250>
      0U :
  402d09:	45 85 d2             	test   r10d,r10d
  402d0c:	0f 84 9e 01 00 00    	je     402eb0 <print_exponential_number+0x3b0>
  402d12:	41 bf 03 00 00 00    	mov    r15d,0x3
  402d18:	44 89 54 24 0c       	mov    DWORD PTR [rsp+0xc],r10d
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402d1d:	48 83 ec 08          	sub    rsp,0x8
  402d21:	45 31 c9             	xor    r9d,r9d
  402d24:	45 89 d8             	mov    r8d,r11d
  402d27:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402d2b:	4c 89 e9             	mov    rcx,r13
  const printf_size_t printed_exponential_start_pos = output->pos;
  402d2e:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402d32:	50                   	push   rax
  402d33:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402d37:	55                   	push   rbp
  402d38:	e8 c3 f8 ff ff       	call   402600 <print_broken_up_decimal.isra.0>
  402d3d:	48 83 c4 20          	add    rsp,0x20
  402d41:	44 8b 54 24 0c       	mov    r10d,DWORD PTR [rsp+0xc]
  402d46:	eb 61                	jmp    402da9 <print_exponential_number+0x2a9>
  402d48:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402d4f:	00 
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402d50:	b8 05 00 00 00       	mov    eax,0x5
      0U :
  402d55:	45 85 d2             	test   r10d,r10d
  402d58:	0f 85 62 01 00 00    	jne    402ec0 <print_exponential_number+0x3c0>
        width - exp10_part_width :
  402d5e:	45 89 e1             	mov    r9d,r12d
  402d61:	b9 00 00 00 00       	mov    ecx,0x0
  402d66:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402d6a:	45 89 d8             	mov    r8d,r11d
        width - exp10_part_width :
  402d6d:	41 29 c1             	sub    r9d,eax
  402d70:	41 39 c4             	cmp    r12d,eax
  const printf_size_t printed_exponential_start_pos = output->pos;
  402d73:	45 8b 75 18          	mov    r14d,DWORD PTR [r13+0x18]
        width - exp10_part_width :
  402d77:	44 0f 46 c9          	cmovbe r9d,ecx
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402d7b:	48 83 ec 08          	sub    rsp,0x8
  402d7f:	4c 89 e9             	mov    rcx,r13
  402d82:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402d86:	50                   	push   rax
  402d87:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402d8b:	55                   	push   rbp
  402d8c:	e8 6f f8 ff ff       	call   402600 <print_broken_up_decimal.isra.0>
  if (! fall_back_to_decimal_only_mode) {
  402d91:	48 83 c4 20          	add    rsp,0x20
  402d95:	45 84 ff             	test   r15b,r15b
  402d98:	0f 85 3a fe ff ff    	jne    402bd8 <print_exponential_number+0xd8>
    print_integer(output,
  402d9e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  402da2:	45 31 d2             	xor    r10d,r10d
  402da5:	44 8d 78 ff          	lea    r15d,[rax-0x1]
    putchar_via_gadget(output, (flags & FLAGS_UPPERCASE) ? 'E' : 'e');
  402da9:	83 e5 20             	and    ebp,0x20
  402dac:	4c 89 ef             	mov    rdi,r13
  402daf:	44 89 14 24          	mov    DWORD PTR [rsp],r10d
  402db3:	83 fd 01             	cmp    ebp,0x1
  402db6:	19 f6                	sbb    esi,esi
  402db8:	83 e6 20             	and    esi,0x20
  402dbb:	83 c6 45             	add    esi,0x45
  402dbe:	e8 ed ee ff ff       	call   401cb0 <putchar_via_gadget>
    print_integer(output,
  402dc3:	48 63 c3             	movsxd rax,ebx
  402dc6:	89 da                	mov    edx,ebx
  402dc8:	45 89 f9             	mov    r9d,r15d
  402dcb:	48 89 c6             	mov    rsi,rax
  402dce:	c1 ea 1f             	shr    edx,0x1f
  402dd1:	b9 0a 00 00 00       	mov    ecx,0xa
  402dd6:	4c 89 ef             	mov    rdi,r13
  402dd9:	48 f7 de             	neg    rsi
  402ddc:	85 db                	test   ebx,ebx
  402dde:	48 0f 4f f0          	cmovg  rsi,rax
  402de2:	48 83 ec 08          	sub    rsp,0x8
  402de6:	45 31 c0             	xor    r8d,r8d
  402de9:	6a 05                	push   0x5
  402deb:	e8 10 f4 ff ff       	call   402200 <print_integer>
    if (flags & FLAGS_LEFT) {
  402df0:	58                   	pop    rax
  402df1:	5a                   	pop    rdx
  402df2:	44 8b 14 24          	mov    r10d,DWORD PTR [rsp]
  402df6:	45 85 d2             	test   r10d,r10d
  402df9:	0f 84 d9 fd ff ff    	je     402bd8 <print_exponential_number+0xd8>
      while (output->pos - printed_exponential_start_pos < width) {
  402dff:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402e03:	44 29 f0             	sub    eax,r14d
  402e06:	44 39 e0             	cmp    eax,r12d
  402e09:	0f 83 c9 fd ff ff    	jae    402bd8 <print_exponential_number+0xd8>
  402e0f:	90                   	nop
        putchar_via_gadget(output, ' ');
  402e10:	be 20 00 00 00       	mov    esi,0x20
  402e15:	4c 89 ef             	mov    rdi,r13
  402e18:	e8 93 ee ff ff       	call   401cb0 <putchar_via_gadget>
      while (output->pos - printed_exponential_start_pos < width) {
  402e1d:	41 8b 45 18          	mov    eax,DWORD PTR [r13+0x18]
  402e21:	44 29 f0             	sub    eax,r14d
  402e24:	44 39 e0             	cmp    eax,r12d
  402e27:	72 e7                	jb     402e10 <print_exponential_number+0x310>
}
  402e29:	48 83 c4 38          	add    rsp,0x38
  402e2d:	5b                   	pop    rbx
  402e2e:	5d                   	pop    rbp
  402e2f:	41 5c                	pop    r12
  402e31:	41 5d                	pop    r13
  402e33:	41 5e                	pop    r14
  402e35:	41 5f                	pop    r15
  402e37:	c3                   	ret    
  402e38:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402e3f:	00 
    get_components(negative ? -abs_number : abs_number, precision) :
  402e40:	85 f6                	test   esi,esi
  402e42:	0f 84 2d fd ff ff    	je     402b75 <print_exponential_number+0x75>
  402e48:	e9 20 fd ff ff       	jmp    402b6d <print_exponential_number+0x6d>
  402e4d:	0f 1f 00             	nop    DWORD PTR [rax]
  print_broken_up_decimal(decimal_part_components, output, precision, decimal_part_width, flags, buf, len);
  402e50:	48 83 ec 08          	sub    rsp,0x8
  402e54:	4c 89 e9             	mov    rcx,r13
  402e57:	45 31 c9             	xor    r9d,r9d
  402e5a:	45 89 d8             	mov    r8d,r11d
  402e5d:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402e61:	50                   	push   rax
  402e62:	ff 74 24 10          	push   QWORD PTR [rsp+0x10]
  402e66:	55                   	push   rbp
  402e67:	e8 94 f7 ff ff       	call   402600 <print_broken_up_decimal.isra.0>
  402e6c:	48 83 c4 20          	add    rsp,0x20
}
  402e70:	48 83 c4 38          	add    rsp,0x38
  402e74:	5b                   	pop    rbx
  402e75:	5d                   	pop    rbp
  402e76:	41 5c                	pop    r12
  402e78:	41 5d                	pop    r13
  402e7a:	41 5e                	pop    r14
  402e7c:	41 5f                	pop    r15
  402e7e:	c3                   	ret    
  402e7f:	90                   	nop
    if ((flags & FLAGS_ADAPT_EXP) && floored_exp10 >= -1 && ((double)decimal_part_components.integral == powers_of_10[floored_exp10 + 1])) {
  402e80:	83 c3 01             	add    ebx,0x1
  402e83:	66 0f ef c0          	pxor   xmm0,xmm0
  402e87:	48 8d 05 52 29 00 00 	lea    rax,[rip+0x2952]        # 4057e0 <powers_of_10>
  402e8e:	48 63 db             	movsxd rbx,ebx
  402e91:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402e96:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  402e9b:	0f 8a 0e fd ff ff    	jp     402baf <print_exponential_number+0xaf>
  402ea1:	0f 85 08 fd ff ff    	jne    402baf <print_exponential_number+0xaf>
      precision--;
  402ea7:	41 83 eb 01          	sub    r11d,0x1
  402eab:	e9 ff fc ff ff       	jmp    402baf <print_exponential_number+0xaf>
  printf_size_t exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(floored_exp10) < 100) ? 4U : 5U;
  402eb0:	b8 04 00 00 00       	mov    eax,0x4
  402eb5:	e9 a4 fe ff ff       	jmp    402d5e <print_exponential_number+0x25e>
  402eba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
      0U :
  402ec0:	41 bf 04 00 00 00    	mov    r15d,0x4
  402ec6:	e9 4d fe ff ff       	jmp    402d18 <print_exponential_number+0x218>
    get_components(negative ? -abs_number : abs_number, precision) :
  402ecb:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402ed0:	44 89 de             	mov    esi,r11d
  402ed3:	66 0f 28 c6          	movapd xmm0,xmm6
    floored_exp10 = 0; // ... and no need to set a normalization factor or check the powers table
  402ed7:	31 db                	xor    ebx,ebx
    get_components(negative ? -abs_number : abs_number, precision) :
  402ed9:	e8 12 f4 ff ff       	call   4022f0 <get_components>
  402ede:	45 31 ff             	xor    r15d,r15d
  402ee1:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402ee6:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  402eeb:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  if (fall_back_to_decimal_only_mode) {
  402ef0:	e9 f2 fd ff ff       	jmp    402ce7 <print_exponential_number+0x1e7>

Disassembly of section .text.print_floating_point:

0000000000402f00 <print_floating_point>:
  if (value != value) {
  402f00:	66 0f 2e c0          	ucomisd xmm0,xmm0
{
  402f04:	41 89 d2             	mov    r10d,edx
  if (value != value) {
  402f07:	0f 8a eb 00 00 00    	jp     402ff8 <print_floating_point+0xf8>
  if (value < -DBL_MAX) {
  402f0d:	f2 0f 10 0d eb 29 00 	movsd  xmm1,QWORD PTR [rip+0x29eb]        # 405900 <powers_of_10+0x120>
  402f14:	00 
  402f15:	66 0f 2f c8          	comisd xmm1,xmm0
  402f19:	0f 87 21 01 00 00    	ja     403040 <print_floating_point+0x140>
  if (value > DBL_MAX) {
  402f1f:	66 0f 2f 05 e1 29 00 	comisd xmm0,QWORD PTR [rip+0x29e1]        # 405908 <powers_of_10+0x128>
  402f26:	00 
  402f27:	77 57                	ja     402f80 <print_floating_point+0x80>
{
  402f29:	48 83 ec 28          	sub    rsp,0x28
  if (!prefer_exponential &&
  402f2d:	45 84 c0             	test   r8b,r8b
  402f30:	75 7e                	jne    402fb0 <print_floating_point+0xb0>
  402f32:	66 0f 2f 05 d6 29 00 	comisd xmm0,QWORD PTR [rip+0x29d6]        # 405910 <powers_of_10+0x130>
  402f39:	00 
  402f3a:	0f 87 e8 00 00 00    	ja     403028 <print_floating_point+0x128>
      ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
  402f40:	f2 0f 10 0d d0 29 00 	movsd  xmm1,QWORD PTR [rip+0x29d0]        # 405918 <powers_of_10+0x138>
  402f47:	00 
  402f48:	66 0f 2f c8          	comisd xmm1,xmm0
  402f4c:	0f 87 d6 00 00 00    	ja     403028 <print_floating_point+0x128>
  if (!(flags & FLAGS_PRECISION)) {
  402f52:	41 89 c9             	mov    r9d,ecx
  402f55:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402f5c:	0f 85 fe 00 00 00    	jne    403060 <print_floating_point+0x160>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  402f62:	be 06 00 00 00       	mov    esi,0x6
    print_decimal_number(output, value, precision, width, flags, buf, len);
  402f67:	49 89 e0             	mov    r8,rsp
  402f6a:	44 89 d2             	mov    edx,r10d
  402f6d:	e8 7e f9 ff ff       	call   4028f0 <print_decimal_number>
}
  402f72:	48 83 c4 28          	add    rsp,0x28
  402f76:	c3                   	ret    
  402f77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  402f7e:	00 00 
    out_rev_(output, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
  402f80:	89 c8                	mov    eax,ecx
  402f82:	48 8d 35 90 26 00 00 	lea    rsi,[rip+0x2690]        # 405619 <memcpy+0xe39>
  402f89:	41 89 c8             	mov    r8d,ecx
  402f8c:	44 89 d1             	mov    ecx,r10d
  402f8f:	83 e0 04             	and    eax,0x4
  402f92:	83 f8 01             	cmp    eax,0x1
  402f95:	19 d2                	sbb    edx,edx
  402f97:	83 c2 04             	add    edx,0x4
  402f9a:	85 c0                	test   eax,eax
  402f9c:	48 8d 05 71 26 00 00 	lea    rax,[rip+0x2671]        # 405614 <memcpy+0xe34>
  402fa3:	48 0f 45 f0          	cmovne rsi,rax
  402fa7:	e9 04 ef ff ff       	jmp    401eb0 <out_rev_>
  402fac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  if (!(flags & FLAGS_PRECISION)) {
  402fb0:	41 89 c9             	mov    r9d,ecx
  402fb3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  402fba:	74 54                	je     403010 <print_floating_point+0x110>
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402fbc:	b8 01 00 00 00       	mov    eax,0x1
  402fc1:	45 31 c9             	xor    r9d,r9d
  402fc4:	83 fe 11             	cmp    esi,0x11
  402fc7:	76 4c                	jbe    403015 <print_floating_point+0x115>
  402fc9:	48 8d 54 24 ff       	lea    rdx,[rsp-0x1]
  402fce:	66 90                	xchg   ax,ax
    buf[len++] = '0'; // This respects the precision in terms of result length only
  402fd0:	41 89 c1             	mov    r9d,eax
  402fd3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
    precision--;
  402fd7:	83 ee 01             	sub    esi,0x1
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  402fda:	48 83 c0 01          	add    rax,0x1
  402fde:	41 83 f9 1f          	cmp    r9d,0x1f
  402fe2:	77 05                	ja     402fe9 <print_floating_point+0xe9>
  402fe4:	83 fe 11             	cmp    esi,0x11
  402fe7:	77 e7                	ja     402fd0 <print_floating_point+0xd0>
  if (prefer_exponential)
  402fe9:	45 84 c0             	test   r8b,r8b
  402fec:	0f 84 75 ff ff ff    	je     402f67 <print_floating_point+0x67>
  402ff2:	eb 21                	jmp    403015 <print_floating_point+0x115>
  402ff4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    out_rev_(output, "nan", 3, width, flags);
  402ff8:	41 89 c8             	mov    r8d,ecx
  402ffb:	48 8d 35 1b 26 00 00 	lea    rsi,[rip+0x261b]        # 40561d <memcpy+0xe3d>
  403002:	89 d1                	mov    ecx,edx
  403004:	ba 03 00 00 00       	mov    edx,0x3
  403009:	e9 a2 ee ff ff       	jmp    401eb0 <out_rev_>
  40300e:	66 90                	xchg   ax,ax
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
  403010:	be 06 00 00 00       	mov    esi,0x6
    print_exponential_number(output, value, precision, width, flags, buf, len);
  403015:	49 89 e0             	mov    r8,rsp
  403018:	44 89 d2             	mov    edx,r10d
  40301b:	e8 e0 fa ff ff       	call   402b00 <print_exponential_number>
}
  403020:	48 83 c4 28          	add    rsp,0x28
  403024:	c3                   	ret    
  403025:	0f 1f 00             	nop    DWORD PTR [rax]
    print_exponential_number(output, value, precision, width, flags, buf, len);
  403028:	45 31 c9             	xor    r9d,r9d
  40302b:	49 89 e0             	mov    r8,rsp
  40302e:	44 89 d2             	mov    edx,r10d
  403031:	e8 ca fa ff ff       	call   402b00 <print_exponential_number>
    return;
  403036:	e9 37 ff ff ff       	jmp    402f72 <print_floating_point+0x72>
  40303b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    out_rev_(output, "fni-", 4, width, flags);
  403040:	41 89 c8             	mov    r8d,ecx
  403043:	48 8d 35 d7 25 00 00 	lea    rsi,[rip+0x25d7]        # 405621 <memcpy+0xe41>
  40304a:	89 d1                	mov    ecx,edx
  40304c:	ba 04 00 00 00       	mov    edx,0x4
  403051:	e9 5a ee ff ff       	jmp    401eb0 <out_rev_>
  403056:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40305d:	00 00 00 
  while ((len < PRINTF_DECIMAL_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
  403060:	b8 01 00 00 00       	mov    eax,0x1
  403065:	45 31 c9             	xor    r9d,r9d
  403068:	83 fe 11             	cmp    esi,0x11
  40306b:	0f 87 58 ff ff ff    	ja     402fc9 <print_floating_point+0xc9>
  403071:	e9 f1 fe ff ff       	jmp    402f67 <print_floating_point+0x67>

Disassembly of section .text.format_string_loop:

0000000000403080 <format_string_loop>:

static inline void format_string_loop(output_gadget_t* output, const char* format, va_list args)
{
  403080:	41 57                	push   r15
  403082:	41 56                	push   r14
  403084:	41 55                	push   r13
  403086:	41 54                	push   r12
  403088:	55                   	push   rbp
  403089:	53                   	push   rbx
  40308a:	48 89 d3             	mov    rbx,rdx
#else
#define ADVANCE_IN_FORMAT_STRING(cptr_) (cptr_)++
#endif


  while (*format)
  40308d:	48 89 f2             	mov    rdx,rsi
{
  403090:	48 83 ec 28          	sub    rsp,0x28
  403094:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
  while (*format)
  403099:	0f be 36             	movsx  esi,BYTE PTR [rsi]
  40309c:	40 84 f6             	test   sil,sil
  40309f:	0f 84 e5 00 00 00    	je     40318a <format_string_loop+0x10a>
  4030a5:	48 89 fd             	mov    rbp,rdi
        ADVANCE_IN_FORMAT_STRING(format);
      }
    }

    // evaluate length field
    switch (*format) {
  4030a8:	4c 8d 2d 85 25 00 00 	lea    r13,[rip+0x2585]        # 405634 <memcpy+0xe54>
  4030af:	90                   	nop
    if (*format != '%') {
  4030b0:	40 80 fe 25          	cmp    sil,0x25
  4030b4:	0f 85 ae 00 00 00    	jne    403168 <format_string_loop+0xe8>
    ADVANCE_IN_FORMAT_STRING(format);
  4030ba:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4030be:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4030c3:	80 7a 01 00          	cmp    BYTE PTR [rdx+0x1],0x0
  4030c7:	0f 84 bd 00 00 00    	je     40318a <format_string_loop+0x10a>
    printf_flags_t flags = parse_flags(&format);
  4030cd:	4c 8d 4c 24 18       	lea    r9,[rsp+0x18]
  4030d2:	4c 89 cf             	mov    rdi,r9
  4030d5:	e8 86 f4 ff ff       	call   402560 <parse_flags>
    if (is_digit_(*format)) {
  4030da:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
    printf_flags_t flags = parse_flags(&format);
  4030df:	41 89 c3             	mov    r11d,eax
    if (is_digit_(*format)) {
  4030e2:	0f be 3a             	movsx  edi,BYTE PTR [rdx]
  4030e5:	89 fe                	mov    esi,edi
  4030e7:	e8 74 ed ff ff       	call   401e60 <is_digit_>
  4030ec:	84 c0                	test   al,al
  4030ee:	0f 85 ac 04 00 00    	jne    4035a0 <format_string_loop+0x520>
    printf_size_t width = 0U;
  4030f4:	45 31 e4             	xor    r12d,r12d
    else if (*format == '*') {
  4030f7:	40 80 fe 2a          	cmp    sil,0x2a
  4030fb:	0f 84 bf 04 00 00    	je     4035c0 <format_string_loop+0x540>
    printf_size_t precision = 0U;
  403101:	45 31 ff             	xor    r15d,r15d
    if (*format == '.') {
  403104:	40 80 fe 2e          	cmp    sil,0x2e
  403108:	0f 84 52 04 00 00    	je     403560 <format_string_loop+0x4e0>
    switch (*format) {
  40310e:	8d 46 98             	lea    eax,[rsi-0x68]
  403111:	3c 12                	cmp    al,0x12
  403113:	77 2f                	ja     403144 <format_string_loop+0xc4>
  403115:	0f b6 c0             	movzx  eax,al
  403118:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  40311d:	4c 01 e8             	add    rax,r13
  403120:	3e ff e0             	notrack jmp rax
  403123:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
        break;
      case 'z' :
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
        ADVANCE_IN_FORMAT_STRING(format);
  403128:	48 8d 42 01          	lea    rax,[rdx+0x1]
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
  40312c:	41 81 cb 00 02 00 00 	or     r11d,0x200
        ADVANCE_IN_FORMAT_STRING(format);
  403133:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403138:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40313c:	40 84 f6             	test   sil,sil
  40313f:	74 49                	je     40318a <format_string_loop+0x10a>
  403141:	48 89 c2             	mov    rdx,rax
      default:
        break;
    }

    // evaluate specifier
    switch (*format) {
  403144:	8d 46 db             	lea    eax,[rsi-0x25]
  403147:	3c 53                	cmp    al,0x53
  403149:	77 1d                	ja     403168 <format_string_loop+0xe8>
  40314b:	48 8d 0d 2e 25 00 00 	lea    rcx,[rip+0x252e]        # 405680 <memcpy+0xea0>
  403152:	0f b6 c0             	movzx  eax,al
  403155:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
  403159:	48 01 c8             	add    rax,rcx
  40315c:	3e ff e0             	notrack jmp rax
        format++;
        break;
      }

      case '%' :
        putchar_via_gadget(output, '%');
  40315f:	be 25 00 00 00       	mov    esi,0x25
  403164:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        break;
      }
#endif // PRINTF_SUPPORT_WRITEBACK_SPECIFIER

      default :
        putchar_via_gadget(output, *format);
  403168:	48 89 ef             	mov    rdi,rbp
  40316b:	e8 40 eb ff ff       	call   401cb0 <putchar_via_gadget>
        format++;
  403170:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  403175:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403179:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  while (*format)
  40317e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403181:	40 84 f6             	test   sil,sil
  403184:	0f 85 26 ff ff ff    	jne    4030b0 <format_string_loop+0x30>
        break;
    }
  }
}
  40318a:	48 83 c4 28          	add    rsp,0x28
  40318e:	5b                   	pop    rbx
  40318f:	5d                   	pop    rbp
  403190:	41 5c                	pop    r12
  403192:	41 5d                	pop    r13
  403194:	41 5e                	pop    r14
  403196:	41 5f                	pop    r15
  403198:	c3                   	ret    
  403199:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        if (*format == 'd' || *format == 'i') {
  4031a0:	40 80 fe 64          	cmp    sil,0x64
  4031a4:	0f 84 6e 06 00 00    	je     403818 <format_string_loop+0x798>
  4031aa:	40 80 fe 69          	cmp    sil,0x69
  4031ae:	0f 84 64 06 00 00    	je     403818 <format_string_loop+0x798>
        if (*format == 'x' || *format == 'X') {
  4031b4:	89 f0                	mov    eax,esi
  4031b6:	83 e0 df             	and    eax,0xffffffdf
  4031b9:	3c 58                	cmp    al,0x58
  4031bb:	0f 84 37 06 00 00    	je     4037f8 <format_string_loop+0x778>
        else if (*format == 'o') {
  4031c1:	b9 08 00 00 00       	mov    ecx,0x8
  4031c6:	40 80 fe 6f          	cmp    sil,0x6f
  4031ca:	74 14                	je     4031e0 <format_string_loop+0x160>
        else if (*format == 'b') {
  4031cc:	b9 02 00 00 00       	mov    ecx,0x2
  4031d1:	40 80 fe 62          	cmp    sil,0x62
  4031d5:	74 09                	je     4031e0 <format_string_loop+0x160>
          flags &= ~FLAGS_HASH; // decimal integers have no alternative presentation
  4031d7:	41 83 e3 ef          	and    r11d,0xffffffef
  4031db:	b9 0a 00 00 00       	mov    ecx,0xa
          flags &= ~FLAGS_ZEROPAD;
  4031e0:	44 89 d8             	mov    eax,r11d
        format++;
  4031e3:	48 83 c2 01          	add    rdx,0x1
          flags &= ~FLAGS_ZEROPAD;
  4031e7:	83 e0 fe             	and    eax,0xfffffffe
  4031ea:	41 f7 c3 00 08 00 00 	test   r11d,0x800
        format++;
  4031f1:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
          flags &= ~FLAGS_ZEROPAD;
  4031f6:	44 0f 45 d8          	cmovne r11d,eax
            const long long value = va_arg(args, long long);
  4031fa:	8b 03                	mov    eax,DWORD PTR [rbx]
          if (flags & FLAGS_LONG_LONG) {
  4031fc:	44 89 da             	mov    edx,r11d
  4031ff:	81 e2 00 04 00 00    	and    edx,0x400
        if (flags & FLAGS_SIGNED) {
  403205:	41 f7 c3 00 40 00 00 	test   r11d,0x4000
  40320c:	0f 84 b6 04 00 00    	je     4036c8 <format_string_loop+0x648>
          if (flags & FLAGS_LONG_LONG) {
  403212:	85 d2                	test   edx,edx
  403214:	0f 85 be 06 00 00    	jne    4038d8 <format_string_loop+0x858>
          else if (flags & FLAGS_LONG) {
  40321a:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403221:	0f 85 b1 06 00 00    	jne    4038d8 <format_string_loop+0x858>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403227:	41 f6 c3 40          	test   r11b,0x40
  40322b:	0f 84 51 08 00 00    	je     403a82 <format_string_loop+0xa02>
  403231:	83 f8 2f             	cmp    eax,0x2f
  403234:	0f 87 bc 08 00 00    	ja     403af6 <format_string_loop+0xa76>
  40323a:	89 c2                	mov    edx,eax
  40323c:	83 c0 08             	add    eax,0x8
  40323f:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403243:	89 03                	mov    DWORD PTR [rbx],eax
  403245:	0f be 02             	movsx  eax,BYTE PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  403248:	48 63 f8             	movsxd rdi,eax
  40324b:	89 c2                	mov    edx,eax
  40324d:	45 89 e1             	mov    r9d,r12d
  403250:	45 89 f8             	mov    r8d,r15d
  403253:	48 89 fe             	mov    rsi,rdi
  403256:	c1 ea 1f             	shr    edx,0x1f
  403259:	48 f7 de             	neg    rsi
  40325c:	85 c0                	test   eax,eax
  40325e:	48 0f 4f f7          	cmovg  rsi,rdi
  403262:	48 83 ec 08          	sub    rsp,0x8
  403266:	48 89 ef             	mov    rdi,rbp
  403269:	41 53                	push   r11
  40326b:	e8 90 ef ff ff       	call   402200 <print_integer>
  while (*format)
  403270:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403275:	41 5a                	pop    r10
  403277:	41 5b                	pop    r11
  403279:	e9 00 ff ff ff       	jmp    40317e <format_string_loop+0xfe>
  40327e:	66 90                	xchg   ax,ax
        ADVANCE_IN_FORMAT_STRING(format);
  403280:	48 8d 42 01          	lea    rax,[rdx+0x1]
  403284:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403289:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  40328d:	40 84 f6             	test   sil,sil
  403290:	0f 84 f4 fe ff ff    	je     40318a <format_string_loop+0x10a>
        if (*format == 'h') {
  403296:	40 80 fe 68          	cmp    sil,0x68
  40329a:	0f 84 d8 03 00 00    	je     403678 <format_string_loop+0x5f8>
        flags |= FLAGS_SHORT;
  4032a0:	41 80 cb 80          	or     r11b,0x80
  4032a4:	48 89 c2             	mov    rdx,rax
  4032a7:	e9 98 fe ff ff       	jmp    403144 <format_string_loop+0xc4>
  4032ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        ADVANCE_IN_FORMAT_STRING(format);
  4032b0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4032b4:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4032b9:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4032bd:	40 84 f6             	test   sil,sil
  4032c0:	0f 84 c4 fe ff ff    	je     40318a <format_string_loop+0x10a>
        if (*format == 'l') {
  4032c6:	40 80 fe 6c          	cmp    sil,0x6c
  4032ca:	0f 84 d0 03 00 00    	je     4036a0 <format_string_loop+0x620>
        flags |= FLAGS_LONG;
  4032d0:	41 81 cb 00 02 00 00 	or     r11d,0x200
  4032d7:	48 89 c2             	mov    rdx,rax
  4032da:	e9 65 fe ff ff       	jmp    403144 <format_string_loop+0xc4>
  4032df:	90                   	nop
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
  4032e0:	89 f2                	mov    edx,esi
  4032e2:	44 89 d8             	mov    eax,r11d
  4032e5:	83 e2 df             	and    edx,0xffffffdf
  4032e8:	80 cc 10             	or     ah,0x10
  4032eb:	80 fa 47             	cmp    dl,0x47
  4032ee:	44 0f 44 d8          	cmove  r11d,eax
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
  4032f2:	83 e6 fd             	and    esi,0xfffffffd
  4032f5:	44 89 d8             	mov    eax,r11d
  4032f8:	83 c8 20             	or     eax,0x20
  4032fb:	40 80 fe 45          	cmp    sil,0x45
  4032ff:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  403303:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403306:	3d af 00 00 00       	cmp    eax,0xaf
  40330b:	0f 87 9f 03 00 00    	ja     4036b0 <format_string_loop+0x630>
  403311:	89 c7                	mov    edi,eax
  403313:	83 c0 10             	add    eax,0x10
  403316:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  40331a:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  40331d:	41 b8 01 00 00 00    	mov    r8d,0x1
  403323:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  403327:	44 89 e2             	mov    edx,r12d
  40332a:	44 89 d9             	mov    ecx,r11d
  40332d:	44 89 fe             	mov    esi,r15d
  403330:	48 89 ef             	mov    rdi,rbp
  403333:	e8 c8 fb ff ff       	call   402f00 <print_floating_point>
        format++;
  403338:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
  40333d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  403341:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403346:	e9 33 fe ff ff       	jmp    40317e <format_string_loop+0xfe>
  40334b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
  403350:	44 89 d8             	mov    eax,r11d
  403353:	83 c8 20             	or     eax,0x20
  403356:	40 80 fe 46          	cmp    sil,0x46
  40335a:	44 0f 44 d8          	cmove  r11d,eax
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  40335e:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
  403361:	3d af 00 00 00       	cmp    eax,0xaf
  403366:	0f 87 74 04 00 00    	ja     4037e0 <format_string_loop+0x760>
  40336c:	89 c7                	mov    edi,eax
  40336e:	83 c0 10             	add    eax,0x10
  403371:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  403375:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  403378:	45 31 c0             	xor    r8d,r8d
  40337b:	eb a6                	jmp    403323 <format_string_loop+0x2a3>
        if (!(flags & FLAGS_LEFT)) {
  40337d:	41 83 e3 02          	and    r11d,0x2
  403381:	0f 84 b9 05 00 00    	je     403940 <format_string_loop+0x8c0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403387:	8b 03                	mov    eax,DWORD PTR [rbx]
  403389:	83 f8 2f             	cmp    eax,0x2f
  40338c:	0f 86 a9 06 00 00    	jbe    403a3b <format_string_loop+0x9bb>
  403392:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403396:	48 8d 42 08          	lea    rax,[rdx+0x8]
  40339a:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40339e:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4033a1:	48 89 ef             	mov    rdi,rbp
          while (l++ < width) {
  4033a4:	41 bf 02 00 00 00    	mov    r15d,0x2
        putchar_via_gadget(output, (char) va_arg(args, int) );
  4033aa:	e8 01 e9 ff ff       	call   401cb0 <putchar_via_gadget>
          while (l++ < width) {
  4033af:	41 83 fc 01          	cmp    r12d,0x1
  4033b3:	0f 86 b7 fd ff ff    	jbe    403170 <format_string_loop+0xf0>
  4033b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  4033c0:	be 20 00 00 00       	mov    esi,0x20
  4033c5:	48 89 ef             	mov    rdi,rbp
  4033c8:	e8 e3 e8 ff ff       	call   401cb0 <putchar_via_gadget>
          while (l++ < width) {
  4033cd:	44 89 f8             	mov    eax,r15d
  4033d0:	41 83 c7 01          	add    r15d,0x1
  4033d4:	41 39 c4             	cmp    r12d,eax
  4033d7:	75 e7                	jne    4033c0 <format_string_loop+0x340>
  4033d9:	e9 92 fd ff ff       	jmp    403170 <format_string_loop+0xf0>
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4033de:	8b 03                	mov    eax,DWORD PTR [rbx]
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
  4033e0:	41 81 cb 01 20 00 00 	or     r11d,0x2001
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4033e7:	83 f8 2f             	cmp    eax,0x2f
  4033ea:	0f 87 b0 03 00 00    	ja     4037a0 <format_string_loop+0x720>
  4033f0:	89 c2                	mov    edx,eax
  4033f2:	83 c0 08             	add    eax,0x8
  4033f5:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4033f9:	89 03                	mov    DWORD PTR [rbx],eax
  4033fb:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4033fe:	48 85 f6             	test   rsi,rsi
  403401:	0f 84 b1 03 00 00    	je     4037b8 <format_string_loop+0x738>
          print_integer(output, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
  403407:	48 83 ec 08          	sub    rsp,0x8
  40340b:	31 d2                	xor    edx,edx
  40340d:	41 b9 12 00 00 00    	mov    r9d,0x12
  403413:	45 89 f8             	mov    r8d,r15d
  403416:	41 53                	push   r11
  403418:	b9 10 00 00 00       	mov    ecx,0x10
  40341d:	48 89 ef             	mov    rdi,rbp
  403420:	e8 db ed ff ff       	call   402200 <print_integer>
  403425:	58                   	pop    rax
  403426:	5a                   	pop    rdx
        format++;
  403427:	e9 44 fd ff ff       	jmp    403170 <format_string_loop+0xf0>
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  40342c:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
            const long long value = va_arg(args, long long);
  40342f:	8b 03                	mov    eax,DWORD PTR [rbx]
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403431:	41 f6 c3 40          	test   r11b,0x40
  403435:	0f 84 f5 02 00 00    	je     403730 <format_string_loop+0x6b0>
  40343b:	83 f8 2f             	cmp    eax,0x2f
  40343e:	0f 87 3c 04 00 00    	ja     403880 <format_string_loop+0x800>
  403444:	89 c2                	mov    edx,eax
  403446:	83 c0 08             	add    eax,0x8
  403449:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40344d:	89 03                	mov    DWORD PTR [rbx],eax
  40344f:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403452:	88 08                	mov    BYTE PTR [rax],cl
        format++;
  403454:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403459:	48 83 c2 01          	add    rdx,0x1
  40345d:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
        break;
  403462:	e9 17 fd ff ff       	jmp    40317e <format_string_loop+0xfe>
        const char* p = va_arg(args, char*);
  403467:	8b 03                	mov    eax,DWORD PTR [rbx]
  403469:	83 f8 2f             	cmp    eax,0x2f
  40346c:	0f 87 ee 02 00 00    	ja     403760 <format_string_loop+0x6e0>
  403472:	89 c2                	mov    edx,eax
  403474:	83 c0 08             	add    eax,0x8
  403477:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40347b:	89 03                	mov    DWORD PTR [rbx],eax
  40347d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  403480:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403484:	48 85 c0             	test   rax,rax
  403487:	0f 84 ef 02 00 00    	je     40377c <format_string_loop+0x6fc>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  40348d:	45 85 ff             	test   r15d,r15d
  403490:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403495:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  403499:	41 0f 45 f7          	cmovne esi,r15d
  40349d:	e8 7e e9 ff ff       	call   401e20 <strnlen_s_>
            l = (l < precision ? l : precision);
  4034a2:	44 89 df             	mov    edi,r11d
  4034a5:	44 39 f8             	cmp    eax,r15d
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4034a8:	89 c1                	mov    ecx,eax
            l = (l < precision ? l : precision);
  4034aa:	41 0f 47 c7          	cmova  eax,r15d
  4034ae:	81 e7 00 08 00 00    	and    edi,0x800
  4034b4:	41 89 fe             	mov    r14d,edi
  4034b7:	0f 44 c1             	cmove  eax,ecx
          if (!(flags & FLAGS_LEFT)) {
  4034ba:	41 83 e3 02          	and    r11d,0x2
  4034be:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
            l = (l < precision ? l : precision);
  4034c3:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
          if (!(flags & FLAGS_LEFT)) {
  4034c7:	0f 84 c3 04 00 00    	je     403990 <format_string_loop+0x910>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4034cd:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4034d1:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4034d4:	40 84 f6             	test   sil,sil
  4034d7:	74 52                	je     40352b <format_string_loop+0x4ab>
  4034d9:	85 ff                	test   edi,edi
  4034db:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4034e0:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4034e5:	45 85 ff             	test   r15d,r15d
  4034e8:	75 04                	jne    4034ee <format_string_loop+0x46e>
  4034ea:	84 c0                	test   al,al
  4034ec:	74 3d                	je     40352b <format_string_loop+0x4ab>
          printf_size_t l = strnlen_s_(p, precision ? precision : PRINTF_MAX_POSSIBLE_BUFFER_SIZE);
  4034ee:	4c 8b 34 24          	mov    r14,QWORD PTR [rsp]
  4034f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            putchar_via_gadget(output, *(p++));
  4034f8:	49 83 c6 01          	add    r14,0x1
  4034fc:	48 89 ef             	mov    rdi,rbp
  4034ff:	e8 ac e7 ff ff       	call   401cb0 <putchar_via_gadget>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  403504:	41 0f be 36          	movsx  esi,BYTE PTR [r14]
  403508:	40 84 f6             	test   sil,sil
  40350b:	74 12                	je     40351f <format_string_loop+0x49f>
  40350d:	44 89 fa             	mov    edx,r15d
  403510:	44 29 f2             	sub    edx,r14d
  403513:	03 14 24             	add    edx,DWORD PTR [rsp]
  403516:	75 e0                	jne    4034f8 <format_string_loop+0x478>
  403518:	80 7c 24 0c 00       	cmp    BYTE PTR [rsp+0xc],0x0
  40351d:	75 d9                	jne    4034f8 <format_string_loop+0x478>
          if (flags & FLAGS_LEFT) {
  40351f:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
  403523:	85 c9                	test   ecx,ecx
  403525:	0f 84 45 fc ff ff    	je     403170 <format_string_loop+0xf0>
            while (l++ < width) {
  40352b:	8b 44 24 14          	mov    eax,DWORD PTR [rsp+0x14]
  40352f:	44 8d 78 01          	lea    r15d,[rax+0x1]
  403533:	41 39 c4             	cmp    r12d,eax
  403536:	0f 86 34 fc ff ff    	jbe    403170 <format_string_loop+0xf0>
  40353c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
              putchar_via_gadget(output, ' ');
  403540:	be 20 00 00 00       	mov    esi,0x20
  403545:	48 89 ef             	mov    rdi,rbp
  403548:	e8 63 e7 ff ff       	call   401cb0 <putchar_via_gadget>
            while (l++ < width) {
  40354d:	44 89 f8             	mov    eax,r15d
  403550:	41 83 c7 01          	add    r15d,0x1
  403554:	41 39 c4             	cmp    r12d,eax
  403557:	75 e7                	jne    403540 <format_string_loop+0x4c0>
  403559:	e9 12 fc ff ff       	jmp    403170 <format_string_loop+0xf0>
  40355e:	66 90                	xchg   ax,ax
      ADVANCE_IN_FORMAT_STRING(format);
  403560:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
      flags |= FLAGS_PRECISION;
  403564:	41 81 cb 00 08 00 00 	or     r11d,0x800
      ADVANCE_IN_FORMAT_STRING(format);
  40356b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
  403570:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  403574:	40 84 f6             	test   sil,sil
  403577:	0f 84 0d fc ff ff    	je     40318a <format_string_loop+0x10a>
      if (is_digit_(*format)) {
  40357d:	40 0f be fe          	movsx  edi,sil
  403581:	e8 da e8 ff ff       	call   401e60 <is_digit_>
  403586:	84 c0                	test   al,al
  403588:	0f 85 82 00 00 00    	jne    403610 <format_string_loop+0x590>
      else if (*format == '*') {
  40358e:	40 80 fe 2a          	cmp    sil,0x2a
  403592:	0f 84 98 00 00 00    	je     403630 <format_string_loop+0x5b0>
  403598:	48 89 ca             	mov    rdx,rcx
  40359b:	e9 6e fb ff ff       	jmp    40310e <format_string_loop+0x8e>
      width = (printf_size_t) atou_(&format);
  4035a0:	4c 89 cf             	mov    rdi,r9
  4035a3:	e8 c8 e8 ff ff       	call   401e70 <atou_>
    if (*format == '.') {
  4035a8:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
      width = (printf_size_t) atou_(&format);
  4035ad:	41 89 c4             	mov    r12d,eax
    if (*format == '.') {
  4035b0:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  4035b3:	e9 49 fb ff ff       	jmp    403101 <format_string_loop+0x81>
  4035b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4035bf:	00 
      const int w = va_arg(args, int);
  4035c0:	8b 03                	mov    eax,DWORD PTR [rbx]
  4035c2:	83 f8 2f             	cmp    eax,0x2f
  4035c5:	77 39                	ja     403600 <format_string_loop+0x580>
  4035c7:	89 c1                	mov    ecx,eax
  4035c9:	83 c0 08             	add    eax,0x8
  4035cc:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  4035d0:	89 03                	mov    DWORD PTR [rbx],eax
  4035d2:	44 8b 21             	mov    r12d,DWORD PTR [rcx]
      if (w < 0) {
  4035d5:	45 85 e4             	test   r12d,r12d
  4035d8:	79 07                	jns    4035e1 <format_string_loop+0x561>
        flags |= FLAGS_LEFT;    // reverse padding
  4035da:	41 83 cb 02          	or     r11d,0x2
        width = (printf_size_t)-w;
  4035de:	41 f7 dc             	neg    r12d
      ADVANCE_IN_FORMAT_STRING(format);
  4035e1:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4035e5:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4035ea:	0f be 72 01          	movsx  esi,BYTE PTR [rdx+0x1]
  4035ee:	40 84 f6             	test   sil,sil
  4035f1:	0f 84 93 fb ff ff    	je     40318a <format_string_loop+0x10a>
  4035f7:	48 89 c2             	mov    rdx,rax
  4035fa:	e9 02 fb ff ff       	jmp    403101 <format_string_loop+0x81>
  4035ff:	90                   	nop
      const int w = va_arg(args, int);
  403600:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  403604:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403608:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40360c:	eb c4                	jmp    4035d2 <format_string_loop+0x552>
  40360e:	66 90                	xchg   ax,ax
        precision = (printf_size_t) atou_(&format);
  403610:	4c 89 cf             	mov    rdi,r9
  403613:	e8 58 e8 ff ff       	call   401e70 <atou_>
    switch (*format) {
  403618:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
        precision = (printf_size_t) atou_(&format);
  40361d:	41 89 c7             	mov    r15d,eax
    switch (*format) {
  403620:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403623:	e9 e6 fa ff ff       	jmp    40310e <format_string_loop+0x8e>
  403628:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40362f:	00 
        const int precision_ = va_arg(args, int);
  403630:	8b 03                	mov    eax,DWORD PTR [rbx]
  403632:	83 f8 2f             	cmp    eax,0x2f
  403635:	0f 87 ed 01 00 00    	ja     403828 <format_string_loop+0x7a8>
  40363b:	89 c1                	mov    ecx,eax
  40363d:	83 c0 08             	add    eax,0x8
  403640:	48 03 4b 10          	add    rcx,QWORD PTR [rbx+0x10]
  403644:	89 03                	mov    DWORD PTR [rbx],eax
        precision = precision_ > 0 ? (printf_size_t) precision_ : 0U;
  403646:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
  403649:	31 c0                	xor    eax,eax
  40364b:	45 85 d2             	test   r10d,r10d
  40364e:	41 0f 49 c2          	cmovns eax,r10d
  403652:	41 89 c7             	mov    r15d,eax
        ADVANCE_IN_FORMAT_STRING(format);
  403655:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403659:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40365e:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403662:	40 84 f6             	test   sil,sil
  403665:	0f 84 1f fb ff ff    	je     40318a <format_string_loop+0x10a>
  40366b:	48 89 c2             	mov    rdx,rax
  40366e:	e9 9b fa ff ff       	jmp    40310e <format_string_loop+0x8e>
  403673:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
          flags |= FLAGS_CHAR;
  403678:	41 80 cb c0          	or     r11b,0xc0
          ADVANCE_IN_FORMAT_STRING(format);
  40367c:	48 8d 42 02          	lea    rax,[rdx+0x2]
  403680:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403685:	0f be 72 02          	movsx  esi,BYTE PTR [rdx+0x2]
  403689:	40 84 f6             	test   sil,sil
  40368c:	0f 85 af fa ff ff    	jne    403141 <format_string_loop+0xc1>
  403692:	e9 f3 fa ff ff       	jmp    40318a <format_string_loop+0x10a>
  403697:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40369e:	00 00 
          flags |= FLAGS_LONG_LONG;
  4036a0:	41 81 cb 00 06 00 00 	or     r11d,0x600
          ADVANCE_IN_FORMAT_STRING(format);
  4036a7:	eb d3                	jmp    40367c <format_string_loop+0x5fc>
  4036a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
  4036b0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4036b4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4036b8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4036bc:	e9 5c fc ff ff       	jmp    40331d <format_string_loop+0x29d>
  4036c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
  4036c8:	44 89 de             	mov    esi,r11d
  4036cb:	83 e6 f3             	and    esi,0xfffffff3
          if (flags & FLAGS_LONG_LONG) {
  4036ce:	85 d2                	test   edx,edx
  4036d0:	0f 85 c2 01 00 00    	jne    403898 <format_string_loop+0x818>
          else if (flags & FLAGS_LONG) {
  4036d6:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  4036dd:	0f 85 b5 01 00 00    	jne    403898 <format_string_loop+0x818>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  4036e3:	41 f6 c3 40          	test   r11b,0x40
  4036e7:	0f 84 6f 03 00 00    	je     403a5c <format_string_loop+0x9dc>
  4036ed:	83 f8 2f             	cmp    eax,0x2f
  4036f0:	0f 87 d7 03 00 00    	ja     403acd <format_string_loop+0xa4d>
  4036f6:	89 c2                	mov    edx,eax
  4036f8:	83 c0 08             	add    eax,0x8
  4036fb:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4036ff:	89 03                	mov    DWORD PTR [rbx],eax
  403701:	44 0f b6 1a          	movzx  r11d,BYTE PTR [rdx]
            print_integer(output, (printf_unsigned_value_t) value, false, base, precision, width, flags);
  403705:	48 83 ec 08          	sub    rsp,0x8
  403709:	31 d2                	xor    edx,edx
  40370b:	48 89 ef             	mov    rdi,rbp
  40370e:	45 89 e1             	mov    r9d,r12d
  403711:	56                   	push   rsi
  403712:	45 89 f8             	mov    r8d,r15d
  403715:	4c 89 de             	mov    rsi,r11
  403718:	e8 e3 ea ff ff       	call   402200 <print_integer>
  while (*format)
  40371d:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403722:	5e                   	pop    rsi
  403723:	5f                   	pop    rdi
  403724:	e9 55 fa ff ff       	jmp    40317e <format_string_loop+0xfe>
  403729:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403730:	41 f6 c3 80          	test   r11b,0x80
  403734:	0f 84 06 01 00 00    	je     403840 <format_string_loop+0x7c0>
  40373a:	83 f8 2f             	cmp    eax,0x2f
  40373d:	0f 87 08 03 00 00    	ja     403a4b <format_string_loop+0x9cb>
  403743:	89 c6                	mov    esi,eax
  403745:	83 c0 08             	add    eax,0x8
  403748:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40374c:	89 03                	mov    DWORD PTR [rbx],eax
  40374e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403751:	66 89 08             	mov    WORD PTR [rax],cx
  403754:	e9 00 fd ff ff       	jmp    403459 <format_string_loop+0x3d9>
  403759:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        const char* p = va_arg(args, char*);
  403760:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403764:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403768:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40376c:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  40376f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
        if (p == NULL) {
  403773:	48 85 c0             	test   rax,rax
  403776:	0f 85 11 fd ff ff    	jne    40348d <format_string_loop+0x40d>
          out_rev_(output, ")llun(", 6, width, flags);
  40377c:	45 89 d8             	mov    r8d,r11d
  40377f:	44 89 e1             	mov    ecx,r12d
  403782:	ba 06 00 00 00       	mov    edx,0x6
  403787:	48 89 ef             	mov    rdi,rbp
  40378a:	48 8d 35 95 1e 00 00 	lea    rsi,[rip+0x1e95]        # 405626 <memcpy+0xe46>
  403791:	e8 1a e7 ff ff       	call   401eb0 <out_rev_>
  403796:	e9 d5 f9 ff ff       	jmp    403170 <format_string_loop+0xf0>
  40379b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
        uintptr_t value = (uintptr_t)va_arg(args, void*);
  4037a0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  4037a4:	48 8d 42 08          	lea    rax,[rdx+0x8]
  4037a8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037ac:	48 8b 32             	mov    rsi,QWORD PTR [rdx]
          out_rev_(output, ")lin(", 5, width, flags) :
  4037af:	48 85 f6             	test   rsi,rsi
  4037b2:	0f 85 4f fc ff ff    	jne    403407 <format_string_loop+0x387>
  4037b8:	45 89 d8             	mov    r8d,r11d
  4037bb:	b9 12 00 00 00       	mov    ecx,0x12
  4037c0:	ba 05 00 00 00       	mov    edx,0x5
  4037c5:	48 89 ef             	mov    rdi,rbp
  4037c8:	48 8d 35 5e 1e 00 00 	lea    rsi,[rip+0x1e5e]        # 40562d <memcpy+0xe4d>
  4037cf:	e8 dc e6 ff ff       	call   401eb0 <out_rev_>
  4037d4:	e9 97 f9 ff ff       	jmp    403170 <format_string_loop+0xf0>
  4037d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        print_floating_point(output, va_arg(args, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
  4037e0:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  4037e4:	48 8d 47 08          	lea    rax,[rdi+0x8]
  4037e8:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  4037ec:	e9 87 fb ff ff       	jmp    403378 <format_string_loop+0x2f8>
  4037f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_UPPERCASE;
  4037f8:	44 89 d8             	mov    eax,r11d
  4037fb:	41 83 cb 20          	or     r11d,0x20
  4037ff:	40 80 fe 58          	cmp    sil,0x58
  403803:	b9 10 00 00 00       	mov    ecx,0x10
  403808:	44 0f 45 d8          	cmovne r11d,eax
  40380c:	e9 cf f9 ff ff       	jmp    4031e0 <format_string_loop+0x160>
  403811:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
          flags |= FLAGS_SIGNED;
  403818:	41 81 cb 00 40 00 00 	or     r11d,0x4000
  40381f:	e9 90 f9 ff ff       	jmp    4031b4 <format_string_loop+0x134>
  403824:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
        const int precision_ = va_arg(args, int);
  403828:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  40382c:	48 8d 41 08          	lea    rax,[rcx+0x8]
  403830:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403834:	e9 0d fe ff ff       	jmp    403646 <format_string_loop+0x5c6>
  403839:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
        else if  (flags & FLAGS_LONG)      *(va_arg(args, long*))      = (long) output->pos;
  403840:	41 f7 c3 00 02 00 00 	test   r11d,0x200
  403847:	0f 85 d3 00 00 00    	jne    403920 <format_string_loop+0x8a0>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  40384d:	41 81 e3 00 04 00 00 	and    r11d,0x400
  403854:	0f 85 c6 00 00 00    	jne    403920 <format_string_loop+0x8a0>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  40385a:	83 f8 2f             	cmp    eax,0x2f
  40385d:	0f 87 a4 02 00 00    	ja     403b07 <format_string_loop+0xa87>
  403863:	89 c6                	mov    esi,eax
  403865:	83 c0 08             	add    eax,0x8
  403868:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  40386c:	89 03                	mov    DWORD PTR [rbx],eax
  40386e:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403871:	89 08                	mov    DWORD PTR [rax],ecx
  403873:	e9 e1 fb ff ff       	jmp    403459 <format_string_loop+0x3d9>
  403878:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40387f:	00 
        if       (flags & FLAGS_CHAR)      *(va_arg(args, char*))      = (char) output->pos;
  403880:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403884:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403888:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  40388c:	e9 be fb ff ff       	jmp    40344f <format_string_loop+0x3cf>
  403891:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403898:	83 f8 2f             	cmp    eax,0x2f
  40389b:	0f 87 78 01 00 00    	ja     403a19 <format_string_loop+0x999>
  4038a1:	89 c7                	mov    edi,eax
  4038a3:	83 c0 08             	add    eax,0x8
  4038a6:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
  4038aa:	89 03                	mov    DWORD PTR [rbx],eax
  4038ac:	48 83 ec 08          	sub    rsp,0x8
  4038b0:	45 89 e1             	mov    r9d,r12d
  4038b3:	45 89 f8             	mov    r8d,r15d
  4038b6:	31 d2                	xor    edx,edx
  4038b8:	56                   	push   rsi
  4038b9:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4038bc:	48 89 ef             	mov    rdi,rbp
  4038bf:	e8 3c e9 ff ff       	call   402200 <print_integer>
  while (*format)
  4038c4:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4038c9:	41 58                	pop    r8
  4038cb:	41 59                	pop    r9
  4038cd:	e9 ac f8 ff ff       	jmp    40317e <format_string_loop+0xfe>
  4038d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  4038d8:	83 f8 2f             	cmp    eax,0x2f
  4038db:	0f 87 27 01 00 00    	ja     403a08 <format_string_loop+0x988>
  4038e1:	89 c2                	mov    edx,eax
  4038e3:	83 c0 08             	add    eax,0x8
  4038e6:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  4038ea:	89 03                	mov    DWORD PTR [rbx],eax
  4038ec:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
            print_integer(output, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
  4038ef:	45 89 e1             	mov    r9d,r12d
  4038f2:	45 89 f8             	mov    r8d,r15d
  4038f5:	48 89 ef             	mov    rdi,rbp
  4038f8:	48 89 d6             	mov    rsi,rdx
  4038fb:	48 f7 de             	neg    rsi
  4038fe:	48 0f 48 f2          	cmovs  rsi,rdx
  403902:	48 83 ec 08          	sub    rsp,0x8
  403906:	48 c1 ea 3f          	shr    rdx,0x3f
  40390a:	41 53                	push   r11
  40390c:	e8 ef e8 ff ff       	call   402200 <print_integer>
  while (*format)
  403911:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403916:	41 5c                	pop    r12
  403918:	41 5e                	pop    r14
  40391a:	e9 5f f8 ff ff       	jmp    40317e <format_string_loop+0xfe>
  40391f:	90                   	nop
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403920:	83 f8 2f             	cmp    eax,0x2f
  403923:	0f 87 7b 01 00 00    	ja     403aa4 <format_string_loop+0xa24>
  403929:	89 c6                	mov    esi,eax
  40392b:	83 c0 08             	add    eax,0x8
  40392e:	48 03 73 10          	add    rsi,QWORD PTR [rbx+0x10]
  403932:	89 03                	mov    DWORD PTR [rbx],eax
  403934:	48 8b 06             	mov    rax,QWORD PTR [rsi]
  403937:	48 89 08             	mov    QWORD PTR [rax],rcx
  40393a:	e9 1a fb ff ff       	jmp    403459 <format_string_loop+0x3d9>
  40393f:	90                   	nop
          while (l++ < width) {
  403940:	41 83 fc 01          	cmp    r12d,0x1
  403944:	76 23                	jbe    403969 <format_string_loop+0x8e9>
  403946:	41 bf 02 00 00 00    	mov    r15d,0x2
  40394c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
            putchar_via_gadget(output, ' ');
  403950:	be 20 00 00 00       	mov    esi,0x20
  403955:	48 89 ef             	mov    rdi,rbp
  403958:	e8 53 e3 ff ff       	call   401cb0 <putchar_via_gadget>
          while (l++ < width) {
  40395d:	44 89 f8             	mov    eax,r15d
  403960:	41 83 c7 01          	add    r15d,0x1
  403964:	41 39 c4             	cmp    r12d,eax
  403967:	75 e7                	jne    403950 <format_string_loop+0x8d0>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403969:	8b 03                	mov    eax,DWORD PTR [rbx]
  40396b:	83 f8 2f             	cmp    eax,0x2f
  40396e:	0f 87 b6 00 00 00    	ja     403a2a <format_string_loop+0x9aa>
  403974:	89 c2                	mov    edx,eax
  403976:	83 c0 08             	add    eax,0x8
  403979:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  40397d:	89 03                	mov    DWORD PTR [rbx],eax
  40397f:	0f be 32             	movsx  esi,BYTE PTR [rdx]
  403982:	48 89 ef             	mov    rdi,rbp
  403985:	e8 26 e3 ff ff       	call   401cb0 <putchar_via_gadget>
        if (flags & FLAGS_LEFT) {
  40398a:	e9 e1 f7 ff ff       	jmp    403170 <format_string_loop+0xf0>
  40398f:	90                   	nop
            while (l++ < width) {
  403990:	89 c1                	mov    ecx,eax
  403992:	8d 40 01             	lea    eax,[rax+0x1]
  403995:	41 39 cc             	cmp    r12d,ecx
  403998:	0f 86 bc 01 00 00    	jbe    403b5a <format_string_loop+0xada>
  40399e:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
  4039a3:	89 4c 24 14          	mov    DWORD PTR [rsp+0x14],ecx
  4039a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4039ae:	00 00 
              putchar_via_gadget(output, ' ');
  4039b0:	be 20 00 00 00       	mov    esi,0x20
  4039b5:	48 89 ef             	mov    rdi,rbp
  4039b8:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4039bc:	e8 ef e2 ff ff       	call   401cb0 <putchar_via_gadget>
            while (l++ < width) {
  4039c1:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4039c5:	89 c2                	mov    edx,eax
  4039c7:	83 c0 01             	add    eax,0x1
  4039ca:	41 39 d4             	cmp    r12d,edx
  4039cd:	75 e1                	jne    4039b0 <format_string_loop+0x930>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision)) {
  4039cf:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
  4039d3:	0f be 30             	movsx  esi,BYTE PTR [rax]
  4039d6:	40 84 f6             	test   sil,sil
  4039d9:	0f 84 91 f7 ff ff    	je     403170 <format_string_loop+0xf0>
  4039df:	45 85 f6             	test   r14d,r14d
  4039e2:	0f 94 44 24 0c       	sete   BYTE PTR [rsp+0xc]
  4039e7:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4039ec:	45 85 ff             	test   r15d,r15d
  4039ef:	0f 85 f9 fa ff ff    	jne    4034ee <format_string_loop+0x46e>
  4039f5:	84 c0                	test   al,al
  4039f7:	0f 85 f1 fa ff ff    	jne    4034ee <format_string_loop+0x46e>
  4039fd:	e9 6e f7 ff ff       	jmp    403170 <format_string_loop+0xf0>
  403a02:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
            const long value = va_arg(args, long);
  403a08:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a0c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a10:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a14:	e9 d3 fe ff ff       	jmp    4038ec <format_string_loop+0x86c>
            print_integer(output, (printf_unsigned_value_t) va_arg(args, unsigned long), false, base, precision, width, flags);
  403a19:	48 8b 7b 08          	mov    rdi,QWORD PTR [rbx+0x8]
  403a1d:	48 8d 47 08          	lea    rax,[rdi+0x8]
  403a21:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a25:	e9 82 fe ff ff       	jmp    4038ac <format_string_loop+0x82c>
        putchar_via_gadget(output, (char) va_arg(args, int) );
  403a2a:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403a2e:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403a32:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a36:	e9 44 ff ff ff       	jmp    40397f <format_string_loop+0x8ff>
  403a3b:	89 c2                	mov    edx,eax
  403a3d:	83 c0 08             	add    eax,0x8
  403a40:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403a44:	89 03                	mov    DWORD PTR [rbx],eax
  403a46:	e9 53 f9 ff ff       	jmp    40339e <format_string_loop+0x31e>
        else if  (flags & FLAGS_SHORT)     *(va_arg(args, short*))     = (short) output->pos;
  403a4b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403a4f:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403a53:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403a57:	e9 f2 fc ff ff       	jmp    40374e <format_string_loop+0x6ce>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403a5c:	41 81 e3 80 00 00 00 	and    r11d,0x80
  403a63:	74 79                	je     403ade <format_string_loop+0xa5e>
  403a65:	83 f8 2f             	cmp    eax,0x2f
  403a68:	0f 87 db 00 00 00    	ja     403b49 <format_string_loop+0xac9>
  403a6e:	89 c2                	mov    edx,eax
  403a70:	83 c0 08             	add    eax,0x8
  403a73:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403a77:	89 03                	mov    DWORD PTR [rbx],eax
  403a79:	44 0f b7 1a          	movzx  r11d,WORD PTR [rdx]
  403a7d:	e9 83 fc ff ff       	jmp    403705 <format_string_loop+0x685>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403a82:	41 f6 c3 80          	test   r11b,0x80
  403a86:	74 2d                	je     403ab5 <format_string_loop+0xa35>
  403a88:	83 f8 2f             	cmp    eax,0x2f
  403a8b:	0f 87 a7 00 00 00    	ja     403b38 <format_string_loop+0xab8>
  403a91:	89 c2                	mov    edx,eax
  403a93:	83 c0 08             	add    eax,0x8
  403a96:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403a9a:	89 03                	mov    DWORD PTR [rbx],eax
  403a9c:	0f bf 02             	movsx  eax,WORD PTR [rdx]
  403a9f:	e9 a4 f7 ff ff       	jmp    403248 <format_string_loop+0x1c8>
        else if  (flags & FLAGS_LONG_LONG) *(va_arg(args, long long*)) = (long long int) output->pos;
  403aa4:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403aa8:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403aac:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403ab0:	e9 7f fe ff ff       	jmp    403934 <format_string_loop+0x8b4>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403ab5:	83 f8 2f             	cmp    eax,0x2f
  403ab8:	76 6c                	jbe    403b26 <format_string_loop+0xaa6>
  403aba:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403abe:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403ac2:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403ac6:	8b 02                	mov    eax,DWORD PTR [rdx]
  403ac8:	e9 7b f7 ff ff       	jmp    403248 <format_string_loop+0x1c8>
              (flags & FLAGS_CHAR) ? (unsigned char)va_arg(args, unsigned int) :
  403acd:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403ad1:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403ad5:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403ad9:	e9 23 fc ff ff       	jmp    403701 <format_string_loop+0x681>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403ade:	83 f8 2f             	cmp    eax,0x2f
  403ae1:	77 35                	ja     403b18 <format_string_loop+0xa98>
  403ae3:	89 c2                	mov    edx,eax
  403ae5:	83 c0 08             	add    eax,0x8
  403ae8:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403aec:	89 03                	mov    DWORD PTR [rbx],eax
  403aee:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
  403af1:	e9 0f fc ff ff       	jmp    403705 <format_string_loop+0x685>
              (flags & FLAGS_CHAR) ? (signed char) va_arg(args, int) :
  403af6:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403afa:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403afe:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403b02:	e9 3e f7 ff ff       	jmp    403245 <format_string_loop+0x1c5>
        else                               *(va_arg(args, int*))       = (int) output->pos;
  403b07:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  403b0b:	48 8d 46 08          	lea    rax,[rsi+0x8]
  403b0f:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403b13:	e9 56 fd ff ff       	jmp    40386e <format_string_loop+0x7ee>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403b18:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403b1c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403b20:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403b24:	eb c8                	jmp    403aee <format_string_loop+0xa6e>
              (flags & FLAGS_SHORT) ? (short int) va_arg(args, int) :
  403b26:	89 c2                	mov    edx,eax
  403b28:	83 c0 08             	add    eax,0x8
  403b2b:	48 03 53 10          	add    rdx,QWORD PTR [rbx+0x10]
  403b2f:	89 03                	mov    DWORD PTR [rbx],eax
  403b31:	8b 02                	mov    eax,DWORD PTR [rdx]
  403b33:	e9 10 f7 ff ff       	jmp    403248 <format_string_loop+0x1c8>
  403b38:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403b3c:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403b40:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403b44:	e9 53 ff ff ff       	jmp    403a9c <format_string_loop+0xa1c>
              (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(args, unsigned int) :
  403b49:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  403b4d:	48 8d 42 08          	lea    rax,[rdx+0x8]
  403b51:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
  403b55:	e9 1f ff ff ff       	jmp    403a79 <format_string_loop+0x9f9>
            while (l++ < width) {
  403b5a:	89 44 24 14          	mov    DWORD PTR [rsp+0x14],eax
  403b5e:	e9 6c fe ff ff       	jmp    4039cf <format_string_loop+0x94f>

Disassembly of section .text.vsnprintf_impl:

0000000000403b70 <vsnprintf_impl>:

// internal vsnprintf - used for implementing _all library functions
static int vsnprintf_impl(output_gadget_t* output, const char* format, va_list args)
{
  403b70:	53                   	push   rbx
  403b71:	48 89 fb             	mov    rbx,rdi
  // Note: The library only calls vsnprintf_impl() with output->pos being 0. However, it is
  // possible to call this function with a non-zero pos value for some "remedial printing".
  format_string_loop(output, format, args);
  403b74:	e8 07 f5 ff ff       	call   403080 <format_string_loop>

  // termination
  append_termination_with_gadget(output);
  403b79:	48 89 df             	mov    rdi,rbx
  403b7c:	e8 6f e1 ff ff       	call   401cf0 <append_termination_with_gadget>

  // return written chars without terminating \0
  return (int)output->pos;
  403b81:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
}
  403b84:	5b                   	pop    rbx
  403b85:	c3                   	ret    

Disassembly of section .text.vprintf:

0000000000403b90 <vprintf>:

///////////////////////////////////////////////////////////////////////////////

int vprintf_(const char* format, va_list arg)
{
  403b90:	f3 0f 1e fa          	endbr64 
  403b94:	55                   	push   rbp
  403b95:	49 89 f3             	mov    r11,rsi
  403b98:	49 89 fa             	mov    r10,rdi
  403b9b:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = extern_putchar_gadget();
  403b9f:	48 89 e5             	mov    rbp,rsp
  403ba2:	48 89 ef             	mov    rdi,rbp
  403ba5:	e8 56 e2 ff ff       	call   401e00 <extern_putchar_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403baa:	48 89 ef             	mov    rdi,rbp
  403bad:	4c 89 da             	mov    rdx,r11
  403bb0:	4c 89 d6             	mov    rsi,r10
  403bb3:	e8 b8 ff ff ff       	call   403b70 <vsnprintf_impl>
}
  403bb8:	48 83 c4 20          	add    rsp,0x20
  403bbc:	5d                   	pop    rbp
  403bbd:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000403bc0 <vsnprintf>:

int vsnprintf_(char* s, size_t n, const char* format, va_list arg)
{
  403bc0:	f3 0f 1e fa          	endbr64 
  403bc4:	55                   	push   rbp
  403bc5:	49 89 d1             	mov    r9,rdx
  403bc8:	49 89 ca             	mov    r10,rcx
  output_gadget_t gadget = buffer_gadget(s, n);
  403bcb:	48 89 f2             	mov    rdx,rsi
  403bce:	48 89 fe             	mov    rsi,rdi
{
  403bd1:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = buffer_gadget(s, n);
  403bd5:	48 89 e5             	mov    rbp,rsp
  403bd8:	48 89 ef             	mov    rdi,rbp
  403bdb:	e8 80 e1 ff ff       	call   401d60 <buffer_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403be0:	48 89 ef             	mov    rdi,rbp
  403be3:	4c 89 d2             	mov    rdx,r10
  403be6:	4c 89 ce             	mov    rsi,r9
  403be9:	e8 82 ff ff ff       	call   403b70 <vsnprintf_impl>
}
  403bee:	48 83 c4 20          	add    rsp,0x20
  403bf2:	5d                   	pop    rbp
  403bf3:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000403c00 <vsprintf>:

int vsprintf_(char* s, const char* format, va_list arg)
{
  403c00:	f3 0f 1e fa          	endbr64 
  403c04:	48 89 d1             	mov    rcx,rdx
  return vsnprintf_(s, PRINTF_MAX_POSSIBLE_BUFFER_SIZE, format, arg);
  403c07:	48 89 f2             	mov    rdx,rsi
  403c0a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  403c0f:	e9 ac ff ff ff       	jmp    403bc0 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000403c20 <vfctprintf>:
}

int vfctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, va_list arg)
{
  403c20:	f3 0f 1e fa          	endbr64 
  403c24:	55                   	push   rbp
  403c25:	49 89 d1             	mov    r9,rdx
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403c28:	48 89 f2             	mov    rdx,rsi
  403c2b:	48 89 fe             	mov    rsi,rdi
{
  403c2e:	48 83 ec 20          	sub    rsp,0x20
  output_gadget_t gadget = function_gadget(out, extra_arg);
  403c32:	48 89 e5             	mov    rbp,rsp
  403c35:	48 89 ef             	mov    rdi,rbp
  403c38:	e8 83 e1 ff ff       	call   401dc0 <function_gadget>
  return vsnprintf_impl(&gadget, format, arg);
  403c3d:	48 89 ef             	mov    rdi,rbp
  403c40:	48 89 ca             	mov    rdx,rcx
  403c43:	4c 89 ce             	mov    rsi,r9
  403c46:	e8 25 ff ff ff       	call   403b70 <vsnprintf_impl>
}
  403c4b:	48 83 c4 20          	add    rsp,0x20
  403c4f:	5d                   	pop    rbp
  403c50:	c3                   	ret    

Disassembly of section .text.printf:

0000000000403c60 <printf>:

int printf_(const char* format, ...)
{
  403c60:	f3 0f 1e fa          	endbr64 
  403c64:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403c6b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403c70:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403c75:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403c7a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403c7f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403c84:	84 c0                	test   al,al
  403c86:	74 37                	je     403cbf <printf+0x5f>
  403c88:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403c8d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403c92:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403c97:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403c9e:	00 
  403c9f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403ca6:	00 
  403ca7:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403cae:	00 
  403caf:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403cb6:	00 
  403cb7:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403cbe:	00 
  va_list args;
  va_start(args, format);
  403cbf:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403cc6:	00 
  const int ret = vprintf_(format, args);
  403cc7:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  va_start(args, format);
  403ccc:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403cd3:	00 
  403cd4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403cd9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403cde:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403ce5:	00 
  403ce6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vprintf_(format, args);
  403ceb:	e8 a0 fe ff ff       	call   403b90 <vprintf>
  va_end(args);
  return ret;
}
  403cf0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403cf7:	c3                   	ret    

Disassembly of section .text.sprintf:

0000000000403d00 <sprintf>:

int sprintf_(char* s, const char* format, ...)
{
  403d00:	f3 0f 1e fa          	endbr64 
  403d04:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403d0b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403d10:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403d15:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403d1a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403d1f:	84 c0                	test   al,al
  403d21:	74 37                	je     403d5a <sprintf+0x5a>
  403d23:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403d28:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403d2d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403d32:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403d39:	00 
  403d3a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403d41:	00 
  403d42:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403d49:	00 
  403d4a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403d51:	00 
  403d52:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403d59:	00 
  va_list args;
  va_start(args, format);
  403d5a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403d61:	00 
  const int ret = vsprintf_(s, format, args);
  403d62:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  va_start(args, format);
  403d67:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  403d6e:	00 
  403d6f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403d74:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403d79:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403d80:	00 
  403d81:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsprintf_(s, format, args);
  403d86:	e8 75 fe ff ff       	call   403c00 <vsprintf>
  va_end(args);
  return ret;
}
  403d8b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403d92:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000403da0 <snprintf>:

int snprintf_(char* s, size_t n, const char* format, ...)
{
  403da0:	f3 0f 1e fa          	endbr64 
  403da4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403dab:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403db0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403db5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403dba:	84 c0                	test   al,al
  403dbc:	74 37                	je     403df5 <snprintf+0x55>
  403dbe:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403dc3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403dc8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403dcd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403dd4:	00 
  403dd5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403ddc:	00 
  403ddd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403de4:	00 
  403de5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403dec:	00 
  403ded:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403df4:	00 
  va_list args;
  va_start(args, format);
  403df5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403dfc:	00 
  const int ret = vsnprintf_(s, n, format, args);
  403dfd:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403e02:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403e09:	00 
  403e0a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403e0f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403e14:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403e1b:	00 
  403e1c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vsnprintf_(s, n, format, args);
  403e21:	e8 9a fd ff ff       	call   403bc0 <vsnprintf>
  va_end(args);
  return ret;
}
  403e26:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403e2d:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000403e30 <fctprintf>:

int fctprintf(void (*out)(char c, void* extra_arg), void* extra_arg, const char* format, ...)
{
  403e30:	f3 0f 1e fa          	endbr64 
  403e34:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  403e3b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403e40:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403e45:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403e4a:	84 c0                	test   al,al
  403e4c:	74 37                	je     403e85 <fctprintf+0x55>
  403e4e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403e53:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403e58:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403e5d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403e64:	00 
  403e65:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403e6c:	00 
  403e6d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403e74:	00 
  403e75:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403e7c:	00 
  403e7d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403e84:	00 
  va_list args;
  va_start(args, format);
  403e85:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403e8c:	00 
  const int ret = vfctprintf(out, extra_arg, format, args);
  403e8d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  va_start(args, format);
  403e92:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403e99:	00 
  403e9a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403e9f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403ea4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403eab:	00 
  403eac:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  const int ret = vfctprintf(out, extra_arg, format, args);
  403eb1:	e8 6a fd ff ff       	call   403c20 <vfctprintf>
  va_end(args);
  return ret;
}
  403eb6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403ebd:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000403ec0 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  403ec0:	f3 0f 1e fa          	endbr64 
  403ec4:	41 54                	push   r12
  403ec6:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  403ec9:	40 0f be ff          	movsx  edi,dil
  403ecd:	e8 0e 00 00 00       	call   403ee0 <putchar_>
	return c;
}
  403ed2:	44 89 e0             	mov    eax,r12d
  403ed5:	41 5c                	pop    r12
  403ed7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000403ee0 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  403ee0:	f3 0f 1e fa          	endbr64 
  403ee4:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  403ee8:	ba 01 00 00 00       	mov    edx,0x1
  403eed:	31 c0                	xor    eax,eax
void putchar_(char c){
  403eef:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  403ef4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403ef9:	bf 01 00 00 00       	mov    edi,0x1
  403efe:	e8 1d d7 ff ff       	call   401620 <write>
  403f03:	48 83 c4 18          	add    rsp,0x18
  403f07:	c3                   	ret    

Disassembly of section .text.max:

0000000000403f10 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  403f10:	48 39 f7             	cmp    rdi,rsi
  403f13:	48 89 f0             	mov    rax,rsi
  403f16:	48 0f 43 c7          	cmovae rax,rdi
}
  403f1a:	c3                   	ret    

Disassembly of section .text.align:

0000000000403f20 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  403f20:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  403f25:	48 f7 de             	neg    rsi
  403f28:	48 21 f0             	and    rax,rsi
}
  403f2b:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000403f30 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403f30:	31 c0                	xor    eax,eax
  403f32:	83 ff 01             	cmp    edi,0x1
  403f35:	76 4e                	jbe    403f85 <granules_to_chunk_kind+0x55>
  403f37:	b8 01 00 00 00       	mov    eax,0x1
  403f3c:	83 ff 02             	cmp    edi,0x2
  403f3f:	74 44                	je     403f85 <granules_to_chunk_kind+0x55>
  403f41:	83 ff 03             	cmp    edi,0x3
  403f44:	74 5a                	je     403fa0 <granules_to_chunk_kind+0x70>
  403f46:	83 ff 04             	cmp    edi,0x4
  403f49:	74 45                	je     403f90 <granules_to_chunk_kind+0x60>
  403f4b:	83 ff 05             	cmp    edi,0x5
  403f4e:	74 60                	je     403fb0 <granules_to_chunk_kind+0x80>
  403f50:	83 ff 06             	cmp    edi,0x6
  403f53:	74 2b                	je     403f80 <granules_to_chunk_kind+0x50>
  403f55:	b8 06 00 00 00       	mov    eax,0x6
  403f5a:	83 ff 08             	cmp    edi,0x8
  403f5d:	76 26                	jbe    403f85 <granules_to_chunk_kind+0x55>
  403f5f:	b8 07 00 00 00       	mov    eax,0x7
  403f64:	83 ff 0a             	cmp    edi,0xa
  403f67:	76 1c                	jbe    403f85 <granules_to_chunk_kind+0x55>
  403f69:	b8 08 00 00 00       	mov    eax,0x8
  403f6e:	83 ff 10             	cmp    edi,0x10
  403f71:	76 12                	jbe    403f85 <granules_to_chunk_kind+0x55>
  403f73:	83 ff 21             	cmp    edi,0x21
  403f76:	19 c0                	sbb    eax,eax
  403f78:	24 0a                	and    al,0xa
  403f7a:	05 ff 00 00 00       	add    eax,0xff
  403f7f:	c3                   	ret    
  403f80:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  403f85:	c3                   	ret    
  403f86:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403f8d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  403f90:	b8 03 00 00 00       	mov    eax,0x3
  403f95:	c3                   	ret    
  403f96:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403f9d:	00 00 00 
  403fa0:	b8 02 00 00 00       	mov    eax,0x2
  403fa5:	c3                   	ret    
  403fa6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  403fad:	00 00 00 
  403fb0:	b8 04 00 00 00       	mov    eax,0x4
  403fb5:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

0000000000403fc0 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  403fc0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403fc5:	83 ff 09             	cmp    edi,0x9
  403fc8:	77 0c                	ja     403fd6 <chunk_kind_to_granules+0x16>
  403fca:	89 ff                	mov    edi,edi
  403fcc:	48 8d 05 4d 19 00 00 	lea    rax,[rip+0x194d]        # 405920 <CSWTCH.34>
  403fd3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  403fd6:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000403fe0 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  403fe0:	48 89 f8             	mov    rax,rdi
  403fe3:	66 31 c0             	xor    ax,ax
}
  403fe6:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000403ff0 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  403ff0:	89 f8                	mov    eax,edi
  403ff2:	0f b6 c4             	movzx  eax,ah
}
  403ff5:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000404000 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  404000:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  404004:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000404010 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  404010:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  404014:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000404020 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  404020:	89 f6                	mov    esi,esi
  404022:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  404025:	48 c1 e6 08          	shl    rsi,0x8
  404029:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  40402d:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000404030 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  404030:	48 8b 0d 51 1c 00 00 	mov    rcx,QWORD PTR [rip+0x1c51]        # 405c88 <large_objects>
  404037:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  40403e:	00 
  40403f:	76 07                	jbe    404048 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  404041:	c3                   	ret    
  404042:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  404048:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  40404b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  404050:	e8 9b ff ff ff       	call   403ff0 <get_chunk_index>
  404055:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  404057:	e8 84 ff ff ff       	call   403fe0 <get_page>
  40405c:	48 89 c7             	mov    rdi,rax
  40405f:	e8 bc ff ff ff       	call   404020 <allocate_chunk>
		large_objects = large_objects->next;
  404064:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  404067:	48 89 15 1a 1c 00 00 	mov    QWORD PTR [rip+0x1c1a],rdx        # 405c88 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  40406e:	48 8b 15 73 1c 00 00 	mov    rdx,QWORD PTR [rip+0x1c73]        # 405ce8 <small_object_freelists+0x48>
  404075:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  404078:	48 89 05 69 1c 00 00 	mov    QWORD PTR [rip+0x1c69],rax        # 405ce8 <small_object_freelists+0x48>
}
  40407f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000404080 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  404080:	48 8d 47 07          	lea    rax,[rdi+0x7]
  404084:	48 c1 e8 03          	shr    rax,0x3
}
  404088:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000404089 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404089:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000404090 <maybe_merge_free_large_object>:
{
  404090:	53                   	push   rbx
	struct large_object* obj = *prev;
  404091:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  404094:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  404097:	48 8d 1d ea 1b 00 00 	lea    rbx,[rip+0x1bea]        # 405c88 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  40409e:	4c 89 df             	mov    rdi,r11
  4040a1:	e8 5a ff ff ff       	call   404000 <get_large_object_payload>
  4040a6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  4040aa:	49 89 c2             	mov    r10,rax
  4040ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4040b0:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  4040b4:	be 00 01 00 00       	mov    esi,0x100
  4040b9:	48 89 d7             	mov    rdi,rdx
  4040bc:	e8 5f fe ff ff       	call   403f20 <align>
  4040c1:	48 39 c2             	cmp    rdx,rax
  4040c4:	0f 85 bf ff ff ff    	jne    404089 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  4040ca:	e8 21 ff ff ff       	call   403ff0 <get_chunk_index>
  4040cf:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  4040d1:	85 c9                	test   ecx,ecx
  4040d3:	74 53                	je     404128 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  4040d5:	e8 06 ff ff ff       	call   403fe0 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  4040da:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  4040de:	75 48                	jne    404128 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  4040e0:	48 8b 05 a1 1b 00 00 	mov    rax,QWORD PTR [rip+0x1ba1]        # 405c88 <large_objects>
			ASSERT(walk);
  4040e7:	48 85 c0             	test   rax,rax
  4040ea:	0f 84 99 ff ff ff    	je     404089 <maybe_merge_free_large_object.cold>
			if(walk == next)
  4040f0:	48 39 c2             	cmp    rdx,rax
  4040f3:	74 3b                	je     404130 <maybe_merge_free_large_object+0xa0>
  4040f5:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  4040f8:	48 89 c1             	mov    rcx,rax
  4040fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  4040fe:	48 85 c0             	test   rax,rax
  404101:	74 32                	je     404135 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  404103:	48 39 c2             	cmp    rdx,rax
  404106:	75 f0                	jne    4040f8 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  404108:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  40410c:	4c 39 c8             	cmp    rax,r9
  40410f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  404113:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  404118:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  40411b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  40411f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  404122:	eb 8c                	jmp    4040b0 <maybe_merge_free_large_object+0x20>
  404124:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  404128:	4c 89 c8             	mov    rax,r9
  40412b:	5b                   	pop    rbx
  40412c:	c3                   	ret    
  40412d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  404130:	48 89 d9             	mov    rcx,rbx
  404133:	eb d3                	jmp    404108 <maybe_merge_free_large_object+0x78>
  404135:	e9 4f ff ff ff       	jmp    404089 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000404140 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  404140:	8b 05 36 1b 00 00    	mov    eax,DWORD PTR [rip+0x1b36]        # 405c7c <pending_large_object_compact>
  404146:	85 c0                	test   eax,eax
  404148:	74 2c                	je     404176 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  40414a:	48 83 3d 36 1b 00 00 	cmp    QWORD PTR [rip+0x1b36],0x0        # 405c88 <large_objects>
  404151:	00 
		pending_large_object_compact = 0;
  404152:	c7 05 20 1b 00 00 00 	mov    DWORD PTR [rip+0x1b20],0x0        # 405c7c <pending_large_object_compact>
  404159:	00 00 00 
		while(*prev)
  40415c:	74 18                	je     404176 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  40415e:	48 8d 3d 23 1b 00 00 	lea    rdi,[rip+0x1b23]        # 405c88 <large_objects>
  404165:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  404168:	e8 23 ff ff ff       	call   404090 <maybe_merge_free_large_object>
  40416d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  404170:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  404174:	75 f2                	jne    404168 <maybe_compact_free_large_objects+0x28>
}
  404176:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000404177 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  404177:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000404180 <get_small_object_freelist>:
  404180:	83 ff 09             	cmp    edi,0x9
  404183:	0f 87 ee ff ff ff    	ja     404177 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  404189:	89 ff                	mov    edi,edi
  40418b:	48 8d 05 0e 1b 00 00 	lea    rax,[rip+0x1b0e]        # 405ca0 <small_object_freelists>
  404192:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  404196:	c3                   	ret    

Disassembly of section .text.free:

00000000004041a0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  4041a0:	f3 0f 1e fa          	endbr64 
  4041a4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  4041a7:	48 85 ff             	test   rdi,rdi
  4041aa:	74 2a                	je     4041d6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  4041ac:	e8 2f fe ff ff       	call   403fe0 <get_page>
  4041b1:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  4041b4:	e8 37 fe ff ff       	call   403ff0 <get_chunk_index>
  4041b9:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  4041bb:	89 c0                	mov    eax,eax
  4041bd:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  4041c2:	40 80 ff ff          	cmp    dil,0xff
  4041c6:	74 18                	je     4041e0 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  4041c8:	e8 b3 ff ff ff       	call   404180 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  4041cd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  4041d0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  4041d3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  4041d6:	c3                   	ret    
  4041d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4041de:	00 00 
		struct large_object* obj = get_large_object(ptr);
  4041e0:	4c 89 c7             	mov    rdi,r8
  4041e3:	e8 28 fe ff ff       	call   404010 <get_large_object>
		obj->next = large_objects;
  4041e8:	48 8b 15 99 1a 00 00 	mov    rdx,QWORD PTR [rip+0x1a99]        # 405c88 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  4041ef:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  4041f2:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  4041f5:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  4041fa:	48 89 05 87 1a 00 00 	mov    QWORD PTR [rip+0x1a87],rax        # 405c88 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  404201:	e8 1a fe ff ff       	call   404020 <allocate_chunk>
		pending_large_object_compact = 1;
  404206:	c7 05 6c 1a 00 00 01 	mov    DWORD PTR [rip+0x1a6c],0x1        # 405c7c <pending_large_object_compact>
  40420d:	00 00 00 
  404210:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000404220 <heap_size_in_pages>:
int heap_size_in_pages()
{
  404220:	f3 0f 1e fa          	endbr64 
  404224:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  404228:	31 ff                	xor    edi,edi
  40422a:	e8 41 d5 ff ff       	call   401770 <sbrk>
  40422f:	48 c7 c2 f0 5c 40 00 	mov    rdx,0x405cf0
  404236:	2b 02                	sub    eax,DWORD PTR [rdx]
  404238:	48 83 c4 08          	add    rsp,0x8
  40423c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

000000000040423d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  40423d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000404240 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  404240:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404242:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  404244:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  404246:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  40424d:	55                   	push   rbp
  40424e:	48 89 f5             	mov    rbp,rsi
  404251:	53                   	push   rbx
  404252:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404256:	e8 c5 ff ff ff       	call   404220 <heap_size_in_pages>
	if(!walloc_heap_size)
  40425b:	48 8b 3d 1e 1a 00 00 	mov    rdi,QWORD PTR [rip+0x1a1e]        # 405c80 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  404262:	c1 e0 10             	shl    eax,0x10
  404265:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  404268:	48 85 ff             	test   rdi,rdi
  40426b:	75 63                	jne    4042d0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  40426d:	48 c7 c7 f0 5c 40 00 	mov    rdi,0x405cf0
  404274:	be 00 00 01 00       	mov    esi,0x10000
  404279:	e8 a2 fc ff ff       	call   403f20 <align>
		walloc_heap_size = preallocated;
  40427e:	48 89 1d fb 19 00 00 	mov    QWORD PTR [rip+0x19fb],rbx        # 405c80 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  404285:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  404288:	49 39 dc             	cmp    r12,rbx
  40428b:	0f 87 94 00 00 00    	ja     404325 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  404291:	48 85 db             	test   rbx,rbx
  404294:	0f 84 a3 ff ff ff    	je     40423d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  40429a:	be 00 00 01 00       	mov    esi,0x10000
  40429f:	48 89 df             	mov    rdi,rbx
  4042a2:	e8 79 fc ff ff       	call   403f20 <align>
  4042a7:	48 39 c3             	cmp    rbx,rax
  4042aa:	0f 85 8d ff ff ff    	jne    40423d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  4042b0:	48 c1 eb 10          	shr    rbx,0x10
  4042b4:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  4042b8:	48 83 c4 08          	add    rsp,0x8
  4042bc:	4c 89 c0             	mov    rax,r8
  4042bf:	5b                   	pop    rbx
  4042c0:	5d                   	pop    rbp
  4042c1:	41 5c                	pop    r12
  4042c3:	41 5d                	pop    r13
  4042c5:	c3                   	ret    
  4042c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4042cd:	00 00 00 
	if(preallocated < needed)
  4042d0:	4d 85 e4             	test   r12,r12
  4042d3:	74 5e                	je     404333 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  4042d5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  4042d8:	4c 89 e6             	mov    rsi,r12
  4042db:	48 d1 ef             	shr    rdi,1
  4042de:	e8 2d fc ff ff       	call   403f10 <max>
  4042e3:	be 00 00 01 00       	mov    esi,0x10000
  4042e8:	48 89 c7             	mov    rdi,rax
  4042eb:	e8 30 fc ff ff       	call   403f20 <align>
  4042f0:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  4042f3:	48 85 c0             	test   rax,rax
  4042f6:	0f 84 41 ff ff ff    	je     40423d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  4042fc:	48 89 c7             	mov    rdi,rax
  4042ff:	e8 6c d4 ff ff       	call   401770 <sbrk>
  404304:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  404308:	74 16                	je     404320 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  40430a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  40430d:	4c 01 25 6c 19 00 00 	add    QWORD PTR [rip+0x196c],r12        # 405c80 <walloc_heap_size>
	size_t size = grow + preallocated;
  404314:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  404318:	e9 74 ff ff ff       	jmp    404291 <allocate_pages.constprop.0+0x51>
  40431d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  404320:	45 31 c0             	xor    r8d,r8d
  404323:	eb 93                	jmp    4042b8 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  404325:	49 29 dc             	sub    r12,rbx
  404328:	48 89 df             	mov    rdi,rbx
  40432b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  40432e:	48 89 c3             	mov    rbx,rax
  404331:	eb a5                	jmp    4042d8 <allocate_pages.constprop.0+0x98>
  404333:	e9 05 ff ff ff       	jmp    40423d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000404338 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  404338:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000404340 <allocate_large_object>:
{
  404340:	41 54                	push   r12
  404342:	55                   	push   rbp
  404343:	53                   	push   rbx
  404344:	48 89 fb             	mov    rbx,rdi
  404347:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  40434b:	e8 f0 fd ff ff       	call   404140 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404350:	48 8b 15 31 19 00 00 	mov    rdx,QWORD PTR [rip+0x1931]        # 405c88 <large_objects>
  404357:	48 85 d2             	test   rdx,rdx
  40435a:	0f 84 da 01 00 00    	je     40453a <allocate_large_object+0x1fa>
  404360:	4c 8d 0d 21 19 00 00 	lea    r9,[rip+0x1921]        # 405c88 <large_objects>
	size_t best_size = -1;
  404367:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  40436e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  404372:	45 31 d2             	xor    r10d,r10d
  404375:	4c 89 cd             	mov    rbp,r9
  404378:	eb 11                	jmp    40438b <allocate_large_object+0x4b>
  40437a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  404380:	49 89 d1             	mov    r9,rdx
  404383:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  404386:	48 85 d2             	test   rdx,rdx
  404389:	74 39                	je     4043c4 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  40438b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  40438f:	4c 39 c1             	cmp    rcx,r8
  404392:	73 ec                	jae    404380 <allocate_large_object+0x40>
  404394:	48 39 d9             	cmp    rcx,rbx
  404397:	72 e7                	jb     404380 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  404399:	be 00 01 00 00       	mov    esi,0x100
  40439e:	e8 7d fb ff ff       	call   403f20 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  4043a3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  4043a7:	48 39 c6             	cmp    rsi,rax
  4043aa:	0f 84 88 02 00 00    	je     404638 <allocate_large_object+0x2f8>
  4043b0:	4c 89 cd             	mov    rbp,r9
  4043b3:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  4043b6:	49 89 d1             	mov    r9,rdx
  4043b9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  4043bc:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  4043bf:	48 85 d2             	test   rdx,rdx
  4043c2:	75 c7                	jne    40438b <allocate_large_object+0x4b>
	if(!best)
  4043c4:	4d 85 d2             	test   r10,r10
  4043c7:	0f 84 7b 01 00 00    	je     404548 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4043cd:	4c 89 d7             	mov    rdi,r10
  4043d0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4043d5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4043d8:	e8 13 fc ff ff       	call   403ff0 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  4043dd:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  4043e0:	89 c6                	mov    esi,eax
  4043e2:	e8 f9 fb ff ff       	call   403fe0 <get_page>
  4043e7:	48 89 c7             	mov    rdi,rax
  4043ea:	49 89 c1             	mov    r9,rax
  4043ed:	e8 2e fc ff ff       	call   404020 <allocate_chunk>
	struct large_object* next = best->next;
  4043f2:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  4043f5:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  4043f9:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  404400:	75 36                	jne    404438 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  404402:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  404406:	4c 89 d7             	mov    rdi,r10
  404409:	be 00 01 00 00       	mov    esi,0x100
  40440e:	e8 ed fb ff ff       	call   404000 <get_large_object_payload>
  404413:	48 01 c2             	add    rdx,rax
  404416:	48 89 d7             	mov    rdi,rdx
  404419:	e8 02 fb ff ff       	call   403f20 <align>
  40441e:	48 39 c2             	cmp    rdx,rax
  404421:	0f 85 11 ff ff ff    	jne    404338 <allocate_large_object.cold>
}
  404427:	48 83 c4 10          	add    rsp,0x10
  40442b:	4c 89 d0             	mov    rax,r10
  40442e:	5b                   	pop    rbx
  40442f:	5d                   	pop    rbp
  404430:	41 5c                	pop    r12
  404432:	c3                   	ret    
  404433:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  404438:	4c 89 d7             	mov    rdi,r10
  40443b:	e8 c0 fb ff ff       	call   404000 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  404440:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  404443:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  404447:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  40444a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  40444d:	4c 01 df             	add    rdi,r11
  404450:	e8 8b fb ff ff       	call   403fe0 <get_page>
  404455:	49 39 c1             	cmp    r9,rax
  404458:	0f 84 e8 01 00 00    	je     404646 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  40445e:	be 00 00 01 00       	mov    esi,0x10000
  404463:	4c 89 df             	mov    rdi,r11
  404466:	e8 b5 fa ff ff       	call   403f20 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  40446b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  404472:	0f 86 38 01 00 00    	jbe    4045b0 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  404478:	4c 39 d8             	cmp    rax,r11
  40447b:	0f 85 b7 fe ff ff    	jne    404338 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  404481:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404484:	be 00 00 01 00       	mov    esi,0x10000
  404489:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  404490:	ff 
			tail_size = best_size - size;
  404491:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  404498:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  404499:	e8 82 fa ff ff       	call   403f20 <align>
		best->size -= tail_size;
  40449e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  4044a2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  4044a5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4044a8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  4044ab:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  4044af:	48 29 cf             	sub    rdi,rcx
  4044b2:	e8 39 fb ff ff       	call   403ff0 <get_chunk_index>
  4044b7:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  4044b9:	48 85 c9             	test   rcx,rcx
  4044bc:	0f 84 44 ff ff ff    	je     404406 <allocate_large_object+0xc6>
  4044c2:	85 c0                	test   eax,eax
  4044c4:	75 0c                	jne    4044d2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  4044c6:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  4044cd:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  4044d2:	48 85 c9             	test   rcx,rcx
  4044d5:	0f 84 2b ff ff ff    	je     404406 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  4044db:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4044de:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  4044e3:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  4044e6:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  4044ea:	e8 f1 fa ff ff       	call   403fe0 <get_page>
  4044ef:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4044f2:	e8 29 fb ff ff       	call   404020 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  4044f7:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  4044fc:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  4044ff:	48 8b 05 82 17 00 00 	mov    rax,QWORD PTR [rip+0x1782]        # 405c88 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  404506:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  40450a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  40450d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  404510:	e8 eb fa ff ff       	call   404000 <get_large_object_payload>
  404515:	48 01 c1             	add    rcx,rax
  404518:	48 89 cf             	mov    rdi,rcx
  40451b:	e8 00 fa ff ff       	call   403f20 <align>
  404520:	48 39 c1             	cmp    rcx,rax
  404523:	0f 85 0f fe ff ff    	jne    404338 <allocate_large_object.cold>
			large_objects = tail;
  404529:	48 89 15 58 17 00 00 	mov    QWORD PTR [rip+0x1758],rdx        # 405c88 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  404530:	e8 fb fa ff ff       	call   404030 <maybe_repurpose_single_chunk_large_objects_head>
  404535:	e9 c8 fe ff ff       	jmp    404402 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  40453a:	48 8d 2d 47 17 00 00 	lea    rbp,[rip+0x1747]        # 405c88 <large_objects>
  404541:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  404548:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40454c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  404551:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  404558:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  40455a:	4c 89 e7             	mov    rdi,r12
  40455d:	e8 de fc ff ff       	call   404240 <allocate_pages.constprop.0>
  404562:	48 89 c1             	mov    rcx,rax
		if(!page)
  404565:	48 85 c0             	test   rax,rax
  404568:	0f 84 10 01 00 00    	je     40467e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  40456e:	ba ff 00 00 00       	mov    edx,0xff
  404573:	be 01 00 00 00       	mov    esi,0x1
  404578:	48 89 c7             	mov    rdi,rax
  40457b:	e8 a0 fa ff ff       	call   404020 <allocate_chunk>
  404580:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  404583:	48 8b 05 fe 16 00 00 	mov    rax,QWORD PTR [rip+0x16fe]        # 405c88 <large_objects>
		size_t page_header = ptr - ((char*)page);
  40458a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  40458d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  404590:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  404595:	48 c1 e0 10          	shl    rax,0x10
  404599:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  40459e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  4045a2:	4d 39 c4             	cmp    r12,r8
  4045a5:	0f 86 22 fe ff ff    	jbe    4043cd <allocate_large_object+0x8d>
  4045ab:	e9 88 fd ff ff       	jmp    404338 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  4045b0:	4c 39 d8             	cmp    rax,r11
  4045b3:	0f 85 7f fd ff ff    	jne    404338 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4045b9:	48 89 ef             	mov    rdi,rbp
  4045bc:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4045c1:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  4045c5:	e8 26 fa ff ff       	call   403ff0 <get_chunk_index>
  4045ca:	4c 89 cf             	mov    rdi,r9
  4045cd:	89 c6                	mov    esi,eax
  4045cf:	e8 4c fa ff ff       	call   404020 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  4045d4:	b8 00 00 01 00       	mov    eax,0x10000
  4045d9:	4c 29 e0             	sub    rax,r12
  4045dc:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  4045e0:	48 8b 05 a1 16 00 00 	mov    rax,QWORD PTR [rip+0x16a1]        # 405c88 <large_objects>
  4045e7:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  4045ea:	4c 89 15 97 16 00 00 	mov    QWORD PTR [rip+0x1697],r10        # 405c88 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  4045f1:	e8 3a fa ff ff       	call   404030 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  4045f6:	ba ff 00 00 00       	mov    edx,0xff
  4045fb:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  404600:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404607:	e8 14 fa ff ff       	call   404020 <allocate_chunk>
			best->size = best_size =
  40460c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  404613:	ff 
  404614:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  404618:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40461b:	48 39 d3             	cmp    rbx,rdx
  40461e:	0f 87 14 fd ff ff    	ja     404338 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  404624:	48 89 d1             	mov    rcx,rdx
  404627:	48 29 d9             	sub    rcx,rbx
  40462a:	30 c9                	xor    cl,cl
  40462c:	e9 74 fe ff ff       	jmp    4044a5 <allocate_large_object+0x165>
  404631:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  404638:	4c 89 cd             	mov    rbp,r9
  40463b:	49 89 c8             	mov    r8,rcx
  40463e:	49 89 d2             	mov    r10,rdx
  404641:	e9 87 fd ff ff       	jmp    4043cd <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  404646:	be 00 01 00 00       	mov    esi,0x100
  40464b:	4c 89 df             	mov    rdi,r11
  40464e:	e8 cd f8 ff ff       	call   403f20 <align>
  404653:	49 39 c3             	cmp    r11,rax
  404656:	0f 85 dc fc ff ff    	jne    404338 <allocate_large_object.cold>
		best->size -= tail_size;
  40465c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  404660:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  404663:	48 29 ca             	sub    rdx,rcx
  404666:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40466a:	e8 81 f9 ff ff       	call   403ff0 <get_chunk_index>
  40466f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  404671:	85 c0                	test   eax,eax
  404673:	0f 84 4d fe ff ff    	je     4044c6 <allocate_large_object+0x186>
  404679:	e9 5d fe ff ff       	jmp    4044db <allocate_large_object+0x19b>
			return NULL;
  40467e:	45 31 d2             	xor    r10d,r10d
  404681:	e9 a1 fd ff ff       	jmp    404427 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

0000000000404690 <allocate_large>:
{
  404690:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  404694:	e8 a7 fc ff ff       	call   404340 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  404699:	48 85 c0             	test   rax,rax
  40469c:	74 12                	je     4046b0 <allocate_large+0x20>
  40469e:	48 89 c7             	mov    rdi,rax
}
  4046a1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  4046a5:	e9 56 f9 ff ff       	jmp    404000 <get_large_object_payload>
  4046aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  4046b0:	31 c0                	xor    eax,eax
  4046b2:	48 83 c4 08          	add    rsp,0x8
  4046b6:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

00000000004046c0 <obtain_small_objects>:
{
  4046c0:	55                   	push   rbp
  4046c1:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  4046c3:	48 8b 3d 1e 16 00 00 	mov    rdi,QWORD PTR [rip+0x161e]        # 405ce8 <small_object_freelists+0x48>
  4046ca:	48 85 ff             	test   rdi,rdi
  4046cd:	74 71                	je     404740 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  4046cf:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4046d2:	48 89 05 0f 16 00 00 	mov    QWORD PTR [rip+0x160f],rax        # 405ce8 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4046d9:	e8 12 f9 ff ff       	call   403ff0 <get_chunk_index>
  4046de:	89 ea                	mov    edx,ebp
  4046e0:	89 c6                	mov    esi,eax
  4046e2:	e8 f9 f8 ff ff       	call   403fe0 <get_page>
  4046e7:	48 89 c7             	mov    rdi,rax
  4046ea:	e8 31 f9 ff ff       	call   404020 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4046ef:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4046f1:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  4046f4:	e8 c7 f8 ff ff       	call   403fc0 <chunk_kind_to_granules>
  4046f9:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404700:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  404707:	77 46                	ja     40474f <obtain_small_objects+0x8f>
  404709:	48 89 d0             	mov    rax,rdx
  40470c:	48 89 f1             	mov    rcx,rsi
  40470f:	48 29 f0             	sub    rax,rsi
  404712:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  404719:	31 c0                	xor    eax,eax
  40471b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  404720:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  404723:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  404726:	48 89 d0             	mov    rax,rdx
		head->next = next;
  404729:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  40472c:	48 29 f2             	sub    rdx,rsi
  40472f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  404736:	76 e8                	jbe    404720 <obtain_small_objects+0x60>
}
  404738:	5d                   	pop    rbp
  404739:	c3                   	ret    
  40473a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  404740:	31 ff                	xor    edi,edi
  404742:	e8 f9 fb ff ff       	call   404340 <allocate_large_object>
  404747:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40474a:	48 85 c0             	test   rax,rax
  40474d:	75 8a                	jne    4046d9 <obtain_small_objects+0x19>
			return NULL;
  40474f:	31 c0                	xor    eax,eax
}
  404751:	5d                   	pop    rbp
  404752:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000404760 <allocate_small>:
{
  404760:	53                   	push   rbx
  404761:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  404764:	e8 17 fa ff ff       	call   404180 <get_small_object_freelist>
  404769:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40476c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40476f:	48 85 c0             	test   rax,rax
  404772:	74 0c                	je     404780 <allocate_small+0x20>
	*loc = ret->next;
  404774:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  404777:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40477a:	5b                   	pop    rbx
  40477b:	c3                   	ret    
  40477c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  404780:	44 89 c7             	mov    edi,r8d
  404783:	e8 38 ff ff ff       	call   4046c0 <obtain_small_objects>
		if(!freelist)
  404788:	48 85 c0             	test   rax,rax
  40478b:	74 ed                	je     40477a <allocate_small+0x1a>
		*loc = freelist;
  40478d:	48 89 03             	mov    QWORD PTR [rbx],rax
  404790:	eb e2                	jmp    404774 <allocate_small+0x14>

Disassembly of section .text.malloc:

00000000004047a0 <malloc>:
{
  4047a0:	f3 0f 1e fa          	endbr64 
  4047a4:	48 83 ec 08          	sub    rsp,0x8
  4047a8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  4047ab:	e8 d0 f8 ff ff       	call   404080 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  4047b0:	89 c7                	mov    edi,eax
  4047b2:	e8 79 f7 ff ff       	call   403f30 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4047b7:	3d ff 00 00 00       	cmp    eax,0xff
  4047bc:	74 12                	je     4047d0 <malloc+0x30>
  4047be:	89 c7                	mov    edi,eax
}
  4047c0:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4047c4:	e9 97 ff ff ff       	jmp    404760 <allocate_small>
  4047c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4047d0:	4c 89 c7             	mov    rdi,r8
}
  4047d3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4047d7:	e9 b4 fe ff ff       	jmp    404690 <allocate_large>

Disassembly of section .text.memcpy:

00000000004047e0 <memcpy>:
 * Copy a block of memory, handling overlap.
 * This is the routine that actually implements
 * (the portable versions of) bcopy, memcpy, and memmove.
 */
void* memcpy(void* dst0, const void* src0, size_t length)
{
  4047e0:	f3 0f 1e fa          	endbr64 
  4047e4:	49 89 f8             	mov    r8,rdi
	char* dst = dst0;
	const char* src = src0;
	size_t t;

	if(length == 0 || dst == src)
  4047e7:	48 85 d2             	test   rdx,rdx
  4047ea:	74 6c                	je     404858 <memcpy+0x78>
  4047ec:	48 89 f0             	mov    rax,rsi
  4047ef:	48 39 f7             	cmp    rdi,rsi
  4047f2:	74 64                	je     404858 <memcpy+0x78>
  4047f4:	48 89 d1             	mov    rcx,rdx
// clang-format off
#define	TLOOP(s) if (t) TLOOP1(s)
#define	TLOOP1(s) do { s; } while (--t)
	// clang-format on

	if((uintptr_t)dst < (uintptr_t)src)
  4047f7:	73 67                	jae    404860 <memcpy+0x80>
	{
		/*
		 * Copy forward.
		 */
		t = (uintptr_t)src; /* only need low bits */
		if((t | (uintptr_t)dst) & wmask)
  4047f9:	48 89 fa             	mov    rdx,rdi
  4047fc:	48 09 f2             	or     rdx,rsi
  4047ff:	83 e2 03             	and    edx,0x3
  404802:	0f 85 e8 00 00 00    	jne    4048f0 <memcpy+0x110>

			length -= t;
			TLOOP1(*--dst = *--src);
		}

		t = length / wsize;
  404808:	48 89 cf             	mov    rdi,rcx
		// Silence warning for alignment change by casting to void*
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
		t = length & wmask;
  40480b:	49 89 c9             	mov    r9,rcx
  40480e:	4c 89 c6             	mov    rsi,r8
  404811:	49 89 ca             	mov    r10,rcx
		t = length / wsize;
  404814:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404818:	41 83 e1 03          	and    r9d,0x3
		TLOOP(*(word*)(void*)dst = *(const word*)(const void*)src; src += wsize; dst += wsize);
  40481c:	49 83 fa 03          	cmp    r10,0x3
  404820:	76 1f                	jbe    404841 <memcpy+0x61>
  404822:	31 d2                	xor    edx,edx
  404824:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  404828:	8b 0c 90             	mov    ecx,DWORD PTR [rax+rdx*4]
  40482b:	89 0c 96             	mov    DWORD PTR [rsi+rdx*4],ecx
  40482e:	48 83 c2 01          	add    rdx,0x1
  404832:	48 39 d7             	cmp    rdi,rdx
  404835:	75 f1                	jne    404828 <memcpy+0x48>
  404837:	48 c1 e7 02          	shl    rdi,0x2
  40483b:	48 01 f8             	add    rax,rdi
  40483e:	48 01 fe             	add    rsi,rdi
		TLOOP(*dst++ = *src++);
  404841:	4d 85 c9             	test   r9,r9
  404844:	74 12                	je     404858 <memcpy+0x78>
  404846:	31 d2                	xor    edx,edx
  404848:	0f b6 0c 10          	movzx  ecx,BYTE PTR [rax+rdx*1]
  40484c:	88 0c 16             	mov    BYTE PTR [rsi+rdx*1],cl
  40484f:	48 83 c2 01          	add    rdx,0x1
  404853:	49 39 d1             	cmp    r9,rdx
  404856:	75 f0                	jne    404848 <memcpy+0x68>
		TLOOP(*--dst = *--src);
	}
done:
	return (dst0);
}
  404858:	4c 89 c0             	mov    rax,r8
  40485b:	c3                   	ret    
  40485c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		dst += length;
  404860:	4c 8d 0c 17          	lea    r9,[rdi+rdx*1]
		src += length;
  404864:	48 01 d0             	add    rax,rdx
{
  404867:	55                   	push   rbp
		if((t | (uintptr_t)dst) & wmask)
  404868:	4c 89 ca             	mov    rdx,r9
{
  40486b:	53                   	push   rbx
		if((t | (uintptr_t)dst) & wmask)
  40486c:	48 09 c2             	or     rdx,rax
  40486f:	83 e2 03             	and    edx,0x3
  404872:	0f 84 b8 00 00 00    	je     404930 <memcpy+0x150>
			if((t ^ (uintptr_t)dst) & wmask || length <= wsize)
  404878:	4c 89 ca             	mov    rdx,r9
  40487b:	48 31 c2             	xor    rdx,rax
  40487e:	83 e2 03             	and    edx,0x3
  404881:	75 0a                	jne    40488d <memcpy+0xad>
  404883:	48 83 f9 04          	cmp    rcx,0x4
  404887:	0f 87 13 01 00 00    	ja     4049a0 <memcpy+0x1c0>
  40488d:	31 db                	xor    ebx,ebx
  40488f:	31 d2                	xor    edx,edx
  404891:	31 ed                	xor    ebp,ebp
			length -= t;
  404893:	48 89 ce             	mov    rsi,rcx
  404896:	48 f7 de             	neg    rsi
  404899:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
			TLOOP1(*--dst = *--src);
  4048a0:	4c 8d 1c 30          	lea    r11,[rax+rsi*1]
  4048a4:	4d 8d 14 31          	lea    r10,[r9+rsi*1]
  4048a8:	41 0f b6 7c 0b ff    	movzx  edi,BYTE PTR [r11+rcx*1-0x1]
  4048ae:	41 88 7c 0a ff       	mov    BYTE PTR [r10+rcx*1-0x1],dil
  4048b3:	48 83 e9 01          	sub    rcx,0x1
  4048b7:	75 e7                	jne    4048a0 <memcpy+0xc0>
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  4048b9:	48 83 fd 03          	cmp    rbp,0x3
  4048bd:	0f 87 8d 00 00 00    	ja     404950 <memcpy+0x170>
		TLOOP(*--dst = *--src);
  4048c3:	48 85 db             	test   rbx,rbx
  4048c6:	74 1c                	je     4048e4 <memcpy+0x104>
  4048c8:	48 f7 d3             	not    rbx
  4048cb:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  4048d2:	41 0f b6 14 03       	movzx  edx,BYTE PTR [r11+rax*1]
  4048d7:	41 88 14 02          	mov    BYTE PTR [r10+rax*1],dl
  4048db:	48 83 e8 01          	sub    rax,0x1
  4048df:	48 39 d8             	cmp    rax,rbx
  4048e2:	75 ee                	jne    4048d2 <memcpy+0xf2>
}
  4048e4:	4c 89 c0             	mov    rax,r8
  4048e7:	5b                   	pop    rbx
  4048e8:	5d                   	pop    rbp
  4048e9:	c3                   	ret    
  4048ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
			if((t ^ (uintptr_t)dst) & wmask || length < wsize)
  4048f0:	48 89 fa             	mov    rdx,rdi
  4048f3:	48 31 f2             	xor    rdx,rsi
  4048f6:	83 e2 03             	and    edx,0x3
  4048f9:	75 06                	jne    404901 <memcpy+0x121>
  4048fb:	48 83 f9 03          	cmp    rcx,0x3
  4048ff:	77 77                	ja     404978 <memcpy+0x198>
  404901:	45 31 c9             	xor    r9d,r9d
  404904:	31 ff                	xor    edi,edi
  404906:	45 31 d2             	xor    r10d,r10d
				t = wsize - (t & wmask);
  404909:	31 d2                	xor    edx,edx
  40490b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
			TLOOP1(*dst++ = *src++);
  404910:	0f b6 34 10          	movzx  esi,BYTE PTR [rax+rdx*1]
  404914:	41 88 34 10          	mov    BYTE PTR [r8+rdx*1],sil
  404918:	48 83 c2 01          	add    rdx,0x1
  40491c:	48 39 d1             	cmp    rcx,rdx
  40491f:	75 ef                	jne    404910 <memcpy+0x130>
  404921:	48 01 c8             	add    rax,rcx
  404924:	49 8d 34 08          	lea    rsi,[r8+rcx*1]
  404928:	e9 ef fe ff ff       	jmp    40481c <memcpy+0x3c>
  40492d:	0f 1f 00             	nop    DWORD PTR [rax]
		t = length / wsize;
  404930:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  404933:	48 89 cb             	mov    rbx,rcx
  404936:	48 89 cd             	mov    rbp,rcx
		src += length;
  404939:	49 89 c3             	mov    r11,rax
		t = length / wsize;
  40493c:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  404940:	83 e3 03             	and    ebx,0x3
		dst += length;
  404943:	4d 89 ca             	mov    r10,r9
		TLOOP(src -= wsize; dst -= wsize; *(word*)(void*)dst = *(const word*)(const void*)src);
  404946:	48 83 fd 03          	cmp    rbp,0x3
  40494a:	0f 86 73 ff ff ff    	jbe    4048c3 <memcpy+0xe3>
  404950:	48 89 d0             	mov    rax,rdx
  404953:	48 f7 d8             	neg    rax
  404956:	48 c1 e0 02          	shl    rax,0x2
  40495a:	49 01 c3             	add    r11,rax
  40495d:	49 01 c2             	add    r10,rax
  404960:	41 8b 44 93 fc       	mov    eax,DWORD PTR [r11+rdx*4-0x4]
  404965:	41 89 44 92 fc       	mov    DWORD PTR [r10+rdx*4-0x4],eax
  40496a:	48 83 ea 01          	sub    rdx,0x1
  40496e:	75 f0                	jne    404960 <memcpy+0x180>
  404970:	e9 4e ff ff ff       	jmp    4048c3 <memcpy+0xe3>
  404975:	0f 1f 00             	nop    DWORD PTR [rax]
				t = wsize - (t & wmask);
  404978:	48 89 f2             	mov    rdx,rsi
  40497b:	83 e2 03             	and    edx,0x3
			length -= t;
  40497e:	4c 8d 54 0a fc       	lea    r10,[rdx+rcx*1-0x4]
				t = wsize - (t & wmask);
  404983:	b9 04 00 00 00       	mov    ecx,0x4
		t = length / wsize;
  404988:	4c 89 d7             	mov    rdi,r10
		t = length & wmask;
  40498b:	4d 89 d1             	mov    r9,r10
				t = wsize - (t & wmask);
  40498e:	48 29 d1             	sub    rcx,rdx
		t = length / wsize;
  404991:	48 c1 ef 02          	shr    rdi,0x2
		t = length & wmask;
  404995:	41 83 e1 03          	and    r9d,0x3
  404999:	e9 6b ff ff ff       	jmp    404909 <memcpy+0x129>
  40499e:	66 90                	xchg   ax,ax
				t &= wmask;
  4049a0:	48 89 c6             	mov    rsi,rax
  4049a3:	83 e6 03             	and    esi,0x3
			length -= t;
  4049a6:	48 29 f1             	sub    rcx,rsi
		t = length / wsize;
  4049a9:	48 89 ca             	mov    rdx,rcx
		t = length & wmask;
  4049ac:	48 89 cb             	mov    rbx,rcx
			length -= t;
  4049af:	48 89 cd             	mov    rbp,rcx
				t &= wmask;
  4049b2:	48 89 f1             	mov    rcx,rsi
		t = length / wsize;
  4049b5:	48 c1 ea 02          	shr    rdx,0x2
		t = length & wmask;
  4049b9:	83 e3 03             	and    ebx,0x3
  4049bc:	e9 d2 fe ff ff       	jmp    404893 <memcpy+0xb3>
