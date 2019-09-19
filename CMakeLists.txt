cmake_minimum_required (VERSION 3.12)

project (vcpkg_test CXX)

set(VCPKG_TEST_DEPENDENCIES Catch2)

# This section of cmake is using AutoVcpkg to download, install, and configure vcpkg.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
include(AutoVcpkg)
vcpkg_install(${VCPKG_TEST_DEPENDENCIES})

add_executable(${PROJECT_NAME})
set(CMAKE_CXX_STANDARD 17)

find_package(Catch2 CONFIG REQUIRED)

message(STATUS ${VCPKG_TEST_ROOT})

target_link_libraries(${PROJECT_NAME} PRIVATE Catch2::Catch2)
target_sources(${PROJECT_NAME}
    PRIVATE ${VCPKG_TEST_ROOT}/_test/catch-test.cpp
    ${VCPKG_TEST_ROOT}/_test/main.cpp
)
