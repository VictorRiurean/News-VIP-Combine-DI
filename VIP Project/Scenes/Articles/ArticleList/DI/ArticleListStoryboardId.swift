//
//  ArticleListStoryboardId.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

enum ArticleListStoryboardId: StoryboardId {
    case overview
    case detail
    case about
    
    var identifier: String {
        switch self {
            case .overview:
                return "ArticleListViewController"
            case .detail:
                return "ArticleDetailsViewController"
            case .about:
                return "AboutViewController"
        }
    }
}
