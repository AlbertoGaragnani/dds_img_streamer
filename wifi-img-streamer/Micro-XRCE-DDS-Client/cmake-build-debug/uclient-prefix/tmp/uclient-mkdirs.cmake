# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/tmp"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/src/uclient-stamp"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/src"
  "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/src/uclient-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/src/uclient-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/alberto/GitRepo/Micro-XRCE-DDS-Client/cmake-build-debug/uclient-prefix/src/uclient-stamp${cfgdir}") # cfgdir has leading slash
endif()
