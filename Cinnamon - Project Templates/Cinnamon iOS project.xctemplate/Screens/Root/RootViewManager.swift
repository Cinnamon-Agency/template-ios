//___FILEHEADER___

import SwiftUI
import Combine

class RootViewManager: ObservableObject {
    private let sessionManager: SessionManagerProvider
    private var cancellables = Set<AnyCancellable>()

    @Published var isUserLogged: Bool = false

    init(sessionManager: SessionManagerProvider = SessionManager.shared) {
        self.sessionManager = sessionManager
        bind()
    }

    private func bind() {
        sessionManager.isLoggedIn
            .sink { [weak self] value in
                self?.isUserLogged = value
            }
            .store(in: &cancellables)
    }
}
