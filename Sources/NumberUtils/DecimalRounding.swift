import Foundation

extension Decimal {
  /// Returns a new decimal value rounded to the specified number of decimal places using the
  /// provided rounding mode. The default mode of bankers rounds to the even number. See
  /// https://en.wikipedia.org/wiki/Significance_arithmetic#Rounding_rules for details.
  public func roundTo(
    decimalPlaces: Int,
    roundingMode: NSDecimalNumber.RoundingMode = .bankers
  ) -> Decimal {
    var result: Decimal = 0
    var original = self
    NSDecimalRound(&result, &original, decimalPlaces, roundingMode)
    return result
  }
}
