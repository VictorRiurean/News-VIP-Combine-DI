//
//  ViewController.swift
//  VIP Project
//
//  Created by Victor on 21/08/2021.
//

import Foundation

//sourcery: AutoMockable
protocol RootNavigatorProtocol: AnyObject {
    func setRootViewController()
    func setTabBarAsRoot()
    func setHomeAsRoot()
}

class RootNavigator: RootNavigatorProtocol {
    
    private var application: UIApplicationProtocol
    private let articleListStoryboard: Storyboard
    private let aboutStoryboard: Storyboard
    private let tabBarStoryBoard: Storyboard
    private var onboardingStatus: OnboardingStatus = .initial
    
    enum OnboardingStatus {
        case initial
    }
    
    init(
        application: UIApplicationProtocol,
        articleListStoryboard: Storyboard,
        aboutStoryboard: Storyboard,
        tabBarStoryboard: Storyboard
    ) {
        self.application = application
        self.articleListStoryboard = articleListStoryboard
        self.aboutStoryboard = aboutStoryboard
        self.tabBarStoryBoard = tabBarStoryboard
    }
    
    func setRootViewController() {
    }
    
    func setTabBarAsRoot() {
        application.rootViewController = tabBarStoryBoard.initial()
    }
    
    func setHomeAsRoot() {
        switch onboardingStatus {
            case .initial:
                application.rootViewController = articleListStoryboard.initial()
        }
    }
}
