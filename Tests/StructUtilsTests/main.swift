#if os(Linux)
  import XCTest

  XCTMain([
    testCase(CopyWithableTests.allTests),
    testCase(WithableTests.allTests),
  ])
#endif
