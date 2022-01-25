#if os(Linux)
  import XCTest

  XCTMain([
    testCase(DataTests.allTests),
    testCase(StaticStringTests.allTests),
    testCase(StringRangeSubscriptExtTests.allTests),
    testCase(StringRandomTests.allTests),
  ])
#endif
