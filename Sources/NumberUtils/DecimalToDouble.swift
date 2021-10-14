import Foundation

public extension Decimal {
  /// Returns the double value for the Decimal.
  var doubleValue: Double {
    return NSDecimalNumber(decimal: self).doubleValue
  }
}
