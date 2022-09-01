//___FILEHEADER___

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }

    // Minimum eight characters, at least one upper case one lower case and a digit
    var isValidPassword: Bool {
        let charRegex = "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}"
        let charTest = NSPredicate(format: "SELF MATCHES %@", charRegex)
        return charTest.evaluate(with: self)
    }

}
