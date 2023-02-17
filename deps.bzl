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
        sha256 = "8865c291abf5f4f7b979ab4898906209516737fc33e370c3daa562ba4445f48d",
        strip_prefix = "bazel-starlib-0.12.1",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v0.12.1.tar.gz",
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
        sha256 = "845b008ab7d046a8942d4796a2ed848c84b3236f8f673ed614f1e81f77977368",
        strip_prefix = "rules_cc-42f3259960ba2b7b350bafa50f104567883a49eb",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/42f3259960ba2b7b350bafa50f104567883a49eb.tar.gz",
        ],
    )
