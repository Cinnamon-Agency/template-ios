//___FILEHEADER___

import Foundation

protocol LoginServiceProvider {
    func login(_ loginRequestParams: LoginRequestParams) async throws -> AuthorizationResponse
}

class LoginService: LoginServiceProvider {
    func login(_ loginRequestParams: LoginRequestParams) async throws -> AuthorizationResponse {
        try await Task.sleep(nanoseconds: UInt64(0.5 * Double(NSEC_PER_SEC))) // simulate delay
        return AuthorizationResponse.mock
    }
}
