//___FILEHEADER___

import Foundation
import SwiftUI

struct FontViewModifier: ViewModifier {
    let fontStyle: FontStyle

    init(fontStyle: FontStyle) {
        self.fontStyle = fontStyle
    }

    func body(content: Content) -> some View {
        content
            .font(fontStyle.font)
            .lineSpacing(fontStyle.lineSpacing)
            .foregroundColor(fontStyle.foregroundColor)
    }
}
