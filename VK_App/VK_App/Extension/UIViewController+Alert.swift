// UIViewController+Alert.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let actionTitleText = "Ok"
}

/// Cоздание алерта
extension UIViewController {
    // MARK: - Public Methods

    func presentAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.actionTitleText, style: .default))
        present(alert, animated: true)
    }
}
