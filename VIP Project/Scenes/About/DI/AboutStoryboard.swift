//
//  AboutStoryboard.swift
//  VIP Project
//
//  Created by Victor on 01/05/2022.
//

import Swinject
import SwinjectStoryboard

class AboutStoryboard: Storyboard {
    
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard
    
    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.about.name,
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
