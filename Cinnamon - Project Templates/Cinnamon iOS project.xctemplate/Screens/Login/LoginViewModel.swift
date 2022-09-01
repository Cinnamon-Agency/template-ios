//___FILEHEADER___

import SwiftUI

final class LoginViewModel: ObservableObject {
    enum ValidationError: Error {
        case invalidEmail
        case invalidPassword
    }

    private let sessionManager: SessionManagerProvider
    private let loginService: LoginServiceProvider

    @Published var email: String = ""
    @Published var password: String = ""

    init(sessionManager: SessionManagerProvider = SessionManager.shared, loginService: LoginServiceProvider = LoginService()) {
        self.sessionManager = sessionManager
        self.loginService = loginService
    }

    func onLoginButtonTap() async {
        do {
            try validateForm()
            await login()
        } catch let error as ValidationError {
            handleError(error)
        } catch {
            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }

    private func login() async {
        do {
            let authorizationResponse = try await loginService.login(LoginRequestParams(email: email, password: password))

            sessionManager.login(token: authorizationResponse.token.value)
        } catch let error as NetworkError {
            handleError(error)
        } catch {
            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }
}

private extension LoginViewModel {
    func validateForm() throws {
        guard email.isValidEmail else {
            throw ValidationError.invalidEmail
        }

        guard password.isValidPassword else {
            throw ValidationError.invalidPassword
        }

        return
    }

    func handleError(_ error: ValidationError) {
        switch error {
        case .invalidEmail:
            AlertManager.presentAlert(alert: AlertContext.invalidEmailAlert)
        case .invalidPassword:
            self.password = ""
            AlertManager.presentAlert(alert: AlertContext.invalidPasswordAlert)
        }
    }

    func handleError(_ error: NetworkError) {
        switch error {
        default:
            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }
}
