@testable import OptionalUtils
import Truth
import XCTest

class IsNotNilTests: XCTestCase {
  var value: String?

  func test_isNotNil_WithNonNilValue() throws {
    value = "foo"
    let result = try value.isNotNil()
    assertThat(result).isEqualTo("foo")
  }

  func test_isNotNil_WithNilValue() throws {
    assertThat {
      try self.value.isNotNil()
    }.doesThrow {
      $0.isA(OptionalError.self) {
        guard case .unexpectedNil = $0.actual else {
          self.fail("expected unexpectedNil error")
          return
        }
      }
    }
  }

  static var allTests = [
    ("test_isNotNil_WithNonNilValue", test_isNotNil_WithNonNilValue),
    ("test_isNotNil_WithNilValue", test_isNotNil_WithNilValue),
  ]
}
