//
// Created by Oniar_Pie on 2024/11/12.
//
#include "reloc.h"
#include "typename.h"
#include "elf.h"
#include "memory.h"
#include "str.h"
#include "mem.h"
#include "log.h"

void do_reloc(struct multiboot_tag_elf_sections *shtag) {
    /*
     * TODO 这部分要完成变量引用的重定位，这样才能顺利进行到高地址。（虽然此时已经跳转到高地址了）
     * */
    u16 entn=shtag->num;
    u16 ents=shtag->entsize;
    u16 strtabi=shtag->shndx;
    struct Elf64_Shdr* sh=shtag->sections;
    char* strtab= (char *) sh[strtabi].sh_addr;
    comprintf("strtabi=%d,addr=0x%x\n",strtabi,strtab);
    for(int i=0;i<entn;i++){
        int shtbi=sh[i].sh_name;//在字符串段中的index
        char *name=strtab;
        for(int i=0;i<shtbi;){
            if(!*name)
                i++;
            name++;
        }
        comprintf("section 0x%x,name %s\n",i,name);
        if(strlen(name)>5&&memcmp(name,".rela",5)==0){
            comprintf("found reloc section\n");
            //重定位表
            int n=sh[i].sh_size/ sizeof(Elf64_Rela);
            Elf64_Rela *rel= (Elf64_Rela *) sh[i].sh_addr;
            for(int i=0;i<n;i++){
                unsigned int info=rel->r_info;
                int mode=info&0xff;
                if(mode==R_X86_64_64||mode==R_X86_64_32S){
                    addr_t *p= (addr_t *) rel->r_offset;
                    comprintf("changing 0x%x to 0x%x\n",*p,*p|KNL_BASE);
                    *p=*p|KNL_BASE;
                }
                rel++;
            }

        }
    }
}