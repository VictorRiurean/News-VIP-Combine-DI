//
//  NetworkObserver.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation
import Network

protocol NetworkObserverProtocol {
    var isConnectedToInternet: Bool { get }
    func startMonitoringNetwork()
}

final class NetworkObserver: NetworkObserverProtocol {
    private(set) var isConnectedToInternet: Bool = true
    private var monitor: NWPathMonitorProtocol
    
    static let shared = NetworkObserver(monitor: NWPathMonitor())
    
    init(monitor: NWPathMonitorProtocol) {
        self.monitor = monitor
    }
    
    func startMonitoringNetwork() {
        monitor.start(queue: .init(label: "vip_network_monitor"))
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnectedToInternet = path.status == .satisfied
        }
    }
}
