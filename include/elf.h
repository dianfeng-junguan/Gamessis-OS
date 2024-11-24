//
// Created by Oniar_Pie on 2024/5/3.
//

#ifndef GMS_KNL_ELF_H
#define GMS_KNL_ELF_H
#pragma pack(1)
typedef unsigned int Elf32_Addr,Elf32_Off,Elf32_Word;
typedef unsigned short Elf32_Half;
#define R_X86_64_PLT32 4
#define R_X86_64_32 10
#define R_X86_64_32S 11
#define R_X86_64_64 1
#define R_X86_64_PC32 2
#define R_X86_64_RELATIVE 8
#define R_X86_64_GLOB_DAT 6
#define R_X86_64_JUMP_SLOT 7
#define R_X86_64_GOTOFF 9
#define R_X86_64_GOTPC 10
#define R_X86_64_GOT32 3
#define EI_NIDENT 16
/* These constants define the different elf file types */
#define ET_NONE   0
#define ET_REL    1
#define ET_EXEC   2
#define ET_DYN    3
#define ET_CORE   4

/* sh_type */
#define SHT_NULL	0
#define SHT_PROGBITS	1
#define SHT_SYMTAB	2
#define SHT_STRTAB	3
#define SHT_RELA	4
#define SHT_HASH	5
#define SHT_DYNAMIC	6
#define SHT_NOTE	7
#define SHT_NOBITS	8
#define SHT_REL		9
#define SHT_SHLIB	10
#define SHT_DYNSYM	11
#define SHT_NUM		12
#define SHT_LOPROC	0x70000000
#define SHT_HIPROC	0x7fffffff
#define SHT_LOUSER	0x80000000
#define SHT_HIUSER	0xffffffff

#define SHN_COMMON 0xfff2
/* sh_flags */
#define SHF_WRITE	0x1
#define SHF_ALLOC	0x2
#define SHF_EXECINSTR	0x4
#define SHF_MASKPROC	0xf0000000
typedef unsigned long long Elf64_Addr,Elf64_Off;
typedef unsigned long Elf64_Xword;
typedef unsigned int Elf64_Word;
typedef unsigned short Elf64_Half;

#define EI_NIDENT 16

typedef struct {
    unsigned char e_ident[EI_NIDENT];  // 最开头是16个字节的e_ident, 其中包含用以表示ELF文件的字符，以及其他一些与机器无关的信息。开头的4个字节值固定不变，为0x7f和ELF三个字符。
    unsigned short      e_type;  // 该文件的类型 2字节
    unsigned short      e_machine;  // 该程序需要的体系架构 2字节
    unsigned int      e_version;  // 文件的版本 4字节
    Elf64_Addr   e_entry;  // 程序的入口地址 8字节
    Elf64_Off      e_phoff;  // Program header table 在文件中的偏移量 8字节
    Elf64_Off      e_shoff;  // Section header table 在文件中的偏移量 8字节
    unsigned int      e_flags;  // 对IA32而言，此项为0。 4字节
    unsigned short      e_ehsize;  // 表示ELF header大小 2字节
    unsigned short      e_phentsize;  // 表示Program header table中每一个条目的大小 2字节
    unsigned short      e_phnum;  // 表示Program header table中有多少个条目 2字节
    unsigned short      e_shentsize;  // 表示Section header table中的每一个条目的大小 2字节
    unsigned short      e_shnum;  // 表示Section header table中有多少个条目 2字节
    unsigned short      e_shstrndx;  // 包含节名称的字符串是第几个节 2字节
} Elf64_Ehdr;
typedef struct elf32_hdr{
    unsigned char	e_ident[EI_NIDENT /* 16 */];  /* ELF魔法数字 Magic */
    Elf32_Half/* unsigned short */	 e_type;     /* ELF文件类型 */
    Elf32_Half/* unsigned short */	 e_machine;  /* ELF文件的CPU平台属性，相关常量以EM_开头 */
    Elf32_Word/* unsigned int */	   	e_version;  /* ELF版本号，一般为常数 1 */
    Elf32_Addr/* unsigned int */	   e_entry;    /* ELF程序的入口地址，可重定位文件一般无入口地址设置为0 */
    Elf32_Off /* unsigned int */	   e_phoff;    /* 程序表 */
    Elf32_Off /* unsigned int */	   e_shoff;    /* 段表在文件中的偏移，也就是段表从文件的第e_shoff+1个字节开始 */
    Elf32_Word/* unsigned int */	   e_flags;    /* ELF标志位*/
    Elf32_Half/* unsigned short */	 e_ehsize;   /* ELF文件头本身大小 */
    Elf32_Half/* unsigned short */	 e_phentsize;/*  */
    Elf32_Half/* unsigned short */	 e_phnum;    /*  */
    Elf32_Half/* unsigned short */	 e_shentsize;/* 段表描述符的大小，等于 sizeof Elf32_Shdr */
    Elf32_Half/* unsigned short */	 e_shnum;    /* 段表描述符的数量，等于ELF文件中拥有段的数量 */
    Elf32_Half/* unsigned short */	 e_shstrndx; /* 段表字符串表 所在的段 在段表中的下标 */
} Elf32_Ehdr;
struct Elf32_Shdr              //共40个字节    //Shdl表示Section header
{
    Elf32_Word sh_name;        //所指向Section的名字，如".text"、".data"、".bss"等
    Elf32_Word sh_type;        //所指向Section的类型，如：符号表、字符串表等
    Elf32_Word sh_flags;
    Elf32_Addr sh_addr;
    Elf32_Off sh_offset;       //所指向Section在ELF文件中的偏移量
    Elf32_Word sh_size;        //所指向Section的size
    Elf32_Word sh_link;        //和其关联的Section头的下标索引
    Elf32_Word sh_info;
    Elf32_Word sh_addralign;   //字节对齐
    Elf32_Word sh_entsize;
};
struct Elf64_Shdr              //共40个字节    //Shdl表示Section header
{
    Elf64_Word sh_name;        //所指向Section的名字，如".text"、".data"、".bss"等
    Elf64_Word sh_type;        //所指向Section的类型，如：符号表、字符串表等
    Elf64_Word sh_flags;
    Elf64_Addr sh_addr;
    Elf64_Off sh_offset;       //所指向Section在ELF文件中的偏移量
    Elf64_Word sh_size;        //所指向Section的size
    Elf64_Word sh_link;        //和其关联的Section头的下标索引
    Elf64_Word sh_info;
    Elf64_Word sh_addralign;   //字节对齐
    Elf64_Word sh_entsize;
};
struct Elf32_phdr            //32个字节    //phdr表示Program header
{
    Elf32_Word p_type;       //如PT_LOAD表示，对应Segment可被加载到内存中
    Elf32_Off p_offset;      //Segment在ELF文件中的偏移量
    Elf32_Addr p_vaddr;      //Segment映射到内存后的虚拟地址
    Elf32_Addr p_paddr;      //Segment映射到内存后的物理地址，此时与虚拟地址相同
    Elf32_Word p_filesz;     //Segment在ELF文件中占用的size
    Elf32_Word p_memsz;      //Segment映射到内存后占用的size
    Elf32_Word p_flage;      //读、写、执行权限
    Elf32_Word p_align;      //字节对齐，p_vaddr和p_paddr对p_align取模后为0
};
typedef struct elf64_phdr {
    Elf64_Word p_type;
    Elf64_Word p_flags;
    Elf64_Off p_offset;
    Elf64_Addr p_vaddr;
    Elf64_Addr p_paddr;
    Elf64_Xword p_filesz;
    Elf64_Xword p_memsz;
    Elf64_Xword p_align;
} Elf64_Phdr;
/* 
typedef struct {
        Elf32_Sword d_tag;
        union {
                Elf32_Word      d_val;
                Elf32_Addr      d_ptr;
                Elf32_Off       d_off;
        } d_un;
} Elf32_Dyn;//32位程序 */
#define DT_NULL 0
#define DT_NEEDED 1
#define DT_STRTAB 5
#define DT_FLAGS 30
#define DT_PLTGOT 3
#define DT_SYMTAB 6
#define DT_RELSZ 18
#define DT_RELASZ 8
#define DT_REL  17
#define DT_RELA 7
#define DT_RELENT 19
#define DT_RELAENT 9
#define ELF64_R_SYM(i)((i) >> 32)
#define ELF64_R_TYPE(i)((i) & 0xffffffffL)
#define ELF64_R_INFO(s, t)(((s) << 32) + ((t) & 0xffffffffL))
typedef struct {
        Elf64_Xword d_tag;
        union {
                Elf64_Xword     d_val;
                Elf64_Addr      d_ptr;
        } d_un;
} Elf64_Dyn;

struct Elf32_sym                //
{
    Elf32_Word st_name;         //符号的名字
    Elf32_Addr st_value;        //符号相对于其所在Section偏移的相对地址
    Elf32_Word st_size;         //符号的size
    unsigned char st_info;      //低四位表示符号的作用范围（全局或局部），高四位表示符号的类型（变量、函数等）
    unsigned char st_other;
    Elf32_Half st_shndx;        //该符号的值在哪个Section下存储
};
struct Elf64_Sym                //
{
    Elf64_Word st_name;         //符号的名字
    Elf64_Addr st_value;        //符号相对于其所在Section偏移的相对地址
    Elf64_Word st_size;         //符号的size
    unsigned char st_info;      //低四位表示符号的作用范围（全局或局部），高四位表示符号的类型（变量、函数等）
    unsigned char st_other;
    Elf64_Half st_shndx;        //该符号的值在哪个Section下存储
};
#define PT_NULL 0
#define PT_LOAD 1
#define PT_DYNAMIC 2
#define PT_INTERP 3
#define PT_NOTE 4
#define PT_SHLIB 5
#define PT_PHDR 6
#define PF_X 1
#define PF_W 2
#define PF_R 4
typedef struct
{
    Elf64_Addr  r_offset;       /* Address */
    Elf64_Word  r_info;         /* Relocation type and symbol index */
} Elf64_Rel;

typedef struct
{
    Elf64_Addr  r_offset;       /* Address */
    unsigned long long r_info;         /* Relocation type and symbol index */
    long long r_addend;       /* Addend */
} Elf64_Rela;
#define EM_NONE		  0	/* No machine */
#define EM_M32		  1	/* AT&T WE 32100 */
#define EM_SPARC	  2	/* SUN SPARC */
#define EM_386		  3	/* Intel 80386 */
#define EM_68K		  4	/* Motorola m68k family */
#define EM_88K		  5	/* Motorola m88k family */
#define EM_486		  6	/* Intel 80486 */
#define EM_860		  7	/* Intel 80860 */
#define EM_MIPS		  8	/* MIPS R3000 (officially, big-endian only) */
#define EM_S370		  9	/* IBM System/370 */
#define EM_MIPS_RS3_LE	 10	/* MIPS R3000 little-endian (Oct 4 1999 Draft) Deprecated */
#define EM_res011	 11	/* Reserved */
#define EM_res014	 14	/* Reserved */
#define EM_PARISC	 15	/* HPPA */
#define EM_res016	 16	/* Reserved */
#define EM_VPP550	 17	/* Fujitsu VPP500 */
#define EM_SPARC32PLUS	 18	/* Sun's "v8plus" */
#define EM_960		 19	/* Intel 80960 */
#define EM_PPC		 20	/* PowerPC */
#define EM_PPC64	 21	/* 64-bit PowerPC */
#define EM_S390		 22	/* IBM S/390 */
#define EM_SPU		 23	/* Sony/Toshiba/IBM SPU */
#define EM_res024	 24	/* Reserved */
#define EM_res035	 35	/* Reserved */
#define EM_V800		 36	/* NEC V800 series */
#define EM_FR20		 37	/* Fujitsu FR20 */
#define EM_RH32		 38	/* TRW RH32 */
#define EM_MCORE	 39	/* Motorola M*Core */ /* May also be taken by Fujitsu MMA */
#define EM_RCE		 39	/* Old name for MCore */
#define EM_ARM		 40	/* ARM */
#define EM_OLD_ALPHA	 41	/* Digital Alpha */
#define EM_SH		 42	/* Renesas (formerly Hitachi) / SuperH SH */
#define EM_SPARCV9	 43	/* SPARC v9 64-bit */
#define EM_TRICORE	 44	/* Siemens Tricore embedded processor */
#define EM_ARC		 45	/* ARC Cores */
#define EM_H8_300	 46	/* Renesas (formerly Hitachi) H8/300 */
#define EM_H8_300H	 47	/* Renesas (formerly Hitachi) H8/300H */
#define EM_H8S		 48	/* Renesas (formerly Hitachi) H8S */
#define EM_H8_500	 49	/* Renesas (formerly Hitachi) H8/500 */
#define EM_IA_64	 50	/* Intel IA-64 Processor */
#define EM_MIPS_X	 51	/* Stanford MIPS-X */
#define EM_COLDFIRE	 52	/* Motorola Coldfire */
#define EM_68HC12	 53	/* Motorola M68HC12 */
#define EM_MMA		 54	/* Fujitsu Multimedia Accelerator */
#define EM_PCP		 55	/* Siemens PCP */
#define EM_NCPU		 56	/* Sony nCPU embedded RISC processor */
#define EM_NDR1		 57	/* Denso NDR1 microprocessor */
#define EM_STARCORE	 58	/* Motorola Star*Core processor */
#define EM_ME16		 59	/* Toyota ME16 processor */
#define EM_ST100	 60	/* STMicroelectronics ST100 processor */
#define EM_TINYJ	 61	/* Advanced Logic Corp. TinyJ embedded processor */
#define EM_X86_64	 62	/* Advanced Micro Devices X86-64 processor */
#define EM_PDSP		 63	/* Sony DSP Processor */
#define EM_PDP10	 64	/* Digital Equipment Corp. PDP-10 */
#define EM_PDP11	 65	/* Digital Equipment Corp. PDP-11 */
#define EM_FX66		 66	/* Siemens FX66 microcontroller */
#define EM_ST9PLUS	 67	/* STMicroelectronics ST9+ 8/16 bit microcontroller */
#define EM_ST7		 68	/* STMicroelectronics ST7 8-bit microcontroller */
#define EM_68HC16	 69	/* Motorola MC68HC16 Microcontroller */
#define EM_68HC11	 70	/* Motorola MC68HC11 Microcontroller */
#define EM_68HC08	 71	/* Motorola MC68HC08 Microcontroller */
#define EM_68HC05	 72	/* Motorola MC68HC05 Microcontroller */
#define EM_SVX		 73	/* Silicon Graphics SVx */
#define EM_ST19		 74	/* STMicroelectronics ST19 8-bit cpu */
#define EM_VAX		 75	/* Digital VAX */
#define EM_CRIS		 76	/* Axis Communications 32-bit embedded processor */
#define EM_JAVELIN	 77	/* Infineon Technologies 32-bit embedded cpu */
#define EM_FIREPATH	 78	/* Element 14 64-bit DSP processor */
#define EM_ZSP		 79	/* LSI Logic's 16-bit DSP processor */
#define EM_MMIX		 80	/* Donald Knuth's educational 64-bit processor */
#define EM_HUANY	 81	/* Harvard's machine-independent format */
#define EM_PRISM	 82	/* SiTera Prism */
#define EM_AVR		 83	/* Atmel AVR 8-bit microcontroller */
#define EM_FR30		 84	/* Fujitsu FR30 */
#define EM_D10V		 85	/* Mitsubishi D10V */
#define EM_D30V		 86	/* Mitsubishi D30V */
#define EM_V850		 87	/* Renesas V850 (formerly NEC V850) */
#define EM_M32R		 88	/* Renesas M32R (formerly Mitsubishi M32R) */
#define EM_MN10300	 89	/* Matsushita MN10300 */
#define EM_MN10200	 90	/* Matsushita MN10200 */
#define EM_PJ		 91	/* picoJava */
#define EM_OPENRISC	 92	/* OpenRISC 32-bit embedded processor */
#define EM_ARC_A5	 93	/* ARC Cores Tangent-A5 */
#define EM_XTENSA	 94	/* Tensilica Xtensa Architecture */
#define EM_VIDEOCORE	 95	/* Alphamosaic VideoCore processor */
#define EM_TMM_GPP	 96	/* Thompson Multimedia General Purpose Processor */
#define EM_NS32K	 97	/* National Semiconductor 32000 series */
#define EM_TPC		 98	/* Tenor Network TPC processor */
#define EM_SNP1K	 99	/* Trebia SNP 1000 processor */
#define EM_ST200	100	/* STMicroelectronics ST200 microcontroller */
#define EM_IP2K		101	/* Ubicom IP2022 micro controller */
#define EM_MAX		102	/* MAX Processor */
#define EM_CR		103	/* National Semiconductor CompactRISC */
#define EM_F2MC16	104	/* Fujitsu F2MC16 */
#define EM_MSP430	105	/* TI msp430 micro controller */
#define EM_BLACKFIN	106	/* ADI Blackfin */
#define EM_SE_C33	107	/* S1C33 Family of Seiko Epson processors */
#define EM_SEP		108	/* Sharp embedded microprocessor */
#define EM_ARCA		109	/* Arca RISC Microprocessor */
#define EM_UNICORE	110	/* Microprocessor series from PKU-Unity Ltd. and MPRC of Peking University */
#define EM_EXCESS	111	/* eXcess: 16/32/64-bit configurable embedded CPU */
#define EM_DXP		112	/* Icera Semiconductor Inc. Deep Execution Processor */
#define EM_ALTERA_NIOS2	113	/* Altera Nios II soft-core processor */
#define EM_CRX		114	/* National Semiconductor CRX */
#define EM_XGATE	115	/* Motorola XGATE embedded processor */
#define EM_C166		116	/* Infineon C16x/XC16x processor */
#define EM_M16C		117	/* Renesas M16C series microprocessors */
#define EM_DSPIC30F	118	/* Microchip Technology dsPIC30F Digital Signal Controller */
#define EM_CE		119	/* Freescale Communication Engine RISC core */
#define EM_M32C		120	/* Renesas M32C series microprocessors */
#define EM_res121	121	/* Reserved */
#define EM_res130	130	/* Reserved */
#define EM_TSK3000	131	/* Altium TSK3000 core */
#define EM_RS08		132	/* Freescale RS08 embedded processor */
#define EM_res133	133	/* Reserved */
#define EM_ECOG2	134	/* Cyan Technology eCOG2 microprocessor */
#define EM_SCORE	135	/* Sunplus Score */
#define EM_SCORE7	135	/* Sunplus S+core7 RISC processor */
#define EM_DSP24	136	/* New Japan Radio (NJR) 24-bit DSP Processor */
#define EM_VIDEOCORE3	137	/* Broadcom VideoCore III processor */
#define EM_LATTICEMICO32 138	/* RISC processor for Lattice FPGA architecture */
#define EM_SE_C17	139	/* Seiko Epson C17 family */
#define EM_TI_C6000	140	/* Texas Instruments TMS320C6000 DSP family */
#define EM_TI_C2000	141	/* Texas Instruments TMS320C2000 DSP family */
#define EM_TI_C5500	142	/* Texas Instruments TMS320C55x DSP family */
#define EM_res143	143	/* Reserved */
#define EM_res159	159	/* Reserved */
#define EM_MMDSP_PLUS	160	/* STMicroelectronics 64bit VLIW Data Signal Processor */
#define EM_CYPRESS_M8C	161	/* Cypress M8C microprocessor */
#define EM_R32C		162	/* Renesas R32C series microprocessors */
#define EM_TRIMEDIA	163	/* NXP Semiconductors TriMedia architecture family */
#define EM_QDSP6	164	/* QUALCOMM DSP6 Processor */
#define EM_8051		165	/* Intel 8051 and variants */
#define EM_STXP7X	166	/* STMicroelectronics STxP7x family */
#define EM_NDS32	167	/* Andes Technology compact code size embedded RISC processor family */
#define EM_ECOG1	168	/* Cyan Technology eCOG1X family */
#define EM_ECOG1X	168	/* Cyan Technology eCOG1X family */
#define EM_MAXQ30	169	/* Dallas Semiconductor MAXQ30 Core Micro-controllers */
#define EM_XIMO16	170	/* New Japan Radio (NJR) 16-bit DSP Processor */
#define EM_MANIK	171	/* M2000 Reconfigurable RISC Microprocessor */
#define EM_CRAYNV2	172	/* Cray Inc. NV2 vector architecture */
#define EM_RX		173	/* Renesas RX family */
#define EM_METAG	174	/* Imagination Technologies Meta processor architecture */
#define EM_MCST_ELBRUS	175	/* MCST Elbrus general purpose hardware architecture */
#define EM_ECOG16	176	/* Cyan Technology eCOG16 family */
#define EM_CR16		177	/* National Semiconductor CompactRISC 16-bit processor */
#define EM_ETPU		178	/* Freescale Extended Time Processing Unit */
#define EM_SLE9X	179	/* Infineon Technologies SLE9X core */
#define EM_L1OM		180	/* Intel L1OM */
#define EM_K1OM		181	/* Intel K1OM */
#define EM_INTEL182	182	/* Reserved by Intel */
#define EM_AARCH64	183	/* ARM 64-bit architecture */
#define EM_ARM184	184	/* Reserved by ARM */
#define EM_AVR32	185	/* Atmel Corporation 32-bit microprocessor family */
#define EM_STM8	186	/* STMicroeletronics STM8 8-bit microcontroller */
#define EM_TILE64	187	/* Tilera TILE64 multicore architecture family */
#define EM_TILEPRO	188	/* Tilera TILEPro multicore architecture family */
#define EM_MICROBLAZE	189	/* Xilinx MicroBlaze 32-bit RISC soft processor core */
#define EM_CUDA		190	/* NVIDIA CUDA architecture */
#define EM_TILEGX	191	/* Tilera TILE-Gx multicore architecture family */
#define EM_RL78		197	/* Renesas RL78 family.  */
#define EM_78K0R	199	/* Renesas 78K0R.  */
#define EM_INTEL205	205	/* Reserved by Intel */
#define EM_INTEL209	209	/* Reserved by Intel */



//可执行文件中Program头表是必须的，可重定向文件（.o）中Section头表是必须的，共享目标文件（.so）中两者都是必须的
#endif //GMS_KNL_ELF_H
