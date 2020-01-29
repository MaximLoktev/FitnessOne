//
//  ProportionsInputView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol ProportionsInputViewDelegate: class {
    func viewDidTapNextButton(_ view: ProportionsInputView, photo: Data?, weight: String?, height: String?, skill: Skill?)
    func viewDidShowAlertPhoto(_ view: ProportionsInputView)
}

internal class ProportionsInputView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ProportionsInputViewDelegate?
    
    private let picker = InsetPickerView()
    
    private let heading: UILabel = {
        let label = UILabel()
        label.text = "Расскажите о себе"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 30.0)
        label.textAlignment = .center

        return label
    }()
    
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Вес:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left

        return label
    }()
    
    private let weightTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 24.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Рост:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left

        return label
    }()
    
    private let heightTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 24.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 4.0
        textField.clearButtonMode = .always
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private let skillTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 16.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 8.0
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
    
        return toolBar
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
        addSubview(photoImageView)
        addSubview(weightLabel)
        addSubview(weightTextField)
        addSubview(heightLabel)
        addSubview(heightTextField)
        addSubview(warningLabel)
        addSubview(skillTextField)
        addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)
        
        let tapGesureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoTapGestureAction(_:)))
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(tapGesureRecognizer)
        
        skillTextField.inputView = picker
        skillTextField.inputAccessoryView = toolBar
        skillTextField.text = picker.skillLvl.rawValue
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setup(image: UIImage?) {
        photoImageView.image = image
    }
    
    // MARK: - Actions

    @objc
    func photoTapGestureAction(_ sender: UITapGestureRecognizer) {
        delegate?.viewDidShowAlertPhoto(self)
    }
    
    @objc
    func doneAction() {
        skillTextField.text = picker.skillLvl.rawValue
        endEditing(true)
    }
    
    @objc
    func nextButtonAction(_ sender: UIButton) {
        let isValidData = weightTextField.text == "" || heightTextField.text == ""
        if !isValidData {
            let photo = photoImageView.image?.pngData()
            delegate?.viewDidTapNextButton(self, photo: photo, weight: weightTextField.text,
                                           height: heightTextField.text, skill: picker.skillLvl)
        }
        warningLabel.isHidden = !isValidData
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        heading.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        photoImageView.snp.makeConstraints { make in
            make.height.equalTo(160.0)
            make.width.equalTo(150.0)
            make.top.equalTo(heading.snp.bottom).offset(35.0)
            make.left.equalToSuperview().inset(35.0)
        }
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heading.snp.bottom).offset(24.0)
            make.left.equalTo(photoImageView.snp.right).offset(35.0)
        }
        weightTextField.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.width.equalTo(80)
            make.top.equalTo(weightLabel.snp.bottom).offset(6.0)
            make.left.equalTo(photoImageView.snp.right).offset(35.0)
        }
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(24.0)
            make.left.equalTo(photoImageView.snp.right).offset(35.0)
        }
        heightTextField.snp.makeConstraints { make in
            make.height.equalTo(44.0)
            make.width.equalTo(80)
            make.top.equalTo(heightLabel.snp.bottom).offset(6.0)
            make.left.equalTo(photoImageView.snp.right).offset(35.0)
        }
        skillTextField.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(heightTextField.snp.bottom).offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(skillTextField.snp.bottom).offset(6.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nextButton.snp.makeConstraints {make in
            make.height.equalTo(44.0)
            make.top.equalTo(warningLabel.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
    }
}
