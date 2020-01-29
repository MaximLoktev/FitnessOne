//
//  ManualCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 19/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

internal class ManualCell: UITableViewCell {
    
    // MARK: - Properties
    
     let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTSerif-Regular", size: 17.0)
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .clear

        return label
    }()
    
    private let imageCell: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fast-forward")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.gray.withAlphaComponent(0.5)
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    // MARK: - Init
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(cellLabel)
        addSubview(imageCell)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(title: String) {
        cellLabel.text = title
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        cellLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
        imageCell.snp.makeConstraints { make in
            make.height.width.equalTo(16.0)
            make.right.equalToSuperview().offset(-16.0)
            make.centerY.equalToSuperview()
        }
    }
}
