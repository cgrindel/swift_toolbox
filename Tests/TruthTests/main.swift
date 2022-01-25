#if os(Linux)
  import XCTest

  XCTMain([
    testCase(AssertThatTests.allTests),
    testCase(BidirectionalCollectionAssertionsTests.allTests),
    testCase(BinaryIntegerAssertionsTests.allTests),
    testCase(BoolAssertionsTests.allTests),
    testCase(CollectionAssertionsTests.allTests),
    testCase(ComparableAssertionsTests.allTests),
    testCase(DecimalAssertionsTests.allTests),
  ])
#endif
