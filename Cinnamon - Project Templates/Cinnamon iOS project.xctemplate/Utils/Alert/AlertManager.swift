//___FILEHEADER___

import UIKit

enum AlertManager {
    static func presentAlert(alert: UIAlertController) {
        if let topViewController = UIViewController.topViewController {
            if (topViewController as? UIAlertController) == nil {
                topViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
