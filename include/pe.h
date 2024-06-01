#pragma once
#pragma pack(1)
#ifndef _PEH_NOFUNC_
#endif
#define IMAGE_NUMBEROF_DIRECTORY_ENTRIES 0x10
#define IMAGE_SIZEOF_SHORT_NAME 8
#define IMAGE_DOS_SIGNATURE 0x5A4D
#define IMAGE_SCN_CNT_CODE 0x00000020
#define IMAGE_SCN_CNT_INITIALIZED_DATA 0x00000040
#define IMAGE_SCN_CNT_UNINITIALIZED_DATA 0x00000080
#define IMAGE_SCN_LNK_OTHER 0x00000100
#define IMAGE_SCN_LNK_INFO 0x00000200
#define IMAGE_SCN_LNK_REMOVE 0x00000800
#define IMAGE_SCN_LNK_COMDAT 0x00001000
#define IMAGE_SCN_NO_DEFER_SPEC_EXC 0x00004000
#define IMAGE_SCN_GPREL 0x00008000
#define IMAGE_SCN_MEM_FARDATA 0x00008000
#define IMAGE_SCN_MEM_PURGEABLE 0x00020000
#define IMAGE_SCN_MEM_16BIT 0x00020000
#define IMAGE_SCN_MEM_LOCKED 0x00040000
#define IMAGE_SCN_MEM_PRELOAD 0x00080000
#define IMAGE_SCN_LNK_NRELOC_OVFL 0x01000000
#define IMAGE_SCN_MEM_DISCARDABLE 0x02000000
#define IMAGE_SCN_MEM_NOT_CACHED 0x04000000
#define IMAGE_SCN_MEM_NOT_PAGED 0x08000000
#define IMAGE_SCN_MEM_SHARED 0x10000000
#define IMAGE_SCN_MEM_EXECUTE 0x20000000
#define IMAGE_SCN_MEM_READ 0x40000000
#define IMAGE_SCN_MEM_WRITE 0x80000000
typedef struct _IMAGE_DOS_HEADER {      // DOS .EXE header
    unsigned short   e_magic;                     // PE文件的标识
    unsigned short   e_cblp;                      // Bytes on last page of file
    unsigned short   e_cp;                        // Pages in file
    unsigned short   e_crlc;                      // Relocations
    unsigned short   e_cparhdr;                   // Size of header in paragraphs
    unsigned short   e_minalloc;                  // Minimum extra paragraphs needed
    unsigned short   e_maxalloc;                  // Maximum extra paragraphs needed
    unsigned short   e_ss;                        // Initial (relative) SS value
    unsigned short   e_sp;                        // Initial SP value
    unsigned short   e_csum;                      // Checksum
    unsigned short   e_ip;                        // Initial IP value
    unsigned short   e_cs;                        // Initial (relative) CS value
    unsigned short   e_lfarlc;                    // File address of relocation table
    unsigned short   e_ovno;                      // Overlay number
    unsigned short   e_res[4];                    // Reserved words
    unsigned short   e_oemid;                     // OEM identifier (for e_oeminfo)
    unsigned short   e_oeminfo;                   // OEM information; e_oemid specific
    unsigned short   e_res2[10];                  // Reserved words
    unsigned long   e_lfanew;                    // NT头部的偏移地址
  } IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;

typedef struct _IMAGE_FILE_HEADER {
    unsigned short    Machine;                              //文件的运行平台
    unsigned short    NumberOfSections;                     //区段的数量 最大为96
    unsigned int   TimeDateStamp;                        //文件创建时间
    unsigned int   PointerToSymbolTable;                 //符号表转移
    unsigned int   NumberOfSymbols;                      //符号个数
    unsigned short    SizeOfOptionalHeader;                 //扩展头的大小
    unsigned short    Characteristics;                      //PE文件的属性
} IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;
typedef struct _IMAGE_DATA_DIRECTORY {
    unsigned int   VirtualAddress;                    //数据的相对虚拟地址RVA
    unsigned int   Size;                              //数据的大小
} IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;
typedef struct _IMAGE_OPTIONAL_HEADER {
    unsigned short    Magic;                             //标志PE文件的类型 
    unsigned char    MajorLinkerVersion;                //（没用）连接器主版本
    unsigned char    MinorLinkerVersion;                //（没用）连接器此版本
    unsigned int   SizeOfCode;                        //指所有代码区段的总大小
    unsigned int   SizeOfInitializedData;             //已初始化数据的总大小
    unsigned int   SizeOfUninitializedData;           //未初始的数据总大小
    unsigned int   AddressOfEntryPoint;               //程序开始执行的虚拟地址
    unsigned int   BaseOfCode;                        //起始代码的相对虚拟地址
    unsigned int   BaseOfData;                        //起始数据的相对虚拟地址
    unsigned int   ImageBase;                         //默认加载基址
    unsigned int   SectionAlignment;                  //块对齐粒度
    unsigned int   FileAlignment;                     //文件对齐粒度
    unsigned short    MajorOperatingSystemVersion;       //（没用）主操作系统版本号
    unsigned short    MinorOperatingSystemVersion;       //（没用）次操作系统版本号
    unsigned short    MajorImageVersion;                 //（没用）主映像版本
    unsigned short    MinorImageVersion;                 //（没用）次映像版本
    unsigned short    MajorSubsystemVersion;             //（没用）主子系统版本
    unsigned short    MinorSubsystemVersion;             //（没用）次子系统版本
    unsigned int   Win32VersionValue;                 //（没用）保留值 一般是0
    unsigned int   SizeOfImage;                       //块对齐之后所需的内存大小
    unsigned int   SizeOfHeaders;                     //所有头部总大小
    unsigned int   CheckSum;                          //（没用）驱动和dll需要检测
    unsigned short    Subsystem;                         //子系统 
    unsigned short    DllCharacteristics;                //DLL特征的标志
    unsigned int   SizeOfStackReserve;                //表示进程中栈可以增长到的最大值一般1mb
    unsigned int   SizeOfStackCommit;                 //表示进程中栈的初始值
    unsigned int   SizeOfHeapReserve;                 //表示进程中堆可以增长的最大值
    unsigned int   SizeOfHeapCommit;                  //表示进程堆的初始值
    unsigned int   LoaderFlags;                       //（没用）
    unsigned int   NumberOfRvaAndSizes;               //数据目录的个数 
    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
    //数据目标表
} IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;
typedef struct _IMAGE_IMPORT_DESCRIPTOR {
    union {
        unsigned int   Characteristics; 
        unsigned int   OriginalFirstThunk; //指向INT        
    } ;
    unsigned int   TimeDateStamp; 
    unsigned int   ForwarderChain;         
    unsigned int   Name;				   //dll名称
    unsigned int   FirstThunk;            //指向IAT  
} IMAGE_IMPORT_DESCRIPTOR,*PIMAGE_IMPORT_DESCRIPTOR;
typedef struct _IMAGE_EXPORT_DIRECTORY {
    unsigned int   Characteristics;    //未使用
    unsigned int   TimeDateStamp;      //时间戳
    unsigned short    MajorVersion;       //未使用
    unsigned short    MinorVersion;       //未使用
    unsigned int   Name;               //指向改导出表文件名字符串
    unsigned int   Base;               //导出表的起始序号
    unsigned int   NumberOfFunctions;  //导出函数的个数(更准确来说是AddressOfFunctions的元素数，而不是函数个数)
    unsigned int   NumberOfNames;      //以函数名字导出的函数个数
    unsigned int   AddressOfFunctions;     //导出函数地址表RVA:存储所有导出函数地址(表元素宽度为4，总大小NumberOfFunctions * 4)
    unsigned int   AddressOfNames;         //导出函数名称表RVA:存储函数名字符串所在的地址(表元素宽度为4，总大小为NumberOfNames * 4)
    unsigned int   AddressOfNameOrdinals;  //导出函数序号表RVA:存储函数序号(表元素宽度为2，总大小为NumberOfNames * 2)
} IMAGE_EXPORT_DIRECTORY, *PIMAGE_EXPORT_DIRECTORY;
typedef struct _IMAGE_NT_HEADERS {
    unsigned int Signature;                             //标记 用于判断文件是否为PE文件
    IMAGE_FILE_HEADER FileHeader;                //文件头 存储着PE文件的基本信息
    IMAGE_OPTIONAL_HEADER32 OptionalHeader;      //扩展头 存储着关于PE文件加载时的信息
} IMAGE_NT_HEADERS32, *PIMAGE_NT_HEADERS32;
typedef struct _IMAGE_SECTION_HEADER {
    unsigned char    Name[IMAGE_SIZEOF_SHORT_NAME];       //区段的名字
    union {                    
            unsigned int   PhysicalAddress;             
            unsigned int   VirtualSize;                 //区段的大小
    } Misc;
    unsigned int   VirtualAddress;                      //区段起始的相对虚拟地址RVA
    unsigned int   SizeOfRawData;                       //区段在文件中的大小
    unsigned int   PointerToRawData;                    //区段的文件偏移
    unsigned int   PointerToRelocations;                //（没用）区段的重定位信息的文件偏移
    unsigned int   PointerToLinenumbers;                //（没用）COOF行号信息的文件偏移
    unsigned short    NumberOfRelocations;                 //（没用）
    unsigned short    NumberOfLinenumbers;                 //（没用）
    unsigned int   Characteristics;                     //区段的属性
} IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;
typedef struct _IMAGE_BASE_RELOCATION
{
    unsigned int   VirtualAddress;
    unsigned int   SizeOfBlock;
//  WORD    TypeOffset[1];
} IMAGE_BASE_RELOCATION,*PIMAGE_BASE_RELOCATION;
typedef IMAGE_BASE_RELOCATION* PIMAGE_BASE_RELOCATION;
#define IMAGE_REL_BASED_ABSOLUTE 0
#define IMAGE_REL_BASED_HIGH 1
#define IMAGE_REL_BASED_LOW 2
#define IMAGE_REL_BASED_HIGHLOW 3
#define IMAGE_REL_BASED_HIGHADJ 4
#define IMAGE_REL_BASED_MIPS_JMPADDR 5
#define IMAGE_REL_BASED_ARM_MOV32 5
#define IMAGE_REL_BASED_THUMB_MOV32 7
#define IMAGE_REL_BASED_MIPS_JMPADDR16 9
#define IMAGE_REL_BASED_IA64_IMM64 9
#define IMAGE_REL_BASED_DIR64 10

//DLL部分
//返回dll加载标号，加载失败返回-1
typedef struct{
    int link_c;
    int lvl;
    int flag;
    char name[24];
    int page_num[64];//占用的内存页页序号
    int page_used;//占用的页数
    int addr;
}DLL;
#define MAX_DLLS 256
#define DLL_STAT_EMPTY 0
#define DLL_STAT_LOADED 1