@testable import Truth
import XCTest

class CollectionAssertionsTests: XCTestCase {
  func test_hasCount_Success() {
    let actual = [1, 2, 3]
    let expected = actual.count
    assertNoFailures { $0.that(actual).hasCount(expected) }
  }

  func test_hasCount_Failure() {
    let actual = [1, 2, 3]
    let expected = actual.count + 1
    assertFailure([
      Fact("expected to have count of", expected),
      Fact("but was", actual.count),
    ]) {
      $0.that(actual).hasCount(expected)
    }
  }

  func test_isEmpty_Success() {
    let actual = [Int]()
    assertNoFailures { $0.that(actual).isEmpty() }
  }

  func test_isEmpty_Failure() {
    let actual = [1, 2, 3]
    assertFailure([Fact("expected to be empty"), Fact("but was", actual)]) {
      $0.that(actual).isEmpty()
    }
  }

  func test_isNotEmpty_Success() {
    let actual = [1, 2, 3]
    assertNoFailures { $0.that(actual).isNotEmpty() }
  }

  func test_isNotEmpty_Failure() {
    let actual = [Int]()
    assertFailure([Fact("expected to not be empty")]) { $0.that(actual).isNotEmpty() }
  }

  func test_item_WithValidIndex() {
    let actual = [1, 2, 3]
    var elemSubjectCalled = false
    assertNoFailures {
      $0.that(actual).item(at: 1) {
        elemSubjectCalled = true
        $0.isEqualTo(2)
      }
    }
    XCTAssertTrue(elemSubjectCalled)
  }

  func test_itemAt_WithValidInvalidIndex() {
    let actual = [1, 2, 3]
    let index = 3
    assertFailure([
      Fact("expected index to be valid for the collection"),
      Fact("but was", index),
    ]) {
      $0.that(actual).item(at: index) { _ in
        XCTFail("The element subject should not have been called.")
      }
    }
  }

  func test_itemAt_WithError() throws {
    assertFailure([.unexpectedTestError]) {
      $0.that([1, 2, 3]).item(at: 1) { _ in throw AssertionConsumerError.testError }
    }
  }

  func test_firstItem_WithFirstElement() {
    let actual = [1, 2, 3]
    assertNoFailures { $0.that(actual).firstItem { $0.isEqualTo(1) } }
  }

  func test_firstItem_WithNoFirstElement() {
    let actual = [Int]()
    assertFailure([Fact("expected the first element to exist")]) {
      $0.that(actual).firstItem { $0.isEqualTo(1) }
    }
  }

  func test_firstItem_WithError() throws {
    assertFailure([.unexpectedTestError]) {
      $0.that([1, 2, 3]).firstItem { _ in throw AssertionConsumerError.testError }
    }
  }

  static var allTests = [
    ("test_hasCount_Success", test_hasCount_Success),
    ("test_hasCount_Failure", test_hasCount_Failure),
    ("test_isEmpty_Success", test_isEmpty_Success),
    ("test_isEmpty_Failure", test_isEmpty_Failure),
    ("test_isNotEmpty_Success", test_isNotEmpty_Success),
    ("test_isNotEmpty_Failure", test_isNotEmpty_Failure),
    ("test_item_WithValidIndex", test_item_WithValidIndex),
    ("test_itemAt_WithValidInvalidIndex", test_itemAt_WithValidInvalidIndex),
    ("test_itemAt_WithError", test_itemAt_WithError),
    ("test_firstItem_WithFirstElement", test_firstItem_WithFirstElement),
    ("test_firstItem_WithNoFirstElement", test_firstItem_WithNoFirstElement),
    ("test_firstItem_WithError", test_firstItem_WithError),
  ]
}
