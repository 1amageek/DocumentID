// swift-tools-version:5.7
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
        .library(
            name: "FunctionsImitation",
            targets: ["FunctionsImitation"]),
        .library(
            name: "StorageImitation",
            targets: ["StorageImitation"]),
        .library(
            name: "AnalyticsImitation",
            targets: ["AnalyticsImitation"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DocumentID",
            dependencies: []),
        .target(
            name: "FirestoreImitation",
            dependencies: ["DocumentID"]),
        .target(
            name: "FunctionsImitation",
            dependencies: ["DocumentID"]),
        .target(
            name: "StorageImitation",
            dependencies: ["DocumentID"]),
        .target(
            name: "AnalyticsImitation",
            dependencies: ["DocumentID"]),
        .testTarget(
            name: "DocumentIDTests",
            dependencies: ["DocumentID"]),
    ]
)
