// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AppPackage",
    platforms: [.macOS(.v13)],
    products: [
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
            name: "codegen",
            dependencies: [
                .target(name: "AppModule")
            ]
        )
    ]
)
