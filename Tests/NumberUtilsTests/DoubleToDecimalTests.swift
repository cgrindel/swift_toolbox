import Truth
import XCTest

class DoubleToDecimalTests: XCTestCase {
  func test() {
    let double = 123.0
    assertThat(double.decimalValue).isEqualTo(Decimal(double))
  }
}
