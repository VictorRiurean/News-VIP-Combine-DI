//
//  AboutRouter.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire

protocol AboutRouterProtocol {
    func set(viewController: AboutViewControllerProtocol)
    
    func route(to scene: AboutRouter.Scene)
}

class AboutRouter: NSObject, AboutRouterProtocol {
    
    // MARK: - DI
    
    private weak var viewController: AboutViewControllerProtocol?
    
    func set(viewController: AboutViewControllerProtocol) {
        self.viewController = viewController
    }
}

//MARK: - Routing

extension AboutRouter {
    
    enum Scene {
        case link(URL)
    }
    
    func route(to scene: AboutRouter.Scene) {
        switch scene {
            case .link(let url):
                UIApplication.shared.open(url)
        }
    }
}
