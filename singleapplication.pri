# Qt version check
include($${PWD}/qmake/qt_version_check.pri)

CONFIG += c++11

INCLUDEPATH += $${PWD}/src

SOURCES += $${PWD}/src/singleapplication.cpp

HEADERS += $${PWD}/src/singleapplication.hpp
