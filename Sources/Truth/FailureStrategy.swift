import StringUtils
import XCTest

// MARK: - FailureStrategy

public protocol FailureStrategy {
  /// Log failure information
  func fail(_ message: String, file: StaticString, line: UInt)
}

public extension FailureStrategy {
  /// Log a failure from an instance of a failure.
  func fail(with failure: Failure) {
    fail(failure.message, file: failure.file, line: failure.line)
  }
}

// MARK: - Default Strategy

/// The default failure logging implementation.
public class DefaultFailureStrategy: FailureStrategy {
  public init() {}

  /// Log failure information
  public func fail(_ message: String, file: StaticString = #file, line: UInt = #line) {
    XCTFail(message, file: file, line: line)
  }
}

// MARK: - FailureCapture Strategy

/// Failure logging implementation that captures the failure calls for later inspection.
public class FailureCapture: FailureStrategy {
  public init() {}

  public private(set) var capturedFailures = [Failure]()

  /// Log a failure message
  public func fail(_ message: String, file: StaticString = #file, line: UInt = #line) {
    capturedFailures.append(Failure(message: message, file: file, line: line))
  }
}

// MARK: - Attach Failure Strategy to Test Case

public protocol FailureStrategyProvider {
  var failureStrategy: FailureStrategy { get }
}

extension XCTestCase: FailureStrategyProvider {
  private enum FailureStrategyHolder {
    static var current: FailureStrategy = DefaultFailureStrategy()
  }

  public var failureStrategy: FailureStrategy {
    get {
      return FailureStrategyHolder.current
    }
    set(newValue) {
      FailureStrategyHolder.current = newValue
    }
  }

  public func fail(_ message: String, file: StaticString = #file, line: UInt = #line) {
    failureStrategy.fail(message, file: file, line: line)
  }
}
