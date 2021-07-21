import Foundation

extension TimeInterval {
  public typealias DateProvider = () -> Date

  /// Calculate a date from the provided date plus this time interval.
  public func from(_ date: Date) -> Date {
    return date + self
  }

  /// Calculate a date from the provided date plus this time interval.
  public func after(_ date: Date) -> Date {
    return from(date)
  }

  /// Calculate a date by adding this time interval to the current time.
  public func fromNow(_ dateProvider: @autoclosure DateProvider = Date()) -> Date {
    return from(dateProvider())
  }

  /// Calculate a date from the provided date minus this time interval.
  public func before(_ date: Date) -> Date {
    return date - self
  }

  /// Calculate a date by subtracting this time interval from the current time.
  public func ago(_ dateProvider: @autoclosure DateProvider = Date()) -> Date {
    return before(dateProvider())
  }
}
