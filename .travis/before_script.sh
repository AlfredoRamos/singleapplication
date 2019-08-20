#!/bin/bash --

set -e

# Show information
"${CXX}" --version
qmake --version
cppcheck --version

# Static analysis
cppcheck \
	--enable=all \
	--inconclusive \
	--report-progress \
	--std=c++11 \
	src/
