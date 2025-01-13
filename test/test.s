
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000400000 <__main>:


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int __main() {}
  400000:	f3 0f 1e fa          	endbr64 
  400004:	55                   	push   rbp
  400005:	48 89 e5             	mov    rbp,rsp
  400008:	90                   	nop
  400009:	5d                   	pop    rbp
  40000a:	c3                   	ret    

000000000040000b <main>:
// int   __stack_chk_fail() {}
int main(int argc, char** argv, char** environ)
{
  40000b:	f3 0f 1e fa          	endbr64 
  40000f:	55                   	push   rbp
  400010:	48 89 e5             	mov    rbp,rsp
  400013:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
  40001a:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
  400020:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
  400027:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  40002e:	48 8d 05 6b 06 00 00 	lea    rax,[rip+0x66b]        # 4006a0 <b+0x4>
  400035:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    puts("Gamessis OS shell\n");
  400039:	48 8d 05 67 06 00 00 	lea    rax,[rip+0x667]        # 4006a7 <b+0xb>
  400040:	48 89 c7             	mov    rdi,rax
  400043:	e8 c8 02 00 00       	call   400310 <puts@plt>
    char cmd[128] = {0};
  400048:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  40004f:	00 00 00 00 
  400053:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  40005a:	00 00 00 00 
  40005e:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400065:	00 
  400066:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  40006d:	00 
  40006e:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400075:	00 
  400076:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  40007d:	00 
  40007e:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  400085:	00 
  400086:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  40008d:	00 
  40008e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  400095:	00 
  400096:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  40009d:	00 
  40009e:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4000a5:	00 
  4000a6:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4000ad:	00 
  4000ae:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4000b5:	00 
  4000b6:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4000bd:	00 
  4000be:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4000c5:	00 
  4000c6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4000cd:	00 
    while (1) {
        memset(cmd, 0, 128);
  4000ce:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4000d5:	ba 80 00 00 00       	mov    edx,0x80
  4000da:	be 00 00 00 00       	mov    esi,0x0
  4000df:	48 89 c7             	mov    rdi,rax
  4000e2:	e8 49 02 00 00       	call   400330 <memset@plt>
        int p = 0;
  4000e7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
        printf("shell:>");
  4000ee:	48 8d 05 c5 05 00 00 	lea    rax,[rip+0x5c5]        # 4006ba <b+0x1e>
  4000f5:	48 89 c7             	mov    rdi,rax
  4000f8:	b8 00 00 00 00       	mov    eax,0x0
  4000fd:	e8 de 01 00 00       	call   4002e0 <printf@plt>
        // write(2, "shell:>", 7);
        gets(cmd);
  400102:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400109:	48 89 c7             	mov    rdi,rax
  40010c:	e8 df 01 00 00       	call   4002f0 <gets@plt>
        puts(cmd);
  400111:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400118:	48 89 c7             	mov    rdi,rax
  40011b:	e8 f0 01 00 00       	call   400310 <puts@plt>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400120:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400127:	48 8d 15 94 05 00 00 	lea    rdx,[rip+0x594]        # 4006c2 <b+0x26>
  40012e:	48 89 d6             	mov    rsi,rdx
  400131:	48 89 c7             	mov    rdi,rax
  400134:	e8 07 02 00 00       	call   400340 <strcmp@plt>
  400139:	85 c0                	test   eax,eax
  40013b:	75 11                	jne    40014e <main+0x143>
            puts("Gamessis OS 1.0.\n");
  40013d:	48 8d 05 86 05 00 00 	lea    rax,[rip+0x586]        # 4006ca <b+0x2e>
  400144:	48 89 c7             	mov    rdi,rax
  400147:	e8 c4 01 00 00       	call   400310 <puts@plt>
  40014c:	eb 80                	jmp    4000ce <main+0xc3>
        }
        else if (strcmp(cmd, "exit") == 0) {
  40014e:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400155:	48 8d 15 80 05 00 00 	lea    rdx,[rip+0x580]        # 4006dc <b+0x40>
  40015c:	48 89 d6             	mov    rsi,rdx
  40015f:	48 89 c7             	mov    rdi,rax
  400162:	e8 d9 01 00 00       	call   400340 <strcmp@plt>
  400167:	85 c0                	test   eax,eax
  400169:	0f 84 c6 00 00 00    	je     400235 <main+0x22a>
            break;
        }
        else {
            printf("trying to execute...\n");
  40016f:	48 8d 05 6b 05 00 00 	lea    rax,[rip+0x56b]        # 4006e1 <b+0x45>
  400176:	48 89 c7             	mov    rdi,rax
  400179:	b8 00 00 00 00       	mov    eax,0x0
  40017e:	e8 5d 01 00 00       	call   4002e0 <printf@plt>
            int pid = 0;
  400183:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
            if ((pid = fork()) == 0) {
  40018a:	e8 91 01 00 00       	call   400320 <fork@plt>
  40018f:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  400192:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  400196:	75 5c                	jne    4001f4 <main+0x1e9>
                printf("forked, ready to execve\n");
  400198:	48 8d 05 58 05 00 00 	lea    rax,[rip+0x558]        # 4006f7 <b+0x5b>
  40019f:	48 89 c7             	mov    rdi,rax
  4001a2:	b8 00 00 00 00       	mov    eax,0x0
  4001a7:	e8 34 01 00 00       	call   4002e0 <printf@plt>
                if (execve(cmd, argv, environ) == -1) {
  4001ac:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
  4001b3:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  4001ba:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001c1:	48 89 ce             	mov    rsi,rcx
  4001c4:	48 89 c7             	mov    rdi,rax
  4001c7:	e8 34 01 00 00       	call   400300 <execve@plt>
  4001cc:	83 f8 ff             	cmp    eax,0xffffffff
  4001cf:	75 23                	jne    4001f4 <main+0x1e9>
                    printf("cannot find file:%s\n", cmd);
  4001d1:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001d8:	48 89 c6             	mov    rsi,rax
  4001db:	48 8d 05 2e 05 00 00 	lea    rax,[rip+0x52e]        # 400710 <b+0x74>
  4001e2:	48 89 c7             	mov    rdi,rax
  4001e5:	b8 00 00 00 00       	mov    eax,0x0
  4001ea:	e8 f1 00 00 00       	call   4002e0 <printf@plt>
  4001ef:	e9 da fe ff ff       	jmp    4000ce <main+0xc3>
                    continue;
                }
            }
            printf("forked. pid=%d\n", pid);
  4001f4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4001f7:	89 c6                	mov    esi,eax
  4001f9:	48 8d 05 25 05 00 00 	lea    rax,[rip+0x525]        # 400725 <b+0x89>
  400200:	48 89 c7             	mov    rdi,rax
  400203:	b8 00 00 00 00       	mov    eax,0x0
  400208:	e8 d3 00 00 00       	call   4002e0 <printf@plt>
            int loc = 0;
  40020d:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  400214:	00 00 00 

            waitpid(pid, &loc, 0);
  400217:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  40021e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  400221:	ba 00 00 00 00       	mov    edx,0x0
  400226:	48 89 ce             	mov    rsi,rcx
  400229:	89 c7                	mov    edi,eax
  40022b:	e8 a0 00 00 00       	call   4002d0 <waitpid@plt>
    while (1) {
  400230:	e9 99 fe ff ff       	jmp    4000ce <main+0xc3>
            break;
  400235:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400236:	b8 00 00 00 00       	mov    eax,0x0
  40023b:	c9                   	leave  
  40023c:	c3                   	ret    

Disassembly of section .plt:

0000000000400240 <.plt>:
  400240:	ff 35 2a 06 00 00    	push   QWORD PTR [rip+0x62a]        # 400870 <_GLOBAL_OFFSET_TABLE_+0x8>
  400246:	f2 ff 25 2b 06 00 00 	bnd jmp QWORD PTR [rip+0x62b]        # 400878 <_GLOBAL_OFFSET_TABLE_+0x10>
  40024d:	0f 1f 00             	nop    DWORD PTR [rax]
  400250:	f3 0f 1e fa          	endbr64 
  400254:	68 00 00 00 00       	push   0x0
  400259:	f2 e9 e1 ff ff ff    	bnd jmp 400240 <main+0x235>
  40025f:	90                   	nop
  400260:	f3 0f 1e fa          	endbr64 
  400264:	68 01 00 00 00       	push   0x1
  400269:	f2 e9 d1 ff ff ff    	bnd jmp 400240 <main+0x235>
  40026f:	90                   	nop
  400270:	f3 0f 1e fa          	endbr64 
  400274:	68 02 00 00 00       	push   0x2
  400279:	f2 e9 c1 ff ff ff    	bnd jmp 400240 <main+0x235>
  40027f:	90                   	nop
  400280:	f3 0f 1e fa          	endbr64 
  400284:	68 03 00 00 00       	push   0x3
  400289:	f2 e9 b1 ff ff ff    	bnd jmp 400240 <main+0x235>
  40028f:	90                   	nop
  400290:	f3 0f 1e fa          	endbr64 
  400294:	68 04 00 00 00       	push   0x4
  400299:	f2 e9 a1 ff ff ff    	bnd jmp 400240 <main+0x235>
  40029f:	90                   	nop
  4002a0:	f3 0f 1e fa          	endbr64 
  4002a4:	68 05 00 00 00       	push   0x5
  4002a9:	f2 e9 91 ff ff ff    	bnd jmp 400240 <main+0x235>
  4002af:	90                   	nop
  4002b0:	f3 0f 1e fa          	endbr64 
  4002b4:	68 06 00 00 00       	push   0x6
  4002b9:	f2 e9 81 ff ff ff    	bnd jmp 400240 <main+0x235>
  4002bf:	90                   	nop
  4002c0:	f3 0f 1e fa          	endbr64 
  4002c4:	68 07 00 00 00       	push   0x7
  4002c9:	f2 e9 71 ff ff ff    	bnd jmp 400240 <main+0x235>
  4002cf:	90                   	nop

Disassembly of section .plt.sec:

00000000004002d0 <waitpid@plt>:
  4002d0:	f3 0f 1e fa          	endbr64 
  4002d4:	f2 ff 25 a5 05 00 00 	bnd jmp QWORD PTR [rip+0x5a5]        # 400880 <waitpid>
  4002db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002e0 <printf@plt>:
  4002e0:	f3 0f 1e fa          	endbr64 
  4002e4:	f2 ff 25 9d 05 00 00 	bnd jmp QWORD PTR [rip+0x59d]        # 400888 <printf>
  4002eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002f0 <gets@plt>:
  4002f0:	f3 0f 1e fa          	endbr64 
  4002f4:	f2 ff 25 95 05 00 00 	bnd jmp QWORD PTR [rip+0x595]        # 400890 <gets>
  4002fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400300 <execve@plt>:
  400300:	f3 0f 1e fa          	endbr64 
  400304:	f2 ff 25 8d 05 00 00 	bnd jmp QWORD PTR [rip+0x58d]        # 400898 <execve>
  40030b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400310 <puts@plt>:
  400310:	f3 0f 1e fa          	endbr64 
  400314:	f2 ff 25 85 05 00 00 	bnd jmp QWORD PTR [rip+0x585]        # 4008a0 <puts>
  40031b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400320 <fork@plt>:
  400320:	f3 0f 1e fa          	endbr64 
  400324:	f2 ff 25 7d 05 00 00 	bnd jmp QWORD PTR [rip+0x57d]        # 4008a8 <fork>
  40032b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400330 <memset@plt>:
  400330:	f3 0f 1e fa          	endbr64 
  400334:	f2 ff 25 75 05 00 00 	bnd jmp QWORD PTR [rip+0x575]        # 4008b0 <memset>
  40033b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400340 <strcmp@plt>:
  400340:	f3 0f 1e fa          	endbr64 
  400344:	f2 ff 25 6d 05 00 00 	bnd jmp QWORD PTR [rip+0x56d]        # 4008b8 <strcmp>
  40034b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
