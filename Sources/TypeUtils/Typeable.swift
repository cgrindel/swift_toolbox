public protocol Typeable {}

enum TypeableError: Error {
  case unexpectedType(String, StaticString, UInt)
}

// MARK: - Type Extensions

public extension Typeable {
  func asType<TargetType>(
    _: TargetType.Type,
    file: StaticString = #file,
    line: UInt = #line
  ) throws -> TargetType {
    guard let target = self as? TargetType else {
      throw TypeableError
        .unexpectedType(
          "expected \(TargetType.self), but was \(String(reflecting: self))",
          file,
          line
        )
    }
    return target
  }
}
