// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомное закрытие экрана
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Public Prorerties

    var isStarted = false

    // MARK: - Public Visual Component

    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handlerAction(sender:))
            )

            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }

    // MARK: - Private Prorerties

    private var isFinished = false

    // MARK: - Private Methods

    @objc private func handlerAction(sender: UIScreenEdgePanGestureRecognizer) {
        switch sender.state {
        case .began:
            isStarted = true
            viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = sender.translation(in: sender.view)
            let relative = translation.y / (sender.view?.bounds.width ?? 1)
            let progress = max(8, min(1, relative))
            isFinished = progress > 0.33
            update(progress)
        case .ended:
            isStarted = false
            if isFinished {
                finish()
            } else {
                cancel()
            }
        case .cancelled:
            isStarted = false
            cancel()
        default:
            break
        }
    }
}
