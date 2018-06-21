#!/bin/bash --

set -e

# Build directory
if [[ ! -d build ]]; then
	mkdir build
fi

cd build

# Build tests
qmake-qt5 ../tests/ \
	QMAKE_CC="${CC}" \
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXX="${CXX}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}"
make

# Run tests
make check
make distclean

# Previous directory
cd ..
