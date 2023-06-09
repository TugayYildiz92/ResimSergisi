
import Foundation

class ProfileViewModel: ObservableObject {
    @MainActor @Published var profileModel: ProfileModel = ProfileModel()

    func getProfileModel() async {
        do {
            let returnedProfileModel = try await ProfileStore.load()
            await MainActor.run {
                self.profileModel = returnedProfileModel
            }
        } catch {
            print(error)
        }
    }
    
    func saveProfileModel() async {
        do {
            try await ProfileStore.save(profileModel: profileModel)
        } catch {
            print(error)
        }
    }
}

//Tugay Yıldız tarafından hazırlandı...
