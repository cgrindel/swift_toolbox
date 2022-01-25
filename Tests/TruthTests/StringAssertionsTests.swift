import Truth
import XCTest

class StringAssertionsTests: XCTestCase {
  let actual = "hello foo bar"
  func test_contains_Success() {
    assertNoFailures { $0.that(actual).contains("foo") }
  }

  func test_contains_Fail() {
    let substring = "does not exist"
    assertFailure([Fact("expected to contain", substring)]) {
      $0.that(actual).contains(substring)
    }
  }

  func test_matches_Success() throws {
    assertNoFailures { $0.that(actual).matches(#"\bf.o\b"#) }
  }

  func test_matches_Fails() throws {
    let regex = #"\bf[ab]o\b"#
    assertFailure([
      Fact("expected to match", regex),
      Fact("BEGIN ACTUAL:\n", actual),
      Fact("END ACTUAL"),
    ]) { $0.that(actual).matches(regex) }
  }

  static var allTests = [
    ("test_contains_Success", test_contains_Success),
    ("test_contains_Fail", test_contains_Fail),
    ("test_matches_Success", test_matches_Success),
    ("test_matches_Fails", test_matches_Fails),
  ]
}
