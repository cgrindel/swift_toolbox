@testable import Truth
import XCTest

class SubjectTests: XCTestCase {
    func test_chainingOfAssertions_ProceedsIfSuccess() {
        // The isNotNil succeeds, proceeding to the isEqualTo.
        let failures = expectFailure { $0.that(123).isA(Int.self).isEqualTo(456) }
        guard failures.count == 1 else {
            XCTFail("Expected 1 failure, but found \(failures)")
            return
        }
    }

    func test_chainingOfAssertions_HaltsIfFailure() {
        // The isNil failes. The isEqualTo assertion should not execute.
        let failures = expectFailure { $0.that(123).isA(String.self).isEqualTo(456) }
        guard failures.count == 1 else {
            XCTFail("Expected 1 failure, but found \(failures)")
            return
        }
    }

    func test_withMessage() {
        let customMessage = "Custom message."
        let failures = expectFailure { $0.that(123).withMessage(customMessage).isA(String.self) }
        guard failures.count == 1, let failure = failures.first else {
            XCTFail("Expected 1 failure, but found \(failures)")
            return
        }
        XCTAssertTrue(failure.message.contains(customMessage))
    }
}
