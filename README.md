# Handy Swift Modules 

[![Build Status](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml/badge.svg)](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml)

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
    sha256 = "3b1022dcb99f45753f94d9e6c2623bf4973c887bae52df8bb1b25ee46878bdff",
    strip_prefix = "swift_toolbox-0.2.0",
    url = "https://github.com/cgrindel/swift_toolbox/archive/v0.2.0.tar.gz",
)
```
<!-- END WORKSPACE SNIPPET -->

