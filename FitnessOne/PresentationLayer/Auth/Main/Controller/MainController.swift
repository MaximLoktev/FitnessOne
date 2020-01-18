//
//  MainController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol MainModuleOutput: class {
    
}

internal class MainController: UIViewController, MainViewDelegate {

    // MARK: - View life cycle
    
    weak var moduleOutput: MainModuleOutput?
    private let dataManager = MainDataManeger()
    
    var moduleView: MainView!
    
    override func loadView() {
        moduleView = MainView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Главное меню"
        
        moduleView.setupDataManager(dataManager: dataManager)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
