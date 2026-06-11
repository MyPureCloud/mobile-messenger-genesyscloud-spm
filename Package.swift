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
            .exact("1.15.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v1.15.0/GenesysCloud.zip",
            checksum: "4fdfad0ba8b3d66ff7d510d33167edc6c1040887baa59d1f51fc24b00b71114a"
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
