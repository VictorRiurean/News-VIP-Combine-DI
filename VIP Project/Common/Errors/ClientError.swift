//
//  ClientError.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

enum ClientError: AppError {
    case unknownError
    case literal(errorMessage: String)
    
    var title: String { "oops".localizedError }
    var description: String {
        switch self {
            case .unknownError:
                return "unknown_error".localizedError
            case .literal(let errorMessage):
                return errorMessage
        }
    }
}
