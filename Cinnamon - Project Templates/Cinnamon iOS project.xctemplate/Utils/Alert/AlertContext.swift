//___FILEHEADER___

import UIKit

enum AlertContext {
    static var invalidEmailAlert: UIAlertController {
        AlertModel.basicAlert(
            title: NSLocalizedString("Alert_email_title", comment: ""),
            message: NSLocalizedString("Alert_email_message", comment: "")
        )
    }

    static var invalidPasswordAlert: UIAlertController {
        AlertModel.basicAlert(
            title: NSLocalizedString("Alert_password_title", comment: ""),
            message: NSLocalizedString("Alert_password_message", comment: ""))
    }
}

extension AlertContext {
    static var genericError: UIAlertController {
        AlertModel.basicAlert(
            title: NSLocalizedString("Alert_generic_title", comment: ""),
            message: NSLocalizedString("Alert_generic_message", comment: "")
        )
    }
}
