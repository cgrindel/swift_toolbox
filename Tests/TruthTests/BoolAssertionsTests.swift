@testable import Truth
import XCTest

class BoolAssertionsTests: XCTestCase {
  func test_isTrue_Success() {
    assertNoFailures { $0.that(true).isTrue() }
  }

  func test_isTrue_Failure() {
    assertFailure([Fact("expected to be true")]) { $0.that(false).isTrue() }
  }

  func test_isFalse_Success() {
    assertNoFailures { $0.that(false).isFalse() }
  }

  func test_isFalse_Failure() {
    assertFailure([Fact("expected to be false")]) { $0.that(true).isFalse() }
  }
}
