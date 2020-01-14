//
//  User.swift
//  FitnessOne
//
//  Created by Максим Локтев on 06/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

enum Gender: String {
    case man = "Муж"
    case woman = "Жен"
}

enum Skill: String {
    case beginner = "Новичок"
    case lover = "Любитель"
    case profi = "Профи"
}

struct UserModel {
    let name: String
    let lastName: String
    let gender: Gender
    let birthday: Date
    let photo: Data
    let weight: Int
    let height: Int
    let skill: Skill
}
