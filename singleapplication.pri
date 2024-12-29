# Qt version check
include($${PWD}/qmake/qt_version_check.pri)

lessThan(QT_MAJOR_VERSION, 6) {
	CONFIG += c++11
} else {
	CONFIG += c++1z
}

message("Building $${TARGET} with Qt $${QT_VERSION}")

INCLUDEPATH += $${PWD}/src

SOURCES += $${PWD}/src/singleapplication.cpp

HEADERS += $${PWD}/src/singleapplication.hpp
