"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "b3b6c5c9f2a589150f71e79dec1e1ed0eb974dbd49e9317df4e09e08ff6e83df",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/1.9.1/rules_swift.1.9.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "888483f8e8e481bcd3a601b7d5d6641bd62782fd6b6700a91a6603f8c8aba257",
        strip_prefix = "bazel-starlib-0.16.1",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.16.1.tar.gz",
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
        sha256 = "2c8cfb3e60da51c0132fa4fbc12fe3e8a2772d0abe9f40e6075eb28fe737938f",
        strip_prefix = "rules_cc-34bcaf6223a39ec002efcf06e110871a6f562f44",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/34bcaf6223a39ec002efcf06e110871a6f562f44.tar.gz",
        ],
    )
