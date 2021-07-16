import Truth
import XCTest

class BidirectionalCollectionAssertionsTests: XCTestCase {
  func test_lastItem_WithLastElement() {
    let actual = [1, 2, 3]
    assertNoFailures { $0.that(actual).lastItem { $0.isEqualTo(3) } }
  }

  func test_lastItem_WithNoLastElement() {
    let actual = [Int]()
    assertFailure([Fact("expected the last element to exist")]) {
      $0.that(actual).lastItem { $0.isEqualTo(3) }
    }
  }

  func test_lastItem_WithError() throws {
    let actual = [1, 2, 3]
    assertFailure([.unexpectedTestError]) {
      $0.that(actual).lastItem { _ in throw AssertionConsumerError.testError }
    }
  }
}
