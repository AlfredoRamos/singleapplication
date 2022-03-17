set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_options(-Wall)

include(GNUInstallDirs)
include(FindQtLib)

add_library("${PROJECT_NAME}" SHARED)

target_sources(
	"${PROJECT_NAME}"
	PRIVATE
	singleapplication.hpp
	singleapplication.cpp
)

target_include_directories(
	"${PROJECT_NAME}"
	PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_libraries(
	"${PROJECT_NAME}"
	Qt${QT_VERSION_MAJOR}::Core
)

target_compile_definitions(
	"${PROJECT_NAME}"
	PUBLIC
	SINGLEAPPLICATION_LIBRARY
	QT_DEPRECATED_WARNINGS
	QT_DISABLE_DEPRECATED_BEFORE=0x050902
)

set_target_properties(
	"${PROJECT_NAME}"
	PROPERTIES
	VERSION "${PROJECT_VERSION}"
	SOVERSION "${PROJECT_VERSION_MAJOR}"
	PUBLIC_HEADER singleapplication.hpp
)

install(
	TARGETS "${PROJECT_NAME}"
	LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
	PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

include(GeneratePkgConfig)
