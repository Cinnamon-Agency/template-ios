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

    static var emptyFieldAlert: UIAlertController {
        AlertModel.basicAlert(
            title: NSLocalizedString("Alert_empty_title", comment: ""),
            message: NSLocalizedString("Alert_empty_message", comment: ""))
    }

    static var noConnectionAlert: UIAlertController {
        AlertModel.basicAlert(
            title: NSLocalizedString("Alert_connection_title", comment: ""),
            message: NSLocalizedString("Alert_connection_message", comment: ""))
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
