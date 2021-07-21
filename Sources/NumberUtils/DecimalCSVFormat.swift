import Foundation

// MARK: - Serialization for SQLite3 storage.

public extension Decimal {
  /// This is for converting the Decimal to a string for storage in a CSV string. It should
  /// not be used for locale-specific conversion.
  var csvValue: String {
    return String(describing: self)
  }
}

public extension String {
  /// This is for converting a string encoded for CSV serialization to a Decimal.
  /// Locale-specific conversions should use more appropriate means.
  var asDecimal: Decimal {
    return Decimal(string: self) ?? Decimal.nan
  }

  var decimalValue: Decimal {
    return asDecimal
  }
}

public extension Substring {
  var asDecimal: Decimal {
    return String(self).decimalValue
  }

  var decimalValue: Decimal {
    return asDecimal
  }
}

// MARK: - Create from String

extension Decimal: ExpressibleByStringLiteral {
  public typealias StringLiteralType = String

  /// This is a convenience for specifying decimal values as string literals. It should not be used
  /// for locale-specific conversions.
  public init(stringLiteral: String) {
    self = stringLiteral.asDecimal
  }
}

// MARK: - Codable Support

// Implementing custom encode and decode to avoid having the value converted to a Double before
// being turned into a Decimal.

public extension KeyedEncodingContainer {
  mutating func encode(_ value: Decimal, forKey key: KeyedEncodingContainer<K>.Key) throws {
    let strValue = value.csvValue
    try encode(strValue, forKey: key)
  }
}

public extension KeyedDecodingContainer {
  func decode(_: Decimal.Type, forKey key: K) throws -> Decimal {
    let strValue = try decode(String.self, forKey: key)
    return strValue.asDecimal
  }
}
