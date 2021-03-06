pkgconfig {
	CONFIG += create_pc create_prl no_install_prl

	QMAKE_PKGCONFIG_NAME = SingleApplication
	QMAKE_PKGCONFIG_FILE = $${TARGET}
	QMAKE_PKGCONFIG_VERSION = $${VERSION}
	QMAKE_PKGCONFIG_DESCRIPTION = Single application library for Qt without network dependency
	QMAKE_PKGCONFIG_PREFIX = $${PREFIX}
	QMAKE_PKGCONFIG_LIBDIR = $${LIBRARY_DIR}
	QMAKE_PKGCONFIG_INCDIR = $${INCLUDE_DIR}
	QMAKE_PKGCONFIG_DESTDIR = pkgconfig
}
