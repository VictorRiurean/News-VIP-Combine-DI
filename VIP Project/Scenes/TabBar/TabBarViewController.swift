//
//  TabBarViewController.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import UIKit
import StoreKit

//sourcery: AutoMockable
protocol TabBarViewControllerProtocol: UIViewControllerRouting {
    func set(interactor: TabBarInteractorProtocol)
    func set(router: TabBarRouterProtocol)
    
    func display(error: Error)
    func setupTabbar(items: [TabBarItemViewModel])
    func select(index: Int)
    
    var viewControllers: [UIViewController]? { get }
}

class TabBarViewController: UITabBarController {
    
    // MARK: DI
    
    private var interactor: TabBarInteractorProtocol?
    private var router: TabBarRouterProtocol?
    
    func set(interactor: TabBarInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(router: TabBarRouterProtocol) {
        self.router = router
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handleViewDidLoad()
    }
}

// MARK: - Protocol

extension TabBarViewController: TabBarViewControllerProtocol {
    func select(index: Int) {
        selectedIndex = index
    }
    
    func display(error: Error) {}
    
    func getViewController(at index: Int) -> UIViewController? {
        guard index - 1 <= viewControllers?.count ?? 0 else { return nil }
        return viewControllers?[index]
    }
    
    func setupTabbar(items: [TabBarItemViewModel]) {
        viewControllers = items.map {
            guard let vc = $0.viewController else {
                assertionFailure()
                
                return UIViewController()
            }
            
            let tabBarItem = UITabBarItem(title: $0.title, image: $0.icon, tag: $0.tag)
            
            vc.tabBarItem = tabBarItem
            
            return vc
        }
    }
}


