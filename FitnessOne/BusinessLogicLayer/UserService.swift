//
//  UserService.swift
//  FitnessOne
//
//  Created by Максим Локтев on 11/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import Foundation

protocol UserService {
    func createUser(user: UserModel, completion: @escaping (Result<UserModel, APIError>) -> Void)
    func fetchUser(completion: @escaping (Result<UserModel, APIError>) -> Void)
    func isUserCreated(completion: @escaping (Bool) -> Void)
}

class UserServiceImpl: UserService {
    
    private let coreData: CoreData
    
    init(coreData: CoreData) {
        self.coreData = coreData
    }
    
    func createUser(user: UserModel, completion: @escaping (Result<UserModel, APIError>) -> Void) {
        let newUser = User(context: coreData.context)
        newUser.name = user.name
        newUser.lastName = user.lastName
        newUser.gender = user.gender.rawValue
        newUser.date = user.birthday
        newUser.weight = Int16(user.weight)
        newUser.height = Int16(user.height)
        newUser.skills = user.skill.rawValue
        newUser.image = user.photo
        
        do {
            try coreData.context.save()
            completion(.success(user))
        } catch let error {
            completion(.failure(.createCoreDataObjectError(error)))
        }
    }
    
    func fetchUser(completion: @escaping (Result<UserModel, APIError>) -> Void) {
        coreData.fetchObject(entity: User.self, context: coreData.context) { result in
            switch result {
            case .success(let user):
                guard let user = mapUser(user: user) else {
                    completion(.failure(.faildExtractOptionalValue))
                    return
                }
                
                completion(.success(user))
            case .failure(let error):
                completion(.failure(.fetchCoreDataObjectError(error)))
            }
        }
    }
    
    func isUserCreated(completion: @escaping (Bool) -> Void) {
        coreData.fetchObject(entity: User.self, context: coreData.context) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
    
    private func mapUser(user: User) -> UserModel? {
        guard
            let gender = mapGender(gender: user.gender ?? ""),
            let skill = mapSkill(skill: user.skills ?? "")
        else {
            return nil
        }
        #warning("Выяснить про опциональность моделей CoreData")
        return UserModel(name: user.name ?? "",
                         lastName: user.lastName ?? "",
                         gender: gender,
                         birthday: user.date ?? Date(),
                         photo: user.image ?? Data(),
                         weight: Int(user.weight),
                         height: Int(user.height),
                         skill: skill)
    }
    
    private func mapGender(gender: String) -> Gender? {
        switch gender {
        case "Муж":
            return .man
        case "Жен":
            return .woman
        default:
            return nil
        }
    }
    
    private func mapSkill(skill: String) -> Skill? {
        switch skill {
        case "Новичок":
            return .beginner
        case "Любитель":
            return .lover
        case "Профи":
            return .profi
        default:
            return nil
        }
    }
}
