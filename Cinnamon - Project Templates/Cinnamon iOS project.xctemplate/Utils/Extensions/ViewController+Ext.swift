//___FILEHEADER___

import UIKit

extension UIViewController {
    public var topMostViewController: UIViewController {
        var viewController = self

        while let presentedViewController = viewController.presentedViewController {
            viewController = presentedViewController
        }

        if let viewController = viewController as? UINavigationController,
            let visibleViewController = viewController.visibleViewController {
            return visibleViewController.topMostViewController
        }

        if let viewController = viewController as? UITabBarController,
            let selectedViewController = viewController.selectedViewController {
            return selectedViewController.topMostViewController
        }

        if let searchController = (viewController as? UISearchController) {
            return searchController.presentingViewController ?? searchController
        }

        return viewController
    }
}

extension UIViewController {
    static var topViewController: UIViewController? {
          let scenes = UIApplication.shared.connectedScenes
          let windowScene = scenes.first as? UIWindowScene
          let window = windowScene?.windows.first

          return window?.rootViewController?.topMostViewController
      }
}
