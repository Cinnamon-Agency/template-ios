//___FILEHEADER___

import SwiftUI

struct OnFirstAppear: ViewModifier {
    let perform: () -> Void

    @State private var firstTime = true

    func body(content: Content) -> some View {
        content.onAppear {
            if firstTime {
                firstTime = false
                perform()
            }
        }
    }
}
