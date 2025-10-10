# Find and set C++ standard
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

include(CheckIPOSupported)
check_ipo_supported(RESULT ipo_supported OUTPUT ipo_error)
if(ipo_supported)
	set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
else()
	message(WARNING "IPO/LTO is not supported: ${ipo_error}")
endif()

include(CheckCXXCompilerFlag)
set(HIGHEST_SUPPORTED_CXX_STANDARD ${CMAKE_CXX_STANDARD})

foreach(STANDARD 23 20)
	string(REPLACE "." "" CXX_STANDARD_FLAG "-std=c++${STANDARD}")
	check_cxx_compiler_flag(${CXX_STANDARD_FLAG} SUPPORTED_FLAG)
	if(SUPPORTED_FLAG)
		set(HIGHEST_SUPPORTED_CXX_STANDARD ${STANDARD})
		break()
	endif()
endforeach()

set(CMAKE_CXX_STANDARD ${HIGHEST_SUPPORTED_CXX_STANDARD})
message(STATUS "Using ${CMAKE_CXX_COMPILER_ID} C++ compiler with C++${CMAKE_CXX_STANDARD} standard")

add_compile_options(-Wall -Wextra -Werror -fstack-protector-strong -fstack-clash-protection -D_FORTIFY_SOURCE=2 -O2 -DNDEBUG)
add_link_options(-Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pie")

if(CMAKE_CXX_COMPILER_ID MATCHES Clang)
	add_compile_options(-fsanitize=cfi)
	add_link_options(-fsanitize=cfi)
endif()

if(CMAKE_BUILD_TYPE MATCHES Release)
	add_link_options(-s)
elseif(CMAKE_BUILD_TYPE MATCHES Debug)
	message(STATUS "Enabling sanitizers for Debug build")
	add_compile_options(-fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer)
	add_link_options(-fsanitize=address -fsanitize=undefined)
endif()
