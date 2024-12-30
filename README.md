### About

Single application library for Qt without `network` dependency. Based on [Dmitry Sazonov](https://stackoverflow.com/users/1035613/dmitry-sazonov)'s [code](https://stackoverflow.com/a/28172162).

[![Build Status](https://img.shields.io/github/actions/workflow/status/AlfredoRamos/singleapplication/ci.yml?style=flat-square)](https://github.com/AlfredoRamos/singleapplication/actions)
[![Latest Stable Version](https://img.shields.io/github/tag/AlfredoRamos/singleapplication.svg?style=flat-square&label=stable)](https://github.com/AlfredoRamos/singleapplication/releases)
[![Code Quality](https://img.shields.io/codacy/grade/25787416f2ae418c8bbb3dc004789f40.svg?style=flat-square)](https://app.codacy.com/gh/AlfredoRamos/singleapplication/dashboard)
[![License](https://img.shields.io/github/license/AlfredoRamos/singleapplication.svg?style=flat-square)](https://raw.githubusercontent.com/AlfredoRamos/singleapplication/master/LICENSE)

### Dependencies

- Qt >= 5.9.2
- Compiler with standard >= C++17
- CMake >= 3.18.0

### Build

#### CMake flags

A list of additional CMake flags are listed below:

| Flag                  | Default value | Description                                             |
| :-------------------- | :-----------: | :------------------------------------------------------ |
| `USE_QT5`             |     `OFF`     | Use Qt 5 instead of the higher major version available. |
| `GENERATE_PKG_CONFIG` |     `OFF`     | Generate pkg-config file.                               |
| `STATIC_LIB`          |     `OFF`     | Build as a static library.                              |

---

#### Subproject

If you want to use the library directly inside your application source code, include the `singleapplication` directory and add the library on your `CMakeLists.txt` file:

```cmake
add_subdirectory(singleapplication)
target_link_libraries(YOUR_TARGET singleapplication)
```

---

#### System library

First you will need to get the sources and create a build directory. In-source builds are not allowed.

```shell
git clone https://github.com/AlfredoRamos/singleapplication.git
cd singleapplication
```

After that, build and install the library on your system.

```shell
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
cmake --build build --clean-first
cmake --install build --prefix build/pkg/usr/ --strip
```

Once the files are installed on your system, add the library in your `CMakeLists.txt` file:

```cmake
find_package(singleapplication REQUIRED)
target_link_libraries(YOUR_TARGET singleapplication)
```

Alternatively, if you built the library with the `-DGENERATE_PKG_CONFIG=ON` flag, you can use the library with `pkg-config`:

```cmake
find_package(PkgConfig REQUIRED)
pkg_check_modules(singleapplication REQUIRED IMPORTED_TARGET singleapplication)
target_link_libraries(YOUR_TARGET PkgConfig::singleapplication)
```

---

### Usage

In the `main.cpp` file of your Qt/C++ application include the library, create a new instance of `SingleApplication`, and add a check if another instance is already running using `SingleApplication::createInstance()`:

```cpp
// Subproject
//#include "singleapplication.hpp"

// System library
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

The constructor of the `SingleApplication` class only accepts one parameter and must be a `QString`.

You can specify random generated `QString` or using information from the application, like `QCoreApplication::applicationName()`.
