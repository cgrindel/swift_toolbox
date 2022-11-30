"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "2ce874c8c34a03a0a33bfb0c8100f0be32279e0a40f5b794fd943f15441e034a",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.3.0/rules_swift.1.3.0.tar.gz",
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
        sha256 = "e37fed01bd5164048c102a1faef543f76d8beb2dcf4761fb106e41e31675c8c5",
        strip_prefix = "rules_cc-bb1aaeb77dcc89ecbc0c8f13e4ee78bbf9069a36",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/bb1aaeb77dcc89ecbc0c8f13e4ee78bbf9069a36.tar.gz",
        ],
    )
