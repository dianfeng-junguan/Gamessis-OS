cmake_minimum_required(VERSION 3.18.4)
project(gms)
enable_language(ASM_NASM)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11 -pedantic")
set(CMAKE_ASM_COMPILER nasm)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
SET(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS s)  # 设置NASM的文件扩展名为s
include_directories(include)
file(GLOB_RECURSE KNL_ASM knl/*.s)
file(GLOB_RECURSE KNL_SRC knl/*.c)
# file(GLOB_RECURSE KNL_COMS com/*.c)
set(KNL_COMS com/str.c com/mem.c com/types.c com/wchar.c)
set(OTHER_OBJS rd.o)
set(CFLAGS -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large -fPIC)

add_compile_options(-w)

#com
add_library(libcom OBJECT ${KNL_COMS})
set_target_properties(libcom PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_compile_options(libcom PRIVATE -w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large -fPIC)

#knl
add_library(protoknlasm OBJECT ${KNL_ASM})
set_source_files_properties(${KNL_ASM} PROPERTIES LANGUAGE ASM_NASM)
target_compile_options(protoknlasm PRIVATE -g -f elf64 -w-zext-reloc -w-zeroing -Iinclude -Iknl)


add_library(protoknlc OBJECT ${KNL_SRC})
target_compile_options(protoknlc PRIVATE ${CFLAGS})


#rd
add_custom_target(rd COMMAND objcopy rd.img bin/rd.o -B i386 -O elf64-x86-64 -I binary
    DEPENDS rd.img WORKING_DIRECTORY ../)

#font
add_custom_target(font ALL COMMAND objcopy -O elf64-x86-64 -B i386 -I binary ../res/font.psf font.o DEPENDS ../res/font.psf)


#drivers
file(GLOB_RECURSE SRC_DRIVERS drivers/*.c)
file(GLOB_RECURSE SRC_DRIVERS_ASM drivers/*.s)
set_source_files_properties(${SRC_DRIVERS_ASM} PROPERTIES LANGUAGE ASM_NASM)
add_library(drivers OBJECT ${SRC_DRIVERS})
add_library(driversasm OBJECT ${SRC_DRIVERS_ASM})
target_compile_options(driversasm PRIVATE -g -f elf64 -w-zext-reloc -w-zeroing -Iinclude)

#mm
file(GLOB_RECURSE SRC_MM mm/*.c)
add_library(mm OBJECT ${SRC_MM})

#arch
file(GLOB SRC_ARCH arch/*.c)
file(GLOB SRC_ARCH_ASM arch/*.s)
set_source_files_properties(${SRC_ARCH_ASM} PROPERTIES LANGUAGE ASM_NASM)
add_library(arch OBJECT ${SRC_ARCH})
add_library(archasm OBJECT ${SRC_ARCH_ASM})
target_compile_options(archasm PRIVATE -g -f elf64 -w-zext-reloc -w-zeroing -Iinclude)

#fs
file(GLOB_RECURSE SRC_FS fs/*.c)
add_library(fs OBJECT ${SRC_FS})

#gui
file(GLOB_RECURSE SRC_GUI gui/*.c)
add_library(gui OBJECT ${SRC_GUI})


add_executable(protoknl $<TARGET_OBJECTS:protoknlasm> $<TARGET_OBJECTS:protoknlc> 
$<TARGET_OBJECTS:libcom> $<TARGET_OBJECTS:fs> $<TARGET_OBJECTS:mm> $<TARGET_OBJECTS:drivers>
$<TARGET_OBJECTS:driversasm> $<TARGET_OBJECTS:arch> $<TARGET_OBJECTS:archasm>
 $<TARGET_OBJECTS:gui> ${OTHER_OBJS})
set_target_properties(protoknl PROPERTIES OUTPUT_NAME gmsknl.elf)
target_link_options(protoknl PRIVATE -Wl,-T../knl.lds -Wl,--emit-relocs)


