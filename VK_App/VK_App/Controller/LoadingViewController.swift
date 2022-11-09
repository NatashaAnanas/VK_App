// LoadingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран загрузки
final class LoadingViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let mainText = "Main"
        static let loginIDText = "loginVC"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var vkImageView: UIImageView!
    @IBOutlet private var helloLabel: UILabel!
    @IBOutlet private var oneView: UIView!
    @IBOutlet private var twoView: UIView!
    @IBOutlet private var threeView: UIView!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createAnimated()
        goToNextVC()
    }

    // MARK: - Private Methods

    private func goToNextVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            guard
                let loginVC = UIStoryboard(
                    name: Constants.mainText,
                    bundle: nil
                ).instantiateViewController(withIdentifier: Constants.loginIDText)
                    as? LoginViewController
            else {
                return
            }
            
            loginVC.modalPresentationStyle = .fullScreen
            loginVC.modalTransitionStyle = .crossDissolve
            
            self.present(loginVC, animated: true)
        }
    }

    private func createAnimated() {
        UIView.animate(withDuration: 0.7) {
            self.oneView.alpha += 1
        }

        UIView.animate(withDuration: 1.5) {
            self.twoView.alpha += 1
        }

        UIView.animate(withDuration: 2.6) {
            self.threeView.alpha += 1
            self.helloLabel.alpha += 1
            self.helloLabel.frame.origin.y -= 300
        }
    }
}
