//
//  SupportViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 23/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol SupportModuleOutput: class {
    func supportModuleDidBack()
}

internal class SupportViewController: UIViewController, SupportViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: SupportModuleOutput?

    var moduleView: SupportView!

    // MARK: - View life cycle

    override func loadView() {
        moduleView = SupportView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.title = "Поддержка"
    }
    
    // MARK: - Actions
    @objc
    private func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.supportModuleDidBack()
    }
}


