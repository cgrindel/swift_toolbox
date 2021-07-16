import Truth
import XCTest

class FailureAssertionsTests: XCTestCase {
  func test_hasMessageThat_ReturnsSubjectForMessage() {
    let message = "foo msg"
    let failure = Failure(message: message, file: "foo.bar", line: 123)
    assertThat(failure).hasMessageThat().isEqualTo(message)
  }
}
