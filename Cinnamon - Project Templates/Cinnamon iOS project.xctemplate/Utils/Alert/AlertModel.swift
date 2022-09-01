//___FILEHEADER___

import UIKit

struct AlertModel {
    static func destructiveActionAlert(title: String, message: String, action: @escaping (() -> Void)) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let actionButton = UIAlertAction(title: NSLocalizedString("Common_yes", comment: ""), style: .destructive) { _ in action() }
        alert.addAction(actionButton)

        let cancelActionButton = UIAlertAction(title: NSLocalizedString("Common_cancel", comment: ""), style: .cancel)
        alert.addAction(cancelActionButton)

        return alert
    }

    static func basicAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let actionButton = UIAlertAction(title: NSLocalizedString("Common_OK", comment: ""), style: .default)
        alert.addAction(actionButton)

        return alert
    }
}
