#!/bin/bash --

set -e

# source /opt/qt59/bin/qt59-env.sh
QT_BASE_DIR=/opt/qt59
export QTDIR="${QT_BASE_DIR}"
export PATH="${QT_BASE_DIR}"/bin:"${PATH}"

if [[ $(uname -m) == "x86_64" ]]; then
  export LD_LIBRARY_PATH="${QT_BASE_DIR}"/lib/x86_64-linux-gnu:"${QT_BASE_DIR}"/lib:"${LD_LIBRARY_PATH}"
else
  export LD_LIBRARY_PATH="${QT_BASE_DIR}"/lib/i386-linux-gnu:"${QT_BASE_DIR}"/lib:"${LD_LIBRARY_PATH}"
fi

export PKG_CONFIG_PATH="${QT_BASE_DIR}"/lib/pkgconfig:"${PKG_CONFIG_PATH}"

# Fix environment variables
unset CC
unset CXX

if [[ "${COMPILER}" == "clang" ]]; then
	export CC="clang-7"
	export CXX="clang++-7"
else
	export CC="gcc-8"
	export CXX="g++-8"
fi

# Show information
"${CXX}" --version
qmake --version
