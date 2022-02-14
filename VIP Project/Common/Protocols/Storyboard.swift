//
//  Storyboard.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation
import SwinjectStoryboard
import Swinject

//sourcery: AutoMockable
protocol StoryboardId {
    var identifier: String { get }
}

//sourcery: AutoMockable
protocol Storyboard {
    func initial<T: UIViewController>() -> T?
    func viewController<T: UIViewController>(identifier: StoryboardId) -> T?
}
