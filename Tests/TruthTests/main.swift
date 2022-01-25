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
    testCase(DictionaryAssertionsTests.allTests),
    testCase(EquatableAssertionsTests.allTests),
    testCase(ExpectFailureTests.allTests),
    testCase(FailureAssertionsTests.allTests),
    testCase(FailureCaptureTests.allTests),
    testCase(FailureTests.allTests),
    testCase(FailureCaptureInTestCaseTests.allTests),
    testCase(FactTests.allTests),
    testCase(FailWithFactsTests.allTests),
    testCase(FloatingPointAssertionsTests.allTests),
    testCase(KeySubjectTests.allTests),
    testCase(NilAssertionsTests.allTests),
    testCase(ResultAssertionsTests.allTests),
    testCase(SequenceAssertionsTests.allTests),
    testCase(StringAssertionsTests.allTests),
    testCase(SubjectTests.allTests),
    testCase(ThrowsAssertionsTests.allTests),
    testCase(TypeAssertionsTests.allTests),
  ])
#endif
