set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(CheckCXXCompilerFlag)
set(HIGHEST_SUPPORTED_CXX_STANDARD 11)

foreach(STANDARD 23 20 17 14)
    string(REPLACE "." "" CXX_STANDARD_FLAG "-std=c++${STANDARD}")
    check_cxx_compiler_flag(${CXX_STANDARD_FLAG} SUPPORTED_FLAG)
    if(SUPPORTED_FLAG)
        set(HIGHEST_SUPPORTED_CXX_STANDARD ${STANDARD})
        break()
    endif()
endforeach()

set(CMAKE_CXX_STANDARD ${HIGHEST_SUPPORTED_CXX_STANDARD})
add_compile_options(-Wall)
message(STATUS "Using C++${CMAKE_CXX_STANDARD} standard")
