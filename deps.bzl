"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "84e2cc1c9e3593ae2c0aa4c773bceeb63c2d04c02a74a6e30c1961684d235593",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.5.1/rules_swift.1.5.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "c4d63dc38d6bbd0af2bf8e8bb3af5626c81d19e23d134bf87c85e16e4fa9adba",
        strip_prefix = "bazel-starlib-0.12.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.12.0.tar.gz",
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
        sha256 = "4464c887a12e602fdee2d551fa8c4646b1dfc584d6475fa8b52af4ed2a54e717",
        strip_prefix = "rules_cc-f1ee8d559eb5a8255eed875a73ef1804caa5a924",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/f1ee8d559eb5a8255eed875a73ef1804caa5a924.tar.gz",
        ],
    )
