cmake_minimum_required(VERSION 3.13)

project(static-no-ssl-cmake_paths CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_VERBOSE_MAKEFILE on)

include(../cmake/Conan.cmake)
include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

# Conan uses '-static' suffix for static Paho MQTT C library file,
# but FinaPahoMqttC.cmake in Paho MQTT Cpp does not support this.
# See https://github.com/eclipse/paho.mqtt.cpp/pull/194
find_library(PAHO_MQTT_C_LIBRARIES NAMES paho-mqtt3a-static)
find_package(PahoMqttCpp REQUIRED)

add_executable(${PROJECT_NAME} ../src/main.cpp)
target_link_libraries(${PROJECT_NAME} PahoMqttCpp::paho-mqttpp3-static)
