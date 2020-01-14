//
//  MainView.swift
//  FitnessOne
//
//  Created by Максим Локтев on 28/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit
import SnapKit

internal protocol MainViewDelegate: class {
    func viewDidTapNextButton(_ view: MainView)
}

internal class MainView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MainViewDelegate?
    
    private let headingHome: UILabel = {
        let label = UILabel()
        label.text = "Дом"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 30.0)
        label.textAlignment = .center

        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 22.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 22.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.layer.cornerRadius = 30
        
        return image
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        addSubview(headingHome)
        addSubview(nameLabel)
        addSubview(lastNameLabel)
        addSubview(genderLabel)
        addSubview(birthdayLabel)
        addSubview(weightLabel)
        addSubview(heightLabel)
        addSubview(skillLabel)
        addSubview(photoImageView)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions

    func setupLoad(user: UserModel?) {
        
        guard let user = user else {
            return
        }
        
        nameLabel.text = user.name
        lastNameLabel.text = user.lastName
        genderLabel.text = user.gender.rawValue
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthdayLabel.text = formatter.string(from: user.birthday)
        
        photoImageView.image = UIImage(data: user.photo)
        weightLabel.text = "\(user.weight)"
        heightLabel.text = "\(user.height)"
        skillLabel.text = user.skill.rawValue
        
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        headingHome.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(headingHome.snp.bottom).offset(30.0)
            make.left.equalToSuperview().inset(16.0)
        }
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        birthdayLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        skillLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(10.0)
            make.left.equalToSuperview().inset(16.0)
        }
        photoImageView.snp.makeConstraints { make in
            make.height.equalTo(160.0)
            make.width.equalTo(150.0)
            make.top.equalTo(headingHome.snp.bottom).offset(24.0)
            make.right.equalToSuperview().inset(30.0)
        }
    }
}

