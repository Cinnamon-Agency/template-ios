//___FILEHEADER___

import Foundation
import Cinamofryer

protocol UserServiceProvider {
    func fetch() async throws -> ApiResponse<[User]>
    func add(user: User) async throws -> ApiResponse<User>
}

struct UserService: UserServiceProvider {
    func fetch() async throws -> ApiResponse<[User]> {
        return try await Cinamofryer.request(
            url: BuildConfiguration.shared.baseURL + Endpoints.Users.users.path,
            method: .GET()
        )
    }

    func add(user: User) async throws -> ApiResponse<User> {
        return try await Cinamofryer.request(
            url: BuildConfiguration.shared.baseURL + Endpoints.Users.users.path,
            method: .POST,
            parameters: try user.asDictionary(),
            headers: SessionManager.shared.authorizationHeader
        )
    }
}
