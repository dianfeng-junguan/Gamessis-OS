#pragma once
#pragma pack(1)
#define GDT_ADDR 0x800
//可执行
#define SEG_X 0x8
#define SEG_R 0x4
//可读写
#define SEG_W 0x4
#define SEG_CONFORMING 0x2
//向下扩展
#define SEG_DOWNWARD 0x2
#define SEG_4KB_GRANUALITY 0x8000
#define SEG_NON_SYS_GATE 0x10
#define SEG_SYS_LDT 0x2
#define GATE_TASK 0x5
#define SEG_SYS_TSS 0x9
#define GATE_CALL 0xc
#define GATE_TRAP 0xf
#define GATE_INT 0xe
#define SEG_PRESENT 0x80
#define SEG_DPL_3 0x60
#define SEG_32BIT 0x4000
#define SEG_CONFORMING_RW_CODE 0xcf9e//(0xe|SEG_NON_SYS_GATE|SEG_4KB_GRANUALITY|SEG_PRESENT|SEG_32BIT)
#define SEG_RW_DATA 0xcf92//(0x2|SEG_NON_SYS_GATE|SEG_4KB_GRANUALITY|SEG_PRESENT|SEG_32BIT)
#define SEG_STACK (0x6|SEG_NON_SYS_GATE|SEG_PRESENT)

#define SEL_LDT 0x4
#define SEL_RPL_3 0x3
#define SEL_LDT_CODE (SEL_LDT+SEL_RPL_3)
#define SEL_LDT_DATA (SEL_LDT+SEL_RPL_3+8)
#define SEL_LDT_STACK (SEL_LDT+SEL_RPL_3+16)
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct
{
    u16 limit_lo16;
    u16 base_lo16;
    u8 base_mid8;
    u16 attr;
    u8 base_hi8;
}descriptor;

int init_gdt();
void fill_desc(u32 base, u32 limit,u16 attr,u32 index);
void fill_gate(u32 index,u32 offset,u16 selector,u16 attr);
void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc);