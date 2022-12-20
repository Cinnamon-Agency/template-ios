//___FILEHEADER___

import SwiftUI

struct LoginScreen: View {
    private enum FocusedField: Hashable {
        case email
        case password
    }

    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            titleView
            formView
            loginButton
            hintView
        }
        .padding()
    }
}

// MARK: - Views
extension LoginScreen {
    var titleView: some View {
        Text(LocalizedStringKey("Login_title"))
            .fontStyle(Verdana.bold28)
    }

    var formView: some View {
        Group {
            TextField(LocalizedStringKey("Common_Email"), text: $viewModel.email)
                .autocapitalization(.none)
                .focused($focusedField, equals: .email)
                .submitLabel(.next)
                .onSubmit { focusedField = .password }

            SecureField(LocalizedStringKey("Common_Password"), text: $viewModel.password)
                .focused($focusedField, equals: .password)
                .submitLabel(.go)
                .onSubmit {
                    Task {
                        await viewModel.onLoginButtonTap()
                    }
                }
        }
        .textFieldStyle(RoundedTextFieldStyle())
    }

    var loginButton: some View {
        RoundedButton(
            title: String(localized: "Login"),
            loading: viewModel.state == .loading,
            action: {
                Task {
                    await viewModel.onLoginButtonTap()
                }
            }
        )
    }

    var hintView: some View {
        Text(LocalizedStringKey("Login_hint"))
            .foregroundColor(.secondary)
            .fontStyle(Verdana.regular16)
            .padding(.top, 16)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
            .environmentObject(RootViewManager())
    }
}
