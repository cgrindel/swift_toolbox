import Truth
@testable import TypeUtils
import XCTest

class SequenceExtensionsTests: XCTestCase {
  let testItems: [TestProtocol] = ["foo", 123, "bar", 456]

  func test_ofType_ForSequence() throws {
    let empty = [TestProtocol]()
    assertThat(empty.ofType(String.self)).isEqualTo([])
    assertThat(testItems.ofType(String.self)).isEqualTo(["foo", "bar"])
  }
}
