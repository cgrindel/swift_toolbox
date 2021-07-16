import OptionalUtils

public extension Subject where T: OptionalProtocol {
  /// Asserts that the actual value is nil.
  @discardableResult func isNil(file: StaticString = #file, line: UInt = #line) -> Bool {
    guard continueAssertions else {
      return false
    }
    guard actual.isNone() else {
      fail(
        file: file,
        line: line,
        Fact("expected to be nil"),
        Fact("but was", actual)
      )
      return false
    }
    return true
  }

  /// Asserts that the actual value is not nil.
  @discardableResult func isNotNil(
    file: StaticString = #file,
    line: UInt = #line,
    _ consumer: ((Subject<T.Wrapped>) throws -> Void)? = nil
  ) -> Bool {
    guard continueAssertions else {
      return false
    }
    guard let wrapped = try? actual.wrappedValue() else {
      fail(file: file, line: line, Fact("expected not to be nil"))
      return false
    }
    do {
      if let consumer = consumer {
        try consumer(that(wrapped))
      }
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
    return true
  }
}
