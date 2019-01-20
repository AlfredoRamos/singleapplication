#!/bin/bash --

set -e

# Base dir
base_dir="$(pwd)"
build_dir="${base_dir}"/build

# Build directory
if [[ ! -d "${build_dir}" ]]; then
	mkdir -p "${build_dir}"
fi

# Change to build directory
cd "${build_dir}"

# Build library
qmake ../ \
	QMAKE_CC="${CC}" \
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXX="${CXX}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}" \
	QMAKE_LINK="${CXX}" \
	CONFIG+=release \
	CONFIG+=pkgconfig \
	PREFIX=/usr
make

# Simulate installation
make INSTALL_ROOT=pkg install
make distclean
tree -p pkg/

# Build tests
qmake ../tests/ \
	QMAKE_CC="${CC}" \
	QMAKE_CFLAGS="${CFLAGS}" \
	QMAKE_CXX="${CXX}" \
	QMAKE_CXXFLAGS="${CXXFLAGS}" \
	QMAKE_LINK="${CXX}"
make

# Run tests
make check
make distclean

# Change to base directory
cd "${base_dir}"
