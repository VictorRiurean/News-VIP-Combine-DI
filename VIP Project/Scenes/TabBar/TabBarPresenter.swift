//
//  TabBarPresenter.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarPresenterProtocol {
    func set(viewController: TabBarViewControllerProtocol?)
    
    func presentTabBarItems(items: [TabBarItemViewModel])
    func handle(error: Error)
}

// MARK: - DI

class TabBarPresenter {
    private weak var viewController: TabBarViewControllerProtocol?
    
    func set(viewController: TabBarViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: - Protocol

extension  TabBarPresenter: TabBarPresenterProtocol {
    func handle(error: Error) {
        viewController?.display(error: error)
    }
    
    func presentTabBarItems(items: [TabBarItemViewModel]) {
        viewController?.setupTabbar(items: items)
    }
}

