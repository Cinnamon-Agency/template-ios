//___FILEHEADER___

import Foundation

struct AuthorizationResponse: Codable {
    let token: AuthorizationToken
}

struct AuthorizationToken: Codable {
    let value: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case expiresIn = "expires_in"
    }
}

extension AuthorizationResponse {
    static let mock = AuthorizationResponse(
        token: AuthorizationToken(
            value: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
            expiresIn: 86_400)
    )
}
