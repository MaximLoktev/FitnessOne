//
//  EditProfileViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 26/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol EditProfileModuleOutput: class {
    func editProfileModuleDidBack()
}

internal class EditProfileViewController: UIViewController, EditProfileViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: EditProfileModuleOutput?

    var moduleView: EditProfileView!

    // MARK: - View life cycle

    override func loadView() {
        moduleView = EditProfileView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        let editingBarButton = UIBarButtonItem.editingBarButton(target: self, action: #selector(editingButtonAction(_:)))
        //editingBarButton.image = UIImage(named: "checked")
        navigationItem.rightBarButtonItem = editingBarButton
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.title = "Редактирование профиля"
    }

    // MARK: - Actions
    
    @objc
    private func editingButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    @objc
    private func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.editProfileModuleDidBack()
    }
    
}
