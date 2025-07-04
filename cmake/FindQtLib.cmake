# Find and set Qt version
# https://github.com/AlfredoRamos/singleapplication
#
# @author Alfredo Ramos <alfredo.ramos@proton.me>
# @copyright 2018 Alfredo Ramos (https://alfredoramos.mx)
# @license GPL-3.0-or-later

set(QT_MINIMUM_VERSION 5.9.2)

option(USE_QT5 "Use Qt 5 instead of the higher major version available" OFF)

set(CMAKE_FIND_PACKAGE_SORT_ORDER NATURAL)
set(CMAKE_FIND_PACKAGE_SORT_DIRECTION DEC)

if(USE_QT5)
	set(CMAKE_FIND_PACKAGE_SORT_DIRECTION ASC)
endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)

if(QT_VERSION VERSION_LESS QT_MINIMUM_VERSION)
	message(FATAL_ERROR "This library requires Qt >= ${QT_MINIMUM_VERSION}, found ${QT_VERSION}")
else()
	message(STATUS "Using Qt ${QT_VERSION}")
endif()

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
