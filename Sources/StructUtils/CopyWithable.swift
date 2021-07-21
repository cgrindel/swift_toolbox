/// Provides the ability for a class or struct instance to be copied and modified.
public protocol CopyWithable {
  func copyWith(_ configurator: (inout Self) -> Void) -> Self
}

public extension CopyWithable {
  func copyWith(_ configurator: (inout Self) -> Void) -> Self {
    var target = self
    configurator(&target)
    return target
  }
}
