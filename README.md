### About

Single application library for Qt without `network` dependency. Based on [Dmitry Sazonov](https://stackoverflow.com/users/1035613/dmitry-sazonov)'s [code](https://stackoverflow.com/a/28172162).

[![Build Status](https://img.shields.io/travis/com/AlfredoRamos/singleapplication.svg?style=flat-square)](https://travis-ci.com/AlfredoRamos/singleapplication) [![Latest Stable Version](https://img.shields.io/github/tag/AlfredoRamos/singleapplication.svg?style=flat-square&label=stable)](https://github.com/AlfredoRamos/singleapplication/releases) [![License](https://img.shields.io/github/license/AlfredoRamos/singleapplication.svg?style=flat-square)](https://raw.githubusercontent.com/AlfredoRamos/singleapplication/master/LICENSE)

### Dependencies

- Qt >= 5.9.2
- C++11 compiler support

### Usage

#### Inside a project

Include the `singleapplication.pri` file within your project file:

**application.pro**
```qmake
include(singleapplication/singleapplication.pri)
```
___

#### Installed library

If you prefer to install the library on you system, you can do it with the following commands:

```shell
git clone https://github.com/AlfredoRamos/singleapplication.git
cd singleapplication
mkdir build
cd build
qmake ../ CONFIG+=release
make
make install
```

**Note:** If you also want to generate the pkg-config file, replace the previous `qmake` command with the following:

```shell
qmake ../ CONFIG+=release CONFIG+=pkgconfig
```

Once the files are installed on your system, add the library in your project file:

**application.pro**
```qmake
LIBS += -lsingleapplication
```

Alternatively you can use the library with `pkg-config`:

**application.pro**
```qmake
CONFIG += link_pkgconfig
PKGCONFIG += singleapplication
```

___

#### In your Qt/C++ application

Include the library:

**main.cpp**
```cpp
// Inside a project
//#include "singleapplication.hpp"

// Installed library
//#include <singleapplication.hpp>

int main(int argc, char *argv[])
{
	SingleApplication *guard = new SingleApplication("key_string");

	if (!guard->createInstance()) {
		// Another instance of this application is already running
		return 0;
	}

	QApplication a(argc, argv);
	//...
}
```

The constructor of the `SingleApplication` class takes at the first and only parameter, a unique `Qstring`, it can be random generated one or information from the application, like `QCoreApplication::applicationName()`.
