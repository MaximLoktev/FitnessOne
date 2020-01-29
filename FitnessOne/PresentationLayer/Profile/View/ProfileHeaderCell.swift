//
//  ProfileHeaderCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

internal class ProfileHeaderCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let imageInputView = InputView()
    
    private let imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        
        return image
    }()
    
    // MARK: - Init
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(imageInputView)
        imageInputView.addSubview(imageCell)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(image: UIImage?) {
        imageCell.image = image
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        imageInputView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.0)
            make.height.equalTo(imageInputView.snp.width)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
        }
        imageCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

