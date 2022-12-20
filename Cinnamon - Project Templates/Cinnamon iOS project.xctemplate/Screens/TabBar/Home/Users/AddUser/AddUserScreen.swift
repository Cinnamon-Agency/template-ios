//___FILEHEADER___

import SwiftUI

struct AddUserScreen: View {
    @StateObject private var viewModel = AddUserViewModel()

    var body: some View {
        VStack(spacing: 20) {
            formView
            addUserButton
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(LocalizedStringKey("UsersScreen_add"))
    }
}

// MARK: - Views
private extension AddUserScreen {
    var formView: some View {
        VStack {
            TextField(LocalizedStringKey("Common_Name"), text: $viewModel.name)
            TextField(LocalizedStringKey("Common_Email"), text: $viewModel.email)
                .autocapitalization(.none)
                .submitLabel(.go)
                .onSubmit {
                    Task {
                        await viewModel.onAddButtonTap()
                    }
                }
        }
        .textFieldStyle(RoundedTextFieldStyle())
        .padding(.vertical, 16)
    }

    var addUserButton: some View {
        RoundedButton(
            title: String(localized: "UsersScreen_add"),
            loading: viewModel.state == .loading,
            action: {
                Task {
                    await viewModel.onAddButtonTap()
                }
            }
        )
    }
}

struct AddUserScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddUserScreen()
    }
}
