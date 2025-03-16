/**
    @file
   elf映像文件加载模块。它是作为内核的必须部分编译进去的，因为内核需要提前准备至少一种可执行文件格式。
 */
#include "elfbin.h"
#include "elf.h"
#include "memman.h"
#include "vfs.h"
#include "log.h"
#include "memory.h"
#include "mem.h"
exec_format* elf_format;
/**
    @brief 加载obj类型文件。
 */
int  elf_load_obj(struct file* fp, exec_image* image);
void fill_reloc(void* relp, struct Elf64_Shdr* shdrs, Elf64_Ehdr* ehdr, int symtabi,
                exec_image* img, int rel_shndx, int rela);
int  elf_binload_init()
{
    //注册文件格式
    if ((elf_format = register_binary(elf_load_bin, elf_get_header_info)) == NULL) {
        return -1;
    }
    return 0;
}
int elf_load_bin(struct file* fp, int type, exec_image* image)
{
    int vret = -1;
    switch (type) {
    case BIN_TYPE_OBJ: vret = elf_load_obj(fp, image); break;
    }
    return vret;
}
int elf_load_obj(struct file* fp, exec_image* image)
{
    // 读取文件头
    struct file*       elf         = fp;
    struct file*       elf_storage = elf;
    int                vret        = 0;
    unsigned long long entry       = 0;
ready:
    //读取文件头
    kread(elf, 0, sizeof(Elf64_Ehdr), image->base);

    Elf64_Ehdr*        ehdr = (Elf64_Ehdr*)image->base;
    unsigned short     entn = ehdr->e_shnum;
    unsigned short     ents = ehdr->e_shentsize;
    unsigned long long shla =
        (unsigned long long)kmalloc(ehdr->e_shnum * ehdr->e_shentsize, NO_ALIGN);
    kread(fp, ehdr->e_shoff, ehdr->e_shnum * ehdr->e_shentsize, (char*)shla);
    struct Elf64_Shdr* sh         = (struct Elf64_Shdr*)(shla);
    int                reloc_flag = 0;

    unsigned long long load_ptr      = image->base + sizeof(Elf64_Ehdr);
    size_t             symtabsz      = 0;
    int                symtabndx[12] = {0};
    int                tmpptr        = 0;
    size_t             loadsz        = 0;   //实际加载占用内存
    int                bss           = 0;
    //加载节
    for (int i = 0; i < entn; i++) {
        //加载节
        if ((sh[i].sh_flags & SHF_ALLOC) || sh[i].sh_type == SHT_SYMTAB ||
            sh[i].sh_type == SHT_DYNSYM || sh[i].sh_type == SHT_STRTAB ||
            sh[i].sh_type == SHT_REL || sh[i].sh_type == SHT_RELA) {
            unsigned long off = sh[i].sh_offset;
            size_t        ms  = sh[i].sh_size;
            if (sh[i].sh_type != SHT_NOBITS) {
                kread(fp, off, ms, (char*)load_ptr);
            }
            else {
                memset(load_ptr, 0, sh[i].sh_size);
                if (!bss) {
                    bss = i;
                }
            }
            //填好信息
            debug_log("loading section %d,type=%d,size=%llx, at %llx\n",
                      i,
                      sh[i].sh_type,
                      sh[i].sh_size,
                      load_ptr);
            sh[i].sh_addr = load_ptr;
            load_ptr += sh[i].sh_size;
            loadsz += sh[i].sh_size;
        }
        if (sh[i].sh_type == SHT_SYMTAB || sh[i].sh_type == SHT_DYNSYM) {
            symtabsz += sh[i].sh_size / sh[i].sh_entsize;
            symtabndx[tmpptr++] = i;
        }
    }
    debug_log("loading taking %llx bytes.\n", loadsz);
    //构建符号表
    //分配还没分配的符号SHN_COMMON
    // bss节这些还没有分配，要自己计算出来
    image->symtab        = kmalloc(symtabsz + 1 * sizeof(exec_symbol), NO_ALIGN);
    exec_symbol* symp    = image->symtab;
    size_t       toalloc = 0;
    image->nr_sym        = 0;
#define ALIGN(a, b) ((a) + (b) - (a) % (b))
    for (int i = 0; i < tmpptr; i++) {
        struct Elf64_Sym* elfsym = sh[symtabndx[i]].sh_addr;
        debug_log("symtab section now at %p\n", elfsym);
        for (int j = 1; j < sh[symtabndx[i]].sh_size / sh[symtabndx[i]].sh_entsize; j++) {

            if (elfsym[j].st_shndx == SHN_COMMON) {
                //待分配的符号
                elfsym[j].st_shndx = bss;
                toalloc            = ALIGN(toalloc, elfsym[j].st_value);
                elfsym[j].st_value = toalloc;
                debug_log("met SHN_COMMON sym, allocing it to %llx at sec %d\n", toalloc, bss);
                toalloc += elfsym[j].st_size;
            }

            symp->addr = elfsym[j].st_value;
            if (elfsym[j].st_shndx < 0xfff0) {
                symp->addr += sh[elfsym[j].st_shndx].sh_addr;
            }
            // elfsym[j].st_value = symp->addr;
            symp->name  = sh[sh[symtabndx[i]].sh_link].sh_addr + elfsym[j].st_name;
            symp->flags = elfsym[j].st_info;
            debug_log(
                "symbol %d:addr=%llx,name=%p,flags=%x\n", j, symp->addr, symp->name, symp->flags);
            symp++;
            image->nr_sym++;
        }
    }
    symp->flags = 0;   //最后一个NULL结尾
    //进行符号链接
    for (int i = 0; i < entn; i++) {
        //只有分配了的节才需要重定位
        if (sh[i].sh_type == SHT_REL && sh[sh[i].sh_info].sh_flags & SHF_ALLOC) {
            //重定位
            Elf64_Rel* rel = sh[i].sh_addr;
            for (int j = 0; j < sh[i].sh_size / sh[i].sh_entsize; j++) {
                fill_reloc(&rel[j], sh, ehdr, sh[i].sh_link, image, i, 0);
            }
        }
        else if (sh[i].sh_type == SHT_RELA && sh[sh[i].sh_info].sh_flags & SHF_ALLOC) {
            Elf64_Rela* rela = sh[i].sh_addr;
            for (int j = 0; j < sh[i].sh_size / sh[i].sh_entsize; j++) {
                fill_reloc(&rela[j], sh, ehdr, sh[i].sh_link, image, i, 1);
            }
        }
    }
tokfree:
    kfree(shla);
    entry = image->base + sizeof(Elf64_Ehdr) + ehdr->e_entry;
    return entry;
}
int elf_get_header_info(struct file* fp, exec_image* image)
{
    Elf64_Ehdr* ehdr = kmalloc(sizeof(Elf64_Ehdr), NO_ALIGN);
    int         vret = 0;
    if (kread(fp, 0, sizeof(Elf64_Ehdr), ehdr) < 0) {
        vret = -1;
        goto ret;
    }
    //比较magic
    char magic[16] = {0x7f, 0x45, 0x4c, 0x46, 0x2, 0x1, 0x1, 0};
    if (memcmp(ehdr->e_ident, magic, 16) != 0) {
        vret = -1;
        goto ret;
    }
    image->entry = ehdr->e_entry;
    image->memsz = 0;
    //获取加载基址
    switch (ehdr->e_type) {
    case ET_EXEC:
        image->type = BIN_TYPE_EXEC;
    calc_memsz:;
        size_t      phtotsz = ehdr->e_phentsize * ehdr->e_phnum;
        Elf64_Phdr* phs     = kmalloc(phtotsz, NO_ALIGN);
        if (kread(fp, ehdr->e_phoff, phtotsz, phs) < 0) {
            kfree(phs);
            vret = -1;
            goto ret;
        }
        unsigned long long lowest = -1;
        for (int i = 0; i < ehdr->e_phnum; i++) {
            if (phs[i].p_type == PT_LOAD) {
                image->memsz += phs[i].p_memsz;
                if (phs[i].p_vaddr < lowest) {
                    lowest = phs[i].p_vaddr;
                }
            }
        }
        image->base = lowest;
        kfree(phs);
        break;
    case ET_DYN:
        image->type = BIN_TYPE_DYN;
        image->base = 0;
        goto calc_memsz;
        break;
    case ET_REL:
        image->type = BIN_TYPE_OBJ;
        image->base = 0;
        //根据shdr计算大小
        size_t             shtotsz = ehdr->e_shentsize * ehdr->e_shnum;
        struct Elf64_Shdr* shs     = kmalloc(shtotsz, NO_ALIGN);
        if (kread(fp, ehdr->e_shoff, shtotsz, shs) < 0) {
            kfree(shs);
            vret = -1;
            goto ret;
        }
        int                symtabndx[12] = {0};
        int                ptr           = 0;
        unsigned long long bss           = 0;
        for (int i = 0; i < ehdr->e_shnum; i++) {
            if (shs[i].sh_flags & SHF_ALLOC || shs[i].sh_type == SHT_SYMTAB ||
                shs[i].sh_type == SHT_DYNSYM || shs[i].sh_type == SHT_STRTAB ||
                shs[i].sh_type == SHT_REL || shs[i].sh_type == SHT_RELA) {
                image->memsz += shs[i].sh_size;
            }
            if (shs[i].sh_type == SHT_SYMTAB || shs[i].sh_type == SHT_DYNSYM) {
                symtabndx[ptr++] = i;
            }
            else if (shs[i].sh_type == SHT_NOBITS && !bss) {
                bss = i;
            }
        }
        // bss节这些还没有分配，要自己计算出来
        size_t toalloc = 0;
#define ALIGN(a, b) ((a) + (b) - (a) % (b))
        for (int i = 0; i < ptr; i++) {
            struct Elf64_Sym* sym = kmalloc(shs[symtabndx[i]].sh_size, NO_ALIGN);
            kread(fp, shs[symtabndx[i]].sh_offset, shs[symtabndx[i]].sh_size, sym);
            for (int j = 0; j < shs[symtabndx[i]].sh_size / shs[symtabndx[i]].sh_entsize; j++) {
                if (sym[j].st_shndx == SHN_COMMON) {
                    //待分配的符号
                    sym[j].st_shndx = bss;
                    toalloc         = ALIGN(toalloc, sym[j].st_value);
                    sym[j].st_value = toalloc;
                    // debug_log("met SHN_COMMON sym, allocing it to %llx at sec %d\n", toalloc,
                    // bss);
                    toalloc += sym[j].st_size;
                }
            }
        }

        image->memsz += sizeof(Elf64_Ehdr) + toalloc;
        kfree(shs);

        break;
    }
    debug_log("calced tot taking 0x%llx bytes.\n", image->memsz);
ret:
    kfree(ehdr);
    return vret;
}

// obj模块文件的获取符号地址函数。
unsigned long long get_sym_addr_mod(struct Elf64_Sym* sym, unsigned long symi,
                                    struct Elf64_Shdr* sh, char* strtab)
{
    sym += symi;
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号
        return 0;
    }
    unsigned long long symaddr = 0;
    if (sym->st_shndx != SHN_UNDEF)
        symaddr = sym->st_value + sh[sym->st_shndx].sh_addr;
    else {
        //不在本模块，在内核符号表中寻找
        char* target_name = strtab + sym->st_name;
        return get_kernel_symbol(target_name);
    }
    return symaddr;
}
//填充重定位项
void fill_reloc(void* relp, struct Elf64_Shdr* shdrs, Elf64_Ehdr* ehdr, int symtabi,
                exec_image* img, int rel_shndx, int rela)
{
    Elf64_Rela*        rel  = relp;
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    unsigned long long sym_off = get_sym_addr_mod(
        shdrs[symtabi].sh_addr, symi, shdrs, shdrs[shdrs[symtabi].sh_link].sh_addr);
    unsigned long long load_base = img->base + sizeof(Elf64_Ehdr);
    if (ehdr->e_type == ET_REL) {
        //可重定位文件offset计算方式有所不同
        //获取重定位指向的节
        int shndx = shdrs[rel_shndx].sh_info;
        load_base = shdrs[shndx].sh_addr;
    }
    unsigned long long got = img->info;
    unsigned long long plt = img->info;   //未使用，未完成这部分
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel    = rel->r_offset + load_base;
    unsigned long long  addend   = rela ? rel->r_addend : *v_rel;
    unsigned int        addend32 = rela ? rel->r_addend : (unsigned int)*v_rel;
    switch (type) {
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    case R_X86_64_RELATIVE: *v_rel = addend + load_base; break;
    case R_X86_64_32: *(unsigned int*)v_rel = sym_off + addend32; break;
    case R_X86_64_GOTPC32:
        *(unsigned int*)v_rel = got + addend32 - (unsigned long long)v_rel;
        break;
    case R_X86_64_32S: *v_rel = (long long)(int)sym_off + addend; break;
    case R_X86_64_64: *v_rel = addend + sym_off; break;
    case R_X86_64_PC32:
        *(unsigned int*)v_rel = addend32 + sym_off - (unsigned long long)v_rel - 4;
        break;   // S+A-P
    case R_X86_64_GOTPC64: *v_rel = got + addend - rel->r_offset; break;
    case R_X86_64_GOTOFF64:   // S +A -GOT
        *v_rel = sym_off + addend - got;
        break;
    case R_X86_64_PLTOFF64:   // S +A -PLT
        *v_rel = sym_off + addend - plt;
        break;


    default: break;
    }
    // comprintf("sym %d after reloc: %x\n", symi, *v_rel);
}