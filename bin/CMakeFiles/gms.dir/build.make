# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/Code/Comprehensive/OS/workspace/64

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/Code/Comprehensive/OS/workspace/64/bin

# Include any dependencies generated for this target.
include CMakeFiles/gms.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/gms.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gms.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gms.dir/flags.make

CMakeFiles/gms.dir/knl/blk_buf.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/blk_buf.c.o: ../knl/blk_buf.c
CMakeFiles/gms.dir/knl/blk_buf.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gms.dir/knl/blk_buf.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/blk_buf.c.o -MF CMakeFiles/gms.dir/knl/blk_buf.c.o.d -o CMakeFiles/gms.dir/knl/blk_buf.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_buf.c

CMakeFiles/gms.dir/knl/blk_buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/blk_buf.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_buf.c > CMakeFiles/gms.dir/knl/blk_buf.c.i

CMakeFiles/gms.dir/knl/blk_buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/blk_buf.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_buf.c -o CMakeFiles/gms.dir/knl/blk_buf.c.s

CMakeFiles/gms.dir/knl/blk_dev.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/blk_dev.c.o: ../knl/blk_dev.c
CMakeFiles/gms.dir/knl/blk_dev.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/gms.dir/knl/blk_dev.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/blk_dev.c.o -MF CMakeFiles/gms.dir/knl/blk_dev.c.o.d -o CMakeFiles/gms.dir/knl/blk_dev.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_dev.c

CMakeFiles/gms.dir/knl/blk_dev.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/blk_dev.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_dev.c > CMakeFiles/gms.dir/knl/blk_dev.c.i

CMakeFiles/gms.dir/knl/blk_dev.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/blk_dev.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/blk_dev.c -o CMakeFiles/gms.dir/knl/blk_dev.c.s

CMakeFiles/gms.dir/knl/clock.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/clock.c.o: ../knl/clock.c
CMakeFiles/gms.dir/knl/clock.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/gms.dir/knl/clock.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/clock.c.o -MF CMakeFiles/gms.dir/knl/clock.c.o.d -o CMakeFiles/gms.dir/knl/clock.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/clock.c

CMakeFiles/gms.dir/knl/clock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/clock.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/clock.c > CMakeFiles/gms.dir/knl/clock.c.i

CMakeFiles/gms.dir/knl/clock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/clock.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/clock.c -o CMakeFiles/gms.dir/knl/clock.c.s

CMakeFiles/gms.dir/knl/com.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/com.c.o: ../knl/com.c
CMakeFiles/gms.dir/knl/com.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/gms.dir/knl/com.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/com.c.o -MF CMakeFiles/gms.dir/knl/com.c.o.d -o CMakeFiles/gms.dir/knl/com.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/com.c

CMakeFiles/gms.dir/knl/com.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/com.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/com.c > CMakeFiles/gms.dir/knl/com.c.i

CMakeFiles/gms.dir/knl/com.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/com.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/com.c -o CMakeFiles/gms.dir/knl/com.c.s

CMakeFiles/gms.dir/knl/devman.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/devman.c.o: ../knl/devman.c
CMakeFiles/gms.dir/knl/devman.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/gms.dir/knl/devman.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/devman.c.o -MF CMakeFiles/gms.dir/knl/devman.c.o.d -o CMakeFiles/gms.dir/knl/devman.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/devman.c

CMakeFiles/gms.dir/knl/devman.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/devman.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/devman.c > CMakeFiles/gms.dir/knl/devman.c.i

CMakeFiles/gms.dir/knl/devman.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/devman.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/devman.c -o CMakeFiles/gms.dir/knl/devman.c.s

CMakeFiles/gms.dir/knl/exe.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/exe.c.o: ../knl/exe.c
CMakeFiles/gms.dir/knl/exe.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/gms.dir/knl/exe.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/exe.c.o -MF CMakeFiles/gms.dir/knl/exe.c.o.d -o CMakeFiles/gms.dir/knl/exe.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/exe.c

CMakeFiles/gms.dir/knl/exe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/exe.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/exe.c > CMakeFiles/gms.dir/knl/exe.c.i

CMakeFiles/gms.dir/knl/exe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/exe.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/exe.c -o CMakeFiles/gms.dir/knl/exe.c.s

CMakeFiles/gms.dir/knl/framebuffer.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/framebuffer.c.o: ../knl/framebuffer.c
CMakeFiles/gms.dir/knl/framebuffer.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/gms.dir/knl/framebuffer.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/framebuffer.c.o -MF CMakeFiles/gms.dir/knl/framebuffer.c.o.d -o CMakeFiles/gms.dir/knl/framebuffer.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/framebuffer.c

CMakeFiles/gms.dir/knl/framebuffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/framebuffer.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/framebuffer.c > CMakeFiles/gms.dir/knl/framebuffer.c.i

CMakeFiles/gms.dir/knl/framebuffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/framebuffer.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/framebuffer.c -o CMakeFiles/gms.dir/knl/framebuffer.c.s

CMakeFiles/gms.dir/knl/gdt.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/gdt.c.o: ../knl/gdt.c
CMakeFiles/gms.dir/knl/gdt.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/gms.dir/knl/gdt.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/gdt.c.o -MF CMakeFiles/gms.dir/knl/gdt.c.o.d -o CMakeFiles/gms.dir/knl/gdt.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/gdt.c

CMakeFiles/gms.dir/knl/gdt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/gdt.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/gdt.c > CMakeFiles/gms.dir/knl/gdt.c.i

CMakeFiles/gms.dir/knl/gdt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/gdt.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/gdt.c -o CMakeFiles/gms.dir/knl/gdt.c.s

CMakeFiles/gms.dir/knl/int.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/int.c.o: ../knl/int.c
CMakeFiles/gms.dir/knl/int.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/gms.dir/knl/int.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/int.c.o -MF CMakeFiles/gms.dir/knl/int.c.o.d -o CMakeFiles/gms.dir/knl/int.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/int.c

CMakeFiles/gms.dir/knl/int.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/int.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/int.c > CMakeFiles/gms.dir/knl/int.c.i

CMakeFiles/gms.dir/knl/int.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/int.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/int.c -o CMakeFiles/gms.dir/knl/int.c.s

CMakeFiles/gms.dir/knl/log.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/log.c.o: ../knl/log.c
CMakeFiles/gms.dir/knl/log.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/gms.dir/knl/log.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/log.c.o -MF CMakeFiles/gms.dir/knl/log.c.o.d -o CMakeFiles/gms.dir/knl/log.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/log.c

CMakeFiles/gms.dir/knl/log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/log.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/log.c > CMakeFiles/gms.dir/knl/log.c.i

CMakeFiles/gms.dir/knl/log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/log.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/log.c -o CMakeFiles/gms.dir/knl/log.c.s

CMakeFiles/gms.dir/knl/main.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/main.c.o: ../knl/main.c
CMakeFiles/gms.dir/knl/main.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/gms.dir/knl/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/main.c.o -MF CMakeFiles/gms.dir/knl/main.c.o.d -o CMakeFiles/gms.dir/knl/main.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/main.c

CMakeFiles/gms.dir/knl/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/main.c > CMakeFiles/gms.dir/knl/main.c.i

CMakeFiles/gms.dir/knl/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/main.c -o CMakeFiles/gms.dir/knl/main.c.s

CMakeFiles/gms.dir/knl/memory.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/memory.c.o: ../knl/memory.c
CMakeFiles/gms.dir/knl/memory.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/gms.dir/knl/memory.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/memory.c.o -MF CMakeFiles/gms.dir/knl/memory.c.o.d -o CMakeFiles/gms.dir/knl/memory.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/memory.c

CMakeFiles/gms.dir/knl/memory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/memory.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/memory.c > CMakeFiles/gms.dir/knl/memory.c.i

CMakeFiles/gms.dir/knl/memory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/memory.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/memory.c -o CMakeFiles/gms.dir/knl/memory.c.s

CMakeFiles/gms.dir/knl/proc.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/proc.c.o: ../knl/proc.c
CMakeFiles/gms.dir/knl/proc.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/gms.dir/knl/proc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/proc.c.o -MF CMakeFiles/gms.dir/knl/proc.c.o.d -o CMakeFiles/gms.dir/knl/proc.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/proc.c

CMakeFiles/gms.dir/knl/proc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/proc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/proc.c > CMakeFiles/gms.dir/knl/proc.c.i

CMakeFiles/gms.dir/knl/proc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/proc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/proc.c -o CMakeFiles/gms.dir/knl/proc.c.s

CMakeFiles/gms.dir/knl/ramdisk.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/ramdisk.c.o: ../knl/ramdisk.c
CMakeFiles/gms.dir/knl/ramdisk.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/gms.dir/knl/ramdisk.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/ramdisk.c.o -MF CMakeFiles/gms.dir/knl/ramdisk.c.o.d -o CMakeFiles/gms.dir/knl/ramdisk.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramdisk.c

CMakeFiles/gms.dir/knl/ramdisk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/ramdisk.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramdisk.c > CMakeFiles/gms.dir/knl/ramdisk.c.i

CMakeFiles/gms.dir/knl/ramdisk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/ramdisk.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramdisk.c -o CMakeFiles/gms.dir/knl/ramdisk.c.s

CMakeFiles/gms.dir/knl/ramfs.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/ramfs.c.o: ../knl/ramfs.c
CMakeFiles/gms.dir/knl/ramfs.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/gms.dir/knl/ramfs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/ramfs.c.o -MF CMakeFiles/gms.dir/knl/ramfs.c.o.d -o CMakeFiles/gms.dir/knl/ramfs.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramfs.c

CMakeFiles/gms.dir/knl/ramfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/ramfs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramfs.c > CMakeFiles/gms.dir/knl/ramfs.c.i

CMakeFiles/gms.dir/knl/ramfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/ramfs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/ramfs.c -o CMakeFiles/gms.dir/knl/ramfs.c.s

CMakeFiles/gms.dir/knl/sys.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/sys.c.o: ../knl/sys.c
CMakeFiles/gms.dir/knl/sys.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/gms.dir/knl/sys.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/sys.c.o -MF CMakeFiles/gms.dir/knl/sys.c.o.d -o CMakeFiles/gms.dir/knl/sys.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/sys.c

CMakeFiles/gms.dir/knl/sys.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/sys.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/sys.c > CMakeFiles/gms.dir/knl/sys.c.i

CMakeFiles/gms.dir/knl/sys.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/sys.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/sys.c -o CMakeFiles/gms.dir/knl/sys.c.s

CMakeFiles/gms.dir/knl/vfs.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/vfs.c.o: ../knl/vfs.c
CMakeFiles/gms.dir/knl/vfs.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/gms.dir/knl/vfs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/vfs.c.o -MF CMakeFiles/gms.dir/knl/vfs.c.o.d -o CMakeFiles/gms.dir/knl/vfs.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/vfs.c

CMakeFiles/gms.dir/knl/vfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/vfs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/vfs.c > CMakeFiles/gms.dir/knl/vfs.c.i

CMakeFiles/gms.dir/knl/vfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/vfs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/vfs.c -o CMakeFiles/gms.dir/knl/vfs.c.s

CMakeFiles/gms.dir/knl/mods/disk.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/disk.c.o: ../knl/mods/disk.c
CMakeFiles/gms.dir/knl/mods/disk.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building C object CMakeFiles/gms.dir/knl/mods/disk.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/disk.c.o -MF CMakeFiles/gms.dir/knl/mods/disk.c.o.d -o CMakeFiles/gms.dir/knl/mods/disk.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/disk.c

CMakeFiles/gms.dir/knl/mods/disk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/disk.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/disk.c > CMakeFiles/gms.dir/knl/mods/disk.c.i

CMakeFiles/gms.dir/knl/mods/disk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/disk.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/disk.c -o CMakeFiles/gms.dir/knl/mods/disk.c.s

CMakeFiles/gms.dir/knl/mods/fat32.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/fat32.c.o: ../knl/mods/fat32.c
CMakeFiles/gms.dir/knl/mods/fat32.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building C object CMakeFiles/gms.dir/knl/mods/fat32.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/fat32.c.o -MF CMakeFiles/gms.dir/knl/mods/fat32.c.o.d -o CMakeFiles/gms.dir/knl/mods/fat32.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/fat32.c

CMakeFiles/gms.dir/knl/mods/fat32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/fat32.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/fat32.c > CMakeFiles/gms.dir/knl/mods/fat32.c.i

CMakeFiles/gms.dir/knl/mods/fat32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/fat32.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/fat32.c -o CMakeFiles/gms.dir/knl/mods/fat32.c.s

CMakeFiles/gms.dir/knl/mods/kb.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/kb.c.o: ../knl/mods/kb.c
CMakeFiles/gms.dir/knl/mods/kb.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Building C object CMakeFiles/gms.dir/knl/mods/kb.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/kb.c.o -MF CMakeFiles/gms.dir/knl/mods/kb.c.o.d -o CMakeFiles/gms.dir/knl/mods/kb.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/kb.c

CMakeFiles/gms.dir/knl/mods/kb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/kb.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/kb.c > CMakeFiles/gms.dir/knl/mods/kb.c.i

CMakeFiles/gms.dir/knl/mods/kb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/kb.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/kb.c -o CMakeFiles/gms.dir/knl/mods/kb.c.s

CMakeFiles/gms.dir/knl/mods/tty.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/knl/mods/tty.c.o: ../knl/mods/tty.c
CMakeFiles/gms.dir/knl/mods/tty.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_21) "Building C object CMakeFiles/gms.dir/knl/mods/tty.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/knl/mods/tty.c.o -MF CMakeFiles/gms.dir/knl/mods/tty.c.o.d -o CMakeFiles/gms.dir/knl/mods/tty.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/tty.c

CMakeFiles/gms.dir/knl/mods/tty.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/knl/mods/tty.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/tty.c > CMakeFiles/gms.dir/knl/mods/tty.c.i

CMakeFiles/gms.dir/knl/mods/tty.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/knl/mods/tty.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/knl/mods/tty.c -o CMakeFiles/gms.dir/knl/mods/tty.c.s

CMakeFiles/gms.dir/com/mem.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/mem.c.o: ../com/mem.c
CMakeFiles/gms.dir/com/mem.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_22) "Building C object CMakeFiles/gms.dir/com/mem.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/mem.c.o -MF CMakeFiles/gms.dir/com/mem.c.o.d -o CMakeFiles/gms.dir/com/mem.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/com/mem.c

CMakeFiles/gms.dir/com/mem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/mem.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/com/mem.c > CMakeFiles/gms.dir/com/mem.c.i

CMakeFiles/gms.dir/com/mem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/mem.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/com/mem.c -o CMakeFiles/gms.dir/com/mem.c.s

CMakeFiles/gms.dir/com/str.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/str.c.o: ../com/str.c
CMakeFiles/gms.dir/com/str.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_23) "Building C object CMakeFiles/gms.dir/com/str.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/str.c.o -MF CMakeFiles/gms.dir/com/str.c.o.d -o CMakeFiles/gms.dir/com/str.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/com/str.c

CMakeFiles/gms.dir/com/str.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/str.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/com/str.c > CMakeFiles/gms.dir/com/str.c.i

CMakeFiles/gms.dir/com/str.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/str.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/com/str.c -o CMakeFiles/gms.dir/com/str.c.s

CMakeFiles/gms.dir/com/syscall.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/syscall.c.o: ../com/syscall.c
CMakeFiles/gms.dir/com/syscall.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_24) "Building C object CMakeFiles/gms.dir/com/syscall.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/syscall.c.o -MF CMakeFiles/gms.dir/com/syscall.c.o.d -o CMakeFiles/gms.dir/com/syscall.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/com/syscall.c

CMakeFiles/gms.dir/com/syscall.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/syscall.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/com/syscall.c > CMakeFiles/gms.dir/com/syscall.c.i

CMakeFiles/gms.dir/com/syscall.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/syscall.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/com/syscall.c -o CMakeFiles/gms.dir/com/syscall.c.s

CMakeFiles/gms.dir/com/types.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/com/types.c.o: ../com/types.c
CMakeFiles/gms.dir/com/types.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_25) "Building C object CMakeFiles/gms.dir/com/types.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/com/types.c.o -MF CMakeFiles/gms.dir/com/types.c.o.d -o CMakeFiles/gms.dir/com/types.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/com/types.c

CMakeFiles/gms.dir/com/types.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/com/types.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/com/types.c > CMakeFiles/gms.dir/com/types.c.i

CMakeFiles/gms.dir/com/types.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/com/types.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/com/types.c -o CMakeFiles/gms.dir/com/types.c.s

CMakeFiles/gms.dir/loader/reloc.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/loader/reloc.c.o: ../loader/reloc.c
CMakeFiles/gms.dir/loader/reloc.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_26) "Building C object CMakeFiles/gms.dir/loader/reloc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/loader/reloc.c.o -MF CMakeFiles/gms.dir/loader/reloc.c.o.d -o CMakeFiles/gms.dir/loader/reloc.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/loader/reloc.c

CMakeFiles/gms.dir/loader/reloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/loader/reloc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/loader/reloc.c > CMakeFiles/gms.dir/loader/reloc.c.i

CMakeFiles/gms.dir/loader/reloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/loader/reloc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/loader/reloc.c -o CMakeFiles/gms.dir/loader/reloc.c.s

CMakeFiles/gms.dir/test/test.c.o: CMakeFiles/gms.dir/flags.make
CMakeFiles/gms.dir/test/test.c.o: ../test/test.c
CMakeFiles/gms.dir/test/test.c.o: CMakeFiles/gms.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_27) "Building C object CMakeFiles/gms.dir/test/test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/gms.dir/test/test.c.o -MF CMakeFiles/gms.dir/test/test.c.o.d -o CMakeFiles/gms.dir/test/test.c.o -c /mnt/d/Code/Comprehensive/OS/workspace/64/test/test.c

CMakeFiles/gms.dir/test/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gms.dir/test/test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/Code/Comprehensive/OS/workspace/64/test/test.c > CMakeFiles/gms.dir/test/test.c.i

CMakeFiles/gms.dir/test/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gms.dir/test/test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/Code/Comprehensive/OS/workspace/64/test/test.c -o CMakeFiles/gms.dir/test/test.c.s

# Object files for target gms
gms_OBJECTS = \
"CMakeFiles/gms.dir/knl/blk_buf.c.o" \
"CMakeFiles/gms.dir/knl/blk_dev.c.o" \
"CMakeFiles/gms.dir/knl/clock.c.o" \
"CMakeFiles/gms.dir/knl/com.c.o" \
"CMakeFiles/gms.dir/knl/devman.c.o" \
"CMakeFiles/gms.dir/knl/exe.c.o" \
"CMakeFiles/gms.dir/knl/framebuffer.c.o" \
"CMakeFiles/gms.dir/knl/gdt.c.o" \
"CMakeFiles/gms.dir/knl/int.c.o" \
"CMakeFiles/gms.dir/knl/log.c.o" \
"CMakeFiles/gms.dir/knl/main.c.o" \
"CMakeFiles/gms.dir/knl/memory.c.o" \
"CMakeFiles/gms.dir/knl/proc.c.o" \
"CMakeFiles/gms.dir/knl/ramdisk.c.o" \
"CMakeFiles/gms.dir/knl/ramfs.c.o" \
"CMakeFiles/gms.dir/knl/sys.c.o" \
"CMakeFiles/gms.dir/knl/vfs.c.o" \
"CMakeFiles/gms.dir/knl/mods/disk.c.o" \
"CMakeFiles/gms.dir/knl/mods/fat32.c.o" \
"CMakeFiles/gms.dir/knl/mods/kb.c.o" \
"CMakeFiles/gms.dir/knl/mods/tty.c.o" \
"CMakeFiles/gms.dir/com/mem.c.o" \
"CMakeFiles/gms.dir/com/str.c.o" \
"CMakeFiles/gms.dir/com/syscall.c.o" \
"CMakeFiles/gms.dir/com/types.c.o" \
"CMakeFiles/gms.dir/loader/reloc.c.o" \
"CMakeFiles/gms.dir/test/test.c.o"

# External object files for target gms
gms_EXTERNAL_OBJECTS =

gms: CMakeFiles/gms.dir/knl/blk_buf.c.o
gms: CMakeFiles/gms.dir/knl/blk_dev.c.o
gms: CMakeFiles/gms.dir/knl/clock.c.o
gms: CMakeFiles/gms.dir/knl/com.c.o
gms: CMakeFiles/gms.dir/knl/devman.c.o
gms: CMakeFiles/gms.dir/knl/exe.c.o
gms: CMakeFiles/gms.dir/knl/framebuffer.c.o
gms: CMakeFiles/gms.dir/knl/gdt.c.o
gms: CMakeFiles/gms.dir/knl/int.c.o
gms: CMakeFiles/gms.dir/knl/log.c.o
gms: CMakeFiles/gms.dir/knl/main.c.o
gms: CMakeFiles/gms.dir/knl/memory.c.o
gms: CMakeFiles/gms.dir/knl/proc.c.o
gms: CMakeFiles/gms.dir/knl/ramdisk.c.o
gms: CMakeFiles/gms.dir/knl/ramfs.c.o
gms: CMakeFiles/gms.dir/knl/sys.c.o
gms: CMakeFiles/gms.dir/knl/vfs.c.o
gms: CMakeFiles/gms.dir/knl/mods/disk.c.o
gms: CMakeFiles/gms.dir/knl/mods/fat32.c.o
gms: CMakeFiles/gms.dir/knl/mods/kb.c.o
gms: CMakeFiles/gms.dir/knl/mods/tty.c.o
gms: CMakeFiles/gms.dir/com/mem.c.o
gms: CMakeFiles/gms.dir/com/str.c.o
gms: CMakeFiles/gms.dir/com/syscall.c.o
gms: CMakeFiles/gms.dir/com/types.c.o
gms: CMakeFiles/gms.dir/loader/reloc.c.o
gms: CMakeFiles/gms.dir/test/test.c.o
gms: CMakeFiles/gms.dir/build.make
gms: CMakeFiles/gms.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_28) "Linking C executable gms"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gms.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gms.dir/build: gms
.PHONY : CMakeFiles/gms.dir/build

CMakeFiles/gms.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gms.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gms.dir/clean

CMakeFiles/gms.dir/depend:
	cd /mnt/d/Code/Comprehensive/OS/workspace/64/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Code/Comprehensive/OS/workspace/64 /mnt/d/Code/Comprehensive/OS/workspace/64 /mnt/d/Code/Comprehensive/OS/workspace/64/bin /mnt/d/Code/Comprehensive/OS/workspace/64/bin /mnt/d/Code/Comprehensive/OS/workspace/64/bin/CMakeFiles/gms.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gms.dir/depend

