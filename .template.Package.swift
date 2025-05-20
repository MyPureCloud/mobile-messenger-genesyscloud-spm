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
            .exact("__messenger_version__")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloud",
            url: "__source_url__",
            checksum: "__checksum__"
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
