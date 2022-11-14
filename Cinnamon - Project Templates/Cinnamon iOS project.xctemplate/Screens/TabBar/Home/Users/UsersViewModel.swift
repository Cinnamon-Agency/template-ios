//___FILEHEADER___

import SwiftUI

final class UsersViewModel: ObservableObject {
    @Published private (set) var state: LoadingState = .notActive
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
            users = try await userService.fetch().data
            self.state = .loaded
        } catch let error {
            self.state = .error

            print(error)
        }
    }
}
