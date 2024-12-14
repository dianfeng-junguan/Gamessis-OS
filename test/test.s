
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
int main(int argc, char** argv)
{
  40000b:	f3 0f 1e fa          	endbr64 
  40000f:	55                   	push   rbp
  400010:	48 89 e5             	mov    rbp,rsp
  400013:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  40001a:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
  400020:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
    // write(2, as, strlen(as));
    puts("Gamessis OS shell\n");
  400027:	48 8d 05 a2 06 00 00 	lea    rax,[rip+0x6a2]        # 4006d0 <b+0x4>
  40002e:	48 89 c7             	mov    rdi,rax
  400031:	e8 ca 02 00 00       	call   400300 <puts@plt>
    char cmd[128] = {0};
  400036:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  40003d:	00 00 00 00 
  400041:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400048:	00 00 00 00 
  40004c:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400053:	00 
  400054:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  40005b:	00 
  40005c:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400063:	00 
  400064:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  40006b:	00 
  40006c:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  400073:	00 
  400074:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  40007b:	00 
  40007c:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  400083:	00 
  400084:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  40008b:	00 
  40008c:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  400093:	00 
  400094:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40009b:	00 
  40009c:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4000a3:	00 
  4000a4:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4000ab:	00 
  4000ac:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4000b3:	00 
  4000b4:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4000bb:	00 
    while (1) {
        memset(cmd, 0, 128);
  4000bc:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4000c3:	ba 80 00 00 00       	mov    edx,0x80
  4000c8:	be 00 00 00 00       	mov    esi,0x0
  4000cd:	48 89 c7             	mov    rdi,rax
  4000d0:	e8 4b 02 00 00       	call   400320 <memset@plt>
        int p = 0;
  4000d5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  4000dc:	48 8d 05 00 06 00 00 	lea    rax,[rip+0x600]        # 4006e3 <b+0x17>
  4000e3:	48 89 c7             	mov    rdi,rax
  4000e6:	b8 00 00 00 00       	mov    eax,0x0
  4000eb:	e8 e0 01 00 00       	call   4002d0 <printf@plt>
        // write(2, "shell:>", 7);
        gets(cmd);
  4000f0:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4000f7:	48 89 c7             	mov    rdi,rax
  4000fa:	b8 00 00 00 00       	mov    eax,0x0
  4000ff:	e8 dc 01 00 00       	call   4002e0 <gets@plt>
        puts(cmd);
  400104:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40010b:	48 89 c7             	mov    rdi,rax
  40010e:	e8 ed 01 00 00       	call   400300 <puts@plt>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  400113:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40011a:	48 8d 15 ca 05 00 00 	lea    rdx,[rip+0x5ca]        # 4006eb <b+0x1f>
  400121:	48 89 d6             	mov    rsi,rdx
  400124:	48 89 c7             	mov    rdi,rax
  400127:	e8 04 02 00 00       	call   400330 <strcmp@plt>
  40012c:	85 c0                	test   eax,eax
  40012e:	75 14                	jne    400144 <main+0x139>
  400130:	48 8d 05 bc 05 00 00 	lea    rax,[rip+0x5bc]        # 4006f3 <b+0x27>
  400137:	48 89 c7             	mov    rdi,rax
  40013a:	e8 c1 01 00 00       	call   400300 <puts@plt>
  40013f:	e9 78 ff ff ff       	jmp    4000bc <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  400144:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40014b:	48 8d 15 b3 05 00 00 	lea    rdx,[rip+0x5b3]        # 400705 <b+0x39>
  400152:	48 89 d6             	mov    rsi,rdx
  400155:	48 89 c7             	mov    rdi,rax
  400158:	e8 d3 01 00 00       	call   400330 <strcmp@plt>
  40015d:	85 c0                	test   eax,eax
  40015f:	0f 84 b9 00 00 00    	je     40021e <main+0x213>
            break;
        }
        else {
            printf("trying to execute...\n");
  400165:	48 8d 05 9e 05 00 00 	lea    rax,[rip+0x59e]        # 40070a <b+0x3e>
  40016c:	48 89 c7             	mov    rdi,rax
  40016f:	e8 8c 01 00 00       	call   400300 <puts@plt>
            int pid = 0;
  400174:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  40017b:	e8 90 01 00 00       	call   400310 <fork@plt>
  400180:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  400183:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  400187:	75 54                	jne    4001dd <main+0x1d2>
                printf("forked, ready to execve\n");
  400189:	48 8d 05 8f 05 00 00 	lea    rax,[rip+0x58f]        # 40071f <b+0x53>
  400190:	48 89 c7             	mov    rdi,rax
  400193:	e8 68 01 00 00       	call   400300 <puts@plt>
                if (execve(cmd, argv, environ) == -1) {
  400198:	48 8b 15 81 07 00 00 	mov    rdx,QWORD PTR [rip+0x781]        # 400920 <environ>
  40019f:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  4001a6:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001ad:	48 89 ce             	mov    rsi,rcx
  4001b0:	48 89 c7             	mov    rdi,rax
  4001b3:	e8 38 01 00 00       	call   4002f0 <execve@plt>
  4001b8:	83 f8 ff             	cmp    eax,0xffffffff
  4001bb:	75 20                	jne    4001dd <main+0x1d2>
                    printf("cannot find file:%s\n", cmd);
  4001bd:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001c4:	48 89 c6             	mov    rsi,rax
  4001c7:	48 8d 05 69 05 00 00 	lea    rax,[rip+0x569]        # 400737 <b+0x6b>
  4001ce:	48 89 c7             	mov    rdi,rax
  4001d1:	b8 00 00 00 00       	mov    eax,0x0
  4001d6:	e8 f5 00 00 00       	call   4002d0 <printf@plt>
  4001db:	eb 42                	jmp    40021f <main+0x214>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  4001dd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4001e0:	89 c6                	mov    esi,eax
  4001e2:	48 8d 05 63 05 00 00 	lea    rax,[rip+0x563]        # 40074c <b+0x80>
  4001e9:	48 89 c7             	mov    rdi,rax
  4001ec:	b8 00 00 00 00       	mov    eax,0x0
  4001f1:	e8 da 00 00 00       	call   4002d0 <printf@plt>
            int loc = 0;
  4001f6:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  4001fd:	00 00 00 

            waitpid(pid, &loc, 0);
  400200:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  400207:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  40020a:	ba 00 00 00 00       	mov    edx,0x0
  40020f:	48 89 ce             	mov    rsi,rcx
  400212:	89 c7                	mov    edi,eax
  400214:	e8 a7 00 00 00       	call   4002c0 <waitpid@plt>
    while (1) {
  400219:	e9 9e fe ff ff       	jmp    4000bc <main+0xb1>
            break;
  40021e:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  40021f:	b8 00 00 00 00       	mov    eax,0x0
  400224:	c9                   	leave  
  400225:	c3                   	ret    

Disassembly of section .plt:

0000000000400230 <.plt>:
  400230:	ff 35 92 06 00 00    	push   QWORD PTR [rip+0x692]        # 4008c8 <_GLOBAL_OFFSET_TABLE_+0x8>
  400236:	f2 ff 25 93 06 00 00 	bnd jmp QWORD PTR [rip+0x693]        # 4008d0 <_GLOBAL_OFFSET_TABLE_+0x10>
  40023d:	0f 1f 00             	nop    DWORD PTR [rax]
  400240:	f3 0f 1e fa          	endbr64 
  400244:	68 00 00 00 00       	push   0x0
  400249:	f2 e9 e1 ff ff ff    	bnd jmp 400230 <main+0x225>
  40024f:	90                   	nop
  400250:	f3 0f 1e fa          	endbr64 
  400254:	68 01 00 00 00       	push   0x1
  400259:	f2 e9 d1 ff ff ff    	bnd jmp 400230 <main+0x225>
  40025f:	90                   	nop
  400260:	f3 0f 1e fa          	endbr64 
  400264:	68 02 00 00 00       	push   0x2
  400269:	f2 e9 c1 ff ff ff    	bnd jmp 400230 <main+0x225>
  40026f:	90                   	nop
  400270:	f3 0f 1e fa          	endbr64 
  400274:	68 03 00 00 00       	push   0x3
  400279:	f2 e9 b1 ff ff ff    	bnd jmp 400230 <main+0x225>
  40027f:	90                   	nop
  400280:	f3 0f 1e fa          	endbr64 
  400284:	68 04 00 00 00       	push   0x4
  400289:	f2 e9 a1 ff ff ff    	bnd jmp 400230 <main+0x225>
  40028f:	90                   	nop
  400290:	f3 0f 1e fa          	endbr64 
  400294:	68 05 00 00 00       	push   0x5
  400299:	f2 e9 91 ff ff ff    	bnd jmp 400230 <main+0x225>
  40029f:	90                   	nop
  4002a0:	f3 0f 1e fa          	endbr64 
  4002a4:	68 06 00 00 00       	push   0x6
  4002a9:	f2 e9 81 ff ff ff    	bnd jmp 400230 <main+0x225>
  4002af:	90                   	nop
  4002b0:	f3 0f 1e fa          	endbr64 
  4002b4:	68 07 00 00 00       	push   0x7
  4002b9:	f2 e9 71 ff ff ff    	bnd jmp 400230 <main+0x225>
  4002bf:	90                   	nop

Disassembly of section .plt.sec:

00000000004002c0 <waitpid@plt>:
  4002c0:	f3 0f 1e fa          	endbr64 
  4002c4:	f2 ff 25 0d 06 00 00 	bnd jmp QWORD PTR [rip+0x60d]        # 4008d8 <waitpid>
  4002cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002d0 <printf@plt>:
  4002d0:	f3 0f 1e fa          	endbr64 
  4002d4:	f2 ff 25 05 06 00 00 	bnd jmp QWORD PTR [rip+0x605]        # 4008e0 <printf>
  4002db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002e0 <gets@plt>:
  4002e0:	f3 0f 1e fa          	endbr64 
  4002e4:	f2 ff 25 fd 05 00 00 	bnd jmp QWORD PTR [rip+0x5fd]        # 4008e8 <gets>
  4002eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002f0 <execve@plt>:
  4002f0:	f3 0f 1e fa          	endbr64 
  4002f4:	f2 ff 25 f5 05 00 00 	bnd jmp QWORD PTR [rip+0x5f5]        # 4008f0 <execve>
  4002fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400300 <puts@plt>:
  400300:	f3 0f 1e fa          	endbr64 
  400304:	f2 ff 25 ed 05 00 00 	bnd jmp QWORD PTR [rip+0x5ed]        # 4008f8 <puts>
  40030b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400310 <fork@plt>:
  400310:	f3 0f 1e fa          	endbr64 
  400314:	f2 ff 25 e5 05 00 00 	bnd jmp QWORD PTR [rip+0x5e5]        # 400900 <fork>
  40031b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400320 <memset@plt>:
  400320:	f3 0f 1e fa          	endbr64 
  400324:	f2 ff 25 dd 05 00 00 	bnd jmp QWORD PTR [rip+0x5dd]        # 400908 <memset>
  40032b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400330 <strcmp@plt>:
  400330:	f3 0f 1e fa          	endbr64 
  400334:	f2 ff 25 d5 05 00 00 	bnd jmp QWORD PTR [rip+0x5d5]        # 400910 <strcmp>
  40033b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
