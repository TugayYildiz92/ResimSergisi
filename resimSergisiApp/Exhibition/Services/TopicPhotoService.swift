
import Foundation
import Combine

class TopicPhotoService {
    @Published var photos: [Photo] = []
    private var cancellable: AnyCancellable? = nil
    var page: Int = 1
    private let topicEnum: TopicEnum
    
    init(topicEnum: TopicEnum) {
        self.topicEnum = topicEnum
        downloadPhotos()
    }
    
    func downloadPhotos() {
        guard let url = URL(string: ApiURLs.topicPhoto(topic: topicEnum, page: page)) else {return}
        page += 1
        
        cancellable = NetworkingManager.shared.download(url: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] returnedPhotos in
                self?.photos = returnedPhotos
                self?.cancellable?.cancel()
            })
    }
}

//Tugay Yıldız tarafından hazırlandı...
