//___FILEHEADER___

import Foundation

protocol LoginServiceProvider {
    func login(_ loginRequestParams: LoginRequestParams) async throws -> AuthorizationResponse
}

class LoginService: LoginServiceProvider {
    func login(_ loginRequestParams: LoginRequestParams) async throws -> AuthorizationResponse {
        return AuthorizationResponse.mock
    }
}
