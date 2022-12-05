// UIViewController+Alert.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let actionTitleText = "Ok"
}

/// Cоздание алерта
extension UIViewController {
    // MARK: - Public Methods

    func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.actionTitleText, style: .default))
        present(alertController, animated: true)
    }
}
