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
            .exact("1.20.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v1.20.0/GenesysCloud.zip",
            checksum: "ca22ed6aed09a2954a2d1c782308934f1e13bb04792d44aeec1b0b09cb3b0306"
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
