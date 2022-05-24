//
//  ArticlesService.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation
import Combine

protocol ArticleServiceProtocol {
    func articles() -> AnyPublisher<ArticleResponse, Error>
}

class ArticleService: ArticleServiceProtocol {
    
    private let client: MoyaClient<ArticleTarget>
    
    init(client: MoyaClient<ArticleTarget>) {
        self.client = client
    }
    
    func articles() -> AnyPublisher<ArticleResponse, Error> {
        return client
            .request(.everything)
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
