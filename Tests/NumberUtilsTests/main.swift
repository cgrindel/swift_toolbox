#if os(Linux)
  import XCTest

  XCTMain([
    testCase(DecimalCSVFormatTests.allTests),
    testCase(DecimalRandomTests.allTests),
    testCase(DecimalRoundingTests.allTests),
    testCase(DecimalToDoubleTests.allTests),
    testCase(DecimalToIntTests.allTests),
    testCase(DoubleToDecimalTests.allTests),
    testCase(LengthConversionsTests.allTests),
  ])
#endif
