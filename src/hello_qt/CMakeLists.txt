# CMakeList.txt : CMake project for hello_qt, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

# Add source to this project's executable.
add_executable (hello_qt "hello_qt.cpp")

# TODO: Add tests and install targets if needed.

include_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/include/qt5/QtWidgets")
include_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/include/qt5/QtGui")
include_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/include/qt5")

# link_libraries("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib/Qt5Widgetsd.lib")
# link_libraries("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib/Qt5Cored.lib")
# add_library("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib/Qt5Cored.lib" SHARED)

# link_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib/Qt5Widgetsd.lib")
# link_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib/Qt5Cored.lib")

# target_link_directories("C:/Users/david/src/hello_world/third_party/vcpkg/installed/x64-windows/debug/lib")
target_link_libraries(hello_qt "C:\\Users\\david\\src\\hello_world\\third_party\\vcpkg\\installed\\x64-windows\\debug\\lib\\Qt5Cored.lib")
target_link_libraries(hello_qt "C:\\Users\\david\\src\\hello_world\\third_party\\vcpkg\\installed\\x64-windows\\debug\\lib\\Qt5Guid.lib")
target_link_libraries(hello_qt "C:\\Users\\david\\src\\hello_world\\third_party\\vcpkg\\installed\\x64-windows\\debug\\lib\\Qt5Widgetsd.lib")


# TODO:
# 1: Add step to copy         C:\Users\david\src\hello_world\third_party\vcpkg\buildtrees\qt5-base\x64-windows-dbg\plugins\platforms to 
#                             C:\Users\david\src\hello_world\out\build\x64-Debug\src\hello_qt
# 2: Copy required dll's from C:\Users\david\src\hello_world\third_party\vcpkg\installed\x64-windows\debug\bin to
#                             C:\Users\david\src\hello_world\out\build\x64-Debug\src\hello_qt
# 3: Fix out\build\x64-Debug\src\hello_qt\hello_qt.exe...remove src
# 4: Get rid of david...make generic
# 5: Integrate vcpkg...see vcpkg/readme.md