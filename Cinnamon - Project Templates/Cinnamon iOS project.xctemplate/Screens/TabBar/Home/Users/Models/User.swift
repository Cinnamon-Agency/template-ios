//___FILEHEADER___

import Foundation

struct User: Codable, Identifiable {
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?

    public init(id: Int? = nil, name: String? = nil, email: String? = nil, gender: String? = "male", status: String? = "active") {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status
    }
}

extension User {
    static let mock: User = User(id: 1245, name: "Super name", email: "test@test.com", gender: "test gender", status: "active")

    static let mockUsers: [User] = [
         User(id: 1245, name: "Super name", email: "test@test.com", gender: "test gender", status: "active"),
         User(id: 2345, name: "Super user", email: "test123@test.com", gender: "male", status: "active"),
         User(id: 3456, name: "Cinnamon test", email: "test234@test.com", gender: "female", status: "active")
    ]
}
