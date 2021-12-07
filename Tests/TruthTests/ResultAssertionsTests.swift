import Truth
import XCTest

class ResultAssertionsTests: XCTestCase {
  struct TestError: Error, Equatable {}

  let successValue = 1234
  lazy var success: Result<Int, TestError> = .success(successValue)

  let testError = TestError()
  lazy var failure: Result<Int, TestError> = .failure(testError)

  func test_isSuccess_WithoutClosure_Success() {
    assertNoFailures { $0.that(success).isSuccess() }
  }

  func test_isSuccess_WithoutClosure_Fail() {
    assertFailure([Fact("expected success"), Fact("but was failure with", testError)]) {
      $0.that(failure).isSuccess()
    }
  }

  func test_isSuccess_WithClosure_Success() {
    var closureCalled = false
    assertNoFailures { $0.that(success).isSuccess {
      closureCalled = true
      $0.isEqualTo(self.successValue)
    } }
    assertThat(closureCalled).isTrue()
  }

  func test_isSuccess_WithClosure_Fail() {
    assertFailure([Fact("expected success"), Fact("but was failure with", testError)]) {
      $0.that(failure).isSuccess { (_: Subject<Int>) in
        self.fail("Closure should not have been called.")
      }
    }
  }

  func test_isSuccess_WithError() throws {
    assertFailure([.unexpectedTestError]) {
      $0.that(self.success).isSuccess { _ in throw AssertionConsumerError.testError }
    }
  }

  func test_isFailure_WithoutClosure_Success() {
    assertNoFailures { $0.that(failure).isFailure() }
  }

  func test_isFailure_WithoutClosure_Fail() {
    assertFailure([Fact("expected failure"), Fact("but was success with", successValue)]) {
      $0.that(success).isFailure()
    }
  }

  func test_isFailure_WithClosure_Success() {
    var closureCalled = false
    assertNoFailures { $0.that(failure).isFailure {
      closureCalled = true
      $0.isEqualTo(self.testError)
    } }
    assertThat(closureCalled).isTrue()
  }

  func test_isFailure_WithClosure_Fail() {
    assertFailure([Fact("expected failure"), Fact("but was success with", successValue)]) {
      $0.that(success).isFailure { (_: Subject<TestError>) in
        self.fail("Closure should not have been called.")
      }
    }
  }

  func test_isFailure_WithError() throws {
    assertFailure([.unexpectedTestError]) {
      $0.that(self.failure).isFailure { _ in throw AssertionConsumerError.testError }
    }
  }
}
