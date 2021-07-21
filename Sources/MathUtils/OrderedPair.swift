/// Represents a point.
public struct OrderedPair<XValue, YValue> {
  // swiftlint:disable identifier_name
  public var x: XValue
  public var y: YValue
  // swiftlint:enable identifier_name

  public init(_ xValue: XValue, _ yValue: YValue) {
    x = xValue
    y = yValue
  }
}

// MARK: - OrderedPairProtocol

extension OrderedPair: OrderedPairProtocol {}
