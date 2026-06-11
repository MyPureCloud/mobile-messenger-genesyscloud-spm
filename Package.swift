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
            .exact("2.0.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v2.0.0/GenesysCloud.zip",
            checksum: "c20a2f6f688868d0d19726223683ba6bff6c61c0813c8e2ed8afdc2e86017e7c"
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
