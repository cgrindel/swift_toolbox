public extension Subject where T: Comparable {
  /// Asserts that the actual value is in the specified range.
  @discardableResult func isIn(
    _ range: Range<T>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected", actual),
        Fact("to be in", range)
      )
    ) {
      return range.contains(actual)
    }
  }

  /// Asserts that the actual value is in the specified range.
  @discardableResult func isIn(
    _ range: ClosedRange<T>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected", actual),
        Fact("to be in", range)
      )
    ) {
      return range.contains(actual)
    }
  }
}
