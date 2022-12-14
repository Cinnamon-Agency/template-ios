//___FILEHEADER___

import Foundation
import SwiftUI

extension View {
    public func fontStyle(_ fontStyle: FontStyle) -> some View {
        modifier(FontViewModifier(fontStyle: fontStyle))
    }

    public func onFirstAppear(_ perform: @escaping () -> Void) -> some View {
        modifier(OnFirstAppear(perform: perform))
    }
}
