#!/bin/bash --

# Build directory
mkdir build
cd build

# Build library
qmake-qt5 ../ \
	CONFIG+=release \
	CONFIG+=pkgconfig \
	CONFIG+=tests
make

# Previous directory
cd ..
