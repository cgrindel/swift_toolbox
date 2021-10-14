import Foundation

public extension Decimal {
  /// Generate a random value in the specified range.
  static func random(in range: Range<Decimal>) -> Decimal {
    let doubleRange = range.lowerBound.doubleValue ..< range.upperBound.doubleValue
    return Double.random(in: doubleRange).decimalValue
  }

  /// Generate a random value in the specified range.
  static func random(in range: ClosedRange<Decimal>) -> Decimal {
    let doubleRange = range.lowerBound.doubleValue ... range.upperBound.doubleValue
    return Double.random(in: doubleRange).decimalValue
  }
}
