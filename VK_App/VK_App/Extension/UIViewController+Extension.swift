// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вызов алерта из любого UIViewController
private enum Constant {
    static let okTextString = "OK"
}

extension UIViewController {
    typealias Closure = ((String?) -> ())?

    // MARK: - Вызов Alert

    func showAlert(title: String?, message: String, handler: Closure) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: Constant.okTextString, style: .default) { _ in
            guard let groupName = alertController.textFields?.first?.text else { return }
            handler?(groupName)
        }

        alertController.addTextField()
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }

    // MARK: - Конвертатор date

    func convert(timeStamp: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date as Date)
        return String(localDate)
    }
}
