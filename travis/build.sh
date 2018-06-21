#!/bin/bash --

set -e

# Build directory
if [[ ! -d build ]]; then
	mkdir build
fi

cd build

# Build library
qmake-qt5 ../ \
	QMAKE_CC="${CC}" \
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXX="${CXX}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}" \
	CONFIG+=release \
	CONFIG+=pkgconfig
make

# Simulate installation
make INSTALL_ROOT=pkg install
make distclean
tree -p pkg/

# Previous directory
cd ..
