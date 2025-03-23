//
// Created by Oniar_Pie on 2024/9/27.
//
#include "com.h"
#include "int.h"
#include "com/mem.h"
#include "memory.h"
#include "com/str.h"
#include <stdarg.h>


char combuf[1024];
void init_com(int base_port)
{
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);

    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);

    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
    outb(base_port + COM_REG_DLM, 0x00);

    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);

    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);   // 0xc7

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);

    /* set in loopback mode and test serial chip */
    //    outb(base_port + COM_REG_MCR, 0x1E);
    //
    //    /* write a byte to test serial chip */
    //    outb(base_port + COM_REG_TX, 0xae);
    //
    //    /* check if serial is faulty */
    //    if (inb(base_port + COM_REG_RX) != 0xae) {
    //        return;
    //    }

    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
}
void com_putchar(unsigned short ch, int com_base)
{
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
        res &= 0x20;
    } while (res == 0);
    outb(com_base, ch);
}

void com_puts(char* s, int com_port)
{
    for (; *s; s++) {
        com_putchar(*s, com_port);
    }
}

void comprintf(char* fmt, ...)
{
    va_list vargs;
    va_start(vargs, fmt);
    if (strlenk(fmt) >= 1024)
        return;   //一次性输出不了太长
    memset(combuf, 0, 1024);
    vsnprintfk(combuf, 1024, fmt, vargs);
    va_end(vargs);
    com_puts(combuf, PORT_COM1);
}