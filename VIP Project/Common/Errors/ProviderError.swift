//
//  ProviderError.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

enum ProviderError: AppError {
    case noInternetConnection
    
    var title: String { "oops".localizedError }
    var description: String {
        switch self {
            case .noInternetConnection:
                return "no_internet_connection_error".localizedError
        }
    }
}
