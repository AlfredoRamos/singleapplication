!versionAtLeast(QT_VERSION, 5.9.2) {
	error("This library requires Qt version equal or greater than 5.9.2")
}

CONFIG += c++14

INCLUDEPATH += $${PWD}/src

SOURCES += $${PWD}/src/singleapplication.cpp

HEADERS += $${PWD}/src/singleapplication.hpp
