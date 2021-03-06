public extension Subject where T == Bool {
  /// Asserts that the actual value is true.
  func isTrue(file: StaticString = #file, line: UInt = #line) {
    doAssert(failWith: Failure(file: file, line: line, Fact("expected to be true"))) {
      actual
    }
  }

  /// Asserts that the actual value is false.
  func isFalse(file: StaticString = #file, line: UInt = #line) {
    doAssert(failWith: Failure(file: file, line: line, Fact("expected to be false"))) {
      !actual
    }
  }
}
