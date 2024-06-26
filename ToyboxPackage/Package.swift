// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "ToyboxPackage",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(
            name: "ToyboxCore",
            targets: ["ToyboxCore"]
        ),
        .library(
            name: "ToyboxModule",
            targets: ["ToyboxModule"]
        ),
    ],
    targets: [
        .target(
            name: "ToyboxCore"
        ),
        .target(
            name: "ToyboxModule",
            dependencies: [
                .target(name: "ToyboxCore")
            ]
        )
    ]
)
