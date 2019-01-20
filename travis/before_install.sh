#!/bin/bash --

set -e

if [[ ! -z "${QT}" ]]; then
	# source /opt/qt59/bin/qt{59,512}-env.sh
	QT_BASE_DIR=/opt/qt"${QT//./}"
	export QTDIR="${QT_BASE_DIR}"
	export PATH="${QT_BASE_DIR}"/bin:"${PATH}"

	if [[ $(uname -m) == "x86_64" ]]; then
	  export LD_LIBRARY_PATH="${QT_BASE_DIR}"/lib/x86_64-linux-gnu:"${QT_BASE_DIR}"/lib:"${LD_LIBRARY_PATH}"
	else
	  export LD_LIBRARY_PATH="${QT_BASE_DIR}"/lib/i386-linux-gnu:"${QT_BASE_DIR}"/lib:"${LD_LIBRARY_PATH}"
	fi

	export PKG_CONFIG_PATH="${QT_BASE_DIR}"/lib/pkgconfig:"${PKG_CONFIG_PATH}"
fi

# fix compilers
if [[ ! -z "${COMPILERS}" ]]; then
	eval "${COMPILERS}"
fi
