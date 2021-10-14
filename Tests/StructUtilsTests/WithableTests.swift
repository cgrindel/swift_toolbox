@testable import StructUtils
import Truth
import XCTest

class WithableTests: XCTestCase {
    struct TestStruct: Withable {
        var name: String = ""
        var number: Int = 0
    }

    func test_with() throws {
        let result = TestStruct.with {
            $0.name = "foo"
            $0.number = 123
        }
        assertThat(result)
            .key(\.name) { $0.isEqualTo("foo") }
            .key(\.number) { $0.isEqualTo(123) }
    }
}
