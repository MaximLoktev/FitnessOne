//
//  UserPreferences.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//
import Foundation

internal protocol UserPreferences {
    var onboardingIsShown: Bool { get nonmutating set }
}

private let kFNOnboardingIsShown = "FNOnboardingIsShown"

internal class UserPreferencesImpl: UserPreferences {
    
    // MARK: - Properties
    
    private let userDefaults: UserDefaults
    
    // MARK: - Init
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        
    }
    
    // MARK: - UserPreferences
    
    var onboardingIsShown: Bool {
        get {
            return userDefaults.bool(forKey: kFNOnboardingIsShown)
        }
        set {
            userDefaults.set(newValue, forKey: kFNOnboardingIsShown)
        }
    }
    
    func invalidatePreferences() {
        userDefaults.removeObject(forKey: kFNOnboardingIsShown)
    }
}
