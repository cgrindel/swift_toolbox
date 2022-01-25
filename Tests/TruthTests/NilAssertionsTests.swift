@testable import Truth
import XCTest

class NilAssertionsTests: XCTestCase {
  var actual: Int?

  func test_isNil_Succeeds() {
    actual = nil
    assertNoFailures { $0.that(actual).isNil() }
  }

  func test_isNil_Fails() {
    actual = 123
    assertFailure([Fact("expected to be nil"), Fact("but was", actual)]) {
      $0.that(actual).isNil()
    }
  }

  func test_isNotNil_WithoutClosure_Succeeds() {
    actual = 123
    assertNoFailures { $0.that(actual).isNotNil() }
  }

  func test_isNotNil_WithClosure_ForInt_Succeeds() {
    actual = 123
    var closureCalled = false
    assertNoFailures { $0.that(actual).isNotNil {
      closureCalled = true
      $0.isEqualTo(123)
    } }
    assertThat(closureCalled).isTrue()
  }

  func test_isNotNil_WithClosure_ForOptInt_Succeeds() {
    actual = 123
    var closureCalled = false
    assertNoFailures { $0.that(actual).isNotNil {
      closureCalled = true
      $0.isEqualTo(123)
    } }
    assertThat(closureCalled).isTrue()
  }

  func test_isNotNil_WithoutClosure_Fails() {
    actual = nil
    assertFailure([Fact("expected not to be nil")]) { $0.that(actual).isNotNil() }
  }

  func test_isNotNil_WithClosure_Fails() {
    actual = nil
    assertFailure([Fact("expected not to be nil")]) {
      $0.that(actual).isNotNil { _ in
        self.fail("Closure should not be called.")
      }
    }
  }

  func test_isNotNil_WithError() throws {
    actual = 123
    assertFailure([.unexpectedTestError]) {
      $0.that(actual).isNotNil { _ in throw AssertionConsumerError.testError }
    }
  }

  static var allTests = [
    ("test_isNil_Succeeds", test_isNil_Succeeds),
    ("test_isNil_Fails", test_isNil_Fails),
    ("test_isNotNil_WithoutClosure_Succeeds", test_isNotNil_WithoutClosure_Succeeds),
    ("test_isNotNil_WithClosure_ForInt_Succeeds", test_isNotNil_WithClosure_ForInt_Succeeds),
    ("test_isNotNil_WithClosure_ForOptInt_Succeeds", test_isNotNil_WithClosure_ForOptInt_Succeeds),
    ("test_isNotNil_WithoutClosure_Fails", test_isNotNil_WithoutClosure_Fails),
    ("test_isNotNil_WithClosure_Fails", test_isNotNil_WithClosure_Fails),
    ("test_isNotNil_WithError", test_isNotNil_WithError),
  ]
}
