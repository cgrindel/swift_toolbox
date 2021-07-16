public extension Optional {
  /// Unwraps the optional
  func isNotNil(file: StaticString = #file, line: UInt = #line) throws -> Wrapped {
    guard let wrapped = self else {
      throw OptionalError.unexpectedNil(file, line)
    }
    return wrapped
  }
}
