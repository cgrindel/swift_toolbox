@testable import Truth
import XCTest

class AnyObectAssertionsTests: XCTestCase {
  class Foo {
    var name: String

    init(name: String) {
      self.name = name
    }
  }

  func test_isIdenticalTo_WithIdenticalObjs_Succeeds() throws {
    let actual = Foo(name: "Jim")
    let expected = actual
    assertNoFailures { $0.that(actual).isIdenticalTo(expected) }
  }

  func test_isIdenticalTo_WithDifferentObjs_Fails() throws {
    let actual = Foo(name: "Jim")
    let expected = Foo(name: "Jim")
    assertFailure([Fact("expected", expected), Fact("to be identical to", actual)]) {
      $0.that(actual).isIdenticalTo(expected)
    }
  }
}
