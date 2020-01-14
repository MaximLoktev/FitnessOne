//
//  MainController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol MainModuleOutput: class {
    func aboutMeModuleDidShowAboutMeTwo()
}

internal class MainController: UIViewController, MainViewDelegate {

    // MARK: - View life cycle
    
    weak var moduleOutput: MainModuleOutput?
    
    var moduleView: MainView!
    
    private let fillUserService: FillUserService
    
    init(fillUserService: FillUserService) {
        self.fillUserService = fillUserService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        moduleView = MainView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
        
        let user = fillUserService.getUser()
        
        moduleView.setupLoad(user: user)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func viewDidTapNextButton(_ view: MainView) {
        
        moduleOutput?.aboutMeModuleDidShowAboutMeTwo()
    }
}
