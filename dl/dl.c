#include "dl.h"
#include <sys/unistd.h>
#include <syscall.h>
#include <elf.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <exe.h>
#include <errno.h>
#include "memory.h"

extern char _DYNAMIC[];
extern char _GLOBAL_OFFSET_TABLE_[];
void*       symtabs[MAX_SYMTABS] = {0};
module      modules[MAX_MODULES];
int         dlid;
id_t        get_modid(void)
{
    static id_t modid_d = 0;
    return modid_d++;
}
int dlmain(int fno, void* load_offset, int argc, char** argv, char** environ)
{
    //完成自我重定位（自举）
    dlid = dl_init(load_offset);

    //加载elf文件
    //读取文件头

    //递归加载elf和so
    off_t entry = load_elfso(fno);
    close(fno);
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    main(argc, argv, environ);
    return 0;
}
int load_elfso_old(int fno)
{
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));

    unsigned short entn = ehdr.e_phnum;
    unsigned short ents = ehdr.e_phentsize;
    module*        mod  = 0;
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
        if (modules[i].type == ET_NONE) {
            modules[i].type        = ehdr.e_type;
            modules[i].load_offset = 0;
            modules[i].base        = 0;
            mod                    = modules + i;
            break;
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    seek(fno, ehdr.e_phoff, SEEK_SET);
    read(fno, ph, entn * ents);
    size_t tot_sz = 0;
    off_t  base = ph->p_vaddr, offset = 0;
    int (**init)() = 0, init_arraysz = 0;

    for (int i = 0; i < entn; i++) {
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
            unsigned long fs   = ph->p_filesz;
            size_t        ms   = ph->p_memsz;
            char*         vptr = (char*)ph->p_vaddr + offset;
            if (off == 0) {
                mod->header = vptr;
            }
            //先映射好内存
            int prot = PROT_READ;
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
            int flags = MAP_PRIVATE;
            if (ehdr.e_type == ET_EXEC)
                flags |= MAP_FIXED;
            mmap(vptr, fs, prot, flags, fno, off);
        }
        ph++;
    }

    Elf64_Dyn* dynamic = 0;
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    mod->p_shdrs = shdr;
    for (int i = 0; i < ehdr.e_shnum; i++) {
        if (shdr[i].sh_type == SHT_DYNAMIC) {
            dynamic = shdr + i;
            break;
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    off_t* got    = 0;
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
        if (p->d_tag == DT_STRTAB) {
            dynstr = p->d_un.d_ptr + offset;
            break;
        }
    }

    size_t relsz = 0, relentsz = 0;
    off_t  relptr = 0;
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
        switch (p->d_tag) {
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
            int   so_fno   = open(pathname, O_EXEC);
            //不查错了
            load_elfso(open(pathname, O_EXEC));
            close(so_fno);

            break;
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
            //填入模块id
            got[1]     = mod - modules;
            mod->p_got = got;
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
        default: break;
        }
        continue;
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
        }
        relsz = relentsz = relptr = 0;
    }
    if (init) {
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
            (init[i])();
        }
    }
    free(&ehdr);
    return 0;
}
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    off_t          entry = ehdr.e_entry;
    unsigned short entn  = ehdr.e_phnum;
    unsigned short ents  = ehdr.e_phentsize;
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    Elf64_Phdr*        ph = malloc(entn * ents);
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    read(fildes, ph, entn * ents);
    size_t tot_sz = 0;
    off_t  base = ph->p_vaddr, offset = 0;
    int    reloc_flag = 0;
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
        reloc_flag = 1;
        for (int i = 0; i < ehdr.e_phnum; i++) {
            tot_sz += ph[i].p_memsz;
            if (ph[i].p_vaddr < base)
                base = ph[i].p_vaddr;
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
            off_t new_base = base + 4096;
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
                new_base += 4096;
            }
            if (new_base >= KNL_BASE) {
                return -ENOMEM;
            }
            offset = new_base - base;
        }
    }


    module* mod   = 0;
    int     elfid = reg_module();
    mod           = modules + elfid;
    //找dynamic段
    struct Elf64_Shdr* dynamic = 0;
    off_t*             got     = 0;

    for (int i = 0; i < ehdr.e_shnum; i++) {
        if (sh[i].sh_type == SHT_DYNSYM) {
            mod->s_symtabsz = sh[i].sh_size;
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
            dynamic = sh + i;
            break;
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    for (int i = 0; i < entn; i++) {
        //加载段
        if (ph->p_type == PT_LOAD) {
            unsigned long off  = ph->p_offset;
            unsigned long fs   = ph->p_filesz;
            size_t        ms   = ph->p_memsz;
            char*         vptr = (char*)ph->p_vaddr + offset;
            if (max_allocated < vptr + ms)
                max_allocated = vptr + ms;
            if (off == 0) {
                mod->header = vptr;
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
            if ((ph->p_flags & PF_W))
                attr |= PROT_WRITE;
            if ((ph->p_flags & PF_X)) {
                attr |= PROT_EXEC;
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
                return -1;   //加载失败
        }
        ph++;
    }
    if (dynamic) {
        void*      needed_nameoff[32];
        int        t_needed = 0;
        char*      dynstr   = 0;
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
        size_t     relsz = 0, relentsz = 0;
        size_t     relasz = 0, relaentsz = 0;
        size_t     jmprelsz = 0, jmprelaentsz = 0;
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
        int        pltrel = 0, bind_now = 0;
        int (*init)()     = 0;
        size_t init_arrsz = 0;
        mod->p_dynamic    = dynamic;
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
            if (p->d_tag == DT_STRTAB) {
                dynstr        = p->d_un.d_ptr + offset;
                mod->p_strtab = dynstr;
                break;
            }
        }
        if (!dynstr) {
            return -1;
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
            switch (p->d_tag) {
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
                break;
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
                //填入模块id
                got[1]     = mod - modules;
                mod->p_got = got;
                break;
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
            case DT_RELSZ: relsz = p->d_un.d_val; break;
            case DT_RELASZ: relasz = p->d_un.d_val; break;
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
            case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
            case DT_REL: relptr = p->d_un.d_ptr; break;
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
            case DT_RELENT: relentsz = p->d_un.d_val; break;
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
            case DT_BIND_NOW: bind_now = 1; break;
            default: break;
            }
        }
        for (int i = 0; i < t_needed; i++) {
            char* pathname = 0;
            int   so_fno   = 0;
            pathname       = (off_t)dynstr + (off_t)needed_nameoff[i];
            so_fno         = open(pathname, O_EXEC);
            load_elfso(so_fno);
            close(so_fno);
        }
        if (relptr && relentsz && relsz)   // REL
            for (int j = 0; j < relsz / relentsz; j++)
                fill_reloc(relptr + offset + j * relentsz, offset, mod->p_symbol, 0);
        if (relaptr && relaentsz && relasz)   // RELA
            for (int j = 0; j < relasz / relaentsz; j++)
                fill_reloc(relaptr + offset + j * relaentsz, offset, mod->p_symbol, 1);
        if (pltrel == DT_REL)
            jmprelaentsz = relentsz, pltrel = 0;
        else
            jmprelaentsz = relaentsz, pltrel = 1;
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, offset, mod->p_symbol, pltrel);
        if (init) {
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
                (init + i * 8)();
            }
        }
    }

    return entry;
}
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    sym += symi;
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
        symaddr = sym->st_value + modules[modid].load_offset;
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
        for (int i = 0; i < MAX_MODULES; i++) {
            if (modules[i].type == ET_NONE || i == modid)
                continue;
            sym = modules[i].p_symbol;
            if (!sym)
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
                //获取符号名称
                if (!sym[j].st_name)
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
                    return modules[i].load_offset + sym[j].st_value;
                }
            }
        }
    }
    return symaddr;
}
int dlstrcmp(char* src, char* dst)
{
    while (*src++ && *dst++) {
        if (*src != *dst) {
            return *src - *dst;
        }
    }
    return 0;
}
off_t get_load_base(unsigned long modid)
{
    return modules[modid].base;
}
off_t get_got(unsigned long modid)
{
    return modules[modid].p_got;
}
static void dl_runtime_resolve()
{
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    Elf64_Rel* rel     = rel_offset * modules[modid].s_relentsz + modules[modid].p_reloc;
    int        symi    = ELF64_R_SYM(rel->r_info);
    off_t      sym_off = get_sym_addr(modid, symi);
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset;
    *v_rel       = sym_off;

    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n jmp *%%rax\n" ::"m"(sym_off));
}

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    Elf64_Rela* rel  = relp;
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    off_t       sym_off   = get_sym_addr(modid, symi);
    off_t       load_base = get_load_base(modid);
    off_t       got       = get_got(modid);
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    switch (type) {
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    case R_X86_64_RELATIVE:
        if (rela)
            *v_rel = rel->r_addend + load_base;
        else
            *v_rel += load_base;
        break;
    case R_X86_64_GOTPC:
        if (rela)
            *v_rel = got + rel->r_addend - rel->r_offset;
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
            *v_rel += sym_off;
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    case R_X86_64_PC32:
        if (rela)
            *v_rel += sym_off - rel->r_offset;
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    default: break;
    }
}
void set_symtab(void* symtab, int modid)
{
    if (modid >= MAX_SYMTABS)
        return;
    symtabs[modid] = symtab;
}

static int reg_module()
{
    int i = 0;
    for (; i < MAX_MODULES; i++) {
        if (modules[i].type = ET_NONE) {
            return i;
        }
    }
    return -1;
}
static int dl_init(void* load_offset)
{
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    struct Elf64_Sym* sym  = 0;

    size_t              relsz = 0, relentsz = 0;
    size_t              relasz = 0, relaentsz = 0;
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    int                 pltrel = 0;
    unsigned long long* got    = 0;

    int bind_now = 0;
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
        char* pathname = 0;
        int   so_fno   = 0;
        switch (p->d_tag) {
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
            got[2] = dl_runtime_resolve;
            //填入模块id
            got[1] = 0;
            break;
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
        case DT_RELSZ: relsz = p->d_un.d_val; break;
        case DT_RELASZ: relasz = p->d_un.d_val; break;
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
        case DT_REL: relptr = p->d_un.d_ptr; break;
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
        case DT_RELENT: relentsz = p->d_un.d_val; break;
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
        case DT_BIND_NOW: bind_now = 1; break;
        default: break;
        }
    }
    if (relptr && relentsz && relsz)   // REL
        for (int j = 0; j < relsz / relentsz; j++)
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    if (relaptr && relaentsz && relasz)   // RELA
        for (int j = 0; j < relasz / relaentsz; j++)
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    if (pltrel == DT_REL)
        jmprelaentsz = relentsz, pltrel = 0;
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
            init_fill_reloc(
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
        modules[i].type = ET_NONE;
    }
    modules[0].p_symbol    = sym;
    modules[0].load_offset = load_offset;
    modules[0].base        = load_offset;
    modules[0].p_dynamic   = dyn;
    modules[0].p_got       = got;
    modules[0].type        = ET_DYN;
    modules[0].header      = load_offset;
    modules[0].p_reloc     = jmprelptr;
    modules[0].s_relentsz  = jmprelaentsz;
    return 0;
}
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    unsigned long long got  = igot + load_base;
    Elf64_Rela*        rel  = relp;
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    if (!sym_off) {
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    switch (type) {
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    case R_X86_64_RELATIVE:
        if (rela)
            *v_rel = rel->r_addend + load_base;
        else
            *v_rel += load_base;
        break;
    case R_X86_64_GOTPC:
        if (rela)
            *v_rel = got + rel->r_addend - rel->r_offset;
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
            *v_rel += sym_off;
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    case R_X86_64_PC32:
        if (rela)
            *v_rel += sym_off - rel->r_offset;
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    default: break;
    }
}