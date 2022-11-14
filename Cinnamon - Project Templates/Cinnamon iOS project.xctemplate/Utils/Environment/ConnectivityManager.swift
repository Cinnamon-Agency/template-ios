//___FILEHEADER___

import Network
import SwiftUI

enum NetworkStatus: String {
    case connected
    case disconnected
}

class ConnectivityManager: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")

    @Published var status: NetworkStatus = .connected

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if path.status == .satisfied {
                    print("Internet connection established.")
                    self.status = .connected
                } else {
                    print("No internet connection.")
                    self.status = .disconnected
                }
            }
        }
        monitor.start(queue: queue)
    }
}
