@testable import NumberUtils
import Truth
import XCTest

class DecimalToDoubleTests: XCTestCase {
  func test() {
    let double = 123.0
    let decimal = Decimal(double)
    assertThat(decimal.doubleValue).isEqualTo(double)
  }

  static var allTests = [
    ("test", test),
  ]
}
