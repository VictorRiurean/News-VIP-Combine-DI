//
//  AppError.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation

protocol AppError: Error {
    var title: String { get }
    var description: String { get }
}
