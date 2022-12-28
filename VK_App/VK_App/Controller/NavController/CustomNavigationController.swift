// CustomNavigationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный UINavigationController
final class CustomNavigationController: UINavigationController {
    // MARK: - Private Properties

    private let interactive = CustomInteractiveTransition()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
    }

    // MARK: - Private Methods

    private func setupDelegate() {
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
