import Foundation

enum DateISOFormatters {
  /// Formatter for ISO without millis
  public static var iso = {
    ISO8601DateFormatter()
  }()

  /// Formatter for ISO with millis
  public static var isoWithMillis: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions.insert(.withFractionalSeconds)
    return formatter
  }()

  public static var isoDate: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
    return formatter
  }()
}

/// Specifies the date format to use in conversions between Date and String.
public enum DateStringFormat {
  case iso
  case isoWithMillis
  case isoDate

  /// Returns the formatter for the format
  public var formatter: ISO8601DateFormatter {
    switch self {
    case .iso:
      return DateISOFormatters.iso
    case .isoWithMillis:
      return DateISOFormatters.isoWithMillis
    case .isoDate:
      return DateISOFormatters.isoDate
    }
  }
}

public enum DateStringFormatError: Error, Equatable {
  case invalidFormat(invalidValue: String)
}

extension Date {
  /// Creates a string representing this date in the specified format.
  public func toString(_ format: DateStringFormat = .isoWithMillis) -> String {
    return format.formatter.string(from: self)
  }

  /// Normalize the date value so that it matches the precision of the selected format.
  public func normalized(for format: DateStringFormat = .isoWithMillis) -> Date {
    // NOTE: It is possible to safely force try because we are restricting the format to a set of
    // known formats that should not fail unless something is very wrong. If custom formats are
    // allowed, then this force try should be revisited.

    // swiftlint:disable force_try
    return try! toString(format).tryToDate(format)
    // swiftlint:enable force_try
  }
}

extension String {
  public func toDate(_ format: DateStringFormat = .isoWithMillis) -> Date? {
    return format.formatter.date(from: self)
  }

  public func tryToDate(_ format: DateStringFormat = .isoWithMillis) throws -> Date {
    guard let date = toDate(format) else {
      throw DateStringFormatError.invalidFormat(invalidValue: self)
    }
    return date
  }
}
