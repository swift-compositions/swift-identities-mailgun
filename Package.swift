// swift-tools-version: 6.3.3

import Foundation
import PackageDescription

let package = Package(
    name: "swift-identities-mailgun",
    platforms: [
        .macOS(.v26),
        .iOS(.v26)
    ],
    products: [
        .library(name: "IdentitiesMailgun", targets: ["IdentitiesMailgun"]),
        .library(name: "IdentitiesMailgunLive", targets: ["IdentitiesMailgunLive"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-compositions/swift-identities-types.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-authentication.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-mailgun.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-dependencies.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-emailaddress.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-html.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-email-html.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-logger-dependencies.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-translating.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-log.git", branch: "main")
    ],
    targets: [
        .target(
            name: "IdentitiesMailgun",
            dependencies: [
                .product(name: "IdentitiesTypes", package: "swift-identities-types"),
                .product(name: "Identity Backend", package: "swift-authentication"),
                .product(name: "Mailgun Messages", package: "swift-mailgun"),
                .product(name: "EmailAddress", package: "swift-emailaddress"),
                .product(name: "HTML", package: "swift-html"),
                .product(name: "Email HTML Rendering", package: "swift-email-html"),
                .product(name: "Translated String", package: "swift-translating")
            ]
        ),
        .target(
            name: "IdentitiesMailgunLive",
            dependencies: [
                .target(name: "IdentitiesMailgun"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Logger Dependencies", package: "swift-logger-dependencies"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
        .testTarget(
            name: "IdentitiesMailgun Tests",
            dependencies: [
                .target(name: "IdentitiesMailgun"),
                .target(name: "IdentitiesMailgunLive")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

