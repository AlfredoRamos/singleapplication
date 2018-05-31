#!/bin/bash --

set -e

# Static code analysis
cppcheck \
	--report-progress \
	--enable=all \
	--inconclusive \
	--std=c++11 \
	--std=c++14 \
	src/
