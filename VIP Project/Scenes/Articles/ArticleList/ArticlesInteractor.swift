//
//  ArticlesInteractor.swift
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
import Combine

protocol ArticlesInteractorProtocol {
    func getArticles()
    func searchArticle(with searchText: String)
    
    var selectedArticle: Article! { get set }
}

class ArticlesInteractor: ArticlesInteractorProtocol {
    
    private let presenter: ArticlesPresenterProtocol
    private let service: ArticleServiceProtocol
    
    private var articles: [Article]?
    private var filteredArticles: [Article]?
    var selectedArticle: Article!
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - DI
    
    init(
        presenter: ArticlesPresenterProtocol,
        service: ArticleServiceProtocol
    ) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Responses
    
    func getArticles() {
//        service.articles()
//            .sink { completion in
//                switch completion {
//                    case .finished:
//                        print("Success")
//                    case .failure:
//                        print("Failure")
//                }
//            } receiveValue: { [weak self] response in
//                self?.articles = response.articles
//                self?.presenter.presentArticles(self?.articles ?? [])
//            }.store(in: &cancellables)
        let worker = ArticlesWorker()

        worker.getHousesList { [weak self] articles, error in
            guard error == nil,
                  let articles = articles else { return }

            self?.articles = articles
            self?.presenter.presentArticles(articles)
        }
    }
    
    func searchArticle(with searchText: String) {
        filteredArticles = searchText == "" ? articles
                                            : articles?.filter { $0.title?.lowercased().contains(searchText.lowercased()) ?? false }
        
        presenter.presentArticles(filteredArticles ?? [])
    }
}
