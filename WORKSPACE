workspace(name = "cgrindel_swift_toolbox")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

maybe(
    http_archive,
    name = "build_bazel_rules_swift",
    sha256 = "f872c0388808c3f8de67e0c6d39b0beac4a65d7e07eff3ced123d0b102046fb6",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.23.0/rules_swift.0.23.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()
