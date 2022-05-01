//
//  AboutStoryboardId.swift
//  VIP Project
//
//  Created by Victor on 01/05/2022.
//

import Foundation

enum AboutStoryboardId: StoryboardId {
    case about
    
    var identifier: String {
        switch self {
            case .about:
                return "AboutViewController"
        }
    }
}
