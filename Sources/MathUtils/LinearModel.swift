import Foundation
import StructUtils

public struct LinearModel: Withable, Equatable {
  public var slope: Decimal = 0
  public var intercept: Decimal = 0

  public init() {}
}

// MARK: - Calculate Y value

public extension LinearModel {
  /// Returns the expected y-value given the x-value.
  func yValue(forX xValue: Decimal) -> Decimal {
    return intercept + slope * xValue
  }
}

// MARK: - Create from Decimal Pairs

// Inspired by https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linear%20Regression

public extension LinearModel {
  /// Creates a linear model based upon the ordered pairs (e.g. points) that are provided. Returns
  /// nil, if 0 or 1 pair is provided.
  static func from<OP>(pairs: [OP]) -> Self?
    where OP: OrderedPairProtocol, OP.XValue == Decimal, OP.YValue == Decimal
  {
    return .from(xValues: pairs.xValues, yValues: pairs.yValues)
  }

  /// Creates a linear model based upon the array of values that are provided. Returns
  /// nil, if either array has 0 or 1 value.
  static func from(xValues: [Decimal], yValues: [Decimal]) -> Self? {
    // Must have two or more points to create a linear model.
    guard xValues.count > 1, yValues.count > 1 else {
      return nil
    }
    let xsAvg = xValues.average
    let ysAvg = yValues.average
    let sum1 = (xValues * yValues).average - xsAvg * ysAvg
    let sum2 = (xValues * xValues).average - xsAvg * xsAvg
    return .with {
      $0.slope = sum1 / sum2
      $0.intercept = ysAvg - $0.slope * xsAvg
    }
  }
}
