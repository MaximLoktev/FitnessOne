//
//  FillUserService.swift
//  FitnessOne
//
//  Created by Максим Локтев on 06/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

protocol FillUserService {
    func setFullName(name: String?, lastName: String?)
    func setProportionsInput(photo: Data?, weight: Int?, height: Int?, skill: Skill?)
    
    func setGender(_ gender: Gender?)
    func setBirthday(_ birthday: Date?)
    
    func getName() -> String?
    func getLastName() -> String?
    
    func getGender() -> Gender
    func getBirthday() -> Date?
    
    func getPhoto() -> Data?
    func getWeight() -> Int?
    func getHeight() -> Int?
    func getSkill() -> Skill?
    
    func getUser() -> UserModel?
}

class FillUserServiceImpl: FillUserService {
    
    // MARK: - Properties
    
    private var name: String?
    private var lastName: String?
    
    private var gender: Gender?
    private var birthday: Date?
    
    private var photo: Data?
    private var weight: Int?
    private var height: Int?
    private var skill: Skill?
    
    // MARK: - SetValues
    
    func setFullName(name: String?, lastName: String?) {
        self.name = name
        self.lastName = lastName
    }
    
    func setProportionsInput(photo: Data?, weight: Int?, height: Int?, skill: Skill?) {
        self.photo = photo
        self.weight = weight
        self.height = height
        self.skill = skill
    }
    
    func setGender(_ gender: Gender?) {
        self.gender = gender
    }
    
    func setBirthday(_ birthday: Date?) {
        self.birthday = birthday
    }
    
    // MARK: - GetValues
    
    func getName() -> String? {
        return name
    }
    
    func getLastName() -> String? {
        return lastName
    }
    
    func getGender() -> Gender {
        return gender ?? .man
    }
    
    func getBirthday() -> Date? {
        return birthday
    }
    
    func getPhoto() -> Data? {
        return photo
    }
    
    func getWeight() -> Int? {
        return weight
    }
    
    func getHeight() -> Int? {
        return height
    }
    
    func getSkill() -> Skill? {
        return skill
    }
    
    func getUser() -> UserModel? {
        
        guard
            let name = name,
            let lastName = lastName,
            let gender = gender,
            let birthday = birthday,
            let photo = photo,
            let weight = weight,
            let height = height,
            let skill = skill
        else {
            return nil
        }
        
        let user = UserModel(name: name,
                             lastName: lastName,
                             gender: gender,
                             birthday: birthday,
                             photo: photo,
                             weight: weight,
                             height: height,
                             skill: skill)
        
        return user
    }
}
