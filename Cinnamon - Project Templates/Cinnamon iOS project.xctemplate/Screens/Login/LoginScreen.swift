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
            Text(LocalizedStringKey("Login_title"))
                .fontStyle(Verdana.bold28)

            TextField(LocalizedStringKey("Common_Email"), text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focusedField, equals: .email)
                .submitLabel(.next)
                .onSubmit { focusedField = .password }

            SecureField(LocalizedStringKey("Common_Password"), text: $viewModel.password)
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focusedField, equals: .password)
                .submitLabel(.go)
                .onSubmit {
                    Task {
                        await viewModel.onLoginButtonTap()
                    }
                }

            Button {
                Task {
                    await viewModel.onLoginButtonTap()
                }
            } label: {
                Text(LocalizedStringKey("Login"))
            }
            .buttonStyle(BlueButtonStyle())
        }
        .padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
            .environmentObject(RootViewManager())
    }
}
