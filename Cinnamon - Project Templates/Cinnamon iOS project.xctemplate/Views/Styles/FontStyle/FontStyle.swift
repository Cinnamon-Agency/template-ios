//___FILEHEADER___

import Foundation
import SwiftUI

public class FontStyle {
    private var id: UUID
    public var font: Font
    public var foregroundColor: Color
    public var lineSpacing: CGFloat

    public init(font: Font, foregroundColor: Color, lineSpacing: CGFloat = 0) {
        self.id = UUID()
        self.font = font
        self.foregroundColor = foregroundColor
        self.lineSpacing = lineSpacing
    }
}
