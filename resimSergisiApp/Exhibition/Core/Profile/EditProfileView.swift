
import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var profileData: ProfileModel.ProfileData
    
    private var attributedString: AttributedString {
        var text = AttributedString("Edit your full information on unsplash.com")
        text.foregroundColor = .gray
        
        if let unsplash = text.range(of: "unsplash.com") {
            text[unsplash].foregroundColor = .white
        }
        
        return text
    }
    
    var body: some View {
        Form {
            Section {
                TextField("First name", text: $profileData.firstname)
                TextField("Last name", text: $profileData.lastname)
                TextField("Username", text: $profileData.username)
                TextField("Email", text: $profileData.email)
            } header: {
                Text("Profile")
            }
            
            Section {
                TextField("Location", text: $profileData.location)
                TextField("Website", text: $profileData.website)
            } header: {
                Text("About")
            }
            
            Section {} header: {
                Text(attributedString)
                    .headerProminence(.increased)
                    .font(.body)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.white)
            }
        })
        .disableAutocorrection(true)
        .textInputAutocapitalization(.never)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(profileData: .constant(ProfileModel.ProfileData()))
            .environmentObject(ProfileViewModel())
            .preferredColorScheme(.dark)
    }
}

//Tugay Yıldız tarafından hazırlandı...
