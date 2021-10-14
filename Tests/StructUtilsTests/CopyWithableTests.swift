@testable import StructUtils
import Truth
import XCTest

class CopyWithableTests: XCTestCase {
    struct TestStruct: CopyWithable {
        var name: String = ""
        var number: Int = 0

        init(
            name: String,
            number: Int
        ) {
            self.name = name
            self.number = number
        }
    }

    func test_copyWith() throws {
        let original = TestStruct(name: "foo", number: 55)
        let copy = original.copyWith { $0.name = "bar" }
        assertThat(copy)
            .key(\.name) { $0.isEqualTo("bar") }
            .key(\.number) { $0.isEqualTo(55) }
    }
}
