// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2020",
    defaultLocalization: "en",
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
        .package(url: "https://github.com/SwifterSwift/SwifterSwift.git", from: "5.2.0")
    ],
    targets: [
        .target(
            name: "AdventOfCode2020",
            dependencies: ["Files", "SwifterSwift"],
            resources: [
                .copy("InputFiles"),
            ]
        ),
        .testTarget(
            name: "AdventOfCode2020Tests",
            dependencies: ["AdventOfCode2020"]),
    ]
)
