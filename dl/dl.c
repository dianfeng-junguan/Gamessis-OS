#include "dl.h"
#include <sys/unistd.h>
#include <syscall.h>
#include <elf.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <exe.h>
#include <c/stdlib.h>

module modules[MAX_MODULES];
id_t get_modid(void){
    static id_t modid_d=0;
    return modid_d++;
}
int dlmain(int fno,int argc,char** argv){
    //加载elf文件
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr,sizeof(ehdr));

    unsigned short entn=ehdr.e_phnum;
    unsigned short ents=ehdr.e_phentsize;
    module* mod=0;
    //module项设置
    //先注册自己
    for(int i=0;i<MAX_MODULES;i++){
        if(modules[i].type==ET_NONE){
            modules[i].type=ET_DYN;
            modules[i].load_offset=0;
            modules[i].base=0;
            break;
        }
    }
    //递归加载elf和so
    load_elfso(fno);
    close(fno);
    //跳转到程序入口
    int (*main)(int,char**)=ehdr.e_entry;
    mfree(&ehdr);
    main(1,0);
    return 0;
}
int load_elfso(int fno){
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr,sizeof(ehdr));

    unsigned short entn=ehdr.e_phnum;
    unsigned short ents=ehdr.e_phentsize;
    module* mod=0;
    //module项设置
    //注册自己
    for(int i=0;i<MAX_MODULES;i++){
        if(modules[i].type==ET_NONE){
            modules[i].type=ehdr.e_type;
            modules[i].load_offset=0;
            modules[i].base=0;
            mod=modules+i;
            break;
        }
    }
    //需要malloc一块内存
    Elf64_Phdr *ph= malloc(entn*ents);//(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    lseek(fno,ehdr.e_phoff,SEEK_SET);
    read(fno,ph,entn*ents);
    size_t tot_sz=0;
    off_t base=ph->p_vaddr,offset=0;
    int (**init)()=0,init_arraysz=0;

    for(int i=0;i<entn;i++){
        //加载段
        if((ph->p_type|PT_LOAD)!=0){
            unsigned long off=ph->p_offset;
            unsigned long fs=ph->p_filesz;
            size_t ms=ph->p_memsz;
            char* vptr= (char *) ph->p_vaddr+offset;
            if(off==0){
                mod->header=vptr;
            }
            //先映射好内存
            int prot=PROT_READ;
            if((ph->p_flags|PF_X))
                prot|=PROT_EXEC;
            if((ph->p_flags|PF_W))
                prot|=PROT_WRITE;
            int flags=MAP_PRIVATE;
            if(ehdr.e_type==ET_EXEC)
                flags|=MAP_FIXED;
            mmap(vptr,fs,prot,flags,fno,off);

        }
        ph++;
    }
    
    Elf64_Dyn* dynamic=0;
    //寻找dynamic段
    struct Elf64_Shdr* shdr=mmap(0,ehdr.e_shentsize*ehdr.e_shnum,PROT_READ,MAP_PRIVATE,fno,ehdr.e_shoff);
    for(int i=0;i<ehdr.e_shnum;i++){
        if(shdr[i].sh_type==SHT_DYNAMIC){
            dynamic=shdr+i;
            break;
        }
    }
    if(!dynamic)
        ;
    char* dynstr=0;
    off_t* got=0;
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    //so_get_dynstr从so中获取.dynstr节
    for(Elf64_Dyn* p=dynamic;p->d_tag;p++){
        if(p->d_tag==DT_STRTAB){
            dynstr=p->d_un.d_ptr+offset;
            break;
        }
    }

    size_t relsz=0,relentsz=0;
    off_t relptr=0;
    for(Elf64_Dyn* p=dynamic;p->d_tag;p++){
        switch (p->d_tag)
        {
        case DT_NEEDED:
            char* pathname=p->d_un.d_val+dynstr;
            int so_fno=open(pathname,O_EXEC);
            //不查错了
            load_elfso(open(pathname,O_EXEC));
            close(so_fno);
            
            break;
        case DT_PLTGOT:
            got=p->d_un.d_ptr+offset;

            //赋值为dl的运行时重定位函数
            got[2]=dl_runtime_resolve;
            //填入模块id
            got[1]=mod-modules;
            mod->p_got=got;
        case DT_SYMTAB:
            mod->p_symbol=p->d_un.d_ptr;
            break;
        case DT_RELSZ:
        case DT_RELASZ:
            relsz=p->d_un.d_val;
            goto is_rel_prepared;
        case DT_REL:
        case DT_RELA:
            relptr=p->d_un.d_ptr;
            goto is_rel_prepared;
        case DT_RELENT:
        case DT_RELAENT:
            relentsz=p->d_un.d_val;
            goto is_rel_prepared;
        case DT_INIT_ARRAY:
            init=p->d_un.d_ptr;
            break;
        case DT_INIT_ARRAYSZ:
            init_arraysz=p->d_un.d_val/8;
            break;
        default:
            break;
        }
        continue;
is_rel_prepared:
        if(!(relsz&&relentsz&&relptr))continue;
        for(int j=0;j<relsz/relentsz;j++){
            fill_reloc(relptr+j*relentsz,mod-modules);
        }
        relsz=relentsz=relptr=0;

    }
    if(init)
    {
        //调用模块入口函数
        for(int i=0;i<init_arraysz;i++){
            (init[i])();
        }
    }
    mfree(&ehdr);
    return 0;
}
off_t get_sym_addr(unsigned long modid,unsigned long symi){
    struct Elf64_Sym *sym=modules[modid].p_symbol;
    sym+=symi;
    if(sym->st_shndx==SHN_COMMON){
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束

    }

    off_t symaddr=sym->st_value+modules[modid].load_offset;
    if(modules[modid].type==ET_DYN){
        //还要加上节地址
        Elf64_Ehdr* ehdr=modules[modid].header;
        struct Elf64_Shdr* shdr=ehdr->e_shoff;
        symaddr+=shdr[sym->st_shndx].sh_addr;
    }
    return symaddr;
}
off_t get_sym_plt(unsigned long modid,unsigned long symi){

}
off_t get_load_base(unsigned long modid){
    return modules[modid].base;
}
off_t get_got(unsigned long modid){
    return modules[modid].p_got;
}
void dl_runtime_resolve(){
    //获取modid
    unsigned long modid,rel_offset;
    asm volatile("push %%rax\n mov 8(%%rsp),%%rax\n mov %%rax,%0":"=m"(modid));
    asm volatile("push %%rax\n mov 16(%%rsp),%%rax\n mov %%rax,%0":"=m"(rel_offset));
    Elf64_Rel* rel=rel_offset;
    int symi=ELF64_R_SYM(rel->r_info),type=ELF64_R_TYPE(rel->r_info);
    off_t sym_off=get_sym_addr(modid,symi);
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel=rel->r_offset;
    switch (type)
    {
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT:
        *v_rel=sym_off;
        break;
    case R_X86_64_PLT32:
        *v_rel=get_sym_plt(modid,symi);
        break;
    case R_X86_64_RELATIVE:
        *v_rel+=get_load_base(modid);
        break;
    case R_X86_64_GOTOFF:
        *v_rel+=sym_off-get_got(modid);
        break;
    case R_X86_64_GOTPC:
        *v_rel+=get_got(modid)-rel_offset;
        break;
    case R_X86_64_GOT32:
    //这一项,rel里面指向的符号的地址就是got
        *v_rel+=sym_off;
    default:
        break;
    }
    //重定位完毕，直接返回到目标地址

    asm volatile("mov %0,%%rax\n mov %%rax,0(%%rsp)"::"m"(*v_rel));
}