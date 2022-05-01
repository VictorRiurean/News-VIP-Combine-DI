//
//  SharedAssembly.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation
import UIKit
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration
import Network

class SharedAssembly: Assembly {
    let sharedContainer = Container(defaultObjectScope: .container)
    
    // swiftlint:disable:next function_body_length
    func assemble(container: Container) {
        
        // MARK: - Root navigator
        
        container.register(RootNavigatorProtocol.self) { resolver in
            return RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                articleListStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.articleList.name),
                tabBarStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.tabBar.name)
            )
        }
        
        // MARK: - Article Service
        
        container.register(ArticleServiceProtocol.self) { resolver in
            return ArticleService(client: MoyaClient<ArticleTarget>(networkObserver: resolver ~> NetworkObserverProtocol.self))
        }
        
        // MARK: - TabBar
        
        container.register(Storyboard.self, name: R.storyboard.tabBar.name) { _ in
            return TabBarStoryboard(sharedContainer: container, assembly: TabBarAssembly())
        }
        
        // MARK: - ArticleList Storyboard
        
        container.register(Storyboard.self, name: R.storyboard.articleList.name) { _ in
            return ArticleListStoryboard(sharedContainer: container, assembly: ArticleListAssembly())
        }
        
        //MARK: - About Storyboard
        
        container.register(Storyboard.self, name: R.storyboard.about.name) { _ in
            return AboutStoryboard(sharedContainer: container, assembly: AboutAssembly())
        }
        
        // MARK: - Protocols
        
        container.register(NetworkObserverProtocol.self) { _ in NetworkObserver.shared }
        
        container.register(DispatchQueueProtocol.self) { _ in DispatchQueue.main }
        
        container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }
        
        container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)
        
        container.register(ArticleService.self) { resolver in
            return ArticleService(client: MoyaClient<ArticleTarget>(
                networkObserver: resolver ~> NetworkObserverProtocol.self)
            )
        }
        
        assembleStoryboards(container)
    }
    
    func assembleStoryboards(_ container: Container) {
        container.register(Storyboard.self, name: R.storyboard.articleList.name) { _ in
            return ArticleListStoryboard(sharedContainer: container, assembly: ArticleListAssembly())
        }
    }
}
