//___FILEHEADER___

import Foundation
import Combine

protocol SessionManagerProvider: AnyObject {
    var token: String? { get set }
    var isLoggedIn: AnyPublisher<Bool, Never> { get }

    func login(token: String)
    func logout()
}

extension SessionManagerProvider {
    var authorizationHeader: [String: String]? {
        guard let token = SessionManager.shared.token else { return nil }

        return ["Authorization": "Bearer \(token)"]
    }
}
