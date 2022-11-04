// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для создания алерта UIViewController
private enum Constant {
    static let okTextString = "OK"
}

extension UIViewController {
    typealias Closure = ((UIAlertController) -> ())?
    func showAlert(title: String?, message: String, handler: Closure) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: Constant.okTextString, style: .default) { _ in
            handler?(alertController)
        }
        alertController.addTextField()
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}
