//
//  AboutAssembly.swift
//  VIP Project
//
//  Created by Victor on 01/05/2022.
//

import Swinject
import SwinjectAutoregistration

class AboutAssembly: Assembly {
    
    func assemble(container: Container) {
        
        //MARK: - About
        
        container.autoregister(AboutPresenterProtocol.self, initializer: AboutPresenter.init)
        container.autoregister(AboutInteractorProtocol.self, initializer: AboutInteractor.init)
        container.autoregister(AboutRouterProtocol.self, initializer: AboutRouter.init)
        
        container.storyboardInitCompleted(AboutViewController.self) { resolver, vc in
            let interactor = resolver ~> (AboutInteractorProtocol.self)
            let presenter = resolver ~> (AboutPresenterProtocol.self)
            let router = resolver ~> (AboutRouterProtocol.self)
            
            presenter.set(viewController: vc)
            router.set(viewController: vc)
            vc.setupDI(interactor: interactor, router: router)
        }
    }
}
