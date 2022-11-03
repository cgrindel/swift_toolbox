"""Dependencies for swift_toolbox."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def swift_toolbox_dependencies():
    maybe(
        http_archive,
        name = "build_bazel_rules_swift",
        sha256 = "a2fd565e527f83fb3f9eb07eb9737240e668c9242d3bc318712efa54a7deda97",
        url = "https://github.com/bazelbuild/rules_swift/releases/download/0.27.0/rules_swift.0.27.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "cgrindel_bazel_starlib",
        sha256 = "116bfd53999992c21b758a9854af29dfd77470f8d9f919be81e2034f003a5b31",
        strip_prefix = "bazel-starlib-999.0.0",
        urls = [
            "http://github.com/cgrindel/bazel-starlib/archive/v999.0.0.tar.gz",
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
        sha256 = "d1886f0ea5b6cfe7519b87030811f52620db31bcca7ef9964aa17af2d14f23c4",
        strip_prefix = "rules_cc-cb6d32e4d1ae29e20dd3328109d8cb7f8eccc9be",
        urls = [
            "http://github.com/bazelbuild/rules_cc/archive/cb6d32e4d1ae29e20dd3328109d8cb7f8eccc9be.tar.gz",
        ],
    )
