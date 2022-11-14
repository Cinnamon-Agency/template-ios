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
            value: "a920ee00ea1be178115dde1fd20bc987c37239c60d42da5afd62260d53619a20",
            expiresIn: 86_400)
    )
}
