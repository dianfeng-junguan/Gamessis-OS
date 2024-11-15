cmake_minimum_required(VERSION 3.1)
project(gms)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -pedantic")
include_directories(include)
aux_source_directory(knl KNL)
aux_source_directory(knl/mods KNL_MODS)
aux_source_directory(com KNL_COMS)
add_executable(gms ${KNL} ${KNL_MODS} ${KNL_COMS}
        knl/com.c
        include/com.h
        include/vfs.h
        knl/vfs.c
        include/fat32.h
        knl/mods/fat32.c
        knl/sys.c
        include/fcntl.h
        include/sys/types.h
        include/sys/unistd.h
        include/tty.h
        knl/mods/tty.c
        include/sys/wait.h
        knl/wait.c
        loader/reloc.c
        include/reloc.h
        test/test.c
        knl/ramfs.c
        include/ramfs.h
)