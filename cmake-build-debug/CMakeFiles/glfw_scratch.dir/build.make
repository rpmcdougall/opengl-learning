# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Users/rpmmcdougall/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/182.4892.24/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/rpmmcdougall/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/182.4892.24/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rpmmcdougall/dev/opengl-learning

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/glfw_scratch.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/glfw_scratch.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/glfw_scratch.dir/flags.make

CMakeFiles/glfw_scratch.dir/src/main.cpp.o: CMakeFiles/glfw_scratch.dir/flags.make
CMakeFiles/glfw_scratch.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/glfw_scratch.dir/src/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glfw_scratch.dir/src/main.cpp.o -c /Users/rpmmcdougall/dev/opengl-learning/src/main.cpp

CMakeFiles/glfw_scratch.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glfw_scratch.dir/src/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/rpmmcdougall/dev/opengl-learning/src/main.cpp > CMakeFiles/glfw_scratch.dir/src/main.cpp.i

CMakeFiles/glfw_scratch.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glfw_scratch.dir/src/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/rpmmcdougall/dev/opengl-learning/src/main.cpp -o CMakeFiles/glfw_scratch.dir/src/main.cpp.s

# Object files for target glfw_scratch
glfw_scratch_OBJECTS = \
"CMakeFiles/glfw_scratch.dir/src/main.cpp.o"

# External object files for target glfw_scratch
glfw_scratch_EXTERNAL_OBJECTS =

glfw_scratch: CMakeFiles/glfw_scratch.dir/src/main.cpp.o
glfw_scratch: CMakeFiles/glfw_scratch.dir/build.make
glfw_scratch: /usr/local/lib/libGLEW.dylib
glfw_scratch: CMakeFiles/glfw_scratch.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable glfw_scratch"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glfw_scratch.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/glfw_scratch.dir/build: glfw_scratch

.PHONY : CMakeFiles/glfw_scratch.dir/build

CMakeFiles/glfw_scratch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/glfw_scratch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/glfw_scratch.dir/clean

CMakeFiles/glfw_scratch.dir/depend:
	cd /Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rpmmcdougall/dev/opengl-learning /Users/rpmmcdougall/dev/opengl-learning /Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug /Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug /Users/rpmmcdougall/dev/opengl-learning/cmake-build-debug/CMakeFiles/glfw_scratch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/glfw_scratch.dir/depend

