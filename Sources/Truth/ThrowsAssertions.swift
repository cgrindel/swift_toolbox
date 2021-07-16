public class ThrowsSubject<T>: BaseSubject {
  public typealias ThrowableFn = () throws -> T

  let expression: ThrowableFn

  public init(
    failureStrategy: FailureStrategy = DefaultFailureStrategy(),
    continueAssertions: Bool = true,
    expression: @escaping ThrowableFn
  ) {
    self.expression = expression
    super.init(failureStrategy: failureStrategy, continueAssertions: continueAssertions)
  }

  func assertThat<E>(_ actual: E) -> Subject<E> {
    return Subject(actual: actual, failureStrategy: failureStrategy)
  }

  /// Asserts that the expression does not throw an error.
  public func doesNotThrow(file: StaticString = #file, line: UInt = #line) {
    var caughtError: Error?
    do {
      _ = try expression()
    } catch {
      caughtError = error
    }
    if let error = caughtError {
      fail(file: file, line: line, Fact("expected no error"), Fact("but caught", error))
    }
  }

  /// Asserts that the expression throws an error.
  public func doesThrow(
    file: StaticString = #file,
    line: UInt = #line,
    consumer: ((Subject<Error>) throws -> Void)? = nil
  ) {
    var caughtError: Error?
    do {
      _ = try expression()
    } catch {
      caughtError = error
    }
    guard let resultError = caughtError else {
      fail(file: file, line: line, Fact("expected an error to be thrown"))
      return
    }
    do {
      if let consumer = consumer {
        try consumer(that(resultError))
      }
    } catch {
      fail(file: file, line: line, .unexpectedError(error))
    }
  }

  /// Asserts that the expression throws an error and it is equal to the specified error.
  public func doesThrow<E: Error & Equatable>(
    _ errorExp: @autoclosure () -> E,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    var caughtError: Error?
    do {
      _ = try expression()
    } catch {
      caughtError = error
    }
    guard let error = caughtError else {
      fail(file: file, line: line, Fact("expected an error to be thrown"))
      return
    }
    guard let typedError = error as? E else {
      fail(
        file: file,
        line: line,
        Fact("expected error to be an instance of", E.Type.self),
        Fact("but was", error)
      )
      return
    }
    assertThat(typedError).isEqualTo(errorExp(), file: file, line: line)
  }
}
