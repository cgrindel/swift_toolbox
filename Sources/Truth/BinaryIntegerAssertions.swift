import Foundation

public extension Subject where T: BinaryInteger {
  /// Asserts that the actual value is less than the expected value.
  @discardableResult func isLessThan(
    _ expected: T,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to be less than", expected),
        Fact("but was", actual)
      )
    ) {
      return actual < expected
    }
  }

  /// Asserts that the actual value is greater than the expected value.
  @discardableResult func isGreaterThan(
    _ expected: T,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to be greater than", expected),
        Fact("but was", actual)
      )
    ) {
      return actual > expected
    }
  }
}
