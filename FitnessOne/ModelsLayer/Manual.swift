//
//  Manual.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

struct ManualList: Codable {
    let manuals: [Manual]
}

struct Manual: Codable {
    let image: String
    let title: String
    let description: String
}
