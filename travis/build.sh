#!/bin/bash --

# Build directory
mkdir build
cd build

# Build library
qmake-qt5 ../ \
	CONFIG+=release \
	CONFIG+=pkgconfig
make

# Simullate installation
make INSTALL_ROOT=../pkg install
ls pkg/ -ARGgh

# Previous directory
cd ..
