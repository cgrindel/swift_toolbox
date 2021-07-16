// MARK: - BaseSubject

public typealias MessageClosure = () -> String

public class BaseSubject {
  let failureStrategy: FailureStrategy
  public private(set) var continueAssertions: Bool = true

  public var customMessages = [MessageClosure]()

  public init(
    failureStrategy: FailureStrategy,
    customMessages: [MessageClosure] = [],
    continueAssertions: Bool = true
  ) {
    self.failureStrategy = failureStrategy
    self.customMessages = customMessages
    self.continueAssertions = continueAssertions
  }

  /// Add a custom message to any failing assertions on this subject. Note: Any custom message will
  /// only apply to assertions that occur after the message has been added.
  @discardableResult public func withMessage(
    _ message: @escaping @autoclosure MessageClosure
  ) -> Self {
    customMessages.append(message)
    return self
  }

  /// Record the failure and discontinue assertion execution.
  public func fail(with failure: Failure) {
    continueAssertions = false
    var failureToLog = failure
    if !customMessages.isEmpty {
      let customMessage = customMessages.map { $0() }.joined(separator: ", ")
      failureToLog = failureToLog.withCustomMessage(customMessage)
    }
    failureStrategy.fail(with: failureToLog)
  }

  public func fail(file: StaticString = #file, line: UInt = #line, _ facts: Fact...) {
    fail(with: Failure(file: file, line: line, facts))
  }

  public func fail(file: StaticString = #file, line: UInt = #line, _ facts: [Fact]) {
    fail(with: Failure(file: file, line: line, facts))
  }
}

// MARK: - Subject

public class Subject<T>: BaseSubject {
  public let actual: T

  public init(
    actual: T,
    failureStrategy: FailureStrategy,
    customMessages: [MessageClosure] = [],
    continueAssertions: Bool = true
  ) {
    self.actual = actual
    super.init(
      failureStrategy: failureStrategy,
      customMessages: customMessages,
      continueAssertions: continueAssertions
    )
  }

  /// Executes the assertion failing with the provided failure.
  @discardableResult public func doAssert(
    failWith failure: @autoclosure () -> Failure,
    assertion: () -> Bool
  ) -> Self {
    if continueAssertions, !assertion() {
      fail(with: failure())
    }
    return self
  }
}
