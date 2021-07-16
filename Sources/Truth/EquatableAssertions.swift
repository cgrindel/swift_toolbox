import Foundation

extension Subject where T: Equatable {
  /// Asserts that the actual value is equal to the expected value.
  @discardableResult public func isEqualTo(
    _ expected: T,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected", expected),
        Fact("but was", actual)
      )
    ) {
      return actual == expected
    }
  }

  /// Asserts that the actual value is not equal to the expected value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected not to equal", expected)
      )
    ) {
      return actual != expected
    }
  }
}

// MARK: - isNotEqualTo(:when:is:file:line:) and isNotEqualTo(:withDifferent:file:line:)

struct IsNotEqualWithDifferentValues {
  static let uuid = UUID()
  static let date = Date()
  static let timeIntervalIncrement = TimeInterval(1)
  static let intIncrement = 1
  static let strSuffix = "NOT EQUAL"
}

extension Subject where T: Equatable, T: AnyObject {
  /// Asserts that the actual value is not equal to the expected value when the specified key is
  /// changed to the specified value. The expected value is changed for the assertion and then put
  /// back to its original value.
  ///
  /// This assertion is useful when testing custom equality implementations.
  @discardableResult public func isNotEqualTo<Value>(
    _ expected: T,
    when keyPath: ReferenceWritableKeyPath<T, Value>,
    is newValue: Value,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    // Before we proceed, check that the expected equals the actual. Otherwise, this assertion is
    // meaningless.
    isEqualTo(expected)

    // Proceed with the change.
    let originalValue = expected[keyPath: keyPath]
    expected[keyPath: keyPath] = newValue
    defer { expected[keyPath: keyPath] = originalValue }
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected not to equal", expected),
        Fact("when", keyPath),
        Fact("is", newValue)
      )
    ) {
      return actual != expected
    }
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (optional Numeric) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo<Value: Numeric>(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, Value?>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue: Value = (originalValue ?? 0) + 1
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (Numeric) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo<Value: Numeric>(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, Value>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue: Value = originalValue + 1
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (Bool) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, Bool>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue = !originalValue
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (String) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, String>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue = originalValue + IsNotEqualWithDifferentValues.strSuffix
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (optional String) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, String?>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue = (originalValue ?? "") + IsNotEqualWithDifferentValues.strSuffix
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (optional UUID) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, UUID>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let newValue = IsNotEqualWithDifferentValues.uuid
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (UUID) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, UUID?>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let newValue = IsNotEqualWithDifferentValues.uuid
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (optional Date) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, Date>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue = originalValue + IsNotEqualWithDifferentValues.timeIntervalIncrement
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }

  /// Asserts that the expected value is not equal to the actual when the key at the specified key
  /// path (Date) is changed. The expected value is changed for the assertion and the
  /// put back to its original value.
  @discardableResult public func isNotEqualTo(
    _ expected: T,
    withDifferent keyPath: ReferenceWritableKeyPath<T, Date?>,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    let originalValue = expected[keyPath: keyPath]
    let newValue = (originalValue ?? IsNotEqualWithDifferentValues.date) +
      IsNotEqualWithDifferentValues.timeIntervalIncrement
    return isNotEqualTo(expected, when: keyPath, is: newValue, file: file, line: line)
  }
}

// MARK: - isIn a Sequence

extension Subject where T: Equatable {
  @discardableResult public func isIn<S: Sequence>(
    _ sequence: S,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self where S.Element == T {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("", actual),
        Fact("expected to be in", sequence)
      )
    ) {
      return sequence.contains(actual)
    }
  }
}
