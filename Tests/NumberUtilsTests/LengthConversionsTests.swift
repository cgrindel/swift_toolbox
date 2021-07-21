@testable import NumberUtils
import Truth
import XCTest

class LengthConversionsTests: XCTestCase {
  func test_Meters_Kilometers() {
    let meters = Meter(1852)
    let kilometers = meters.metersToKilometers
    assertThat(kilometers).isEqualTo("1.852")
    assertThat(kilometers.kilometersToMeters).isEqualTo(meters)
  }

  func do_RadiansConversion_test(degrees: Degree, expectedRadians: Radians) {
    assertThat(degrees.degreesToRadians).isEqualTo(expectedRadians)
    assertThat(expectedRadians.radiansToDegrees).isEqualTo(degrees)
  }

  func test_Degrees_Radians() {
    assertThat(0.0.degreesToRadians).isEqualTo(0.0)
    assertThat(60.0.degreesToRadians).isEqualTo((1 / 3) * Double.pi)
    assertThat(150.0.degreesToRadians).isEqualTo((5 / 6) * Double.pi)

    do_RadiansConversion_test(degrees: "0.0", expectedRadians: 0.0)
    do_RadiansConversion_test(degrees: "60.0", expectedRadians: (1 / 3) * Double.pi)
    do_RadiansConversion_test(degrees: "150.0", expectedRadians: (5 / 6) * Double.pi)
  }

  func test_Feet_Meters() {
    let meter = Meter(1)
    let feet = meter.metersToFeet
    assertThat(feet).isEqualTo(LengthConversions.feetPerMeter)
    assertThat(feet.feetToMeters).isEqualTo(meter)
  }

  func test_Feet_Kilometers() {
    let kilometer = Kilometers(1)
    let feet = kilometer.kilometersToFeet
    assertThat(feet).isEqualTo(LengthConversions.feetPerMeter * 1000)
    assertThat(feet.feetToKilometers).isEqualTo(kilometer)
  }
}
