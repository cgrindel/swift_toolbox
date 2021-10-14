@testable import NumberUtils
import Truth
import XCTest

class DecimalToIntTests: XCTestCase {
    func test_intValue_WithCondition_Expectation() {
        assertThat("0.123".decimalValue.intValue).isEqualTo(0)
        assertThat("123.456".decimalValue.intValue).isEqualTo(123)
        assertThat("-123.456".decimalValue.intValue).isEqualTo(-123)
    }
}
