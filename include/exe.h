#pragma once

#include <sys/types.h>
#define MODULE_TYPE_EXE 0
#define MODULE_TYPE_DLL 1
#define MAX_MODULES 128
/// @brief 存储模块的信息。要注意的是，这里的mod id是数组下标，里面填写的信息
///地址则是虚拟地址，所以进程使用别的进程的module里面的信息去访问地址是没有用的。
typedef struct
{
    off_t         base;
    off_t         load_offset;
    off_t         header;
    unsigned long type;
    off_t         p_dynamic;
    off_t         p_symbol;
    off_t         p_got;
    off_t         p_shdrs;
    off_t         p_strtab;
    size_t        s_symtabsz;
    off_t         p_reloc;
    size_t        s_relentsz;
} module;
/*
 * 运行文件，成为独立进程。
 *
 * */
int execute(char* path, char** argv);
//从新文件加载程序代替现有进程的程序映像。
int do_execve(char* path, char** argv, char** environ, int argc, int environc);
int sys_execve(char* path, char** argv, char** environ);
/*
 * 立即调用一个程序（会阻塞当前进程）
 * */
int exec_call(char* path);
/*
加载dll，必须在目标进程的tss下使用，因为该函数直接使用线性地址。
*/
int load_library(char* path);
int dispose_library(int dlln);

// int req_page_at(int base,int pgn);
//查看指定区域的页内存是否可用
int check_pgm(int base, int pgn);
//返回page的物理地址
// int req_a_page();


int get_module_addr(int mi);
int use_pgm_ava(int nbase, int page_count);
int lookup_pgind(int vma, int* pgind);


int load_pe(struct process* proc);
/*
加载elf可执行文件。
当elf没有依赖动态库的时候，返回elf的入口地址；当有的时候，则返回0；加载失败返回-1。
*/
off_t load_elf(int fildes);

int proc_start();

// int sys_read();
///动态链接器的延迟绑定函数。
/// 2个参数存放在栈内，但是64位gcc这个数量的参数是放在寄存器里面的，
///所以需要自己从栈中拿取。但还是要说明这些“参数”：
///@param rel_entry_offset(rsp+16) 所需要的重定位表项偏移，包含需要重定位的地方的信息。
///@param module_id(rsp+8) 模块id，表示是哪个模块需要重定位。
void dl_runtime_resolve();
/// @brief 获取模块编号。
/// @param
/// @return
id_t get_modid(void);


// off_t get_sym_addr(unsigned long modid, unsigned long symi, struct Elf64_Shdr* shdrs);
// off_t get_sym_plt(unsigned long modid, unsigned long symi);
// off_t get_load_base(unsigned long modid);
// off_t get_got(unsigned long modid);
//模块管理
int sys_insmod(char* path);
int sys_rmmod(char* name);
