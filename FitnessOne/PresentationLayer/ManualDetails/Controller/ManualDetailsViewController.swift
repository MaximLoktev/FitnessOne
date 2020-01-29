//
//  ManualDetailsViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ManualDetailsModuleOutput: class {
    func manualDetailsModuleDidBack()
}

internal class ManualDetailsViewController: UIViewController, ManualDetailsViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: ManualDetailsModuleOutput?

    var moduleView: ManualDetailsView!
    
    var item: Manual
    
    init(item: Manual) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View life cycle

    override func loadView() {
        moduleView = ManualDetailsView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.title = item.title
        
        moduleView.setupLoad(item: item)
    }
    
    // MARK: - Actions
    @objc
    private func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.manualDetailsModuleDidBack()
    }
}
