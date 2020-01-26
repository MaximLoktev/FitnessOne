//
//  ProfileViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ProfileModuleOutput: class {

}

internal protocol ProfileModuleInput: class {

}

internal class ProfileViewController: UIViewController, ProfileModuleInput, ProfileViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: ProfileModuleOutput?

    var moduleView: ProfileView!

    // MARK: - View life cycle

    override func loadView() {
        moduleView = ProfileView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - ProfileViewDelegate
    
}
