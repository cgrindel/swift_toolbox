"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "d25a3f11829d321e0afb78b17a06902321c27b83376b31e3481f0869c28e1660",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.6.0/rules_swift.1.6.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "64bc67b2a513926f0605e93d17bcfcb65daf852bed5d5d913f29c30a9ab377a8",
        strip_prefix = "bazel-starlib-0.14.3",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.14.3.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "cgrindel_rules_swiftformat",
        sha256 = "f496774f56e8260e277dc17366cf670b55dee3616327a13d2d04bd1b62cdcc88",
        strip_prefix = "rules_swiftformat-0.4.1",
        urls = [
            "http://github.com/cgrindel/rules_swiftformat/archive/v0.4.1.tar.gz",
        ],
    )

    # Load the latest rules_cc to address missing action_names.bzl error.
    # Latest on main branch as of 2022-05-07
    maybe(
        http_archive,
        name = "rules_cc",
        sha256 = "f5f6f86fe44c3fe1110d34611189c55c492d7ca3b350c4b84adb998167f7c636",
        strip_prefix = "rules_cc-be9ff3eb412c5781eabd4a4b7b81de8b95da7b84",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/be9ff3eb412c5781eabd4a4b7b81de8b95da7b84.tar.gz",
        ],
    )
