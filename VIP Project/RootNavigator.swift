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
    func setLoginAsRoot()
    func setHomeAsRoot()
}

class RootNavigator: RootNavigatorProtocol {
    
    private var application: UIApplicationProtocol
    private let articleListStoryboard: Storyboard
    private var onboardingStatus: OnboardingStatus = .initial
    
    enum OnboardingStatus {
        case initial
    }
    
    init(
        application: UIApplicationProtocol,
        articleListStoryboard: Storyboard
    ) {
        self.application = application
        self.articleListStoryboard = articleListStoryboard
    }
    
    func setRootViewController() {
    }
    
    func setLoginAsRoot() {
    }
    
    func setHomeAsRoot() {
        switch onboardingStatus {
            case .initial:
                application.rootViewController = articleListStoryboard.initial()
        }
    }
}
