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
include CMakeFiles/SubscriberClient.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SubscriberClient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SubscriberClient.dir/flags.make

CMakeFiles/SubscriberClient.dir/subscriber.c.o: CMakeFiles/SubscriberClient.dir/flags.make
CMakeFiles/SubscriberClient.dir/subscriber.c.o: subscriber.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/SubscriberClient.dir/subscriber.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/SubscriberClient.dir/subscriber.c.o   -c /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/subscriber.c

CMakeFiles/SubscriberClient.dir/subscriber.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SubscriberClient.dir/subscriber.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/subscriber.c > CMakeFiles/SubscriberClient.dir/subscriber.c.i

CMakeFiles/SubscriberClient.dir/subscriber.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SubscriberClient.dir/subscriber.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/subscriber.c -o CMakeFiles/SubscriberClient.dir/subscriber.c.s

CMakeFiles/SubscriberClient.dir/HelloWorld.c.o: CMakeFiles/SubscriberClient.dir/flags.make
CMakeFiles/SubscriberClient.dir/HelloWorld.c.o: HelloWorld.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/SubscriberClient.dir/HelloWorld.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/SubscriberClient.dir/HelloWorld.c.o   -c /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c

CMakeFiles/SubscriberClient.dir/HelloWorld.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SubscriberClient.dir/HelloWorld.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c > CMakeFiles/SubscriberClient.dir/HelloWorld.c.i

CMakeFiles/SubscriberClient.dir/HelloWorld.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SubscriberClient.dir/HelloWorld.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/HelloWorld.c -o CMakeFiles/SubscriberClient.dir/HelloWorld.c.s

# Object files for target SubscriberClient
SubscriberClient_OBJECTS = \
"CMakeFiles/SubscriberClient.dir/subscriber.c.o" \
"CMakeFiles/SubscriberClient.dir/HelloWorld.c.o"

# External object files for target SubscriberClient
SubscriberClient_EXTERNAL_OBJECTS =

SubscriberClient: CMakeFiles/SubscriberClient.dir/subscriber.c.o
SubscriberClient: CMakeFiles/SubscriberClient.dir/HelloWorld.c.o
SubscriberClient: CMakeFiles/SubscriberClient.dir/build.make
SubscriberClient: /usr/local/lib/libmicroxrcedds_client.a
SubscriberClient: /usr/local/lib/libmicrocdr.a
SubscriberClient: CMakeFiles/SubscriberClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable SubscriberClient"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SubscriberClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SubscriberClient.dir/build: SubscriberClient

.PHONY : CMakeFiles/SubscriberClient.dir/build

CMakeFiles/SubscriberClient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SubscriberClient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SubscriberClient.dir/clean

CMakeFiles/SubscriberClient.dir/depend:
	cd /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment /home/alberto/GitRepo/Micro-XRCE-DDS-Client/examples/Deployment/CMakeFiles/SubscriberClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SubscriberClient.dir/depend
