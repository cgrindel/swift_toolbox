import Foundation

public extension Decimal {
  /// Truncate the decimal value returning only the integer part.
  var intValue: Int {
    let roundingMode: NSDecimalNumber.RoundingMode = (self < Decimal(0) ? .up : .down)
    let rounded = roundTo(decimalPlaces: 0, roundingMode: roundingMode)
    return NSDecimalNumber(decimal: rounded).intValue
  }
}
