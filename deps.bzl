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
        name = "cgrindel_rules_bzlformat",
        sha256 = "44b09ad9c5395760065820676ba6e65efec08ae02c1ce7e2d39d42c5b1e7aec8",
        strip_prefix = "rules_bzlformat-0.2.1",
        urls = ["https://github.com/cgrindel/rules_bzlformat/archive/v0.2.1.tar.gz"],
    )

    maybe(
        http_archive,
        name = "cgrindel_rules_swiftformat",
        sha256 = "e47378d771ed977756920075eeca62cc7feb0f4e2961571a3467727b813b7396",
        strip_prefix = "rules_swiftformat-0.3.0",
        urls = ["https://github.com/cgrindel/rules_swiftformat/archive/v0.3.0.tar.gz"],
    )
