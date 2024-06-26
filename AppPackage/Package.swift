// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AppPackage",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "AppModule",
            targets: ["AppModule"]
        ),
        .executable(
            name: "app",
            targets: ["app"]
        ),
        .executable(
            name: "codegen",
            targets: ["codegen"]
        )
    ],
    dependencies: [
        .package(path: "../ToyboxPackage")
    ],
    targets: [
        .target(
            name: "AppModule",
            dependencies: [
                .product(name: "ToyboxModule", package: "ToyboxPackage")
            ]
        ),
        .executableTarget(
            name: "app",
            dependencies: [
                .target(name: "AppModule")
            ]
        ),
        .executableTarget(
            name: "codegen",
            dependencies: [
                .product(name: "ToyboxCore", package: "ToyboxPackage"),
                .target(name: "AppModule")
            ]
        )
    ]
)
