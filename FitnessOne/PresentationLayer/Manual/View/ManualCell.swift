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
        label.font = .systemFont(ofSize: 24.0)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear

        return label
    }()
    
    // MARK: - Init
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(cellLabel)
        
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
        cellLabel.snp.makeConstraints { mask in
            mask.left.right.equalToSuperview().inset(16.0)
            mask.top.equalToSuperview().offset(10.0)
        }
    }
}
