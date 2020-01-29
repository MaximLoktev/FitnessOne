//
//  SupportView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 23/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol SupportViewDelegate: class {

}

internal class SupportView: UIView {

    // MARK: - Properties

    weak var delegate: SupportViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Что тебе нужно от нас?"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let mailTextFild: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 17.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.placeholder = "Email"
        
        return textField
    }()
    
    private let descriptionTextFild: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 17.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(0, -40, 0)
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.placeholder = "Текст сообщения"
        
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        addSubview(titleLabel)
        addSubview(mailTextFild)
        addSubview(descriptionTextFild)
        addSubview(sendButton)
        
        makeConstraints()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
       
       func setupLoad() {
           
       }
       
       // MARK: - Actions
       
       // MARK: - Layout
       
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        mailTextFild.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        descriptionTextFild.snp.makeConstraints { make in
            make.height.equalTo(120.0)
            make.top.equalTo(mailTextFild.snp.bottom).offset(16.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        sendButton.snp.makeConstraints {make in
            make.height.equalTo(44.0)
            make.top.equalTo(descriptionTextFild.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
    }
}
