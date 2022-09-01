//___FILEHEADER___

import Foundation

final class AccountViewModel: ObservableObject {
    private let sessionManager: SessionManagerProvider

    init(sessionManager: SessionManagerProvider = SessionManager.shared) {
        self.sessionManager = sessionManager
    }

    func logout() {
        sessionManager.logout()
    }
}
