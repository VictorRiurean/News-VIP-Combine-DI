//
//  ArticleDetailsInteractor.swift
//  VIP Project
//
//  Created by Victor on 22/08/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ArticleDetailsBusinessLogic {
    func loadArticle(request: ArticleDetails.DisplayArticle.Request)
}

protocol ArticleDetailsDataStore {
    var article: Article! { get set }
}

class ArticleDetailsInteractor: ArticleDetailsBusinessLogic, ArticleDetailsDataStore {
    
    var presenter: ArticleDetailsPresentationLogic?
    var worker: ArticleDetailsWorker?
    
    var article: Article!
    
    //MARK: - Responses
    
    func loadArticle(request: ArticleDetails.DisplayArticle.Request) {
        let response = ArticleDetails.DisplayArticle.Response(article: request.article)
        presenter?.presentArticle(response: response)
    }
}
