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

//init(
//    rootNavigator: RootNavigatorProtocol,
//    application: UIApplicationProtocol,
//    dispatchQueue: DispatchQueueProtocol,
//    networkObserver: NetworkObserverProtocol) {
//    self.rootNavigator = rootNavigator
//    self.application = application
//    self.dispatchQueue = dispatchQueue
//    self.networkObserver = networkObserver
//}
    init() {
        self.sharedAssembly = SharedAssembly()
        sharedAssembly.assemble(container: sharedContainer)
        self.rootNavigator = sharedContainer ~> (RootNavigatorProtocol.self)
        self.application = sharedContainer ~> (UIApplicationProtocol.self)
        self.dispatchQueue = sharedContainer ~> (DispatchQueueProtocol.self)
        self.networkObserver = sharedContainer ~> (NetworkObserverProtocol.self)
    }

//convenience init(sharedAssembly: Assembly, sharedContainer: Container) {
//    sharedAssembly.assemble(container: sharedContainer)
//    self.init(
//        rootNavigator: sharedContainer ~> RootNavigatorProtocol.self,
//        application: sharedContainer ~> UIApplicationProtocol.self,
//        dispatchQueue: sharedContainer ~> DispatchQueueProtocol.self,
//        networkObserver: sharedContainer ~> NetworkObserverProtocol.self)
//}
//    convenience override init() {
//        let sharedAssembly = SharedAssembly()
//        self.init(
//            sharedAssembly: sharedAssembly,
//            sharedContainer: sharedAssembly.sharedContainer)
//    }

    func prepare() {
        rootNavigator.setHomeAsRoot()
        networkObserver.startMonitoringNetwork()
    }
}

