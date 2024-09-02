// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StringBuilder",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "StringBuilder",
            targets: ["StringBuilder"]),
    ],
    targets: [
        .target(
            name: "StringBuilder"),
        .testTarget(
            name: "StringBuilderTests",
            dependencies: ["StringBuilder"]),
    ]
)
