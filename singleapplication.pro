lessThan(QT_MAJOR_VERSION, 5) {
	error("This app requires Qt 5 or later")
}

TEMPLATE = subdirs

SUBDIRS += src
