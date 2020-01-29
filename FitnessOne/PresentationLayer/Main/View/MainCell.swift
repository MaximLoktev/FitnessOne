//
//  MainCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 18/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

internal class MainCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let mainInputView = InputView()
 
    private let imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTSerif-Regular", size: 15.0)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.8702445984, green: 0.5425629822, blue: 0.4017455572, alpha: 1)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(mainInputView)
        mainInputView.addSubview(imageCell)
        mainInputView.addSubview(titleLabel)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(item: Menu) {
        titleLabel.text = item.name
        imageCell.image = UIImage(named: item.image)
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        mainInputView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8.0)
        }
        imageCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.0)
            make.bottom.equalTo(titleLabel.snp.top).offset(-14.0)
            make.left.right.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12.0)
            make.left.right.equalToSuperview()
        }
    }

}


