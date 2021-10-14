@testable import NumberUtils
import Truth
import XCTest

class DecimalCSVFormatTests: XCTestCase {
    func test_asDecimal() throws {
        let decimal: Decimal = 1.2
        let decimalString = decimal.csvValue
        let result = decimalString.asDecimal
        assertThat(result).isEqualTo(decimal)
    }

    func test_csvValueAndDecimalValue_RoundTrip() {
        let decimal: Decimal = 1.2
        let decimalString = decimal.csvValue
        let result = decimalString.decimalValue
        assertThat(result).isEqualTo(decimal)
    }

    func test_decimalValue_WithBadString() {
        assertThat("".decimalValue).isEqualTo(Decimal.nan)
        assertThat("hello".decimalValue).isEqualTo(Decimal.nan)
    }

    func test_decimalFromLiteralString() {
        // let decimal: Decimal = "1.2"
        // The value 224.149 if specified as a Double will be 224.1489999999999488. We are testing that
        // this is avoided.
        let decimal: Decimal = "224.149"
        assertThat(decimal.csvValue).isEqualTo("224.149")
    }

    func test_decimalValue_FromSubstring() {
        let values = "123.45 678.9".split(separator: " ")
        assertThat(values[0]).isEqualTo("123.45")
        assertThat(values[1]).isEqualTo("678.9")
    }

    struct Foo: Equatable, Codable {
        let decimal: Decimal
    }

    func test_codability_OfDecimal() throws {
        let foo = Foo(decimal: Double.random(in: -90 ... 90).decimalValue.roundTo(decimalPlaces: 10))
        let data = try JSONEncoder().encode(foo)
        let result = try JSONDecoder().decode(Foo.self, from: data)
        assertThat(result).isEqualTo(foo)
    }
}
