//
//  ProfileViewController.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol ProfileModuleOutput: class {
    func profileModuleDidBack()
    func profileModuleDidShowEditProfile()
}

internal class ProfileViewController: UIViewController, ProfileViewDelegate {

    // MARK: - Properties

    weak var moduleOutput: ProfileModuleOutput?

    var moduleView: ProfileView!
    
     private let dataManager = ProfileDataManager()
    
    private let userService: UserService
    
    // MARK: - Init
    
    init(userService: UserService) {
        self.userService = userService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View life cycle

    override func loadView() {
        moduleView = ProfileView(frame: UIScreen.main.bounds)
        moduleView.delegate = self
        view = moduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem.backBarButton(target: self, action: #selector(backButtonAction(_:)))
        let editingBarButton = UIBarButtonItem.editingBarButton(target: self, action: #selector(editingButtonAction(_:)))
        navigationItem.rightBarButtonItem = editingBarButton
        navigationItem.leftBarButtonItem = backBarButton
        navigationItem.title = "Мой профиль"
        
        setupLoad()
    }
    
    // MARK: - Setup
    
    private func setupLoad() {
        getUser { [weak self] userModel in
            guard let self = self else { return }
            let items = self.makeItems(user: userModel)
            self.dataManager.items = items
            
            self.moduleView.setupDataManager(dataManager: self.dataManager)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func editingButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.profileModuleDidShowEditProfile()
    }
    
    @objc
    private func backButtonAction(_ sender: UIBarButtonItem) {
        moduleOutput?.profileModuleDidBack()
    }
    
    private func getUser(completion: @escaping (UserModel) -> Void) {
        userService.fetchUser { result in
            switch result {
            case .success(let userModel):
                completion(userModel)
            case .failure:
                let alertController = AlertWindowController.alert(title: NSLocalizedString("Ошибка", comment: ""),
                                                                  message: NSLocalizedString("Не удалось создать аккаунт", comment: ""),
                                                                  cancel: NSLocalizedString("Ок", comment: ""))
                alertController.show()
            }
        }
    }
    
    private func makeItems(user: UserModel) -> [ProfileDataManager.Item] {
        var items: [ProfileDataManager.Item] = []
        items.append(.header(image: UIImage(data: user.photo)))
        items.append(.specifications(title: "ФИО", description: user.lastName + " " + user.name))
        //items.append(.specifications(title: "Фамилия", description: user.lastName))
        items.append(.specifications(title: "Пол", description: user.gender.rawValue))
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        items.append(.specifications(title: "Дата Рождения", description: formatter.string(from: user.birthday)))
        items.append(.specifications(title: "Навык", description: user.skill.rawValue))
        items.append(.specifications(title: "Рост", description: String(user.height)))
        items.append(.specifications(title: "Вес", description: String(user.weight)))
        
        return items
    }
}
