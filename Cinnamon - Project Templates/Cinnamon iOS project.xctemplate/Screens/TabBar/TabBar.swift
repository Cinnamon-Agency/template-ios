//___FILEHEADER___

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            UsersScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text(LocalizedStringKey("TabBar_home"))
                }

            AccountScreen()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text(LocalizedStringKey("TabBar_account"))
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

enum Tab: Hashable {
    case home
    case account
}
