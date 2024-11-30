// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2024",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "PuzzleCore",
            targets: ["PuzzleCore"]
        ),
    ],
    targets: [
        .target(
            name: "PuzzleCore",
            dependencies: [
            ]
        ),
    ]
)
