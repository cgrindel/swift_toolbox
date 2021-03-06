public extension Subject where T == Failure {
  /// Returns a subject for assertions on this failure's message.
  func hasMessageThat() -> Subject<String> {
    return that(actual.message)
  }
}
