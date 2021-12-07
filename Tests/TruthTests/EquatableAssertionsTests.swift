@testable import Truth
import XCTest

class EquatableAssertionsTests: XCTestCase {
  class Foo: Equatable {
    var intProperty: Int = 0
    var skipIntProperty = false

    var optIntProperty: Int?
    var skipOptIntProperty = false

    static var defaultBoolValue = false
    lazy var boolProperty: Bool = Self.defaultBoolValue
    var skipBoolProperty = false

    static var defaultStrValue = ""
    lazy var strProperty: String = Self.defaultStrValue
    var skipStrProperty = false

    var optStrProperty: String?
    var skipOptStrProperty = false

    static let defaultDateValue = Date()
    lazy var dateProperty: Date = Self.defaultDateValue
    var skipDateProperty = false

    var optDateProperty: Date?
    var skipOptDateProperty = false

    static let defaultUUIDValue = UUID()
    lazy var uuidProperty: UUID = Self.defaultUUIDValue
    var skipUUIDProperty = false

    var optUUIDProperty: UUID?
    var skipOptUUIDProperty = false

    init() {}

    /// Determine if the two instances are equal.
    static func == (lhs: Foo, rhs: Foo) -> Bool {
      return true &&
        (
          lhs.skipIntProperty || rhs.skipOptIntProperty || lhs.intProperty == rhs
            .intProperty
        ) &&
        (
          lhs.skipOptIntProperty || rhs.skipOptIntProperty ||
            lhs.optIntProperty == rhs.optIntProperty
        ) &&
        (
          lhs.skipBoolProperty || rhs.skipBoolProperty || lhs.boolProperty == rhs
            .boolProperty
        ) &&
        (
          lhs.skipStrProperty || rhs.skipStrProperty || lhs.strProperty == rhs
            .strProperty
        ) &&
        (
          lhs.skipOptStrProperty || rhs.skipOptStrProperty ||
            lhs.optStrProperty == rhs.optStrProperty
        ) &&
        (
          lhs.skipDateProperty || rhs.skipDateProperty || lhs.dateProperty == rhs
            .dateProperty
        ) &&
        (
          lhs.skipOptDateProperty || rhs.skipOptDateProperty ||
            lhs.optDateProperty == rhs.optDateProperty
        ) &&
        (
          lhs.skipUUIDProperty || rhs.skipUUIDProperty || lhs.uuidProperty == rhs
            .uuidProperty
        ) &&
        (
          lhs.skipOptUUIDProperty || rhs.skipOptUUIDProperty ||
            lhs.optUUIDProperty == rhs.optUUIDProperty
        )
    }
  }

  func do_isNotEqualTo_withDifferent_Success(
    file: StaticString = #file,
    line: UInt = #line,
    _ closure: (Subject<Foo>, Foo) -> Void
  ) {
    let actual = Foo()
    let expected = Foo()
    assertNoFailures(file: file, line: line) { closure($0.that(actual), expected) }
  }

  func do_isNotEqualTo_withDifferent_Fail<Value>(
    file: StaticString = #file,
    line: UInt = #line,
    _ keyPath: ReferenceWritableKeyPath<Foo, Value>,
    _ newValue: Value,
    _ propEqualityBool: ReferenceWritableKeyPath<Foo, Bool>,
    test testClosure: (Subject<Foo>, Foo) -> Void
  ) {
    let actual = Foo()
    let expected = Foo()
    assertFailure([
      Fact("expected not to equal", expected),
      Fact("when", keyPath),
      Fact("is", newValue),
    ], file: file, line: line) {
      actual[keyPath: propEqualityBool] = true
      defer { actual[keyPath: propEqualityBool] = false }
      testClosure($0.that(actual), expected)
    }
  }

  func test_isEqualTo_WithNonNilValues_Succeeds() {
    assertNoFailures { $0.that(123).isEqualTo(123) }
  }

  func test_isEqualTo_WithNilValues_Succeeds() {
    let actual: Int? = nil
    let expected: Int? = nil
    assertNoFailures { $0.that(actual).isEqualTo(expected) }
  }

  func test_isEqualTo_WithNonNilValues_Fails() {
    let actual = 123
    let expected = 456
    assertFailure([Fact("expected", expected), Fact("but was", actual)]) {
      $0.that(actual).isEqualTo(expected)
    }
  }

  func test_isEqualTo_WithNonNilAndNilValues_Fails() {
    let actual = 123
    let expected: Int? = 456
    // Note that we needed to wrap the actual in an Optional. This is because the compiler will
    // implicitly do this when passing the actual and expected to the Subject. You can prove it to
    // yourself by changing "let expected: Int? = 456" to "let expected: Int = 456". You will see
    // different values be printed in the facts.
    assertFailure([Fact("expected", expected), Fact("but was", Optional(actual))]) {
      $0.that(actual).isEqualTo(expected)
    }
  }

  // MARK: - isNotEqual()

  func test_isNotEqualTo_WithNonNilValues_Succeeds() {
    let actual = 123
    let expected = 456
    assertNoFailures { $0.that(actual).isNotEqualTo(expected) }
  }

  func test_isNotEqualTo_WithOneNilValue_Succeeds() {
    let actual = 123
    assertNoFailures { $0.that(actual).isNotEqualTo(nil) }
  }

  func test_isNotEqualTo_WithNonNilValues_Fails() {
    let actual: Int? = nil
    let expected: Int? = nil
    assertFailure([Fact("expected not to equal", expected)]) {
      $0.that(actual).isNotEqualTo(expected)
    }
  }

  func test_isNotEqualTo_WithNilValues_Fails() {
    let actual = 123
    let expected = 123
    assertFailure([Fact("expected not to equal", expected)]) {
      $0.that(actual).isNotEqualTo(expected)
    }
  }

  func test_isNotEqualTo_when_is_Succeeds() {
    let actual = Foo()
    let expected = Foo()
    assertNoFailures {
      $0.that(actual).isNotEqualTo(expected, when: \.intProperty, is: 123)
    }
  }

  func test_isNotEqualTo_when_is_Fails() {
    let actual = Foo()
    let expected = Foo()
    let keyPath: ReferenceWritableKeyPath<Foo, Int> = \.intProperty
    assertFailure([
      Fact("expected not to equal", expected),
      Fact("when", keyPath),
      Fact("is", actual.intProperty),
    ]) {
      $0.that(actual).isNotEqualTo(expected, when: keyPath, is: actual.intProperty)
    }
  }

  func test_isNotEqualTo_when_is_FailsDueToExpectedNotBeingEqualFromBeginning() {
    let actual = Foo()
    let expected = Foo()
    expected.intProperty += 1
    assertFailure([Fact("expected", expected), Fact("but was", actual)]) {
      $0.that(actual).isNotEqualTo(expected, when: \.intProperty, is: 123)
    }
  }

  func test_isNotEqualTo_withDifferent_OptionalNumericValue_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.optIntProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_OptionalNumericValue_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.optIntProperty,
      IsNotEqualWithDifferentValues.intIncrement,
      \.skipOptIntProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.optIntProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_NumericValue_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.intProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_NumericValue_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.intProperty,
      IsNotEqualWithDifferentValues.intIncrement,
      \.skipIntProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.intProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_BoolValue_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.boolProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_BoolValue_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.boolProperty,
      !Foo.defaultBoolValue,
      \.skipBoolProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.boolProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_StringValue_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.strProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_StringValue_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.strProperty,
      Foo.defaultStrValue + IsNotEqualWithDifferentValues.strSuffix,
      \.skipStrProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.strProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_OptionalStringValue_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.optStrProperty)
    }
  }

  func test_isNotEqualTo_withDifferent_OptionalStringValue_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.optStrProperty,
      IsNotEqualWithDifferentValues.strSuffix,
      \.skipOptStrProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.optStrProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_UUID_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.uuidProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_UUID_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.uuidProperty,
      IsNotEqualWithDifferentValues.uuid,
      \.skipUUIDProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.uuidProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_OptionalUUID_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.optUUIDProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_OptionalUUID_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.optUUIDProperty,
      IsNotEqualWithDifferentValues.uuid,
      \.skipOptUUIDProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.optUUIDProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_Date_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.dateProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_Date_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.dateProperty,
      Foo.defaultDateValue + IsNotEqualWithDifferentValues.timeIntervalIncrement,
      \.skipDateProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.dateProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_OptionalDate_Success() {
    do_isNotEqualTo_withDifferent_Success { actualSubject, expected in
      actualSubject.isNotEqualTo(expected, withDifferent: \.optDateProperty)
    }
  }

  func test_isNotEqualTo_WithDifferent_OptionalDate_Fail() {
    do_isNotEqualTo_withDifferent_Fail(
      \.optDateProperty,
      IsNotEqualWithDifferentValues.date + IsNotEqualWithDifferentValues
        .timeIntervalIncrement,
      \.skipOptDateProperty
    ) { subject, expected in
      subject.isNotEqualTo(expected, withDifferent: \.optDateProperty)
    }
  }

  // MARK: - Test isIn()

  func test_isIn_Success() {
    let sequence = ["a", "b", "c"]
    assertNoFailures { $0.that("b").isIn(sequence) }
  }

  func test_isIn_Failure() {
    let actual = "d"
    let sequence = ["a", "b", "c"]
    assertFailure([Fact("", actual), Fact("expected to be in", sequence)]) {
      $0.that(actual).isIn(sequence)
    }
  }
}
