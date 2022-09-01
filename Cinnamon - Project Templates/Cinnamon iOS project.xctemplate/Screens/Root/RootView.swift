//___FILEHEADER___

import SwiftUI

struct RootView: View {
    @StateObject var rootViewManager = RootViewManager()

    var body: some View {
        if rootViewManager.isUserLogged {
            TabBar()
        } else {
            LoginScreen()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
