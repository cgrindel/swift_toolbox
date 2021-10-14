import Foundation
public extension Subject where T == Decimal {
  // MARK: - isNaN

  @discardableResult func isNaN(
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to be NaN"),
        Fact("but was", actual)
      )
    ) {
      return actual.isNaN
    }
  }

  @discardableResult func isNotNaN(
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected not to be NaN")
      )
    ) {
      return !actual.isNaN
    }
  }

  // MARK: - isCloseTo

  @discardableResult func isCloseTo(
    _ expected: T,
    plusOrMinus: Decimal,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let absPlusOrMinus = plusOrMinus.magnitude
    let range = (expected - absPlusOrMinus) ... (expected + absPlusOrMinus)
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to equal", expected),
        Fact("plus or minus \(absPlusOrMinus) (\(range))"),
        Fact("but was", actual)
      )
    ) {
      return range.contains(actual)
    }
  }

  /// Asserts that the value is equal within a specified percentage.
  @discardableResult func isCloseTo(
    _ expected: T,
    within percentage: Decimal,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let absExpected = expected.magnitude
    let plusOrMinus = absExpected * percentage
    return isCloseTo(expected, plusOrMinus: plusOrMinus, file: file, line: line)
  }

  // MARK: - isLessThan / isGreaterThan

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
