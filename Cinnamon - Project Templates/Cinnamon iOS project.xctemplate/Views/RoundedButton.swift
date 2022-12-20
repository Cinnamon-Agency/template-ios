//___FILEHEADER___

import SwiftUI

struct RoundedButton: View {
    let title: String
    let loading: Bool
    let action: () -> Void

    init(title: String, loading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.loading = loading
        self.action = action
    }

    var body: some View {
        Button(action: action, label: {
            Group {
                if loading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                }
            }
        })
        .buttonStyle(BlueButtonStyle())
        .disabled(loading)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedButton(title: "Button", action: {})
            RoundedButton(title: "Button", loading: true, action: {})
        }
        .padding()
    }
}
