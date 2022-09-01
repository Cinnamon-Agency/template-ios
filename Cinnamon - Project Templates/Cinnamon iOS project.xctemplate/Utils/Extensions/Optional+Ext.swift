//___FILEHEADER___

import Foundation

public extension Optional where Wrapped: Collection {
  var isNilOrEmpty: Bool {
    self?.isEmpty ?? true
  }
}

public extension Optional where Wrapped == String {
  var isNilOrEmpty: Bool {
    self?.isEmpty ?? true
  }
}
