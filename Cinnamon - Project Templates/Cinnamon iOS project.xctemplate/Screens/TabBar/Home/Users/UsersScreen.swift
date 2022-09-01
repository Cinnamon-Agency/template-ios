//___FILEHEADER___

import SwiftUI

struct UsersScreen: View {
    @StateObject private var viewModel = UsersViewModel()

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loading:
                    ProgressView(LocalizedStringKey("Common_loading"))
                case .loaded, .error:
                    userList
                default:
                    EmptyView()
                }
            }
            .modifier(
                OnFirstAppear {
                    Task {
                        await viewModel.getUsers()
                    }
                }
            )
        }
        .navigationViewStyle(.stack)
    }
}

private extension UsersScreen {
    var userList: some View {
        List {
            ForEach(viewModel.users, id: \.id) { user in
                Text(user.name ?? "")
                    .fontStyle(Verdana.regular16)
            }
        }
        .navigationTitle(viewModel.navigationTitle)
    }
}

struct UsersScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsersScreen()
    }
}
