"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "b98bd1ec03c713e2ff5c3aa8c05930d8b6ab85cc82b3ae5d869058da4731f230",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.8.0/rules_swift.1.8.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "df971d4736cf30ab5332536715eeb00c1a67ca6440610e8bc3b73a35aaff34dc",
        strip_prefix = "bazel-starlib-0.16.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.16.0.tar.gz",
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
        sha256 = "203cf76b4dda195da98e3ddb33591ec627c9afd25068783e86b789efc0b1f220",
        strip_prefix = "rules_cc-7f0992b0bd47d5b24076c2d022ba1819cc8641e4",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/7f0992b0bd47d5b24076c2d022ba1819cc8641e4.tar.gz",
        ],
    )
