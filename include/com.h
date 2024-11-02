//
// Created by Oniar_Pie on 2024/9/27.
//

#ifndef GMS_COM_H
#define GMS_COM_H
#define COM_REG_TX 0
#define COM_REG_RX 0
#define COM_REG_DLL 0
#define COM_REG_IER 1
#define COM_REG_DLM 1
#define COM_REG_FCR 2
#define COM_REG_LCR 3
#define COM_REG_MCR 4
#define COM_REG_LSR 5

#define PORT_COM1 0x3f8
#define PORT_COM2 0x2f8
#define PORT_COM3 0x3e8
#define PORT_COM4 0x2e8
#define PORT_COM5 0x5f8
#define PORT_COM6 0x4f8
#define PORT_COM7 0x5e8
#define PORT_COM8 0x4e8
void init_com(int com_base);
void com_putchar(unsigned short ch,int com_base);
void com_puts(char* s,int com_port);
#endif //GMS_COM_H
