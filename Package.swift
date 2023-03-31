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
//        .library(name: "DyLibSample",
//                 type: .dynamic,
//                 targets: ["DyLibSample"]),
//        .library(name: "DyLibSampleInterface",
//                 type: .dynamic,
//                 targets: ["DyLibSampleInterface"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DyLibRuntimeLoader",
            dependencies: []),
//        .target(
//            name: "DyLibSampleInterface",
//            dependencies: ["DyLibRuntimeLoader"]),
//        .target(
//            name: "DyLibSample",
//            dependencies: ["DyLibSampleInterface"]),
    ]
)
