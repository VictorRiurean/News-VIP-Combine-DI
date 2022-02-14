//
//  TopViewControllerProviderProtocol.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

//sourcery: AutoMockable
protocol TopViewControllerProviderProtocol {
    func topViewController() -> UIViewControllerRouting?
}

class TopViewControllerProvider: TopViewControllerProviderProtocol {
    
    private let application: UIApplicationProtocol
    
    init(application: UIApplicationProtocol) {
        self.application = application
    }
    
    func topViewController() -> UIViewControllerRouting? {
        return application.topViewController(controller: nil)
    }
}
