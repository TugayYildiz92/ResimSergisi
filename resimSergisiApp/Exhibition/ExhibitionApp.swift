

import SwiftUI

@main
struct ExhibitionApp: App {
    
    @StateObject private var profileViewModel: ProfileViewModel = ProfileViewModel()
    @StateObject private var likedPhotosStorage: LikedPhotosStorage = LikedPhotosStorage()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor(Color.black.opacity(0.5))

        UITabBar.appearance().standardAppearance = appearance

        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    
    
    var body: some Scene {
        
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
                .environmentObject(profileViewModel)
                .environmentObject(likedPhotosStorage)
                .task {
                    await profileViewModel.getProfileModel()
                }
        }
    }
}

//Tugay Yıldız tarafından hazırlandı...
