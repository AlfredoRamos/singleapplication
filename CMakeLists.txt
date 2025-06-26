# Single application library for Qt without network dependency
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

cmake_minimum_required(VERSION 3.18.0)

project(
	singleapplication
	LANGUAGES CXX
	VERSION 1.2.0
	DESCRIPTION "Single application library for Qt without network dependency"
	HOMEPAGE_URL "https://github.com/AlfredoRamos/singleapplication"
)

if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
	message(FATAL_ERROR "In-source builds are not allowed")
endif()

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

add_subdirectory(src)

message(STATUS "Building ${PROJECT_NAME} ${PROJECT_VERSION}")
