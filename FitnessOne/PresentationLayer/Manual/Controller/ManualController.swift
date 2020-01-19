//
//  ManualController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal class ManualController: UIViewController, ManualViewDelegate {

    // MARK: - Properties
    
    var moduleView: ManualView!
    private let dataManager = ManualDataManager()
    
    // MARK: - View life cycle
    
    override func loadView() {
        moduleView = ManualView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moduleView.setupDataManager(dataManager: dataManager)
    }
}
