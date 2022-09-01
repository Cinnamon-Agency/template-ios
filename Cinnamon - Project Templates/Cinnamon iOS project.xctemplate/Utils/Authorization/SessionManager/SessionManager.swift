//___FILEHEADER___

import Foundation
import KeychainAccess
import Combine

class SessionManager: SessionManagerProvider {
    private lazy var _isLoggedInSubject = CurrentValueSubject<Bool, Never>(!token.isNilOrEmpty)

    var isLoggedIn: AnyPublisher<Bool, Never> {
        _isLoggedInSubject.eraseToAnyPublisher()
    }

    static let shared = SessionManager()
    private let keychain: Keychain

    private init() {
        keychain = Keychain(service: Service.app.rawValue)
    }

    func login(token: String) {
        self.token = token
        publish()
    }

    func logout() {
        token = nil
        publish()
    }

    private func publish() {
        _isLoggedInSubject.send(!token.isNilOrEmpty)
    }
}

extension SessionManager {
    var token: String? {
        get { keychain[Key.token.rawValue] }
        set { keychain[Key.token.rawValue] = newValue }
    }
}

extension SessionManager {
    enum Service: String {
        case app = "com.cinnamon.templateApp-token"
    }

    enum Key: String {
        case token
    }
}
