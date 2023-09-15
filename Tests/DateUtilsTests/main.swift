#if os(Linux)
  import XCTest

  XCTMain([
    testCase(DateISOTests.allTests),
    testCase(FloatingPointTimeIntervalHelpersTests.allTests),
    testCase(TimeIntervalDateArithmeticTests.allTests),
    testCase(TimeIntervalHelpersTests.allTests),
  ])
#endif
