//
//  CustomNavigationController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 11.11.2022.
//

import UIKit

/// Кастомный UINavigationController
final class CustomNavigationController: UINavigationController {
    
    // MARK: - Private Properties
    private let interactive = CustomInteractiveTransition()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate
extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            interactive.viewController = toVC
            return CustomPopAnimator()
        case .push:
            if navigationController.viewControllers.first != toVC {
                interactive.viewController = toVC
            }
            return CustomPushAnimator()
        default:
            return nil
        }
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        interactive.isStarted ? interactive : nil
    }
}
