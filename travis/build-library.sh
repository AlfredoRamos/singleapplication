#!/bin/bash --

# Build library
mkdir build
cd build
qmake-qt5 ../ \
	CONFIG+=release
make
cd ..
