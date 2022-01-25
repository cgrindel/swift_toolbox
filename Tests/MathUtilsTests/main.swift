#if os(Linux)
  import XCTest

  XCTMain([
    testCase(DecimalSequenceHelpersTests.allTests),
    testCase(LinearModelTests.allTests),
    testCase(OrderedPairProtocolTests.allTests),
    testCase(OrderedPairTests.allTests),
  ])
#endif
