# Generate pkg-config file (*.pc)
CONFIG += create_pc create_prl no_install_prl

# pkg-config file metadata
QMAKE_PKGCONFIG_NAME = SingleApplication
QMAKE_PKGCONFIG_FILE = $${TARGET}
QMAKE_PKGCONFIG_VERSION = $${VERSION}
QMAKE_PKGCONFIG_DESCRIPTION = A SingleApplication library fo Qt applications
QMAKE_PKGCONFIG_PREFIX = $$[QT_HOST_PREFIX]
QMAKE_PKGCONFIG_LIBDIR = $$[QT_HOST_LIBS]
QMAKE_PKGCONFIG_INCDIR = $${QMAKE_PKGCONFIG_PREFIX}/include/$${QMAKE_PKGCONFIG_NAME}
QMAKE_PKGCONFIG_DESTDIR = ../pkgconfig
