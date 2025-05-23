// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "BookARocketAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "BookARocketAPI", targets: ["BookARocketAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.20.0"),
  ],
  targets: [
    .target(
      name: "BookARocketAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
