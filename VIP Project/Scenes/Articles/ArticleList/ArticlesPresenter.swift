//
//  ArticlesPresenter.swift
//  VIP Project
//
//  Created by Victor on 21/08/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ArticlesPresenterProtocol {
    func set(viewController: ArticlesViewControllerProtocol)
    
    func presentArticles(_ articles: [Article])
}

class ArticlesPresenter: ArticlesPresenterProtocol {
    
    // MARK: - DI
    
    private weak var viewController: ArticlesViewControllerProtocol?
    
    func set(viewController: ArticlesViewControllerProtocol) {
        self.viewController = viewController
    }
    
    //MARK: - Presenters
    
    func presentArticles(_ articles: [Article]) {
        viewController?.displayArticles(articles)
    }
}
