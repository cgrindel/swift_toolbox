import Foundation

// MARK: - TimeInterval Creation Helpers

public extension BinaryInteger {
  var milliseconds: TimeInterval {
    return TimeInterval(self) / 1000
  }

  var millisecond: TimeInterval {
    return milliseconds
  }

  var seconds: TimeInterval {
    return TimeInterval(self)
  }

  var second: TimeInterval {
    return seconds
  }

  var minutes: TimeInterval {
    return TimeInterval(self) * 60
  }

  var minute: TimeInterval {
    return minutes
  }

  var hours: TimeInterval {
    return (self * 60).minutes
  }

  var hour: TimeInterval {
    return hours
  }

  var days: TimeInterval {
    return (self * 24).hours
  }

  var day: TimeInterval {
    return days
  }
}
