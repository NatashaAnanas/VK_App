// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран входа
final class LoginViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constant {
        static let loginText = "nata"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var bigScrollView: UIScrollView!
    @IBOutlet private var emailTextField: UITextField!

    // MARK: - Life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }

    // MARK: - Public Methods

    override func shouldPerformSegue(withIdentifier _: String, sender _: Any?) -> Bool {
        let login = emailTextField.text
        guard login == Constant.loginText else { return false }
        return true
    }

    // MARK: - Private Methods

    private func addObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyBoardWillShowAction(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyBoardWillHideAction(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )

        setUpAction()
    }

    private func setUpAction() {
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        bigScrollView.addGestureRecognizer(tabGesture)
    }

    private func removeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func keyBoardWillShowAction(notification: Notification) {
        guard let info = notification.userInfo as? NSDictionary,
              let keyboard = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey)
              as? NSValue else { return }

        let kbSize = keyboard.cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        bigScrollView.contentInset = contentInset
        bigScrollView.scrollIndicatorInsets = contentInset
    }

    @objc private func keyBoardWillHideAction(notification _: Notification) {
        bigScrollView.contentInset = UIEdgeInsets.zero
        bigScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    @objc private func hideKeyboardAction() {
        bigScrollView.endEditing(true)
    }
}
