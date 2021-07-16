load("@build_bazel_rules_swift//swift:swift.bzl", real_swift_test = "swift_test")

def swift_test(name, size = None, deps = None, data = None):
    """Wraps the unittest execution so that the implementation of the unittest execution can be 
    changed (e.g. use iOS unit test runner).

    Args:
        name: The name for the rule that will be executed.
        size: Test size.
        deps: The build dependencies for the test.
        data: Data that should be included in the test.
    """
    real_swift_test(
        name = name,
        size = size,
        srcs = native.glob(["**/*.swift"]),
        deps = deps,
        data = data,
    )
