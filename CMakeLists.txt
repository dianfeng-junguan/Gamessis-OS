cmake_minimum_required(VERSION 3.1)
project(gms)
enable_language(ASM_NASM)
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c17 -pedantic")
set(CMAKE_ASM_COMPILER nasm)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)
SET(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS s)  # 设置NASM的文件扩展名为s
include_directories(include)
file(GLOB_RECURSE KNL_ASM knl/*.s)
file(GLOB_RECURSE KNL_SRC knl/*.c)
# file(GLOB_RECURSE KNL_COMS com/*.c)
set(KNL_COMS com/str.c com/mem.c com/types.c com/wchar.c)
set(OTHER_OBJS rd.o)
set(CFLAGS -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large -fPIC)

add_library(libcom OBJECT ${KNL_COMS})
set_target_properties(libcom PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_compile_options(libcom PRIVATE -w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large -fPIC)

add_library(protoknlasm OBJECT ${KNL_ASM})
set_source_files_properties(${KNL_ASM} PROPERTIES LANGUAGE ASM_NASM)
target_compile_options(protoknlasm PRIVATE -g -f elf64 -w-zext-reloc -w-zeroing -Iinclude -Iknl)


add_library(protoknlc OBJECT ${KNL_SRC} ${KNL_COMS})
target_compile_options(protoknlc PRIVATE ${CFLAGS})



add_custom_target(rd COMMAND objcopy rd.img bin/rd.o -B i386 -O elf64-x86-64 -I binary
    DEPENDS rd.img WORKING_DIRECTORY ../)

add_custom_target(font ALL COMMAND objcopy -O elf64-x86-64 -B i386 -I binary ../res/font.psf font.o DEPENDS ../res/font.psf)

add_executable(protoknl $<TARGET_OBJECTS:protoknlasm> $<TARGET_OBJECTS:protoknlc> ${OTHER_OBJS})
set_target_properties(protoknl PROPERTIES OUTPUT_NAME gmsknl.elf)
target_link_options(protoknl PRIVATE -Wl,-T../knl.lds -Wl,--emit-relocs)


# kallsyms()
# function(kallsyms)
#     add_custom_command(OUTPUT bin/kallsyms.o COMMAND nm -n bin/gmsknl.elf>bin/kallsyms.txt --defined-only
# 	COMMAND ./ksyms bin/kallsyms.txt
# 	COMMAND objcopy bin/kallsyms.bin bin/kallsyms.o -O elf64-x86-64 -I binary -B i386
#     WORKING_DIRECTORY ../ DEPENDS protoknl)
# endfunction(kallsyms)
# process_knl()
# function(process_knl)
#     add_custom_command(OUTPUT gmsknl.elf 
#     COMMAND ld -T knl.lds -o bin/gmsknl.elf $<TARGET_OBJECTS:protoknlasm> $<TARGET_OBJECTS:protoknlc> ${OTHER_OBJS} bin/kallsyms.o --emit-relocs
# 	COMMAND debugedit bin/gmsknl.elf -b /mnt/d/Code/Comprehensive/OS/workspace/64 -d D://Code/Comprehensive/OS/workspace/64
# 	COMMAND cp bin/gmsknl.elf bin/gmsknlm.elf
# 	COMMAND objcopy bin/gmsknl.elf -I binary -O elf64-x86-64 bin/gmsknl.o -B i386
# 	COMMAND objdump -l -S -d bin/gmsknl.elf -M intel > disas/knl.s
#     WORKING_DIRECTORY ../ DEPENDS protoknl)
# endfunction(process_knl)

#loader
# add_library(libloader32p OBJECT loader/setup.s)
# target_compile_options(libloader32p PRIVATE -g -f elf32 -w-zext-reloc -w-zeroing)

# add_custom_target(libloader32 ALL COMMAND objcopy -I elf32-i386 -O elf64-x86-64 $<TARGET_OBJECTS:libloader32p> setup.o)

# add_library(libloader OBJECT loader/setup64.s loader/reloc.c)
# target_compile_options(libloader PRIVATE "$<COMPILE_LANGUAGE:C>: -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large"
#  "$<COMPILE_LANGUAGE:ASM_NASM>: -g -f elf64 -w-zext-reloc -w-zeroing -Iinclude -Iknl")

# add_custom_target(loader ALL WORKING_DIRECTORY ../ COMMAND ld -T loader/loader.lds -o bin/gmsknl.img  bin/setup.o $<TARGET_OBJECTS:libloader> bin/gmsknl.o)


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

