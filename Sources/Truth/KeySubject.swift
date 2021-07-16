public extension Subject {
  /// Returns a subject for the specified key path.
  @discardableResult func key<KeyValue>(
    file: StaticString = #file, line: UInt = #line,
    _ keyPath: KeyPath<T, KeyValue>,
    _ consumer: (Subject<KeyValue>) throws -> Void
  ) -> Self {
    guard continueAssertions else {
      return self
    }
    do {
      try consumer(that(actual[keyPath: keyPath]))
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
    return self
  }
}
