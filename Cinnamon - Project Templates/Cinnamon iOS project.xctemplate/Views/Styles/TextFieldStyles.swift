//___FILEHEADER___

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    // swiftlint:disable identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 50)
            .offset(x: 20.0)
            .padding(.trailing, 40)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.blue)
            )
            .fontStyle(Verdana.regular16)
    }
}
