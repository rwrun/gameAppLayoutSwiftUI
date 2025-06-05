//error nil

import Foundation
import SwiftUI
//DidactGothic-Regular

enum DidactGothic: String{
    case regular = "DidactGothic-Regular"
}


extension View{
    func font(type: DidactGothic = .regular, size: CGFloat = 16) -> some View{
        self
            .font(Font.custom(type.rawValue, size: size))
    }
}
