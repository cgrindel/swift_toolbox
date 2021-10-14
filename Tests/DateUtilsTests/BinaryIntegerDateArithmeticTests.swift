@testable import DateUtils
import Truth
import XCTest

class TimeIntervalDateArithmeticTests: XCTestCase {
  func test_DateArithmeticFromADate() {
    let date = Date()

    assertThat(1.minute.from(date)).isEqualTo(date.addingTimeInterval(1.minute))
    assertThat(1.minute.after(date)).isEqualTo(1.minute.from(date))
    assertThat(1.minute.fromNow(date)).isEqualTo(date.addingTimeInterval(1.minute))
    assertThat { 1.minute.fromNow() }.doesNotThrow()

    assertThat(1.minute.before(date)).isEqualTo(date.addingTimeInterval(-1.minute))
    assertThat(1.minute.ago(date)).isEqualTo(date.addingTimeInterval(-1.minute))
    assertThat { 1.minute.ago() }.doesNotThrow()
  }
}
