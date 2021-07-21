public protocol OrderedPairProtocol {
  associatedtype XValue
  associatedtype YValue

  // swiftlint:disable identifier_name
  var x: XValue { get }
  var y: YValue { get }
  // swiftlint:enable identifier_name
}

// MARK: - xValues and yValues

public extension Sequence where Element: OrderedPairProtocol {
  var xValues: [Element.XValue] {
    return map { $0.x }
  }

  var yValues: [Element.YValue] {
    return map { $0.y }
  }
}
