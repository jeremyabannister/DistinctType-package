// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "DistinctType-package",
    products: [
        .library(
            name: "DistinctType-module",
            targets: ["DistinctType-module"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ExpressionErgonomics",
            .upToNextMinor(from: "0.4.6")
        ),
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            .upToNextMinor(from: "0.2.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/XCTestToolkit",
            .upToNextMinor(from: "0.2.6")
        ),
    ],
    targets: [
        .target(
            name: "DistinctType-module",
            dependencies: [
                "ExpressionErgonomics",
                .product(name: "RandomlyGeneratable-module", package: "RandomlyGeneratable-package"),
            ]
        ),
        .testTarget(
            name: "DistinctType-tests",
            dependencies: [
                "DistinctType-module",
                "JSONToolkit",
                "XCTestToolkit",
            ]
        ),
    ]
)
