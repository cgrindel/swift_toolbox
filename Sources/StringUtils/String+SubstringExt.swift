// Adapted from https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift
// Note: Using integers is not perfect. However, it makes some manipulations much easier to grok.

public extension String {
  func index(from offset: Int) -> Index {
    return index(startIndex, offsetBy: offset)
  }

  func substring(from idx: Int) -> Substring {
    let fromIndex = index(from: idx)
    return self[fromIndex...]
  }

  func substring(to idx: Int) -> Substring {
    let toIndex = index(from: idx)
    return self[..<toIndex]
  }

  func substring(with range: Range<Int>) -> Substring {
    let startIndex = index(from: range.lowerBound)
    let endIndex = index(from: range.upperBound)
    return self[startIndex ..< endIndex]
  }
}
