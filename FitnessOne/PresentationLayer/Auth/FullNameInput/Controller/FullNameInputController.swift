//
//  AboutMeController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 17/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol FullNameInputOutput: class {
    func aboutMeModuleDidShowAboutMeTwo()
}

internal class FullNameInputController: UIViewController, FullNameInputViewDelegate {

    // MARK: - View life cycle
    
    weak var moduleOutput: FullNameInputOutput?
    
    var moduleView: FullNameInputView!
    
    private let fillUserService: FillUserService
    
    init(fillUserService: FillUserService) {
        self.fillUserService = fillUserService
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        moduleView = FullNameInputView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func viewDidTapNextButton(_ view: FullNameInputView, name: String?, lastName: String?) {
        
        fillUserService.setFullName(name: name, lastName: lastName)
        
        moduleOutput?.aboutMeModuleDidShowAboutMeTwo()
    }
}
