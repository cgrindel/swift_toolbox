import Truth
import XCTest

class DecimalRandomTests: XCTestCase {
  func test_random_WithRange() {
    let range = Decimal(0) ..< Decimal(360)
    let result = Decimal.random(in: range)
    assertThat(result).isIn(range)
  }

  func test_random_WithClosedRange() {
    let range = Decimal(-90) ... Decimal(90)
    let result = Decimal.random(in: range)
    assertThat(result).isIn(range)
  }
}
