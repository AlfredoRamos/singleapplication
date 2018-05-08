lessThan(QT_MAJOR_VERSION, 5) {
	error("This app requires Qt 5 or later")
}

CONFIG += c++14

INCLUDEPATH += $${PWD}/src

SOURCES += $${PWD}/src/singleapplication.cpp

HEADERS += $${PWD}/src/singleapplication.hpp

# Library version
include(version.pri)
