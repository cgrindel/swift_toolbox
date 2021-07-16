public extension Subject {
  /// Asserts that the result represents success and provides a means to continue assertions on the
  /// success value.
  @discardableResult func isSuccess<Value, Failure: Error>(
    file: StaticString = #file,
    line: UInt = #line,
    _ successConsumer: ((Subject<Value>) throws -> Void)? = nil
  ) -> Bool where T == Result<Value, Failure> {
    guard continueAssertions else {
      return false
    }
    switch actual {
    case let .success(value):
      do {
        if let successConsumer = successConsumer {
          try successConsumer(that(value))
        }
      } catch {
        fail(file: file, line: line, .unexpectedError(error))
      }
      return true
    case let .failure(error):
      fail(
        file: file,
        line: line,
        Fact("expected success"),
        Fact("but was failure with", error)
      )
      return false
    }
  }

  @discardableResult func isFailure<Value, Failure: Error>(
    file: StaticString = #file,
    line: UInt = #line,
    _ failureConsumer: ((Subject<Failure>) throws -> Void)? = nil
  ) -> Bool where T == Result<Value, Failure> {
    guard continueAssertions else {
      return false
    }
    switch actual {
    case let .success(value):
      fail(
        file: file,
        line: line,
        Fact("expected failure"),
        Fact("but was success with", value)
      )
      return false
    case let .failure(error):
      do {
        if let failureConsumer = failureConsumer {
          try failureConsumer(that(error))
        }
      } catch {
        fail(file: file, line: line, .unexpectedError(error))
      }
      return true
    }
  }
}
