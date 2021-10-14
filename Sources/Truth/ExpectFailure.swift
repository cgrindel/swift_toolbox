import XCTest

public class WhenTesting {
  let failureCapture = FailureCapture()

  public var failureStrategy: FailureStrategy {
    failureCapture
  }

  public var failures: [Failure] {
    failureCapture.capturedFailures
  }

  /// Returns a Subject for the provided value using this instance's failure strategy.
  public func that<T>(_ actual: T) -> Subject<T> {
    return Subject(actual: actual, failureStrategy: failureStrategy)
  }

  /// Returns a Subject for the provided expression using this instance's failure strategy.
  public func that<T>(_ expression: @escaping ThrowsSubject<T>.ThrowableFn) -> ThrowsSubject<T> {
    return ThrowsSubject(failureStrategy: failureStrategy, expression: expression)
  }
}

public typealias WhenTestingConsumer = (WhenTesting) -> Void

public extension XCTestCase {
  /// Used for testing Truth assertions. Captures assertions made inside the
  func expectFailure(_ consumer: WhenTestingConsumer) -> [Failure] {
    let whenTesting = WhenTesting()
    let originalFailureStrategy = failureStrategy
    defer { self.failureStrategy = originalFailureStrategy }
    failureStrategy = whenTesting.failureStrategy

    consumer(whenTesting)

    return whenTesting.failures
  }

  /// Used for testing Truth assertions. Do not use in other types of tests.
  func assertNoFailures(
    file: StaticString = #file,
    line: UInt = #line,
    _ closure: WhenTestingConsumer
  ) {
    let failures = expectFailure { closure($0) }
    if failures.count != 0 {
      XCTFail("Expected no failures, but found \(failures)", file: file, line: line)
    }
  }

  /// Used for testing Truth assertions. Do not use in other types of tests.
  func assertFailure(
    _ expectedFailFacts: [Fact]? = nil,
    file: StaticString = #file,
    line: UInt = #line,
    _ closure: WhenTestingConsumer
  ) {
    let failures = expectFailure { closure($0) }
    guard failures.count == 1 else {
      XCTFail("Expected 1 failure, but found \(failures)", file: file, line: line)
      return
    }
    if let expectedFailFacts = expectedFailFacts {
      XCTAssertEqual(failures[0].message, expectedFailFacts.toMessage(), file: file, line: line)
    }
  }
}
