//
//  ArticleListStoryboard.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Swinject
import SwinjectStoryboard

class ArticleListStoryboard: Storyboard {
    
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard
    
    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        storyboard = SwinjectStoryboard.create(name: "ArticleList",
                                               bundle: nil,
                                               container: container)
    }
    
    func initial<T>() -> T? where T : UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }
    
    func viewController<T>(identifier: StoryboardId) -> T? where T : UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}
