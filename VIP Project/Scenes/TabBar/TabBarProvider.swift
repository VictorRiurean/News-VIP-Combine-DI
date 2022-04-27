//
//  TabBarProvider.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol TabBarViewModelProviderProtocol {
    func viewModel(for item: TabBarItem) -> TabBarItemViewModel
}

class TabBarViewModelProvider: TabBarViewModelProviderProtocol {

    private let articleListStoryboard: Storyboard

    init(articleListStoryboard: Storyboard) {
        self.articleListStoryboard = articleListStoryboard
    }

    func viewModel(for item: TabBarItem) -> TabBarItemViewModel {
        var storyboard: Storyboard?
        
        switch item {
            case .home, .about:
                storyboard = articleListStoryboard
        }
        
        return TabBarItemViewModel(
            icon: item.icon,
            title: item.title,
            viewController: storyboard?.initial(),
            tag: item.tag)
    }
}

