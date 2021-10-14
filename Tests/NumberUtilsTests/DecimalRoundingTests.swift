import Truth
import XCTest

class DecimalRoundingTests: XCTestCase {
    func test_roundTo() {
        let decimal = "123.456".decimalValue
        assertThat(decimal.roundTo(decimalPlaces: 3)).isEqualTo("123.456")
        assertThat(decimal.roundTo(decimalPlaces: 2)).isEqualTo("123.46")
        assertThat(decimal.roundTo(decimalPlaces: 1)).isEqualTo("123.5")
        assertThat(decimal.roundTo(decimalPlaces: 0)).isEqualTo("123")

        assertThat(decimal.roundTo(decimalPlaces: 2, roundingMode: .down)).isEqualTo("123.45")
    }
}
