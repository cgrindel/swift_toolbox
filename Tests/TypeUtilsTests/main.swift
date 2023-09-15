#if os(Linux)
  import XCTest

  XCTMain([
    testCase(SequenceExtensionsTests.allTests),
    testCase(TypeableTests.allTests),
  ])
#endif
