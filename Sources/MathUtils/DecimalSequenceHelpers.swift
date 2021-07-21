import Foundation

// MARK: - Sum

public extension Sequence where Element == Decimal {
  var sum: Decimal {
    return reduce(0, +)
  }
}

// MARK: - Average

public extension Collection where Element == Decimal {
  var average: Decimal {
    return sum / Decimal(count)
  }
}

// MARK: - Mulitply Elements of Two Arrays

public extension Array where Element == Decimal {
  /// Multiple each corresponding element of the arrays.
  static func * (_ lhs: [Decimal], _ rhs: [Decimal]) -> [Decimal] {
    return zip(lhs, rhs).map(*)
  }
}
