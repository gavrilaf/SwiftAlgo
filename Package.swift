// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAlgo",
    products: [
        .library(name: "SwiftAlgo", targets: ["SwiftAlgo"]),
        .executable(name: "PerfTest", targets: ["PerfTest"]),
        .executable(name: "GraphRunner", targets: ["GraphRunner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gavrilaf/SwiftPerfTool.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "SwiftAlgo", dependencies: []),
        .target(name: "PerfTest", dependencies: ["SwiftAlgo", "SwiftPerfTool"]),
        .target(name: "GraphRunner", dependencies: ["SwiftAlgo"]),
        .testTarget(name: "SwiftAlgoTests", dependencies: ["SwiftAlgo"]),
    ]
)
