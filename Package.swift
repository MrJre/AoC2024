// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2024",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "Day10",
            targets: ["Day10"]
        ),
        .library(
            name: "Day9",
            targets: ["Day9"]
        ),
        .library(
            name: "Day8",
            targets: ["Day8"]
        ),
        .library(
            name: "Day7",
            targets: ["Day7"]
        ),
        .library(
            name: "Day6",
            targets: ["Day6"]
        ),
        .library(
            name: "Day5",
            targets: ["Day5"]
        ),
        .library(
            name: "Day4",
            targets: ["Day4"]
        ),
        .library(
            name: "Day3",
            targets: ["Day3"]
        ),
        .library(
            name: "Day2",
            targets: ["Day2"]
        ),
        .library(
            name: "Day1",
            targets: ["Day1"]
        ),
        .library(
            name: "PuzzleCore",
            targets: ["PuzzleCore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "Day10",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day10Tests",
            dependencies: [
                "Day10",
                "PuzzleToolBox"
            ]
        ),
        .target(
            name: "Day9",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day9Tests",
            dependencies: [
                "Day9"
            ]
        ),
        .target(
            name: "Day8",
            dependencies: [
                "PuzzleCore",
                "PuzzleToolBox",
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day8Tests",
            dependencies: [
                "Day8"
            ]
        ),
        .target(
            name: "Day7",
            dependencies: [
                "PuzzleCore",
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day7Tests",
            dependencies: [
                "Day7"
            ]
        ),
        .target(
            name: "Day6",
            dependencies: [
                "PuzzleCore",
                "PuzzleToolBox"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day6Tests",
            dependencies: [
                "Day6"
            ]
        ),
        .target(
            name: "Day5",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day5Tests",
            dependencies: [
                "Day5"
            ]
        ),
        .target(
            name: "Day4",
            dependencies: [
                "PuzzleCore",
                "PuzzleToolBox"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day4Tests",
            dependencies: [
                "Day4"
            ]
        ),
        .target(
            name: "Day3",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day3Tests",
            dependencies: [
                "Day3"
            ]
        ),
        .target(
            name: "Day2",
            dependencies: [
                "PuzzleCore"
            ],
            resources: [
                .process("Resources/")
            ]
        ),
        .testTarget(
            name: "Day2Tests",
            dependencies: [
                "Day2"
            ]
        ),
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
        .target(
            name: "PuzzleToolBox",
            dependencies: [
            ]
        ),
    ]
)
