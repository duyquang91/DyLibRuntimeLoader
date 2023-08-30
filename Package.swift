// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DyLibRuntimeLoader",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "DyLibRuntimeLoader",
            type: .dynamic,
            targets: ["DyLibRuntimeLoader"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DyLibRuntimeLoader",
            dependencies: []),
    ]
)
