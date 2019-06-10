find_program(CONAN_EXE NAMES "conan")

if (NOT EXISTS ${CONAN_EXE})
    message(FATAL_ERROR "Conan: not found")
else ()
    message(STATUS "Conan: using ${CONAN_EXE}")
endif ()

execute_process(
        COMMAND
            ${CONAN_EXE}
            install --install-folder
            ${CMAKE_BINARY_DIR}
            --build missing
            -s compiler.libcxx=libstdc++11
            ${CMAKE_SOURCE_DIR}
        RESULT_VARIABLE return_code
)

if (NOT ${return_code} EQUAL 0)
    message(FATAL_ERROR "Conan: install failed")
endif ()
