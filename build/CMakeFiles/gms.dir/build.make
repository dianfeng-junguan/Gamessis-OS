# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "E:\Visual Studio 2019\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "E:\Visual Studio 2019\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\Code\Comprehensive\OS\workspace\64

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\Code\Comprehensive\OS\workspace\64\build

# Include any dependencies generated for this target.
include CMakeFiles/gms.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/gms.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gms.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gms.dir/flags.make

CMakeFiles/gms.dir/knl/blk_buf.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/blk_buf.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/blk_buf.c.obj: ../knl/blk_buf.c
CMakeFiles/gms.dir/knl/blk_buf.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gms.dir/knl/blk_buf.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/blk_buf.c.obj -MF CMakeFiles\gms.dir\knl\blk_buf.c.obj.d -o CMakeFiles\gms.dir\knl\blk_buf.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\blk_buf.c

CMakeFiles/gms.dir/knl/blk_buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/blk_buf.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\blk_buf.c > CMakeFiles\gms.dir\knl\blk_buf.c.i

CMakeFiles/gms.dir/knl/blk_buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/blk_buf.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\blk_buf.c -o CMakeFiles\gms.dir\knl\blk_buf.c.s

CMakeFiles/gms.dir/knl/blk_dev.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/blk_dev.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/blk_dev.c.obj: ../knl/blk_dev.c
CMakeFiles/gms.dir/knl/blk_dev.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/gms.dir/knl/blk_dev.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/blk_dev.c.obj -MF CMakeFiles\gms.dir\knl\blk_dev.c.obj.d -o CMakeFiles\gms.dir\knl\blk_dev.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\blk_dev.c

CMakeFiles/gms.dir/knl/blk_dev.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/blk_dev.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\blk_dev.c > CMakeFiles\gms.dir\knl\blk_dev.c.i

CMakeFiles/gms.dir/knl/blk_dev.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/blk_dev.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\blk_dev.c -o CMakeFiles\gms.dir\knl\blk_dev.c.s

CMakeFiles/gms.dir/knl/clock.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/clock.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/clock.c.obj: ../knl/clock.c
CMakeFiles/gms.dir/knl/clock.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/gms.dir/knl/clock.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/clock.c.obj -MF CMakeFiles\gms.dir\knl\clock.c.obj.d -o CMakeFiles\gms.dir\knl\clock.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\clock.c

CMakeFiles/gms.dir/knl/clock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/clock.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\clock.c > CMakeFiles\gms.dir\knl\clock.c.i

CMakeFiles/gms.dir/knl/clock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/clock.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\clock.c -o CMakeFiles\gms.dir\knl\clock.c.s

CMakeFiles/gms.dir/knl/com.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/com.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/com.c.obj: ../knl/com.c
CMakeFiles/gms.dir/knl/com.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/gms.dir/knl/com.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/com.c.obj -MF CMakeFiles\gms.dir\knl\com.c.obj.d -o CMakeFiles\gms.dir\knl\com.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\com.c

CMakeFiles/gms.dir/knl/com.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/com.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\com.c > CMakeFiles\gms.dir\knl\com.c.i

CMakeFiles/gms.dir/knl/com.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/com.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\com.c -o CMakeFiles\gms.dir\knl\com.c.s

CMakeFiles/gms.dir/knl/devman.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/devman.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/devman.c.obj: ../knl/devman.c
CMakeFiles/gms.dir/knl/devman.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/gms.dir/knl/devman.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/devman.c.obj -MF CMakeFiles\gms.dir\knl\devman.c.obj.d -o CMakeFiles\gms.dir\knl\devman.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\devman.c

CMakeFiles/gms.dir/knl/devman.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/devman.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\devman.c > CMakeFiles\gms.dir\knl\devman.c.i

CMakeFiles/gms.dir/knl/devman.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/devman.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\devman.c -o CMakeFiles\gms.dir\knl\devman.c.s

CMakeFiles/gms.dir/knl/exe.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/exe.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/exe.c.obj: ../knl/exe.c
CMakeFiles/gms.dir/knl/exe.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/gms.dir/knl/exe.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/exe.c.obj -MF CMakeFiles\gms.dir\knl\exe.c.obj.d -o CMakeFiles\gms.dir\knl\exe.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\exe.c

CMakeFiles/gms.dir/knl/exe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/exe.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\exe.c > CMakeFiles\gms.dir\knl\exe.c.i

CMakeFiles/gms.dir/knl/exe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/exe.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\exe.c -o CMakeFiles\gms.dir\knl\exe.c.s

CMakeFiles/gms.dir/knl/framebuffer.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/framebuffer.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/framebuffer.c.obj: ../knl/framebuffer.c
CMakeFiles/gms.dir/knl/framebuffer.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/gms.dir/knl/framebuffer.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/framebuffer.c.obj -MF CMakeFiles\gms.dir\knl\framebuffer.c.obj.d -o CMakeFiles\gms.dir\knl\framebuffer.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\framebuffer.c

CMakeFiles/gms.dir/knl/framebuffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/framebuffer.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\framebuffer.c > CMakeFiles\gms.dir\knl\framebuffer.c.i

CMakeFiles/gms.dir/knl/framebuffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/framebuffer.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\framebuffer.c -o CMakeFiles\gms.dir\knl\framebuffer.c.s

CMakeFiles/gms.dir/knl/gdt.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/gdt.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/gdt.c.obj: ../knl/gdt.c
CMakeFiles/gms.dir/knl/gdt.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/gms.dir/knl/gdt.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/gdt.c.obj -MF CMakeFiles\gms.dir\knl\gdt.c.obj.d -o CMakeFiles\gms.dir\knl\gdt.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\gdt.c

CMakeFiles/gms.dir/knl/gdt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/gdt.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\gdt.c > CMakeFiles\gms.dir\knl\gdt.c.i

CMakeFiles/gms.dir/knl/gdt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/gdt.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\gdt.c -o CMakeFiles\gms.dir\knl\gdt.c.s

CMakeFiles/gms.dir/knl/int.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/int.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/int.c.obj: ../knl/int.c
CMakeFiles/gms.dir/knl/int.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/gms.dir/knl/int.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/int.c.obj -MF CMakeFiles\gms.dir\knl\int.c.obj.d -o CMakeFiles\gms.dir\knl\int.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\int.c

CMakeFiles/gms.dir/knl/int.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/int.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\int.c > CMakeFiles\gms.dir\knl\int.c.i

CMakeFiles/gms.dir/knl/int.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/int.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\int.c -o CMakeFiles\gms.dir\knl\int.c.s

CMakeFiles/gms.dir/knl/log.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/log.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/log.c.obj: ../knl/log.c
CMakeFiles/gms.dir/knl/log.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/gms.dir/knl/log.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/log.c.obj -MF CMakeFiles\gms.dir\knl\log.c.obj.d -o CMakeFiles\gms.dir\knl\log.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\log.c

CMakeFiles/gms.dir/knl/log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/log.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\log.c > CMakeFiles\gms.dir\knl\log.c.i

CMakeFiles/gms.dir/knl/log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/log.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\log.c -o CMakeFiles\gms.dir\knl\log.c.s

CMakeFiles/gms.dir/knl/main.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/main.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/main.c.obj: ../knl/main.c
CMakeFiles/gms.dir/knl/main.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/gms.dir/knl/main.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/main.c.obj -MF CMakeFiles\gms.dir\knl\main.c.obj.d -o CMakeFiles\gms.dir\knl\main.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\main.c

CMakeFiles/gms.dir/knl/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/main.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\main.c > CMakeFiles\gms.dir\knl\main.c.i

CMakeFiles/gms.dir/knl/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/main.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\main.c -o CMakeFiles\gms.dir\knl\main.c.s

CMakeFiles/gms.dir/knl/memory.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/memory.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/memory.c.obj: ../knl/memory.c
CMakeFiles/gms.dir/knl/memory.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/gms.dir/knl/memory.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/memory.c.obj -MF CMakeFiles\gms.dir\knl\memory.c.obj.d -o CMakeFiles\gms.dir\knl\memory.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\memory.c

CMakeFiles/gms.dir/knl/memory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/memory.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\memory.c > CMakeFiles\gms.dir\knl\memory.c.i

CMakeFiles/gms.dir/knl/memory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/memory.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\memory.c -o CMakeFiles\gms.dir\knl\memory.c.s

CMakeFiles/gms.dir/knl/proc.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/proc.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/proc.c.obj: ../knl/proc.c
CMakeFiles/gms.dir/knl/proc.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/gms.dir/knl/proc.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/proc.c.obj -MF CMakeFiles\gms.dir\knl\proc.c.obj.d -o CMakeFiles\gms.dir\knl\proc.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\proc.c

CMakeFiles/gms.dir/knl/proc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/proc.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\proc.c > CMakeFiles\gms.dir\knl\proc.c.i

CMakeFiles/gms.dir/knl/proc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/proc.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\proc.c -o CMakeFiles\gms.dir\knl\proc.c.s

CMakeFiles/gms.dir/knl/ramdisk.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/ramdisk.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/ramdisk.c.obj: ../knl/ramdisk.c
CMakeFiles/gms.dir/knl/ramdisk.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/gms.dir/knl/ramdisk.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/ramdisk.c.obj -MF CMakeFiles\gms.dir\knl\ramdisk.c.obj.d -o CMakeFiles\gms.dir\knl\ramdisk.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\ramdisk.c

CMakeFiles/gms.dir/knl/ramdisk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/ramdisk.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\ramdisk.c > CMakeFiles\gms.dir\knl\ramdisk.c.i

CMakeFiles/gms.dir/knl/ramdisk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/ramdisk.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\ramdisk.c -o CMakeFiles\gms.dir\knl\ramdisk.c.s

CMakeFiles/gms.dir/knl/ramfs.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/ramfs.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/ramfs.c.obj: ../knl/ramfs.c
CMakeFiles/gms.dir/knl/ramfs.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/gms.dir/knl/ramfs.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/ramfs.c.obj -MF CMakeFiles\gms.dir\knl\ramfs.c.obj.d -o CMakeFiles\gms.dir\knl\ramfs.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\ramfs.c

CMakeFiles/gms.dir/knl/ramfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/ramfs.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\ramfs.c > CMakeFiles\gms.dir\knl\ramfs.c.i

CMakeFiles/gms.dir/knl/ramfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/ramfs.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\ramfs.c -o CMakeFiles\gms.dir\knl\ramfs.c.s

CMakeFiles/gms.dir/knl/sys.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/sys.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/sys.c.obj: ../knl/sys.c
CMakeFiles/gms.dir/knl/sys.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/gms.dir/knl/sys.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/sys.c.obj -MF CMakeFiles\gms.dir\knl\sys.c.obj.d -o CMakeFiles\gms.dir\knl\sys.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\sys.c

CMakeFiles/gms.dir/knl/sys.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/sys.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\sys.c > CMakeFiles\gms.dir\knl\sys.c.i

CMakeFiles/gms.dir/knl/sys.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/sys.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\sys.c -o CMakeFiles\gms.dir\knl\sys.c.s

CMakeFiles/gms.dir/knl/vfs.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/vfs.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/vfs.c.obj: ../knl/vfs.c
CMakeFiles/gms.dir/knl/vfs.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/gms.dir/knl/vfs.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/vfs.c.obj -MF CMakeFiles\gms.dir\knl\vfs.c.obj.d -o CMakeFiles\gms.dir\knl\vfs.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\vfs.c

CMakeFiles/gms.dir/knl/vfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/vfs.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\vfs.c > CMakeFiles\gms.dir\knl\vfs.c.i

CMakeFiles/gms.dir/knl/vfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/vfs.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\vfs.c -o CMakeFiles\gms.dir\knl\vfs.c.s

CMakeFiles/gms.dir/knl/mods/disk.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/disk.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/mods/disk.c.obj: ../knl/mods/disk.c
CMakeFiles/gms.dir/knl/mods/disk.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/gms.dir/knl/mods/disk.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/disk.c.obj -MF CMakeFiles\gms.dir\knl\mods\disk.c.obj.d -o CMakeFiles\gms.dir\knl\mods\disk.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\mods\disk.c

CMakeFiles/gms.dir/knl/mods/disk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/disk.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\mods\disk.c > CMakeFiles\gms.dir\knl\mods\disk.c.i

CMakeFiles/gms.dir/knl/mods/disk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/disk.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\mods\disk.c -o CMakeFiles\gms.dir\knl\mods\disk.c.s

CMakeFiles/gms.dir/knl/mods/fat32.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/fat32.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/mods/fat32.c.obj: ../knl/mods/fat32.c
CMakeFiles/gms.dir/knl/mods/fat32.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/gms.dir/knl/mods/fat32.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/fat32.c.obj -MF CMakeFiles\gms.dir\knl\mods\fat32.c.obj.d -o CMakeFiles\gms.dir\knl\mods\fat32.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\mods\fat32.c

CMakeFiles/gms.dir/knl/mods/fat32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/fat32.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\mods\fat32.c > CMakeFiles\gms.dir\knl\mods\fat32.c.i

CMakeFiles/gms.dir/knl/mods/fat32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/fat32.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\mods\fat32.c -o CMakeFiles\gms.dir\knl\mods\fat32.c.s

CMakeFiles/gms.dir/knl/mods/kb.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/kb.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/mods/kb.c.obj: ../knl/mods/kb.c
CMakeFiles/gms.dir/knl/mods/kb.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Building C object CMakeFiles/gms.dir/knl/mods/kb.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/kb.c.obj -MF CMakeFiles\gms.dir\knl\mods\kb.c.obj.d -o CMakeFiles\gms.dir\knl\mods\kb.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\mods\kb.c

CMakeFiles/gms.dir/knl/mods/kb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/kb.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\mods\kb.c > CMakeFiles\gms.dir\knl\mods\kb.c.i

CMakeFiles/gms.dir/knl/mods/kb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/kb.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\mods\kb.c -o CMakeFiles\gms.dir\knl\mods\kb.c.s

CMakeFiles/gms.dir/knl/mods/tty.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/tty.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/knl/mods/tty.c.obj: ../knl/mods/tty.c
CMakeFiles/gms.dir/knl/mods/tty.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_21) "Building C object CMakeFiles/gms.dir/knl/mods/tty.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/tty.c.obj -MF CMakeFiles\gms.dir\knl\mods\tty.c.obj.d -o CMakeFiles\gms.dir\knl\mods\tty.c.obj -c D:\Code\Comprehensive\OS\workspace\64\knl\mods\tty.c

CMakeFiles/gms.dir/knl/mods/tty.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/tty.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\knl\mods\tty.c > CMakeFiles\gms.dir\knl\mods\tty.c.i

CMakeFiles/gms.dir/knl/mods/tty.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/tty.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\knl\mods\tty.c -o CMakeFiles\gms.dir\knl\mods\tty.c.s

CMakeFiles/gms.dir/com/mem.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/mem.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/com/mem.c.obj: ../com/mem.c
CMakeFiles/gms.dir/com/mem.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_22) "Building C object CMakeFiles/gms.dir/com/mem.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/mem.c.obj -MF CMakeFiles\gms.dir\com\mem.c.obj.d -o CMakeFiles\gms.dir\com\mem.c.obj -c D:\Code\Comprehensive\OS\workspace\64\com\mem.c

CMakeFiles/gms.dir/com/mem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/mem.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\com\mem.c > CMakeFiles\gms.dir\com\mem.c.i

CMakeFiles/gms.dir/com/mem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/mem.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\com\mem.c -o CMakeFiles\gms.dir\com\mem.c.s

CMakeFiles/gms.dir/com/str.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/str.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/com/str.c.obj: ../com/str.c
CMakeFiles/gms.dir/com/str.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_23) "Building C object CMakeFiles/gms.dir/com/str.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/str.c.obj -MF CMakeFiles\gms.dir\com\str.c.obj.d -o CMakeFiles\gms.dir\com\str.c.obj -c D:\Code\Comprehensive\OS\workspace\64\com\str.c

CMakeFiles/gms.dir/com/str.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/str.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\com\str.c > CMakeFiles\gms.dir\com\str.c.i

CMakeFiles/gms.dir/com/str.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/str.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\com\str.c -o CMakeFiles\gms.dir\com\str.c.s

CMakeFiles/gms.dir/com/syscall.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/syscall.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/com/syscall.c.obj: ../com/syscall.c
CMakeFiles/gms.dir/com/syscall.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_24) "Building C object CMakeFiles/gms.dir/com/syscall.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/syscall.c.obj -MF CMakeFiles\gms.dir\com\syscall.c.obj.d -o CMakeFiles\gms.dir\com\syscall.c.obj -c D:\Code\Comprehensive\OS\workspace\64\com\syscall.c

CMakeFiles/gms.dir/com/syscall.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/syscall.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\com\syscall.c > CMakeFiles\gms.dir\com\syscall.c.i

CMakeFiles/gms.dir/com/syscall.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/syscall.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\com\syscall.c -o CMakeFiles\gms.dir\com\syscall.c.s

CMakeFiles/gms.dir/com/types.c.obj: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/types.c.obj: CMakeFiles/gms.dir/includes_C.rsp
CMakeFiles/gms.dir/com/types.c.obj: ../com/types.c
CMakeFiles/gms.dir/com/types.c.obj: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_25) "Building C object CMakeFiles/gms.dir/com/types.c.obj"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/types.c.obj -MF CMakeFiles\gms.dir\com\types.c.obj.d -o CMakeFiles\gms.dir\com\types.c.obj -c D:\Code\Comprehensive\OS\workspace\64\com\types.c

CMakeFiles/gms.dir/com/types.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/types.c.i"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\Code\Comprehensive\OS\workspace\64\com\types.c > CMakeFiles\gms.dir\com\types.c.i

CMakeFiles/gms.dir/com/types.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/types.c.s"
	E:\Mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\Code\Comprehensive\OS\workspace\64\com\types.c -o CMakeFiles\gms.dir\com\types.c.s

# Object files for target gms
gms_OBJECTS = \
"CMakeFiles/gms.dir/knl/blk_buf.c.obj" \
"CMakeFiles/gms.dir/knl/blk_dev.c.obj" \
"CMakeFiles/gms.dir/knl/clock.c.obj" \
"CMakeFiles/gms.dir/knl/com.c.obj" \
"CMakeFiles/gms.dir/knl/devman.c.obj" \
"CMakeFiles/gms.dir/knl/exe.c.obj" \
"CMakeFiles/gms.dir/knl/framebuffer.c.obj" \
"CMakeFiles/gms.dir/knl/gdt.c.obj" \
"CMakeFiles/gms.dir/knl/int.c.obj" \
"CMakeFiles/gms.dir/knl/log.c.obj" \
"CMakeFiles/gms.dir/knl/main.c.obj" \
"CMakeFiles/gms.dir/knl/memory.c.obj" \
"CMakeFiles/gms.dir/knl/proc.c.obj" \
"CMakeFiles/gms.dir/knl/ramdisk.c.obj" \
"CMakeFiles/gms.dir/knl/ramfs.c.obj" \
"CMakeFiles/gms.dir/knl/sys.c.obj" \
"CMakeFiles/gms.dir/knl/vfs.c.obj" \
"CMakeFiles/gms.dir/knl/mods/disk.c.obj" \
"CMakeFiles/gms.dir/knl/mods/fat32.c.obj" \
"CMakeFiles/gms.dir/knl/mods/kb.c.obj" \
"CMakeFiles/gms.dir/knl/mods/tty.c.obj" \
"CMakeFiles/gms.dir/com/mem.c.obj" \
"CMakeFiles/gms.dir/com/str.c.obj" \
"CMakeFiles/gms.dir/com/syscall.c.obj" \
"CMakeFiles/gms.dir/com/types.c.obj"

# External object files for target gms
gms_EXTERNAL_OBJECTS =

gms.exe: CMakeFiles/gms.dir/knl/blk_buf.c.obj
gms.exe: CMakeFiles/gms.dir/knl/blk_dev.c.obj
gms.exe: CMakeFiles/gms.dir/knl/clock.c.obj
gms.exe: CMakeFiles/gms.dir/knl/com.c.obj
gms.exe: CMakeFiles/gms.dir/knl/devman.c.obj
gms.exe: CMakeFiles/gms.dir/knl/exe.c.obj
gms.exe: CMakeFiles/gms.dir/knl/framebuffer.c.obj
gms.exe: CMakeFiles/gms.dir/knl/gdt.c.obj
gms.exe: CMakeFiles/gms.dir/knl/int.c.obj
gms.exe: CMakeFiles/gms.dir/knl/log.c.obj
gms.exe: CMakeFiles/gms.dir/knl/main.c.obj
gms.exe: CMakeFiles/gms.dir/knl/memory.c.obj
gms.exe: CMakeFiles/gms.dir/knl/proc.c.obj
gms.exe: CMakeFiles/gms.dir/knl/ramdisk.c.obj
gms.exe: CMakeFiles/gms.dir/knl/ramfs.c.obj
gms.exe: CMakeFiles/gms.dir/knl/sys.c.obj
gms.exe: CMakeFiles/gms.dir/knl/vfs.c.obj
gms.exe: CMakeFiles/gms.dir/knl/mods/disk.c.obj
gms.exe: CMakeFiles/gms.dir/knl/mods/fat32.c.obj
gms.exe: CMakeFiles/gms.dir/knl/mods/kb.c.obj
gms.exe: CMakeFiles/gms.dir/knl/mods/tty.c.obj
gms.exe: CMakeFiles/gms.dir/com/mem.c.obj
gms.exe: CMakeFiles/gms.dir/com/str.c.obj
gms.exe: CMakeFiles/gms.dir/com/syscall.c.obj
gms.exe: CMakeFiles/gms.dir/com/types.c.obj
gms.exe: CMakeFiles/gms.dir/build.make
gms.exe: CMakeFiles/gms.dir/linklibs.rsp
gms.exe: CMakeFiles/gms.dir/objects1.rsp
gms.exe: CMakeFiles/gms.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_26) "Linking C executable gms.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\gms.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gms.dir/build: gms.exe
.PHONY : CMakeFiles/gms.dir/build

CMakeFiles/gms.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\gms.dir\cmake_clean.cmake
.PHONY : CMakeFiles/gms.dir/clean

CMakeFiles/gms.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\Code\Comprehensive\OS\workspace\64 D:\Code\Comprehensive\OS\workspace\64 D:\Code\Comprehensive\OS\workspace\64\build D:\Code\Comprehensive\OS\workspace\64\build D:\Code\Comprehensive\OS\workspace\64\build\CMakeFiles\gms.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gms.dir/depend

