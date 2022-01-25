@testable import MathUtils
import Truth
import XCTest

class DecimalSequenceHelpersTests: XCTestCase {
  func test_sum_WithEmptySequence() throws {
    let decimals = [Decimal]()
    assertThat(decimals.sum).isEqualTo(0)
  }

  func test_sum_WithValues() throws {
    let decimals: [Decimal] = [1, 2, 3]
    assertThat(decimals.sum).isEqualTo(6)
  }

  func test_average_WithEmptyCollection() throws {
    let decimals = [Decimal]()
    assertThat(decimals.average).isNaN()
  }

  func test_average_WithValues() throws {
    let decimals: [Decimal] = [1, 2, 3]
    assertThat(decimals.average).isEqualTo(2)
  }

  func test_mulitplication() throws {
    let empty = [Decimal]()
    let decimals: [Decimal] = [1, 2, 3]
    let moreDecimals: [Decimal] = [5, 6, 7, 8]
    assertThat(empty * empty).isEqualTo(empty)
    assertThat(empty * decimals).isEqualTo(empty)
    assertThat(decimals * decimals).isEqualTo([1, 4, 9])
    assertThat(decimals * moreDecimals).isEqualTo([5, 12, 21])
  }

  static var allTests = [
    ("test_sum_WithEmptySequence", test_sum_WithEmptySequence),
    ("test_sum_WithValues", test_sum_WithValues),
    ("test_average_WithEmptyCollection", test_average_WithEmptyCollection),
    ("test_average_WithValues", test_average_WithValues),
    ("test_mulitplication", test_mulitplication),
  ]
}
