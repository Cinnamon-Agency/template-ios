//___FILEHEADER___

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .fontStyle(Verdana.regular18)
            .frame(height: 50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(12)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
