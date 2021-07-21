public protocol Withable {
  init()
  static func with(_ configurator: (inout Self) throws -> Void) rethrows -> Self
}

public extension Withable {
  static func with(_ configurator: (inout Self) throws -> Void) rethrows -> Self {
    var target = Self()
    try configurator(&target)
    return target
  }
}
