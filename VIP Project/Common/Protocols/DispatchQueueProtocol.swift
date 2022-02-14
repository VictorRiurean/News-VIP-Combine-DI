//
//  DispatchQueueProtocol.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

//sourcery: AutoMockable
protocol DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void) {
        self.async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}
