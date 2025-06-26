# Build tests for Single application library for Qt without network dependency
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

cmake_minimum_required(VERSION 3.18.0)

project(singleapplication_tests LANGUAGES CXX)

if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
	message(FATAL_ERROR "In-source builds are not allowed")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_options(-Wall)

include(GNUInstallDirs)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/../cmake")
include(FindQtLib)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Test)

enable_testing(true)
add_executable("${PROJECT_NAME}")
add_test(
	NAME "${PROJECT_NAME}"
	COMMAND "${PROJECT_NAME}"
)

target_include_directories(
	"${PROJECT_NAME}"
	PUBLIC
	"${PROJECT_SOURCE_DIR}/../src"
)

target_sources(
	"${PROJECT_NAME}"
	PRIVATE
	tst_singleapplicationtest.cpp
	"${PROJECT_SOURCE_DIR}/../src/singleapplication.hpp"
	"${PROJECT_SOURCE_DIR}/../src/singleapplication.cpp"
)

target_link_libraries(
	"${PROJECT_NAME}"
	Qt${QT_VERSION_MAJOR}::Test
)
