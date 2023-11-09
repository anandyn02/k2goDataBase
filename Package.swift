// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "K2GoDataBase",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "K2GoDataBase",
            targets: ["K2GoDataBase"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", from: "10.44.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "K2GoDataBase",
            dependencies: [
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
            ]),
        .testTarget(
            name: "K2GoDataBaseTests",
            dependencies: ["K2GoDataBase"]),
    ]
)
