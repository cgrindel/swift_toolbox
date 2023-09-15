#if os(Linux)
  import XCTest

  XCTMain([
    testCase(IsNotNilTests.allTests),
    testCase(OptionalProtocolTests.allTests),
  ])
#endif
