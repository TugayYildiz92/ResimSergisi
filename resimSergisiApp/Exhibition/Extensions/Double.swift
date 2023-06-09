
import SwiftUI

extension Double {
    func calculateHeight(width: Double, height: Double) -> CGFloat {
        var imageHeight: CGFloat = 0
        var ratio: Double = 0
        
        if width > height {
            ratio = width / height
            imageHeight = UIScreen.main.bounds.width / ratio
        } else if height > width {
            ratio = height / width
            imageHeight = UIScreen.main.bounds.width * ratio
        } else {
            imageHeight = UIScreen.main.bounds.width
        }
        
        return imageHeight
    }
}



//Tugay Yıldız tarafından hazırlandı...
