QT -= gui

TEMPLATE = lib
TARGET = singleapplication
CONFIG += dll

DEFINES += SINGLEAPPLICATION_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x050902

# Library version
include(src/version.pri)

# Source code
include(singleapplication.pri)

unix {
	isEmpty(PREFIX) {
		PREFIX = $$[QT_HOST_PREFIX]
	}

	LIBRARY_DIR = $${PREFIX}/lib
	INCLUDE_DIR = $${PREFIX}/include

	# Create pkg-config file
	include (src/pkgconfig.pri)

	target.path = $${LIBRARY_DIR}
	headers.path = $${INCLUDE_DIR}
	headers.files = $${HEADERS}

	INSTALLS += target headers
}
