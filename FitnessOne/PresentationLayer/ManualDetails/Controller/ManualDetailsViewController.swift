//
//  ManualDetailsViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ManualDetailsModuleOutput: class {

}

internal protocol ManualDetailsModuleInput: class {

}

internal class ManualDetailsViewController: UIViewController, ManualDetailsModuleInput, ManualDetailsViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: ManualDetailsModuleOutput?

    var moduleView: ManualDetailsView!

    // MARK: - View life cycle

    override func loadView() {
        moduleView = ManualDetailsView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - ManualDetailsViewDelegate
    
}
