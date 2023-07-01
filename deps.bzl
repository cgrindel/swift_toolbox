"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "7929b4fd6d9f7c44ed5734a15004bfc2046146ba5ea269f0568d9efe2f405ef3",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.9.0/rules_swift.1.9.0.tar.gz",
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
        sha256 = "d47c313078957bc5b4e53334e6e2875275216d614403108bc1bb7f5056d96a05",
        strip_prefix = "rules_cc-1dbb6917128da0ef5e35df3e8b060488e8c2acdc",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/1dbb6917128da0ef5e35df3e8b060488e8c2acdc.tar.gz",
        ],
    )
