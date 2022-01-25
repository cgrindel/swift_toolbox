@testable import Truth
import XCTest

class ThrowsAssertionsTests: XCTestCase {
  enum TestError: Error, Equatable {
    case foo
    case bar
  }

  enum UnexpectedError: Error {
    case notMe
  }

  func test_doesThrow_WithoutError_Success() {
    let expected = TestError.foo
    assertNoFailures { $0.that { throw expected }.doesThrow() }
  }

  func test_doesThrow_WithoutError_FailToThrowAnError() {
    assertFailure([Fact("expected an error to be thrown")]) { $0.that { 1 == 1 }.doesThrow() }
  }

  func test_doesThrow_WithConsumer_Success() {
    let expected = TestError.foo
    assertNoFailures {
      $0.that { throw expected }.doesThrow {
        $0.isA(TestError.self) { $0.isEqualTo(expected) }
      }
    }
  }

  func test_doesThrow_WithError_Success() {
    let expected = TestError.foo
    assertNoFailures { $0.that { throw expected }.doesThrow(expected) }
  }

  func test_doesThrow_WithError_FailToThrowAnError() {
    let expected = TestError.foo
    assertFailure([Fact("expected an error to be thrown")]) {
      $0.that { 1 == 1 }.doesThrow(expected)
    }
  }

  func test_doesThrow_WithError_FailToThrowErrorWithExpectedType() {
    let expected = TestError.foo
    assertFailure([
      Fact("expected error to be an instance of", TestError.Type.self),
      Fact("but was", UnexpectedError.notMe),
    ]) {
      $0.that { throw UnexpectedError.notMe }.doesThrow(expected)
    }
  }

  func test_doesThrow_WithError_FailToThrowExpectedError() {
    let expected = TestError.foo
    let actual = TestError.bar
    assertFailure([Fact("expected", expected), Fact("but was", actual)]) {
      $0.that { throw actual }.doesThrow(expected)
    }
  }

  func test_doesThrow_WithErrorConsumerThrowingError() throws {
    assertFailure([.unexpectedTestError]) {
      // We are testing that an error that occurs in the error consumer is handled properly
      $0.that { throw TestError.foo }
        .doesThrow { _ in throw AssertionConsumerError.testError }
    }
  }

  func test_doesNotThrow_Success() {
    assertNoFailures { $0.that { 1 == 1 }.doesNotThrow() }
  }

  func test_doesNotThrow_CatchesError() {
    let error = TestError.foo
    assertFailure([Fact("expected no error"), Fact("but caught", error)]) {
      $0.that { throw error }.doesNotThrow()
    }
  }

  static var allTests = [
    ("test_doesThrow_WithoutError_Success", test_doesThrow_WithoutError_Success),
    (
      "test_doesThrow_WithoutError_FailToThrowAnError",
      test_doesThrow_WithoutError_FailToThrowAnError
    ),
    ("test_doesThrow_WithConsumer_Success", test_doesThrow_WithConsumer_Success),
    ("test_doesThrow_WithError_Success", test_doesThrow_WithError_Success),
    ("test_doesThrow_WithError_FailToThrowAnError", test_doesThrow_WithError_FailToThrowAnError),
    (
      "test_doesThrow_WithError_FailToThrowErrorWithExpectedType",
      test_doesThrow_WithError_FailToThrowErrorWithExpectedType
    ),
    (
      "test_doesThrow_WithError_FailToThrowExpectedError",
      test_doesThrow_WithError_FailToThrowExpectedError
    ),
    (
      "test_doesThrow_WithErrorConsumerThrowingError",
      test_doesThrow_WithErrorConsumerThrowingError
    ),
    ("test_doesNotThrow_Success", test_doesNotThrow_Success),
    ("test_doesNotThrow_CatchesError", test_doesNotThrow_CatchesError),
  ]
}
