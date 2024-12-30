option(STATIC_LIB "Build static library" OFF)

if(STATIC_LIB)
	add_library("${PROJECT_NAME}" STATIC)
	message(STATUS "Building as static library")
else()
	add_library("${PROJECT_NAME}" SHARED)
	message(STATUS "Building as shared library")
endif()
