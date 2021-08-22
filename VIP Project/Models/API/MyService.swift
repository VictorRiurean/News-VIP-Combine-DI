//
//  MyService.swift
//  VIP Project
//
//  Created by Victor on 21/08/2021.
//

import Foundation
import Moya

enum APIService {
    case everything
}

// MARK: - TargetType Protocol Implementation

extension APIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .everything:
            return "/everything"
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .everything:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .everything:
            return .requestParameters(parameters: [ "q": "Apple"], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json",
                "x-api-key": "012e69e373074078a5baf09443871cf7"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
