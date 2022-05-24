//
//  ArticlesWorker.swift
//  VIP Project
//
//  Created by Victor on 24/05/2022.
//

import UIKit
import Moya

class ArticlesWorker {
    func getHousesList(callback: @escaping ([Article]?, Error?) -> Void) {
        let provider = MoyaProvider<ArticleTarget>()
        
        provider.request(.everything) { result in
            switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                
                    if let articleResponse = try? decoder.decode(ArticleResponse.self, from: data) {
                        let articles = articleResponse.articles
                        callback(articles, nil)
                    }
                case let .failure(error):
                    callback(nil, error)
                }
        }
    }
}
