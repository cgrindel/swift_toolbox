import Foundation

// MARK: - Conversion Constants

enum LengthConversions {
  // pi radians = 180 degrees
  public static var radiansPerDegree = Double.pi / 180
  public static var degreesPerRadian = 1 / radiansPerDegree
  public static var metersPerKilometer: Meter = 1000
  public static var feetPerMeter: Feet = "3.280839895"
}

// MARK: - Meter-Kilometer

public extension Meter {
  var metersToKilometers: Kilometers {
    return self / LengthConversions.metersPerKilometer
  }
}

public extension Kilometers {
  var kilometersToMeters: Meter {
    return self * LengthConversions.metersPerKilometer
  }
}

// MARK: - Degree-Radian

public extension Double {
  // Inspired by:
  //   https://www.hackingwithswift.com/example-code/language/how-to-convert-degrees-to-radians
  //   https://www.varsitytutors.com/hotmath/hotmath_help/topics/degree-to-radian-measure

  /// Convert degrees to radians.
  var degreesToRadians: Radians {
    return self * LengthConversions.radiansPerDegree
  }

  /// Convert radians to degrees
  var radiansToDegrees: Degree {
    return (self * LengthConversions.degreesPerRadian)
      .decimalValue
      // Selected 10 decimal places as that seems to be the max number of decimal places to which
      // most lat/lng pairs are listed.
      .roundTo(decimalPlaces: 10)
  }
}

public extension Degree {
  var degreesToRadians: Radians {
    return doubleValue.degreesToRadians
  }
}

// MARK: - Feet-Kilometers

public extension Feet {
  var feetToMeters: Meter {
    return self / LengthConversions.feetPerMeter
  }

  var feetToKilometers: Kilometers {
    return feetToMeters.metersToKilometers
  }
}

public extension Meter {
  var metersToFeet: Feet {
    return self * LengthConversions.feetPerMeter
  }
}

public extension Kilometers {
  var kilometersToFeet: Feet {
    return kilometersToMeters.metersToFeet
  }
}
