import Truth

enum AssertionConsumerError: Error {
  case testError
}

public extension Fact {
  static var unexpectedTestError: Fact {
    return .unexpectedError(AssertionConsumerError.testError)
  }
}
