import PackageDescription

let package = Package(
    name: "cdef",
    dependencies: [
        .Package(url: "https://github.com/ftiff/FTApp", majorVersion: 0, minor: 2),
    ]
)
