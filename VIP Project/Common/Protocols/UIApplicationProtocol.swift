//
//  UIApplicationProtocol.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import UIKit

//sourcery: AutoMockable
protocol UIApplicationProtocol {

    var keyWindow: UIWindow? { get }
    var tabBarController: TabBarViewControllerProtocol? { get }
    var rootViewController: UIViewController? { get set }
    var settingsURL: URL? { get }
    var locationSettingsURL: URL? { get }
    func open(
        _ url: URL,
        options: [UIApplication.OpenExternalURLOptionsKey: Any],
        completionHandler completion: ((Bool) -> Void)?
    )
    func canOpenURL(_ url: URL) -> Bool
    func topViewController(controller: UIViewController?) -> UIViewController?
    func registerForRemoteNotifications()
}

extension UIApplication: UIApplicationProtocol {

    var locationSettingsURL: URL? { URL(string: "prefs:root=LOCATION_SERVICES") }

    var settingsURL: URL? {
        return URL(string: UIApplication.openSettingsURLString)
    }

    var tabBarController: TabBarViewControllerProtocol? {
        guard let containerView = keyWindow?.rootViewController else {
            assertionFailure("Failed to load ContainerViewController.")
            
            return nil
        }
        
        return containerView as? TabBarViewControllerProtocol
    }
    
    var rootViewController: UIViewController? {
        get { return windows.first?.rootViewController }
        set { windows.first?.rootViewController = newValue }
    }

    func topViewController(controller: UIViewController?) -> UIViewController? {
        var base: UIViewController?
        if controller == nil {
            base = rootViewController
        } else { base = controller }

        if let navigationController = base as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(controller: presented)
        }
        return base
    }
}
