set(QT_MINIMUM_VERSION 5.9.2)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)

if(QT_VERSION VERSION_LESS QT_MINIMUM_VERSION)
	message(FATAL_ERROR "This library requires Qt >= ${QT_MINIMUM_VERSION}, found ${QT_VERSION}")
else()
	message(STATUS "Building with Qt ${QT_VERSION}")
endif()