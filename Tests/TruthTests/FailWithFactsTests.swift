@testable import Truth
import XCTest

class FactTests: XCTestCase {
  func test_init_WithKey() {
    let key = "expected"
    let result = Fact(key)
    assertThat(result.key).isEqualTo(key)
    assertThat(result.value).isNil()

    let msg = result.toMessage()
    assertThat(msg).isEqualTo(key)
  }

  func test_init_WithKeyAndValue() {
    let key = "expected"
    let value = 123
    let result = Fact(key, value)
    assertThat(result.key).isEqualTo(key)
    assertThat(result.value).isEqualTo("\(value)")

    let msg = result.toMessage()
    assertThat(msg).isEqualTo("\(key) \(value)")
  }

  func test_toMessage_OnCollectionOfFacts() {
    let factValue = 123
    let facts = [Fact("first fact"), Fact("second fact", factValue)]
    assertThat(facts.toMessage()).isEqualTo("first fact, second fact \(factValue)")
  }

  static var allTests = [
    ("test_init_WithKey", test_init_WithKey),
    ("test_init_WithKeyAndValue", test_init_WithKeyAndValue),
    ("test_toMessage_OnCollectionOfFacts", test_toMessage_OnCollectionOfFacts),
  ]
}

class FailWithFactsTests: XCTestCase {
  // lazy var strategy = { DefaultFailureStrategy(failFn: fail) }()
  let strategy = FailureCapture()

  func test_fail_WithFactsAsVariadic() {
    let file: StaticString = "foo.bar"
    let line: UInt = 123
    strategy.fail(file: file, line: line, Fact("first fact"), Fact("second fact"))
    assertThat(strategy.capturedFailures.asEquatable()).isEqualTo([
      EquatableFailure(message: "first fact, second fact", file: file.toString(), line: line),
    ])
  }

  func test_fail_WithFactsAsArray() {
    let file: StaticString = "foo.bar"
    let line: UInt = 123
    strategy.fail(file: file, line: line, [Fact("first fact"), Fact("second fact")])
    assertThat(strategy.capturedFailures.asEquatable()).isEqualTo([
      EquatableFailure(message: "first fact, second fact", file: file.toString(), line: line),
    ])
  }

  static var allTests = [
    ("test_fail_WithFactsAsVariadic", test_fail_WithFactsAsVariadic),
    ("test_fail_WithFactsAsArray", test_fail_WithFactsAsArray),
  ]
}
