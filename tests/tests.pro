QT += testlib
QT -= gui

TARGET = tst_singleapplicationtest
CONFIG += console testcase
CONFIG -= app_bundle

TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x050000

SOURCES += tst_singleapplicationtest.cpp

# Single Application
include(../singleapplication.pri)
