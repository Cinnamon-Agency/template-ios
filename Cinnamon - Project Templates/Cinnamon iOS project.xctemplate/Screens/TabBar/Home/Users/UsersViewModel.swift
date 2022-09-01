//___FILEHEADER___

import SwiftUI

final class UsersViewModel: ObservableObject {
    enum State {
        case notActive
        case loading
        case loaded
        case error
    }

    @Published private (set) var state: State = .notActive
    @Published private (set) var users: [User] = []

    private let userService: UserServiceProvider
    private let sessionManager: SessionManagerProvider

    init(userService: UserServiceProvider = UserService(), sessionManager: SessionManagerProvider = SessionManager.shared) {
        self.sessionManager = sessionManager
        self.userService = userService
    }

    var navigationTitle: String {
        String(
            format: NSLocalizedString("UsersScreen_title %d", comment: ""),
            users.count
        )
    }

    @MainActor
    func getUsers() async {
        self.state = .loading

        do {
            users = try await userService.fetch()
            self.state = .loaded
        } catch _ {
            self.state = .error

            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }
}
