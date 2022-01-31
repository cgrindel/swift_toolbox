# Handy Swift Modules 

[![Build Status](https://github.com/cgrindel/swift_toolbox/actions/workflows/scheduled_builds.yml/badge.svg)](https://github.com/cgrindel/swift_toolbox/actions/workflows/scheduled_builds.yml)

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
    sha256 = "df1a318f140a278f43a9680ad121e202d9f185578a019dd8efaede4fa4571d4d",
    strip_prefix = "swift_toolbox-0.3.0",
    urls = [
        "http://github.com/cgrindel/swift_toolbox/archive/v0.3.0.tar.gz",
    ],
)
```
<!-- END WORKSPACE SNIPPET -->

