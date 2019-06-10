cmake_minimum_required(VERSION 3.13)

project(static-with-ssl-cmake CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_VERBOSE_MAKEFILE on)

include(../cmake/Conan.cmake)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(${PROJECT_NAME} ../src/main.cpp)
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})
