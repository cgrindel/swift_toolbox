public extension Subject where T: AnyObject {
  /// Asserts that the actual value is identical (===) to expected.
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

  /// Asserts that the actual value is not identical (!==) to expected.
  @discardableResult func isNotIdenticalTo(
    _ expected: T,
    file: StaticString = #file, line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected not to be identical to", expected)
      )
    ) {
      actual !== expected
    }
  }
}
