@testable import DateUtils
import Truth
import XCTest

class DateISOTests: XCTestCase {
    func test_toAndFromISOString() {
        let dateString = "2020-07-21T16:56:27Z"
        let date = dateString.toDate(.iso)!
        let result = date.toString(.iso)
        assertThat(result).isEqualTo(dateString)
    }

    func test_isoWithMillis() {
        let dateString = "2020-09-12T17:06:36.935Z"
        let date = dateString.toDate(.isoWithMillis)
        assertThat(date).isNotNil {
            let result = $0.actual.toString(.isoWithMillis)
            $0.that(result).isEqualTo(dateString)
        }
    }

    func test_tryToDate_Success() {
        let dateString = "2020-09-12T17:06:36.935Z"
        assertThat {
            let date = try dateString.tryToDate(.isoWithMillis)
            let result = date.toString(.isoWithMillis)
            self.assertThat(result).isEqualTo(dateString)
        }.doesNotThrow()
    }

    func test_tryToDate_Fail() {
        let dateString = "not a date"
        assertThat {
            _ = try dateString.tryToDate(.isoWithMillis)
        }.doesThrow(DateStringFormatError.invalidFormat(invalidValue: dateString))
    }

    func test_normalized() {
        let format = DateStringFormat.isoWithMillis
        let date = Date()
        assertThat {
            let expected = try date.toString(format).tryToDate(format)
            let result = date.normalized(for: format)
            self.assertThat(result).isEqualTo(expected)
        }.doesNotThrow()
    }

    func test_toAndFromISODateString() {
        let dateString = "2020-09-12"
        let date = dateString.toDate(.isoDate)
        assertThat(date).isNotNil {
            let result = $0.actual.toString(.isoDate)
            $0.that(result).isEqualTo(dateString)
        }
    }
}
