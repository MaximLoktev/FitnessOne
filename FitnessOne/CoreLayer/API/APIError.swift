//
//  APIError.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import Foundation

internal enum APIError: Error {
    case createCoreDataObjectError(Error)
    case fetchCoreDataObjectError(Error)
    case deleteCoreDataObjectsError(Error)
    case updateCoreDataObjectError(Error)
    
    case faildExtractOptionalValue
}
