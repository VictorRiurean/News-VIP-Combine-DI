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
    private let aboutStoryboard: Storyboard

    init(
        articleListStoryboard: Storyboard,
        aboutStoryboard: Storyboard
    ) {
        self.articleListStoryboard = articleListStoryboard
        self.aboutStoryboard = aboutStoryboard
    }

    func viewModel(for item: TabBarItem) -> TabBarItemViewModel {
        var storyboard: Storyboard?
        
        switch item {
            case .home:
                storyboard = articleListStoryboard
            case .about:
                storyboard = aboutStoryboard
        }
        
        return TabBarItemViewModel(
            icon: item.icon,
            title: item.title,
            viewController: storyboard?.initial(),
            tag: item.tag)
    }
}

