@testable import MathUtils
import Truth
import XCTest

class OrderedPairProtocolTests: XCTestCase {
  struct TestPair: OrderedPairProtocol {
    typealias XValue = Decimal
    typealias YValue = Decimal

    // swiftlint:disable identifier_name
    public var x: Decimal
    public var y: Decimal
    // swiftlint:enable identifier_name

    init(_ xValue: Decimal, _ yValue: Decimal) {
      x = xValue
      y = yValue
    }
  }

  func test_xValues_yValues() throws {
    let pairs: [TestPair] = [
      .init(1, 5),
      .init(2, 6),
      .init(3, 7),
    ]
    assertThat(pairs)
      .key(\.xValues) { $0.isEqualTo([1, 2, 3]) }
      .key(\.yValues) { $0.isEqualTo([5, 6, 7]) }
  }

  static var allTests = [
    ("test_xValues_yValues", test_xValues_yValues),
  ]
}
