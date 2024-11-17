//
// Created by Oniar_Pie on 2024/5/1.
//
#include "syscall.h"

int syscall(long a, long b, long c, long d, long e, long f)
{
    asm volatile(
            "mov %0,%%eax\r\n"\
        "mov %1,%%ebx\r\n"\
        "mov %2,%%ecx\r\n"\
        "mov %3,%%edx\r\n"\
        "mov %4,%%esi\r\n"\
        "mov %5,%%edi\r\n"\
        "int $0x80\r\n"\
        "leave\r\n ret"::"m"(a),"m"(b),"m"(c),"m"(d),"m"(e),"m"(f)
            );
}

int exec(char *path)
{
    return syscall(SYSCAll_EXEC,path,0,0,0,0);
}