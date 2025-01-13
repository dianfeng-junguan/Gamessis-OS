
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
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  400027:	48 8d 05 b2 06 00 00 	lea    rax,[rip+0x6b2]        # 4006e0 <b+0x4>
  40002e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    puts("Gamessis OS shell\n");
  400032:	48 8d 05 ae 06 00 00 	lea    rax,[rip+0x6ae]        # 4006e7 <b+0xb>
  400039:	48 89 c7             	mov    rdi,rax
  40003c:	e8 cf 02 00 00       	call   400310 <puts@plt>
    char cmd[128] = {0};
  400041:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  400048:	00 00 00 00 
  40004c:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400053:	00 00 00 00 
  400057:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  40005e:	00 
  40005f:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  400066:	00 
  400067:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  40006e:	00 
  40006f:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  400076:	00 
  400077:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  40007e:	00 
  40007f:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  400086:	00 
  400087:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  40008e:	00 
  40008f:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  400096:	00 
  400097:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40009e:	00 
  40009f:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4000a6:	00 
  4000a7:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4000ae:	00 
  4000af:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4000b6:	00 
  4000b7:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4000be:	00 
  4000bf:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4000c6:	00 
    while (1) {
        memset(cmd, 0, 128);
  4000c7:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4000ce:	ba 80 00 00 00       	mov    edx,0x80
  4000d3:	be 00 00 00 00       	mov    esi,0x0
  4000d8:	48 89 c7             	mov    rdi,rax
  4000db:	e8 50 02 00 00       	call   400330 <memset@plt>
        int p = 0;
  4000e0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
        printf("shell:>");
  4000e7:	48 8d 05 0c 06 00 00 	lea    rax,[rip+0x60c]        # 4006fa <b+0x1e>
  4000ee:	48 89 c7             	mov    rdi,rax
  4000f1:	b8 00 00 00 00       	mov    eax,0x0
  4000f6:	e8 e5 01 00 00       	call   4002e0 <printf@plt>
        // write(2, "shell:>", 7);
        gets(cmd);
  4000fb:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400102:	48 89 c7             	mov    rdi,rax
  400105:	e8 e6 01 00 00       	call   4002f0 <gets@plt>
        puts(cmd);
  40010a:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400111:	48 89 c7             	mov    rdi,rax
  400114:	e8 f7 01 00 00       	call   400310 <puts@plt>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
  400119:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400120:	48 8d 15 db 05 00 00 	lea    rdx,[rip+0x5db]        # 400702 <b+0x26>
  400127:	48 89 d6             	mov    rsi,rdx
  40012a:	48 89 c7             	mov    rdi,rax
  40012d:	e8 0e 02 00 00       	call   400340 <strcmp@plt>
  400132:	85 c0                	test   eax,eax
  400134:	75 11                	jne    400147 <main+0x13c>
            puts("Gamessis OS 1.0.\n");
  400136:	48 8d 05 cd 05 00 00 	lea    rax,[rip+0x5cd]        # 40070a <b+0x2e>
  40013d:	48 89 c7             	mov    rdi,rax
  400140:	e8 cb 01 00 00       	call   400310 <puts@plt>
  400145:	eb 80                	jmp    4000c7 <main+0xbc>
        }
        else if (strcmp(cmd, "exit") == 0) {
  400147:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40014e:	48 8d 15 c7 05 00 00 	lea    rdx,[rip+0x5c7]        # 40071c <b+0x40>
  400155:	48 89 d6             	mov    rsi,rdx
  400158:	48 89 c7             	mov    rdi,rax
  40015b:	e8 e0 01 00 00       	call   400340 <strcmp@plt>
  400160:	85 c0                	test   eax,eax
  400162:	0f 84 c3 00 00 00    	je     40022b <main+0x220>
            break;
        }
        else {
            printf("trying to execute...\n");
  400168:	48 8d 05 b2 05 00 00 	lea    rax,[rip+0x5b2]        # 400721 <b+0x45>
  40016f:	48 89 c7             	mov    rdi,rax
  400172:	b8 00 00 00 00       	mov    eax,0x0
  400177:	e8 64 01 00 00       	call   4002e0 <printf@plt>
            int pid = 0;
  40017c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
            if ((pid = fork()) == 0) {
  400183:	e8 98 01 00 00       	call   400320 <fork@plt>
  400188:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  40018b:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  40018f:	75 59                	jne    4001ea <main+0x1df>
                printf("forked, ready to execve\n");
  400191:	48 8d 05 9f 05 00 00 	lea    rax,[rip+0x59f]        # 400737 <b+0x5b>
  400198:	48 89 c7             	mov    rdi,rax
  40019b:	b8 00 00 00 00       	mov    eax,0x0
  4001a0:	e8 3b 01 00 00       	call   4002e0 <printf@plt>
                if (execve(cmd, argv, environ) == -1) {
  4001a5:	48 8b 15 94 07 00 00 	mov    rdx,QWORD PTR [rip+0x794]        # 400940 <environ>
  4001ac:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  4001b3:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001ba:	48 89 ce             	mov    rsi,rcx
  4001bd:	48 89 c7             	mov    rdi,rax
  4001c0:	e8 3b 01 00 00       	call   400300 <execve@plt>
  4001c5:	83 f8 ff             	cmp    eax,0xffffffff
  4001c8:	75 20                	jne    4001ea <main+0x1df>
                    printf("cannot find file:%s\n", cmd);
  4001ca:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001d1:	48 89 c6             	mov    rsi,rax
  4001d4:	48 8d 05 75 05 00 00 	lea    rax,[rip+0x575]        # 400750 <b+0x74>
  4001db:	48 89 c7             	mov    rdi,rax
  4001de:	b8 00 00 00 00       	mov    eax,0x0
  4001e3:	e8 f8 00 00 00       	call   4002e0 <printf@plt>
  4001e8:	eb 42                	jmp    40022c <main+0x221>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  4001ea:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4001ed:	89 c6                	mov    esi,eax
  4001ef:	48 8d 05 6f 05 00 00 	lea    rax,[rip+0x56f]        # 400765 <b+0x89>
  4001f6:	48 89 c7             	mov    rdi,rax
  4001f9:	b8 00 00 00 00       	mov    eax,0x0
  4001fe:	e8 dd 00 00 00       	call   4002e0 <printf@plt>
            int loc = 0;
  400203:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  40020a:	00 00 00 

            waitpid(pid, &loc, 0);
  40020d:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  400214:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  400217:	ba 00 00 00 00       	mov    edx,0x0
  40021c:	48 89 ce             	mov    rsi,rcx
  40021f:	89 c7                	mov    edi,eax
  400221:	e8 aa 00 00 00       	call   4002d0 <waitpid@plt>
    while (1) {
  400226:	e9 9c fe ff ff       	jmp    4000c7 <main+0xbc>
            break;
  40022b:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  40022c:	b8 00 00 00 00       	mov    eax,0x0
  400231:	c9                   	leave  
  400232:	c3                   	ret    

Disassembly of section .plt:

0000000000400240 <.plt>:
  400240:	ff 35 9a 06 00 00    	push   QWORD PTR [rip+0x69a]        # 4008e0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400246:	f2 ff 25 9b 06 00 00 	bnd jmp QWORD PTR [rip+0x69b]        # 4008e8 <_GLOBAL_OFFSET_TABLE_+0x10>
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
  4002d4:	f2 ff 25 15 06 00 00 	bnd jmp QWORD PTR [rip+0x615]        # 4008f0 <waitpid>
  4002db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002e0 <printf@plt>:
  4002e0:	f3 0f 1e fa          	endbr64 
  4002e4:	f2 ff 25 0d 06 00 00 	bnd jmp QWORD PTR [rip+0x60d]        # 4008f8 <printf>
  4002eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004002f0 <gets@plt>:
  4002f0:	f3 0f 1e fa          	endbr64 
  4002f4:	f2 ff 25 05 06 00 00 	bnd jmp QWORD PTR [rip+0x605]        # 400900 <gets>
  4002fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400300 <execve@plt>:
  400300:	f3 0f 1e fa          	endbr64 
  400304:	f2 ff 25 fd 05 00 00 	bnd jmp QWORD PTR [rip+0x5fd]        # 400908 <execve>
  40030b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400310 <puts@plt>:
  400310:	f3 0f 1e fa          	endbr64 
  400314:	f2 ff 25 f5 05 00 00 	bnd jmp QWORD PTR [rip+0x5f5]        # 400910 <puts>
  40031b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400320 <fork@plt>:
  400320:	f3 0f 1e fa          	endbr64 
  400324:	f2 ff 25 ed 05 00 00 	bnd jmp QWORD PTR [rip+0x5ed]        # 400918 <fork>
  40032b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400330 <memset@plt>:
  400330:	f3 0f 1e fa          	endbr64 
  400334:	f2 ff 25 e5 05 00 00 	bnd jmp QWORD PTR [rip+0x5e5]        # 400920 <memset>
  40033b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400340 <strcmp@plt>:
  400340:	f3 0f 1e fa          	endbr64 
  400344:	f2 ff 25 dd 05 00 00 	bnd jmp QWORD PTR [rip+0x5dd]        # 400928 <strcmp>
  40034b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
