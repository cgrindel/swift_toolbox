@testable import OptionalUtils
import XCTest

class OptionalProtocolTests: XCTestCase {
    func test_isSomeAndIsNone() {
        var val: Int?
        XCTAssertTrue(val.isNone())
        XCTAssertFalse(val.isSome())
        val = 123
        XCTAssertTrue(val.isSome())
        XCTAssertFalse(val.isNone())
    }
}
