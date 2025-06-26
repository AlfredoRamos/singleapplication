# Generate pkg-config file
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

option(GENERATE_PKG_CONFIG "Generate pkg-config file" OFF)

if(GENERATE_PKG_CONFIG)
	message(STATUS "Generating pkg-config file")

	set(PKG_CONFIG_CFLAGS "")
	set(PKG_CONFIG_LIBS "-l${PROJECT_NAME}")

	configure_file(
		"${CMAKE_SOURCE_DIR}/cmake/pkg-config-template.pc.in"
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
