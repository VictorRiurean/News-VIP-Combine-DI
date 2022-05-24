//
//  TabBarRouter.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarRouterProtocol {
    func set(viewController: TabBarViewControllerProtocol?)
    func route(to scene: TabBarRouter.Scene)
}

//MARK: - DI

class TabBarRouter: NSObject, TabBarRouterProtocol {
    
    private weak var viewController: TabBarViewControllerProtocol?

    func set(viewController: TabBarViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: - Routing logic

extension TabBarRouter {
    
    enum Scene {
        case home
    }
    
    func route(to scene: TabBarRouter.Scene) {
        switch scene {
            case .home:
                break
        }
    }
}


