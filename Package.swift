// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocumentID",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7)],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
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
            name: "Shared",
            dependencies: []),
        .target(
            name: "FirestoreImitation",
            dependencies: ["DocumentID", "Shared"]),
        .target(
            name: "FunctionsImitation",
            dependencies: ["DocumentID", "Shared"]),
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
