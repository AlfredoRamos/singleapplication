# Set build type
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

option(STATIC_LIB "Build static library" OFF)

if(STATIC_LIB)
	add_library("${PROJECT_NAME}" STATIC)
	message(STATUS "Building as static library")
else()
	add_library("${PROJECT_NAME}" SHARED)
	message(STATUS "Building as shared library")
endif()
