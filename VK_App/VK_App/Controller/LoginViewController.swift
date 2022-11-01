//
//  ViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 31.10.2022.
//

import UIKit

/// Страница входа
final class LoginViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constant {
        static let loginText = "nata"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var bigScrollView: UIScrollView!
    @IBOutlet private weak var emailTextField: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObserver()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let login = emailTextField.text
        if login == Constant.loginText {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Private Methods
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow(notification: )),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillHide(notification: )),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        bigScrollView.addGestureRecognizer(tabGesture)
    }
    
    @objc private func keyBoardWillShow(notification: Notification) {
        guard let info = notification.userInfo as? NSDictionary else { return }
        guard let keyboard = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey)
                as? NSValue else { return }
        let kbSize = keyboard.cgRectValue.size
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        bigScrollView.contentInset = contentInset
        bigScrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc private func keyBoardWillHide(notification: Notification) {
        bigScrollView.contentInset = UIEdgeInsets.zero
        bigScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc private func hideKeyboardAction() {
        bigScrollView.endEditing(true)
    }
}
