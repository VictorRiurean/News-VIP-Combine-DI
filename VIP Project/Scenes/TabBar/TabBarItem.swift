//
//  TabBarItem.swift
//  VIP Project
//
//  Created by Victor on 27/04/2022.
//

import Foundation
import UIKit

struct TabBarItemViewModel: Equatable {
    let icon: UIImage
    let title: String
    let viewController: UIViewController?
    let tag: Int
}

enum TabBarItem: Equatable, CaseIterable {
    
    case home
    case about
    
    var icon: UIImage {
        switch self {
            case .home:
                return UIImage(systemName: "house")!
            case .about:
                return UIImage(systemName: "info.circle")!
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
            case .home:
                return UIImage(systemName: "house.fill")!
            case .about:
                return UIImage(systemName: "info.circle.fill")!
        }
    }
    
    var title: String { "" }
    
    var tag: Int {
        switch self {
            case .home:
                return 0
            case .about:
                return 1
        }
    }
}
