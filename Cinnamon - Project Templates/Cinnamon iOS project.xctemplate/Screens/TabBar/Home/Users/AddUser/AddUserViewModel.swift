//___FILEHEADER___

import SwiftUI

final class AddUserViewModel: ObservableObject {
    enum ValidationError: Error {
        case invalidName
        case invalidEmail
    }

    @Published private (set) var state: LoadingState = .notActive
    @Published var name: String = ""
    @Published var email: String = ""

    private let userService: UserServiceProvider

    init(userService: UserServiceProvider = UserService()) {
        self.userService = userService
    }

    @MainActor
    func onAddButtonTap() async {
        do {
            try validateForm()
            await addUser()
        } catch let error as ValidationError {
            handleError(error)
        } catch {
            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }

    @MainActor
    private func addUser() async {
        state = .loading
        do {
            let user = User(name: name, email: email)
            _ = try await userService.add(user: user)
            state = .loaded
            presentSuccessAlert()
            clearInput()
        } catch let error {
            state = .error
            print(error)
        }
    }

    private func presentSuccessAlert() {
        AlertManager.presentAlert(alert: AlertModel.basicAlert(
            title: "Success",
            message: String(format: NSLocalizedString("UsersScreen_added %@", comment: ""), name)
        ))
    }

    private func clearInput() {
        name = ""
        email = ""
    }
}

private extension AddUserViewModel {
    func validateForm() throws {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw ValidationError.invalidName
        }

        guard email.isValidEmail else {
            throw ValidationError.invalidEmail
        }

        return
    }

    func handleError(_ error: ValidationError) {
        switch error {
        case .invalidName:
            AlertManager.presentAlert(alert: AlertContext.emptyFieldAlert)
        case .invalidEmail:
            AlertManager.presentAlert(alert: AlertContext.invalidEmailAlert)
        }
    }

    func handleError(_ error: NetworkError) {
        switch error {
        default:
            AlertManager.presentAlert(alert: AlertContext.genericError)
        }
    }
}
