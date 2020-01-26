//
//  SupportViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 23/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol SupportModuleOutput: class {

}

internal protocol SupportModuleInput: class {

}

internal class SupportViewController: UIViewController, SupportModuleInput, SupportViewDelegate {

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
    }

    // MARK: - SupportViewDelegate
    
}
