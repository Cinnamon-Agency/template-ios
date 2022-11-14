//___FILEHEADER___

import SwiftUI

struct UsersScreen: View {
    @StateObject private var viewModel = UsersViewModel()

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loading:
                    progressView
                case .loaded, .error:
                    userList
                default:
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
        .onFirstAppear {
            Task {
                await viewModel.getUsers()
            }
        }
    }
}

// MARK: - Views
private extension UsersScreen {
    var progressView: some View {
        ProgressView(LocalizedStringKey("Common_loading"))
    }

    var addUserButton: some View {
        NavigationLink(destination: AddUserScreen(), label: {
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
        })
    }

    var userList: some View {
        List {
            ForEach(viewModel.users, id: \.id) { user in
                Text(user.name ?? "")
                    .fontStyle(Verdana.regular16)
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .toolbar {
            addUserButton
        }
    }
}

struct UsersScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsersScreen()
    }
}
