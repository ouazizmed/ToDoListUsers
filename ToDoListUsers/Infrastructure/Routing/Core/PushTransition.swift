//
//  PushTransition.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import UIKit

class PushTransition: NSObject {

    var animator: Animator?
    var isAnimated: Bool = true
    var completionHandler: (() -> Void)?
    var swipeBack: Bool = true

    weak var viewController: UIViewController?

    init(animator: Animator? = nil, isAnimated: Bool = true, swipeBack: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
        self.swipeBack = swipeBack
    }
}

// MARK: - Transition

extension PushTransition: Transition, UIGestureRecognizerDelegate {

    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.delegate = self
        self.viewController?.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.viewController?.navigationController?.interactivePopGestureRecognizer?.isEnabled = swipeBack
        self.viewController?.navigationController?.pushViewController(viewController, animated: isAnimated)
    }

    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popViewController(animated: isAnimated)
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}

// MARK: - UINavigationControllerDelegate

extension PushTransition: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        completionHandler?()
    }

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        if operation == .push {
            animator.isPresenting = true
            return animator
        } else {
            animator.isPresenting = false
            return animator
        }
    }
}
