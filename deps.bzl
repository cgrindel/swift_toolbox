load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "4f167e5dbb49b082c5b7f49ee688630d69fb96f15c84c448faa2e97a5780dbbc",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/0.24.0/rules_swift.0.24.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_rules_swiftformat",
        sha256 = "6dfbdd90ff1e3849ad9102d116c114aee6eef6114d1765de654a6cdad5421c58",
        strip_prefix = "rules_swiftformat-0.2.0",
        urls = ["https://github.com/cgrindel/rules_swiftformat/archive/v0.2.0.tar.gz"],
    )
