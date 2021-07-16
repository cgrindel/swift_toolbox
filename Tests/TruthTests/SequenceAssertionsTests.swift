@testable import Truth
import XCTest

class SequenceAssertionsTests: XCTestCase {
  func test_contains_Success() {
    let actual = [1, 2, 3]
    assertNoFailures { $0.that(actual).contains(2, 3) }
  }

  func test_contains_Failure() {
    let actual = [1, 2, 3]
    let expected = 4
    assertFailure([Fact("expected to contain", expected)]) { $0.that(actual).contains(expected) }
  }

  func test_contains_WithTwoMissing_Failure() {
    let actual = [1, 2, 3]
    assertFailure([Fact("expected to contain", 4), Fact("expected to contain", 5)]) {
      $0.that(actual).contains(2, 4, 5)
    }
  }

  func test_eachItem_Success() {
    let actual = [true, true, true]
    assertNoFailures { $0.that(actual).eachItem { $0.isTrue() } }
  }

  func test_eachItem_Failure() {
    let actual = [true, false, true]
    assertFailure([Fact("position: 1 expected to be true")]) {
      $0.that(actual).eachItem { $0.isTrue() }
    }
  }
}
