"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "51efdaf85e04e51174de76ef563f255451d5a5cd24c61ad902feeadafc7046d9",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.2.0/rules_swift.1.2.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "3a3b3a5e9b0f63e8a9a193a66bc588c1f2fb2873562be68f2026adb815eea06f",
        strip_prefix = "bazel-starlib-0.8.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.8.0.tar.gz",
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
        sha256 = "e124364f3da2b3992fc6062ddf8380f584e694999d934c9485d3abbc5e00ed45",
        strip_prefix = "rules_cc-35fb29866e9833ed918f422215155b8bafddb356",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/35fb29866e9833ed918f422215155b8bafddb356.tar.gz",
        ],
    )
