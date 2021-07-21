import Foundation

extension Decimal {
  /// Returns the double value for the Decimal.
  public var doubleValue: Double {
    return NSDecimalNumber(decimal: self).doubleValue
  }
}
