load(
    "@cgrindel_rules_swiftformat//swiftformat:swiftformat.bzl",
    "swiftformat_test",
)

def swift_test(name, srcs = None, **kwargs):
    if srcs == None:
        srcs = native.glob(["*.swift"])

    swiftformat_test(
        name = name,
        swiftformat_config = "//:.swiftformat",
        srcs = srcs,
        **kwargs
    )
