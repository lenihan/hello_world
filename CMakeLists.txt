# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("hello_world")

# Include sub-projects.
add_subdirectory ("src/hello_cmake")
add_subdirectory ("src/hello_qt")


