public extension Subject where T: BidirectionalCollection {
  /// Provides a means for executing assertions on the last element of the array. This method will
  /// return the collection subject for additional assertions.
  @discardableResult func lastItem<E>(
    file: StaticString = #file,
    line: UInt = #line,
    _ elemSubjectConsumer: (Subject<E>) throws -> Void
  ) -> Self where E == T.Element {
    guard continueAssertions else {
      return self
    }
    guard let element = actual.last else {
      fail(
        file: file,
        line: line,
        Fact("expected the last element to exist")
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
