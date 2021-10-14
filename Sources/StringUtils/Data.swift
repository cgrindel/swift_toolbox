import Foundation

enum DataStringConversionError: Error {
  case failedToConvertDataToString(String.Encoding)
  case failedToConvertStringToData(String.Encoding)
}

public extension Data {
  func toString(using encoding: String.Encoding = .utf8) throws -> String {
    guard let result = String(data: self, encoding: encoding) else {
      throw DataStringConversionError.failedToConvertDataToString(encoding)
    }
    return result
  }
}

public extension String {
  func toData(using encoding: String.Encoding = .utf8) throws -> Data {
    guard let result = data(using: encoding) else {
      throw DataStringConversionError.failedToConvertStringToData(encoding)
    }
    return result
  }
}
