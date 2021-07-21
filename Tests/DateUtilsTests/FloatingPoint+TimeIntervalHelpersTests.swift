@testable import DateUtils
import Truth
import XCTest

class FloatingPointTimeIntervalHelpersTests: XCTestCase {
  func test_extensions() {
    assertThat(Double(1).millisecond).isEqualTo(0.001)
    assertThat(Double(500).milliseconds).isEqualTo(0.500)
    assertThat(Double(1).second).isEqualTo(1.0)
    assertThat(Double(500).seconds).isEqualTo(500.0)
    assertThat(Double(1).minute).isEqualTo(60.0)
    assertThat(Double(500).minutes).isEqualTo(500 * 60)
    assertThat(Double(1).hour).isEqualTo(60 * 60)
    assertThat(Double(500).hours).isEqualTo(500 * 60 * 60)
    assertThat(Double(1).day).isEqualTo(24 * 60 * 60)
    assertThat(Double(500).days).isEqualTo(500 * 24 * 60 * 60)
    assertThat(Double(-1).minute).isEqualTo(-60.0)
  }
}
