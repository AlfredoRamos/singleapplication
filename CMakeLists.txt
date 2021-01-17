cmake_minimum_required(VERSION 3.18.0)

project(
	singleapplication
	LANGUAGES CXX
	VERSION 1.0.3
	DESCRIPTION "Single application library for Qt without network dependency"
	HOMEPAGE_URL "https://github.com/AlfredoRamos/singleapplication"
)

if("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}")
	message(FATAL_ERROR "In-source builds are not allowed")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_options(-Wall)
set(QT_MINIMUM_VERSION 5.9.2)

include(GNUInstallDirs)
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)

if(QT_VERSION VERSION_LESS QT_MINIMUM_VERSION)
	message(FATAL_ERROR "This library requires Qt >= ${QT_MINIMUM_VERSION}, found ${QT_VERSION}")
else()
	message(STATUS "Building with Qt ${QT_VERSION}")
endif()

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
	PUBLIC_HEADER src/singleapplication.hpp
)

install(
	TARGETS "${PROJECT_NAME}"
	LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
	PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

option(
	GENERATE_PKG_CONFIG
	"Generate pkg-config file"
	OFF
)

if(GENERATE_PKG_CONFIG)
	set(PKG_CONFIG_CFLAGS "")
	set(PKG_CONFIG_LIBS "-l${PROJECT_NAME}")

	configure_file(
		cmake/pkg-config-template.pc.in
		"${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc"
		@ONLY
		NO_SOURCE_PERMISSIONS
		NEWLINE_STYLE UNIX
	)

	install(
		FILES "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc"
		DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig"
	)
endif()
