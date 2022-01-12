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
        name = "cgrindel_bazel_starlib",
        sha256 = "9e054e423bb7674e02052e52725b41288369dd94efff963479f76fe269b5177f",
        strip_prefix = "bazel-starlib-0.3.1",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.3.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "cgrindel_rules_swiftformat",
        sha256 = "d54f3ef6c027e49f45c49e8c287cecfb8b7dd87309a17ad6ec9684f09970436a",
        strip_prefix = "rules_swiftformat-0.4.0",
        urls = [
            "http://github.com/cgrindel/rules_swiftformat/archive/v0.4.0.tar.gz",
        ],
    )
