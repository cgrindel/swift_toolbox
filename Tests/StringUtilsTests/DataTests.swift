@testable import StringUtils
import Truth
import XCTest

class DataTests: XCTestCase {
  let emoji = "🙃"

  func test_toStringAndToDataRoundTrip_Success() {
    assertThat {
      let encoding = String.Encoding.utf8
      let data = try self.emoji.toData(using: encoding)
      let result = try data.toString(using: encoding)
      self.assertThat(result).isEqualTo(self.emoji)
    }.doesNotThrow()
  }

  func test_toData_WithIncorrectEncoding_Fails() {
    let expectedEncoding = String.Encoding.ascii
    assertThat {
      _ = try self.emoji.toData(using: expectedEncoding)
    }.doesThrow {
      $0.isA(DataStringConversionError.self) {
        guard case let .failedToConvertStringToData(encoding) = $0.actual else {
          self.fail("Expected failedToConvertStringToData")
          return
        }
        self.assertThat(encoding).isEqualTo(expectedEncoding)
      }
    }
  }

  func test_toString_WithIncorrectEncoding_Fails() {
    let expectedEncoding = String.Encoding.utf32BigEndian
    assertThat {
      let data = try self.emoji.toData(using: .utf16)
      _ = try data.toString(using: expectedEncoding)
    }.doesThrow {
      $0.isA(DataStringConversionError.self) {
        guard case let .failedToConvertDataToString(encoding) = $0.actual else {
          self.fail("Expected failedToConvertStringToData")
          return
        }
        self.assertThat(encoding).isEqualTo(expectedEncoding)
      }
    }
  }
}
