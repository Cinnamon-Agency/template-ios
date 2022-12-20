//___FILEHEADER___

import Foundation

enum Config: String {
    case debugDevelopment = "Debug Development"
    case releaseDevelopment = "Release Development"

    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}

struct BuildConfiguration {
    static let shared = BuildConfiguration()

    var environmentConfiguration: Config

    var baseURL: String {
        switch environmentConfiguration {
        case .debugDevelopment, .releaseDevelopment, .debugProduction, .releaseProduction:
            return "https://gorest.co.in/public/v1"
        }
    }

    // TODO we are following this for adding build configurations
    // https://sarunw.com/posts/how-to-set-up-ios-environments/#assign-current-configuration-to-info.plist
    init() {
        environmentConfiguration = .debugDevelopment
    }
}
