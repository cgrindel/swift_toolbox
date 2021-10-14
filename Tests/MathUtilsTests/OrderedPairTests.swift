@testable import MathUtils
import Truth
import XCTest

class OrderedPairTests: XCTestCase {
  func test_init() throws {
    let xValue: Decimal = 1
    let yValue: Double = 2
    let pair = OrderedPair(xValue, yValue)
    assertThat(pair)
      .key(\.x) { $0.isEqualTo(xValue) }
      .key(\.y) { $0.isEqualTo(yValue) }
  }
}
