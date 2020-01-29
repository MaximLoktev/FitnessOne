//
//  AboutMeTwoController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol BirthdayInputModuleOutput: class {
    func aboutMeTwoModuleDidShowAboutMe()
    func aboutMeTwoModuleDidShowAboutMeThree()
}

internal class BirthdayInputController: UIViewController, BirthdayInputViewDelegate {

    // MARK: - View life cycle
    
    weak var moduleOutput: BirthdayInputModuleOutput?
    
    var moduleView: BirthdayInputView!
    
    private let fillUserService: FillUserService
    
    init(fillUserService: FillUserService) {
        self.fillUserService = fillUserService
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        moduleView = BirthdayInputView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        navigationItem.leftBarButtonItem = backBarButton
        
        let gender = fillUserService.getGender()
        let birthday = fillUserService.getBirthday()
        moduleView.setupLoad(gender: gender, birthday: birthday)
    }
    
    @objc
    func backButtonAction(_ sender: UIBarButtonItem) {
        
        moduleOutput?.aboutMeTwoModuleDidShowAboutMe()
    }
    
    func viewDidTapNextButton(_ view: BirthdayInputView, gender: Gender?, birthday: Date?) {
        
        fillUserService.setGender(gender)
        fillUserService.setBirthday(birthday)
        
        moduleOutput?.aboutMeTwoModuleDidShowAboutMeThree()
    }
}

