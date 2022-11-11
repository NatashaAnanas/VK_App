//
//  CustonPopAninator.swift
//  VK_App
//
//  Created by Анастасия Козлова on 11.11.2022.
//

import UIKit


/// Кастомный Pop переход
final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private enum Constant {
        static let pageOneIDText = "pageOne"
        static let pageButtonIDText = "buttonCell"
        static let segueIDText  = "segue"
    }
    
    // MARK: Public Methods
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(
            translationX: -source.view.bounds.width, y: 0
        ).concatenating(CGAffineTransform(
            scaleX: 0.7, y: 0.7
        ))
        destination.view.center = CGPoint(
            x: source.view.bounds.width / 2,
            y: source.view.center.y
        )
        
        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .calculationModePaced
        ) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                let translation = CGAffineTransform(translationX: source.view.frame.width, y: 0)
                let scale = CGAffineTransform(rotationAngle: .pi / -2)
                source.view.transform = translation.concatenating(scale)
                source.view.center = CGPoint(
                    x: source.view.bounds.width + source.view.bounds.height / 2,
                    y: source.view.bounds.width / 2
                )
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                destination.view.transform = .identity
            }
        } completion: { finish in
            if finish, !transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
                transitionContext.completeTransition(true)
            } else {
                transitionContext.completeTransition(false)
            }
        }
    }
}