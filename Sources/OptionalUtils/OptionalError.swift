enum OptionalError: Error {
  /// First arg is the source filename, second arg is the line number
  case unexpectedNil(StaticString, UInt)
}
