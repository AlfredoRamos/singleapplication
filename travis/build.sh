#!/bin/bash --

# Build directory
# Build directory
if [[ ! -d build ]]; then
	mkdir build
fi

cd build

# Build library
qmake-qt5 ../ \
	CONFIG+=release \
	CONFIG+=pkgconfig
make

# Simulate installation
make INSTALL_ROOT=../pkg install
ls pkg/ -ARGgh

# Previous directory
cd ..
