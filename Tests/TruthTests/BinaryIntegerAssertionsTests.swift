import Truth
import XCTest

class BinaryIntegerAssertionsTests: XCTestCase {
    func test_isLessThan_Success() {
        assertNoFailures { $0.that(1).isLessThan(2) }
    }

    func test_isLessThan_Failure() {
        assertFailure([Fact("expected to be less than", 2), Fact("but was", 3)]) {
            $0.that(3).isLessThan(2)
        }
    }

    func test_isGreaterThan_Success() {
        assertNoFailures { $0.that(3).isGreaterThan(2) }
    }

    func test_isGreaterThan_Failure() {
        assertFailure([Fact("expected to be greater than", 2), Fact("but was", 1)]) {
            $0.that(1).isGreaterThan(2)
        }
    }
}
