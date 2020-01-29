//
//  ProfileSpecificationCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

internal class ProfileSpecificationCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTSerif-Regular", size: 17.0)
        label.textAlignment = .left
        label.textColor = UIColor.gray.withAlphaComponent(1.0)
        label.backgroundColor = .clear

        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTSerif-Regular", size: 17.0)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.backgroundColor = .clear

        return label
    }()
    
    // MARK: - Init
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(titleLable)
        addSubview(descriptionLabel)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(title: String, description: String) {
        titleLable.text = title
        descriptionLabel.text = description
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        titleLable.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24.0)
            make.centerY.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24.0)
            make.left.equalTo(titleLable.snp.right)
            make.centerY.equalToSuperview()
        }
    }
}
