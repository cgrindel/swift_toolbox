@testable import StringUtils
import Truth
import XCTest

class StringRangeSubscriptExtTests: XCTestCase {
  let value = "hello goodbye"

  func test_extensionHelpers() throws {
    assertThat(String(value.substring(from: 6))).isEqualTo("goodbye")
    assertThat(String(value.substring(to: 5))).isEqualTo("hello")
    assertThat(String(value.substring(with: 3 ..< 8))).isEqualTo("lo go")
  }
}
