public extension Subject where T: AnyObject {
  /// Asserts that the actual value is nil.
  @discardableResult func isIdenticalTo(
    _ expected: T,
    file: StaticString = #file, line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected", expected),
        Fact("to be identical to", actual)
      )
    ) {
      actual === expected
    }
  }
}
