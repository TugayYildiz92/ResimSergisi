
import Foundation
import Combine

class PhotoService {
    @Published var photos: [Photo] = []
    private var cancellable: AnyCancellable? = nil
    var page: Int = 1
    
    init() {
        downloadPhotos()
    }
    
    func downloadPhotos() {
        guard let url = URL(string: ApiURLs.editorial(byPage: page)) else {return}
        page += 1
        
        cancellable = NetworkingManager.shared.download(url: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] downloadedPhotos in
                self?.photos = downloadedPhotos
                self?.cancellable?.cancel()
            })
    }
}


//Tugay Yıldız tarafından hazırlandı...
