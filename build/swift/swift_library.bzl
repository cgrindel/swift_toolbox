load(
    "@cgrindel_rules_swiftformat//swiftformat:swiftformat.bzl",
    "swiftformat_library",
)

def swift_library(name, srcs = None, **kwargs):
    if srcs == None:
        srcs = native.glob(["*.swift"])

    swiftformat_library(
        name = name,
        swiftformat_config = "//.swiftformat",
        srcs = srcs,
        **kwargs
    )
