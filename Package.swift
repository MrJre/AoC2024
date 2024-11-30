// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2024",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "Day1",
            targets: ["Day1"]
        ),
        .library(
            name: "PuzzleCore",
            targets: ["PuzzleCore"]
        ),
    ],
    targets: [
        .target(
            name: "Day1",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day1Tests",
            dependencies: [
                "Day1"
            ]
        ),
        .target(
            name: "PuzzleCore",
            dependencies: [
            ]
        ),
    ]
)
