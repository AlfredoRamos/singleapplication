set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

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
message(STATUS "Using C++${CMAKE_CXX_STANDARD} standard")

add_compile_options(-Wall -Wextra -Werror -fstack-protector-strong -D_FORTIFY_SOURCE=2 -fPIC -O2 -DNDEBUG)
add_link_options(-Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack)

if (CMAKE_BUILD_TYPE MATCHES Debug)
	message(STATUS "Enabling sanitizers for Debug build")
	add_compile_options(-fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer)
	add_link_options(-fsanitize=address -fsanitize=undefined)
endif()
