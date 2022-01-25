import Truth
import XCTest

protocol Hello {}

class TypeAssertionsTests: XCTestCase {
  struct Foo: Hello, Equatable {}
  struct Bar: Hello, Equatable {}

  func test_isA_Success() {
    let foo = Foo()
    let actual: Hello = foo
    var elemSubjectCalled = false
    assertNoFailures {
      $0.that(actual).isA(Foo.self) {
        elemSubjectCalled = true
        $0.isEqualTo(foo)
      }
    }
    XCTAssertTrue(elemSubjectCalled)
  }

  func test_isA_Failure() {
    let bar = Bar()
    let actual: Hello = bar
    assertFailure([
      Fact("expected to be of type", Foo.self),
      Fact("but was", String(reflecting: actual)),
    ]) {
      $0.that(actual).isA(Foo.self) { _ in
        XCTFail("The element subject should not have been called.")
      }
    }
  }

  func test_isA_WithError() throws {
    assertFailure([.unexpectedTestError]) {
      $0.that(Foo()).isA(Foo.self) { _ in throw AssertionConsumerError.testError }
    }
  }

  static var allTests = [
    ("test_isA_Success", test_isA_Success),
    ("test_isA_Failure", test_isA_Failure),
    ("test_isA_WithError", test_isA_WithError),
  ]
}
