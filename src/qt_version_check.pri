# Helper variables
QTMAJVER=5
QTMINVER=9
QTPATVER=2
QTVERSIONSUPPORTED=0

# Compare Qt versions.
# Similar to versionAtLeast() but for Qt < 5.10.0
!lessThan(QT_MAJOR_VERSION, $${QTMAJVER}) { # >=
	greaterThan(QT_MAJOR_VERSION, $${QTMAJVER}) { # >
		QTVERSIONSUPPORTED=1
	} else { # ==
		!lessThan(QT_MINOR_VERSION, $${QTMINVER}) { # >=
			greaterThan(QT_MINOR_VERSION, $${QTMINVER}) { # >
				QTVERSIONSUPPORTED=1
			} else { # ==
				!lessThan(QT_PATCH_VERSION, $${QTPATVER}) { # >=
					QTVERSIONSUPPORTED=1
				}
			}
		}
	}
}

# Cancel build
!equals(QTVERSIONSUPPORTED, 1) {
	error("This library requires Qt >= $${QTMAJVER}.$${QTMINVER}.$${QTPATVER}, found $${QT_VERSION}")
}

# Cleanup
unset(QTMAJVER)
unset(QTMINVER)
unset(QTPATVER)
unset(QTVERSIONSUPPORTED)
