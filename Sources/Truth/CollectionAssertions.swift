public extension Subject where T: Collection {
  /// Asserts that the actual value is equal to the expected value.
  @discardableResult func hasCount(
    _ expected: Int,
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to have count of", expected),
        Fact("but was", actual.count)
      )
    ) {
      return actual.count == expected
    }
  }

  /// Asserts that the actual value is empty.
  @discardableResult func isEmpty(file: StaticString = #file, line: UInt = #line) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to be empty"),
        Fact("but was", actual)
      )
    ) {
      return actual.isEmpty
    }
  }

  /// Asserts that the actual value is not empty.
  @discardableResult func isNotEmpty(
    file: StaticString = #file,
    line: UInt = #line
  ) -> Self {
    return doAssert(
      failWith: Failure(
        file: file,
        line: line,
        Fact("expected to not be empty")
      )
    ) {
      return !actual.isEmpty
    }
  }

  /// Provides a means for executing assertions on an element of the collection. This method will
  /// return the collection subject for additional assertions.
  ///
  /// A failure will be logged if the provided index is not valid for the collection.
  @discardableResult func item<E, I>(
    at index: I,
    file: StaticString = #file,
    line: UInt = #line,
    _ elemSubjectConsumer: (Subject<E>) throws -> Void
  ) -> Self where E == T.Element, I == T.Index {
    guard continueAssertions else {
      return self
    }
    // Confirm that the index is valid.
    guard actual.indices.contains(index) else {
      fail(
        file: file,
        line: line,
        Fact("expected index to be valid for the collection"),
        Fact("but was", index)
      )
      return self
    }
    do {
      let elemSubject = that(actual[index])
      try elemSubjectConsumer(elemSubject)
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
    return self
  }

  /// Provides a means for executing assertions on the first element of the collection. This method will
  /// return the collection subject for additional assertions.
  @discardableResult func firstItem<E>(
    file: StaticString = #file,
    line: UInt = #line,
    _ elemSubjectConsumer: (Subject<E>) throws -> Void
  ) -> Self where E == T.Element {
    guard continueAssertions else {
      return self
    }
    guard let element = actual.first else {
      fail(
        file: file,
        line: line,
        Fact("expected the first element to exist")
      )
      return self
    }
    do {
      let elemSubject = that(element)
      try elemSubjectConsumer(elemSubject)
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
    return self
  }
}
