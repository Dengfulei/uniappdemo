// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "NativeTestPlugin",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "NativeTestPlugin",
            type: .dynamic,
            targets: ["NativeTestPlugin"]
        )
    ],
    targets: [
        .target(
            name: "NativeTestPlugin"
        )
    ]
)
