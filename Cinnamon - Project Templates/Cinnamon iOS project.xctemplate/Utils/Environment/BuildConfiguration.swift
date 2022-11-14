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
        case .debugDevelopment, .releaseDevelopment:
            return "https://gorest.co.in/public/v1"
        case .debugProduction, .releaseProduction:

            // TODO add prod version
            return "https://gorest.co.in/public/v1"
        }
    }

    init() {
//        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String
//        environmentConfiguration = Config(rawValue: currentConfiguration!)!

        environmentConfiguration = .debugDevelopment
    }
}
