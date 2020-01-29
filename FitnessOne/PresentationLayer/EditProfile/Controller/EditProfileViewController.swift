//
//  EditProfileViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 26/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol EditProfileModuleOutput: class {

}

internal protocol EditProfileModuleInput: class {

}

internal class EditProfileViewController: UIViewController, EditProfileModuleInput, EditProfileViewDelegate {

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
    }

    // MARK: - EditProfileViewDelegate
    
}
