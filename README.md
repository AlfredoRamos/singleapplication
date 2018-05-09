### About

Single Application library for Qt without `network` dependency. Based on [Dmitry Sazonov](https://stackoverflow.com/users/1035613/dmitry-sazonov)'s [code](https://stackoverflow.com/a/28172162).

[![Build Status](https://travis-ci.com/AlfredoRamos/singleapplication.svg?branch=master)](https://travis-ci.com/AlfredoRamos/singleapplication) [![Latest Stable Version](https://img.shields.io/github/tag/AlfredoRamos/singleapplication.svg?maxAge=3600&label=stable)](https://github.com/AlfredoRamos/singleapplication/releases) [![License](https://img.shields.io/github/license/AlfredoRamos/singleapplication.svg)](https://raw.githubusercontent.com/AlfredoRamos/singleapplication/master/LICENSE)

### Dependencies

- Qt >= 5.0.0

### Usage in a project

Include the `singleapplication.pri` file within your project file.

**application.pro**
```qmake
include(singleapplication/singleapplication.pri)
```
