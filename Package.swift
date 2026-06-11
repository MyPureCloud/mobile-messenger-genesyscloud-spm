// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenesysCloud",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GenesysCloud",
            targets: ["GenesysCloudWrapper"]),
    ],
    dependencies: [
        .package(
            name: "GenesysCloudMessenger",
            url: "https://github.com/MyPureCloud/mobile-messenger-genesyscloudmessenger-spm.git",
            .exact("1.13.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v1.13.0/GenesysCloud.zip",
            checksum: "d57ba9cb4e16f245094cdb7c6e140a656e6665d28b3454cd37e09af99ce12db9"
        ),
        .target(
            name: "GenesysCloudWrapper",
            dependencies: [
                "GenesysCloud",
                .product(name: "GenesysCloudMessenger", package: "GenesysCloudMessenger")
            ]
        ),
        .testTarget(name: "PackageTests", dependencies: [
            "GenesysCloud"
        ])
    ]
)
