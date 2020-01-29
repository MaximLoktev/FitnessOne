//
//  ManualController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ManualModuleOutput: class {
    func manualModuleDidShowSelectManual(item: Manual)
    func manualModuleDidBack()
}

internal class ManualController: UIViewController, ManualViewDelegate {

    // MARK: - Properties
    
    weak var moduleOutput: ManualModuleOutput?
    
    var moduleView: ManualView!
    
    private let dataManager = ManualDataManager()
    
    private let localDataService: LocalDataService
    
    init(localDataService: LocalDataService) {
        self.localDataService = localDataService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func loadView() {
        moduleView = ManualView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.title = "Справочник"
        
        let manuals = localDataService.getManuals()
        dataManager.items = manuals
        
        moduleView.setupDataManager(dataManager: dataManager)
        dataManager.onSelectManual = { [weak self] item in
            self?.moduleOutput?.manualModuleDidShowSelectManual(item: item)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.manualModuleDidBack()
    }
}
