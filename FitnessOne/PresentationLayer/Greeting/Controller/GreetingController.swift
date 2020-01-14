//
//  GreetingController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol GreetingModuleOutput: class {
    func greetingModuleDidShowAboutMe()
}

internal class GreetingController: UIViewController, GreetingViewDelegate {

    // MARK: - View life cycle
    
    weak var moduleOutput: GreetingModuleOutput?
    
    var moduleView: GreetingView!
    
    private let dataManager = GreetingDataManager()
    
    private let userPreferences: UserPreferences
    
    init(userPreferences: UserPreferences) {
        self.userPreferences = userPreferences
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        moduleView = GreetingView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
               
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        dataManager.onPageSelected = { [weak self] page, title in
            self?.moduleView.setupPage(with: page, title: title)
        }
        
        moduleView.setupDataManager(dataManager: dataManager)
    }
    
    func viewDidTapNextButton(_ view: GreetingView) {
        let page = dataManager.setupNewPage()
        view.setupNewPage(page: page.index)
        
        if page.isLast {
            userPreferences.onboardingIsShown = true
            moduleOutput?.greetingModuleDidShowAboutMe()
        }
    }
}
