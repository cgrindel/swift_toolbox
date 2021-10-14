import Foundation
@testable import Truth
import XCTest

class FloatingPointAssertionsTests: XCTestCase {
    // MARK: - isCloseTo

    func test_isCloseTo_plusOrMinus_Success() {
        assertNoFailures {
            $0.that(1.1).isCloseTo(1, plusOrMinus: 0.1)
        }
        assertNoFailures {
            $0.that(1.1).isCloseTo(1, plusOrMinus: -0.1)
        }
    }

    func test_isCloseTo_plusOrMinus_Fails() {
        assertFailure {
            $0.that(1.2).isCloseTo(1, plusOrMinus: 0.1)
        }
    }

    func test_isCloseTo_within_Success() {
        assertNoFailures {
            $0.that(1.1).isCloseTo(1, within: 0.1)
        }
    }

    func test_isCloseTo_within_Fails() {
        assertFailure {
            $0.that(1.2).isCloseTo(1, within: 0.1)
        }
    }

    // MARK: - isLessThan / isGreaterThan

    func test_isLessThan_Success() {
        assertNoFailures { $0.that(1.0).isLessThan(2.0) }
    }

    func test_isLessThan_Failure() {
        assertFailure([Fact("expected to be less than", 2.0), Fact("but was", 3.0)]) {
            $0.that(3.0).isLessThan(2.0)
        }
    }

    func test_isGreaterThan_Success() {
        assertNoFailures { $0.that(3.0).isGreaterThan(2.0) }
    }

    func test_isGreaterThan_Failure() {
        assertFailure([Fact("expected to be greater than", 2.0), Fact("but was", 1.0)]) {
            $0.that(1.0).isGreaterThan(2.0)
        }
    }
}
