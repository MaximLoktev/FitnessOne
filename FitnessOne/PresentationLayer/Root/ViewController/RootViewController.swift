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
    private lazy var coreData: CoreData = CoreData()
    private lazy var userService: UserService = UserServiceImpl(coreData: coreData)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
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
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .progress:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .food:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .run:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .exercises:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .manual:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        case .support:
            let viewController = ManualController()
            //viewController.moduleOutput = self
            pushViewController(viewController, animated: true)
        }
    }
}
