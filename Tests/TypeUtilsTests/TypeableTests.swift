import Truth
@testable import TypeUtils
import XCTest

class TypeableTests: XCTestCase {
  let testItems: [TestProtocol] = ["foo", 123, "bar", 456]

  func test_asType_ForTypeable_Success() throws {
    let result = try testItems[0].asType(String.self)
    assertThat(result).isEqualTo("foo")
  }

  func test_asType_ForTypeable_Fail() throws {
    assertThat {
      try self.testItems[0].asType(Int.self)
    }.doesThrow {
      $0.isA(TypeableError.self) {
        guard case .unexpectedType = $0.actual else {
          self.fail("expected unexpectedType error")
          return
        }
      }
    }
  }
}
