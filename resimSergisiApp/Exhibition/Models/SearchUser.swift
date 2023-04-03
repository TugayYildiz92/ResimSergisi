
import Foundation

struct SearchUser: Codable {
    let users: [User]?

    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

//Tugay Yıldız tarafından hazırlandı...
