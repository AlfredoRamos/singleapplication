include(FindCppStd)
include(GNUInstallDirs)
include(FindQtLib)

if(SINGLEAPPLICATION_BUILD_STATIC_LIB)
    add_library("${PROJECT_NAME}" STATIC)
    message(STATUS "singleapplication build as static lib")
else ()
    add_library("${PROJECT_NAME}" SHARED)
    message(STATUS "singleapplication build as share lib")
endif ()

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
