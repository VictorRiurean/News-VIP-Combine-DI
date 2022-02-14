//
//  NWPathMonitorProtocol.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Network

//sourcery: AutoMockable
protocol NWPathMonitorProtocol {
    var pathUpdateHandler: ((NWPath) -> Void)? { get set }
    func start(queue: DispatchQueue)
}

extension NWPathMonitor: NWPathMonitorProtocol {}
