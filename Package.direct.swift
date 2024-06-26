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
    targets: [
        .target(
            name: "ToyboxCore"
        ),
        .target(
            name: "ToyboxModule",
            dependencies: [
                .target(name: "ToyboxCore")
            ]
        ),
        .target(
            name: "AppModule",
            dependencies: [
                "ToyboxCore",
                "ToyboxModule"
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
