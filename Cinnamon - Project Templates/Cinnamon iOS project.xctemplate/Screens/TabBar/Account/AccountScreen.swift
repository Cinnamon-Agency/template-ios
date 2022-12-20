//___FILEHEADER___

import SwiftUI

struct AccountScreen: View {
    @StateObject private var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            titleView
            logoutButton
        }
        .padding()
    }
}

// MARK: - Views
extension AccountScreen {
    var titleView: some View {
        Text(LocalizedStringKey("Account_title"))
            .fontStyle(Verdana.bold28)
    }

    var logoutButton: some View {
        RoundedButton(
            title: String(localized: "Account_logout"),
            action: {
                viewModel.logout()
            }
        )
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
