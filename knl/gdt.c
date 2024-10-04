#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
                 "ltr %ax");  
}
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
    gdt[index].base_12=base&0xffff;
    gdt[index].base_3=(base>>16)&0xff;
    gdt[index].base_4=(base>>24)&0xff;
    gdt[index].base_5678=(base>>32)&0xffffffff;
    gdt[index].limit_lo16=limit&0xffff;
    gdt[index].attr=attr|((limit>>8)&0xf0);

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
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
}