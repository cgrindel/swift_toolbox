/// Captures information logged for a failure. This captures the failure call explicitly withtout
/// any conversion. Since it captures the file as a StaticString, it is not Equatable. To compare
public struct Failure {
  public let message: String
  public let file: StaticString
  public let line: UInt

  public init(message: String, file: StaticString, line: UInt) {
    self.message = message
    self.file = file
    self.line = line
  }

  /// Create a new failure prepending the custom message.
  public func withCustomMessage(_ customMessage: String) -> Self {
    return .init(message: "\(customMessage) \(message)", file: file, line: line)
  }
}

/// Represents a failure that can be used for comparisons.
public struct EquatableFailure: Equatable {
  public let message: String
  public let file: String
  public let line: UInt

  public init(message: String, file: String, line: UInt) {
    self.message = message
    self.file = file
    self.line = line
  }
}

extension Failure {
  /// Returns an instance that can be used in comparisons.
  public func asEquatable() -> EquatableFailure {
    return EquatableFailure(message: message, file: file.toString(), line: line)
  }
}

extension Collection where Element == Failure {
  /// Returns an array of equatable failures that is suitable for direct comparison.
  public func asEquatable() -> [EquatableFailure] {
    return map { $0.asEquatable() }
  }
}
