// MARK: - Fact

/// Represents a single fact or aspect related to an assertion failure.
public struct Fact: Equatable {
  public var key: String
  public var value: String?

  public init(_ key: String) {
    self.key = key
  }

  public init<T>(_ key: String, _ value: T) {
    self.key = key
    self.value = "\(value)"
  }

  /// Generates a message from the fact.
  public func toMessage() -> String {
    var msg = key
    if let value = value {
      msg += " \(value)"
    }
    return msg
  }
}

public extension Collection where Element == Fact {
  /// For a given collection of facts, generate a message.
  func toMessage() -> String {
    return map { $0.toMessage() }.joined(separator: ", ")
  }
}

public extension Failure {
  /// Create a failure from the provided facts as variadic args.
  init(file: StaticString = #file, line: UInt = #line, _ facts: Fact...) {
    self.init(file: file, line: line, facts)
  }

  /// Create a failure from the provided facts.
  init(file: StaticString = #file, line: UInt = #line, _ facts: [Fact]) {
    self.init(message: facts.toMessage(), file: file, line: line)
  }
}

// MARK: - Default Failure Strategy

public extension FailureStrategy {
  /// Log a failure from the provided facts.
  func fail(file: StaticString = #file, line: UInt = #line, _ facts: [Fact]) {
    fail(facts.toMessage(), file: file, line: line)
  }

  /// Log a filure using the specified facts as variadic arguments.
  func fail(file: StaticString, line: UInt, _ facts: Fact...) {
    fail(file: file, line: line, facts)
  }
}

// MARK: - Unxpected error fact

public extension Fact {
  static func unexpectedError(_ error: Error) -> Fact {
    return Fact("unexpected error:", error)
  }
}
