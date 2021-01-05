# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.4.0]

### Added


### Changed

* `cdef` is now a command-line tool (without any framework dependency) -- turned out the `.app` was not a great idea
* `FTApp` is now included in the binary and is fetched using a `git submodule`
* command line options (such as `-readDocumentTypes`) are now case insensitive
* Updated for Swift 4
* Compatible with macOS High Sierra

### Removed


### Fixed



## [0.3.0]

### Added

* `-readDocumentTypes`
*  `-readURLTypes`
* Easy way to build, create package and sign
* Man page (thanks Richard Purves!)

### Changed

* moved some functionality to `FTApp`
* switched to a `.app` to get code signing and import `FTApp.framework`

### Removed

### Fixed


## [0.2.1]

### Added

* `-readDocumentTypes`
*  `-readURLTypes`
* Easy way to build, create package and sign
* Man page (thanks Richard Purves!)

### Changed

* Updated for Swift 3

### Removed

### Fixed
* Update certificate as previous was revoked by mistake (sorry!)

# Contributors

- François 'ftiff' Levaux-Tiffreau (@ftiff)
- Richard Purves


[0.4.0]: https://github.com/Shufflepuck/cdef/compare/v2.3.0...v2.4.0
[0.3.0]: https://github.com/Shufflepuck/cdef/compare/v0.2.1...v2.3.0
[0.2.1]: https://github.com/Shufflepuck/cdef/compare/v0.2...v0.2.1
