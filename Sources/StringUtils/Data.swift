import Foundation

enum DataStringConversionError: Error {
  case failedToConvertDataToString(String.Encoding)
  case failedToConvertStringToData(String.Encoding)
}

extension Data {
  public func toString(using encoding: String.Encoding = .utf8) throws -> String {
    guard let result = String(data: self, encoding: encoding) else {
      throw DataStringConversionError.failedToConvertDataToString(encoding)
    }
    return result
  }
}

extension String {
  public func toData(using encoding: String.Encoding = .utf8) throws -> Data {
    guard let result = data(using: encoding) else {
      throw DataStringConversionError.failedToConvertStringToData(encoding)
    }
    return result
  }
}
