//
//  MainController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol MainModuleOutput: class {
    func mainModuleDidShowNextScreen(screen: ScreensMenu)
}

internal class MainController: UIViewController, MainViewDelegate {

    // MARK: - Properties
    
    weak var moduleOutput: MainModuleOutput?
    private let dataManager = MainDataManeger()
    
    var moduleView: MainView!
    
    // MARK: - View life cycle
    
    override func loadView() {
        moduleView = MainView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Главное меню"
        
        moduleView.setupDataManager(dataManager: dataManager)
        dataManager.onSelectNextScreen = { [weak self] screen in
            self?.moduleOutput?.mainModuleDidShowNextScreen(screen: screen)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
