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
CMAKE_SOURCE_DIR = /home/alberto/GitRepo/Micro-XRCE-DDS-Client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build

# Utility rule file for uclient.

# Include the progress variables for this target.
include CMakeFiles/uclient.dir/progress.make

CMakeFiles/uclient: CMakeFiles/uclient-complete


CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-install
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-mkdir
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-download
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-update
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-patch
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-configure
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-build
CMakeFiles/uclient-complete: uclient-prefix/src/uclient-stamp/uclient-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'uclient'"
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles/uclient-complete
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-done

uclient-prefix/src/uclient-stamp/uclient-install: uclient-prefix/src/uclient-stamp/uclient-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'uclient'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-install

uclient-prefix/src/uclient-stamp/uclient-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'uclient'"
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/tmp
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src
	/usr/bin/cmake -E make_directory /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-mkdir

uclient-prefix/src/uclient-stamp/uclient-download: uclient-prefix/src/uclient-stamp/uclient-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'uclient'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-download

uclient-prefix/src/uclient-stamp/uclient-update: uclient-prefix/src/uclient-stamp/uclient-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'uclient'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-update

uclient-prefix/src/uclient-stamp/uclient-patch: uclient-prefix/src/uclient-stamp/uclient-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'uclient'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-patch

uclient-prefix/src/uclient-stamp/uclient-configure: microcdr/src/microcdr-stamp/microcdr-done
uclient-prefix/src/uclient-stamp/uclient-configure: uclient-prefix/tmp/uclient-cfgcmd.txt
uclient-prefix/src/uclient-stamp/uclient-configure: uclient-prefix/src/uclient-stamp/uclient-update
uclient-prefix/src/uclient-stamp/uclient-configure: uclient-prefix/src/uclient-stamp/uclient-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'uclient'"
	/usr/bin/cmake "-GUnix Makefiles" -C/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/tmp/uclient-cache-.cmake /home/alberto/GitRepo/Micro-XRCE-DDS-Client
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-configure

uclient-prefix/src/uclient-stamp/uclient-build: uclient-prefix/src/uclient-stamp/uclient-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'uclient'"
	$(MAKE)
	/usr/bin/cmake -E touch /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/uclient-prefix/src/uclient-stamp/uclient-build

uclient: CMakeFiles/uclient
uclient: CMakeFiles/uclient-complete
uclient: uclient-prefix/src/uclient-stamp/uclient-install
uclient: uclient-prefix/src/uclient-stamp/uclient-mkdir
uclient: uclient-prefix/src/uclient-stamp/uclient-download
uclient: uclient-prefix/src/uclient-stamp/uclient-update
uclient: uclient-prefix/src/uclient-stamp/uclient-patch
uclient: uclient-prefix/src/uclient-stamp/uclient-configure
uclient: uclient-prefix/src/uclient-stamp/uclient-build
uclient: CMakeFiles/uclient.dir/build.make

.PHONY : uclient

# Rule to build all files generated by this target.
CMakeFiles/uclient.dir/build: uclient

.PHONY : CMakeFiles/uclient.dir/build

CMakeFiles/uclient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/uclient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/uclient.dir/clean

CMakeFiles/uclient.dir/depend:
	cd /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alberto/GitRepo/Micro-XRCE-DDS-Client /home/alberto/GitRepo/Micro-XRCE-DDS-Client /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build /home/alberto/GitRepo/Micro-XRCE-DDS-Client/build/CMakeFiles/uclient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/uclient.dir/depend

