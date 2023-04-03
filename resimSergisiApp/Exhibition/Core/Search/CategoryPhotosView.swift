
import SwiftUI

struct CategoryPhotosView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var searchViewModel: SearchViewModel
    let category: BrowseByCategory
    @State private var searchTextControl: Bool = true
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(searchViewModel.photos) { photo in
                        ZStack(alignment: .bottomLeading) {
                            PhotoImageView(photo: photo) {
                                
                                PhotoAttributesView(photo: photo)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: photo.height?.calculateHeight(width: photo.width ?? 0, height: photo.height ?? 0))
                        .onAppear {
                            if searchViewModel.photos.count > 5 {
                                if photo.id == searchViewModel.photos[searchViewModel.photos.count - 2].id && !searchViewModel.photos.isEmpty {
                                    searchViewModel.searchPhotoService.downloadSearchResult()
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(category.rawValue)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            if searchTextControl {
                searchViewModel.searchText = category.rawValue
                searchTextControl = false
            }
        })
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    searchViewModel.photos.removeAll()
                    searchViewModel.searchText = ""
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.white)
            }
        })
    }
}

struct CategoryPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryPhotosView(searchViewModel: SearchViewModel(), category: BrowseByCategory.animals)
                .preferredColorScheme(.dark)
        }
    }
}

//Tugay Yıldız tarafından hazırlandı...
