//
//  ArticlesWorker.swift
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
import Moya

class ArticlesWorker {
    func getHousesList(callback: @escaping ([Article]?, Error?) -> Void) {
        let provider = MoyaProvider<APIService>()
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
