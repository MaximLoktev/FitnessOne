//
//  EditProfileView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 26/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

internal protocol EditProfileViewDelegate: class {

}

internal class EditProfileView: UIView {

    // MARK: - Properties

    weak var delegate: EditProfileViewDelegate?
    
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
        label.text = "Абдоминальное ожирение – это наиболее распространённая, но в то же время самая опасная разновидность избыточного веса. Стоит отметить, что недуг наиболее часто поражает представителей мужского пола, а у женщин развивается относительно редко. Послужить источником болезни может как неправильный образ жизни, так и причины, имеющие под собой патологическую основу. Помимо этого, не исключается влияние генетической предрасположенности. \n\nАбдоминальное ожирение – это вид ожирения, при котором жировая ткань откладывается только или преимущественно в области живота (талии) и вокруг внутренних органов. Термин «абдоминальный» (от латинского слова «abdomen» – живот) означает брюшной, то есть указывает на то, что жир откладывается в животе. Жир, который откладывается при абдоминальном ожирении, называется висцеральным (висцеральный – относящийся к внутренним органам), поэтому второе название данного типа ожирения – «висцеральное ожирение». \n\nПричины Данный недуг распространен в развитых странах, при этом было отмечено, что чем выше уровень жизни человека, тем больше он подвержен ожирению вообще и абдоминальному ожирению в частности. В плане влияния на здоровье обычное внешнее ожирение не несет серьезной опасности, это больше эстетическое несовершенство. Абдоминальное ожирение же является угрозой для здоровья человека. По этиологическому признаку ожирение бывает алиментарно-конституциональным и симптоматическим. Первый вариант встречается гораздо чаще, обусловлен наследственностью и образом жизни человека. По клиническому опыту врачей, набор лишнего веса на базе эндокринной и иной патологии – менее распространенное явление."
        label.textColor = #colorLiteral(red: 0.6341645316, green: 0.6341645316, blue: 0.6341645316, alpha: 1)
        label.font = UIFont(name: "PTSerif-Regular", size: 17.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
//
//    private let nameTextField: InsetTextField = {
//        let textField = InsetTextField()
//        textField.font = .systemFont(ofSize: 24.0)
//        textField.textColor = .black
//        textField.textAlignment = .left
//        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
//        textField.layer.cornerRadius = 4.0
//        textField.clearButtonMode = .always
//        textField.autocorrectionType = .no
//
//        return textField
//    }()
//
//    private let lastNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Фамилия:"
//        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
//        label.font = .systemFont(ofSize: 18.0)
//        label.textAlignment = .left
//
//        return label
//    }()
//
//    private let lastNameTextField: InsetTextField = {
//        let textField = InsetTextField()
//        textField.font = .systemFont(ofSize: 24.0)
//        textField.textColor = .black
//        textField.textAlignment = .left
//        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
//        textField.layer.cornerRadius = 4.0
//        textField.clearButtonMode = .always
//        textField.autocorrectionType = .no
//
//        return textField
//    }()
//
//    private let warningLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Не все поля заполнены"
//        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//        label.font = .systemFont(ofSize: 12.0)
//        label.textAlignment = .left
//        label.isHidden = true
//
//        return label
//    }()
//
//    private let genderLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Пол:"
//        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
//        label.font = .systemFont(ofSize: 18.0)
//        label.textAlignment = .left
//
//        return label
//    }()
//
//    private let genderSegmentedControl: UISegmentedControl = {
//        let segmentedControl = UISegmentedControl()
//        segmentedControl.insertSegment(withTitle: "Муж", at: 0, animated: true)
//        segmentedControl.insertSegment(withTitle: "Жен", at: 1, animated: true)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        segmentedControl.selectedSegmentTintColor = .white
//
//        return segmentedControl
//    }()
//
//    private let dateOfBirthLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Дата рождения:"
//        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
//        label.font = .systemFont(ofSize: 18.0)
//        label.textAlignment = .left
//
//        return label
//    }()
//
//    private let dateTextField: InsetTextField = {
//        let textField = InsetTextField()
//        textField.font = .systemFont(ofSize: 16.0)
//        textField.textColor = .black
//        textField.textAlignment = .left
//        textField.backgroundColor = #colorLiteral(red: 0.9085735342, green: 0.9085735342, blue: 0.9085735342, alpha: 1)
//        textField.layer.cornerRadius = 8.0
//        textField.clearButtonMode = .always
//
//        return textField
//    }()
//
//    private let datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.locale = Locale.firstPreferredLocale
//        let minAge = Calendar.current.date(byAdding: .year, value: -80, to: Date())
//        let maxAgo = Calendar.current.date(byAdding: .year, value: -14, to: Date())
//        datePicker.minimumDate = minAge
//        datePicker.maximumDate = maxAgo
//
//        return datePicker
//    }()
//
//    private let toolBar: UIToolbar = {
//        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        toolBar.setItems([flexSpace, doneButton], animated: true)
//
//        return toolBar
//    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(heading)
        addSubview(nameLabel)
//        addSubview(nameTextField)
//        addSubview(lastNameLabel)
//        addSubview(lastNameTextField)
//        addSubview(warningLabel)
//        addSubview(genderLabel)
//        addSubview(genderSegmentedControl)
//        addSubview(dateOfBirthLabel)
//        addSubview(dateTextField)
//
//        dateTextField.inputView = datePicker
//        dateTextField.inputAccessoryView = toolBar
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupLoad(gender: Gender, birthday: Date?) {
//        switch gender {
//        case .man:
//            genderSegmentedControl.selectedSegmentIndex = 0
//        case .woman:
//            genderSegmentedControl.selectedSegmentIndex = 1
//        }
//
//        setupDatePicker(date: birthday)
    }
    
    // MARK: - Actions
    
//    @objc
//    private func doneAction() {
//        setupDatePicker(date: datePicker.date)
//        endEditing(true)
//    }
//
//    private func setupDatePicker(date: Date?) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        if let date = date {
//            dateTextField.text = formatter.string(from: date)
//        } else {
//            dateTextField.text = formatter.string(from: datePicker.date)
//        }
//    }
    
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
//        nameTextField.snp.makeConstraints { make in
//            make.height.equalTo(44.0)
//            make.top.equalTo(nameLabel.snp.bottom).offset(6.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        lastNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(nameTextField.snp.bottom).offset(24.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        lastNameTextField.snp.makeConstraints { make in
//            make.height.equalTo(44.0)
//            make.top.equalTo(lastNameLabel.snp.bottom).offset(6.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        warningLabel.snp.makeConstraints { make in
//            make.top.equalTo(lastNameTextField.snp.bottom).offset(6.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        genderLabel.snp.makeConstraints { make in
//            make.top.equalTo(heading.snp.bottom).offset(30.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        genderSegmentedControl.snp.makeConstraints { make in
//            make.height.equalTo(40.0)
//            make.top.equalTo(genderLabel.snp.bottom).offset(16.0)
//            make.left.right.equalToSuperview().inset(30.0)
//        }
//        dateOfBirthLabel.snp.makeConstraints { make in
//            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(24.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
//        dateTextField.snp.makeConstraints { make in
//            make.height.equalTo(40.0)
//            make.top.equalTo(dateOfBirthLabel.snp.bottom).offset(9.0)
//            make.left.right.equalToSuperview().inset(16.0)
//        }
    }
}
