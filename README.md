# Handy Swift Modules

[![Build
Status](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/cgrindel/swift_toolbox/actions/workflows/ci.yml)

This repository contains handy Swift modules for development and testing. The Swift code is built
and tested using [Bazel](https://bazel.build/).

## Quick Start using Swift Package Manager

Add a dependency on this repository to your `Package.swift`. Replace the version with the desired
release.

```swift
  .package(url: "https://github.com/cgrindel/swift_toolbox", from: "0.4.0")
```

## Quick Start using Bazel

Use [rules_swift_package_manager](https://github.com/cgrindel/rules_swift_package_manager) to
install this Swift package into your Bazel workspace.

## Release Process

Use the GitHub web interface to create a release and tag the repository.
