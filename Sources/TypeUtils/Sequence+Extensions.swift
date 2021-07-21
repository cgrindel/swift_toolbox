public extension Sequence {
  func ofType<TargetType>(_: TargetType.Type) -> [TargetType] {
    var results = [TargetType]()
    for item in self {
      if let target = item as? TargetType {
        results.append(target)
      }
    }
    return results
  }
}
