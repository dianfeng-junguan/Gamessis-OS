//
// Created by Oniar_Pie on 2024/11/12.
//
#include "reloc.h"
#include "typename.h"
#include "elf.h"
#include "memory.h"
extern char * _binary_bin_gmsknl_elf_start;//这个指向内核elf
void do_reloc(unsigned int magic,void* addr) {
    /*
     * TODO 这部分要完成变量引用的重定位，这样才能顺利进行到高地址。（虽然此时已经跳转到高地址了）
     * */
    unsigned long bin= (unsigned long) &_binary_bin_gmsknl_elf_start;
    Elf64_Ehdr *ehdr=(Elf64_Phdr*)bin;
    u16 entn=ehdr->e_phnum;
    u16 ents=ehdr->e_phentsize;
    struct Elf64_Shdr* sh=bin+ehdr->e_shoff;
    Elf64_Phdr *ph=bin+ehdr->e_phoff;
    for(int i=0;i<entn;i++){
        //加载节
        if(ph->p_flags|PT_LOAD){
            unsigned long off=ph->p_offset;
            unsigned long fs=ph->p_filesz;
            char* vptr= (char *) ph->p_vaddr;
            char *fptr=bin+off;
            //复制节内容到目标地址
            for(int i=0;i<fs;i++){
                *(vptr++)=*(fptr++);
            }
        }
        ph++;
        /*if(sh[i].sh_type==SHT_RELA){
            //重定位表
            int n=sh[i].sh_size/ sizeof(Elf64_Rela);
            Elf64_Rela *rel= (Elf64_Rela *) sh[i].sh_addr;
            for(int i=0;i<n;i++){
                unsigned int info=rel->r_info;
                int mode=info&0xff;
                if(mode==R_X86_64_64||mode==R_X86_64_32S){
                    addr_t *p= (addr_t *) rel->r_offset;
                    *p=*p|KNL_BASE;
                }
                rel++;
            }

        }*/
    }
    int (*main)(unsigned int magic,void* addr)=(int (*)(unsigned int, void *)) (ehdr->e_entry | KNL_BASE);
    main(magic,addr);

}
