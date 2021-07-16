extension StaticString {
  public func toString() -> String {
    withUTF8Buffer { String(decoding: $0, as: UTF8.self) }
  }
}
