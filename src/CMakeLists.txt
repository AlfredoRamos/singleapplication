include(FindCppStd)
include(GNUInstallDirs)
include(FindQtLib)
include(LibBuildType)

target_compile_options(
	"${PROJECT_NAME}"
	PRIVATE
	-fstack-protector-strong
	-D_FORTIFY_SOURCE=2
	-O2
)

target_link_options(
	"${PROJECT_NAME}"
	PRIVATE
	-Wl,-z,relro
	-Wl,-z,now
	-Wl,-z,noexecstack
)

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
	QT_NO_DEBUG_OUTPUT
	QT_NO_WARNING_OUTPUT
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
