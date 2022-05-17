// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocumentID",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7)],
    products: [
        .library(
            name: "DocumentID",
            targets: ["DocumentID"]),
        .library(
            name: "FirestoreImitation",
            targets: ["FirestoreImitation"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DocumentID",
            dependencies: []),
        .target(
            name: "FirestoreImitation",
            dependencies: ["DocumentID"]),
        .testTarget(
            name: "DocumentIDTests",
            dependencies: ["DocumentID"]),
    ]
)
