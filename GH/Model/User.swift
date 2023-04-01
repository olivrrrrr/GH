import Foundation

struct User: Codable {
    var login: String?
    var avatarURL: String?
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int?
    var publicGits: Int?
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
