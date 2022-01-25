@testable import DateUtils
import Truth
import XCTest

class TimeIntervalHelpersTests: XCTestCase {
  func test_BinaryIntegerExtensions() {
    assertThat(1.millisecond).isEqualTo(0.001)
    assertThat(500.milliseconds).isEqualTo(0.500)
    assertThat(1.second).isEqualTo(1.0)
    assertThat(500.seconds).isEqualTo(500.0)
    assertThat(1.minute).isEqualTo(60.0)
    assertThat(500.minutes).isEqualTo(500 * 60)
    assertThat(1.hour).isEqualTo(60 * 60)
    assertThat(500.hours).isEqualTo(500 * 60 * 60)
    assertThat(1.day).isEqualTo(24 * 60 * 60)
    assertThat(500.days).isEqualTo(500 * 24 * 60 * 60)
    assertThat(-1.minute).isEqualTo(-60.0)
  }

  static var allTests = [
    ("test_BinaryIntegerExtensions", test_BinaryIntegerExtensions),
  ]
}
