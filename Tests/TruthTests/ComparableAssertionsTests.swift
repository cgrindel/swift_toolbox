@testable import Truth
import XCTest

class ComparableAssertionsTests: XCTestCase {
  let actual = 5

  func test_isIn_WithRange_Success() {
    let range = 0 ..< 10
    assertNoFailures { $0.that(actual).isIn(range) }
  }

  func test_isIn_WithRange_Failure() {
    let range = 0 ..< 5
    assertFailure([Fact("expected", actual), Fact("to be in", range)]) {
      $0.that(actual).isIn(range)
    }
  }

  func test_isIn_WithClosedRange_Success() {
    let range = 0 ... 10
    assertNoFailures { $0.that(actual).isIn(range) }
  }

  func test_isIn_WithClosedRange_Failure() {
    let range = 0 ... 4
    assertFailure([Fact("expected", actual), Fact("to be in", range)]) {
      $0.that(actual).isIn(range)
    }
  }
}
