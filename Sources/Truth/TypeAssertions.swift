public extension Subject {
  /// Asserts that a subject is the specified type.
  @discardableResult func isA<ET>(
    _ expectedType: ET.Type,
    file: StaticString = #file,
    line: UInt = #line,
    _ subjectConsumer: (Subject<ET>) throws -> Void = { _ in }
  ) -> Self {
    guard continueAssertions else {
      return self
    }
    guard let expected = actual as? ET else {
      fail(
        file: file,
        line: line,
        Fact("expected to be of type", expectedType),
        Fact("but was", String(reflecting: actual))
      )
      return self
    }
    do {
      let expectedSubject = that(expected)
      try subjectConsumer(expectedSubject)
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
    return self
  }
}
