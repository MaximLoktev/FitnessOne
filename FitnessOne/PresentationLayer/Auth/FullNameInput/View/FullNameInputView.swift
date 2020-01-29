//
//  FullNameInputView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 17/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol FullNameInputViewDelegate: class {
    func viewDidTapNextButton(_ view: FullNameInputView, name: String?, lastName: String?)
}

internal class FullNameInputView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: FullNameInputViewDelegate?
    
    private let heading: UILabel = {
        let label = UILabel()
        label.text = "Расскажите о себе"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 30.0)
        label.textAlignment = .center

        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let nameTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 24.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let lastNameTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 24.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Не все поля заполнены"
        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        label.font = .systemFont(ofSize: 12.0)
        label.textAlignment = .left
        label.isHidden = true
        
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        addSubview(heading)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(lastNameLabel)
        addSubview(lastNameTextField)
        addSubview(warningLabel)
        addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions

    @objc
    func nextButtonAction(_ sender: UIButton) {
        let isValidData = nameTextField.text == "" || lastNameTextField.text == ""
        if !isValidData {
            delegate?.viewDidTapNextButton(self, name: nameTextField.text, lastName: lastNameTextField.text)
        }
        warningLabel.isHidden = !isValidData
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        heading.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(heading.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        lastNameTextField.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.top.equalTo(lastNameLabel.snp.bottom).offset(6.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(6.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nextButton.snp.makeConstraints {make in
            make.height.equalTo(44.0)
            make.top.equalTo(warningLabel.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
    }
}
