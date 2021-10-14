import Truth
import XCTest

class KeySubjectTests: XCTestCase {
    struct Foo {
        var name = "Hello"
    }

    func test_key() {
        assertThat(Foo()).key(\.name) { $0.isEqualTo("Hello") }
    }

    func test_key_WithError() throws {
        assertFailure([.unexpectedTestError]) {
            $0.that(Foo()).key(\.name) { _ in throw AssertionConsumerError.testError }
        }
    }

    // func test_key_WithKeyName() {
    //   let failures = expectFailure { $0.that(Foo()).key(\.name, "name") { $0.isEqualTo("Foo") }}
    //   guard failures.count == 1, let failure = failures.first else {
    //     XCTFail("Expected 1 failure, but found \(failures)")
    //     return
    //   }
    //   XCTAssertTrue(failure.message.contains("key: name"))
    // }
}
