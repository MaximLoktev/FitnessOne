//
//  ProfileCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 25/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

internal class ProfileSpecificationCell: UITableViewCell {
    
    // MARK: - Properties
    
     private let imageCell: UIImageView = {
         let image = UIImageView()
         image.contentMode = .scaleAspectFit
         
         return image
     }()
    
    // MARK: - Init
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(imageCell)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(title: String) {
        
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        imageCell.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
    }
}
