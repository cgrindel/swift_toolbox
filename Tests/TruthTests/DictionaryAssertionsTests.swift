@testable import Truth
import XCTest

class DictionaryAssertionsTests: XCTestCase {
  func test_hasKey_WhenKeyExists() {
    let dict = ["foo": 123, "bar": 321]
    assertNoFailures {
      $0.that(dict)
        .hasKey("foo") { $0.isEqualTo(123) }
        .hasKey("bar") { $0.isEqualTo(321) }
    }
  }

  func test_hasKey_WhenKeyDoesNotExist() {
    let dict = ["foo": 123, "bar": 321]
    assertFailure([Fact("expected key to exist")]) {
      $0.that(dict).hasKey("doesnotexist") { _ in self.fail("Should not be called.") }
    }
  }

  func test_hasKey_WhenKeyExistsAndValueCanBeNil() {
    let dict: [String: Int?] = ["foo": 123, "bar": nil]
    assertNoFailures {
      $0.that(dict)
        .hasKey("foo") { $0.isEqualTo(123) }
        .hasKey("bar") { $0.isNil() }
    }
  }

  func test_hasKey_WhenKeyDoesNotExistAndValueCanBeNil() {
    let dict: [String: Int?] = ["foo": 123, "bar": nil]
    assertFailure([Fact("expected key to exist")]) {
      $0.that(dict).hasKey("doesnotexist") { _ in self.fail("Should not be called.") }
    }
  }

  func test_hasKey_WithError() throws {
    let dict = ["foo": 123, "bar": 321]
    assertFailure([.unexpectedTestError]) {
      $0.that(dict).hasKey("foo") { _ in throw AssertionConsumerError.testError }
    }
  }

  func test_doesNotHaveKey_WhenKeyDoesNotExist() {
    let dict = ["foo": 123, "bar": 321]
    assertNoFailures {
      $0.that(dict).doesNotHaveKey("doesnotexist")
    }
  }

  func test_doesNotHaveKey_WhenKeyDoesExist() {
    let dict = ["foo": 123, "bar": 321]
    assertFailure([Fact("expected key to not exist")]) {
      $0.that(dict).doesNotHaveKey("foo")
    }
  }
}
