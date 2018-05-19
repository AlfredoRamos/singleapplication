### About

Single Application library for Qt without `network` dependency. Based on [Dmitry Sazonov](https://stackoverflow.com/users/1035613/dmitry-sazonov)'s [code](https://stackoverflow.com/a/28172162).

[![Build Status](https://travis-ci.com/AlfredoRamos/singleapplication.svg?branch=master)](https://travis-ci.com/AlfredoRamos/singleapplication) [![Latest Stable Version](https://img.shields.io/github/tag/AlfredoRamos/singleapplication.svg?maxAge=3600&label=stable)](https://github.com/AlfredoRamos/singleapplication/releases) [![License](https://img.shields.io/github/license/AlfredoRamos/singleapplication.svg)](https://raw.githubusercontent.com/AlfredoRamos/singleapplication/master/LICENSE)

### Dependencies

- Qt >= 5.0.0

### Usage

#### Inside a project

Include the `singleapplication.pri` file within your project file:

**application.pro**
```qmake
include(singleapplication/singleapplication.pri)
```
___

#### Installed shared library

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

Once the files are installed on your system, add the library in your project file:

**application.pro**
```qmake
LIBS += -lsingleapplication
```
___

#### In your Qt/C++ application

Include the library:

**main.cpp**
```cpp
// ...
// Inside a project
//#include "singleapplication.hpp"

// Installed shared library
//#include "singleapplication/singleapplication.hpp"

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
