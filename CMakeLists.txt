﻿# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

# From https://github.com/Microsoft/vcpkg#vcpkg-as-a-submodule
# Do this before project()
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/third_party/vcpkg/scripts/buildsystems/vcpkg.cmake
  CACHE STRING "Vcpkg toolchain file")

project ("hello_world")

include_directories("${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include")

# Include sub-projects.
add_subdirectory ("src/hello_cmake")
add_subdirectory ("src/hello_qt")
add_subdirectory ("src/hello_osg")

