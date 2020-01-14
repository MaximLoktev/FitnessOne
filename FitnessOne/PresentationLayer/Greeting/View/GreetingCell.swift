//
//  GreetingCell.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import SnapKit
import UIKit

class GreetingCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9831817746, green: 0.6092354655, blue: 0.4419304729, alpha: 1)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = .clear
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(item: Greeting) {
        titleLabel.text = item.title
        backgroundImage.image = UIImage(named: item.image)
        descriptionLabel.text = item.description
    }
    
    // MARK: - Layout
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15.0)
            make.height.equalTo(30.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(30.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
    }
}
