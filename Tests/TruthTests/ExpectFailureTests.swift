import XCTest

class ExpectFailureTests: XCTestCase {
    func test_assertionFailureOccurs() {
        let failures = expectFailure { whenTesting in
            whenTesting.that(123).isEqualTo(321)
        }
        XCTAssertEqual(failures.count, 1)
        XCTAssertTrue(failures[0].message.contains("expected 321, but was 123"))
    }

    func test_assertionFailureDoesNotOccur() {
        let failures = expectFailure { whenTesting in
            whenTesting.that(123).isEqualTo(123)
        }
        XCTAssertEqual(failures.count, 0)
    }
}
