import XCTest

/// Return a subject for the target.
public func assertThat<T>(
  _ actual: T,
  using failureStrategy: FailureStrategy
) -> Subject<T> {
  return Subject(actual: actual, failureStrategy: failureStrategy)
}

/// Return a subject for the target.
public func assertThat<T>(
  _ actual: T,
  using failureStrategy: FailureStrategy,
  with customMessage: @escaping @autoclosure MessageClosure
) -> Subject<T> {
  var customMessages = [MessageClosure]()
  customMessages.append(customMessage)
  return Subject(actual: actual, failureStrategy: failureStrategy, customMessages: customMessages)
}

// Create a subject for the target and pass it to the provided consumer. This form is useful when
// wanting to perform a number of assertions on a single subject. This avoids massive compilation
// times when chaining assertions.
@discardableResult
public func assertThat<T>(
  _ actual: T,
  using failureStrategy: FailureStrategy,
  _ consumer: (Subject<T>) -> Void
) -> Subject<T> {
  let subject = assertThat(actual, using: failureStrategy)
  consumer(subject)
  return subject
}

// Create a subject for the target and pass it to the provided consumer. This form is useful when
// wanting to perform a number of assertions on a single subject. This avoids massive compilation
// times when chaining assertions.
@discardableResult
public func assertThat<T>(
  _ actual: T,
  using failureStrategy: FailureStrategy,
  with customMessage: @escaping @autoclosure MessageClosure,
  _ consumer: (Subject<T>) -> Void
) -> Subject<T> {
  let subject = assertThat(actual, using: failureStrategy, with: customMessage())
  consumer(subject)
  return subject
}

/// Return a subject for the throwable expression.
public func assertThat<T>(
  using failureStrategy: FailureStrategy,
  _ expression: @escaping () throws -> T
) -> ThrowsSubject<T> {
  return ThrowsSubject(failureStrategy: failureStrategy, expression: expression)
}

public extension XCTestCase {
  /// Return a subject for the target.
  func assertThat<T>(_ actual: T) -> Subject<T> {
    return Truth.assertThat(actual, using: failureStrategy)
  }

  /// Return a subject for the target.
  func assertThat<T>(
    _ actual: T,
    with customMessage: @escaping @autoclosure MessageClosure
  ) -> Subject<T> {
    return Truth.assertThat(actual, using: failureStrategy, with: customMessage())
  }

  // Create a subject for the target and pass it to the provided consumer. This form is useful when
  // wanting to perform a number of assertions on a single subject. This avoids massive compilation
  // times when chaining assertions.
  @discardableResult
  func assertThat<T>(
    _ actual: T,
    _ consumer: (Subject<T>) -> Void
  ) -> Subject<T> {
    return Truth.assertThat(actual, using: failureStrategy, consumer)
  }

  // Create a subject for the target and pass it to the provided consumer. This form is useful when
  // wanting to perform a number of assertions on a single subject. This avoids massive compilation
  // times when chaining assertions.
  @discardableResult
  func assertThat<T>(
    _ actual: T,
    with customMessage: @autoclosure @escaping MessageClosure,
    _ consumer: (Subject<T>) -> Void
  ) -> Subject<T> {
    return Truth.assertThat(actual, using: failureStrategy, with: customMessage(), consumer)
  }

  /// Return a subject for the throwable expression.
  func assertThat<T>(
    expression: @escaping () throws -> T
  ) -> ThrowsSubject<T> {
    return Truth.assertThat(using: failureStrategy, expression)
  }
}

// MARK: - Helpers for Child Subjects

public extension BaseSubject {
  /// Returns a Subject for the provided value using this instance's failure strategy.
  func that<T>(_ actual: T) -> Subject<T> {
    return Subject(
      actual: actual,
      failureStrategy: failureStrategy,
      customMessages: customMessages,
      continueAssertions: continueAssertions
    )
  }

  /// Returns a Subject for the provided expression using this instance's failure strategy.
  func that<T>(
    expression: @escaping ThrowsSubject<T>.ThrowableFn
  ) -> ThrowsSubject<T> {
    return ThrowsSubject(
      failureStrategy: failureStrategy,
      continueAssertions: continueAssertions,
      expression: expression
    )
  }
}
