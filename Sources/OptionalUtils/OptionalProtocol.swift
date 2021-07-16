// Loving inspired by
// https://stackoverflow.com/questions/27989094/how-to-unwrap-an-optional-value-from-any-type/32516815.

public protocol OptionalProtocol {
  associatedtype Wrapped

  func isSome() -> Bool
  func isNone() -> Bool
  func wrappedValue() throws -> Wrapped
}

extension Optional: OptionalProtocol {
  enum OptionalProtocolError: Error {
    case noValue
  }

  public func isSome() -> Bool {
    switch self {
    case .none: return false
    case .some: return true
    }
  }

  public func isNone() -> Bool {
    return !isSome()
  }

  public func wrappedValue() throws -> Wrapped {
    switch self {
    case .none:
      throw OptionalProtocolError.noValue
    case let .some(wrappedValue):
      return wrappedValue
    }
  }
}
