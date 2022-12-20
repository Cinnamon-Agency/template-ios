//___FILEHEADER___

import SwiftUI

struct RootView: View {
    @StateObject var rootViewManager = RootViewManager()
    @StateObject var connectivityManager = ConnectivityManager()

    var body: some View {
        VStack {
            if rootViewManager.isUserLogged {
                TabBar()
            } else {
                LoginScreen()
            }
        }
        .environmentObject(connectivityManager)
        .onChange(of: connectivityManager.status) { newValue in
            connectionStatusChanged(newValue)
        }
    }

    private func connectionStatusChanged(_ value: NetworkStatus) {
        if value == .disconnected {
            AlertManager.presentAlert(alert: AlertContext.noConnectionAlert)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
