cmake_minimum_required (VERSION 3.12)
set(MY_PROJECT_DEPENDENCIES Catch2)

# This section of cmake is using AutoVcpkg to download, install, and configure vcpkg.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
message(STATUS "CMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}")
include(AutoVcpkg)
vcpkg_install(${MY_PROJECT_DEPENDENCIES})
message(STATUS "CMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}")

project (vcpkg_test CXX)
set(CMAKE_CXX_STANDARD 17)
