# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment

# Include any dependencies generated for this target.
include CMakeFiles/PublisherClient.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/PublisherClient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PublisherClient.dir/flags.make

CMakeFiles/PublisherClient.dir/publisher.c.o: CMakeFiles/PublisherClient.dir/flags.make
CMakeFiles/PublisherClient.dir/publisher.c.o: publisher.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/PublisherClient.dir/publisher.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/PublisherClient.dir/publisher.c.o   -c /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/publisher.c

CMakeFiles/PublisherClient.dir/publisher.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/PublisherClient.dir/publisher.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/publisher.c > CMakeFiles/PublisherClient.dir/publisher.c.i

CMakeFiles/PublisherClient.dir/publisher.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/PublisherClient.dir/publisher.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/publisher.c -o CMakeFiles/PublisherClient.dir/publisher.c.s

CMakeFiles/PublisherClient.dir/HelloWorld.c.o: CMakeFiles/PublisherClient.dir/flags.make
CMakeFiles/PublisherClient.dir/HelloWorld.c.o: HelloWorld.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/PublisherClient.dir/HelloWorld.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/PublisherClient.dir/HelloWorld.c.o   -c /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c

CMakeFiles/PublisherClient.dir/HelloWorld.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/PublisherClient.dir/HelloWorld.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c > CMakeFiles/PublisherClient.dir/HelloWorld.c.i

CMakeFiles/PublisherClient.dir/HelloWorld.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/PublisherClient.dir/HelloWorld.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c -o CMakeFiles/PublisherClient.dir/HelloWorld.c.s

# Object files for target PublisherClient
PublisherClient_OBJECTS = \
"CMakeFiles/PublisherClient.dir/publisher.c.o" \
"CMakeFiles/PublisherClient.dir/HelloWorld.c.o"

# External object files for target PublisherClient
PublisherClient_EXTERNAL_OBJECTS =

PublisherClient: CMakeFiles/PublisherClient.dir/publisher.c.o
PublisherClient: CMakeFiles/PublisherClient.dir/HelloWorld.c.o
PublisherClient: CMakeFiles/PublisherClient.dir/build.make
PublisherClient: /usr/local/lib/libmicroxrcedds_client.a
PublisherClient: /usr/local/lib/libmicrocdr.a
PublisherClient: CMakeFiles/PublisherClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable PublisherClient"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PublisherClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PublisherClient.dir/build: PublisherClient

.PHONY : CMakeFiles/PublisherClient.dir/build

CMakeFiles/PublisherClient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PublisherClient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PublisherClient.dir/clean

CMakeFiles/PublisherClient.dir/depend:
	cd /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles/PublisherClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PublisherClient.dir/depend
