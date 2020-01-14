//
//  Locale+Extension.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import Foundation

extension Locale {
    
    static var firstPreferredLocale: Locale {
        let languageId = Locale.preferredLanguages.first ?? ""
        return Locale(identifier: languageId)
    }
}
