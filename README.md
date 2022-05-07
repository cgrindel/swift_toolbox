# Handy Swift Modules 

[![Build
Status](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml)

This repository contains handy Swift modules for development and testing. The Swift code is built
and tested using [Bazel](https://bazel.build/).


## Quick Start

### 1. Configure your workspace to use `swift_toolbox`

Add the following to your `WORKSPACE` file to add this repository and its dependencies.

<!-- BEGIN WORKSPACE SNIPPET -->
```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "cgrindel_swift_toolbox",
    sha256 = "506d77f7adde108dbc3ca4e072a751576effc0c9162b76816d9f8968aea420aa",
    strip_prefix = "swift_toolbox-0.3.1",
    urls = [
        "http://github.com/cgrindel/swift_toolbox/archive/v0.3.1.tar.gz",
    ],
)
```
<!-- END WORKSPACE SNIPPET -->

