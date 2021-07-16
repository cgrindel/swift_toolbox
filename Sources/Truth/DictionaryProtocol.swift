public protocol DictionaryProtocol {
  associatedtype Key: Hashable
  associatedtype Value

  func index(forKey: Key) -> Dictionary<Key, Value>.Index?
  subscript(_: Dictionary<Key, Value>.Index) -> Dictionary<Key, Value>.Element { get }
}

extension Dictionary: DictionaryProtocol {}
