public extension Subject where T: DictionaryProtocol {
  /// Asserts that the specified key exists. If the key exists, the value associated with the key is
  /// wrapped in a subject and passed to the consumer.
  @discardableResult func hasKey(
    _ key: T.Key,
    file: StaticString = #file,
    line: UInt = #line,
    _ consumer: ((Subject<T.Value>) throws -> Void)? = nil
  ) -> Self {
    guard continueAssertions else {
      return self
    }
    guard let index = actual.index(forKey: key) else {
      fail(file: file, line: line, Fact("expected key to exist"))
      return self
    }
    if let consumer = consumer {
      do {
        let element = actual[index]
        try consumer(that(element.value))
      } catch {
        fail(file: file, line: line, .unexpectedError(error))
      }
    }
    return self
  }

  /// Asserts that the specified key does not exist.
  @discardableResult func doesNotHaveKey(
    _ key: T.Key,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    guard continueAssertions else {
      return self
    }
    if actual.index(forKey: key) != nil {
      fail(file: file, line: line, Fact("expected key to not exist"))
    }
    return self
  }
}
