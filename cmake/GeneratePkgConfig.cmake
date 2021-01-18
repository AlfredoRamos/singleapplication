option(
	GENERATE_PKG_CONFIG
	"Generate pkg-config file"
	OFF
)

if(GENERATE_PKG_CONFIG)
	message(STATUS "Generating pkg-config file")

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
