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

let package = Package(
  name: "swift_toolbox",
  products: products,
  targets: [
    .target(name: "DateUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "DateUtilsTests",
      dependencies: ["DateUtils", "Truth"],
      exclude: ["BUILD.bazel"]
    ),
    .target(
      name: "MathUtils",
      dependencies: ["StructUtils"],
      exclude: ["BUILD.bazel"]
    ),
    .testTarget(
      name: "MathUtilsTests",
      dependencies: ["MathUtils", "Truth"],
      exclude: ["BUILD.bazel"]
    ),
    .target(name: "NumberUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "NumberUtilsTests",
      dependencies: ["NumberUtils", "Truth"],
      exclude: ["BUILD.bazel"]
    ),
    .target(name: "OptionalUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "OptionalUtilsTests",
      dependencies: ["OptionalUtils", "Truth"],
      exclude: ["BUILD.bazel"]
    ),
    .target(name: "StringUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "StringUtilsTests",
      dependencies: ["StringUtils", "Truth"],
      exclude: ["BUILD.bazel"]
    ),
    .target(name: "StructUtils", exclude: bazelBuildFiles),
    .testTarget(
      name: "StructUtilsTests",
      dependencies: ["StructUtils", "Truth"],
      exclude: bazelBuildFiles
    ),
    .target(
      name: "Truth",
      dependencies: ["OptionalUtils", "StringUtils"],
      exclude: bazelBuildFiles
    ),
    .testTarget(
      name: "TruthTests",
      dependencies: ["Truth"],
      exclude: bazelBuildFiles
    ),
    .target(name: "TypeUtils", exclude: ["BUILD.bazel"]),
    .testTarget(
      name: "TypeUtilsTests",
      dependencies: ["TypeUtils", "Truth"],
      exclude: bazelBuildFiles
    ),
  ]
)
