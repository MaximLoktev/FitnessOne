//
//  RootViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

protocol RootModuleInput: class {
    
}

class RootViewController: UINavigationController, RootModuleInput {
    
    // MARK: - Init
    
    private lazy var userPreferences: UserPreferences = UserPreferencesImpl(userDefaults: UserDefaults.standard)
    private lazy var fillUserService: FillUserService = FillUserServiceImpl()
    private lazy var localDataService: LocalDataService = LocalDataServiceImpl()
    private lazy var coreData: CoreData = CoreData()
    private lazy var userService: UserService = UserServiceImpl(coreData: coreData)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationBar.barTintColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                             .font : UIFont.systemFont(ofSize: 20.0)]
        navigationBar.isTranslucent = false
        view.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoading()
    }
    
    // MARK: - RootControllerLogic
    
    private func startLoading() {
        if userPreferences.onboardingIsShown {
            userService.isUserCreated { [weak self] isCreated in
                guard let self = self else {
                    return
                }
                if isCreated {
                    let viewController = MainController()
                    viewController.moduleOutput = self
                    self.viewControllers = [viewController]
                } else {
                    let viewController = FullNameInputController(fillUserService: self.fillUserService)
                    viewController.moduleOutput = self
                    self.viewControllers = [viewController]
                }
            }
        } else {
            let viewController = GreetingController(userPreferences: userPreferences)
            viewController.moduleOutput = self
            viewControllers = [viewController]
        }
    }
}

extension RootViewController: GreetingModuleOutput {
    
    func greetingModuleDidShowAboutMe() {
        let viewController = FullNameInputController(fillUserService: fillUserService)
        viewController.moduleOutput = self
        pushViewController(viewController, animated: true)
    }
}

extension RootViewController: FullNameInputOutput {
    
    func aboutMeModuleDidShowAboutMeTwo() {
        let viewController = BirthdayInputController(fillUserService: fillUserService)
        viewController.moduleOutput = self
        pushViewController(viewController, animated: true)
    }
}

extension RootViewController: BirthdayInputModuleOutput {
    
    func aboutMeTwoModuleDidShowAboutMeThree() {
        let viewController = ProportionsInputController(fillUserService: fillUserService,
                                                        userService: userService)
        viewController.moduleOutput = self
        pushViewController(viewController, animated: true)
    }
    
    func aboutMeTwoModuleDidShowAboutMe() {
        popViewController(animated: true)
    }
}

extension RootViewController: ProportionsInputModuleOutput {
    
    func aboutMeThreeModuleDidShowMain() {
        let viewController = MainController()
        viewController.moduleOutput = self
        setViewControllers([viewController], animated: true)
    }
    
    func aboutMeThreeModuleDidShowAboutMeTwo() {
        popViewController(animated: true)
    }
}

extension RootViewController: MainModuleOutput {
    
    func mainModuleDidShowNextScreen(screen: ScreensMenu) {
        switch screen {
        case .weight:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .progress:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .profile:
            let viewController = ProfileViewController(userService: userService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .food:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .run:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .exercises:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .manual:
            let viewController = ManualController(localDataService: localDataService)
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .support:
            let viewController = SupportViewController()
            viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        }
    }
}

extension RootViewController: ProfileModuleOutput {
    
    func profileModuleDidShowEditProfile() {
        let viewController = EditProfileViewController()
        viewController.moduleOutput = self
        pushViewController(viewController, animated: true)
    }
    
    func profileModuleDidBack() {
        popViewController(animated: true)
    }
}

extension RootViewController: EditProfileModuleOutput {
    
    func editProfileModuleDidBack() {
        popViewController(animated: true)
    }
}

extension RootViewController: ManualModuleOutput {
    
    func manualModuleDidShowSelectManual(item: Manual) {
        let viewController = ManualDetailsViewController(item: item)
        viewController.moduleOutput = self
        pushViewController(viewController, animated: true)
    }
    
    func manualModuleDidBack() {
        popViewController(animated: true)
    }
}

extension RootViewController: ManualDetailsModuleOutput {
    
    func manualDetailsModuleDidBack() {
        popViewController(animated: true)
    }
}

extension RootViewController: SupportModuleOutput {
    
    func supportModuleDidBack() {
        popViewController(animated: true)
    }
}
