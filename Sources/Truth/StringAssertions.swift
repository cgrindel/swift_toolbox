public extension Subject where T == String {
  /// Asserts that a string contains the provided substring.
  @discardableResult func contains(
    _ substring: String,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to contain", substring)
      )
    ) {
      return actual.contains(substring)
    }
  }

  /// Asserts that a string matches the provided regular expression.
  @discardableResult func matches(
    _ regex: String,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to match", regex),
        Fact("BEGIN ACTUAL:\n", actual),
        Fact("END ACTUAL")
      )
    ) {
      return actual.range(of: regex, options: .regularExpression) != nil
    }
  }
}
