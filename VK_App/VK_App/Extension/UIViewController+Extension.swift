//
//  UIViewController+Extension.swift
//  VK_App
//
//  Created by Анастасия Козлова on 03.11.2022.
//

import UIKit

/// Расширение для UIViewController
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
