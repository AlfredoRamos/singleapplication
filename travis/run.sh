#!/bin/bash --

# Build directory
if [[ ! -d build ]]; then
	mkdir build
fi

cd build

# Build tests
qmake-qt5 ../tests/
make

# Run tests
make check
make distclean

# Previous directory
cd ..
