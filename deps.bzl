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
        sha256 = "42a496dddbc089c68cd72b1f20dfe6acf474c53043dafe230ec887f617c0c252",
        strip_prefix = "bazel-starlib-0.9.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.9.0.tar.gz",
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
        sha256 = "1380614aa8c554776fb2a3353050d759b4c61fcf80af5959cdcd67708620b418",
        strip_prefix = "rules_cc-99d8c5a3876683834fcf5accacc5788428e450d2",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/99d8c5a3876683834fcf5accacc5788428e450d2.tar.gz",
        ],
    )
