#!/bin/bash --

# Build directory
cd build

# Run tests
make check

# Simulate installation
make INSTALL_ROOT=../pkg install
ls pkg/ -ARGgh

# Previous directory
cd ..
