//
//  ArticleListAssembly.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Swinject
import SwinjectAutoregistration

class ArticleListAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: - List
        
        container.autoregister(ArticlesPresenterProtocol.self, initializer: ArticlesPresenter.init)
        container.autoregister(ArticlesInteractorProtocol.self, initializer: ArticlesInteractor.init)
        container.register(ArticlesRouterProtocol.self) { resolver in
            return ArticlesRouter(articleDetailsStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.articleList.name))
        }
        
        container.storyboardInitCompleted(ArticlesViewController.self) { resolver, vc in
            let interactor = resolver ~> (ArticlesInteractorProtocol.self)
            let presenter = resolver ~> (ArticlesPresenterProtocol.self)
            let router = resolver ~> (ArticlesRouterProtocol.self)
            
            presenter.set(viewController: vc)
            router.set(viewController: vc)
            vc.setupDI(interactor: interactor, router: router)
        }
        
        //MARK: - Details
        
        container.autoregister(ArticleDetailsPresenterProtocol.self, initializer: ArticleDetailsPresenter.init)
        container.autoregister(ArticleDetailsInteractorProtocol.self, initializer: ArticleDetailsInteractor.init)
        container.autoregister(ArticleDetailsRouterProtocol.self, initializer: ArticleDetailsRouter.init)
        
        container.storyboardInitCompleted(ArticleDetailsViewController.self) { resolver, vc in
            let interactor = resolver ~> (ArticleDetailsInteractorProtocol.self)
            let presenter = resolver ~> (ArticleDetailsPresenterProtocol.self)
            let router = resolver ~> (ArticleDetailsRouterProtocol.self)
            
            presenter.set(viewController: vc)
            router.set(viewController: vc)
            vc.setupDI(interactor: interactor, router: router)
        }
        
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
