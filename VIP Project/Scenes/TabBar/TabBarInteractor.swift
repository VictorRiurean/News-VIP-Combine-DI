//
//  TabBarInteractor.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import UIKit
import Combine

//sourcery: AutoMockable
protocol TabBarInteractorProtocol {
    func prepareTabBar()
    func handleViewDidLoad()
}

// MARK: - DI

class TabBarInteractor: NSObject {
    
    private var presenter: TabBarPresenterProtocol
    private var tabBarProviderProtocol: TabBarViewModelProviderProtocol
    private var uiApplication: UIApplicationProtocol
    
    private var anyCancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(
        presenter: TabBarPresenterProtocol,
        tabBarProviderProtocol: TabBarViewModelProviderProtocol,
        uiApplication: UIApplicationProtocol
    ) {
        self.presenter = presenter
        self.tabBarProviderProtocol = tabBarProviderProtocol
        self.uiApplication = uiApplication
    }
}

//MARK: - Protocol

extension TabBarInteractor: TabBarInteractorProtocol {
    func prepareTabBar() {
        let items = TabBarItem.allCases.map { tabBarProviderProtocol.viewModel(for: $0) }

        presenter.presentTabBarItems(items: items)
    }

    func handleViewDidLoad() {
        prepareTabBar()
    }
}
