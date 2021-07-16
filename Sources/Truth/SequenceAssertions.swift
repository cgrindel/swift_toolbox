public extension Subject where T: Sequence {
  /// Asserts that the collection contains the specified items.
  @discardableResult func contains<E: Equatable>(
    file: StaticString = #file,
    line: UInt = #line,
    _ items: E...
  ) -> Self where T.Element == E {
    return contains(file: file, line: line, contentsOf: items)
  }

  /// Asserts that the collection contains the contents of the specified collection.
  @discardableResult func contains<C>(
    file: StaticString = #file,
    line: UInt = #line,
    contentsOf expectedItems: C
  ) -> Self where C: Collection, C.Element == T.Element, C.Element: Equatable {
    guard !expectedItems.isEmpty else {
      fail(
        file: file,
        line: line,
        Fact("expected items cannot be empty")
      )
      return self
    }

    var facts = [Fact]()
    for expected in expectedItems {
      if actual.contains(expected) {
        continue
      }
      facts.append(Fact("expected to contain", expected))
    }
    if !facts.isEmpty {
      fail(file: file, line: line, facts)
    }
    return self
  }

  @discardableResult func eachItem<E>(
    _ consumer: (Subject<E>) -> Void
  ) -> Self where T.Element == E {
    guard continueAssertions else {
      return self
    }
    for (num, element) in actual.enumerated() {
      consumer(that(element).withMessage("position: \(num)"))
    }
    return self
  }
}
