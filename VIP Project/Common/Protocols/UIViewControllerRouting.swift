//
//  UIViewControllerRouting.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import UIKit

//sourcery: AutoMockable
protocol UIViewControllerRouting: AnyObject {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func show(_ vc: UIViewController, sender: Any?)
    func pop(animated: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    /// Rearranges the view controllers stack and presents the top view controller of the stack.
    /// - Parameter removeLast: Number of view controllers to be removed from the top of the stack.
    /// - Parameter append: View controller that should be added on top of the stack and transitioned to.
    func replace(removeLast: Int, append: UIViewController)

    func addChild(_ childController: UIViewController)
    func unwind(_ to: String)
    func popToRoot(animated: Bool)
}

protocol UINavigationControllerRouting: AnyObject {
    func popViewController(animated: Bool) -> UIViewController?
    func show(_ vc: UIViewController, sender: Any?)
}

extension UIViewController: UIViewControllerRouting {
    func unwind(_ destination: String) {
        performSegue(withIdentifier: destination, sender: self)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    func replace(removeLast: Int, append: UIViewController) {
        guard var viewControllers = self.navigationController?.viewControllers else { return }
        viewControllers.removeLast(removeLast)
        viewControllers.append(append)
        self.navigationController?.setViewControllers(viewControllers, animated: true)
    }

    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
