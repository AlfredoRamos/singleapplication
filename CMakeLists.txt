cmake_minimum_required(VERSION 3.18.0)

project(
	singleapplication
	LANGUAGES CXX
	VERSION 1.0.3
	DESCRIPTION "Single application library for Qt without network dependency."
	HOMEPAGE_URL "https://github.com/AlfredoRamos/singleapplication"
)

if ("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
	message(FATAL_ERROR "In-source builds are not allowed")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_options(-Wall)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)

add_library(
	"${PROJECT_NAME}"
	SHARED
)

target_sources(
	"${PROJECT_NAME}"
	PRIVATE
	src/singleapplication.hpp
	src/singleapplication.cpp
)

target_link_libraries(
	"${PROJECT_NAME}"
	Qt${QT_VERSION_MAJOR}::Core
)

target_compile_definitions(
	"${PROJECT_NAME}"
	PUBLIC
	SINGLEAPPLICATION_LIBRARY
)

set_target_properties(
	"${PROJECT_NAME}"
	PROPERTIES
	VERSION "${PROJECT_VERSION}"
	SOVERSION "${PROJECT_VERSION_MAJOR}"
)
