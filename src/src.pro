QT -= gui

TEMPLATE = lib
TARGET = singleapplication
CONFIG += dll

DEFINES += SINGLEAPPLICATION_LIBRARY
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x050000

# Source code
include(../singleapplication.pri)

unix {
	isEmpty(PREFIX) {
		PREFIX = $$[QT_HOST_PREFIX]
	}

	# Create pkg-config file
	include (pkgconfig.pri)

	target.path = $${PREFIX}/lib
	headers.path = $${PREFIX}/include/$${TARGET}
	headers.files = $${HEADERS}

	INSTALLS += target headers
}
