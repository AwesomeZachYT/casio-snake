# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_SOURCE_DIR = /home/zacht/dev/casio/games/snake

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zacht/dev/casio/games/snake/build-fx

# Include any dependencies generated for this target.
include CMakeFiles/snake.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/snake.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/snake.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/snake.dir/flags.make

CMakeFiles/snake.dir/src/main.c.obj: CMakeFiles/snake.dir/flags.make
CMakeFiles/snake.dir/src/main.c.obj: /home/zacht/dev/casio/games/snake/src/main.c
CMakeFiles/snake.dir/src/main.c.obj: CMakeFiles/snake.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zacht/dev/casio/games/snake/build-fx/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/snake.dir/src/main.c.obj"
	/home/zacht/.local/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/snake.dir/src/main.c.obj -MF CMakeFiles/snake.dir/src/main.c.obj.d -o CMakeFiles/snake.dir/src/main.c.obj -c /home/zacht/dev/casio/games/snake/src/main.c

CMakeFiles/snake.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/snake.dir/src/main.c.i"
	/home/zacht/.local/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zacht/dev/casio/games/snake/src/main.c > CMakeFiles/snake.dir/src/main.c.i

CMakeFiles/snake.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/snake.dir/src/main.c.s"
	/home/zacht/.local/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zacht/dev/casio/games/snake/src/main.c -o CMakeFiles/snake.dir/src/main.c.s

# Object files for target snake
snake_OBJECTS = \
"CMakeFiles/snake.dir/src/main.c.obj"

# External object files for target snake
snake_EXTERNAL_OBJECTS =

snake: CMakeFiles/snake.dir/src/main.c.obj
snake: CMakeFiles/snake.dir/build.make
snake: /home/zacht/.local/share/fxsdk/sysroot/lib/gcc/sh3eb-elf/14.1.0/../../../../sh3eb-elf/lib/libgint-fx.a
snake: /home/zacht/.local/share/fxsdk/sysroot/lib/gcc/sh3eb-elf/14.1.0/../../../../sh3eb-elf/lib/libc.a
snake: /home/zacht/.local/share/fxsdk/sysroot/lib/gcc/sh3eb-elf/14.1.0/../../../../sh3eb-elf/lib/libgint-fx.a
snake: /home/zacht/.local/share/fxsdk/sysroot/lib/gcc/sh3eb-elf/14.1.0/../../../../sh3eb-elf/lib/libc.a
snake: /home/zacht/dev/casio/games/snake/assets-fx/icon.png
snake: /home/zacht/.local/share/fxsdk/sysroot/lib/gcc/sh3eb-elf/14.1.0/../../../../sh3eb-elf/lib/fx9860g.ld
snake: CMakeFiles/snake.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/zacht/dev/casio/games/snake/build-fx/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable snake"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/snake.dir/link.txt --verbose=$(VERBOSE)
	/home/zacht/.local/bin/sh-elf-objcopy -O binary -R .bss -R .gint_bss snake snake.bin
	fxgxa --g1a -n Snake -i /home/zacht/dev/casio/games/snake/assets-fx/icon.png -o /home/zacht/dev/casio/games/snake/Snake.g1a snake.bin

# Rule to build all files generated by this target.
CMakeFiles/snake.dir/build: snake
.PHONY : CMakeFiles/snake.dir/build

CMakeFiles/snake.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/snake.dir/cmake_clean.cmake
.PHONY : CMakeFiles/snake.dir/clean

CMakeFiles/snake.dir/depend:
	cd /home/zacht/dev/casio/games/snake/build-fx && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zacht/dev/casio/games/snake /home/zacht/dev/casio/games/snake /home/zacht/dev/casio/games/snake/build-fx /home/zacht/dev/casio/games/snake/build-fx /home/zacht/dev/casio/games/snake/build-fx/CMakeFiles/snake.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/snake.dir/depend

