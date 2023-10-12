@testable import Truth
import XCTest

class AssertThatTests: XCTestCase {
  let target = "foo"

  func test_chuckDebug() throws {
    fail("IMPLEMENT ME!")
    // XCTFail("IMPLEMENT ME!")
  }

  // func test_assertThat_ForTargets() {
  //   // DEBUG BEGIN
  //   fputs("*** CHUCK test_assertThat_ForTargets\n", stderr)
  //   // DEBUG END
  //   let result = assertThat(target)
  //   XCTAssertEqual(result.actual, target)
  // }

  // func test_assertThat_WithCustomMessage() {
  //   // DEBUG BEGIN
  //   fputs("*** CHUCK test_assertThat_WithCustomMessage\n", stderr)
  //   // DEBUG END
  //   let message = "Custom message."
  //   var result = assertThat(target, with: message)
  //   XCTAssertEqual(result.actual, target)
  //   XCTAssertEqual(result.customMessages.map { $0() }, [message])

  //   result = assertThat(target, with: message) {
  //     XCTAssertEqual($0.actual, target)
  //     XCTAssertEqual($0.customMessages.map { $0() }, [message])
  //   }
  //   XCTAssertEqual(result.actual, target)
  //   XCTAssertEqual(result.customMessages.map { $0() }, [message])
  // }

  // func test_assertThat_WithConsumer() {
  //   // DEBUG BEGIN
  //   fputs("*** CHUCK test_assertThat_WithConsumer\n", stderr)
  //   // DEBUG END
  //   let result = assertThat(target) {
  //     XCTAssertEqual($0.actual, target)
  //   }
  //   XCTAssertEqual(result.actual, target)
  // }

  // func test_assertThat_ForThrows() {
  //   // DEBUG BEGIN
  //   fputs("*** CHUCK test_assertThat_ForThrows\n", stderr)
  //   // DEBUG END
  //   let result = assertThat { 1 == 1 }
  //   XCTAssertNotNil(result)
  // }

  // static var allTests = [
  //   ("test_assertThat_ForTargets", test_assertThat_ForTargets),
  //   ("test_assertThat_WithCustomMessage", test_assertThat_WithCustomMessage),
  //   ("test_assertThat_WithConsumer", test_assertThat_WithConsumer),
  //   ("test_assertThat_ForThrows", test_assertThat_ForThrows),
  // ]
}
