
import SwiftUI

struct CustomProfileLabelStyle: LabelStyle {
    let titleFont: Font
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            configuration.icon
            
            configuration.title
                .font(titleFont)
        }
    }
}


//Tugay Yıldız tarafından hazırlandı...
