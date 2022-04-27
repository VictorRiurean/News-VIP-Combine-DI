//
//  SceneDelegate.swift
//  VIP Project
//
//  Created by Victor on 21/08/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

//sourcery: AutoMockable
protocol BaseAppProtocol {
    func prepare()
}

class BaseApp: BaseAppProtocol {
    
    let sharedAssembly: SharedAssembly
    let sharedContainer = Container()
    
    private let rootNavigator: RootNavigatorProtocol
    private let application: UIApplicationProtocol
    private let dispatchQueue: DispatchQueueProtocol
    private let networkObserver: NetworkObserverProtocol

    init() {
        self.sharedAssembly = SharedAssembly()
        sharedAssembly.assemble(container: sharedContainer)
        self.rootNavigator = sharedContainer ~> (RootNavigatorProtocol.self)
        self.application = sharedContainer ~> (UIApplicationProtocol.self)
        self.dispatchQueue = sharedContainer ~> (DispatchQueueProtocol.self)
        self.networkObserver = sharedContainer ~> (NetworkObserverProtocol.self)
    }
    
    func prepare() {
        rootNavigator.setTabBarAsRoot()
        networkObserver.startMonitoringNetwork()
    }
}

