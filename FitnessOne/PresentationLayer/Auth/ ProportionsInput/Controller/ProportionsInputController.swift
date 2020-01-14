//
//  AboutMeThreeController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ProportionsInputModuleOutput: class {
    func aboutMeThreeModuleDidShowMain()
    func aboutMeThreeModuleDidShowAboutMeTwo()
}

internal class ProportionsInputController: UIViewController, ProportionsInputViewDelegate {

    // MARK: - Properties
    
    weak var moduleOutput: ProportionsInputModuleOutput?
    
    var moduleView: ProportionsInputView!
    
    private let fillUserService: FillUserService
    private let userService: UserService
    
    // MARK: - Init
    
    init(fillUserService: FillUserService, userService: UserService) {
        self.fillUserService = fillUserService
        self.userService = userService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func loadView() {
        moduleView = ProportionsInputView(frame: UIScreen.main.bounds)
        view = moduleView
        moduleView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)), imageName: "back")
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Actions
    
    @objc
    func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.aboutMeThreeModuleDidShowAboutMeTwo()
    }
    
    // MARK: - ProportionsInputViewDelegate
    
    func viewDidTapNextButton(_ view: ProportionsInputView, photo: Data?, weight: String?, height: String?, skill: Skill?) {
        
        guard let weight = weight, let height = height else {
            return
        }
        
        fillUserService.setProportionsInput(photo: photo, weight: Int(weight), height: Int(height), skill: skill)
        
        guard let user = fillUserService.getUser() else {
            return
        }
        
        userService.createUser(user: user) { [weak self] result in
            switch result {
            case .success:
                self?.moduleOutput?.aboutMeThreeModuleDidShowMain()
            case .failure:
                let alertController = AlertWindowController.alert(title: NSLocalizedString("Ошибка", comment: ""),
                                                                  message: NSLocalizedString("Не удалось создать аккаунт", comment: ""),
                                                                  cancel: NSLocalizedString("Ок", comment: ""))
                alertController.show()
            }
        }
    }

    func viewDidShowAlertPhoto(_ view: ProportionsInputView) {
        let alert = AlertWindowController.changePhotoAlert { [weak self] sourceType in
            self?.setupPicker(sourceType: sourceType)
        }
        
        parentViewController?.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ProportionsInputController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        moduleView?.setup(image: info[.editedImage] as? UIImage)
        dismiss(animated: true, completion: nil)
    }
    
    func setupPicker(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            DispatchQueue.main.async { [weak self] in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = sourceType
                imagePickerController.delegate = self
                imagePickerController.mediaTypes = ["public.image"]
                
                self?.parentViewController?.present(imagePickerController, animated: true, completion: nil)
            }
        }
    }
    
}
