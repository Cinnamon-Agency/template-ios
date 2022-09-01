//___FILEHEADER___

import Foundation

protocol UserServiceProvider {
    func fetch() async throws -> [User]
}

struct UserService: UserServiceProvider {
    func fetch() async throws -> [User] {
        try await Task.sleep(nanoseconds: 2_000_000_000) // simulate loading time
        return User.mockUsers
    }
}
