//
//  TabBarAssembly.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import Swinject
import SwinjectAutoregistration
import Moya

class TabBarAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - TabBar DI
        
        container.autoregister(TabBarInteractorProtocol.self,
                               initializer: TabBarInteractor.init)
        container.autoregister(TabBarPresenterProtocol.self,
                               initializer: TabBarPresenter.init)
        container.autoregister(TabBarRouterProtocol.self,
                               initializer: TabBarRouter.init)
        
        container.storyboardInitCompleted(TabBarViewController.self) { (r, vc) in
            let presenter = r ~> (TabBarPresenterProtocol.self)
            let interactor =  r ~> (TabBarInteractorProtocol.self)
            let router =  r ~> (TabBarRouterProtocol.self)

            presenter.set(viewController: vc)
            router.set(viewController: vc)
            
            vc.set(interactor: interactor)
            vc.set(router: router)
        }

        // MARK: - TabBar ViewModel Provider
        
        container.register(TabBarViewModelProviderProtocol.self) { resolver in
            return TabBarViewModelProvider(articleListStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.articleList.name))
        }
    }
}

