@testable import Truth
import XCTest

class FailureCaptureTests: XCTestCase {
  func test_fail() {
    let failureCapture = FailureCapture()
    let expectedFailures = [
      EquatableFailure(message: "foo msg", file: "foo", line: 123),
      EquatableFailure(message: "bar msg", file: "bar", line: 321),
    ]
    assertThat(failureCapture.capturedFailures).isEmpty()
    failureCapture.fail("foo msg", file: "foo", line: 123)
    failureCapture.fail("bar msg", file: "bar", line: 321)
    assertThat(failureCapture.capturedFailures.asEquatable()).isEqualTo(expectedFailures)
  }

  func test_failWith_() {
    let failureCapture = FailureCapture()
    let failure = Failure(message: "foo msg", file: "foo", line: 123)
    failureCapture.fail(with: failure)
    assertThat(failureCapture.capturedFailures.asEquatable()).isEqualTo([failure.asEquatable()])
  }
}

class FailureTests: XCTestCase {
  func test_Failure_init() {
    let result = Failure(message: "foo msg", file: "foo.bar", line: 123)
    XCTAssertEqual(result.message, "foo msg")
    XCTAssertEqual("\(result.file)", "foo.bar")
    XCTAssertEqual(result.line, 123)
  }

  func test_EquatableFailure_init() {
    let eq0 = EquatableFailure(message: "foo msg", file: "foo.bar", line: 123)
    let eq1 = EquatableFailure(message: "foo msg", file: "foo.bar", line: 123)
    XCTAssertEqual(eq0, eq1)
  }

  func test_Failure_asEquatable() {
    let failure = Failure(message: "foo msg", file: "foo.bar", line: 123)
    let expected = EquatableFailure(message: "foo msg", file: "foo.bar", line: 123)
    XCTAssertEqual(failure.asEquatable(), expected)
  }

  func test_FailureCollection_asEquatable() {
    let failures = [
      Failure(message: "foo msg", file: "foo.bar", line: 123),
      Failure(message: "foo msg", file: "foo.bar", line: 321),
    ]
    let expected = [
      EquatableFailure(message: "foo msg", file: "foo.bar", line: 123),
      EquatableFailure(message: "foo msg", file: "foo.bar", line: 321),
    ]
    XCTAssertEqual(failures.asEquatable(), expected)
  }
}

class FailureCaptureInTestCaseTests: XCTestCase {
  func test() {
    let origFailureStrategy = failureStrategy
    let failureCapture = FailureCapture()

    failureStrategy = failureCapture
    defer { failureStrategy = origFailureStrategy }
    fail("This should be captured", file: "foo", line: 123)

    XCTAssertEqual(
      failureCapture.capturedFailures.asEquatable(),
      [EquatableFailure(message: "This should be captured", file: "foo", line: 123)]
    )
  }
}
