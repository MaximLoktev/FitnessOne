//
//  Menu.swift
//  FitnessOne
//
//  Created by Максим Локтев on 18/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

struct Menu {
    let name: String
    let image: String
    let screen: ScreensMenu
}

enum ScreensMenu {
    case weight
    case progress
    case profile
    case food
    case run
    case exercises
    case manual
    case support
}
