//
//  BirthdayInputView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 22/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol BirthdayInputViewDelegate: class {
    func viewDidTapNextButton(_ view: BirthdayInputView, gender: Gender?, birthday: Date?)
}

internal class BirthdayInputView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: BirthdayInputViewDelegate?
   
    private let heading: UILabel = {
        let label = UILabel()
        label.text = "Расскажите о себе"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 30.0)
        label.textAlignment = .center

        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left

        return label
    }()

    private let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Муж", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Жен", at: 1, animated: true)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        segmentedControl.selectedSegmentTintColor = .white

        return segmentedControl
    }()

    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left

        return label
    }()
    
    private let dateTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.font = .systemFont(ofSize: 16.0)
        textField.textColor = .black
        textField.textAlignment = .left
        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
        textField.layer.cornerRadius = 8.0
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale.firstPreferredLocale
        let minAge = Calendar.current.date(byAdding: .year, value: -80, to: Date())
        let maxAgo = Calendar.current.date(byAdding: .year, value: -14, to: Date())
        datePicker.minimumDate = minAge
        datePicker.maximumDate = maxAgo
        
        return datePicker
    }()
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        
        return toolBar
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
        addSubview(genderLabel)
        addSubview(genderSegmentedControl)
        addSubview(dateOfBirthLabel)
        addSubview(dateTextField)
        addSubview(nextButton)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolBar
        
        nextButton.addTarget(self, action: #selector(nextButtonAction(_:)), for: .touchUpInside)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupLoad(gender: Gender, birthday: Date?) {
        switch gender {
        case .man:
            genderSegmentedControl.selectedSegmentIndex = 0
        case .woman:
            genderSegmentedControl.selectedSegmentIndex = 1
        }

        setupDatePicker(date: birthday)
    }
    
    // MARK: - Actions

    @objc
    private func doneAction() {
        setupDatePicker(date: datePicker.date)
        endEditing(true)
    }
    
    private func setupDatePicker(date: Date?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        if let date = date {
            dateTextField.text = formatter.string(from: date)
        } else {
            dateTextField.text = formatter.string(from: datePicker.date)
        }
    }
    
    @objc
    private func nextButtonAction(_ sender: UIButton) {
        let gender: Gender
        if genderSegmentedControl.selectedSegmentIndex == 0 {
            gender = .man
        } else {
            gender = .woman
        }
        
        delegate?.viewDidTapNextButton(self, gender: gender, birthday: datePicker.date)
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        heading.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(heading.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        genderSegmentedControl.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(genderLabel.snp.bottom).offset(16.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
        dateOfBirthLabel.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        dateTextField.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(dateOfBirthLabel.snp.bottom).offset(9.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nextButton.snp.makeConstraints {make in
            make.height.equalTo(44.0)
            make.top.equalTo(dateTextField.snp.bottom).offset(40.0)
            make.left.right.equalToSuperview().inset(30.0)
        }
    }
}
