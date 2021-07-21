import Foundation

// MARK: - TimeInterval Creation Helpers

extension BinaryInteger {
  public var milliseconds: TimeInterval {
    return TimeInterval(self) / 1000
  }

  public var millisecond: TimeInterval {
    return milliseconds
  }

  public var seconds: TimeInterval {
    return TimeInterval(self)
  }

  public var second: TimeInterval {
    return seconds
  }

  public var minutes: TimeInterval {
    return TimeInterval(self) * 60
  }

  public var minute: TimeInterval {
    return minutes
  }

  public var hours: TimeInterval {
    return (self * 60).minutes
  }

  public var hour: TimeInterval {
    return hours
  }

  public var days: TimeInterval {
    return (self * 24).hours
  }

  public var day: TimeInterval {
    return days
  }
}
