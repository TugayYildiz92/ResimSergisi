
import Foundation

struct SearchPhoto: Codable {
    let photos: [Photo]?

    enum CodingKeys: String, CodingKey {
        case photos = "results"
    }
}

//Tugay Yıldız tarafından hazırlandı...
