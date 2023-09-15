// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let moduleNames = [
  "DateUtils",
  "MathUtils",
  "NumberUtils",
  "OptionalUtils",
  "StringUtils",
  "StructUtils",
  "Truth",
  "TypeUtils",
]

let products: [Product] = moduleNames.map { moduleName in
  Product.library(name: moduleName, targets: [moduleName])
}

let bazelBuildFiles = ["BUILD.bazel"]
// The main.swift in the test directories exists to support Bazel `swift_test` on Linux.
let testExclude = bazelBuildFiles + ["main.swift"]

let package = Package(
  name: "swift_toolbox",
  products: products,
  targets: [
    .target(name: "DateUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "DateUtilsTests",
      dependencies: ["DateUtils", "Truth"],
      exclude: testExclude
    ),
    .target(
      name: "MathUtils",
      dependencies: ["StructUtils"],
      exclude: bazelBuildFiles
    ),
    .testTarget(
      name: "MathUtilsTests",
      dependencies: ["MathUtils", "Truth"],
      exclude: testExclude
    ),
    .target(name: "NumberUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "NumberUtilsTests",
      dependencies: ["NumberUtils", "Truth"],
      exclude: testExclude
    ),
    .target(name: "OptionalUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "OptionalUtilsTests",
      dependencies: ["OptionalUtils", "Truth"],
      exclude: testExclude
    ),
    .target(name: "StringUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "StringUtilsTests",
      dependencies: ["StringUtils", "Truth"],
      exclude: testExclude
    ),
    .target(name: "StructUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "StructUtilsTests",
      dependencies: ["StructUtils", "Truth"],
      exclude: testExclude
    ),
    .target(
      name: "Truth",
      dependencies: ["OptionalUtils", "StringUtils"],
      exclude: bazelBuildFiles
    ),
    .testTarget(
      name: "TruthTests",
      dependencies: ["Truth"],
      exclude: testExclude
    ),
    .target(name: "TypeUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "TypeUtilsTests",
      dependencies: ["TypeUtils", "Truth"],
      exclude: testExclude
    ),
  ]
)
