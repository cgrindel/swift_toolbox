import Foundation
@testable import Truth
import XCTest

class DecimalAssertionsTests: XCTestCase {
  // MARK: - isNaN / isNotNaN

  func test_isNaN_Success() {
    assertNoFailures { $0.that(Decimal.nan).isNaN() }
  }

  func test_isNaN_Fails() {
    let value = Decimal(123.45)
    assertFailure([Fact("expected to be NaN"), Fact("but was", value)]) {
      $0.that(value).isNaN()
    }
  }

  func test_isNotNaN_Success() {
    let value = Decimal(123.45)
    assertNoFailures { $0.that(value).isNotNaN() }
  }

  func test_isNotNaN_Fails() {
    assertFailure([Fact("expected not to be NaN")]) {
      $0.that(Decimal.nan).isNotNaN()
    }
  }

  // MARK: isCloseTo

  func test_isCloseTo_plusOrMinus_Success() {
    assertNoFailures {
      $0.that(Decimal(1.1)).isCloseTo(1, plusOrMinus: 0.1)
    }
    assertNoFailures {
      $0.that(Decimal(1.1)).isCloseTo(1, plusOrMinus: -0.1)
    }
  }

  func test_isCloseTo_plusOrMinus_Fails() {
    assertFailure {
      $0.that(Decimal(1.2)).isCloseTo(1, plusOrMinus: 0.1)
    }
  }

  func test_isCloseTo_within_Success() {
    assertNoFailures {
      $0.that(Decimal(1.1)).isCloseTo(1, within: 0.1)
    }
  }

  func test_isCloseTo_within_Fails() {
    assertFailure {
      $0.that(Decimal(1.2)).isCloseTo(1, within: 0.1)
    }
  }

  // MARK: - isLessThan / isGreaterThan

  func test_isLessThan_Success() {
    assertNoFailures { $0.that(Decimal(1.0)).isLessThan(2.0) }
  }

  func test_isLessThan_Failure() {
    let value = Decimal(3.0)
    let expected = Decimal(2.0)
    assertFailure([Fact("expected to be less than", expected), Fact("but was", value)]) {
      $0.that(value).isLessThan(expected)
    }
  }

  func test_isGreaterThan_Success() {
    let value = Decimal(3.0)
    let expected = Decimal(2.0)
    assertNoFailures { $0.that(value).isGreaterThan(expected) }
  }

  func test_isGreaterThan_Failure() {
    let value = Decimal(2.0)
    let expected = Decimal(3.0)
    assertFailure([Fact("expected to be greater than", expected), Fact("but was", value)]) {
      $0.that(value).isGreaterThan(expected)
    }
  }
}
