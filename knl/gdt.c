#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
    asm volatile("lgdt %0":"=m"(gdtptr));

}
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
    gdt[index].base_lo16=base&0xffff;
    gdt[index].base_mid8=(base>>16)&0xff;
    gdt[index].base_hi8=(base>>24)&0xff;
    gdt[index].limit_lo16=limit&0xffff;
    gdt[index].attr=attr;

}

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
    gate* ptr=gdt;
    ptr[index].offset_low=offset&0xffff;
    ptr[index].offset_high=(offset>>16)&0xffff;
    ptr[index].selector=selector;
    ptr[index].attr=attr;
}

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
    desc->base_lo16=base&0xffff;
    desc->base_mid8=(base>>16)&0xff;
    desc->base_hi8=(base>>24)&0xff;
    desc->limit_lo16=limit&0xffff;
    desc->attr=attr|(limit>>16&0xf)<<8;
}