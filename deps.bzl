"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "32f95dbe6a88eb298aaa790f05065434f32a662c65ec0a6aabdaf6881e4f169f",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.5.0/rules_swift.1.5.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "2b5031fd24ccc0bddcccd18c61d50c41970ad9757f15690ce6874935f298b05b",
        strip_prefix = "bazel-starlib-0.10.3",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.10.3.tar.gz",
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
        sha256 = "0aba1d94c9147645e2ec8aa8bb1952beeb3de16095cf1371e33feaa3c6bb9d38",
        strip_prefix = "rules_cc-7673ce6438fe6c432ecbb8c3679e7823c93f95b4",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/7673ce6438fe6c432ecbb8c3679e7823c93f95b4.tar.gz",
        ],
    )
