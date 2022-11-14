//___FILEHEADER___

import Foundation

private protocol EndpointInfo {
    var path: String { get }
}

struct Endpoints {
    enum Users: EndpointInfo {
        case users

        var path: String {
            switch self {
            case .users:
                return "/users"
            }
        }
    }
}
