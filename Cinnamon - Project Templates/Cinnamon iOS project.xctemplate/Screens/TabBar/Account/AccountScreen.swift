//___FILEHEADER___

import SwiftUI

struct AccountScreen: View {
    @StateObject private var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            Spacer()

            Text(LocalizedStringKey("Account_title"))
                .fontStyle(Verdana.bold28)

            Button {
                viewModel.logout()
            } label: {
                Text(LocalizedStringKey("Account_logout"))
            }
            .buttonStyle(BlueButtonStyle())

            Spacer()
        }
        .padding()
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
