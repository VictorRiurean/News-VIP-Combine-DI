//
//  String + Localization.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import UIKit

extension String {
    var localizedError: String {
        return NSLocalizedString(
            self,
            tableName: "LocalizableError",
            bundle: Bundle.main,
            value: "",
            comment: "")
    }
    
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: Bundle.main,
            value: "",
            comment: "")
    }
}
